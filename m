Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF92F466D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:25:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0ql0Hn0zDscl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:25:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tdHF55EL; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG05v4zGKzDrS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:52:18 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id y8so606221plp.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ep4ZB3IL/47YucqooXmmQfsFGXa6cE2jYEdTENxo7j4=;
 b=tdHF55ELcJ0j/VBfvGhe0HT0CcHxjUqlGLywHl26+1d92rdC3Gd58EMkeriUGxPaMw
 RC54SVLS5GJm6odMN+S6150S9vmPO3cz7ZpUtXnjO6HTmv1r8Tu/7cfRumyc2MXIMLxi
 1haVa2ameDx69Zp3sh3MROy1a+KCXQjNAY6vLkUbymwAaKRGZR4VltArKumVGniJgxPB
 ExMn3Qyr6uTxY4MlAA3rZHwzxR967lzYeBjFaVdytz726DghfHMXzhxHSfaMgmVfNeDP
 k0HUbwNK1M9bYe8luuOg66AKqDnxhGs9Ek3tTN2iVt61ShfV5QCkhipeqwduzvRiv9Cv
 Xzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ep4ZB3IL/47YucqooXmmQfsFGXa6cE2jYEdTENxo7j4=;
 b=ebBeNK8v7vvKGg12V4IOtMTTIb48pk79kLlzb8NwPSsYlJl6cNKPhKTwz0gLuMr/pi
 Hw8Fq7ppSIu3M7X56k4ADgzAH9BSHY3kEhJfYYnm7ZUMG+8yAMjcT4aJRt7FF4gwdIki
 2VPCyXUVyESdurw1gtJ8ctvqxxrGvxWRSly2plzwYVZ3VjO31/d+80SNVZJNACwwOrmf
 IFZ00ASkrjvGKOYieXDdodgLyDBJE+9IniqJe0AVduj64ErRm2sUmfMN35orPvm/Z4Zo
 9otvgjaKcFSBeOHg/4CgC2nnnHpiMoLa0DOwXkXWkY91ICXiKCpNY8Acjb2lqUOcptxg
 hKnQ==
X-Gm-Message-State: AOAM533Gh038NkKwTUnoUOheNod5Fwa32AhPi28GhPVPuR3ltqlks1rl
 abdcRc0Rb1kHMk3ykreHQRiapeKuMZA=
X-Google-Smtp-Source: ABdhPJz3e0FbGfd0ulkAiN4ngGqu84Vo/yn/8a405/MPD9Blh/VuKBSPwUi1soMnXXAZwuh/77bmHw==
X-Received: by 2002:a17:90b:50a:: with SMTP id
 r10mr951946pjz.103.1610524335073; 
 Tue, 12 Jan 2021 23:52:15 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id c205sm1439165pfc.160.2021.01.12.23.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:52:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64s: security fallback improvement
Date: Wed, 13 Jan 2021 17:52:08 +1000
Message-Id: <20210113075208.517375-1-npiggin@gmail.com>
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

The fallback sequences for L1D flushing and store forwarding barriers
require contortions with saving and reloading registers from a PACA
save area and SPRGs because they are called at nasty places when
registers are not available. The intention was to make them cover as
much kernel data as possible.

This is quite painful and non-obvious, and has caused a few difficult
bugs (recently the scv interrupt re-entrancy), and things would get
even more hairy with planned interrupt exit optimizations that can
return without disabling interrupts.

So I propose to move the fallbacks in a bit to the point where we
have the kernel stack set up and registers available, reentrancy
PACA scratch and SPRs become non-issues. This does potenitally
expose slightly more attack surface, but not a huge amount (mainly
some stack frame and paca), and firmware to implement the stateless
security ops has been available for several years now.

This patch isn't quite complete, it's missing a bit of logic about
where to enable / disable the call to the fallback functions, but
that's not too hard (if any workaround requires fallback -> make
the call, and possibly patch the workaround function to suit). But
the tricky bits seem to be working.

