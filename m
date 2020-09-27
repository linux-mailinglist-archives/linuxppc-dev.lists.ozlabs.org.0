Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F89927A04E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:39:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgbH4z7CzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4x1R83zDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4n3J1Tz9vCy1;
 Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S5wKCQivAxjl; Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4n2Y4gz9vCxw;
 Sun, 27 Sep 2020 11:16:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E16F18B771;
 Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uJtS9cmQON2W; Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B7E18B75B;
 Sun, 27 Sep 2020 11:16:29 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7174E65DE8; Sun, 27 Sep 2020 09:16:29 +0000 (UTC)
Message-Id: <8e6cefe474aa4ceba028abb729485cd46c140990.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 12/30] powerpc/vdso: Replace vdso_base by vdso
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:29 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All other architectures but s390 use a void pointer named 'vdso'
to reference the VDSO mapping.

In a following patch, the VDSO data page will be put in front of
text, vdso_base will then not anymore point to VDSO text.

To avoid confusion between vdso_base and VDSO text, rename vdso_base
into vdso and make it a void __user *.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      | 2 +-
 arch/powerpc/include/asm/elf.h                | 2 +-
 arch/powerpc/include/asm/mmu_context.h        | 6 ++++--
 arch/powerpc/include/asm/nohash/32/mmu-40x.h  | 2 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h  | 2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  | 2 +-
 arch/powerpc/include/asm/nohash/mmu-book3e.h  | 2 +-
 arch/powerpc/kernel/signal_32.c               | 8 ++++----
 arch/powerpc/kernel/signal_64.c               | 4 ++--
 arch/powerpc/kernel/vdso.c                    | 8 ++++----
 arch/powerpc/perf/callchain_32.c              | 8 ++++----
 arch/powerpc/perf/callchain_64.c              | 4 ++--
 13 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index 2e277ca0170f..331187661236 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -90,7 +90,7 @@ struct hash_pte {
 
 typedef struct {
 	unsigned long id;
-	unsigned long vdso_base;
+	void __user *vdso;
 } mm_context_t;
 
 void update_bats(void);
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index ddc414ab3c4d..fc6cb6a712c7 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -111,7 +111,7 @@ typedef struct {
 
 	struct hash_mm_context *hash_context;
 
-	unsigned long vdso_base;
+	void __user *vdso;
 	/*
 	 * pagetable fragment support
 	 */
diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index 53ed2ca40151..4ecc372c408e 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -169,7 +169,7 @@ do {									\
 	NEW_AUX_ENT(AT_DCACHEBSIZE, dcache_bsize);			\
 	NEW_AUX_ENT(AT_ICACHEBSIZE, icache_bsize);			\
 	NEW_AUX_ENT(AT_UCACHEBSIZE, ucache_bsize);			\
-	VDSO_AUX_ENT(AT_SYSINFO_EHDR, current->mm->context.vdso_base);	\
+	VDSO_AUX_ENT(AT_SYSINFO_EHDR, (unsigned long)current->mm->context.vdso);\
 	ARCH_DLINFO_CACHE_GEOMETRY;					\
 } while (0)
 
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index e02aa793420b..d54358cb5be1 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -262,8 +262,10 @@ extern void arch_exit_mmap(struct mm_struct *mm);
 static inline void arch_unmap(struct mm_struct *mm,
 			      unsigned long start, unsigned long end)
 {
-	if (start <= mm->context.vdso_base && mm->context.vdso_base < end)
-		mm->context.vdso_base = 0;
+	unsigned long vdso_base = (unsigned long)mm->context.vdso;
+
+	if (start <= vdso_base && vdso_base < end)
+		mm->context.vdso = NULL;
 }
 
 #ifdef CONFIG_PPC_MEM_KEYS
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-40x.h b/arch/powerpc/include/asm/nohash/32/mmu-40x.h
index 74f4edb5916e..8a8f13a22cf4 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-40x.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-40x.h
@@ -57,7 +57,7 @@
 typedef struct {
 	unsigned int	id;
 	unsigned int	active;
-	unsigned long	vdso_base;
+	void __user	*vdso;
 } mm_context_t;
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-44x.h b/arch/powerpc/include/asm/nohash/32/mmu-44x.h
index 28aa3b339c5e..2d92a39d8f2e 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-44x.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-44x.h
@@ -108,7 +108,7 @@ extern unsigned int tlb_44x_index;
 typedef struct {
 	unsigned int	id;
 	unsigned int	active;
-	unsigned long	vdso_base;
+	void __user	*vdso;
 } mm_context_t;
 
 /* patch sites */
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 1d9ac0f9c794..f0bd7f20c1e3 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -198,7 +198,7 @@ void mmu_pin_tlb(unsigned long top, bool readonly);
 typedef struct {
 	unsigned int id;
 	unsigned int active;
-	unsigned long vdso_base;
+	void __user *vdso;
 	void *pte_frag;
 } mm_context_t;
 
diff --git a/arch/powerpc/include/asm/nohash/mmu-book3e.h b/arch/powerpc/include/asm/nohash/mmu-book3e.h
index b41004664312..e43a418d3ccd 100644
--- a/arch/powerpc/include/asm/nohash/mmu-book3e.h
+++ b/arch/powerpc/include/asm/nohash/mmu-book3e.h
@@ -238,7 +238,7 @@ extern unsigned int tlbcam_index;
 typedef struct {
 	unsigned int	id;
 	unsigned int	active;
-	unsigned long	vdso_base;
+	void __user	*vdso;
 } mm_context_t;
 
 /* Page size definitions, common between 32 and 64-bit
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 96950f189b5a..4dcc5e2659ce 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -785,9 +785,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	/* Save user registers on the stack */
 	frame = &rt_sf->uc.uc_mcontext;
 	addr = frame;
-	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
+	if (vdso32_rt_sigtramp && tsk->mm->context.vdso) {
 		sigret = 0;
-		tramp = tsk->mm->context.vdso_base + vdso32_rt_sigtramp;
+		tramp = (unsigned long)tsk->mm->context.vdso + vdso32_rt_sigtramp;
 	} else {
 		sigret = __NR_rt_sigreturn;
 		tramp = (unsigned long) frame->tramp;
@@ -1247,9 +1247,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	    || __put_user(ksig->sig, &sc->signal))
 		goto badframe;
 
-	if (vdso32_sigtramp && tsk->mm->context.vdso_base) {
+	if (vdso32_sigtramp && tsk->mm->context.vdso) {
 		sigret = 0;
-		tramp = tsk->mm->context.vdso_base + vdso32_sigtramp;
+		tramp = (unsigned long)tsk->mm->context.vdso + vdso32_sigtramp;
 	} else {
 		sigret = __NR_sigreturn;
 		tramp = (unsigned long) frame->mctx.tramp;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index bfc939360bad..80ad09c8bc14 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -864,8 +864,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	tsk->thread.fp_state.fpscr = 0;
 
 	/* Set up to return from userspace. */
-	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
-		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
+	if (vdso64_rt_sigtramp && tsk->mm->context.vdso) {
+		regs->nip = (unsigned long)tsk->mm->context.vdso + vdso64_rt_sigtramp;
 	} else {
 		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
 		if (err)
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 971764d5b85b..87b77b793029 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -123,7 +123,7 @@ static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struc
 	if (new_size != text_size + PAGE_SIZE)
 		return -EINVAL;
 
-	current->mm->context.vdso_base = new_vma->vm_start;
+	current->mm->context.vdso = (void __user *)new_vma->vm_start;
 
 	return 0;
 }
@@ -198,7 +198,7 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO.
 	 */
-	current->mm->context.vdso_base = vdso_base;
+	mm->context.vdso = (void __user *)vdso_base;
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -224,7 +224,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	struct mm_struct *mm = current->mm;
 	int rc;
 
-	mm->context.vdso_base = 0;
+	mm->context.vdso = NULL;
 
 	if (!vdso_ready)
 		return 0;
@@ -234,7 +234,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	rc = __arch_setup_additional_pages(bprm, uses_interp);
 	if (rc)
-		mm->context.vdso_base = 0;
+		mm->context.vdso = NULL;
 
 	mmap_write_unlock(mm);
 	return rc;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index 64e4013d8060..b32e94047fb9 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -59,8 +59,8 @@ static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
 {
 	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
 		return 1;
-	if (vdso32_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso32_sigtramp)
+	if (vdso32_sigtramp && current->mm->context.vdso &&
+	    nip == (unsigned long)current->mm->context.vdso + vdso32_sigtramp)
 		return 1;
 	return 0;
 }
@@ -70,8 +70,8 @@ static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
 	if (nip == fp + offsetof(struct rt_signal_frame_32,
 				 uc.uc_mcontext.mc_pad))
 		return 1;
-	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso32_rt_sigtramp)
+	if (vdso32_rt_sigtramp && current->mm->context.vdso &&
+	    nip == (unsigned long)current->mm->context.vdso + vdso32_rt_sigtramp)
 		return 1;
 	return 0;
 }
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index fed90e827f3a..c4dfe3c2702b 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -67,8 +67,8 @@ static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
 {
 	if (nip == fp + offsetof(struct signal_frame_64, tramp))
 		return 1;
-	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso64_rt_sigtramp)
+	if (vdso64_rt_sigtramp && current->mm->context.vdso &&
+	    nip == (unsigned long)current->mm->context.vdso + vdso64_rt_sigtramp)
 		return 1;
 	return 0;
 }
-- 
2.25.0

