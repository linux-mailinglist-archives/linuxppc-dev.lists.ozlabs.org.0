Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507CF4235BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:14:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPJ1S27pjz3bXJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 13:14:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=v3FwTLC7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPHyp2frNz2yV7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 13:12:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=v3FwTLC7; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1010)
 id 4HPHyp21V9z4xbY; Wed,  6 Oct 2021 13:12:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1633486338;
 bh=q9KGFtgUxAh6yzeccRb0V25dSAPxdOTMUdctN6uuHYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v3FwTLC77AMaVYMaLqUTNInA26v8QN5X8R399TgBPIdVX3U48kTzYzj7/8EXBLrRY
 kc9ZRYC2X8cHOo1ut/9o8V4V6nnWXNeWsLusyAMdLLc302BnUJH0TNviCzr8eF5Mf+
 pHEt4Q7tNzYTfvRq64eahfpPUvvA/HSGCrEa6pDR5wX8hqfoqxaiElMM7yewuXiPyg
 3UlkmCH6MW1ZZvW2/iyM6rs8SklEEPmt+s/UHlZkRPR0jfa6sp0MUAYvwh3YcmL5du
 +sSimlAt+35N8ay3WNuGfw4LYdXXNXUs2Kfev2ZasYFdCEQiBp3kA6JSVDKWi0U6ga
 DGdrCPYzdMIEw==
From: Anton Blanchard <anton@ozlabs.org>
To: alistair@popple.id.au, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org,
 mikey@neuling.org, jk@codeconstruct.com.au
Subject: [RFC 4/5] ipmi:bt-bmc: No longer ASPEED specific
Date: Wed,  6 Oct 2021 13:12:04 +1100
Message-Id: <20211006021205.2579057-4-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006021205.2579057-1-anton@ozlabs.org>
References: <20211006021205.2579057-1-anton@ozlabs.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver is no longer specific to ASPEED, so rename the config option
and remove the dependency on ARCH_ASPEED.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 .../bindings/ipmi/{aspeed,ast2400-ibt-bmc.txt => ibt-bmc.txt}   | 2 +-
 arch/arm/configs/aspeed_g4_defconfig                            | 2 +-
 arch/arm/configs/aspeed_g5_defconfig                            | 2 +-
 arch/arm/configs/multi_v5_defconfig                             | 2 +-
 arch/arm/configs/multi_v7_defconfig                             | 2 +-
 drivers/char/ipmi/Kconfig                                       | 2 +-
 drivers/char/ipmi/Makefile                                      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/ipmi/{aspeed,ast2400-ibt-bmc.txt => ibt-bmc.txt} (93%)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
similarity index 93%
rename from Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
rename to Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
index 028268fd99ee..78ee716a950e 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
@@ -1,4 +1,4 @@
-* Aspeed BT (Block Transfer) IPMI interface
+* BT (Block Transfer) IPMI interface
 
 The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
 (BaseBoard Management Controllers) and the BT interface can be used to
diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index acaafa351d08..51696ba49c80 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -124,7 +124,7 @@ CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
-CONFIG_ASPEED_BT_IPMI_BMC=y
+CONFIG_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 480dbbb4ff91..758dac62f34f 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -141,7 +141,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_IPMI_KCS_BMC_SERIO=y
-CONFIG_ASPEED_BT_IPMI_BMC=y
+CONFIG_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 80a3ae02d759..f3ed5da74dfa 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -150,7 +150,7 @@ CONFIG_SERIAL_ATMEL_TTYAT=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_ASPEED_KCS_IPMI_BMC=m
-CONFIG_ASPEED_BT_IPMI_BMC=m
+CONFIG_BT_IPMI_BMC=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_TIMERIOMEM=m
 # CONFIG_I2C_COMPAT is not set
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ba67c4717dcc..03e97d95c251 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -384,7 +384,7 @@ CONFIG_SERIAL_OWL_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_ASPEED_KCS_IPMI_BMC=m
-CONFIG_ASPEED_BT_IPMI_BMC=m
+CONFIG_BT_IPMI_BMC=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_ST=y
 CONFIG_TCG_TPM=m
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 249b31197eea..8b2f0f675e5f 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -151,7 +151,7 @@ config IPMI_KCS_BMC_SERIO
 	  This support is also available as a module. The module will be
 	  called kcs_bmc_serio.
 
-config ASPEED_BT_IPMI_BMC
+config BT_IPMI_BMC
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
 	tristate "BT IPMI bmc driver"
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 84f47d18007f..75c71cbd568b 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
 obj-$(CONFIG_IPMI_KCS_BMC_SERIO) += kcs_bmc_serio.o
 obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
-obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
+obj-$(CONFIG_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
-- 
2.31.1

