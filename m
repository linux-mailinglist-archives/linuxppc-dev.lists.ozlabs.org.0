Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E1836E609
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6f23zZJz30BN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:209;
 helo=mout-y-209.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org
 [IPv6:2001:67c:2050:1::465:209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cZ4vvcz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:09 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4FW6Pg3f0DzQjnl;
 Thu, 29 Apr 2021 09:21:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id v834sNmQtOMS; Thu, 29 Apr 2021 09:21:40 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/11] powerpc: Protect patching_mm with a lock
Date: Thu, 29 Apr 2021 02:20:56 -0500
Message-Id: <20210429072057.8870-11-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 8DD251802
X-Rspamd-UID: 15d1c2
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc allows for multiple CPUs to patch concurrently. When patching
with STRICT_KERNEL_RWX a single patching_mm is allocated for use by all
CPUs for the few times that patching occurs. Use a spinlock to protect
the patching_mm from concurrent use.

Modify patch_instruction() to acquire the lock, perform the patch op,
and then release the lock.

Also introduce {lock,unlock}_patching() along with
patch_instruction_unlocked() to avoid per-iteration lock overhead when
patch_instruction() is called in a loop. A follow-up patch converts some
uses of patch_instruction() to use patch_instruction_unlocked() instead.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/code-patching.h |  4 ++
 arch/powerpc/lib/code-patching.c         | 85 +++++++++++++++++++++---
 2 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index e51c81e4a9bda..2efa11b68cd8f 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -28,8 +28,12 @@ int create_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
 int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
 		       unsigned long target, int flags);
 int patch_branch(struct ppc_inst *addr, unsigned long target, int flags);
+int patch_branch_unlocked(struct ppc_inst *addr, unsigned long target, int flags);
 int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+int patch_instruction_unlocked(struct ppc_inst *addr, struct ppc_inst instr);
 int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+unsigned long lock_patching(void);
+void unlock_patching(unsigned long flags);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 7e15abc09ec04..0a496bb52bbf4 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -52,13 +52,17 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 
+static DEFINE_SPINLOCK(patching_lock);
+
 struct temp_mm {
 	struct mm_struct *temp;
 	struct mm_struct *prev;
 	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
+	spinlock_t *lock; /* protect access to the temporary mm */
 };
 
-static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
+static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm,
+				spinlock_t *lock)
 {
 	/* Do not preload SLB entries from the thread_info struct */
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
@@ -66,12 +70,14 @@ static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
 
 	temp_mm->temp = mm;
 	temp_mm->prev = NULL;
+	temp_mm->lock = lock;
 	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
 }
 
 static inline void use_temporary_mm(struct temp_mm *temp_mm)
 {
 	lockdep_assert_irqs_disabled();
+	lockdep_assert_held(temp_mm->lock);
 
 	temp_mm->prev = current->active_mm;
 	switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);
@@ -93,11 +99,13 @@ static inline void use_temporary_mm(struct temp_mm *temp_mm)
 static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
 {
 	lockdep_assert_irqs_disabled();
+	lockdep_assert_held(temp_mm->lock);
 
 	switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
 
 	/*
-	 * On book3s64 the active_cpus counter increments in
+	 * The temporary mm can only be in use on a single CPU at a time due to
+	 * the temp_mm->lock. On book3s64 the active_cpus counter increments in
 	 * switch_mm_irqs_off(). With the Hash MMU this counter affects if TLB
 	 * flushes are local. We have to manually decrement that counter here
 	 * along with removing our current CPU from the mm's cpumask so that in
@@ -230,7 +238,7 @@ static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
 	pte = pte_mkdirty(pte);
 	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
 
-	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm, &patching_lock);
 	use_temporary_mm(&patch_mapping->temp_mm);
 
 	/*
@@ -258,7 +266,6 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
 	int err;
 	struct ppc_inst *patch_addr = NULL;
-	unsigned long flags;
 	struct patch_mapping patch_mapping;
 
 	/*
@@ -269,11 +276,12 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 	if (!patching_mm)
 		return raw_patch_instruction(addr, instr);
 
-	local_irq_save(flags);
+	lockdep_assert_held(&patching_lock);
+	lockdep_assert_irqs_disabled();
 
 	err = map_patch(addr, &patch_mapping);
 	if (err)
-		goto out;
+		return err;
 
 	patch_addr = (struct ppc_inst *)(patching_addr | offset_in_page(addr));
 
@@ -287,11 +295,33 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 
 	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
 
-out:
-	local_irq_restore(flags);
-
 	return err;
 }
+
+unsigned long lock_patching(void)
+{
+	unsigned long flags;
+
+	/* We don't need the lock if we're not using the patching_mm. */
+	if (!patching_mm)
+		return 0;
+
+	spin_lock_irqsave(&patching_lock, flags);
+	return flags;
+}
+
+void unlock_patching(const unsigned long flags)
+{
+	/* We never held the lock if we're not using the patching_mm. */
+	if (!patching_mm)
+		return;
+
+	lockdep_assert_held(&patching_lock);
+	lockdep_assert_irqs_disabled();
+
+	spin_unlock_irqrestore(&patching_lock, flags);
+}
+
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
 static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
@@ -299,19 +329,46 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 	return raw_patch_instruction(addr, instr);
 }
 
+unsigned long lock_patching(void)
+{
+	return 0;
+}
+
+void unlock_patching(const unsigned long flags) {}
+
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
+	int err;
+	unsigned long flags;
+
 	/* Make sure we aren't patching a freed init section */
 	if (init_mem_is_free && init_section_contains(addr, 4)) {
 		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
 		return 0;
 	}
-	return do_patch_instruction(addr, instr);
+
+	flags = lock_patching();
+	err = do_patch_instruction(addr, instr);
+	unlock_patching(flags);
+
+	return err;
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
+int patch_instruction_unlocked(struct ppc_inst *addr, struct ppc_inst instr)
+{
+	/* Make sure we aren't patching a freed init section */
+	if (init_mem_is_free && init_section_contains(addr, 4)) {
+		pr_debug("Skipping init section patching addr: 0x%p\n", addr);
+		return 0;
+	}
+
+	return do_patch_instruction(addr, instr);
+}
+NOKPROBE_SYMBOL(patch_instruction_unlocked);
+
 int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
 {
 	struct ppc_inst instr;
@@ -320,6 +377,14 @@ int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
 	return patch_instruction(addr, instr);
 }
 
+int patch_branch_unlocked(struct ppc_inst *addr, unsigned long target, int flags)
+{
+	struct ppc_inst instr;
+
+	create_branch(&instr, addr, target, flags);
+	return patch_instruction_unlocked(addr, instr);
+}
+
 bool is_offset_in_branch_range(long offset)
 {
 	/*
-- 
2.26.1

