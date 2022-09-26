Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9295E990B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:58:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXBF08LHz3cd3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:58:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ltBp/HqM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ltBp/HqM;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7j6qk4z3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:33 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id q9so5614519pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vJ5dkdb4BXxM25qwwd4Qe6WFPnXrJI6JlmxMYvccGwM=;
        b=ltBp/HqMxPeJFNT7Z1fC6dW0BLwdZjgnDi+zpQlzIo+UZ19r3gYTRDm4kfD6OzYeRe
         MQPmsPeAHLnd9jEaFwCDhRCXdB/5U82qUbvXJAAO/QU/6iBz/gM6WtUHj9gCLWYpro94
         4AhtaqmiKMMpgi7L4Nz0jJEHpEMgxFeELdqO75rDK1VIJl9JlbHnTJeDSWzHC6rFU02K
         0NHZsHczPcBB5qZqlqmSkuQztVaqQcRM/I2tg/rGPX5n/62nniV+rg+HcM6P/Uigf2FZ
         039snYpczRwnoTUOwtKYto8vdilqynKupJlYA0ppXstXrd/7BdHtTUJ0SMrYlgp5VlkO
         lq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vJ5dkdb4BXxM25qwwd4Qe6WFPnXrJI6JlmxMYvccGwM=;
        b=RU97u3C0zebqkthftn/yfBFUl3Kya0iOroCNJEq92HjCIo3U9mmI+3CHWYFSJagMw9
         cBQeopSMEA8q9NhLUpge04qzyKlCfaM/1ndSq+zGs2+TO9NpSVLrHcX3OvIqLunVka1a
         cz2vQ8n31EO3y+sNFFlkcwnSheq4xaLbvuW6BSdrtA1mRMdzErDyFog1erz0Bns0yLBi
         Zh9ObsdX+Ngv3lMzpevsWumffMKT+CiZQIVPxAv6evl4JZ9v0nI7JxnqMTK3zDhrerAF
         1eOrH827d4hz0KB21LkqD7WINhjk2DjvwelRv9pDpfU63DOpCiV6+hsEk+osb9v87hrh
         miYQ==
X-Gm-Message-State: ACrzQf1xMRLHM5X/xF0QdZqu+mOcLvrOTDpj4anN6pBp2GDYICzx62xf
	tFsctBkHtMNWpnbEzjSa5pCebCD8EoXdIw==
X-Google-Smtp-Source: AMsMyM4X7ZJxLPS3zCz6GpEph8pdrL/mL/Lv/aa1wbeM2pGv4INy6QoEjFf2VZWPLiukjwTkWDylYQ==
X-Received: by 2002:a63:67c1:0:b0:42c:366f:e8fe with SMTP id b184-20020a6367c1000000b0042c366fe8femr18872366pgc.198.1664171791288;
        Sun, 25 Sep 2022 22:56:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] powerpc/64s: early boot machine check handler
Date: Mon, 26 Sep 2022 15:56:17 +1000
Message-Id: <20220926055620.2676869-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
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

Use the early boot interrupt fixup in the machine check handler to allow
the machine check handler to run before interrupt endian is set up.
Branch to an early boot handler that just does a basic crash, which
allows it to run before ppc_md is set up. MSR[ME] is enabled on the boot
CPU earlier, and the machine check stack is temporarily set to the
middle of the init task stack.

This allows machine checks (e.g., due to invalid data access in real
mode) to print something useful earlier in boot (as soon as udbg is set
up, if CONFIG_PPC_EARLY_DEBUG=y).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/kernel/exceptions-64s.S      |  6 +++++-
 arch/powerpc/kernel/setup_64.c            | 14 ++++++++++++++
 arch/powerpc/kernel/traps.c               | 14 ++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

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
index 66e2adf50745..9b853fdd59de 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1133,6 +1133,7 @@ INT_DEFINE_BEGIN(machine_check)
 INT_DEFINE_END(machine_check)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
+	EARLY_BOOT_FIXUP
 	GEN_INT_ENTRY machine_check_early, virt=0
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
@@ -1197,6 +1198,9 @@ BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+BEGIN_FTR_SECTION
+	bl	machine_check_early_boot
+END_FTR_SECTION(0, 1)     // nop out after boot
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
@@ -3095,7 +3099,7 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 USE_TEXT_SECTION()
 
 /* MSR[RI] should be clear because this uses SRR[01] */
-enable_machine_check:
+_GLOBAL(enable_machine_check)
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r3
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index ce8fc6575eaa..e68d316b993e 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
@@ -180,6 +181,16 @@ static void __init fixup_boot_paca(void)
 {
 	/* The boot cpu is started */
 	get_paca()->cpu_start = 1;
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * Give the early boot machine check stack somewhere to use, use
+	 * half of the init stack. This is a bit hacky but there should not be
+	 * deep stack usage in early init so shouldn't overflow it or overwrite
+	 * things.
+	 */
+	get_paca()->mc_emergency_sp = (void *)&init_thread_union +
+		(THREAD_SIZE/2);
+#endif
 	/* Allow percpu accesses to work until we setup percpu data */
 	get_paca()->data_offset = 0;
 	/* Mark interrupts soft and hard disabled in PACA */
@@ -357,6 +368,9 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* -------- printk is now safe to use ------- */
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (mfmsr() & MSR_HV))
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

