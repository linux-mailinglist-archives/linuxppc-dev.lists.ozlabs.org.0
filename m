Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0932F8162
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:00:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHS9Z6ZmrzDsm8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:00:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LgC7fBbp; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRy44lxYzDsj7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:36 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id x18so4988684pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8vtbR25oZdHTnCwDXdMA3aItVzwrCzfJ5bysuZ9+QU=;
 b=LgC7fBbpAXiPkmOOVmd9tyf4+qsE6dCUdM0UHyeqzhpVAz2Igf2Z7D3hr2EylvgdpI
 IueH4IZTC1717++NgUzGs8AWqkUR/okR8NwXI1QkOHbSIOF67lLrprmaQLNYK8NlI3DW
 6UJtiU4x+IyJHyl6njzT2W4QLsrGFsQ9wrN22ynSBjnILB080CuwxxvGjM65PkME8MwQ
 6avvwQXWaZMivPcUg5f1Lmcfxu3jrwENayFb+cKKdtzKIiBwlsN/ybQyPIpxwlP+YPUJ
 J2tFf34W0wI0qnegXztr9QwjvVFZouvfCisvalWQCwfe7X5L75TiK3ovETpzVRTOI4ha
 YdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8vtbR25oZdHTnCwDXdMA3aItVzwrCzfJ5bysuZ9+QU=;
 b=aIEnsi2/udm6ENg/tUFB3K3SPQazXvNVU8h/owuAyv0CcvrEwkYqvAGf+q/PEM9EXh
 LEgbnjG4nfCxon25EgdVfOBaKsh7+TIXdfzzqJa6Ob+aTmn/5x0XlNjUaRzx9ViLdbBS
 B7usuHeZIGJsPfoJw0ZEFzxMZP5FIeHXj6/MgJ3i45XETCf5O954CdivUql7hye5Z8dg
 pGW+dt6pmVQb81RSEjGx1fHnIKwHAG/hw1Pe8PioPK2eLCvEdTKdsIyT+wyDQ+32wDj8
 ddc80SGE1c+2bKglgjmN14osXmsD6IpOe04v1aTrfDgF1NiPONtnhsPB706PNQpeSrNF
 HHhA==
X-Gm-Message-State: AOAM531v1brruD/YFfAmXEL1uHbMf+4xHvJmlgQh3S7E8nCW5x1nbXD2
 G+INrlxtPlNbAga3WuUEePZnGdMgGmA=
X-Google-Smtp-Source: ABdhPJyQDsb0VCa+tgRgvekgwu7rvsJwNZpnDOod2qQW3A7C1MSlzR9AfKIlN9Y/cwV529KIOyT+3g==
X-Received: by 2002:a17:90a:a44:: with SMTP id
 o62mr11392600pjo.209.1610729432256; 
 Fri, 15 Jan 2021 08:50:32 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 04/39] powerpc/64s: move the hash fault handling logic to C
Date: Sat, 16 Jan 2021 02:49:37 +1000
Message-Id: <20210115165012.1260253-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

The fault handling still has some complex logic particularly around
hash table handling, in asm. Implement most of this in C.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/kernel/exceptions-64s.S          | 127 ++++--------------
 arch/powerpc/mm/book3s64/hash_utils.c         |  77 +++++++----
 3 files changed, 78 insertions(+), 127 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 066b1d34c7bc..60a669379aa0 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
 #define HPTE_NOHPTE_UPDATE	0x2
 #define HPTE_USE_KERNEL_KEY	0x4
 
+int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr);
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
 			  unsigned long flags, int ssize, int subpage_prot);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a6333b986a57..07aba8af99d3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
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
  *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=1 in guest
  *   MMU context, which may cause a DSI in the host, which must go to the
@@ -1439,27 +1440,29 @@ EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	andis.	r0,r5,DSISR_DABRMATCH@h
 	bne-	1f
 BEGIN_MMU_FTR_SECTION
-	ld	r6,_MSR(r1)
-	li	r3,0x300
-	b	do_hash_page		/* Try to handle as hpte fault */
+	bl	do_hash_fault
 MMU_FTR_SECTION_ELSE
-	b	handle_page_fault
+	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+	cmpdi	r3,0
+	beq+	interrupt_return
+	mr	r5,r3
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	ld	r4,_DAR(r1)
+	bl	__bad_page_fault
+	b	interrupt_return
 
-1:	/* We have a data breakpoint exception - handle it */
-	ld      r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      do_break
+1:	bl	do_break
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
 	 */
 	REST_NVGPRS(r1)
-	b       interrupt_return
+	b	interrupt_return
 
 	GEN_KVM data_access
 
@@ -1554,13 +1557,19 @@ EXC_COMMON_BEGIN(instruction_access_common)
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
+	cmpdi	r3,0
+	beq+	interrupt_return
+	mr	r5,r3
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	ld	r4,_DAR(r1)
+	bl	__bad_page_fault
+	b	interrupt_return
 
 	GEN_KVM instruction_access
 
@@ -3235,83 +3244,3 @@ disable_machine_check:
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
-	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)@h
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
-	/* Reload DAR/DSISR into r4/r5 for handle_page_fault */
-	ld	r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
-/* Here we have a page fault that hash_page can't handle. */
-handle_page_fault:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_page_fault
-	cmpdi	r3,0
-	beq+	interrupt_return
-	mr	r5,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
-	bl	__bad_page_fault
-	b	interrupt_return
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
index 73b06adb6eeb..e866cae57e2f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1512,16 +1512,40 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
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
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)))
+		goto page_fault;
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
@@ -1537,13 +1561,31 @@ int __hash_page(unsigned long trap, unsigned long ea, unsigned long dsisr,
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
+page_fault:
+		err = do_page_fault(regs, ea, dsisr);
+	}
+
+	return err;
 }
 
 #ifdef CONFIG_PPC_MM_SLICES
@@ -1843,27 +1885,6 @@ void flush_hash_range(unsigned long number, int local)
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
-- 
2.23.0

