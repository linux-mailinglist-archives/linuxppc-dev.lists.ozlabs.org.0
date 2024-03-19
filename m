Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E238187F909
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:11:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FXmW4C/W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPZg4WWzz3wDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FXmW4C/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKc5rs8z3vZ3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:36 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3bbbc6e51d0so3513211b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835235; x=1711440035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/6DqvhkTh1Tmy+OsiBBzZYDchefCUva9404sTCS9R4=;
        b=FXmW4C/Wti30K4b0HWmv80Orcn0M10VTA8dWIOeFLt4v9Je4m3UMBVvUAnwSaqbO2s
         ueQ7JBV1LccRsyTfHDC3VSBugAI+Ov3zQrXZj5ofe71G+r4vbE3EMMdA+pwNGkXFMh4P
         CDSimwdsCNYlOwBmYr4ePvCKOHVTWy53qM6q0E23MuGjhuWpvyArqMf6EHBl0z7QzCGg
         aYJU1VG35cG2iTwDLDKwsgoK9N8P3CCvQCwxe7aX1xPpK0J0xmS8cQSYUIwHW7gTKf7u
         NYNLfHN2thiMUBNBr+5CSXz+ogyuF40VeBn64m3Cl+fGGINEa77MQ4TabvKaoq/4PR/E
         0iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835235; x=1711440035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/6DqvhkTh1Tmy+OsiBBzZYDchefCUva9404sTCS9R4=;
        b=TEUNRW/WcLlejC4pKhqoSmHXKCr/E+EiQr4xLIlObn+fEbB9hOkyJEiNRxXVNq1bVw
         AOrQ3EhDQToDbvtHmGY4viEL+DJcPiA/ajQQeVzjXNaV8jPCTU3P26zvvcD+5UDkiLsU
         xtRGsnRky8qNOSUmBO2555TstzkEhSPR9YQY2tpqInyVhDcxgblAVYB2+27mmfHwCDF3
         Xl0Tant6a0+7MCeJeK5XWIiR7448hDUu6QVl1eIs2vUUPlZdhSkV3zKLYwwSZ3Y0Yz/8
         QRyDFBMuD07Mw+T73qvXiVa77Tb0jTPsRjAyaUoa4MEJybc7pjJYvEzhnBNhtxJ5GpyZ
         12eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLVj+nmiwKweDsawvUVbrIwmK210HfQfiYyoldvSJmE+XdHjctpF8DuJF9YJdOnA8EXbgf36w87OO2r55o/YZV472H+CktLIMJu4fuMQ==
X-Gm-Message-State: AOJu0Yyt7SSa5+gUQumqxdxwiDlNhey5INOjB4WDVsKH0JFZT35Cwtfe
	WsENIXNbedg6XVn73rmhZToPLROXXMWIDXljkkBYqTDzZs1AuOx8
X-Google-Smtp-Source: AGHT+IEinN0aP5a5VnLQgVv6iEJ8+FJR6SajiFvZvNkRXcLWGAgjAVTzopkl20NxqrXZljs9vhutyQ==
X-Received: by 2002:a05:6808:318c:b0:3c2:3f90:1aa0 with SMTP id cd12-20020a056808318c00b003c23f901aa0mr19090650oib.39.1710835234702;
        Tue, 19 Mar 2024 01:00:34 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 16/35] powerpc: Support powernv machine with QEMU TCG
Date: Tue, 19 Mar 2024 17:59:07 +1000
Message-ID: <20240319075926.2422707-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for QEMU's powernv machine. This uses standard firmware
(skiboot) rather than a minimal firmware shim.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h | 23 +++++++++++
 lib/powerpc/asm/reg.h       |  4 ++
 lib/powerpc/hcall.c         |  4 +-
 lib/powerpc/io.c            | 27 ++++++++++++-
 lib/powerpc/io.h            |  6 +++
 lib/powerpc/processor.c     | 37 ++++++++++++++++++
 lib/powerpc/setup.c         | 14 +++++--
 lib/ppc64/asm/opal.h        | 15 ++++++++
 lib/ppc64/opal-calls.S      | 50 ++++++++++++++++++++++++
 lib/ppc64/opal.c            | 76 +++++++++++++++++++++++++++++++++++++
 powerpc/Makefile.ppc64      |  2 +
 powerpc/cstart64.S          |  7 ++++
 powerpc/run                 | 42 ++++++++++++++++----
 powerpc/unittests.cfg       | 10 ++++-
 14 files changed, 301 insertions(+), 16 deletions(-)
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index e415f9235..9d8061962 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -10,6 +10,8 @@ void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
+extern bool cpu_has_hv;
+
 static inline uint64_t mfspr(int nr)
 {
 	uint64_t ret;
@@ -38,4 +40,25 @@ static inline void mtmsr(uint64_t msr)
 	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
 }
 
