Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E95B092A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 17:49:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN6B70XP0z3c6Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 01:49:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FyPfqW3K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FyPfqW3K;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN69W6LdQz304n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 01:48:29 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id 14so6284302pfu.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=o5FzfIX75fsBiVOSp5oxSZ+AqhtPkAoNr7wVd8vSdy8=;
        b=FyPfqW3KiLmiV6bSH8fsh6O11dKFWE/vMjzKPbd5sUEVnK+TIl06hsNvkcHBAuemXj
         UPnyuosnZnto5+19XH+zlOoPhujvoWM1+V5mXvhUMDPdcRz3VhrzewFAVovGZh1f+FDD
         glmfvfWEFY6i9bL64W3pejdJvhJr9tJmp4paPS8iWXyN1VkpPGPpaDaR4O/w/x6wNpdC
         Horaao1/a+ibarEwJ7jOuMLo6jVr4Q3BDhFKYsNmNBoUOphr7xYYmenyhaFpj/gvn9su
         UM0ihFKHYix3jSqd++mHn763hSE0t7m5Gr9L4lJWXiJNmEv+q5YexzOtTS9Sct0Neoj3
         HpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=o5FzfIX75fsBiVOSp5oxSZ+AqhtPkAoNr7wVd8vSdy8=;
        b=iLyKX92FazvmSDEMP9Af6jO9G3z2u6Jv2HkUE6y581GODLq6B9zOZO/HxMNLdofrVE
         u6syboS9KcmKN5r2tY3rIHvZiswKKBVJl0w9kU/wPl7H7MeHHI+6STLVgA3gfecBnwWG
         LFnjhpZinujJh0Bct1LYyCbw7jrOEloRSbPX8CIPB8rO1KSHn5Kd9XW64PDPKGOYRcNv
         UNf6uUUCRY8veVbPMiFsNqG2TkCGwkqzthSZ+L/LpM+HP/ueBUHmGgGIRRc1mAkacvWc
         VctESG2g7GHEhiM9299DFXje/mqveyiD4QL1r1tReRkgjoc310Z+IvalBNcrzHFV7UL7
         TcJQ==
X-Gm-Message-State: ACgBeo3i1uEQ91mlNMSDZOmRIXJnAjBVB3OeotYivb1UIZtDjQn0g56q
	CguRmQaBwQPgdamNYVPK46AbcnZu4Vc=
X-Google-Smtp-Source: AA6agR5TulxnA3W2BH2AQ2VW8gPMUmhlTVxGvpWE0Kv00peTgD2dYE1NmFnFKFyrZupA2DKcUYdj5A==
X-Received: by 2002:a05:6a02:309:b0:434:d151:639e with SMTP id bn9-20020a056a02030900b00434d151639emr3926551pgb.124.1662565706093;
        Wed, 07 Sep 2022 08:48:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id o3-20020a63e343000000b00434d9ba7817sm2234952pgj.30.2022.09.07.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:48:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64s: early boot machine check handler
Date: Thu,  8 Sep 2022 01:48:20 +1000
Message-Id: <20220907154820.3879596-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch re-uses the same trick from the program interrupt in early
boot to allow the machine check handler to run before interrupt endian
is set up, and branch to an early boot handler (e.g., before ppc_md is
set up).

MSR[ME] is enabled on the boot CPU earlier, and the machine check stack
is temporarily in the middle of the init task stack.

This allows machine checks (e.g., due to invalid data access in real
mode) to be caught and printed out earlier in boot, as soon as udbg is
set up when CONFIG_PPC_EARLY_DEBUG=y.

---
per cpu data offset poisoning patch was rejected because it causes
checkstops or other strange things in early boot. Maybe this can
help that situation.

XXX: haven't tested with pseries yet.

XXX: should consolidate the interrupt entry code. gas macro should
be able to build the immediate value for the rfid offset.

 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/kernel/exceptions-64s.S      | 31 +++++++++++++++++++++++
 arch/powerpc/kernel/setup_64.c            |  6 +++++
 arch/powerpc/kernel/traps.c               | 14 ++++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 81631e64dbeb..a1039b9da42e 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -36,6 +36,7 @@ int64_t __opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		    int64_t opcode, uint64_t msr);
 
 /* misc runtime */
