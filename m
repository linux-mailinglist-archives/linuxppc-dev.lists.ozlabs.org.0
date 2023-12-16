Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B28159B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:03:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NxSZTlaU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnqr4zrdz3wGD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:03:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NxSZTlaU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQL4xw7z3d8n
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:58 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6d47bb467a9so68583b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734296; x=1703339096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAPoyKxH20K5lt+QIsl+GfdSO8pdNuy5BuwMbLCV0hc=;
        b=NxSZTlaUKw/8fGzcWqdO4vxYC+NTmikeDRnuDTi8c1Yjp6JmZYAslM6DXNqqTld4S8
         pPbrpVip3ELCiLQH3o5MSQ226I13Bh5I9b4pQIEfK//dgOMPt6BgcrE9dlwZ0d/XKtuS
         ePl67PSxogtBELY6cCiVARXQs6zFsy+GXsAZ5ncTSmqXqV7ikuzwzNhz2CyWfbkciyWH
         R3NLrIfT5kSbVCfQsBO1C5HjN44JqBPKD0l1KOKqze4E+GJ/27ud9H4qyAhCR0hJayEG
         qXYCSav34cHKUpzhLwdlTDypAqlpMlef87b11/vjig77X47apkCahJoiKVLnh9W9tqYU
         FcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734296; x=1703339096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAPoyKxH20K5lt+QIsl+GfdSO8pdNuy5BuwMbLCV0hc=;
        b=XoSzE0Ymt54WuX9kk+4WvqQ0djgX3/QTxj9v6LypzlMS6B1IRN08XIyBhXnoGa4XSf
         jL3Jj7j8wjm0z6UpNicpEnZ/3DhA02241qWN1rrAC5dXwFDmB8pqV9zPliMq5n9IAREG
         HaP0LuSBj7pQvao38avhv+MuC674SZ+G6CT6ceEsgrULMd+M0hsk1cwyJNLSLxKHo5+H
         eGZa6nf73uNDhVwmZjQ+KFWJh7etOxUb1Nx84aGdvLch9SOevtxaMHMxnWGQviV0PU+u
         hv7D/QTulU4vCANqjyZcm2ZRq0fLZTUg7tWDhaLSAwAvIif9HWyiBw7SRfe9QkWI9ETs
         EAZw==
X-Gm-Message-State: AOJu0YzU4HW6QqZ/QvflTNEDOUX705ge1nmdrwXnF63pfGNpCaUcpuPX
	eE255BLi6Yo+vDrXpOEw5DQ=
X-Google-Smtp-Source: AGHT+IF2CwKxuoQ5KUzNjpZZuWFg9dZfsya21mdXhtirsE1Xg1y5RR+tvPqfd4e8mR/5ZqTxsz/e3A==
X-Received: by 2002:a05:6a20:e10e:b0:194:2cbf:5a29 with SMTP id kr14-20020a056a20e10e00b001942cbf5a29mr17883pzb.1.1702734295992;
        Sat, 16 Dec 2023 05:44:55 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 24/29] powerpc: interrupt tests
Date: Sat, 16 Dec 2023 23:42:51 +1000
Message-ID: <20231216134257.1743345-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add basic testing of various kinds of interrupts, machine check,
page fault, illegal, decrementer, trace, syscall, etc.

This has a known failure on QEMU TCG pseries machines where MSR[ME]
can be incorrectly set to 0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/ppc_asm.h |  21 +-
 powerpc/Makefile.common   |   3 +-
 powerpc/interrupts.c      | 422 ++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg     |   3 +
 4 files changed, 445 insertions(+), 4 deletions(-)
 create mode 100644 powerpc/interrupts.c

diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index ef2d91dd..778e78ee 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -35,17 +35,32 @@
 
 #endif /* __BYTE_ORDER__ */
 
+#define SPR_DSISR	0x012
+#define SPR_DAR		0x013
+#define SPR_DEC		0x016
+#define SPR_SRR0	0x01A
+#define SPR_SRR1	0x01B
+#define SPR_FSCR	0x099
+#define   FSCR_PREFIX	0x2000
+#define SPR_HDEC	0x136
 #define SPR_HSRR0	0x13A
 #define SPR_HSRR1	0x13B
+#define SPR_LPCR	0x13E
+#define   LPCR_HDICE	0x1UL
+#define SPR_HEIR	0x153
+#define SPR_SIAR	0x31C
 
 /* Machine State Register definitions: */
 #define MSR_LE_BIT	0
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
 #define MSR_HV_BIT	60			/* Hypervisor mode */
 #define MSR_SF_BIT	63			/* 64-bit mode */
-#define MSR_ME		0x1000ULL
 
