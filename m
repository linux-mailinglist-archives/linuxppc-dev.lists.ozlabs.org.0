Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9CA43493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:19:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PdVT69hZzDrLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="P4HLxHwc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdKV2ChszDrG3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:11:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PdKL5TQFzB09Zc;
 Thu, 13 Jun 2019 11:11:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=P4HLxHwc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2ONhF_4wVYbN; Thu, 13 Jun 2019 11:11:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PdKL4PXKzB09ZZ;
 Thu, 13 Jun 2019 11:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560417110; bh=9bGT30RNddz+6s3Fj4Y0toOHWCeSsq4ECvV0JMuzbp0=;
 h=From:Subject:To:Cc:Date:From;
 b=P4HLxHwcjeetZUgsWp8CxZ5zAKbXDp6cZougJwXqv8LPd5UC654rQi0P0xrYzHoWU
 Ff12ygM2kNUiyu0P5aiF9inAJN8AdTQkxdyfmEu7XD+uioQo4BGOR+a4cInFTxul+4
 2O/S6MWGTnUow/jn1HaJpnME1llzHX6ii4MH6iZc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACA028B8C0;
 Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RwJpPaj8w0dh; Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C9878B8B9;
 Thu, 13 Jun 2019 11:11:51 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DF7F268B1D; Thu, 13 Jun 2019 09:11:50 +0000 (UTC)
Message-Id: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/8xx: move CPM1 related files from sysdev/ to
 platforms/8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Vitaly Bordug <vitb@kernel.crashing.org>, Scott Wood <oss@buserror.net>
Date: Thu, 13 Jun 2019 09:11:50 +0000 (UTC)
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

Only 8xx selects CPM1 and related CONFIG options are already
in platforms/8xx/Kconfig

This patch moves the related C files to platforms/8xx/.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/Makefile                 | 3 +++
 arch/powerpc/{sysdev => platforms/8xx}/cpm1.c       | 0
 arch/powerpc/{sysdev => platforms/8xx}/cpm_gpio.c   | 0
 arch/powerpc/{sysdev => platforms/8xx}/micropatch.c | 0
 arch/powerpc/sysdev/Makefile                        | 3 ---
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/powerpc/{sysdev => platforms/8xx}/cpm1.c (100%)
 rename arch/powerpc/{sysdev => platforms/8xx}/cpm_gpio.c (100%)
 rename arch/powerpc/{sysdev => platforms/8xx}/micropatch.c (100%)

diff --git a/arch/powerpc/platforms/8xx/Makefile b/arch/powerpc/platforms/8xx/Makefile
index 708ab099e886..10b338436655 100644
--- a/arch/powerpc/platforms/8xx/Makefile
+++ b/arch/powerpc/platforms/8xx/Makefile
@@ -3,6 +3,9 @@
 # Makefile for the PowerPC 8xx linux kernel.
 #
 obj-y			+= m8xx_setup.o machine_check.o pic.o
+obj-$(CONFIG_CPM1)		+= cpm1.o
+obj-$(CONFIG_UCODE_PATCH)	+= micropatch.o
+obj-$(CONFIG_8xx_GPIO)		+= cpm_gpio.o
 obj-$(CONFIG_MPC885ADS)   += mpc885ads_setup.o
 obj-$(CONFIG_MPC86XADS)   += mpc86xads_setup.o
 obj-$(CONFIG_PPC_EP88XC)  += ep88xc.o
diff --git a/arch/powerpc/sysdev/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
similarity index 100%
rename from arch/powerpc/sysdev/cpm1.c
rename to arch/powerpc/platforms/8xx/cpm1.c
diff --git a/arch/powerpc/sysdev/cpm_gpio.c b/arch/powerpc/platforms/8xx/cpm_gpio.c
similarity index 100%
rename from arch/powerpc/sysdev/cpm_gpio.c
rename to arch/powerpc/platforms/8xx/cpm_gpio.c
diff --git a/arch/powerpc/sysdev/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
similarity index 100%
rename from arch/powerpc/sysdev/micropatch.c
rename to arch/powerpc/platforms/8xx/micropatch.c
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index aaf23283ba0c..cfcade8270a9 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -37,12 +37,9 @@ obj-$(CONFIG_XILINX_PCI)	+= xilinx_pci.o
 obj-$(CONFIG_OF_RTC)		+= of_rtc.o
 
 obj-$(CONFIG_CPM)		+= cpm_common.o
-obj-$(CONFIG_CPM1)		+= cpm1.o
 obj-$(CONFIG_CPM2)		+= cpm2.o cpm2_pic.o cpm_gpio.o
-obj-$(CONFIG_8xx_GPIO)		+= cpm_gpio.o
 obj-$(CONFIG_QUICC_ENGINE)	+= cpm_common.o
 obj-$(CONFIG_PPC_DCR)		+= dcr.o
-obj-$(CONFIG_UCODE_PATCH)	+= micropatch.o
 
 obj-$(CONFIG_PPC_MPC512x)	+= mpc5xxx_clocks.o
 obj-$(CONFIG_PPC_MPC52xx)	+= mpc5xxx_clocks.o
-- 
2.13.3

