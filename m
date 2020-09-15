Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC5D26A485
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 14:00:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrMHC0y5JzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 22:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eu/Ud9En; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrMFT411hzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:58:37 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id q4so1647369pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oxKVsUI1BMqWP7ng2Qhk7NiDug3OH9is0n1vTIr7fM=;
 b=eu/Ud9EnRbUUrcsCwvAd8J5J5D5A0Jz0eZNxsHKlgqO+vAvInLDsJmgGtFH/Rck4Kp
 WZ1vQqVIeu7M+RWjBjpalVAhYOM0XL95EFDosWjsLW++xy/gMXHe2QVpYKVJbJFkq+cE
 zgo4KrpKlpLBVsmPhPCDlhXKgzmhOFvWO+yTQnouuw0+/0fREQ55KdlbWF4VThmLMGDx
 +GXy++E4fiBoracpqb8emLpBg171jL5LtEjwEZxeurv+1h5rGW+3uq9xikeHNTSfizs1
 wLxxuK7UIoAKWoQudiPMoS5V33NiFwXODTRtebkBwKlQocw7adCb3rH11EigurPYsTl+
 E1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oxKVsUI1BMqWP7ng2Qhk7NiDug3OH9is0n1vTIr7fM=;
 b=crNwY7CU/eUYKqBIMPlhokjE1sYBUPUvHFSON21EO+0BAq3Nwj4kMEA3FrjUiPCRuf
 hsnXB1gmO/ZVzZnL0gUVSbbGfMJYYXsMCrqCqwoX5L3vvD8/pGd5jcVJluN5iu0jDf9O
 5uuETASxsoS4kneLRWVUpB/EY/n7c+/hqWTG6swHBvWdUfgEUUKKzjQAR96HseaRt2Iy
 VSDWyiTOgJz5Dy1LgXLfiBhM3e7ls63i0N9fUG4ZG/nH7rh1K7ireFDJPAEIk6Bz1avB
 Cdb/NjdNnAjAwC+tl34NUH/N+6LYvsJMDQw6VQn8waYFMz9p/uu7C3D9AhO87xpTr0Mi
 t3Aw==
X-Gm-Message-State: AOAM532sRsZ+4/ra4EOKIywRVCReV4u7vCNU88rKrU1L3+6XCf79RW0S
 5IJ5BaeydfL8gMp6LGVT8zaQG5OBSi7AAQ==
X-Google-Smtp-Source: ABdhPJzVBdWs6BDWjFnLZVmyzz+VNGoMx5+HsJeMldYco+qeiWhSkXPa151nXjns2bQYT1QT8v4YAA==
X-Received: by 2002:a17:90b:164e:: with SMTP id
 il14mr3636257pjb.5.1600171113309; 
 Tue, 15 Sep 2020 04:58:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id 124sm13607867pfd.132.2020.09.15.04.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:58:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: move the last of the page fault handling logic
 to C
Date: Tue, 15 Sep 2020 21:58:23 +1000
Message-Id: <20200915115823.3980744-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The page fault handling still has some complex logic particularly around
hash table handling, in asm. Implement this in C instead.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |   1 +
 arch/powerpc/kernel/exceptions-64s.S  | 131 +++++---------------------
 arch/powerpc/mm/book3s64/hash_utils.c |  77 +++++++++------
 arch/powerpc/mm/fault.c               |  55 ++++++++++-
 4 files changed, 124 insertions(+), 140 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 338f36cd9934..d714d83bbc7c 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,6 +112,7 @@
 
 struct pt_regs;
 extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
+extern int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f7d748b88705..f830b893fe03 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1403,14 +1403,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
  *
  * Handling:
  * - Hash MMU
- *   Go to do_hash_page first to see if the HPT can be filled from an entry in
- *   the Linux page table. Hash faults can hit in kernel mode in a fairly
+ *   Go to do_hash_fault, which attempts to fill the HPT from an entry in the
+ *   Linux page table. Hash faults can hit in kernel mode in a fairly
  *   arbitrary state (e.g., interrupts disabled, locks held) when accessing
  *   "non-bolted" regions, e.g., vmalloc space. However these should always be
- *   backed by Linux page tables.
+ *   backed by Linux page table entries.
  *
- *   If none is found, do a Linux page fault. Linux page faults can happen in
- *   kernel mode due to user copy operations of course.
+ *   If no entry is found the Linux page fault handler is invoked (by
+ *   do_hash_fault). Linux page faults can happen in kernel mode due to user
+ *   copy operations of course.
  *
  * - Radix MMU
  *   The hardware loads from the Linux page table directly, so a fault goes
