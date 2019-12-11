Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E50AF11A88B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:04:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xswt3X7CzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 21:04:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3D1vSAO"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xsrk51xvzDqSF;
 Wed, 11 Dec 2019 21:01:10 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id g4so8736119pjs.10;
 Wed, 11 Dec 2019 02:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbxurzhgMnhPHLwk+6058WrY3qg1vM2esvzSGuyw8qc=;
 b=N3D1vSAORuXB8rEhTEEMlY86eobikbcvd0twilkzzbNvYvkmhsnoWun+xKVySbn3KT
 sFqlmFfRKWlDZ1asx7Oz1ZrM+DJXkvpyma/6tkCbEl4OpybF/8ihnT86Z1ng6GMtRTk5
 IzZU7SU1NtYNakAQsYsPYnIaPw1rj8T9s390oq6si80+DNPsuypZKiNK/EwKKQdJMr1C
 H6kxoC9wpNPpK8Ybh/WdnWQmhL7AD6a2fIJqCnLJ6gZqM2EBFKRqBLiX853nJnczaE3h
 b/AkHomhwqIsYF7rH3ZchhYu0nyTgQIJuXpkjUS/BzU+U3F9kdLxChTzOUXcs/nKzjqg
 oorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbxurzhgMnhPHLwk+6058WrY3qg1vM2esvzSGuyw8qc=;
 b=pWQbcEP6AZhdPmlg8yjPKpQs8zFx5k8sdGjJGt1XYoOtix2oaS01nHMzvNlAtdO6c4
 zS3VKTMSlE2q+oALQ6h4EH0vKgbM89n931SNje/cWEuhjjxR2yXBgLG+oB/YC8SlGSQS
 PCKvAIwJD5HqPjaxvhbdS3J0bAkkLd+XFnwnIuj8TkVU6Y8JYk99GBUtlFLGD6sPqdIe
 SspRawYBSDMschPTOQtFyfu+NUDZdbYUv5d27mny9rk1ErVO8Vcmc3zgMjKtLVTuoeAr
 T3aKJOz/QMXcGlX+1FAA3nZ4TloKGC48agKhsNA8x5tiUQoh9lg2U6ztO588o/CArakF
 Wkxg==
X-Gm-Message-State: APjAAAUtLxdEF198a9LcwhLvJuWq8zg4fKNpqP63GQ2uJL/cTO8YcHJJ
 gXjSYzjr4w9Ap1Aj8qT+86AVqib5
X-Google-Smtp-Source: APXvYqzrjc66TbaG1szpVIpf151Kh361BbIiY4/wZ7Z1gkQD/nYpIA9rbEjWt1nTpf8pKtzn9Y9wRg==
X-Received: by 2002:a17:90a:ba08:: with SMTP id
 s8mr2441461pjr.69.1576058465562; 
 Wed, 11 Dec 2019 02:01:05 -0800 (PST)
Received: from bobo.local0.net ([202.21.15.182])
 by smtp.gmail.com with ESMTPSA id g7sm2344191pfq.33.2019.12.11.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 02:01:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: skiboot@lists.ozlabs.org
Subject: [RFC PATCH] skiboot machine check handler
Date: Wed, 11 Dec 2019 20:01:18 +1000
Message-Id: <20191211100118.544-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide facilities to decode machine checks into human readable
strings, with only sufficient information required to deal with
them sanely.

The old machine check stuff was over engineered. The philosophy
here is that OPAL should correct anything it possibly can, what
it can't handle but the OS might be able to do something with
(e.g., uncorrected memory error or SLB multi-hit), it passes back
to Linux. Anything else, the OS doesn't care. It doesn't want a
huge struct of severities and levels and originators etc that it
can't do anything with -- just provide human readable strings
for what happened and what was done with it.

A Linux driver for this will be able to cope with new processors.

This also uses the same facility to decode machine checks in OPAL
boot.

The code is a bit in flux because it's sitting on top of a few
other RFC patches and not quite complete, just wanted opinions
about it.
---
 core/Makefile.inc  |   2 +-
 core/exceptions.c  |  28 ++++-
 core/mce.c         | 306 +++++++++++++++++++++++++++++++++++++++++++++
 include/opal-api.h |  41 +++++-
 include/skiboot.h  |   6 +
 5 files changed, 379 insertions(+), 4 deletions(-)
 create mode 100644 core/mce.c