+/*
+ * This returns true on PowerNV / OPAL machines which run in hypervisor
+ * mode. False on pseries / PAPR machines that run in guest mode.
+ */
+static inline bool machine_is_powernv(void)
+{
+	return cpu_has_hv;
+}
+
+/*
+ * This returns true on pseries / PAPR / KVM machines which run under a
+ * hypervisor or QEMU pseries machine. False for PowerNV / OPAL.
+ */
+static inline bool machine_is_pseries(void)
+{
+	return !machine_is_powernv();
+}
+
+void enable_mcheck(void);
+void disable_mcheck(void);
+
 #endif /* _ASMPOWERPC_PROCESSOR_H_ */
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index c80b32059..782e75527 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -30,7 +30,11 @@
 #define   MMCR0_PMAO		UL(0x00000080)
 
 /* Machine State Register definitions: */
+#define MSR_LE_BIT	0
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
+#define MSR_HV_BIT	60			/* Hypervisor mode */
 #define MSR_SF_BIT	63			/* 64-bit mode */
 
+#define MSR_ME		UL(0x1000)
+
 #endif
diff --git a/lib/powerpc/hcall.c b/lib/powerpc/hcall.c
index b4d39ac65..45f201315 100644
--- a/lib/powerpc/hcall.c
+++ b/lib/powerpc/hcall.c
@@ -25,7 +25,7 @@ int hcall_have_broken_sc1(void)
 	return r3 == (unsigned long)H_PRIVILEGE;
 }
 
-void putchar(int c)
+void papr_putchar(int c)
 {
 	unsigned long vty = 0;		/* 0 == default */
 	unsigned long nr_chars = 1;
@@ -34,7 +34,7 @@ void putchar(int c)
 	hcall(H_PUT_TERM_CHAR, vty, nr_chars, chars);
 }
 
-int __getchar(void)
+int __papr_getchar(void)
 {
 	register unsigned long r3 asm("r3") = H_GET_TERM_CHAR;
 	register unsigned long r4 asm("r4") = 0; /* 0 == default vty */
diff --git a/lib/powerpc/io.c b/lib/powerpc/io.c
index a381688bc..ab7bb843c 100644
--- a/lib/powerpc/io.c
+++ b/lib/powerpc/io.c
@@ -9,13 +9,33 @@
 #include <asm/spinlock.h>
 #include <asm/rtas.h>
 #include <asm/setup.h>
+#include <asm/processor.h>
 #include "io.h"
 
 static struct spinlock print_lock;
 
+void putchar(int c)
+{
+	if (machine_is_powernv())
+		opal_putchar(c);
+	else
+		papr_putchar(c);
+}
+
+int __getchar(void)
+{
+	if (machine_is_powernv())
+		return __opal_getchar();
+	else
+		return __papr_getchar();
+}
+
 void io_init(void)
 {
-	rtas_init();
+	if (machine_is_powernv())
+		assert(!opal_init());
+	else
+		rtas_init();
 }
 
 void puts(const char *s)
@@ -38,7 +58,10 @@ void exit(int code)
 // FIXME: change this print-exit/rtas-poweroff to chr_testdev_exit(),
 //        maybe by plugging chr-testdev into a spapr-vty.
 	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	rtas_power_off();
+	if (machine_is_powernv())
+		opal_power_off();
+	else
+		rtas_power_off();
 	halt(code);
 	__builtin_unreachable();
 }
diff --git a/lib/powerpc/io.h b/lib/powerpc/io.h
index d4f21ba15..943bf142b 100644
--- a/lib/powerpc/io.h
+++ b/lib/powerpc/io.h
@@ -8,6 +8,12 @@
 #define _POWERPC_IO_H_
 
 extern void io_init(void);
+extern int opal_init(void);
+extern void opal_power_off(void);
 extern void putchar(int c);
