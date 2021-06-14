Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B3E3A7254
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nCn5P2Jz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lrJqOsPE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=lrJqOsPE; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9d2WVrz2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z5sMSz9t0J; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z58Jfz9sW7; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=Y176si/IXnYcD44zz3Hp1UGpgLKQmILs6BCg/JZRPPI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lrJqOsPErpzebmd9hCS/4kYl30AETb/yifteSn9gW+3dUOlfpwCYLzABDc98TaMqe
 yi6lxJL9UsnITadpjNwGJ0lCtsuTUIyCmzY32ylyVcP6Y9CafHDjzXFwhhZZ04B3j/
 1E9TtpEnq/wJWaLHvlhoyvNRhq6LmyJbGhUAl5hQeub8I74jTUbtzDm2HgCpPbiHRG
 K5HLQWhFedabQf8+KOTV78TRmvisE1nqx8uumIxzchsXoYt4T1YwL9L8J3nuHlYu/K
 2c+6oGJy33KAboRwWOxCwSv5MfbfuWitwVUh5Nu8fCrRJd7iQRa2biroufpH1+gxLu
 tvZSBpk/1p9PA==
Date: Tue, 15 Jun 2021 09:04:17 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 09/11] powerpc: boot: Fixup device-tree on little endian
Message-ID: <YMfgcYTmjiiR8yow@thinks.paulus.ozlabs.org>
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

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

This fixes the core devtree.c functions and the ns16550 UART backend.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/boot/devtree.c | 59 +++++++++++++++++++++----------------
 arch/powerpc/boot/ns16550.c |  9 ++++--
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/boot/devtree.c b/arch/powerpc/boot/devtree.c
index 5d91036ad626..58fbcfcc98c9 100644
--- a/arch/powerpc/boot/devtree.c
+++ b/arch/powerpc/boot/devtree.c
@@ -13,6 +13,7 @@
 #include "string.h"
 #include "stdio.h"
 #include "ops.h"
+#include "of.h"
 
 void dt_fixup_memory(u64 start, u64 size)
 {
@@ -23,21 +24,25 @@ void dt_fixup_memory(u64 start, u64 size)
 	root = finddevice("/");
 	if (getprop(root, "#address-cells", &naddr, sizeof(naddr)) < 0)
 		naddr = 2;
+	else
+		naddr = be32_to_cpu(naddr);
 	if (naddr < 1 || naddr > 2)
 		fatal("Can't cope with #address-cells == %d in /\n\r", naddr);
 
 	if (getprop(root, "#size-cells", &nsize, sizeof(nsize)) < 0)
 		nsize = 1;
+	else
+		nsize = be32_to_cpu(nsize);
 	if (nsize < 1 || nsize > 2)
 		fatal("Can't cope with #size-cells == %d in /\n\r", nsize);
 
 	i = 0;
 	if (naddr == 2)
-		memreg[i++] = start >> 32;
-	memreg[i++] = start & 0xffffffff;
+		memreg[i++] = cpu_to_be32(start >> 32);
+	memreg[i++] = cpu_to_be32(start & 0xffffffff);
 	if (nsize == 2)
-		memreg[i++] = size >> 32;
-	memreg[i++] = size & 0xffffffff;
+		memreg[i++] = cpu_to_be32(size >> 32);
+	memreg[i++] = cpu_to_be32(size & 0xffffffff);
 
 	memory = finddevice("/memory");
 	if (! memory) {
@@ -45,9 +50,9 @@ void dt_fixup_memory(u64 start, u64 size)
 		setprop_str(memory, "device_type", "memory");
 	}
 
-	printf("Memory <- <0x%x", memreg[0]);
+	printf("Memory <- <0x%x", be32_to_cpu(memreg[0]));
 	for (i = 1; i < (naddr + nsize); i++)
-		printf(" 0x%x", memreg[i]);
+		printf(" 0x%x", be32_to_cpu(memreg[i]));
 	printf("> (%ldMB)\n\r", (unsigned long)(size >> 20));
 
 	setprop(memory, "reg", memreg, (naddr + nsize)*sizeof(u32));
@@ -65,10 +70,10 @@ void dt_fixup_cpu_clocks(u32 cpu, u32 tb, u32 bus)
 		printf("CPU bus-frequency <- 0x%x (%dMHz)\n\r", bus, MHZ(bus));
 
 	while ((devp = find_node_by_devtype(devp, "cpu"))) {
-		setprop_val(devp, "clock-frequency", cpu);
-		setprop_val(devp, "timebase-frequency", tb);
+		setprop_val(devp, "clock-frequency", cpu_to_be32(cpu));
+		setprop_val(devp, "timebase-frequency", cpu_to_be32(tb));
 		if (bus > 0)
-			setprop_val(devp, "bus-frequency", bus);
+			setprop_val(devp, "bus-frequency", cpu_to_be32(bus));
 	}
 
 	timebase_period_ns = 1000000000 / tb;
@@ -80,7 +85,7 @@ void dt_fixup_clock(const char *path, u32 freq)
 
 	if (devp) {
 		printf("%s: clock-frequency <- %x (%dMHz)\n\r", path, freq, MHZ(freq));
-		setprop_val(devp, "clock-frequency", freq);
+		setprop_val(devp, "clock-frequency", cpu_to_be32(freq));
 	}
 }
 
