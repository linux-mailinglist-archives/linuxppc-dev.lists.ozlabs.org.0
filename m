Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9E11C4CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:16:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YL8r1pH1zDqv2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 15:16:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RMIvKHcF"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YL4Q1KqzzDqvv;
 Thu, 12 Dec 2019 15:12:52 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 2so34093pfg.12;
 Wed, 11 Dec 2019 20:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3SeNtT3ppa9zP3L9+Z59yPkoIWupuDAHL8un8kHrdw=;
 b=RMIvKHcFZNVRO9P0ZN4fppNBzVbHyhmoxZ7Xs4Bi2aEhs7GDN/Cyrf3CaQTN6rJPh4
 Wegpd0+DPobU4ZKhUIZ6tBr+FUi2nVbwKhFn6wC3v2g26PuHOiI6Y3VR7ivV/cPISK58
 HAz7mP2rLsbw1z4C6z5KlCGsHw+wL8Ui2Srcr2ujRy1FqA+CRN+pANbvUPzAABxzgFDo
 aYoDdnPaRn70ug6PXtyucyEeUAScp8wZyocriAqmw5WwcTQITsvrN7oIC9/m/yDavtxV
 QufgLKuZuQ7W40Zem6AYs4BOpkvb1J15yBqJyHmg3Rq4/U5WUiNAjvV5t5BE2dWQYi/m
 HoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3SeNtT3ppa9zP3L9+Z59yPkoIWupuDAHL8un8kHrdw=;
 b=Zkwyk4U6nqljhmS/iBNY1q+1E69n0CmMVXTedlE/pm6MjCCAg69WQ0A3SE8Q+UDe8g
 cRALBf7zSYz734tfLwhEPS2BM/KBHvh2qZ3QhTRGy0gxiRC9mxkdUITWd3iZO++qu+bh
 lwq/2z+H2LDTvshwI1rwauyERoVsDzDS/DgmJnmjUV0xWcBlfb+tnaLISRNmyI7TTt/c
 wDPGyAb6v7rqDalJQfy8dD6Y0FR1GCoe7sSQioumXjLmacCJ1ENmclvGaevUlIhbOuvp
 S8SY6boa9P2rT6TqS92HCOVDvJreOIyStzoLkyphvG2Whpzk2+YeBWmx4lE/nCquQvF3
 Vxrg==
X-Gm-Message-State: APjAAAUHsdRAXqfKjQobz/hBhaj97biOEvDnTjuvkD+0nHu0MoceqCid
 9UtMpK6Ue9znc9afwKBeYhY7ejmt
X-Google-Smtp-Source: APXvYqztZVVcaUxgJGcTkhKvrPjh9R4L7X4efAdou0xTqRq5KRhmiR1tUQfaE6QOtbjZCpZq20VZjQ==
X-Received: by 2002:a62:d444:: with SMTP id u4mr7655133pfl.153.1576123965632; 
 Wed, 11 Dec 2019 20:12:45 -0800 (PST)
Received: from bobo.local0.net ([202.21.15.182])
 by smtp.gmail.com with ESMTPSA id y76sm5018768pfc.87.2019.12.11.20.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 20:12:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: skiboot@lists.ozlabs.org
Subject: [RFC PATCH] OPAL v4 cpu idle driver skeleton
Date: Thu, 12 Dec 2019 14:12:37 +1000
Message-Id: <20191212041237.24401-1-npiggin@gmail.com>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With OPAL using the same endianness, same stack, and with OS
callbacks, it looks relatively easy to provide a CPU idle driver.

The Linux sreset interrupt won't have to change, if it registers
almost like isa300_idle_stop_mayloss as the os_stop function,
then skiboot will call that to stop, and it will return like a
normal function call returning the srr1 wakeup value.

This allows the firmware to deal with supported stop states and
psscr and consequences for saving and restoring various resources,
and the kernel can implement a simple OPAL idle driver which has
some interface like wakeup latency requested or something.

