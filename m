Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF23AC1A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lQJ2RYDz3dJS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ZFLeDfDP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ZFLeDfDP; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lMM2svXz3c1F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5lML2lVhz9sXb; Fri, 18 Jun 2021 13:50:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5lML1lBpz9sXL; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623988254; bh=YmHsMI+i/vC/28rRFeCPDFlB5oDQqAYsm83DWzNk5WE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ZFLeDfDP30tqmzRDMgyFqNrOaCr5L7sJDSZvL6E+2zyMOrwpkFSiOw59CxQTVsGy5
 ByAlxyzKR2gsltZzYPz+TFq/22Oel0gxPCoS/5r4BCqVsFABVlE2iWEglfNGPdYaQ8
 SAp6bun5awSYpeKGqJWYX0GIZEtxezHswoc81A0IlGLArwhQJhwaOVUdl4hNLsX8i5
 YqIGoSWavdqJy2vVMbNY56mX6R+G0iXg40w4R5pH/J9xKydcbCqeQivehxsku6qq/4
 GpeCvPznDL8TJZhwC9KfWsf2VlLpKVFcsFML6rK/eEBo5BUKWIGQvDeSp8fEOac5nl
 E4fB0UV2ndpdg==
Date: Fri, 18 Jun 2021 13:49:43 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 9/9] powerpc/boot: Add a boot wrapper for Microwatt
Message-ID: <YMwX19wym3kQ7guu@thinks.paulus.ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
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
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/Makefile    |  4 ++++
 arch/powerpc/boot/microwatt.c | 24 ++++++++++++++++++++++++
 arch/powerpc/boot/wrapper     |  5 +++++
 3 files changed, 33 insertions(+)
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
index 000000000000..ca9d83617fc1
--- /dev/null
+++ b/arch/powerpc/boot/microwatt.c
@@ -0,0 +1,24 @@
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
+	/*
+	 * Disable interrupts and turn off MSR_RI, since we'll
+	 * shortly be overwriting the interrupt vectors.
+	 */
+	__asm__ volatile("mtmsrd %0,1" : : "r" (0));
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

