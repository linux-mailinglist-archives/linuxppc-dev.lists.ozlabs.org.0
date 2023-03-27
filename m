Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 718F36CA4F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXs82VbRz3ffv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dAfq4sk5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dAfq4sk5;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXcP2dGCz3f8B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:46:13 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso10683317pjc.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+LwEzjKOVWBqF3t5GnvSBpTBZW+l/0RVWAHxV4VF+E=;
        b=dAfq4sk56mpYUeSEYIXcaabfPgiM47ZLycmnL9zSYzx/BbaqWG8L5ed/BFoHv9uF5P
         6xNkCcL0LMQ4PYx72DoyKDzKee4atYx6LuEEMEr8rJbA5OmHyzjZgPsHU/C8zrlzW5TX
         +oKZ5gD/tmk42SH5ZFZRVVhrvP9UWi5nUjQ0HZyVVHA7ZizABcGuvO3DgqwHLYmizFpZ
         v+B85N1cFDyFmYtv4uFgHNRJuuPf1quc/bMfIUokI5Q8yjJ6QK7BOWUVubJX2GyC74CD
         v3h8X0PcpeHvXWUtyp7bU9vznQrCG5F/c+gvchTf4nlD8oGV6/K5xCwvb1NahLxFznQz
         jI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+LwEzjKOVWBqF3t5GnvSBpTBZW+l/0RVWAHxV4VF+E=;
        b=VNBVqSJ6NfvwlCllsXVBKbcowoyGbDUJo5CKD/Mzak5z9NOf8wni+N7/NoW/4Pl4U6
         Q+CaOfnDivFOda5ScXd6zYr7Ug8UjbAG2wZkV4S0VVs9TowJnGNGvyRnd39Pblfdcu1P
         ygmHn45VRHLy4culrR/dUlMSHuXyb7pl/6VQOXpcIuhNjppqdtEvbmuvf1juJRCMIVJO
         Bsr/pZhHvtmwaKQ06DsTMn+3jAuneVkeoAlSDrHRnJ/wZ1rfS06R7uUysFfaUgbxo175
         O+f8qVbrsperH15dq36ackAdcspBqNBMcVZ64MO9hUvx0+K3DSzxjJ6Mhse/OwEWu5rJ
         m9qQ==
X-Gm-Message-State: AAQBX9dYIoYbaE2OgNq8Ovs1/Xwhc5wRrgNkaTGiONfPOV68BcBWjqDs
	IBcTmHItpz4RN3lXBy3Xxgzi9KMbWqM=
X-Google-Smtp-Source: AKy350aOcj9Uy5/1APk5enrXFUlIpylm9Lv5rhhXsDrmQsRj8NbirqzeZJwiKp8DXXOwoWoM9JDqxw==
X-Received: by 2002:a17:902:c950:b0:19e:b9f8:1fca with SMTP id i16-20020a170902c95000b0019eb9f81fcamr15021057pla.10.1679921171287;
        Mon, 27 Mar 2023 05:46:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:46:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 12/13] powerpc: Support powernv machine with QEMU TCG
Date: Mon, 27 Mar 2023 22:45:19 +1000
Message-Id: <20230327124520.2707537-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a basic first pass at powernv support using OPAL (skiboot)
firmware.

The ACCEL is a bit clunky, defaulting to kvm for powernv machine, which
isn't right and has to be manually overridden. It also does not yet run
in the run_tests.sh batch process, more work is needed to exclude
certain tests (e.g., rtas) and adjust parameters (e.g., increase memory
size) to allow powernv to work. For now it can run single test cases.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- Don't call opal_init() twice [Cedric review]
- Added BMC device to machine (helps with power-off and getting through
  BIOS with fewer error messages).
- Set machine to little-endian mode with OPAL call if built LE.
- Poll OPAL after making power-off call so IPMI state machine runs and
  it actually powers off QEMU properly.

 lib/powerpc/asm/ppc_asm.h   |  5 +++
 lib/powerpc/asm/processor.h | 10 +++++
 lib/powerpc/hcall.c         |  4 +-
 lib/powerpc/io.c            | 27 +++++++++++++-
 lib/powerpc/io.h            |  6 +++
 lib/powerpc/processor.c     | 10 +++++
 lib/powerpc/setup.c         |  8 ++--
 lib/ppc64/asm/opal.h        | 15 ++++++++
 lib/ppc64/opal-calls.S      | 46 +++++++++++++++++++++++
 lib/ppc64/opal.c            | 74 +++++++++++++++++++++++++++++++++++++
 powerpc/Makefile.ppc64      |  2 +
 powerpc/cstart64.S          |  7 ++++
 powerpc/run                 | 35 ++++++++++++++++--
 13 files changed, 238 insertions(+), 11 deletions(-)
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c

diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index 6299ff5..5eec9d3 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -36,7 +36,12 @@
 #endif /* __BYTE_ORDER__ */
 
 /* Machine State Register definitions: */
+#define MSR_LE_BIT	0
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
+#define MSR_HV_BIT	60			/* Hypervisor mode */
 #define MSR_SF_BIT	63			/* 64-bit mode */
 
+#define SPR_HSRR0	0x13A
+#define SPR_HSRR1	0x13B
+
 #endif /* _ASMPOWERPC_PPC_ASM_H */
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 4ad6612..9b318c3 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -3,6 +3,7 @@
 
 #include <libcflat.h>
 #include <asm/ptrace.h>
+#include <asm/ppc_asm.h>
 
 #ifndef __ASSEMBLY__
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
@@ -43,6 +44,15 @@ static inline void mtmsr(uint64_t msr)
 	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
 }
 
+/*
+ * This returns true on PowerNV / OPAL machines which run in hypervisor
+ * mode. False on pseries / PAPR machines that run in guest mode.
+ */
+static inline bool machine_is_powernv(void)
+{
+	return !!(mfmsr() & (1ULL << MSR_HV_BIT));
+}
+
 static inline uint64_t get_tb(void)
 {
 	return mfspr(SPR_TB);
diff --git a/lib/powerpc/hcall.c b/lib/powerpc/hcall.c
index 711cb1b..37e52f5 100644
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
index a381688..ab7bb84 100644
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
index d4f21ba..943bf14 100644
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
index 411e013..58b67d1 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -78,6 +78,16 @@ void sleep_tb(uint64_t cycles)
 {
 	uint64_t start, end, now;
 
+	if (machine_is_powernv()) {
+		/*
+		 * Could use 'stop' to sleep here which would be interesting.
+		 * stop with ESL=0 should be simple enough, ESL=1 would require
+		 * SRESET based wakeup which is more involved.
+		 */
+		delay(cycles);
+		return;
+	}
+
 	start = now = get_tb();
 	end = start + cycles;
 
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 1be4c03..dd758db 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -18,6 +18,7 @@
 #include <argv.h>
 #include <asm/setup.h>
 #include <asm/page.h>
+#include <asm/processor.h>
 #include <asm/hcall.h>
 #include "io.h"
 
@@ -97,12 +98,13 @@ static void cpu_init(void)
 	tb_hz = params.tb_hz;
 
 	/* Interrupt Endianness */
-
+	if (!machine_is_powernv()) {
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
diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
new file mode 100644
index 0000000..7b1299f
--- /dev/null
+++ b/lib/ppc64/asm/opal.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASMPPC64_HCALL_H_
+#define _ASMPPC64_HCALL_H_
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
index 0000000..1833358
--- /dev/null
+++ b/lib/ppc64/opal-calls.S
@@ -0,0 +1,46 @@
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
+	mr	r13,r2
+
+	/* Set opal return address */
+	LOAD_REG_ADDR(r11, opal_return)
+	mtlr	r11
+	mfmsr	r12
+
+	/* switch to BE when we enter OPAL */
+	li	r11,(1 << MSR_LE_BIT)
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
+	mr	r2,r13;
+	lwz	r11,8(r1);
+	ld	r12,16(r1)
+	mtcr	r11;
+	mtlr	r12
+	blr
diff --git a/lib/ppc64/opal.c b/lib/ppc64/opal.c
new file mode 100644
index 0000000..84ab97b
--- /dev/null
+++ b/lib/ppc64/opal.c
@@ -0,0 +1,74 @@
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
+
+	return ch;
+}
diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
index b0ed2b1..06a7cf6 100644
--- a/powerpc/Makefile.ppc64
+++ b/powerpc/Makefile.ppc64
@@ -17,6 +17,8 @@ cstart.o = $(TEST_DIR)/cstart64.o
 reloc.o  = $(TEST_DIR)/reloc64.o
 
 OBJDIRS += lib/ppc64
+cflatobjs += lib/ppc64/opal.o
+cflatobjs += lib/ppc64/opal-calls.o
 
 # ppc64 specific tests
 tests = $(TEST_DIR)/spapr_vpa.elf
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 0592e03..2c82cd9 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -92,6 +92,13 @@ start:
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
index ee38e07..f4ddd39 100755
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
@@ -12,17 +21,35 @@ fi
 ACCEL=$(get_qemu_accelerator) ||
 	exit $?
 
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
 M+=",accel=$ACCEL"
-command="$qemu -nodefaults $M -bios $FIRMWARE"
+B=""
+if [[ "$MACHINE" == "pseries"* ]] ; then
+	B+="-bios $FIRMWARE"
+fi
+
+D=""
+if [[ "$MACHINE" == "powernv"* ]] ; then
+	D+="-device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10"
+fi
+
+command="$qemu -nodefaults $M $B $D"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
-- 
2.37.2

