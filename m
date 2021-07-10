Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4753C2FE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:37:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMDhM4Tgbz3fYL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:37:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nl9NlGk6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nl9NlGk6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMDfg4myPz3drH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:35:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB0BA6141A;
 Sat, 10 Jul 2021 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884553;
 bh=7jr1Lvt1ILnCkPldOAG79bnseWQuYmGuSXtbZT78/qU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nl9NlGk6EWK020RGE98aQI5imJPAAecJpHtZlG4UqQ2r9GFhMz7+T1H/CX8UdR12R
 46yEC7c7GTqjKAchXwfmTwF2eT0cgq5NNCmhIXZWjSvMIsUwa4zidgU1jn4RgOwD5h
 cIu3jNbYYtHsObRs0PmQ2UogB5hmKxwyrpGROPS5HKzSlSiWgSRthwFyso+wvl3QXb
 OXZ8sfNL7KfT6kWt8GGWSpJojLQ+JG4Gz+OqSVRJxwH7BPYINxS1RZ5oeuVBtEmEpy
 Ecw5oSPevRDK6UHR4sEtLqc3zbUOL5NktsYZGIKIg3vTWvfRQr9hJ+jrTm5W7SUtbm
 YXv/+mB89BSZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 26/33] powerpc/boot: Fixup device-tree on little
 endian
Date: Fri,  9 Jul 2021 22:35:08 -0400
Message-Id: <20210710023516.3172075-26-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023516.3172075-1-sashal@kernel.org>
References: <20210710023516.3172075-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

[ Upstream commit c93f80849bdd9b45d834053ae1336e28f0026c84 ]

This fixes the core devtree.c functions and the ns16550 UART backend.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/YMwXrPT8nc4YUdJ9@thinks.paulus.ozlabs.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/boot/devtree.c | 59 +++++++++++++++++++++----------------
 arch/powerpc/boot/ns16550.c |  9 ++++--
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/boot/devtree.c b/arch/powerpc/boot/devtree.c
index a7e21a35c03a..27c84b82b588 100644
--- a/arch/powerpc/boot/devtree.c
+++ b/arch/powerpc/boot/devtree.c
@@ -17,6 +17,7 @@
 #include "string.h"
 #include "stdio.h"
 #include "ops.h"
+#include "of.h"
 
 void dt_fixup_memory(u64 start, u64 size)
 {
@@ -27,21 +28,25 @@ void dt_fixup_memory(u64 start, u64 size)
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
@@ -49,9 +54,9 @@ void dt_fixup_memory(u64 start, u64 size)
 		setprop_str(memory, "device_type", "memory");
 	}
 
-	printf("Memory <- <0x%x", memreg[0]);
+	printf("Memory <- <0x%x", be32_to_cpu(memreg[0]));
 	for (i = 1; i < (naddr + nsize); i++)
-		printf(" 0x%x", memreg[i]);
+		printf(" 0x%x", be32_to_cpu(memreg[i]));
 	printf("> (%ldMB)\n\r", (unsigned long)(size >> 20));
 
 	setprop(memory, "reg", memreg, (naddr + nsize)*sizeof(u32));
@@ -69,10 +74,10 @@ void dt_fixup_cpu_clocks(u32 cpu, u32 tb, u32 bus)
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
@@ -84,7 +89,7 @@ void dt_fixup_clock(const char *path, u32 freq)
 
 	if (devp) {
 		printf("%s: clock-frequency <- %x (%dMHz)\n\r", path, freq, MHZ(freq));
-		setprop_val(devp, "clock-frequency", freq);
+		setprop_val(devp, "clock-frequency", cpu_to_be32(freq));
 	}
 }
 
@@ -137,8 +142,12 @@ void dt_get_reg_format(void *node, u32 *naddr, u32 *nsize)
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
@@ -167,9 +176,9 @@ static int add_reg(u32 *reg, u32 *add, int naddr)
 	int i, carry = 0;
 
 	for (i = MAX_ADDR_CELLS - 1; i >= MAX_ADDR_CELLS - naddr; i--) {
-		u64 tmp = (u64)reg[i] + add[i] + carry;
+		u64 tmp = (u64)be32_to_cpu(reg[i]) + be32_to_cpu(add[i]) + carry;
 		carry = tmp >> 32;
-		reg[i] = (u32)tmp;
+		reg[i] = cpu_to_be32((u32)tmp);
 	}
 
 	return !carry;
@@ -184,18 +193,18 @@ static int compare_reg(u32 *reg, u32 *range, u32 *rangesize)
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
 
@@ -244,7 +253,6 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 		return 0;
 
 	dt_get_reg_format(parent, &naddr, &nsize);
-
 	if (nsize > 2)
 		return 0;
 
@@ -256,10 +264,10 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 
 	copy_val(last_addr, prop_buf + offset, naddr);
 
-	ret_size = prop_buf[offset + naddr];
+	ret_size = be32_to_cpu(prop_buf[offset + naddr]);
 	if (nsize == 2) {
 		ret_size <<= 32;
-		ret_size |= prop_buf[offset + naddr + 1];
+		ret_size |= be32_to_cpu(prop_buf[offset + naddr + 1]);
 	}
 
 	for (;;) {
@@ -282,7 +290,6 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 
 		offset = find_range(last_addr, prop_buf, prev_naddr,
 		                    naddr, prev_nsize, buflen / 4);
-
 		if (offset < 0)
 			return 0;
 
@@ -300,8 +307,7 @@ static int dt_xlate(void *node, int res, int reglen, unsigned long *addr,
 	if (naddr > 2)
 		return 0;
 
-	ret_addr = ((u64)last_addr[2] << 32) | last_addr[3];
-
+	ret_addr = ((u64)be32_to_cpu(last_addr[2]) << 32) | be32_to_cpu(last_addr[3]);
 	if (sizeof(void *) == 4 &&
 	    (ret_addr >= 0x100000000ULL || ret_size > 0x100000000ULL ||
 	     ret_addr + ret_size > 0x100000000ULL))
@@ -354,11 +360,14 @@ int dt_is_compatible(void *node, const char *compat)
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
2.30.2