-#define SPR_HSRR0	0x13A
-#define SPR_HSRR1	0x13B
+#define MSR_DR		0x0010ULL
+#define MSR_IR		0x0020ULL
+#define MSR_BE		0x0200ULL		/* Branch Trace Enable */
+#define MSR_SE		0x0400ULL		/* Single Step Enable */
+#define MSR_EE		0x8000ULL
+#define MSR_ME		0x1000ULL
 
 #endif /* _ASMPOWERPC_PPC_ASM_H */
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index a7af225b..b340a53b 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -11,7 +11,8 @@ tests-common = \
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
index 00000000..3217b15e
--- /dev/null
+++ b/powerpc/interrupts.c
@@ -0,0 +1,422 @@
+/*
+ * Test interrupts
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <libcflat.h>
+#include <util.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/handlers.h>
+#include <asm/hcall.h>
+#include <asm/processor.h>
+#include <asm/barrier.h>
+
+#define SPR_LPCR	0x13E
+#define LPCR_HDICE	0x1UL
+#define SPR_DEC		0x016
+#define SPR_HDEC	0x136
+
+#define MSR_DR		0x0010ULL
+#define MSR_IR		0x0020ULL
+#define MSR_EE		0x8000ULL
+#define MSR_ME		0x1000ULL
+
+static bool cpu_has_heir(void)
+{
+	uint32_t pvr = mfspr(287);	/* Processor Version Register */
+
+	if (!machine_is_powernv())
+		return false;
+
+	/* POWER6 has HEIR, but QEMU powernv support does not go that far */
+	switch (pvr >> 16) {
+	case 0x4b:			/* POWER8E */
+	case 0x4c:			/* POWER8NVL */
+	case 0x4d:			/* POWER8 */
+	case 0x4e:			/* POWER9 */
+	case 0x80:			/* POWER10 */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cpu_has_prefix(void)
+{
+	uint32_t pvr = mfspr(287);	/* Processor Version Register */
+	switch (pvr >> 16) {
+	case 0x80:			/* POWER10 */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cpu_has_lev_in_srr1(void)
+{
+	uint32_t pvr = mfspr(287);	/* Processor Version Register */
+	switch (pvr >> 16) {
+	case 0x80:			/* POWER10 */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool regs_is_prefix(volatile struct pt_regs *regs)
+{
+	return (regs->msr >> (63-34)) & 1;
+}
+
+static void regs_advance_insn(struct pt_regs *regs)
+{
+	if (regs_is_prefix(regs))
+		regs->nip += 8;
+	else
+		regs->nip += 4;
+}
+
+static volatile bool got_interrupt;
+static volatile struct pt_regs recorded_regs;
+
+static void mce_handler(struct pt_regs *regs, void *opaque)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs_advance_insn(regs);
+}
+
+static void test_mce(void)
+{
+	unsigned long addr = -4ULL;
+	uint8_t tmp;
+
+	handle_exception(0x200, mce_handler, NULL);
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
+	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
+
+	report(got_interrupt, "MCE on access to invalid real address");
+	report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
+	got_interrupt = false;
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
+	while (!got_interrupt)
+		;
+
+	report(got_interrupt, "interrupt on decrementer underflow");
+	got_interrupt = false;
+
+	handle_exception(0x900, NULL, NULL);
+
+	if (!machine_is_powernv())
+		goto done;
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
+	while (!got_interrupt)
+		;
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
+	if (cpu_has_heir())
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
+	if (cpu_has_heir())
+		report(recorded_heir == 0x12345678, "HEIR: 0x%08lx", recorded_heir);
+	report(!regs_is_prefix(&recorded_regs), "(H)SRR1 prefix bit: %d", regs_is_prefix(&recorded_regs));
+
+	if (cpu_has_prefix()) {
+		mtspr(SPR_FSCR, mfspr(SPR_FSCR) | FSCR_PREFIX);
+		asm volatile(".balign 8 ; .long 0x04000123; .long 0x00badc0d");
+		report(got_interrupt, "interrupt on invalid prefix instruction");
+		got_interrupt = false;
+		if (cpu_has_heir())
+			report(recorded_heir == 0x0400012300badc0d, "HEIR: 0x%08lx", recorded_heir);
+		report(regs_is_prefix(&recorded_regs), "(H)SRR1 prefix bit: %d", regs_is_prefix(&recorded_regs));
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
+	if (cpu_has_lev_in_srr1())
+		report(((recorded_regs.msr >> 20) & 0x3) == 0, "SRR1 set LEV=0");
+	if (machine_is_powernv()) {
+		asm volatile("sc 1" ::: "memory");
+
+		report(got_interrupt, "interrupt on sc 1 instruction");
+		got_interrupt = false;
+		if (cpu_has_lev_in_srr1())
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
+	report(mfspr(SPR_SIAR) == (unsigned long)trace_insn,
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
+	report(mfspr(SPR_SIAR) == (unsigned long)trace_insn2,
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
+	report(mfspr(SPR_SIAR) == (unsigned long)trace_insn3 + 4,
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
+	test_mce();
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
index 5d6ba852..1ae9a00e 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -69,6 +69,9 @@ groups = rtas
 [emulator]
 file = emulator.elf
 
+[interrupts]
+file = interrupts.elf
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.42.0

