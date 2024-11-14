Return-Path: <linuxppc-dev+bounces-3201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B886E9C8B85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sY17jYz305C;
	Fri, 15 Nov 2024 00:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589889;
	cv=none; b=iv/LsUNLpF8IZWLeL/EMnt2WoDzcXhTbco9IjOn7EW5h9q6+Jlh61JXRplDoAw0pVGvdQdH6yWPo7LPOv4t1MbwxhmAMsCy4Vhcc13ixqmu1X0LKn4LVbcmHCRxUF5S3YS5aGvJW2H5gqLHrTULmTFOR8YZFq3i+xc6cFRccUfTfU1cwZfcKIfxOGwFvxJEdbvmDFpLoXR2jb2e0BYoOM0H0UPC/4UxS7m1dq3LYAgi3TPfqpXtLE70EX4OCoy467GCAc2UM+EIXxRWZmqN2U1f5u0eWMU6zvURRJWn2mG/wy5uUSPvtaqROssUmAJLYoDz/AR+yMafflpA/nYsX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589889; c=relaxed/relaxed;
	bh=VGq2sNQO3HPA2Db45uN43gCznAKko+I7CSNX5a98yY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=knMRoFaS/WZybMu2Xp6lLEhE8zruZX2XE8nVl2vOObXO/EFrQwlPaWJZMh8kKIsRg4pgn6kt9h5kOXG5M9nOVN+m4zSDYq87FVlMnkNErNP9hXVFHj+y/B6PX4pngoMPbwK5AMtTjt1KE8GFEUNhf/3/FdEipszmsMWKiEvpD3qhqpN8nawfsXQwW4pJwapI+RL15UYZ9K7Xr5jefpxv2tJnICeO2UBnxUInr1zK/kWqi4XrywePIk0d3cUce3ivHT+pzy/xphOSzJfg5oQ31HmNRzq8z/QHj3U1XhpYv9Bn9nj+xV+GB9y2HHWVwOfg3Ot43WA+qz9BlkNKRyhS6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DEtb2py2; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DEtb2py2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sX3Qq8z301w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589885;
	bh=VGq2sNQO3HPA2Db45uN43gCznAKko+I7CSNX5a98yY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEtb2py2k3PLwI2TO9LZZjZd5g44Hbu6dsaQHpdRklqV0aAyT1QUXI0uuCey7WRCD
	 rhXzZ5wLWGkaY/dH0pHiglg0wQgwdz+4mrV7vW724u/FnDTp9HPIQBs3gRwa+3Gr5P
	 U052W8Cz/Lx2QXiAsIaBfBCx80sEwblpuwegBUH/ho05dlPl4kkgvlmTC9MRK9BkwK
	 NK5BLZdRDM7LkJ+tnLI3E6QsSZXfoft350YPeVYACrIe+mhWbmnj9H9S46WqlgZZI0
	 Z/E3wtJHQh30jOKF8nMVbXOW+xYB4r9RlvA/ilivymQF9o18ASIvUeC34Q7/rEZHGO
	 p6DsweWH0m+Ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sT3x8Gz4xPy;
	Fri, 15 Nov 2024 00:11:25 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
Date: Fri, 15 Nov 2024 00:11:12 +1100
Message-ID: <20241114131114.602234-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The i2c-hydra driver depends on PPC_CHRP which has now been removed,
remove the driver also.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/i2c/busses/Kconfig     |  12 ---
 drivers/i2c/busses/Makefile    |   1 -
 drivers/i2c/busses/i2c-hydra.c | 150 ---------------------------------
 3 files changed, 163 deletions(-)
 delete mode 100644 drivers/i2c/busses/i2c-hydra.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6b3ba7e5723a..cbd072955e45 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -373,18 +373,6 @@ endif # ACPI
 comment "Mac SMBus host controller drivers"
 	depends on PPC_CHRP || PPC_PMAC
 
-config I2C_HYDRA
-	tristate "CHRP Apple Hydra Mac I/O I2C interface"
-	depends on PCI && PPC_CHRP
-	select I2C_ALGOBIT
-	help
-	  This supports the use of the I2C interface in the Apple Hydra Mac
-	  I/O chip on some CHRP machines (e.g. the LongTrail).  Say Y if you
-	  have such a machine.
-
-	  This support is also available as a module.  If so, the module
-	  will be called i2c-hydra.
-
 config I2C_POWERMAC
 	tristate "Powermac I2C interface"
 	depends on PPC_PMAC
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index ecc07c50f2a0..ab366ce6f15c 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -32,7 +32,6 @@ obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
 obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-viai2c-zhaoxin.o i2c-viai2c-common.o
 
 # Mac SMBus host controller drivers
-obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
 obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
 
 # Embedded system I2C/SMBus host controller drivers
