Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B92A9957
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:19:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQZZ3ndxzDr5s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Na9l7oN7; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ813fbyzDrN2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 03:00:01 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id x13so1250291pgp.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 08:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CC1vcm3k8krXhVWEBZt6AbPAB44EP46L4nfTG4VvzSs=;
 b=Na9l7oN7S/gFWgvNq4o6Cs09hmvFTHD3NEoI8DITqAs+EUtrN4knEr/EHI3y+q9CKB
 nv/0PZ2EWlOF/GEGEYeOU7GUaK9uKhpfe3cKTNuocEwc6JxzTeq91I5hOlqp7ui1zsHF
 eo2uIAmLsRHqaJDioFMkT6bqvfwCUNoNkx+9dREopclSjjtJ1SruoMH+xYftMk18oOB8
 nToNsPkWXNwVyCC60nQboRokMUql8MfZZQcsmTGYyNXseDJhW5FcA6xnQ1eRA/6hBUh0
 OgIo9H3/bD/cJc/Z0L7JnPMFxq8TSkgUeFUSP9YJeLhdZeTTitUh4RvXeCOLUjWVAETE
 8PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CC1vcm3k8krXhVWEBZt6AbPAB44EP46L4nfTG4VvzSs=;
 b=EzPbvIp1w8dU1Qh6hB958cysetkxA4eIPBNPd8IPNyDNjjDCTdTXaikVUpcWuvEPP/
 7PTjjwbJL94tYnh2V3lJJ1Gb6KSvgJFrKnTXeWG6xpdprGvsjHHKjABb5iazcwmajAk8
 jCVnmh3Gvz+jKYQfmrmEYXfmhyjqGKO/j7HHNkqk0MKdXw8VRC1gTj4WBPtGJ8HchHKZ
 AckK6XTtrsWb2O8m4YlRkpiwCD6r9rIswo8CTO6ZvpyUXVP79mRUQn0PBbSrg7gDsGbO
 pRmDwJt/oeFMfhIH/2yV5Bz7Q5aoaDsMD8qjlJnLUyFsHbo0407gDvTKfMghKBDkM0B0
 EipQ==
X-Gm-Message-State: AOAM532WWaoABrSYCUOgH7MxxEs431X0Eyls4Blh5KSzADtTO0aJkqrR
 l73wdpAmi1hlvI0ocO2USXezqyQDeV8=
X-Google-Smtp-Source: ABdhPJzFrh2+YOnnn1uco2TDg6YOVeKM0x6xWtUqaimxWaz2TysGmy45PJlIyw0D8Hy/3I2qz5nnHw==
X-Received: by 2002:a17:90a:134b:: with SMTP id
 y11mr229402pjf.182.1604678398788; 
 Fri, 06 Nov 2020 07:59:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 9/9] powerpc/64s: use interrupt restart table to speed up
 return from interrupt
Date: Sat,  7 Nov 2020 01:59:29 +1000
Message-Id: <20201106155929.2246055-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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

The restart table facility is used to return from interrupt without
disabling MSR[EE] or MSR[RI].

Interrupt return code is put into the low soft-masked region, and
critical code that has return SRRs set, soft-masked state set with no
soft-pending interrupts to replay, and no exit work, is put into
alternate return sections. r1 is saved in the paca. If an interrupt hits
at this point, our fixup location re-loads r1 and from there we can get
to regs, critical things are re-loaded, and we go around and do the
exit sequence again.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   4 +-
 arch/powerpc/include/asm/paca.h           |   1 +
 arch/powerpc/include/asm/ptrace.h         |  13 +-
 arch/powerpc/kernel/asm-offsets.c         |   3 +
 arch/powerpc/kernel/interrupt_64.S        | 119 ++++++++++-
 arch/powerpc/kernel/syscall_64.c          | 242 +++++++++++++---------
 6 files changed, 277 insertions(+), 105 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 939f3c94c8f3..e0b0fc2913c1 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -71,8 +71,8 @@ void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 58e9995c3184..ab123dc85b81 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -167,6 +167,7 @@ struct paca_struct {
 	u64 kstack;			/* Saved Kernel stack addr */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
+	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
 #ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 2c3e773ce292..cd49769d4194 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -50,14 +50,23 @@ struct pt_regs
 
 	union {
 		struct {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
 			unsigned long ppr;
+			unsigned long exit_result;
 #endif
 #ifdef CONFIG_PPC_KUAP
 			unsigned long kuap;
 #endif
 		};
-		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
+
+		/* Maintain 16 byte interrupt stack alignment */
+#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_BOOK3S_64
+		unsigned long __pad[4];
+#else
+		unsigned long __pad[2];
+#endif
+#endif
 	};
 };
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index ea13e35dd511..eec4e92bd938 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -290,6 +290,7 @@ int main(void)
 	OFFSET(ACCOUNT_STARTTIME_USER, paca_struct, accounting.starttime_user);
 	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
 	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