This goes on top of the previous series, I thought I would add some
C calls with static unlikely branches, but it turns out we still
have a few cases (like the FPU register loading) that is not amenable
to it and return directly with fast_interrupt_return, so it ends up
easier to make it all in asm for now. Longer term I might look at C
wrappers for those guys and move this to C, but for now it wasn't to
be so.

Thanks,
Nick

---
 arch/powerpc/include/asm/exception-64s.h  |  52 +++---
 arch/powerpc/include/asm/feature-fixups.h |  18 ++
 arch/powerpc/include/asm/paca.h           |   6 +-
 arch/powerpc/kernel/asm-offsets.c         |   2 +-
 arch/powerpc/kernel/entry_64.S            |  24 ++-
 arch/powerpc/kernel/exceptions-64s.S      | 177 +++++---------------
 arch/powerpc/kernel/vmlinux.lds.S         |  14 ++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |   4 +
 arch/powerpc/lib/feature-fixups.c         | 192 ++++++++++------------
 9 files changed, 212 insertions(+), 277 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index c1a8aac01cf9..9f2684488922 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -44,30 +44,21 @@
 
 #define STF_ENTRY_BARRIER_SLOT						\
 	STF_ENTRY_BARRIER_FIXUP_SECTION;				\
-	nop;								\
-	nop;								\
 	nop
 
 #define STF_EXIT_BARRIER_SLOT						\
 	STF_EXIT_BARRIER_FIXUP_SECTION;					\
-	nop;								\
-	nop;								\
-	nop;								\
-	nop;								\
-	nop;								\
 	nop
 
 #define ENTRY_FLUSH_SLOT						\
 	ENTRY_FLUSH_FIXUP_SECTION;					\
 	nop;								\
-	nop;								\
-	nop;
+	nop
 
 #define SCV_ENTRY_FLUSH_SLOT						\
 	SCV_ENTRY_FLUSH_FIXUP_SECTION;					\
 	nop;								\
-	nop;								\
-	nop;
+	nop
 
 /*
  * r10 must be free to use, r13 must be paca
@@ -100,7 +91,6 @@
 #define RFI_FLUSH_SLOT							\
 	RFI_FLUSH_FIXUP_SECTION;					\
 	nop;								\
-	nop;								\
 	nop
 
 #define RFI_TO_KERNEL							\
@@ -109,20 +99,17 @@
 #define RFI_TO_USER							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	rfid;								\
-	b	rfi_flush_fallback
+	rfid
 
 #define RFI_TO_USER_OR_KERNEL						\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	rfid;								\
-	b	rfi_flush_fallback
+	rfid
 
 #define RFI_TO_GUEST							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	rfid;								\
-	b	rfi_flush_fallback
+	rfid
 
 #define HRFI_TO_KERNEL							\
 	hrfid
@@ -130,35 +117,44 @@
 #define HRFI_TO_USER							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	hrfid;								\
-	b	hrfi_flush_fallback
+	hrfid
 
 #define HRFI_TO_USER_OR_KERNEL						\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	hrfid;								\
-	b	hrfi_flush_fallback
+	hrfid
 
 #define HRFI_TO_GUEST							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	hrfid;								\
-	b	hrfi_flush_fallback
+	hrfid
 
 #define HRFI_TO_UNKNOWN							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	hrfid;								\
-	b	hrfi_flush_fallback
+	hrfid
 
 #define RFSCV_TO_USER							\
 	STF_EXIT_BARRIER_SLOT;						\
 	RFI_FLUSH_SLOT;							\
-	RFSCV;								\
-	b	rfscv_flush_fallback
+	RFSCV
+
+#define ENTER_KERNEL_SECURITY_FALLBACK					\
+	ENTER_SECURITY_FALLBACK_SECTION;				\
+	nop
+
+#define EXIT_KERNEL_SECURITY_FALLBACK					\
+	EXIT_SECURITY_FALLBACK_SECTION;					\
+	nop
+
+#define ENTER_GUEST_SECURITY_FALLBACK					\
+	EXIT_SECURITY_FALLBACK_SECTION;					\
+	nop
 
 #else /* __ASSEMBLY__ */
 /* Prototype for function defined in exceptions-64s.S */