+void enable_machine_check(void);
 extern u64 __bswapdi2(u64);
 extern s64 __lshrdi3(s64, int);
 extern s64 __ashldi3(s64, int);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d98732a33afe..004a08cb48f2 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1079,6 +1079,33 @@ INT_DEFINE_BEGIN(machine_check)
 INT_DEFINE_END(machine_check)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+	/*
+	 * See comment in program_check, this code is identical except
+	 * the SRR0 rfid offset.
+	 */
+BEGIN_FTR_SECTION
+	tdi   0,0,0x48    // Trap never, or in reverse endian: b . + 8
+	b     1f          // Skip trampoline if endian is correct
+	.long 0xa643707d  // mtsprg  0, r11      Backup r11
+	.long 0xa6027a7d  // mfsrr0  r11
+	.long 0xa643727d  // mtsprg  2, r11      Backup SRR0 in SPRG2
+	.long 0xa6027b7d  // mfsrr1  r11
+	.long 0xa643737d  // mtsprg  3, r11      Backup SRR1 in SPRG3
+	.long 0xa600607d  // mfmsr   r11
+	.long 0x01006b69  // xori    r11, r11, 1 Invert MSR[LE]
+	.long 0xa6037b7d  // mtsrr1  r11
+	.long 0x34026039  // li      r11, 0x234
+	.long 0xa6037a7d  // mtsrr0  r11
+	.long 0x2400004c  // rfid
+	mfsprg r11, 3
+	mtsrr1 r11        // Restore SRR1
+	mfsprg r11, 2
+	mtsrr0 r11        // Restore SRR0
+	mfsprg r11, 0     // Restore r11
+1:
+END_FTR_SECTION(0, 1)     // nop out after boot
+#endif
 	GEN_INT_ENTRY machine_check_early, virt=0
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
@@ -1143,6 +1170,9 @@ BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+BEGIN_FTR_SECTION
+	bl	machine_check_early_boot
+END_FTR_SECTION(0, 1)     // nop out after boot
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
@@ -3087,6 +3117,7 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 USE_TEXT_SECTION()
 
 /* MSR[RI] should be clear because this uses SRR[01] */
+	.globl enable_machine_check
 enable_machine_check:
 	mflr	r0
 	bcl	20,31,$+4
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2b2d0b0fbb30..19a6c9ca934e 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
@@ -180,6 +181,8 @@ static void __init fixup_boot_paca(void)
 {
 	/* The boot cpu is started */
 	get_paca()->cpu_start = 1;
+	/* Give the early boot machine check stack somewhere to use */
+	get_paca()->mc_emergency_sp = (void *)&init_thread_union + (THREAD_SIZE/2);
 	/* Allow percpu accesses to work until we setup percpu data */
 	get_paca()->data_offset = 0;
 	/* Mark interrupts disabled in PACA */
@@ -355,6 +358,9 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* -------- printk is now safe to use ------- */
 
+	if (mfmsr() & MSR_HV)
+		enable_machine_check();
+
 	/* Try new device tree based feature discovery ... */
 	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
 		/* Otherwise use the old style CPU table */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dadfcef5d6db..37f8375452ad 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -68,6 +68,7 @@
 #include <asm/stacktrace.h>
 #include <asm/nmi.h>
 #include <asm/disassemble.h>
+#include <asm/udbg.h>
 
 #if defined(CONFIG_DEBUGGER) || defined(CONFIG_KEXEC_CORE)
 int (*__debugger)(struct pt_regs *regs) __read_mostly;
@@ -850,6 +851,19 @@ static void __machine_check_exception(struct pt_regs *regs)
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
+DEFINE_INTERRUPT_HANDLER_RAW(machine_check_early_boot)
+{
+	udbg_printf("Machine check (early boot)\n");
+	udbg_printf("SRR0=0x%016lx   SRR1=0x%016lx\n", regs->nip, regs->msr);
+	udbg_printf(" DAR=0x%016lx  DSISR=0x%08lx\n", regs->dar, regs->dsisr);
+	udbg_printf("  LR=0x%016lx     R1=0x%08lx\n", regs->link, regs->gpr[1]);
+	udbg_printf("------\n");
+	die("Machine check (early boot)", regs, SIGBUS);
+	for (;;)
+		;
+	return 0;
+}
+
 DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async)
 {
 	__machine_check_exception(regs);
-- 
2.37.2

