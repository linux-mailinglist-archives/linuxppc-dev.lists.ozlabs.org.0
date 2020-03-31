Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD999198DE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 10:06:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s22Z0yCmzDrRq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 19:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=dLtgkln2; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s1h70PZbzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 18:49:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s1h25PHYz9v2Xc;
 Tue, 31 Mar 2020 09:49:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dLtgkln2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ycxJsYPomY9w; Tue, 31 Mar 2020 09:49:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s1h249Fvz9v2Xf;
 Tue, 31 Mar 2020 09:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585640994; bh=pFdNYs4HO4Vx66nn0kAA2kikKY35e/gj023324nsv7g=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=dLtgkln2eB73f/i3SDv9WOuOi5Kh77bozhoVFkr68cwQ6cm13Atiddbdu0xAkmjzx
 SUUeGy8UxXAwMsg9/eTuHS7jYVFXqxm5DD2M6wK8PeF7Grb6BcI8LwEVX3f5HYscN0
 UMsnzMemOCohVK1Pw8Vda/Y/0nWdE8eH0Qfu8lko=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 770CA8B78B;
 Tue, 31 Mar 2020 09:49:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2CrsWzZ6RVQU; Tue, 31 Mar 2020 09:49:55 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 222C08B774;
 Tue, 31 Mar 2020 09:49:55 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E819265676; Tue, 31 Mar 2020 07:49:54 +0000 (UTC)
Message-Id: <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
In-Reply-To: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 31 Mar 2020 07:49:54 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only 44x uses 4xx now, so only keep one directory.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/44x/Makefile           |  9 +++++++-
 arch/powerpc/platforms/{4xx => 44x}/cpm.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/gpio.c    |  0
 .../powerpc/platforms/{4xx => 44x}/hsta_msi.c |  0
 arch/powerpc/platforms/44x/machine_check.c    | 14 +++++++++++
 arch/powerpc/platforms/{4xx => 44x}/msi.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/pci.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/pci.h     |  0
 arch/powerpc/platforms/{4xx => 44x}/soc.c     |  0
 arch/powerpc/platforms/{4xx => 44x}/uic.c     |  0
 arch/powerpc/platforms/4xx/Makefile           |  8 -------
 arch/powerpc/platforms/4xx/machine_check.c    | 23 -------------------
 arch/powerpc/platforms/Makefile               |  2 +-
 13 files changed, 23 insertions(+), 33 deletions(-)
 rename arch/powerpc/platforms/{4xx => 44x}/cpm.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/gpio.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/hsta_msi.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/msi.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/pci.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/pci.h (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/soc.c (100%)
 rename arch/powerpc/platforms/{4xx => 44x}/uic.c (100%)
 delete mode 100644 arch/powerpc/platforms/4xx/Makefile
 delete mode 100644 arch/powerpc/platforms/4xx/machine_check.c

diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index 5ba031f57652..ce6989a70b99 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y	+= misc_44x.o machine_check.o
+obj-y	+= misc_44x.o machine_check.o uic.o
 ifneq ($(CONFIG_PPC4xx_CPM),y)
 obj-y	+= idle.o
 endif
@@ -12,3 +12,10 @@ obj-$(CONFIG_CANYONLANDS)+= canyonlands.o
 obj-$(CONFIG_CURRITUCK)	+= ppc476.o
 obj-$(CONFIG_AKEBONO)	+= ppc476.o
 obj-$(CONFIG_FSP2)	+= fsp2.o
+
+obj-$(CONFIG_4xx_SOC)		+= soc.o
+obj-$(CONFIG_PCI)		+= pci.o
+obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
+obj-$(CONFIG_PPC4xx_MSI)	+= msi.o
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
index 90ad6ac529d2..bd46c729478d 100644
--- a/arch/powerpc/platforms/44x/machine_check.c
+++ b/arch/powerpc/platforms/44x/machine_check.c
@@ -8,6 +8,20 @@
 
 #include <asm/reg.h>
 
+int machine_check_4xx(struct pt_regs *regs)
+{
+	unsigned long reason = regs->dsisr;
+
+	if (reason & ESR_IMCP) {
+		printk("Instruction");
+		mtspr(SPRN_ESR, reason & ~ESR_IMCP);
+	} else
+		printk("Data");
+	printk(" machine check in kernel mode.\n");
+
+	return 0;
+}
+
 int machine_check_440A(struct pt_regs *regs)
 {
 	unsigned long reason = regs->dsisr;
diff --git a/arch/powerpc/platforms/4xx/msi.c b/arch/powerpc/platforms/44x/msi.c
similarity index 100%
rename from arch/powerpc/platforms/4xx/msi.c
rename to arch/powerpc/platforms/44x/msi.c
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
index d009d2e0b9e8..000000000000
--- a/arch/powerpc/platforms/4xx/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y				+= uic.o machine_check.o
-obj-$(CONFIG_4xx_SOC)		+= soc.o
-obj-$(CONFIG_PCI)		+= pci.o
-obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
-obj-$(CONFIG_PPC4xx_MSI)	+= msi.o
-obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
diff --git a/arch/powerpc/platforms/4xx/machine_check.c b/arch/powerpc/platforms/4xx/machine_check.c
deleted file mode 100644
index a71c29892a91..000000000000
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
-	unsigned long reason = regs->dsisr;
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
index f67b7fabac4e..5621cd0edfab 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_FSL_ULI1575)	+= fsl_uli1575.o
 
 obj-$(CONFIG_PPC_PMAC)		+= powermac/
 obj-$(CONFIG_PPC_CHRP)		+= chrp/
-obj-$(CONFIG_44x)		+= 4xx/ 44x/
+obj-$(CONFIG_44x)		+= 44x/
 obj-$(CONFIG_PPC_MPC512x)	+= 512x/
 obj-$(CONFIG_PPC_MPC52xx)	+= 52xx/
 obj-$(CONFIG_PPC_8xx)		+= 8xx/
-- 
2.25.0