+	OFFSET(PACA_EXIT_SAVE_R1, paca_struct, exit_save_r1);
 #ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
 #endif
@@ -353,7 +354,9 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_ESR, dsisr);
 #else /* CONFIG_PPC64 */
 	STACK_PT_REGS_OFFSET(SOFTE, softe);
+#ifdef CONFIG_PPC_BOOK3S_64
 	STACK_PT_REGS_OFFSET(_PPR, ppr);
+#endif
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_PPC_KUAP
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 9b44f6d3463b..a686d625b8ee 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -113,9 +113,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,1 /* scv */
 	bl	syscall_exit_prepare
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Lsyscall_vectored_\name\()_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Lsyscall_vectored_\name\()_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	ld	r2,_CCR(r1)
 	ld	r4,_NIP(r1)
@@ -165,8 +174,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.	/* prevent speculative execution */
 
 .Lsyscall_vectored_\name\()_restore_regs:
-	li	r3,0
-	mtmsrd	r3,1
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r5
 
@@ -184,9 +191,26 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_2GPRS(12, r1)
 	ld	r1,GPR1(r1)
 	RFI_TO_USER
+.Lsyscall_vectored_\name\()_rst_end:
+
+.Lsyscall_vectored_\name\()_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	ld	r3,RESULT(r1)
+	addi	r4,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	syscall_exit_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Lsyscall_vectored_\name\()_rst_start
+
+RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, .Lsyscall_vectored_\name\()_restart)
+
 .endm
 
 system_call_vectored common 0x3000
+
 /*
  * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
  * which is tested by system_call_exception when r0 is -1 (as set by vector
@@ -289,9 +313,18 @@ END_BTB_FLUSH_SECTION
 	bl	system_call_exception
 
 .Lsyscall_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Lsyscall_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Lsyscall_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	ld	r2,_CCR(r1)
 	ld	r6,_LINK(r1)
@@ -356,6 +389,21 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_8GPRS(4, r1)
 	ld	r12,GPR12(r1)
 	b	.Lsyscall_restore_regs_cont
+.Lsyscall_rst_end:
+
+.Lsyscall_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	ld	r3,RESULT(r1)
+	addi	r4,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	syscall_exit_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Lsyscall_rst_start
+
+RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, .Lsyscall_restart)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 .Ltabort_syscall:
@@ -439,16 +487,32 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	beq	.Lkernel_interrupt_return_\srr
+.Linterrupt_return_\srr\()_user:
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
+.Lrestore_nvgprs_\srr\()_cont:
+
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_user_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Linterrupt_return_\srr\()_user_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 .Lfast_user_interrupt_return_\srr:
 BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	lbz	r4,PACAIRQSOFTMASK(r13)
+	tdnei	r4,IRQS_ENABLED
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
 	.else
@@ -503,16 +567,46 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_USER
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_user_rst_end:
 
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
-	b	.Lfast_user_interrupt_return_\srr
+	b	.Lrestore_nvgprs_\srr\()_cont
+
+.Linterrupt_return_\srr\()_user_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	interrupt_exit_user_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Linterrupt_return_\srr\()_user_rst_start
+
+RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, .Linterrupt_return_\srr\()_user_restart)
 
 	.balign IFETCH_ALIGN_BYTES
 .Lkernel_interrupt_return_\srr\():
+.Linterrupt_return_\srr\()_kernel:
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_kernel_rst_start:
+	lbz	r11,SOFTE(r1)
+	cmpwi	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bne	1f
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Linterrupt_return_\srr\()_kernel_restart
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
+1:
+
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
 	.ifc \srr,srr
@@ -600,6 +694,21 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_KERNEL
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_kernel_rst_end:
+
+.Linterrupt_return_\srr\()_kernel_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	interrupt_exit_kernel_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Linterrupt_return_\srr\()_kernel_rst_start
+
+RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, .Linterrupt_return_\srr\()_kernel_restart)
+
 .endm
 
 interrupt_return_macro srr
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 672f2a796487..5add073a21b7 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -109,87 +109,27 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	return f(r3, r4, r5, r6, r7, r8);
 }
 
-/*
- * local irqs must be disabled. Returns false if the caller must re-enable
- * them, check for new work, and try again.
- */
-static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri)
+static notrace inline bool prep_irq_for_enabled_exit(void)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
-	/* This pattern matches prep_irq_for_idle */
-	if (clear_ri)
-		__hard_EE_RI_disable();
-	else
-		__hard_irq_disable();
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		/* Took an interrupt, may have more exit work to do. */
-		if (clear_ri)
-			__hard_RI_enable();
 		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
 		return false;
 	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
 
 	return true;
 }
 
