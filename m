Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB2899875
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:50:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EiZErR0x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sd81C3kz3wMQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EiZErR0x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKx4rmmz3vdl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:09 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6e89e48d2c0so931917a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306227; x=1712911027; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kLoSxcZGRJ22JZeXKwh24gNky6G5RrmfSvxC64QF9c=;
        b=EiZErR0xPTXp2G4uTtV8rZthZaYFvFa5gWBTKINla+PCfEuvlkELKds+3pUI+xr7/B
         7A1TN5mZHb5NXM7DrA0xXjyT/vFb7b5Clwxvu60vYkDc8F/33/UVEaTQCeU3H1oO+TGL
         QgeiBxJKVUaaUmajC2QGAK4M9V5jgapHmHD1xs0Jvo5OhED0S+e9wkf9mDzji6Z9Ak8b
         U5XxTzC1ap14SlU2hWVPiUXBhk9dhk+tSpbsKbopgTdSVOeZL0WAmnaZH6IfbZN4hf7d
         aPyxIAoR+9HgUxB9tGaf19Fu4tMQddILSGluKMT3unbq6zDf6MrDQqIkia9dySKpMOrg
         mlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306227; x=1712911027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kLoSxcZGRJ22JZeXKwh24gNky6G5RrmfSvxC64QF9c=;
        b=dvscDoSX2u0OoLXlFDpfz07UDsHovYgF9+lZ7zI9IJzUjNyerEFsVkIkCuFU9D0M3B
         cZX0zuhvsXqZxtMw+I8SFBJd6XpI3gQ7zO/jxH8IMyxai+y+tpMCdZDnVe0SyOmcXJTi
         s8bHsK3nNrzGqrFoVlKVOdGgkbA8fNEDrHiDNb2fSYS8Ef0f61Ge0F33jaSQmbrcxCz0
         h3MjSF0unPmYXciUQMZeBBtasHw5IFbMAzn5sqDMa2fY7OjmTVpRE1oF6cYJnvkdyJ2t
         oDdjsCDINDZBkzyDXMsIZYLOUgNffiTe20LXBf8r3OKX79RL7Zcuc/md7e9cSDzhSg7K
         rRzg==
X-Forwarded-Encrypted: i=1; AJvYcCW0X3UKDOjIXMMq7ueK6G8yy25I5dnYlm5VC/1LVGpEI/u3BOlVxUkLMOuQnMFMYKT2urfjkCte9wmCXkyDPO+H5KiFn9Z384MdISuDHg==
X-Gm-Message-State: AOJu0YwMtw/Fx/9MIQFB6kdKHyyQGj95b2Djk1SO6Iuyh+eGKqpAXkpG
	JdpRSzEs9LgXh3UUTTsbWspIX8CKNejzU02MZ8f3IHNziMpmdUKnV517fVkO
X-Google-Smtp-Source: AGHT+IFKEDwbsjsVOGsiJIZr9F6FthUPPuMRgWOzs6FtcWLTFFOiQJHm+AH4DW5Sks2gonk3LP+hGQ==
X-Received: by 2002:a05:6830:1e61:b0:6e6:af64:3581 with SMTP id m1-20020a0568301e6100b006e6af643581mr1014768otr.12.1712306227436;
        Fri, 05 Apr 2024 01:37:07 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 19/35] powerpc: general interrupt tests
Date: Fri,  5 Apr 2024 18:35:20 +1000
Message-ID: <20240405083539.374995-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add basic testing of various kinds of interrupts, machine check,
page fault, illegal, decrementer, trace, syscall, etc.

This has a known failure on QEMU TCG pseries machines where MSR[ME]
can be incorrectly set to 0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |   4 +
 lib/powerpc/asm/reg.h       |  17 ++
 lib/powerpc/setup.c         |  11 +
 lib/ppc64/asm/ptrace.h      |  16 ++
 powerpc/Makefile.common     |   3 +-
 powerpc/interrupts.c        | 414 ++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg       |   3 +
 7 files changed, 467 insertions(+), 1 deletion(-)
 create mode 100644 powerpc/interrupts.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index cf1b9d8ff..eed37d1f4 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -11,7 +11,11 @@ void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
 extern bool cpu_has_hv;
+extern bool cpu_has_power_mce;
+extern bool cpu_has_siar;
 extern bool cpu_has_heai;
