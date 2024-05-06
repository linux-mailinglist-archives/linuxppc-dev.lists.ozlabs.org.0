Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD68BCE9B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:57:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TtPIt+K0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY1fJ4VL2z3bv8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TtPIt+K0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY1XB1Y8Nz30TW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:52:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714999946;
	bh=GBEPaRZyteJkC6BUvRNboaSanQS3npKz4CeG4H3+xfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtPIt+K0SqSoCNTxcJORwMADAGf0tHsQURR0AaDYWDwvQBs1v9f3XfxoKy1V9MhHO
	 JxVhxprRn9VvuPZmt9Dpcyi4GWItHMOOT8s/1cmt6zSC6D5VCXmBkrTy78a+00euyR
	 PCbyv/UYqlfG/9nNl1M0Ra+xlSRApuWMWrL7r0vNSFJGRjvk0fyb4dbgJb1uf5zRgv
	 HB8+sReTuP8KqssK7MPMXPEYY8kmC2TpK37h29W3dEZeDBjq84YUMyZOpPEkCKH/wY
	 p6QkLYs7BTOGVcOP4qH6Pi0jmCD52bM4aSAsei7GMJrJ7mWX5OH+M4fl17A0RODdYN
	 G7NhHXU8au7Kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VY1XB0rHjz4x2y;
	Mon,  6 May 2024 22:52:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 7/7] powerpc/platforms: Move files from 4xx to 44x
Date: Mon,  6 May 2024 22:51:52 +1000
Message-ID: <20240506125152.78174-8-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240506125152.78174-1-mpe@ellerman.id.au>
References: <20240506125152.78174-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Only 44x uses 4xx now, so only keep one directory.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/44x/Makefile           |  6 ++++-
 arch/powerpc/platforms/{4xx => 44x}/cpm.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/gpio.c    |  0
 .../powerpc/platforms/{4xx => 44x}/hsta_msi.c |  0
 arch/powerpc/platforms/44x/machine_check.c    | 15 ++++++++++++
 arch/powerpc/platforms/{4xx => 44x}/pci.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/pci.h     |  0
 arch/powerpc/platforms/{4xx => 44x}/soc.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/uic.c     |  0
 arch/powerpc/platforms/4xx/Makefile           |  7 ------
 arch/powerpc/platforms/4xx/machine_check.c    | 23 -------------------
 arch/powerpc/platforms/Makefile               |  1 -
 12 files changed, 20 insertions(+), 32 deletions(-)
 rename arch/powerpc/platforms/{4xx => 44x}/cpm.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/gpio.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/hsta_msi.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/pci.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/pci.h (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/soc.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/uic.c (100%)
 delete mode 100644 arch/powerpc/platforms/4xx/Makefile
 delete mode 100644 arch/powerpc/platforms/4xx/machine_check.c

diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index 5ba031f57652..ca7b1bb442d9 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y	+= misc_44x.o machine_check.o
+obj-y	+= misc_44x.o machine_check.o uic.o soc.o
 ifneq ($(CONFIG_PPC4xx_CPM),y)
 obj-y	+= idle.o
 endif
@@ -12,3 +12,7 @@ obj-$(CONFIG_CANYONLANDS)+= canyonlands.o
 obj-$(CONFIG_CURRITUCK)	+= ppc476.o
 obj-$(CONFIG_AKEBONO)	+= ppc476.o
 obj-$(CONFIG_FSP2)	+= fsp2.o
+obj-$(CONFIG_PCI)		+= pci.o
+obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
+obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
+obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/44x/cpm.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/cpm.c
rename to arch/powerpc/platforms/44x/cpm.c
diff --git a/arch/powerpc/platforms/4xx/gpio.c b/arch/powerpc/platforms/44x/gpio.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/gpio.c
rename to arch/powerpc/platforms/44x/gpio.c
diff --git a/arch/powerpc/platforms/4xx/hsta_msi.c b/arch/powerpc/platforms/44x/hsta_msi.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/hsta_msi.c
rename to arch/powerpc/platforms/44x/hsta_msi.c
diff --git a/arch/powerpc/platforms/44x/machine_check.c b/arch/powerpc/platforms/44x/machine_check.c
index 5d19daacd78a..85ff33a8d9b6 100644
--- a/arch/powerpc/platforms/44x/machine_check.c
+++ b/arch/powerpc/platforms/44x/machine_check.c
@@ -9,6 +9,21 @@
 #include <asm/reg.h>
 #include <asm/cacheflush.h>
 
+int machine_check_4xx(struct pt_regs *regs)
+{
+	unsigned long reason = regs->esr;
+
+	if (reason & ESR_IMCP) {
+		printk("Instruction");
+		mtspr(SPRN_ESR, reason & ~ESR_IMCP);
+	} else
+		printk("Data");
+
+	printk(" machine check in kernel mode.\n");
+
+	return 0;
+}
+
 int machine_check_440A(struct pt_regs *regs)
 {
 	unsigned long reason = regs->esr;
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/44x/pci.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/pci.c
rename to arch/powerpc/platforms/44x/pci.c
diff --git a/arch/powerpc/platforms/4xx/pci.h b/arch/powerpc/platforms/44x/pci.h
similarity index 100%
rename from arch/powerpc/platforms/4xx/pci.h
rename to arch/powerpc/platforms/44x/pci.h
diff --git a/arch/powerpc/platforms/4xx/soc.c b/arch/powerpc/platforms/44x/soc.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/soc.c
rename to arch/powerpc/platforms/44x/soc.c
diff --git a/arch/powerpc/platforms/4xx/uic.c b/arch/powerpc/platforms/44x/uic.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/uic.c
rename to arch/powerpc/platforms/44x/uic.c
diff --git a/arch/powerpc/platforms/4xx/Makefile b/arch/powerpc/platforms/4xx/Makefile
deleted file mode 100644
index 7f57c35f8dec..000000000000
--- a/arch/powerpc/platforms/4xx/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y				+= uic.o machine_check.o
-obj-$(CONFIG_44x)		+= soc.o
-obj-$(CONFIG_PCI)		+= pci.o
-obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
-obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
diff --git a/arch/powerpc/platforms/4xx/machine_check.c b/arch/powerpc/platforms/4xx/machine_check.c
deleted file mode 100644
index a905da1d6f41..000000000000
--- a/arch/powerpc/platforms/4xx/machine_check.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-#include <linux/kernel.h>
-#include <linux/printk.h>
-#include <linux/ptrace.h>
-
-#include <asm/reg.h>
-
-int machine_check_4xx(struct pt_regs *regs)
-{
-	unsigned long reason = regs->esr;
-
-	if (reason & ESR_IMCP) {
-		printk("Instruction");
-		mtspr(SPRN_ESR, reason & ~ESR_IMCP);
-	} else
-		printk("Data");
-	printk(" machine check in kernel mode.\n");
-
-	return 0;
-}
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index d1a417b301b6..786d374bff31 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -4,7 +4,6 @@ obj-$(CONFIG_FSL_ULI1575)	+= fsl_uli1575.o
 
 obj-$(CONFIG_PPC_PMAC)		+= powermac/
 obj-$(CONFIG_PPC_CHRP)		+= chrp/
-obj-$(CONFIG_4xx)		+= 4xx/
 obj-$(CONFIG_44x)		+= 44x/
 obj-$(CONFIG_PPC_MPC512x)	+= 512x/
 obj-$(CONFIG_PPC_MPC52xx)	+= 52xx/
-- 
2.45.0