-/*
- * This should be called after a syscall returns, with r3 the return value
- * from the syscall. If this function returns non-zero, the system call
- * exit assembly should additionally load all GPR registers and CTR and XER
- * from the interrupt frame.
- *
- * The function graph tracer can not trace the return side of this function,
- * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
- */
-notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs,
-					   long scv)
+notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
+					   struct pt_regs *regs)
 {
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
-	CT_WARN_ON(ct_state() == CONTEXT_USER);
-
-	kuap_check_amr();
-
-	regs->result = r3;
-
-	/* Check whether the syscall is issued inside a restartable sequence */
-	rseq_syscall(regs);
-
-	ti_flags = *ti_flagsp;
-
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && !scv) {
-		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
-			r3 = -r3;
-			regs->ccr |= 0x10000000; /* Set SO bit in CR */
-		}
-	}
-
-	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
-		if (ti_flags & _TIF_RESTOREALL)
-			ret = _TIF_RESTOREALL;
-		else
-			regs->gpr[3] = r3;
-		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
-	} else {
-		regs->gpr[3] = r3;
-	}
-
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-		do_syscall_trace_leave(regs);
-		ret |= _TIF_RESTOREALL;
-	}
-
 again:
-	local_irq_disable();
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
@@ -233,15 +173,16 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	user_enter_irqoff();
-
-	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!prep_irq_for_enabled_exit(!scv))) {
-		user_exit_irqoff();
+	if (unlikely(lazy_irq_pending_nocheck())) {
 		local_irq_enable();
+		local_irq_disable();
 		goto again;
 	}
 
+	trace_hardirqs_on();
+
+	user_enter_irqoff();
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
 #endif
@@ -251,17 +192,95 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
+/*
+ * This should be called after a syscall returns, with r3 the return value
+ * from the syscall. If this function returns non-zero, the system call
+ * exit assembly should additionally load all GPR registers and CTR and XER
+ * from the interrupt frame.
+ *
+ * The function graph tracer can not trace the return side of this function,
+ * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
+ */
+notrace unsigned long syscall_exit_prepare(unsigned long r3,
+					   struct pt_regs *regs,
+					   long scv)
+{
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long ti_flags;
+	unsigned long ret = 0;
+
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
+	kuap_check_amr();
+
+	regs->result = r3;
+
+	/* Check whether the syscall is issued inside a restartable sequence */
+	rseq_syscall(regs);
+
+	ti_flags = *ti_flagsp;
+
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && !scv) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			r3 = -r3;
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
+	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
+		if (ti_flags & _TIF_RESTOREALL)
+			ret = _TIF_RESTOREALL;
+		else
+			regs->gpr[3] = r3;
+		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
+	} else {
+		regs->gpr[3] = r3;
+	}
+
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		do_syscall_trace_leave(regs);
+		ret |= _TIF_RESTOREALL;
+	}
+
+	local_irq_disable();
+	ret |= syscall_exit_prepare_main(r3, regs);
+
+	regs->exit_result = ret;
+
+	return ret;
+}
+
+notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs)
+{
+	/* This is called in when detecting a soft-pending interrupt as well,
+	 * so can't just have restart table returns clear SRR1[MSR] and set
+	 * PACA_IRQ_HARD_DIS here (unless the soft-pending case were to clear
+	 * MSR[EE] too).
+	 */
+	hard_irq_disable();
+
+	trace_hardirqs_off();
+	user_exit_irqoff();
+	account_cpu_user_entry();
+
+	BUG_ON(!user_mode(regs));
+
+	regs->exit_result |= syscall_exit_prepare_main(r3, regs);
+
+	return regs->exit_result;
+}
+
 #ifdef CONFIG_PPC_BOOK3S /* BOOK3E not yet using this */
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_BOOK3E
 	struct thread_struct *ts = &current->thread;
 #endif
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
-	unsigned long flags;
 	unsigned long ret = 0;
 