+extern bool cpu_has_prefix;
+extern bool cpu_has_sc_lev;
 
 static inline uint64_t mfspr(int nr)
 {
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index 782e75527..d6097f48f 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -5,8 +5,15 @@
 
 #define UL(x) _AC(x, UL)
 
+#define SPR_DSISR	0x012
+#define SPR_DAR		0x013
+#define SPR_DEC		0x016
 #define SPR_SRR0	0x01a
 #define SPR_SRR1	0x01b
+#define   SRR1_PREFIX		UL(0x20000000)
+#define SPR_FSCR	0x099
+#define   FSCR_PREFIX		UL(0x2000)
+#define SPR_HFSCR	0x0be
 #define SPR_TB		0x10c
 #define SPR_SPRG0	0x110
 #define SPR_SPRG1	0x111
@@ -22,12 +29,17 @@
 #define   PVR_VER_POWER8	UL(0x004d0000)
 #define   PVR_VER_POWER9	UL(0x004e0000)
 #define   PVR_VER_POWER10	UL(0x00800000)
+#define SPR_HDEC	0x136
 #define SPR_HSRR0	0x13a
 #define SPR_HSRR1	0x13b
+#define SPR_LPCR	0x13e
+#define   LPCR_HDICE		UL(0x1)
+#define SPR_HEIR	0x153
 #define SPR_MMCR0	0x31b
 #define   MMCR0_FC		UL(0x80000000)
 #define   MMCR0_PMAE		UL(0x04000000)
 #define   MMCR0_PMAO		UL(0x00000080)
+#define SPR_SIAR	0x31c
 
 /* Machine State Register definitions: */
 #define MSR_LE_BIT	0
@@ -35,6 +47,11 @@
 #define MSR_HV_BIT	60			/* Hypervisor mode */
 #define MSR_SF_BIT	63			/* 64-bit mode */
 
+#define MSR_DR		UL(0x0010)
+#define MSR_IR		UL(0x0020)
+#define MSR_BE		UL(0x0200)		/* Branch Trace Enable */
+#define MSR_SE		UL(0x0400)		/* Single Step Enable */
+#define MSR_EE		UL(0x8000)
 #define MSR_ME		UL(0x1000)
 
 #endif
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 3c81aee9e..9b665f59c 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -87,7 +87,11 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 }
 
 bool cpu_has_hv;
+bool cpu_has_power_mce; /* POWER CPU machine checks */
+bool cpu_has_siar;
 bool cpu_has_heai;
+bool cpu_has_prefix;
+bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
 
 static void cpu_init(void)
 {
@@ -112,15 +116,22 @@ static void cpu_init(void)
 
 	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
 	case PVR_VER_POWER10:
+		cpu_has_prefix = true;
+		cpu_has_sc_lev = true;
 	case PVR_VER_POWER9:
 	case PVR_VER_POWER8E:
 	case PVR_VER_POWER8NVL:
 	case PVR_VER_POWER8:
+		cpu_has_power_mce = true;
 		cpu_has_heai = true;
+		cpu_has_siar = true;
 		break;
 	default:
 		break;
 	}
+
+	if (!cpu_has_hv) /* HEIR is HV register */
+		cpu_has_heai = false;
 }
 
 static void mem_init(phys_addr_t freemem_start)
diff --git a/lib/ppc64/asm/ptrace.h b/lib/ppc64/asm/ptrace.h
index 12de7499b..db263a59e 100644
--- a/lib/ppc64/asm/ptrace.h
+++ b/lib/ppc64/asm/ptrace.h
@@ -5,6 +5,9 @@
 #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack frame */
 
 #ifndef __ASSEMBLY__