+extern void opal_putchar(int c);
+extern void papr_putchar(int c);
+extern int __opal_getchar(void);
+extern int __papr_getchar(void);
 
 #endif
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index 114584024..1b4bb0d61 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -84,6 +84,16 @@ void sleep_tb(uint64_t cycles)
 {
 	uint64_t start, end, now;
 
+	if (!machine_is_pseries()) {
+		/*
+		 * P9/10 Could use 'stop' to sleep here which would be
+		 * interesting.  stop with ESL=0 should be simple enough, ESL=1
+		 * would require SRESET based wakeup which is more involved.
+		 */
+		delay(cycles);
+		return;
+	}
+
 	start = now = get_tb();
 	end = start + cycles;
 
@@ -120,3 +130,30 @@ void usleep(uint64_t us)
 {
 	sleep_tb((us * tb_hz) / 1000000);
 }
+
+static void rfid_msr(uint64_t msr)
+{
+	uint64_t tmp;
+
+	asm volatile(
+		"mtsrr1	%1		\n\
+		 bl	0f		\n\
+		 0:			\n\
+		 mflr	%0		\n\
+		 addi	%0,%0,1f-0b	\n\
+		 mtsrr0	%0		\n\
+		 rfid			\n\
+		 1:			\n"
+		: "=r"(tmp) : "r"(msr) : "lr");
+}
+
+void enable_mcheck(void)
+{
+	/* This is a no-op on pseries */
+	rfid_msr(mfmsr() | MSR_ME);
+}
+
+void disable_mcheck(void)
+{
+	rfid_msr(mfmsr() & ~MSR_ME);
+}
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index d98f66fae..89e5157f2 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -19,6 +19,7 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
+#include <asm/processor.h>
 #include <asm/hcall.h>
 #include "io.h"
 
@@ -85,6 +86,8 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 	}
 }
 
+bool cpu_has_hv;
+
 static void cpu_init(void)
 {
 	struct cpu_set_params params;
@@ -98,12 +101,13 @@ static void cpu_init(void)
 	tb_hz = params.tb_hz;
 
 	/* Interrupt Endianness */
-
+	if (machine_is_pseries()) {
 #if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-        hcall(H_SET_MODE, 1, 4, 0, 0);
+		hcall(H_SET_MODE, 1, 4, 0, 0);
 #else
-        hcall(H_SET_MODE, 0, 4, 0, 0);
+		hcall(H_SET_MODE, 0, 4, 0, 0);
 #endif
+	}
 }
 
 static void mem_init(phys_addr_t freemem_start)
@@ -159,6 +163,10 @@ void setup(const void *fdt)
 	u32 fdt_size;
 	int ret;
 