+void exit_security_fallback(void);
+void enter_security_fallback(void);
 void do_uaccess_flush(void);
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index ac605fc369c4..4b5fab33688a 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -256,6 +256,22 @@ label##3:					       	\
 	FTR_ENTRY_OFFSET 951b-952b;			\
 	.popsection;
 
+#define ENTER_SECURITY_FALLBACK_SECTION			\
+958:							\
+	.pushsection __enter_security_fallback_fixup,"a"; \
+	.align 2;					\
+959:							\
+	FTR_ENTRY_OFFSET 958b-959b;			\
+	.popsection;
+
+#define EXIT_SECURITY_FALLBACK_SECTION			\
+960:							\
+	.pushsection __exit_security_fallback_fixup,"a"; \
+	.align 2;					\
+961:							\
+	FTR_ENTRY_OFFSET 960b-961b;			\
+	.popsection;
+
 #define NOSPEC_BARRIER_FIXUP_SECTION			\
 953:							\
 	.pushsection __barrier_nospec_fixup,"a";	\
@@ -288,6 +304,8 @@ extern long __start___uaccess_flush_fixup, __stop___uaccess_flush_fixup;
 extern long __start___entry_flush_fixup, __stop___entry_flush_fixup;
 extern long __start___scv_entry_flush_fixup, __stop___scv_entry_flush_fixup;
 extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