+
+#include <asm/reg.h>
+
 struct pt_regs {
 	unsigned long gpr[32];
 	unsigned long nip;
@@ -17,6 +20,19 @@ struct pt_regs {
 	unsigned long _pad; /* stack must be 16-byte aligned */
 };
 
+static inline bool regs_is_prefix(volatile struct pt_regs *regs)
+{
+	return regs->msr & SRR1_PREFIX;
+}
+
+static inline void regs_advance_insn(struct pt_regs *regs)
+{
+	if (regs_is_prefix(regs))
+		regs->nip += 8;
+	else
+		regs->nip += 4;
+}
+
 #define STACK_INT_FRAME_SIZE    (sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 1e181da69..68165fc25 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -12,7 +12,8 @@ tests-common = \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
 	$(TEST_DIR)/tm.elf \
-	$(TEST_DIR)/sprs.elf
+	$(TEST_DIR)/sprs.elf \
+	$(TEST_DIR)/interrupts.elf
 
 tests-all = $(tests-common) $(tests)
 all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
new file mode 100644
index 000000000..552c48ef2
--- /dev/null
+++ b/powerpc/interrupts.c
@@ -0,0 +1,414 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * Test interrupts
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
+ */
+#include <libcflat.h>
+#include <util.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/setup.h>
+#include <asm/handlers.h>
+#include <asm/hcall.h>
+#include <asm/processor.h>
+#include <asm/time.h>
+#include <asm/barrier.h>
+
+static volatile bool got_interrupt;
+static volatile struct pt_regs recorded_regs;
+
+static void mce_handler(struct pt_regs *regs, void *opaque)
+{
+	bool *is_fetch = opaque;
+
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	if (*is_fetch)
+		regs->nip = regs->link;
+	else
+		regs_advance_insn(regs);
+}
+
+static void fault_handler(struct pt_regs *regs, void *opaque)
+{
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	if (regs->trap == 0x400 || regs->trap == 0x480)
+		regs->nip = regs->link;
+	else
+		regs_advance_insn(regs);
+}
+
+static void test_mce(void)
+{
+	unsigned long addr = -4ULL;
+	uint8_t tmp;
+	bool is_fetch;
+
+	report_prefix_push("mce");
+
+	handle_exception(0x200, mce_handler, &is_fetch);
+	handle_exception(0x300, fault_handler, NULL);
+	handle_exception(0x380, fault_handler, NULL);
+	handle_exception(0x400, fault_handler, NULL);
+	handle_exception(0x480, fault_handler, NULL);
+
+	if (machine_is_powernv()) {
+		enable_mcheck();
+	} else {
+		report(mfmsr() & MSR_ME, "pseries machine has MSR[ME]=1");
+		if (!(mfmsr() & MSR_ME)) { /* try to fix it */
+			enable_mcheck();
+		}
+		if (mfmsr() & MSR_ME) {
+			disable_mcheck();
+			report(mfmsr() & MSR_ME, "pseries is unable to change MSR[ME]");
+			if (!(mfmsr() & MSR_ME)) { /* try to fix it */
+				enable_mcheck();
+			}
+		}
+	}
+
+	is_fetch = false;
+	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
+
+	report(got_interrupt, "MCE on access to invalid real address");
+	if (got_interrupt) {
+		report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
+		if (cpu_has_power_mce)
+			report(recorded_regs.msr & (1ULL << 21), "d-side MCE sets SRR1[42]");
+		got_interrupt = false;
+	}
+
+	is_fetch = true;
+	asm volatile("mtctr %0 ; bctrl" :: "r"(addr) : "ctr", "lr");
+	report(got_interrupt, "MCE on fetch from invalid real address");
+	if (got_interrupt) {
+		report(recorded_regs.nip == addr, "MCE sets SRR0 correctly");
+		if (cpu_has_power_mce)
+			report(!(recorded_regs.msr & (1ULL << 21)), "i-side MCE clears SRR1[42]");
+		got_interrupt = false;
+	}
+
+	handle_exception(0x200, NULL, NULL);
+	handle_exception(0x300, NULL, NULL);
+	handle_exception(0x380, NULL, NULL);
+	handle_exception(0x400, NULL, NULL);
+	handle_exception(0x480, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+static void dseg_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs_advance_insn(regs);
+	regs->msr &= ~MSR_DR;
+}
+
+static void test_dseg(void)
+{
+	uint64_t msr, tmp;
+
+	report_prefix_push("data segment");
+
+	/* Some HV start in radix mode and need 0x300 */
+	handle_exception(0x300, &dseg_handler, NULL);
+	handle_exception(0x380, &dseg_handler, NULL);
+
+	asm volatile(
+"		mfmsr	%0		\n \
+		ori	%0,%0,%2	\n \
+		mtmsrd	%0		\n \
+		lbz	%1,0(0)		"
+		: "=r"(msr), "=r"(tmp) : "i"(MSR_DR): "memory");
+
+	report(got_interrupt, "interrupt on NULL dereference");
+	got_interrupt = false;
+
+	handle_exception(0x300, NULL, NULL);
+	handle_exception(0x380, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+static void dec_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs->msr &= ~MSR_EE;
+}
+
+static void test_dec(void)
+{
+	uint64_t msr;
+	uint64_t tb;
+
+	report_prefix_push("decrementer");
+
+	handle_exception(0x900, &dec_handler, NULL);
+
+	asm volatile(
+"		mtdec	%1		\n \
+		mfmsr	%0		\n \
+		ori	%0,%0,%2	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "r"(10000), "i"(MSR_EE): "memory");
+
+	tb = get_tb();
+	while (!got_interrupt) {
+		if (get_tb() - tb > tb_hz * 5)
+			break; /* timeout 5s */
+	}
+
+	report(got_interrupt, "interrupt on decrementer underflow");
+	got_interrupt = false;
+
+	handle_exception(0x900, NULL, NULL);
+
+	if (!machine_is_powernv())
+		goto done; /* Skip HV tests */
+
+	handle_exception(0x980, &dec_handler, NULL);
+
+	mtspr(SPR_LPCR, mfspr(SPR_LPCR) | LPCR_HDICE);
+	asm volatile(
+"		mtspr	0x136,%1	\n \
+		mtdec	%3		\n \
+		mfmsr	%0		\n \
+		ori	%0,%0,%2	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "r"(10000), "i"(MSR_EE), "r"(0x7fffffff): "memory");
+
+	tb = get_tb();
+	while (!got_interrupt) {
+		if (get_tb() - tb > tb_hz * 5)
+			break; /* timeout 5s */
+	}
+
+	mtspr(SPR_LPCR, mfspr(SPR_LPCR) & ~LPCR_HDICE);
+
+	report(got_interrupt, "interrupt on hdecrementer underflow");
+	got_interrupt = false;
+
+	handle_exception(0x980, NULL, NULL);
+
+done:
+	report_prefix_pop();
+}
+
+
+static volatile uint64_t recorded_heir;
+
+static void heai_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs_advance_insn(regs);
+	if (cpu_has_heai)
+		recorded_heir = mfspr(SPR_HEIR);
+}
+
+static void program_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs_advance_insn(regs);
+}
+
+/*
+ * This tests invalid instruction handling. powernv (HV) should take an
+ * HEAI interrupt with the HEIR SPR set to the instruction image. pseries
+ * (guest) should take a program interrupt. CPUs which support prefix
+ * should report prefix instruction in (H)SRR1[34].
+ */
+static void test_illegal(void)
+{
+	report_prefix_push("illegal instruction");
+
+	if (machine_is_powernv()) {
+		handle_exception(0xe40, &heai_handler, NULL);
+	} else {
+		handle_exception(0x700, &program_handler, NULL);
+	}
+
+	asm volatile(".long 0x12345678" ::: "memory");
+	report(got_interrupt, "interrupt on invalid instruction");
+	got_interrupt = false;
+	if (cpu_has_heai)
+		report(recorded_heir == 0x12345678, "HEIR: 0x%08lx", recorded_heir);
+	report(!regs_is_prefix(&recorded_regs), "(H)SRR1 prefix bit clear");
+
+	if (cpu_has_prefix) {
+		asm volatile(".balign 8 ; .long 0x04000123; .long 0x00badc0d");
+		report(got_interrupt, "interrupt on invalid prefix instruction");
+		got_interrupt = false;
+		if (cpu_has_heai)
+			report(recorded_heir == 0x0400012300badc0d, "HEIR: 0x%08lx", recorded_heir);
+		report(regs_is_prefix(&recorded_regs), "(H)SRR1 prefix bit set");
+	}
+
+	handle_exception(0xe40, NULL, NULL);
+	handle_exception(0x700, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+static void sc_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+}
+
+static void test_sc(void)
+{
+	report_prefix_push("syscall");
+
+	handle_exception(0xc00, &sc_handler, NULL);
+
+	asm volatile("sc 0" ::: "memory");
+
+	report(got_interrupt, "interrupt on sc 0 instruction");
+	got_interrupt = false;
+	if (cpu_has_sc_lev)
+		report(((recorded_regs.msr >> 20) & 0x3) == 0, "SRR1 set LEV=0");
+	if (machine_is_powernv()) {
+		asm volatile("sc 1" ::: "memory");
+
+		report(got_interrupt, "interrupt on sc 1 instruction");
+		got_interrupt = false;
+		if (cpu_has_sc_lev)
+			report(((recorded_regs.msr >> 20) & 0x3) == 1, "SRR1 set LEV=1");
+	}
+
+	handle_exception(0xc00, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+
+static void trace_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs->msr &= ~(MSR_SE | MSR_BE);
+}
+
+static void program_trace_handler(struct pt_regs *regs, void *data)
+{
+	regs->msr &= ~(MSR_SE | MSR_BE);
+	regs->nip += 4;
+}
+
+extern char trace_insn[];
+extern char trace_insn2[];
+extern char trace_insn3[];
+extern char trace_rfid[];
+
+static void test_trace(void)
+{
+	unsigned long msr;
+
+	report_prefix_push("trace");
+
+	handle_exception(0xd00, &trace_handler, NULL);
+
+	msr = mfmsr() | MSR_SE;
+	asm volatile(
+	"	mtmsr	%0		\n"
+	".global trace_insn		\n"
+	"trace_insn:			\n"
+	"	nop			\n"
+	: : "r"(msr) : "memory");
+
+	report(got_interrupt, "interrupt on single step");
+	got_interrupt = false;
+	report(recorded_regs.nip == (unsigned long)trace_insn + 4,
+			"single step interrupt at the correct address");
+	if (cpu_has_siar)
+		report(mfspr(SPR_SIAR) == (unsigned long)trace_insn,
+			"single step recorded SIAR at the correct address");
+
+	msr = mfmsr() | MSR_SE;
+	asm volatile(
+	"	mtmsr	%0		\n"
+	".global trace_insn2		\n"
+	"trace_insn2:			\n"
+	"	b	1f		\n"
+	"	nop			\n"
+	"1:				\n"
+	: : "r"(msr) : "memory");
+
+	report(got_interrupt, "interrupt on single step branch");
+	got_interrupt = false;
+	report(recorded_regs.nip == (unsigned long)trace_insn2 + 8,
+			"single step interrupt at the correct address");
+	if (cpu_has_siar)
+		report(mfspr(SPR_SIAR) == (unsigned long)trace_insn2,
+			"single step recorded SIAR at the correct address");
+
+	msr = mfmsr() | MSR_BE;
+	asm volatile(
+	"	mtmsr	%0		\n"
+	".global trace_insn3		\n"
+	"trace_insn3:			\n"
+	"	nop			\n"
+	"	b	1f		\n"
+	"	nop			\n"
+	"1:				\n"
+	: : "r"(msr) : "memory");
+
+	report(got_interrupt, "interrupt on branch trace");
+	got_interrupt = false;
+	report(recorded_regs.nip == (unsigned long)trace_insn3 + 12,
+			"branch trace interrupt at the correct address");
+	if (cpu_has_siar)
+		report(mfspr(SPR_SIAR) == (unsigned long)trace_insn3 + 4,
+			"branch trace recorded SIAR at the correct address");
+
+	handle_exception(0x700, &program_trace_handler, NULL);
+	msr = mfmsr() | MSR_SE;
+	asm volatile(
+	"	mtmsr	%0		\n"
+	"	trap			\n"
+	: : "r"(msr) : "memory");
+
+	report(!got_interrupt, "no interrupt on single step trap");
+	got_interrupt = false;
+	handle_exception(0x700, NULL, NULL);
+
+	msr = mfmsr() | MSR_SE;
+	mtspr(SPR_SRR0, (unsigned long)trace_rfid);
+	mtspr(SPR_SRR1, mfmsr());
+	asm volatile(
+	"	mtmsr	%0		\n"
+	"	rfid			\n"
+	".global trace_rfid		\n"
+	"trace_rfid:			\n"
+	: : "r"(msr) : "memory");
+
+	report(!got_interrupt, "no interrupt on single step rfid");
+	got_interrupt = false;
+	handle_exception(0xd00, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+
+int main(int argc, char **argv)
+{
+	report_prefix_push("interrupts");
+
+	if (cpu_has_power_mce)
+		test_mce();
+	test_dseg();
+	test_illegal();
+	test_dec();
+	test_sc();
+	test_trace();
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 3c3783ba6..9fdc86b66 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -71,6 +71,9 @@ groups = rtas
 [emulator]
 file = emulator.elf
 
+[interrupts]
+file = interrupts.elf
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.43.0