+	cpu_has_hv = !!(mfmsr() & (1ULL << MSR_HV_BIT));
+
+	enable_mcheck();
+
 	/*
 	 * Before calling mem_init we need to move the fdt and initrd
 	 * to safe locations. We move them to construct the memory
diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
new file mode 100644
index 000000000..de64e2c8d
--- /dev/null
+++ b/lib/ppc64/asm/opal.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASMPPC64_OPAL_H_
+#define _ASMPPC64_OPAL_H_
+
+#define OPAL_SUCCESS				0
+
+#define OPAL_CONSOLE_WRITE			1
+#define OPAL_CONSOLE_READ			2
+#define OPAL_CEC_POWER_DOWN			5
+#define OPAL_POLL_EVENTS			10
+#define OPAL_REINIT_CPUS			70
+# define OPAL_REINIT_CPUS_HILE_BE		(1 << 0)
+# define OPAL_REINIT_CPUS_HILE_LE		(1 << 1)
+
+#endif
diff --git a/lib/ppc64/opal-calls.S b/lib/ppc64/opal-calls.S
new file mode 100644
index 000000000..8cb4c3e91
--- /dev/null
+++ b/lib/ppc64/opal-calls.S
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2016 IBM Corporation.
+ */
+
+#include <asm/ppc_asm.h>
+
+	.text
+	.globl opal_call
+opal_call:
+	mr	r0,r3
+	mr	r3,r4
+	mr	r4,r5
+	mr	r5,r6
+	mr	r6,r7
+	mflr	r11
+	std	r11,16(r1)
+	mfcr	r12
+	stw	r12,8(r1)
+	std	r2,-8(r1) /* use redzone */
+
+	/* Set opal return address */
+	LOAD_REG_ADDR(r11, opal_return)
+	mtlr	r11
+	mfmsr	r12
+	std	r12,-16(r1) /* use redzone */
+
+	/* switch to BE when we enter OPAL */
+	li	r11,(1 << MSR_LE_BIT)
+	ori	r11,r11,(1 << MSR_EE_BIT)
+	andc	r12,r12,r11
+	mtspr	SPR_HSRR1,r12
+
+	/* load the opal call entry point and base */
+	LOAD_REG_ADDR(r11, opal)
+	ld	r12,8(r11)
+	ld	r2,0(r11)
+	mtspr	SPR_HSRR0,r12
+	hrfid
+
+opal_return:
+	FIXUP_ENDIAN
+	ld	r12,-16(r1) /* use redzone */
+	mtmsrd	r12
+	ld	r2,-8(r1) /* use redzone */
+	lwz	r11,8(r1);
+	ld	r12,16(r1)
+	mtcr	r11;
+	mtlr	r12
+	blr
diff --git a/lib/ppc64/opal.c b/lib/ppc64/opal.c
new file mode 100644
index 000000000..63fe42ae6
--- /dev/null
+++ b/lib/ppc64/opal.c
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * OPAL call helpers
+ */
+#include <asm/opal.h>
+#include <libcflat.h>
+#include <libfdt/libfdt.h>
+#include <devicetree.h>
+#include <asm/io.h>
+#include "../powerpc/io.h"
+
+struct opal {
+	uint64_t base;
+	uint64_t entry;
+} opal;
+
+extern int64_t opal_call(int64_t token, int64_t arg1, int64_t arg2, int64_t arg3);
+
+int opal_init(void)
+{
+	const struct fdt_property *prop;
+	int node, len;
+
+	node = fdt_path_offset(dt_fdt(), "/ibm,opal");
+	if (node < 0)
+		return -1;
+
+	prop = fdt_get_property(dt_fdt(), node, "opal-base-address", &len);
+	if (!prop)
+		return -1;
+	opal.base = fdt64_to_cpu(*(uint64_t *)prop->data);
+
+	prop = fdt_get_property(dt_fdt(), node, "opal-entry-address", &len);
+	if (!prop)
+		return -1;
+	opal.entry = fdt64_to_cpu(*(uint64_t *)prop->data);
+
+#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	if (opal_call(OPAL_REINIT_CPUS, OPAL_REINIT_CPUS_HILE_LE, 0, 0) != OPAL_SUCCESS)
+		return -1;
+#endif
+
+	return 0;
+}
+
+extern void opal_power_off(void)
+{
+	opal_call(OPAL_CEC_POWER_DOWN, 0, 0, 0);
+	while (true)
+		opal_call(OPAL_POLL_EVENTS, 0, 0, 0);
+}
+
+void opal_putchar(int c)
+{
+	unsigned long vty = 0;		/* 0 == default */
+	unsigned long nr_chars = cpu_to_be64(1);
+	char ch = c;
+
+	opal_call(OPAL_CONSOLE_WRITE, (int64_t)vty, (int64_t)&nr_chars, (int64_t)&ch);
+}
+
+int __opal_getchar(void)
+{
+	unsigned long vty = 0;		/* 0 == default */
+	unsigned long nr_chars = cpu_to_be64(1);
+	char ch;
+	int rc;
+
+	rc = opal_call(OPAL_CONSOLE_READ, (int64_t)vty, (int64_t)&nr_chars, (int64_t)&ch);
+	if (rc != OPAL_SUCCESS)
+		return -1;
+	if (nr_chars == 0)
+		return -1;
+
+	return ch;
+}
diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
index eb682c226..a18a9628f 100644
--- a/powerpc/Makefile.ppc64
+++ b/powerpc/Makefile.ppc64
@@ -18,6 +18,8 @@ reloc.o  = $(TEST_DIR)/reloc64.o
 
 OBJDIRS += lib/ppc64
 cflatobjs += lib/ppc64/stack.o
+cflatobjs += lib/ppc64/opal.o
+cflatobjs += lib/ppc64/opal-calls.o
 
 # ppc64 specific tests
 tests = $(TEST_DIR)/spapr_vpa.elf
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 07d297f61..405cb0561 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -97,6 +97,13 @@ start:
 	sync
 	isync
 