diff --git a/drivers/i2c/busses/i2c-hydra.c b/drivers/i2c/busses/i2c-hydra.c
deleted file mode 100644
index c60b73e933cf..000000000000
--- a/drivers/i2c/busses/i2c-hydra.c
+++ /dev/null
@@ -1,150 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
-    i2c Support for the Apple `Hydra' Mac I/O
-
-    Copyright (c) 1999-2004 Geert Uytterhoeven <geert@linux-m68k.org>
-
-    Based on i2c Support for Via Technologies 82C586B South Bridge
-    Copyright (c) 1998, 1999 Kyösti Mälkki <kmalkki@cc.hut.fi>
-
-*/
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/types.h>
-#include <linux/i2c.h>
-#include <linux/i2c-algo-bit.h>
-#include <linux/io.h>
-#include <asm/hydra.h>
-
-
-#define HYDRA_CPD_PD0	0x00000001	/* CachePD lines */
-#define HYDRA_CPD_PD1	0x00000002
-#define HYDRA_CPD_PD2	0x00000004
-#define HYDRA_CPD_PD3	0x00000008
-
-#define HYDRA_SCLK	HYDRA_CPD_PD0
-#define HYDRA_SDAT	HYDRA_CPD_PD1
-#define HYDRA_SCLK_OE	0x00000010
-#define HYDRA_SDAT_OE	0x00000020
-
-static inline void pdregw(void *data, u32 val)
-{
-	struct Hydra *hydra = (struct Hydra *)data;
-	writel(val, &hydra->CachePD);
-}
-
-static inline u32 pdregr(void *data)
-{
-	struct Hydra *hydra = (struct Hydra *)data;
-	return readl(&hydra->CachePD);
-}
-
-static void hydra_bit_setscl(void *data, int state)
-{
-	u32 val = pdregr(data);
-	if (state)
-		val &= ~HYDRA_SCLK_OE;
-	else {
-		val &= ~HYDRA_SCLK;
-		val |= HYDRA_SCLK_OE;
-	}
-	pdregw(data, val);
-}
-
-static void hydra_bit_setsda(void *data, int state)
-{
-	u32 val = pdregr(data);
-	if (state)
-		val &= ~HYDRA_SDAT_OE;
-	else {
-		val &= ~HYDRA_SDAT;
-		val |= HYDRA_SDAT_OE;
-	}
-	pdregw(data, val);
-}
-
-static int hydra_bit_getscl(void *data)
-{
-	return (pdregr(data) & HYDRA_SCLK) != 0;
-}
-
-static int hydra_bit_getsda(void *data)
-{
-	return (pdregr(data) & HYDRA_SDAT) != 0;
-}
-
-/* ------------------------------------------------------------------------ */
-
-static struct i2c_algo_bit_data hydra_bit_data = {
-	.setsda		= hydra_bit_setsda,
-	.setscl		= hydra_bit_setscl,
-	.getsda		= hydra_bit_getsda,
-	.getscl		= hydra_bit_getscl,
-	.udelay		= 5,
-	.timeout	= HZ
-};
-
-static struct i2c_adapter hydra_adap = {
-	.owner		= THIS_MODULE,
-	.name		= "Hydra i2c",
-	.algo_data	= &hydra_bit_data,
-};
-
-static const struct pci_device_id hydra_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, PCI_DEVICE_ID_APPLE_HYDRA) },
-	{ 0, }
-};
-
-MODULE_DEVICE_TABLE (pci, hydra_ids);
-
-static int hydra_probe(struct pci_dev *dev,
-				 const struct pci_device_id *id)
-{
-	unsigned long base = pci_resource_start(dev, 0);
-	int res;
-
-	if (!request_mem_region(base+offsetof(struct Hydra, CachePD), 4,
-				hydra_adap.name))
-		return -EBUSY;
-
-	hydra_bit_data.data = pci_ioremap_bar(dev, 0);
-	if (hydra_bit_data.data == NULL) {
-		release_mem_region(base+offsetof(struct Hydra, CachePD), 4);
-		return -ENODEV;
-	}
-
-	pdregw(hydra_bit_data.data, 0);		/* clear SCLK_OE and SDAT_OE */
-	hydra_adap.dev.parent = &dev->dev;
-	res = i2c_bit_add_bus(&hydra_adap);
-	if (res < 0) {
-		iounmap(hydra_bit_data.data);
-		release_mem_region(base+offsetof(struct Hydra, CachePD), 4);
-		return res;
-	}
-	return 0;
-}
-
-static void hydra_remove(struct pci_dev *dev)
-{
-	pdregw(hydra_bit_data.data, 0);		/* clear SCLK_OE and SDAT_OE */
-	i2c_del_adapter(&hydra_adap);
-	iounmap(hydra_bit_data.data);
-	release_mem_region(pci_resource_start(dev, 0)+
-			   offsetof(struct Hydra, CachePD), 4);
-}
-
-
-static struct pci_driver hydra_driver = {
-	.name		= "hydra_smbus",
-	.id_table	= hydra_ids,
-	.probe		= hydra_probe,
-	.remove		= hydra_remove,
-};
-
-module_pci_driver(hydra_driver);
-
-MODULE_AUTHOR("Geert Uytterhoeven <geert@linux-m68k.org>");
-MODULE_DESCRIPTION("i2c for Apple Hydra Mac I/O");
-MODULE_LICENSE("GPL");
-- 
2.47.0