+extern long __start___enter_security_fallback_fixup, __stop___enter_security_fallback_fixup;
+extern long __start___exit_security_fallback_fixup, __stop___exit_security_fallback_fixup;
 extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
 extern long __start__btb_flush_fixup, __stop__btb_flush_fixup;
 
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..7586091b754b 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -249,11 +249,7 @@ struct paca_struct {
 #endif
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
-	/*
-	 * rfi fallback flush must be in its own cacheline to prevent
-	 * other paca data leaking into the L1d
-	 */
-	u64 exrfi[EX_SIZE] __aligned(0x80);
+	u64 stf_fallback_scratch[2];
 	void *rfi_flush_fallback_area;
 	u64 l1d_flush_size;
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..225c56c1c945 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -279,7 +279,7 @@ int main(void)
 	OFFSET(PACA_IN_MCE, paca_struct, in_mce);
 	OFFSET(PACA_IN_NMI, paca_struct, in_nmi);
 	OFFSET(PACA_RFI_FLUSH_FALLBACK_AREA, paca_struct, rfi_flush_fallback_area);
-	OFFSET(PACA_EXRFI, paca_struct, exrfi);
+	OFFSET(PACA_STF_FALLBACK_SCRATCH, paca_struct, stf_fallback_scratch);
 	OFFSET(PACA_L1D_FLUSH_SIZE, paca_struct, l1d_flush_size);
 
 #endif
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 33ddfeef4fe9..3b1869bd4fbf 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -117,6 +117,8 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	ENTER_KERNEL_SECURITY_FALLBACK
+
 	/*
 	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
 	 * would clobber syscall parameters. Also we always enter with IRQs
@@ -136,6 +138,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	li	r5,1 /* scv */
 	bl	syscall_exit_prepare
 
+	EXIT_KERNEL_SECURITY_FALLBACK
+
 	ld	r2,_CCR(r1)
 	ld	r4,_NIP(r1)
 	ld	r5,_MSR(r1)
@@ -294,6 +298,8 @@ END_BTB_FLUSH_SECTION
 	stb	r11,PACAIRQSOFTMASK(r13)
 	stb	r12,PACAIRQHAPPENED(r13)
 
+	ENTER_KERNEL_SECURITY_FALLBACK
+
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
 	bl	system_call_exception
@@ -303,6 +309,8 @@ END_BTB_FLUSH_SECTION
 	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
 
+	EXIT_KERNEL_SECURITY_FALLBACK
+
 	ld	r2,_CCR(r1)
 	ld	r4,_NIP(r1)
 	ld	r5,_MSR(r1)
@@ -653,11 +661,16 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
-	bne	.Lfast_user_interrupt_return_amr
-	kuap_kernel_restore r3, r4
+	beq	1f
+	kuap_user_restore r3, r4
+	b	.Lfast_user_interrupt_return
+1:
 	andi.	r0,r5,MSR_RI
+	beq-	2f
+	kuap_kernel_restore r3, r4
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	bne+	.Lfast_kernel_interrupt_return
+	b	.Lfast_kernel_interrupt_return
+2:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
 	b	. /* should not get here */
@@ -673,10 +686,9 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
-
-.Lfast_user_interrupt_return_amr:
-	kuap_user_restore r3, r4
 .Lfast_user_interrupt_return:
+	EXIT_KERNEL_SECURITY_FALLBACK
+
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 12ab2e9f920f..18d0a06f006d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -644,6 +644,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r11,exception_marker@toc(r2)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
+
+	ENTER_KERNEL_SECURITY_FALLBACK
 .endm
 
 /*
@@ -996,6 +998,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	subi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
 
+	EXIT_KERNEL_SECURITY_FALLBACK
+
 	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
@@ -2159,6 +2163,8 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	cmpdi	cr0,r3,0
 	bne	1f
 
+	EXIT_KERNEL_SECURITY_FALLBACK
+
 	EXCEPTION_RESTORE_REGS hsrr=1
 	HRFI_TO_USER_OR_KERNEL
 
@@ -2803,26 +2809,13 @@ masked_interrupt:
 	b	.
 .endm
 
-TRAMP_REAL_BEGIN(stf_barrier_fallback)
-	std	r9,PACA_EXRFI+EX_R9(r13)
-	std	r10,PACA_EXRFI+EX_R10(r13)
-	sync
-	ld	r9,PACA_EXRFI+EX_R9(r13)
-	ld	r10,PACA_EXRFI+EX_R10(r13)
-	ori	31,31,0
-	.rept 14
-	b	1f
-1:
-	.endr
-	blr
-
-/* Clobbers r10, r11, ctr */
+/* Clobbers r11, r12, ctr */
 .macro L1D_DISPLACEMENT_FLUSH
-	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
-	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
-	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
-	mtctr	r11
-	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
+	ld	r11,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
+	ld	r12,PACA_L1D_FLUSH_SIZE(r13)
+	srdi	r12,r12,(7 + 3) /* 128 byte lines, unrolled 8x */
+	mtctr	r12
+	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r12) /* Stop prefetch streams */
 
 	/* order ld/st prior to dcbt stop all streams with flushing */
 	sync
@@ -2833,125 +2826,31 @@ TRAMP_REAL_BEGIN(stf_barrier_fallback)
 	 * hurt).
 	 */
 1:
-	ld	r11,(0x80 + 8)*0(r10)
-	ld	r11,(0x80 + 8)*1(r10)
-	ld	r11,(0x80 + 8)*2(r10)
-	ld	r11,(0x80 + 8)*3(r10)
-	ld	r11,(0x80 + 8)*4(r10)
-	ld	r11,(0x80 + 8)*5(r10)
-	ld	r11,(0x80 + 8)*6(r10)
-	ld	r11,(0x80 + 8)*7(r10)
-	addi	r10,r10,0x80*8
+	ld	r12,(0x80 + 8)*0(r11)
+	ld	r12,(0x80 + 8)*1(r11)
+	ld	r12,(0x80 + 8)*2(r11)
+	ld	r12,(0x80 + 8)*3(r11)
+	ld	r12,(0x80 + 8)*4(r11)
+	ld	r12,(0x80 + 8)*5(r11)
+	ld	r12,(0x80 + 8)*6(r11)
+	ld	r12,(0x80 + 8)*7(r11)
+	addi	r11,r11,0x80*8
 	bdnz	1b
 .endm
 