@@ -1438,13 +1439,17 @@ EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld	r6,_MSR(r1)
-	li	r3,0x300
-	b	do_hash_page		/* Try to handle as hpte fault */
+	bl	do_hash_fault
 MMU_FTR_SECTION_ELSE
-	b	handle_page_fault
+	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+        cmpdi	r3,0
+	beq+	interrupt_return
+	/* We need to restore NVGPRS */
+	REST_NVGPRS(r1)
+	b       interrupt_return
 
 	GEN_KVM data_access
 
@@ -1539,13 +1544,17 @@ EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld      r6,_MSR(r1)
-	li	r3,0x400
-	b	do_hash_page		/* Try to handle as hpte fault */
+	bl	do_hash_fault
 MMU_FTR_SECTION_ELSE
-	b	handle_page_fault
+	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+        cmpdi	r3,0
+	beq+	interrupt_return
+	/* We need to restore NVGPRS */
+	REST_NVGPRS(r1)
+	b       interrupt_return
 
 	GEN_KVM instruction_access
 
@@ -3197,99 +3206,3 @@ disable_machine_check:
 	RFI_TO_KERNEL
 1:	mtlr	r0
 	blr
-
-/*
- * Hash table stuff
- */
-	.balign	IFETCH_ALIGN_BYTES
-do_hash_page:
-#ifdef CONFIG_PPC_BOOK3S_64
-	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
-	ori	r0,r0,DSISR_BAD_FAULT_64S@l
-	and.	r0,r5,r0		/* weird error? */
-	bne-	handle_page_fault	/* if not, try to insert a HPTE */
-
-	/*
-	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
-	 * don't call hash_page, just fail the fault. This is required to
-	 * prevent re-entrancy problems in the hash code, namely perf
-	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
-	 * hash fault. See the comment in hash_preload().
-	 */
-	ld	r11, PACA_THREAD_INFO(r13)
-	lwz	r0,TI_PREEMPT(r11)
-	andis.	r0,r0,NMI_MASK@h
-	bne	77f
-
-	/*
-	 * r3 contains the trap number
-	 * r4 contains the faulting address
-	 * r5 contains dsisr
-	 * r6 msr
-	 *
-	 * at return r3 = 0 for success, 1 for page fault, negative for error
-	 */
-	bl	__hash_page		/* build HPTE if possible */
-        cmpdi	r3,0			/* see if __hash_page succeeded */
-
-	/* Success */
-	beq	interrupt_return	/* Return from exception on success */
-
-	/* Error */
-	blt-	13f
-
-	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
-	ld	r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
-/* Here we have a page fault that hash_page can't handle. */
-handle_page_fault:
-11:	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_page_fault
-	cmpdi	r3,0
-	beq+	interrupt_return
-	mr	r5,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
-	bl	bad_page_fault
-	b	interrupt_return
-
-/* We have a data breakpoint exception - handle it */
-handle_dabr_fault:
-	ld      r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      do_break
-	/*
-	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values.
-	 */
-	REST_NVGPRS(r1)
-	b       interrupt_return
-
-
-#ifdef CONFIG_PPC_BOOK3S_64
-/* We have a page fault that hash_page could handle but HV refused
- * the PTE insertion
- */
-13:	mr	r5,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
-	bl	low_hash_fault
-	b	interrupt_return
-#endif
-
-/*
- * We come here as a result of a DSI at a point where we don't want
- * to call hash_page, such as when we are accessing memory (possibly
- * user memory) inside a PMU interrupt that occurred while interrupts
- * were soft-disabled.  We want to invoke the exception handler for
- * the access, or panic if there isn't a handler.
- */
-77:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	li	r5,SIGSEGV
-	bl	bad_page_fault
-	b	interrupt_return
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1da9dbba9217..fd7b6bb7030d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1500,16 +1500,40 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-int __hash_page(unsigned long trap, unsigned long ea, unsigned long dsisr,
-		unsigned long msr)
+int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
 {
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
 	unsigned long flags = 0;
-	struct mm_struct *mm = current->mm;
-	unsigned int region_id = get_region_id(ea);
+	struct mm_struct *mm;
+	unsigned int region_id;
+	int err;
+
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
+		goto _do_page_fault;
+
+	/*
+	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
+	 * don't call hash_page, just fail the fault. This is required to
+	 * prevent re-entrancy problems in the hash code, namely perf
+	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
+	 * hash fault. See the comment in hash_preload().
+	 *
+	 * We come here as a result of a DSI at a point where we don't want
+	 * to call hash_page, such as when we are accessing memory (possibly
+	 * user memory) inside a PMU interrupt that occurred while interrupts
+	 * were soft-disabled.  We want to invoke the exception handler for
+	 * the access, or panic if there isn't a handler.
+	 */
+	if (unlikely(in_nmi())) {
+		bad_page_fault(regs, ea, SIGSEGV);
+		return 0;
+	}
 
+	region_id = get_region_id(ea);
 	if ((region_id == VMALLOC_REGION_ID) || (region_id == IO_REGION_ID))
 		mm = &init_mm;
+	else
+		mm = current->mm;
 
 	if (dsisr & DSISR_NOHPTE)
 		flags |= HPTE_NOHPTE_UPDATE;
@@ -1525,13 +1549,31 @@ int __hash_page(unsigned long trap, unsigned long ea, unsigned long dsisr,
 	 * 2) user space access kernel space.
 	 */
 	access |= _PAGE_PRIVILEGED;
-	if ((msr & MSR_PR) || (region_id == USER_REGION_ID))
+	if (user_mode(regs) || (region_id == USER_REGION_ID))
 		access &= ~_PAGE_PRIVILEGED;
 
-	if (trap == 0x400)
+	if (regs->trap == 0x400)
 		access |= _PAGE_EXEC;
 
-	return hash_page_mm(mm, ea, access, trap, flags);
+	err = hash_page_mm(mm, ea, access, regs->trap, flags);
+	if (unlikely(err < 0)) {
+		// failed to instert a hash PTE due to an hypervisor error
+		if (user_mode(regs)) {
+			if (IS_ENABLED(CONFIG_PPC_SUBPAGE_PROT) && err == -2)
+				_exception(SIGSEGV, regs, SEGV_ACCERR, ea);
+			else
+				_exception(SIGBUS, regs, BUS_ADRERR, ea);
+		} else {
+			bad_page_fault(regs, ea, SIGBUS);
+		}
+		err = 0;
+
+	} else if (err) {
+_do_page_fault:
+		err = hash__do_page_fault(regs, ea, dsisr);
+	}
+
+	return err;
 }
 
 #ifdef CONFIG_PPC_MM_SLICES
