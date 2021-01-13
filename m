Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBFB2F4563
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:41:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFzrp2X8SzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:40:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=efhGp50/; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzg33sMPzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:31 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id b8so598499plx.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3hx/chZJiDBPTvq5olQkKOg8iMH/vIGgits7z7Ax2U=;
 b=efhGp50/q6pwWDcUUjHJr7pHc3skKe28r3gPNjupoVJ+/Zs5rQ/LhLRYVjhDQ3Tg+P
 S2oelLuU00oYJzPKDvPP0ZLkc4smqsZ84CR2XAo9aXQ8lo+mBerUGKpjJTjyNTi3/PRq
 tgMPl6Bq5z9WQYQ3+tSci98JFUiHZ+iljahafEPfbigY6bP5cXlIAOvHvSO6J4KYzznJ
 uLdyM7azzLA3upeACS0SRRjfpUfUh73jHj15w5W97G/kbu+8iIA1tO5abZ+5p53YaJwg
 g2qP8UhtWONne1/gRXDNwGu6AfsxtDYf5+JsFR2C5Fr0jbtG7NuAsipCdWIJ4pdodGqG
 jJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3hx/chZJiDBPTvq5olQkKOg8iMH/vIGgits7z7Ax2U=;
 b=M0uBHSYmG7O83r4OoVNctGZCh7bGJk3vt6D2kiQpGqNelpSvAwEK9dYGoiR52uIVj7
 XNMaXI4Vx0k99zQnCvIvDqzpbstbTg2UUXvhKJXAuRR9gjH/OTqo8FNqHRhVSUoquQvz
 vvQtS0m3Sh8SEnVFMrceEzLYfPev77cX2Aq7H5vCxL4m0CtHhJQA0aPTEb67tkFZmiqg
 Q4HErqmCyc4PNfWd1B28P7rVPQ8fXaY03IX3GN8OCl0n06oORIsblri0Kdokl35A7ekL
 BTCZRZCF2l12QPlPKufWAP85BdDEKit1AB3MuTkrLOlSkaD2/vENR6hz+JNxDP9NdcYK
 nkkw==
X-Gm-Message-State: AOAM530xwc+RVMw8AHQbqYSI0CJDbfHzAzvpwhGJARhckvidKlgfJNrU
 /DOnKjObdqH1Q6DsuMMsTBpDrQDEHck=
X-Google-Smtp-Source: ABdhPJxdhC1iOSu6Je7f0l9E/iXG2ef2eZAhMLbYF7DLQVp4nkFsUx5ITn+LKXs3oE70D2Wnsj453A==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id
 c8-20020a170902b688b02900dc240a2bd7mr1064729pls.50.1610523148329; 
 Tue, 12 Jan 2021 23:32:28 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
Date: Wed, 13 Jan 2021 17:31:56 +1000
Message-Id: <20210113073215.516986-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/kernel/exceptions-64s.S          | 131 +++---------------
 arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
 arch/powerpc/mm/fault.c                       |  46 ++++--
 4 files changed, 107 insertions(+), 148 deletions(-)

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
index 6e53f7638737..bcb5e81d2088 100644
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
@@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
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
 
@@ -1540,13 +1545,17 @@ EXC_COMMON_BEGIN(instruction_access_common)
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
 
@@ -3221,99 +3230,3 @@ disable_machine_check:
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
-	bl	__bad_page_fault
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
index 73b06adb6eeb..5a61182ddf75 100644
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
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
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
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8961b44f350c..77a3155c77b6 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -369,7 +369,9 @@ static void sanity_check_fault(bool is_write, bool is_user,
 #define page_fault_is_bad(__err)	(0)
 #elif defined(CONFIG_PPC_8xx)
 #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
-#elif defined(CONFIG_PPC64)
+#elif defined(CONFIG_PPC_BOOK3S_64)
+#define page_fault_is_bad(__err)	((__err) & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH))
+#elif defined(CONFIG_PPC_BOOK3E_64)
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
 #else
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
@@ -404,6 +406,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return 0;
 
 	if (unlikely(page_fault_is_bad(error_code))) {
+		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (error_code & DSISR_DABRMATCH))
+			return -1;
+
 		if (is_user) {
 			_exception(SIGBUS, regs, BUS_OBJERR, address);
 			return 0;
@@ -545,20 +550,39 @@ NOKPROBE_SYMBOL(__do_page_fault);
 int do_page_fault(struct pt_regs *regs, unsigned long address,
 		  unsigned long error_code)
 {
-	const struct exception_table_entry *entry;
 	enum ctx_state prev_state = exception_enter();
-	int rc = __do_page_fault(regs, address, error_code);
-	exception_exit(prev_state);
-	if (likely(!rc))
-		return 0;
+	int err;
 
-	entry = search_exception_tables(regs->nip);
-	if (unlikely(!entry))
-		return rc;
+	err = __do_page_fault(regs, address, error_code);
+	if (unlikely(err)) {
+		const struct exception_table_entry *entry;
 
-	instruction_pointer_set(regs, extable_fixup(entry));
+		entry = search_exception_tables(regs->nip);
+		if (likely(entry)) {
+			instruction_pointer_set(regs, extable_fixup(entry));
+			err = 0;
+		}
+	}
 
-	return 0;
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* 32 and 64e handle these errors in asm */
+	if (unlikely(err)) {
+		if (err > 0) {
+			__bad_page_fault(regs, address, err);
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
+	exception_exit(prev_state);
+
+	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
-- 
2.23.0

