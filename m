Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D136E618
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:35:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6j74lh9z3dkn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:35:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:111;
 helo=mout-y-111.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org
 [IPv6:2001:67c:2050:1::465:111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6ck5VMlz30B3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:18 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4FW6PX17FyzQjp6;
 Thu, 29 Apr 2021 09:21:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id yS90OHEXOS7O; Thu, 29 Apr 2021 09:21:32 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/11] powerpc: Introduce temporary mm
Date: Thu, 29 Apr 2021 02:20:52 -0500
Message-Id: <20210429072057.8870-7-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 3282917FD
X-Rspamd-UID: df5873
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

x86 supports the notion of a temporary mm which restricts access to
temporary PTEs to a single CPU. A temporary mm is useful for situations
where a CPU needs to perform sensitive operations (such as patching a
STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
said mappings to other CPUs. A side benefit is that other CPU TLBs do
not need to be flushed when the temporary mm is torn down.

Mappings in the temporary mm can be set in the userspace portion of the
address-space.

Interrupts must be disabled while the temporary mm is in use. HW
breakpoints, which may have been set by userspace as watchpoints on
addresses now within the temporary mm, are saved and disabled when
loading the temporary mm. The HW breakpoints are restored when unloading
the temporary mm. All HW breakpoints are indiscriminately disabled while
the temporary mm is in use.

With the Book3s64 Hash MMU the SLB is preloaded with entries from the
current thread_info struct during switch_slb(). This could cause a
Machine Check (MCE) due to an SLB Multihit when creating arbitrary
userspace mappings in the temporary mm later. Disable SLB preload from
the thread_info struct for any temporary mm to avoid this.

Based on x86 implementation:

commit cefa929c034e
("x86/mm: Introduce temporary mm structs")

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * Pass the prev mm instead of NULL to switch_mm_irqs_off() when
       using/unusing the temp mm as suggested by Jann Horn to keep
       the context.active counter in-sync on mm/nohash.
     * Disable SLB preload in the temporary mm when initializing the
       temp_mm struct.
     * Include asm/debug.h header to fix build issue with
       ppc44x_defconfig.
---
 arch/powerpc/include/asm/debug.h |  1 +
 arch/powerpc/kernel/process.c    |  5 +++
 arch/powerpc/lib/code-patching.c | 67 ++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 86a14736c76c3..dfd82635ea8b3 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
+void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e21..8e94cabaea3c3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -864,6 +864,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
+void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+{
+	memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
+}
+
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
 	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 2b1b3e9043ade..cbdfba8a39360 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -17,6 +17,8 @@
 #include <asm/code-patching.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
+#include <asm/mmu_context.h>
+#include <asm/debug.h>
 
 static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
 			       struct ppc_inst *patch_addr)
@@ -46,6 +48,71 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
+struct temp_mm {
+	struct mm_struct *temp;
+	struct mm_struct *prev;
+	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
+};
+
+static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
+{
+	/* Do not preload SLB entries from the thread_info struct */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
+		skip_slb_preload_mm(mm);
+
+	temp_mm->temp = mm;
+	temp_mm->prev = NULL;
+	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
+}
+
+static inline void use_temporary_mm(struct temp_mm *temp_mm)
+{
+	lockdep_assert_irqs_disabled();
+
+	temp_mm->prev = current->active_mm;
+	switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);
+
+	WARN_ON(!mm_is_thread_local(temp_mm->temp));
+
+	if (ppc_breakpoint_available()) {
+		struct arch_hw_breakpoint null_brk = {0};
+		int i = 0;
+
+		for (; i < nr_wp_slots(); ++i) {
+			__get_breakpoint(i, &temp_mm->brk[i]);
+			if (temp_mm->brk[i].type != 0)
+				__set_breakpoint(i, &null_brk);
+		}
+	}
+}
+
+static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
+{
+	lockdep_assert_irqs_disabled();
+
+	switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
+
+	/*
+	 * On book3s64 the active_cpus counter increments in
+	 * switch_mm_irqs_off(). With the Hash MMU this counter affects if TLB
+	 * flushes are local. We have to manually decrement that counter here
+	 * along with removing our current CPU from the mm's cpumask so that in
+	 * the future a different CPU can reuse the temporary mm and still rely
+	 * on local TLB flushes.
+	 */
+	dec_mm_active_cpus(temp_mm->temp);
+	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(temp_mm->temp));
+
+	if (ppc_breakpoint_available()) {
+		int i = 0;
+
+		for (; i < nr_wp_slots(); ++i)
+			if (temp_mm->brk[i].type != 0)
+				__set_breakpoint(i, &temp_mm->brk[i]);
+	}
+}
+
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 #if IS_BUILTIN(CONFIG_LKDTM)
-- 
2.26.1

