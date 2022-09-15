Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A75B9A8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:13:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx1t6QXgz3dw1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oN+jjaqW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oN+jjaqW;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzL4Svwz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:26 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id w2so7574874pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dI1XApg9D4NdasnJjUXIpQn6zBeMw3mea5f7GCONCKQ=;
        b=oN+jjaqW1qGSO2jmV5ePEyoaQMqBZpsQ8LJGkoJxsKu4AdUE0Xuy8k0eQCxpV9eYgQ
         nJ9loigRt/jzhFYxATqKuADWTcwSBtNlIdR5f7lueV7R+O0eGDxqci+vk/frTdteXnMV
         K4zfV3W6Nu48QbFsDSrrdUtMnV3LaolpkPNLEhw0KaXC3oj9/u9K6OvT5kd5q1CjGVNz
         xo0pJIRjQWIV7E+vzYIV1tsOjkWNX5o7bRLuA9M944tCiTUxXKXp9fYw3R4W1K8SQeFr
         YQIiJAnPqOzr1u3+u8Cd1wurJFy4PXXbmv8NQjRjDyzVY44DKJ3uP/P1yiSAzXwEMJtC
         UVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dI1XApg9D4NdasnJjUXIpQn6zBeMw3mea5f7GCONCKQ=;
        b=EgSmu7MzqmkWCY/6xmMn/DHLzxJdmhSMPRuwvPgFXq8d76DJez8T2AVkuKz7FLOSyd
         wU1Jv97ioN3rwkppG26VLeuZKRPIhrOrcAK+w0ODwPElhT3HqNFPMzHe1zf/SG7XKUHi
         B2zIyyFHXlwjHWHGwRi0Kffe9CaMB6SP/IdirIcnu02snDLOhMQ21sI7YYM02USGiIa9
         QM5pALv6QEQwVTQ2kFnM2t51jhf7iUfx0tiZxoPq4ZLhmpS/ZNGqoLxbMUslkO+nqBg/
         OEeh8Wk2HeVqsx8g5d7UVcS7fqIQ4+9cPry7M5Q1MrUlq5qpn09p34iTuLgui1yfxg5O
         ea+A==
X-Gm-Message-State: ACgBeo3eX2XTN/YfBDlz034Wn/w7fQ+yYKOt1kti77/c08y8VFnFpYPl
	0rmq79lRp+Af/dTEElBAJRcNiVNk0UU=
X-Google-Smtp-Source: AA6agR5GFHEbT3z4DNyis1GoaeJ3oEdZ7wV5PvlJJ+hMygPf0LGqlUxKGXrQSn9NDTPkp7dL2FLcUQ==
X-Received: by 2002:a63:e25:0:b0:41c:30f7:c39c with SMTP id d37-20020a630e25000000b0041c30f7c39cmr35686323pgl.147.1663243884092;
        Thu, 15 Sep 2022 05:11:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64s: early boot machine check handler
Date: Thu, 15 Sep 2022 22:10:55 +1000
Message-Id: <20220915121058.2288916-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/setup_64.c            | 12 ++++++++++++
 arch/powerpc/kernel/traps.c               | 14 ++++++++++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

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
index d629bcd7213b..29d701a20c41 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1134,6 +1134,7 @@ INT_DEFINE_BEGIN(machine_check)
 INT_DEFINE_END(machine_check)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
+	EARLY_BOOT_FIXUP
 	GEN_INT_ENTRY machine_check_early, virt=0
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
@@ -1198,6 +1199,9 @@ BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+BEGIN_FTR_SECTION
+	bl	machine_check_early_boot
+END_FTR_SECTION(0, 1)     // nop out after boot
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
@@ -3098,7 +3102,7 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 USE_TEXT_SECTION()
 
 /* MSR[RI] should be clear because this uses SRR[01] */
-enable_machine_check:
+_GLOBAL(enable_machine_check)
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r3
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index ce8fc6575eaa..08173eea8977 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
@@ -180,6 +181,14 @@ static void __init fixup_boot_paca(void)
 {
 	/* The boot cpu is started */
 	get_paca()->cpu_start = 1;
+	/*
+	 * Give the early boot machine check stack somewhere to use, use
+	 * half of the init stack. This is a bit hacky but there should not be
+	 * deep stack usage in early init so shouldn't overflow it or overwrite
+	 * things.
+	 */
+	get_paca()->mc_emergency_sp = (void *)&init_thread_union +
+		(THREAD_SIZE/2);
 	/* Allow percpu accesses to work until we setup percpu data */
 	get_paca()->data_offset = 0;
 	/* Mark interrupts soft and hard disabled in PACA */
@@ -357,6 +366,9 @@ void __init early_setup(unsigned long dt_ptr)
 
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