@@ -133,8 +138,12 @@ void dt_get_reg_format(void *node, u32 *naddr, u32 *nsize)
 {
 	if (getprop(node, "#address-cells", naddr, 4) != 4)
 		*naddr = 2;
+	else
+		*naddr = be32_to_cpu(*naddr);
 	if (getprop(node, "#size-cells", nsize, 4) != 4)
 		*nsize = 1;
+	else
+		*nsize = be32_to_cpu(*nsize);
 }
 
 static void copy_val(u32 *dest, u32 *src, int naddr)
@@ -163,9 +172,9 @@ static int add_reg(u32 *reg, u32 *add, int naddr)
 	int i, carry = 0;
 
 	for (i = MAX_ADDR_CELLS - 1; i >= MAX_ADDR_CELLS - naddr; i--) {
-		u64 tmp = (u64)reg[i] + add[i] + carry;
+		u64 tmp = (u64)be32_to_cpu(reg[i]) + be32_to_cpu(add[i]) + carry;
 		carry = tmp >> 32;
-		reg[i] = (u32)tmp;
+		reg[i] = cpu_to_be32((u32)tmp);
 	}
 
 	return !carry;
@@ -180,18 +189,18 @@ static int compare_reg(u32 *reg, u32 *range, u32 *rangesize)
 	u32 end;
 
 	for (i = 0; i < MAX_ADDR_CELLS; i++) {
-		if (reg[i] < range[i])
+		if (be32_to_cpu(reg[i]) < be32_to_cpu(range[i]))
 			return 0;
-		if (reg[i] > range[i])
+		if (be32_to_cpu(reg[i]) > be32_to_cpu(range[i]))
 			break;
 	}
 
 	for (i = 0; i < MAX_ADDR_CELLS; i++) {
-		end = range[i] + rangesize[i];
+		end = be32_to_cpu(range[i]) + be32_to_cpu(rangesize[i]);
 
-		if (reg[i] < end)
+		if (be32_to_cpu(reg[i]) < end)
 			break;
-		if (reg[i] > end)
+		if (be32_to_cpu(reg[i]) > end)
 			return 0;
 	}
 
@@ -240,7 +249,6 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 		return 0;
 
 	dt_get_reg_format(parent, &naddr, &nsize);
-
 	if (nsize > 2)
 		return 0;
 
@@ -252,10 +260,10 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 
 	copy_val(last_addr, prop_buf + offset, naddr);
 
-	ret_size = prop_buf[offset + naddr];
+	ret_size = be32_to_cpu(prop_buf[offset + naddr]);
 	if (nsize == 2) {
 		ret_size <<= 32;
-		ret_size |= prop_buf[offset + naddr + 1];
+		ret_size |= be32_to_cpu(prop_buf[offset + naddr + 1]);
 	}
 
 	for (;;) {
@@ -278,7 +286,6 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 
 		offset = find_range(last_addr, prop_buf, prev_naddr,
 		                    naddr, prev_nsize, buflen / 4);
-
 		if (offset < 0)
 			return 0;
 
@@ -296,8 +303,7 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 	if (naddr > 2)
 		return 0;
 
-	ret_addr = ((u64)last_addr[2] << 32) | last_addr[3];
-
+	ret_addr = ((u64)be32_to_cpu(last_addr[2]) << 32) | be32_to_cpu(last_addr[3]);
 	if (sizeof(void *) == 4 &&
 	    (ret_addr >= 0x100000000ULL || ret_size > 0x100000000ULL ||
 	     ret_addr + ret_size > 0x100000000ULL))
@@ -350,11 +356,14 @@ int dt_is_compatible(void *node, const char *compat)
 int dt_get_virtual_reg(void *node, void **addr, int nres)
 {
 	unsigned long xaddr;
-	int n;
+	int n, i;
 
 	n = getprop(node, "virtual-reg", addr, nres * 4);
-	if (n > 0)
+	if (n > 0) {
+		for (i = 0; i < n/4; i ++)
+			((u32 *)addr)[i] = be32_to_cpu(((u32 *)addr)[i]);
 		return n / 4;
+	}
 
 	for (n = 0; n < nres; n++) {
 		if (!dt_xlate_reg(node, n, &xaddr, NULL))
diff --git a/arch/powerpc/boot/ns16550.c b/arch/powerpc/boot/ns16550.c
index b0da4466d419..f16d2be1d0f3 100644
--- a/arch/powerpc/boot/ns16550.c
+++ b/arch/powerpc/boot/ns16550.c
@@ -15,6 +15,7 @@
 #include "stdio.h"
 #include "io.h"
 #include "ops.h"
+#include "of.h"
 
 #define UART_DLL	0	/* Out: Divisor Latch Low */
 #define UART_DLM	1	/* Out: Divisor Latch High */
@@ -58,16 +59,20 @@ int ns16550_console_init(void *devp, struct serial_console_data *scdp)
 	int n;
 	u32 reg_offset;
 
-	if (dt_get_virtual_reg(devp, (void **)&reg_base, 1) < 1)
+	if (dt_get_virtual_reg(devp, (void **)&reg_base, 1) < 1) {
+		printf("virt reg parse fail...\r\n");
 		return -1;
+	}
 
 	n = getprop(devp, "reg-offset", &reg_offset, sizeof(reg_offset));
 	if (n == sizeof(reg_offset))
-		reg_base += reg_offset;
+		reg_base += be32_to_cpu(reg_offset);
 
 	n = getprop(devp, "reg-shift", &reg_shift, sizeof(reg_shift));
 	if (n != sizeof(reg_shift))
 		reg_shift = 0;
+	else
+		reg_shift = be32_to_cpu(reg_shift);
 
 	scdp->open = ns16550_open;
 	scdp->putc = ns16550_putc;
-- 
2.31.1