diff --git a/core/Makefile.inc b/core/Makefile.inc
index c2b5251d7..cc90fb958 100644
--- a/core/Makefile.inc
+++ b/core/Makefile.inc
@@ -7,7 +7,7 @@ CORE_OBJS = relocate.o console.o stack.o init.o chip.o mem_region.o vm.o
 CORE_OBJS += malloc.o lock.o cpu.o utils.o fdt.o opal.o interrupts.o timebase.o
 CORE_OBJS += opal-msg.o pci.o pci-virt.o pci-slot.o pcie-slot.o
 CORE_OBJS += pci-opal.o fast-reboot.o device.o exceptions.o trace.o affinity.o
-CORE_OBJS += vpd.o platform.o nvram.o nvram-format.o hmi.o
+CORE_OBJS += vpd.o platform.o nvram.o nvram-format.o hmi.o mce.o
 CORE_OBJS += console-log.o ipmi.o time-utils.o pel.o pool.o errorlog.o
 CORE_OBJS += timer.o i2c.o rtc.o flash.o sensor.o ipmi-opal.o
 CORE_OBJS += flash-subpartition.o bitmap.o buddy.o pci-quirk.o powercap.o psr.o
diff --git a/core/exceptions.c b/core/exceptions.c
index 66e8953ce..b04d15125 100644
--- a/core/exceptions.c
+++ b/core/exceptions.c
@@ -32,6 +32,7 @@ static void dump_regs(struct stack_frame *stack)
 
 #define EXCEPTION_MAX_STR 320
 
+#if 0
 static void print_recoverable_mce_vm(struct stack_frame *stack, uint64_t nip, uint64_t msr)
 {
 	char buf[EXCEPTION_MAX_STR];
@@ -46,6 +47,7 @@ static void print_recoverable_mce_vm(struct stack_frame *stack, uint64_t nip, ui
 	dump_regs(stack);
 	prerror("Continuing with VM off\n");
 }
+#endif
 
 void exception_entry(struct stack_frame *stack)
 {
@@ -103,7 +105,11 @@ void exception_entry(struct stack_frame *stack)
 		}
 		break;
 
-	case 0x200:
+	case 0x200: {
+		uint64_t mce_flags, mce_addr;
+		const char *mce_err;
+
+#if 0
 		if (this_cpu()->vm_local_map_inuse)
 			fatal = true; /* local map is non-linear */
 
@@ -114,12 +120,29 @@ void exception_entry(struct stack_frame *stack)
 			stack->srr1 &= ~(MSR_IR|MSR_DR);
 			goto out;
 		}
+#endif
 
 		fatal = true;
 		prerror("***********************************************\n");
 		l += snprintf(buf + l, EXCEPTION_MAX_STR - l,
 			"Fatal MCE at "REG"   ", nip);
-		break;
+		l += snprintf_symbol(buf + l, EXCEPTION_MAX_STR - l, nip);
+		l += snprintf(buf + l, EXCEPTION_MAX_STR - l, "  MSR "REG, msr);
+		prerror("%s\n", buf);
+
+		decode_mce(stack->srr0, stack->srr1, stack->dsisr, stack->dar,
+				&mce_flags, &mce_err, &mce_addr);
+		l = 0;
+		l += snprintf(buf + l, EXCEPTION_MAX_STR - l,
+			"Cause: %s", mce_err);
+		prerror("%s\n", buf);
+		if (mce_flags & MCE_INVOLVED_EA) {
+			l += snprintf(buf + l, EXCEPTION_MAX_STR - l,
+				"Effective address: 0x%016llx", mce_addr);
+			prerror("%s\n", buf);
+		}
+		goto no_symbol;
+	}
 
 	case 0x300:
 		if (vm_dsi(nip, stack->dar, !!(stack->dsisr & DSISR_ISSTORE)))
@@ -195,6 +218,7 @@ void exception_entry(struct stack_frame *stack)
 	l += snprintf_symbol(buf + l, EXCEPTION_MAX_STR - l, nip);
 	l += snprintf(buf + l, EXCEPTION_MAX_STR - l, "  MSR "REG, msr);
 	prerror("%s\n", buf);