-TRAMP_REAL_BEGIN(entry_flush_fallback)
-	std	r9,PACA_EXRFI+EX_R9(r13)
-	std	r10,PACA_EXRFI+EX_R10(r13)
-	std	r11,PACA_EXRFI+EX_R11(r13)
-	mfctr	r9
-	L1D_DISPLACEMENT_FLUSH
-	mtctr	r9
-	ld	r9,PACA_EXRFI+EX_R9(r13)
-	ld	r10,PACA_EXRFI+EX_R10(r13)
-	ld	r11,PACA_EXRFI+EX_R11(r13)
-	blr
-
-/*
- * The SCV entry flush happens with interrupts enabled, so it must disable
- * to prevent EXRFI being clobbered by NMIs (e.g., soft_nmi_common). r10
- * (containing LR) does not need to be preserved here because scv entry
- * puts 0 in the pt_regs, CTR can be clobbered for the same reason.
- */
-TRAMP_REAL_BEGIN(scv_entry_flush_fallback)
-	li	r10,0
-	mtmsrd	r10,1
-	lbz	r10,PACAIRQHAPPENED(r13)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
-	std	r11,PACA_EXRFI+EX_R11(r13)
-	L1D_DISPLACEMENT_FLUSH
-	ld	r11,PACA_EXRFI+EX_R11(r13)
-	li	r10,MSR_RI
-	mtmsrd	r10,1
-	blr
-
-TRAMP_REAL_BEGIN(rfi_flush_fallback)
-	SET_SCRATCH0(r13);
-	GET_PACA(r13);
-	std	r1,PACA_EXRFI+EX_R12(r13)
-	ld	r1,PACAKSAVE(r13)
-	std	r9,PACA_EXRFI+EX_R9(r13)
-	std	r10,PACA_EXRFI+EX_R10(r13)
-	std	r11,PACA_EXRFI+EX_R11(r13)
-	mfctr	r9
-	L1D_DISPLACEMENT_FLUSH
-	mtctr	r9
-	ld	r9,PACA_EXRFI+EX_R9(r13)
-	ld	r10,PACA_EXRFI+EX_R10(r13)
-	ld	r11,PACA_EXRFI+EX_R11(r13)
-	ld	r1,PACA_EXRFI+EX_R12(r13)
-	GET_SCRATCH0(r13);
-	rfid
-
-TRAMP_REAL_BEGIN(hrfi_flush_fallback)
-	SET_SCRATCH0(r13);
-	GET_PACA(r13);
-	std	r1,PACA_EXRFI+EX_R12(r13)
-	ld	r1,PACAKSAVE(r13)
-	std	r9,PACA_EXRFI+EX_R9(r13)
-	std	r10,PACA_EXRFI+EX_R10(r13)
-	std	r11,PACA_EXRFI+EX_R11(r13)
-	mfctr	r9
-	L1D_DISPLACEMENT_FLUSH
-	mtctr	r9
-	ld	r9,PACA_EXRFI+EX_R9(r13)
-	ld	r10,PACA_EXRFI+EX_R10(r13)
-	ld	r11,PACA_EXRFI+EX_R11(r13)
-	ld	r1,PACA_EXRFI+EX_R12(r13)
-	GET_SCRATCH0(r13);
-	hrfid
-
-TRAMP_REAL_BEGIN(rfscv_flush_fallback)
-	/* system call volatile */
-	mr	r7,r13
-	GET_PACA(r13);
-	mr	r8,r1
-	ld	r1,PACAKSAVE(r13)
-	mfctr	r9
-	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
-	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
-	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
-	mtctr	r11
-	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
-
-	/* order ld/st prior to dcbt stop all streams with flushing */
+/* Clobbers r11, r12 */
+.macro STF_FALLBACK_BARRIER
+	std	r11,PACA_STF_FALLBACK_SCRATCH+0(r13)
+	std	r12,PACA_STF_FALLBACK_SCRATCH+8(r13)
 	sync