+	BUG_ON(!irqs_disabled());
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
@@ -275,8 +294,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	 */
 	kuap_check_amr();
 
-	local_irq_save(flags);
-
 again:
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
@@ -310,14 +327,16 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	user_enter_irqoff();
-	if (unlikely(!prep_irq_for_enabled_exit(true))) {
-		user_exit_irqoff();
+	if (unlikely(lazy_irq_pending_nocheck())) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
 	}
 
+	trace_hardirqs_on();
+
+	user_enter_irqoff();
+
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
 		/*
@@ -336,19 +355,21 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 	account_cpu_user_exit();
 
+	regs->exit_result = ret;
+
 	return ret;
 }
 
 void unrecoverable_exception(struct pt_regs *regs);
 void preempt_schedule_irq(void);
 
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 {
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
-	unsigned long flags;
 	unsigned long ret = 0;
 	unsigned long amr;
 
+	BUG_ON(!irqs_disabled());
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
@@ -362,13 +383,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 
 	amr = kuap_get_and_check_amr();
 
-	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
-		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
-		ret = 1;
-	}
-
-	local_irq_save(flags);
-
 	if (regs->softe == IRQS_ENABLED) {
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
@@ -381,27 +395,33 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			}
 		}
 
-		if (unlikely(!prep_irq_for_enabled_exit(true))) {
-			/*
-			 * Can't local_irq_restore to replay if we were in
-			 * interrupt context. Must replay directly.
-			 */
-			if (irqs_disabled_flags(flags)) {
-				replay_soft_interrupts();
-			} else {
-				local_irq_restore(flags);
-				local_irq_save(flags);
-			}
+		if (unlikely(lazy_irq_pending_nocheck())) {
+			hard_irq_disable();
+			replay_soft_interrupts();
 			/* Took an interrupt, may have more exit work to do. */
 			goto again;
 		}
+		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+
+		trace_hardirqs_on();
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
-		__hard_EE_RI_disable();
 		if (regs->msr & MSR_EE)
 			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
 	}
 
+	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
+		/* Stack store can't be restarted (stack might have been clobbered) */
+		__hard_EE_RI_disable();
+		if (unlikely(lazy_irq_pending_nocheck()) && regs->softe == IRQS_ENABLED) {
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			__hard_RI_enable();
+			goto again;
+		}
+
+		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
+		ret = 1;
+	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -416,4 +436,34 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 
 	return ret;
 }
+
+notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
+{
+	hard_irq_disable();
+
+	trace_hardirqs_off();
+	user_exit_irqoff();
+	account_cpu_user_entry();
+
+	BUG_ON(!user_mode(regs));
+
+	regs->exit_result |= interrupt_exit_user_prepare(regs);
+
+	return regs->exit_result;
+}
+
+notrace unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs)
+{
+	hard_irq_disable();
+
+	set_kuap(AMR_KUAP_BLOCKED);
+
+	if (regs->softe == IRQS_ENABLED)
+		trace_hardirqs_off();
+
+	BUG_ON(user_mode(regs));
+
+	return interrupt_exit_kernel_prepare(regs);
+}
+
 #endif
-- 
2.23.0