+no_symbol:
 	dump_regs(stack);
 	backtrace_r1((uint64_t)stack);
 	if (fatal) {
diff --git a/core/mce.c b/core/mce.c
new file mode 100644
index 000000000..0ebf98380
--- /dev/null
+++ b/core/mce.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: Apache-2.0
+/*
+ * Deal with Machine Check Exceptions
+ *
+ * Copyright 2019 IBM Corp.
+ */
+
+#define pr_fmt(fmt)	"MCE: " fmt
+
+#include <skiboot.h>
+#include <opal.h>
+#include <processor.h>
+#include <cpu.h>
+#include <cpu.h>
+
+static void flush_erat(void)
+{
+	asm volatile("slbia	7");
+}
+
+static void flush_tlb(void)
+{
+	/* XXX */
+}
+
+static void flush_all_tlb(void)
+{
+	/* XXX */
+}
+
+#define SRR1_MC_LOADSTORE(srr1)	((srr1) & PPC_BIT(42))
+
+#define CORRECTION_NONE			0
+#define CORRECTION_ERAT			1
+#define CORRECTION_TLB			2
+#define CORRECTION_TLBIE		3
+
+struct mce_ierror_table {
+	unsigned long srr1_mask;
+	unsigned long srr1_value;
+	uint64_t type;
+	const char *error_str;
+	int correction_type;
+};
+
+static const struct mce_ierror_table mce_p9_ierror_table[] = {
+{ 0x00000000081c0000, 0x0000000000040000,
+  MCE_INSNFETCH | MCE_MEMORY_ERROR | MCE_INVOLVED_EA,
+  "instruction fetch memory uncorrectable error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000000080000,
+  MCE_INSNFETCH | MCE_SLB_ERROR | MCE_INVOLVED_EA,
+  "instruction fetch SLB parity error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x00000000000c0000,
+  MCE_INSNFETCH | MCE_SLB_ERROR | MCE_INVOLVED_EA,
+  "instruction fetch SLB multi-hit error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000000100000,
+  MCE_INSNFETCH | MCE_INVOLVED_EA,
+  "instruction fetch ERAT multi-hit error",
+  CORRECTION_ERAT },
+{ 0x00000000081c0000, 0x0000000000140000,
+  MCE_INSNFETCH | MCE_INVOLVED_EA,
+  "instruction fetch TLB multi-hit error",
+  CORRECTION_TLB },
+{ 0x00000000081c0000, 0x0000000000180000,
+  MCE_INSNFETCH | MCE_MEMORY_ERROR | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "instruction fetch page table access memory uncorrectable error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x00000000001c0000,
+  MCE_INSNFETCH | MCE_INVOLVED_EA,
+  "instruction fetch to foreign address",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000008000000,
+  MCE_INSNFETCH | MCE_INVOLVED_EA,
+  "instruction fetch foreign link time-out",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000008040000,
+  MCE_INSNFETCH | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "instruction fetch page table access foreign link time-out",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x00000000080c0000,
+  MCE_INSNFETCH | MCE_INVOLVED_EA,
+  "instruction fetch real address error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000008100000,
+  MCE_INSNFETCH | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "instruction fetch page table access real address error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000008140000,
+  MCE_LOADSTORE | MCE_IMPRECISE,
+  "store real address asynchronous error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x0000000008180000,
+  MCE_LOADSTORE | MCE_IMPRECISE,
+  "store foreign link time-out asynchronous error",
+  CORRECTION_NONE },
+{ 0x00000000081c0000, 0x00000000081c0000,
+  MCE_INSNFETCH | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "instruction fetch page table access to foreign address",
+  CORRECTION_NONE },
+{ 0 } };
+
+struct mce_derror_table {
+	unsigned long dsisr_value;
+	uint64_t type;
+	const char *error_str;
+	int correction_type;
+};
+
+static const struct mce_derror_table mce_p9_derror_table[] = {
+{ 0x00008000,
+  MCE_LOADSTORE | MCE_MEMORY_ERROR,
+  "load/store memory uncorrectable error",
+  CORRECTION_NONE },
+{ 0x00004000,
+  MCE_LOADSTORE | MCE_MEMORY_ERROR | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "load/store page table access memory uncorrectable error",
+  CORRECTION_NONE },
+{ 0x00002000,
+  MCE_LOADSTORE | MCE_INVOLVED_EA,
+  "load/store foreign link time-out",
+  CORRECTION_NONE },
+{ 0x00001000,
+  MCE_LOADSTORE | MCE_TABLE_WALK | MCE_INVOLVED_EA,
+  "load/store page table access foreign link time-out",
+  CORRECTION_NONE },
+{ 0x00000800,
+  MCE_LOADSTORE | MCE_INVOLVED_EA,
+  "load/store ERAT multi-hit error",
+  CORRECTION_ERAT },
+{ 0x00000400,
+  MCE_LOADSTORE | MCE_INVOLVED_EA,
+  "load/store TLB multi-hit error",
+  CORRECTION_TLB },
+{ 0x00000200,
+  MCE_LOADSTORE,
+  "TLBIE or TLBIEL instruction programming error",
+  CORRECTION_TLBIE },
+{ 0x00000100,
+  MCE_LOADSTORE | MCE_INVOLVED_EA | MCE_SLB_ERROR,
+  "load/store SLB parity error", 
+  CORRECTION_NONE },
+{ 0x00000080,
+  MCE_LOADSTORE | MCE_INVOLVED_EA | MCE_SLB_ERROR,
+  "load/store SLB multi-hit error",
+  CORRECTION_NONE },
+{ 0x00000040,
+  MCE_LOADSTORE | MCE_INVOLVED_EA,
+  "load real address error",
+  CORRECTION_NONE },
+{ 0x00000020,
+  MCE_LOADSTORE | MCE_TABLE_WALK,
+  "load/store page table access real address error",
+  CORRECTION_NONE },
+{ 0x00000010,
+  MCE_LOADSTORE,
+  "load/store to foreign address",
+  CORRECTION_NONE },
+{ 0x00000008,
+  MCE_LOADSTORE | MCE_TABLE_WALK,
+  "load/store page table access to foreign address",
+  CORRECTION_NONE },
+{ 0 } };
+
+static void decode_ierror(const struct mce_ierror_table table[],
+				uint64_t srr1,
+				uint64_t *type,
+				const char **error_str,
+				int *correction_type)
+{
+	int i;
+
+	for (i = 0; table[i].srr1_mask; i++) {
+		if ((srr1 & table[i].srr1_mask) != table[i].srr1_value)
+			continue;
+
+		*type = table[i].type;
+		*error_str = table[i].error_str;
+		*correction_type = table[i].correction_type;
+	}
+}
+
+static void decode_derror(const struct mce_derror_table table[],
+		uint32_t dsisr,
+		uint64_t *type,
+		const char **error_str,
+		int *correction_type)
+{
+	int i;
+
+	for (i = 0; table[i].dsisr_value; i++) {
+		if (!(dsisr & table[i].dsisr_value))
+			continue;
+
+		*type = table[i].type;
+		*error_str = table[i].error_str;
+		*correction_type = table[i].correction_type;
+	}
+}
+
+static void __decode_mce(uint64_t srr0, uint64_t srr1,
+			uint32_t dsisr, uint64_t dar,
+			uint64_t *type, const char **error_str,
+			uint64_t *address, int *correction_type)
+{
+	/*
+	 * On POWER9 DD2.1 and below, it's possible to get a machine check
+	 * caused by a paste instruction where only DSISR bit 25 is set. This
+	 * will result in the MCE handler seeing an unknown event and the kernel
+	 * crashing. An MCE that occurs like this is spurious, so we don't need
+	 * to do anything in terms of servicing it. If there is something that
+	 * needs to be serviced, the CPU will raise the MCE again with the
+	 * correct DSISR so that it can be serviced properly. So detect this
+	 * case and mark it as handled.
+	 */
+	if (SRR1_MC_LOADSTORE(srr1) && dsisr == 0x02000000) {
+		*type = MCE_NO_ERROR;
+		return;
+	}
+
+	*type = MCE_UNKNOWN;
+	*error_str = "unknown error";
+	*address = 0;
+	*correction_type = CORRECTION_NONE;
+
+	if (SRR1_MC_LOADSTORE(srr1)) {
+		decode_derror(mce_p9_derror_table,
+				dsisr, type, error_str, correction_type);
+		if (*type & MCE_INVOLVED_EA)
+			*address = dar;
+	} else {
+		decode_ierror(mce_p9_ierror_table,
+				srr1, type, error_str, correction_type);
+		if (*type & MCE_INVOLVED_EA)
+			*address = srr0;
+	}
+}
+
+void decode_mce(uint64_t srr0, uint64_t srr1,
+			uint32_t dsisr, uint64_t dar,
+			uint64_t *type, const char **error_str,
+			uint64_t *address)
+{
+	int correction_type;
+	__decode_mce(srr0, srr1, dsisr, dar, type, error_str, address,
+			&correction_type);
+}
+
+static int64_t opal_handle_mce(struct opal_mce *opal_mce)
+{
+	uint64_t flags = be64_to_cpu(opal_mce->flags);
+	int correction_type;
+	uint64_t type;
+	uint64_t ea;
+	uint64_t len;
+	const char *error_str;
+	const char *handled_str = ""; /* silence gcc warning */
+	char *outbuf;
+
+	if (proc_gen != proc_gen_p9)
+		return OPAL_UNSUPPORTED;
+
+	__decode_mce(	be64_to_cpu(opal_mce->srr0),
+			be64_to_cpu(opal_mce->srr1),
+			be64_to_cpu(opal_mce->dsisr),
+			be64_to_cpu(opal_mce->dar),
+			&type, &error_str, &ea, &correction_type);
+
+	if (flags & MCE_HANDLE_CORRECT) {
+		/* Attempt to correct */
+		// uint64_t insn = be64_to_cpu(opal_mce->insn);
+
+		if (correction_type == CORRECTION_ERAT) {
+			flush_erat();
+			flags |= MCE_HANDLE_CORRECTED;
+			handled_str = "ERAT flush";
+		} else if (correction_type == CORRECTION_TLB) {
+			flush_tlb();
+			flags |= MCE_HANDLE_CORRECTED;
+			handled_str = "TLB flush";
+		} else if (correction_type == CORRECTION_TLBIE) {
+			flush_all_tlb();
+			flags |= MCE_HANDLE_CORRECTED | MCE_HANDLE_EMULATED;
+			handled_str = "global TLB flush";
+		}
+	}
+
+	opal_mce->flags = cpu_to_be64(flags);
+	opal_mce->type = cpu_to_be64(type);
+	opal_mce->ea = cpu_to_be64(ea);
+
+	len = be64_to_cpu(opal_mce->errorlen);
+	outbuf = (char *)be64_to_cpu(opal_mce->errorbuf);
+	strncpy(outbuf, error_str, len);
+
+	if (flags & MCE_HANDLE_CORRECTED) {
+		len = be64_to_cpu(opal_mce->handledlen);
+		outbuf = (char *)be64_to_cpu(opal_mce->handledbuf);
+		strncpy(outbuf, handled_str, len);
+	}
+
+	return OPAL_SUCCESS;
+}
+opal_call(OPAL_HANDLE_MCE, opal_handle_mce, 1);
diff --git a/include/opal-api.h b/include/opal-api.h
index d7c2368a1..169061a26 100644
--- a/include/opal-api.h
+++ b/include/opal-api.h
@@ -230,7 +230,8 @@
 #define OPAL_GET_SYMBOL				181
 #define OPAL_LOOKUP_SYMBOL			182
 #define OPAL_REGISTER_OS_OPS			183
-#define OPAL_LAST				183
+#define OPAL_HANDLE_MCE				184
+#define OPAL_LAST				184
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1264,6 +1265,44 @@ struct opal_os_ops {
         __be64  os_printf;      /* void printf(int32_t level, const char *str) */
 };
 
+#define MCE_HANDLE_CORRECT		0x0001	/* Attempt to correct */
+#define MCE_HANDLE_CORRECTED		0x1000	/* Error attmped to be corrected */
+#define MCE_HANDLE_EMULATED		0x2000	/* Should advance NIA */
+#define MCE_HANDLE_NEED_INSN		0x4000	/* Try again with insn field */
+
+
+#define MCE_NO_ERROR			0x0001
+#define MCE_UNKNOWN			0x0002
+#define MCE_INSNFETCH			0x0004
+#define MCE_LOADSTORE			0x0008
+#define MCE_TABLE_WALK			0x0010
+#define MCE_IMPRECISE			0x0020
+#define MCE_MEMORY_ERROR		0x0040
+#define MCE_SLB_ERROR			0x0080
+#define MCE_INVOLVED_EA			0x0100
+#define MCE_INVOLVED_PA			0x0200
+
+struct opal_mce {
+	/* Input and output */
+	__be64	flags;	/* How it should be handled / how it was handled */
+
+	/* Inputs */
+	__be64	srr0;
+	__be64	srr1;
+	__be32	dsisr;
+	__be32	reserved;
+	__be64	dar;
+	__be64	insn;	/* Zero if instruction was not read */
+
+	/* Outputs */
+	__be64	type;
+	__be64	ea;
+	__be64	pa;
+	__be64	errorbuf;	/* pointer to buffer for string */
+	__be64	errorlen;
+	__be64	handledbuf;
+	__be64	handledlen;
+};
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/include/skiboot.h b/include/skiboot.h
index b2f4ec3ab..e96643cb0 100644
--- a/include/skiboot.h
+++ b/include/skiboot.h
@@ -181,6 +181,12 @@ extern char __sym_map_start[];
 extern char __sym_map_end[];
 extern size_t snprintf_symbol(char *buf, size_t len, uint64_t addr);
 
+/* RAS */
+void decode_mce(uint64_t srr0, uint64_t srr1,
+			uint32_t dsisr, uint64_t dar,
+			uint64_t *flags, const char **error_str,
+			uint64_t *address);
+
 /* Direct controls */
 extern void direct_controls_init(void);
 extern int64_t opal_signal_system_reset(int cpu_nr);
-- 
2.23.0