-
-	/*
-	 * The load adresses are at staggered offsets within cachelines,
-	 * which suits some pipelines better (on others it should not
-	 * hurt).
-	 */
+	ld	r11,PACA_STF_FALLBACK_SCRATCH+0(r13)
+	ld	r12,PACA_STF_FALLBACK_SCRATCH+8(r13)
+	ori	31,31,0
+	.rept 14
+	b	1f
 1:
-	ld	r11,(0x80 + 8)*0(r10)
-	ld	r11,(0x80 + 8)*1(r10)
-	ld	r11,(0x80 + 8)*2(r10)
-	ld	r11,(0x80 + 8)*3(r10)
-	ld	r11,(0x80 + 8)*4(r10)
-	ld	r11,(0x80 + 8)*5(r10)
-	ld	r11,(0x80 + 8)*6(r10)
-	ld	r11,(0x80 + 8)*7(r10)
-	addi	r10,r10,0x80*8
-	bdnz	1b
-
-	mtctr	r9
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	mr	r1,r8
-	mr	r13,r7
-	RFSCV
+	.endr
+.endm
 
 USE_TEXT_SECTION()
 
@@ -2966,6 +2865,18 @@ _GLOBAL(do_uaccess_flush)
 _ASM_NOKPROBE_SYMBOL(do_uaccess_flush)
 EXPORT_SYMBOL(do_uaccess_flush)
 
+_GLOBAL(enter_security_fallback)
+	STF_FALLBACK_BARRIER
+	L1D_DISPLACEMENT_FLUSH
+	ld	r12,_MSR(r1) // some interrupts require r12==SRR1
+	blr
+_ASM_NOKPROBE_SYMBOL(enter_security_fallback)
+
+_GLOBAL(exit_security_fallback)
+	STF_FALLBACK_BARRIER
+	L1D_DISPLACEMENT_FLUSH
+	blr
+_ASM_NOKPROBE_SYMBOL(exit_security_fallback)
 
 MASKED_INTERRUPT
 MASKED_INTERRUPT hsrr=1
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 377f5f8b1514..39e3fa923c9b 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -165,6 +165,20 @@ SECTIONS
 		*(__rfi_flush_fixup)
 		__stop___rfi_flush_fixup = .;
 	}
+
+	. = ALIGN(8);
+	__enter_security_fallback_fixup : AT(ADDR(__enter_security_fallback_fixup) - LOAD_OFFSET) {
+		__start___enter_security_fallback_fixup = .;
+		*(__enter_security_fallback_fixup)
+		__stop___enter_security_fallback_fixup = .;
+	}
+
+	. = ALIGN(8);
+	__exit_security_fallback_fixup : AT(ADDR(__exit_security_fallback_fixup) - LOAD_OFFSET) {
+		__start___exit_security_fallback_fixup = .;
+		*(__exit_security_fallback_fixup)
+		__stop___exit_security_fallback_fixup = .;
+	}
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index cd9995ee8441..ae64b5eb3e96 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1078,6 +1078,8 @@ fast_guest_return:
 	bl	kvmhv_accumulate_time
 #endif
 
+	ENTER_GUEST_SECURITY_FALLBACK
+
 	/* Enter guest */
 
 BEGIN_FTR_SECTION
@@ -1346,6 +1348,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	li	r0, MSR_RI
 	mtmsrd	r0, 1
 