Calls in and out of OPAL (once it's running with MMU=on) are not
much more expensive calling a function in a kernel module, so
performance should be okay. Kernel can still choose to implement
an optimised CPU specific driver as it does today.

The patch is just a hack with no actual policy or SPR saving in
it at the moment and only does stop0, but illustrates the mechanism.

Thanks,
Nick
---
 core/Makefile.inc       |  2 +-
 core/opal.c             |  3 +++
 core/stop.c             | 35 +++++++++++++++++++++++++++++++++++
 include/opal-api.h      | 10 ++++++----
 include/opal-internal.h |  1 +
 5 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 core/stop.c

diff --git a/core/Makefile.inc b/core/Makefile.inc
index cc90fb958..653ca544e 100644
--- a/core/Makefile.inc
+++ b/core/Makefile.inc
@@ -7,7 +7,7 @@ CORE_OBJS = relocate.o console.o stack.o init.o chip.o mem_region.o vm.o
 CORE_OBJS += malloc.o lock.o cpu.o utils.o fdt.o opal.o interrupts.o timebase.o
 CORE_OBJS += opal-msg.o pci.o pci-virt.o pci-slot.o pcie-slot.o
 CORE_OBJS += pci-opal.o fast-reboot.o device.o exceptions.o trace.o affinity.o
-CORE_OBJS += vpd.o platform.o nvram.o nvram-format.o hmi.o mce.o
+CORE_OBJS += vpd.o platform.o nvram.o nvram-format.o hmi.o mce.o stop.o
 CORE_OBJS += console-log.o ipmi.o time-utils.o pel.o pool.o errorlog.o
 CORE_OBJS += timer.o i2c.o rtc.o flash.o sensor.o ipmi-opal.o
 CORE_OBJS += flash-subpartition.o bitmap.o buddy.o pci-quirk.o powercap.o psr.o
diff --git a/core/opal.c b/core/opal.c
index bb88d7710..d5c1d057b 100644
--- a/core/opal.c
+++ b/core/opal.c
@@ -444,6 +444,9 @@ static int64_t opal_register_opal_ops(struct opal_os_ops *__os_ops)
 	/* v4 must provide printf */
 	os_ops.os_printf = (void *)be64_to_cpu(__os_ops->os_printf);
 
+	/* v4 may provide stop (or NULL) */
+	os_ops.os_stop = (void *)be64_to_cpu(__os_ops->os_stop);
+
 	set_opal_console_to_raw();
 
 	checksum_romem();
diff --git a/core/stop.c b/core/stop.c
new file mode 100644
index 000000000..6d98d68e6
--- /dev/null
+++ b/core/stop.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: Apache-2.0
+/*
+ * Stop idle driver
+ *
+ * Copyright 2019 IBM Corp.
+ */
+
+#define pr_fmt(fmt)	"IDLE: " fmt
+
+#include <skiboot.h>
+#include <opal.h>
+#include <processor.h>
+#include <cpu.h>
+#include <cpu.h>
+
+static int64_t opal_cpu_idle(uint64_t latency, bool radix, __be64 *srr1)
+{
+	uint64_t psscr;
+
+	if (!os_ops.os_stop)
+		return OPAL_UNSUPPORTED;
+
+	if (proc_gen != proc_gen_p9)
+		return OPAL_UNSUPPORTED;
+
+	(void)latency;
+	(void)radix;
+	psscr = OPAL_PM_PSSCR_RL(0) \
+		 | OPAL_PM_PSSCR_MTL(3) \
+		 | OPAL_PM_PSSCR_TR(3);
+	*srr1 = os_ops.os_stop(psscr, true);
+
+	return OPAL_SUCCESS;
+}
+opal_call(OPAL_CPU_IDLE, opal_cpu_idle, 3);
diff --git a/include/opal-api.h b/include/opal-api.h
index 169061a26..03f323628 100644
--- a/include/opal-api.h
+++ b/include/opal-api.h
@@ -231,6 +231,7 @@
 #define OPAL_LOOKUP_SYMBOL			182
 #define OPAL_REGISTER_OS_OPS			183
 #define OPAL_HANDLE_MCE				184
+#define OPAL_CPU_IDLE				185
 #define OPAL_LAST				184
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
@@ -1259,10 +1260,11 @@ struct opal_mpipl_fadump {
 };
 
 struct opal_os_ops {
-        __be16  version;
-        __be16  reserved0;
-        __be32  reserved1;
-        __be64  os_printf;      /* void printf(int32_t level, const char *str) */
+	__be16  version;
+	__be16  reserved0;
+	__be32  reserved1;
+	__be64  os_printf;	/* void printf(int32_t level, const char *str) */
+	__be64	os_stop;	/* uint64_t stop(uint64_t psscr, bool save_gprs) */
 };
 
 #define MCE_HANDLE_CORRECT		0x0001	/* Attempt to correct */
diff --git a/include/opal-internal.h b/include/opal-internal.h
index cd968a0fe..2baf79a53 100644
--- a/include/opal-internal.h
+++ b/include/opal-internal.h
@@ -20,6 +20,7 @@ struct opal_table_entry {
 
 struct os_ops {
         void (*os_printf)(uint32_t log_level, const char *str);
+	uint64_t (*os_stop)(uint64_t psscr, bool save_gprs);
 };
 
 extern bool opal_v4_os;
-- 
2.23.0

