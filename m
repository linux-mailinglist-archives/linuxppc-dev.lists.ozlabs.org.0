Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC63A7252
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nBx1J3rz3c1t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:06:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=hORbNdBk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=hORbNdBk; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9c4rPHz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z2PYvz9sWD; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z223Pz9sW7; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=WvXxP8gzSP3PQ3uQ1u9zh5LQAoVVCP0JlAN7xHrFop0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=hORbNdBkdP65A+DqArDjdrRaiRohUhqRpLh7mXh4Fe+ZHu3aWT4GWOnX3f5QjLk2T
 Zi+HINsZ90Hoeqx9Tw+169qH9vDScI81xcgzvBrBV97KB2h6MoC8mGK4nyEf4+slUd
 vmKVH7gIjL/teDMyKyh+M7fFWIjTtmXo7ktgJ0M06yQn/cRHqktHHLR8CJ/bSbUdye
 q6qRPtSLXwhopBu6mOiSaBwEBkMQPPSdoMJsMFnQsgyBMFCmdlUspOo1HARHjKQn1n
 FNPSsWgMAZJv6cLd9MMd+lL3rq/5yofh3qiv/rWO7XnsRo3Xh76kR4E0bfrZgodFDc
 bgKXk92MKZnpw==
Date: Tue, 15 Jun 2021 09:03:25 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 10/11] powerpc/microwatt: Add a boot wrapper for Microwatt
Message-ID: <YMfgPQfUkFBzcg1x@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

This allows microwatt's kernel to be built with an embedded device tree.

Load to arch/powerpc/boot/dtbImage.microwatt to 0x500000:

 mw_debug -b fpga stop load arch/powerpc/boot/dtbImage.microwatt 500000 start

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/boot/Makefile    |  4 ++++
 arch/powerpc/boot/microwatt.c | 18 ++++++++++++++++++
 arch/powerpc/boot/wrapper     |  5 +++++
 3 files changed, 27 insertions(+)
 create mode 100644 arch/powerpc/boot/microwatt.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 2b8da923ceca..dfaa4094fcae 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -163,6 +163,8 @@ src-plat-$(CONFIG_PPC_POWERNV) += pseries-head.S
 src-plat-$(CONFIG_PPC_IBM_CELL_BLADE) += pseries-head.S
 src-plat-$(CONFIG_MVME7100) += motload-head.S mvme7100.c
 
+src-plat-$(CONFIG_PPC_MICROWATT) += fixed-head.S microwatt.c
+
 src-wlib := $(sort $(src-wlib-y))
 src-plat := $(sort $(src-plat-y))
 src-boot := $(src-wlib) $(src-plat) empty.c
@@ -355,6 +357,8 @@ image-$(CONFIG_MVME5100)		+= dtbImage.mvme5100
 # Board port in arch/powerpc/platform/amigaone/Kconfig
 image-$(CONFIG_AMIGAONE)		+= cuImage.amigaone
 
+image-$(CONFIG_PPC_MICROWATT)		+= dtbImage.microwatt
+
 # For 32-bit powermacs, build the COFF and miboot images
 # as well as the ELF images.
 ifdef CONFIG_PPC32
diff --git a/arch/powerpc/boot/microwatt.c b/arch/powerpc/boot/microwatt.c
new file mode 100644
index 000000000000..ac922dd0aa4d
--- /dev/null
+++ b/arch/powerpc/boot/microwatt.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <stddef.h>
+#include "stdio.h"
+#include "types.h"
+#include "io.h"
+#include "ops.h"
+
+BSS_STACK(8192);
+
+void platform_init(unsigned long r3, unsigned long r4, unsigned long r5)
+{
+	unsigned long heapsize = 16*1024*1024 - (unsigned long)_end;
+
+	simple_alloc_init(_end, heapsize, 32, 64);
+	fdt_init(_dtb_start);
+	serial_console_init();
+}
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 41fa0a8715e3..ae48fffa1e13 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -342,6 +342,11 @@ gamecube|wii)
     link_address='0x600000'
     platformo="$object/$platform-head.o $object/$platform.o"
     ;;
+microwatt)
+    link_address='0x500000'
+    platformo="$object/fixed-head.o $object/$platform.o"
+    binary=y
+    ;;
 treeboot-currituck)
     link_address='0x1000000'
     ;;
-- 
2.31.1