+        ENTER_KERNEL_SECURITY_FALLBACK
+
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 	addi	r3, r9, VCPU_TB_RMINTR
 	mr	r4, r9
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 1fd31b4b0e13..0238b89ae721 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -118,116 +118,123 @@ void do_feature_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
-static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
+static void do_enter_security_fallback_fixups(bool enable)
 {
-	unsigned int instrs[3], *dest;
+	unsigned int instr, *dest;
 	long *start, *end;
 	int i;
 
-	start = PTRRELOC(&__start___stf_entry_barrier_fixup);
-	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
+	start = PTRRELOC(&__start___enter_security_fallback_fixup);
+	end = PTRRELOC(&__stop___enter_security_fallback_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
+	instr = 0x60000000; /* nop */
 
-	i = 0;
-	if (types & STF_BARRIER_FALLBACK) {
-		instrs[i++] = 0x7d4802a6; /* mflr r10		*/
-		instrs[i++] = 0x60000000; /* branch patched below */
-		instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
-	} else if (types & STF_BARRIER_EIEIO) {
-		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
-	} else if (types & STF_BARRIER_SYNC_ORI) {
-		instrs[i++] = 0x7c0004ac; /* hwsync		*/
-		instrs[i++] = 0xe94d0000; /* ld r10,0(r13)	*/
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
+	for (i = 0; start < end; start++, i++) {
+		dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		if (enable) {
+			patch_branch((struct ppc_inst *)dest,
+				     (unsigned long)&enter_security_fallback,
+				     BRANCH_SET_LINK);
+		} else {
+			patch_instruction((struct ppc_inst *)dest,
+					  ppc_inst(instr));
+		}
 	}
 
+	printk(KERN_DEBUG "enter-security-fallback: patched %d locations (%s)\n", i,
+			enable ? "enable" : "disable");
+}
+
+static void do_exit_security_fallback_fixups(bool enable)
+{
+	unsigned int instr, *dest;
+	long *start, *end;
+	int i;
+
+	start = PTRRELOC(&__start___exit_security_fallback_fixup);
+	end = PTRRELOC(&__stop___exit_security_fallback_fixup);
+
+	instr = 0x60000000; /* nop */
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-
-		if (types & STF_BARRIER_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1),
-				     (unsigned long)&stf_barrier_fallback,
+		if (enable) {
+			patch_branch((struct ppc_inst *)dest,
+				     (unsigned long)&exit_security_fallback,
 				     BRANCH_SET_LINK);
-		else
-			patch_instruction((struct ppc_inst *)(dest + 1),
-					  ppc_inst(instrs[1]));
+		} else {
+			patch_instruction((struct ppc_inst *)dest,
+					  ppc_inst(instr));
+		}
+	}
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+	printk(KERN_DEBUG "exit-security-fallback: patched %d locations (%s)\n", i,
+			enable ? "enable" : "disable");
+}
+
+static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
+{
+	unsigned int instr, *dest;
+	long *start, *end;
+	int i;
+
+	start = PTRRELOC(&__start___stf_entry_barrier_fixup);
+	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
+
+	instr = 0x60000000; /* nop */
+	if (types & STF_BARRIER_EIEIO)
+		instr = 0x7e0006ac; /* eieio + bit 6 hint */
+
+	for (i = 0; start < end; start++, i++) {
+		dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
 	}
 
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
 		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
 		(types == STF_BARRIER_EIEIO)                 ? "eieio" :
-		(types == (STF_BARRIER_SYNC_ORI))            ? "hwsync"
-		                                           : "unknown");
+		(types == STF_BARRIER_SYNC_ORI)              ? "hwsync"
+		                                             : "unknown");
 }
 
 static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 {
-	unsigned int instrs[6], *dest;
+	unsigned int instr, *dest;
 	long *start, *end;
 	int i;
 
 	start = PTRRELOC(&__start___stf_exit_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_exit_barrier_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
-	instrs[3] = 0x60000000; /* nop */
-	instrs[4] = 0x60000000; /* nop */
-	instrs[5] = 0x60000000; /* nop */
-
-	i = 0;
-	if (types & STF_BARRIER_FALLBACK || types & STF_BARRIER_SYNC_ORI) {
-		if (cpu_has_feature(CPU_FTR_HVMODE)) {
-			instrs[i++] = 0x7db14ba6; /* mtspr 0x131, r13 (HSPRG1) */
-			instrs[i++] = 0x7db04aa6; /* mfspr r13, 0x130 (HSPRG0) */
-		} else {
-			instrs[i++] = 0x7db243a6; /* mtsprg 2,r13	*/
-			instrs[i++] = 0x7db142a6; /* mfsprg r13,1    */
-	        }
-		instrs[i++] = 0x7c0004ac; /* hwsync		*/
-		instrs[i++] = 0xe9ad0000; /* ld r13,0(r13)	*/
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
-		if (cpu_has_feature(CPU_FTR_HVMODE)) {
-			instrs[i++] = 0x7db14aa6; /* mfspr r13, 0x131 (HSPRG1) */
-		} else {
-			instrs[i++] = 0x7db242a6; /* mfsprg r13,2 */
-		}
-	} else if (types & STF_BARRIER_EIEIO) {
-		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
-	}
+	instr = 0x60000000; /* nop */
+	if (types == STF_BARRIER_EIEIO)
+		instr = 0x7e0006ac; /* eieio + bit 6 hint */
 
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
-		patch_instruction((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
-		patch_instruction((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
 	}
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
 		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
 		(types == STF_BARRIER_EIEIO)                 ? "eieio" :
-		(types == (STF_BARRIER_SYNC_ORI))            ? "hwsync"
-		                                           : "unknown");
+		(types == STF_BARRIER_SYNC_ORI)              ? "hwsync"
+		                                             : "unknown");
 }
 
-
 void do_stf_barrier_fixups(enum stf_barrier_type types)
 {
 	do_stf_entry_barrier_fixups(types);
@@ -286,28 +293,20 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 
 void do_entry_flush_fixups(enum l1d_flush_type types)
 {
-	unsigned int instrs[3], *dest;
+	unsigned int instrs[2], *dest;
 	long *start, *end;
 	int i;
 
 	instrs[0] = 0x60000000; /* nop */
 	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
 
 	i = 0;
-	if (types == L1D_FLUSH_FALLBACK) {
-		instrs[i++] = 0x7d4802a6; /* mflr r10		*/
-		instrs[i++] = 0x60000000; /* branch patched below */
-		instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
-	}
-
 	if (types & L1D_FLUSH_ORI) {
 		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
 		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
-	}
-
-	if (types & L1D_FLUSH_MTTRIG)
+	} else if (types & L1D_FLUSH_MTTRIG) {
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+	}
 
 	start = PTRRELOC(&__start___entry_flush_fixup);
 	end = PTRRELOC(&__stop___entry_flush_fixup);
@@ -316,15 +315,9 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-
-		if (types == L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&entry_flush_fallback,
-				     BRANCH_SET_LINK);
-		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction((struct ppc_inst *)(dest + 0), ppc_inst(instrs[0]));
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
 	}
 
 	start = PTRRELOC(&__start___scv_entry_flush_fixup);
@@ -334,15 +327,9 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-
-		if (types == L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&scv_entry_flush_fallback,
-				     BRANCH_SET_LINK);
-		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction((struct ppc_inst *)(dest + 0), ppc_inst(instrs[0]));
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
 	}
 
 
@@ -354,11 +341,13 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 							: "ori type" :
 		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
 						: "unknown");
+	if (1)
+		do_enter_security_fallback_fixups(true);
 }
 
 void do_rfi_flush_fixups(enum l1d_flush_type types)
 {
-	unsigned int instrs[3], *dest;
+	unsigned int instrs[2], *dest;
 	long *start, *end;
 	int i;
 
@@ -367,29 +356,22 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 	instrs[0] = 0x60000000; /* nop */
 	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
-
-	if (types & L1D_FLUSH_FALLBACK)
-		/* b .+16 to fallback flush */
-		instrs[0] = 0x48000010;
 
 	i = 0;
 	if (types & L1D_FLUSH_ORI) {
 		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
 		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
-	}
-
-	if (types & L1D_FLUSH_MTTRIG)
+	} else if (types & L1D_FLUSH_MTTRIG) {
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+	}
 
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction((struct ppc_inst *)(dest + 0), ppc_inst(instrs[0]));
 		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
@@ -400,6 +382,8 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 							: "ori type" :
 		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
 						: "unknown");
+	if (1)
+		do_exit_security_fallback_fixups(true);
 }
 
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
-- 
2.23.0