+	/* powernv machine does not check broken_sc1 */
+	mfmsr	r3
+	li	r4,1
+	sldi	r4,r4,MSR_HV_BIT
+	and.	r3,r3,r4
+	bne	1f
+
 	/* patch sc1 if needed */
 	bl	hcall_have_broken_sc1
 	cmpwi	r3, 0
diff --git a/powerpc/run b/powerpc/run
index 5cdb94194..172f32a46 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -1,5 +1,14 @@
 #!/usr/bin/env bash
 
+get_qemu_machine ()
+{
+	if [ "$MACHINE" ]; then
+		echo $MACHINE
+	else
+		echo pseries
+	fi
+}
+
 if [ -z "$KUT_STANDALONE" ]; then
 	if [ ! -f config.mak ]; then
 		echo "run ./configure && make first. See ./configure -h"
@@ -11,24 +20,41 @@ fi
 
 set_qemu_accelerator || exit $?
 
+MACHINE=$(get_qemu_machine) ||
+	exit $?
+
+if [[ "$MACHINE" == "powernv"* ]] && [ "$ACCEL" = "kvm" ]; then
+	echo "PowerNV machine does not support KVM. ACCEL=tcg must be specified."
+	exit 2
+fi
+
 qemu=$(search_qemu_binary) ||
 	exit $?
 
-if ! $qemu -machine '?' 2>&1 | grep 'pseries' > /dev/null; then
-	echo "$qemu doesn't support pSeries ('-machine pseries'). Exiting."
+if ! $qemu -machine '?' 2>&1 | grep $MACHINE > /dev/null; then
+	echo "$qemu doesn't support '-machine $MACHINE'. Exiting."
 	exit 2
 fi
 
-M='-machine pseries'
+M="-machine $MACHINE"
 M+=",accel=$ACCEL$ACCEL_PROPS"
+B=""
+D=""
+
+if [[ "$MACHINE" == "pseries"* ]] ; then
+	if [[ "$ACCEL" == "tcg" ]] ; then
+		M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
+	elif [[ "$ACCEL" == "kvm" ]] ; then
+		M+=",cap-ccf-assist=off"
+	fi
+	B+="-bios $FIRMWARE"
+fi
 
-if [[ "$ACCEL" == "tcg" ]] ; then
-	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
-elif [[ "$ACCEL" == "kvm" ]] ; then
-	M+=",cap-ccf-assist=off"
+if [[ "$MACHINE" == "powernv"* ]] ; then
+	D+="-device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10"
 fi
 
-command="$qemu -nodefaults $M -bios $FIRMWARE"
+command="$qemu -nodefaults $M $B $D"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 4929e71a1..3c3783ba6 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -15,11 +15,12 @@
 [selftest-setup]
 file = selftest.elf
 smp = 2
-extra_params = -m 256 -append 'setup smp=2 mem=256'
+extra_params = -m 1g -append 'setup smp=2 mem=1024'
 groups = selftest
 
 [selftest-migration]
 file = selftest-migration.elf
+machine = pseries
 groups = selftest migration
 # TODO: Remove accel=kvm once the following TCG migration fix has been merged:
 # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
@@ -40,24 +41,29 @@ groups = migration
 
 [spapr_hcall]
 file = spapr_hcall.elf
+machine = pseries
 
 [spapr_vpa]
 file = spapr_vpa.elf
+machine = pseries
 
 [rtas-get-time-of-day]
 file = rtas.elf
+machine = pseries
 timeout = 5
 extra_params = -append "get-time-of-day date=$(date +%s)"
 groups = rtas
 
 [rtas-get-time-of-day-base]
 file = rtas.elf
+machine = pseries
 timeout = 5
 extra_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
 groups = rtas
 
 [rtas-set-time-of-day]
 file = rtas.elf
+machine = pseries
 extra_params = -append "set-time-of-day"
 timeout = 5
 groups = rtas
@@ -67,6 +73,7 @@ file = emulator.elf
 
 [h_cede_tm]
 file = tm.elf
+machine = pseries
 accel = kvm
 smp = 2,threads=2
 extra_params = -machine cap-htm=on -append "h_cede_tm"
@@ -77,5 +84,6 @@ file = sprs.elf
 
 [sprs-migration]
 file = sprs.elf
+machine = pseries
 extra_params = -append '-w'
 groups = migration
-- 
2.42.0