@@ -1831,27 +1873,6 @@ void flush_hash_range(unsigned long number, int local)
 	}
 }
 
-/*
- * low_hash_fault is called when we the low level hash code failed
- * to instert a PTE due to an hypervisor error
- */
-void low_hash_fault(struct pt_regs *regs, unsigned long address, int rc)
-{
-	enum ctx_state prev_state = exception_enter();
-
-	if (user_mode(regs)) {
-#ifdef CONFIG_PPC_SUBPAGE_PROT
-		if (rc == -2)
-			_exception(SIGSEGV, regs, SEGV_ACCERR, address);
-		else
-#endif
-			_exception(SIGBUS, regs, BUS_ADRERR, address);
-	} else
-		bad_page_fault(regs, address, SIGBUS);
-
-	exception_exit(prev_state);
-}
-
 long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 			   unsigned long pa, unsigned long rflags,
 			   unsigned long vflags, int psize, int ssize)
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0add963a849b..ce43e401e0e0 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -405,7 +405,10 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
 
-	if (unlikely(page_fault_is_bad(error_code))) {
+	if (unlikely(page_fault_is_bad(error_code) || (error_code & DSISR_DABRMATCH))) {
+		if (error_code & DSISR_DABRMATCH)
+			return -1;
+
 		if (is_user) {
 			_exception(SIGBUS, regs, BUS_OBJERR, address);
 			return 0;
@@ -548,12 +551,58 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 		  unsigned long error_code)
 {
 	enum ctx_state prev_state = exception_enter();
-	int rc = __do_page_fault(regs, address, error_code);
+	int err;
+
+	err = __do_page_fault(regs, address, error_code);
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* 32 and 64e handle errors in their asm code */
+	if (unlikely(err)) {
+		if (err > 0) {
+			bad_page_fault(regs, address, err);
+			err = 0;
+		} else {
+			/*
+			 * do_break() may change NV GPRS while handling the
+			 * breakpoint. Return -ve to caller to do that.
+			 */
+			do_break(regs, address, error_code);
+		}
+	}
+#endif
+
 	exception_exit(prev_state);
-	return rc;
+
+	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
+int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
+		  unsigned long error_code)
+{
+	int err;
+
+	err = __do_page_fault(regs, address, error_code);
+	if (unlikely(err)) {
+		if (err > 0) {
+			bad_page_fault(regs, address, err);
+			err = 0;
+		} else {
+			/*
+			 * do_break() may change NV GPRS while handling the
+			 * breakpoint. Return -ve to caller to do that.
+			 */
+			do_break(regs, address, error_code);
+		}
+	}
+
+	return err;
+}
+NOKPROBE_SYMBOL(hash__do_page_fault);
+#endif
+
 /*
  * bad_page_fault is called when we have a bad access from the kernel.
  * It is called from the DSI and ISI handlers in head.S and from some
-- 
2.23.0

