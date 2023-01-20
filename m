Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F467560D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 14:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz10g47Vmz3fMq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 00:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Kpc3iOto;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=KVCKgBmi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Kpc3iOto;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=KVCKgBmi;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz0qT57FMz3fHV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 00:35:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221718; x=1705757718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sjo55naQd9lYTfNlnMxN/zRcLhVyGOhekZtyT5t1Hko=;
  b=Kpc3iOtoxlf9ZDAzZn7PiSrZoScac/FAiVt3KU0hEVMaIz+1DhOCOZPN
   /enMEN+q80Orlnbi0tGTBt24CP7Y6BhySlgC0XwOo94t5cUHLuH/bfPlX
   nNGStg0aKMOQifSIBfZ1w8XOWyytmKggn2S8497mGamMeuAHl3yht/fsp
   xKWgO/eCdbLxG6WkScV3hJC61r6kHDimvmWBfoh1bkDtmMwc4Nr1P/iDB
   e33kYFh4yfrdfjAPcg19U1h+gC0kt0f4NFQXyBOhDTMIzE84TU/5hGEzF
   nfC8umH0aup10nzhdaCtDBvB8hKaDDitEFGw4zs7CHuFMnz2cJtPhBc8a
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561589"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:06 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:06 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221706; x=1705757706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sjo55naQd9lYTfNlnMxN/zRcLhVyGOhekZtyT5t1Hko=;
  b=KVCKgBmiPJSqtGq9bPVa9brxbK3L7Bn5Cfqb3pq6xgUKFzTSMvIV9VBy
   MGBslKyLiDQBKbI971aHhm4a7linuLc21vxpWlkhH7eeuLbgtxn2kf9Ou
   ALYo46gB5MDcTHb0P97+j3unLGTpLOE1ewE79qUFD5K0bKqUZgsYAfwWt
   5j9lNB7M32zG8McWs5RTj+C5bkMhch4Yzk0dzsUwwJ0yqsR7eAk49eqts
   1U5hrky3/kpNw98vq2k/R16PfRcgUCL2UPql/bd2lv4hYNE1PvmcvOEtD
   sYj7QWwp41UvJrVby6c4mFHtDCajn9IGPssKqsu7FwBAbMyaTYQajGfOg
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561588"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 92474280082;
	Fri, 20 Jan 2023 14:35:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 08/10] ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
Date: Fri, 20 Jan 2023 14:34:53 +0100
Message-Id: <20230120133455.3962413-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>, soc@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable drivers used on TQMLS102xA + MBLS1021A.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Changed symbols to 'm' where possible

 arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adcf..92628a160cfb3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -191,6 +191,7 @@ CONFIG_PCI_TEGRA=y
 CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCI_DRA7XX_EP=y
+CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
@@ -249,6 +250,7 @@ CONFIG_AHCI_ST=y
 CONFIG_AHCI_IMX=y
 CONFIG_AHCI_SUNXI=y
 CONFIG_AHCI_TEGRA=y
+CONFIG_AHCI_QORIQ=y
 CONFIG_SATA_HIGHBANK=y
 CONFIG_SATA_MV=y
 CONFIG_SATA_RCAR=y
@@ -329,6 +331,7 @@ CONFIG_TOUCHSCREEN_ADC=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_ELAN=m
 CONFIG_TOUCHSCREEN_MMS114=m
+CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_TOUCHSCREEN_WM97XX=m
 CONFIG_TOUCHSCREEN_ST1232=m
 CONFIG_TOUCHSCREEN_STMPE=y
@@ -483,6 +486,7 @@ CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_EM=y
+CONFIG_GPIO_MPC8XXX=y
 CONFIG_GPIO_MXC=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_SYSCON=y
@@ -493,6 +497,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_PALMAS=y
+CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_TPS6586X=y
 CONFIG_GPIO_TPS65910=y
 CONFIG_GPIO_TWL4030=y
@@ -533,6 +538,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_IMX_THERMAL=y
+CONFIG_QORIQ_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
@@ -821,6 +827,8 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SOC_TLV320AIC32X4=m
+CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y
@@ -830,6 +838,7 @@ CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_BRCMSTB=m
 CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=m
 CONFIG_USB_EHCI_HCD_STI=y
 CONFIG_USB_EHCI_EXYNOS=m
 CONFIG_USB_EHCI_MV=m
@@ -933,6 +942,8 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=m
 CONFIG_LEDS_CPCAP=m
+CONFIG_LEDS_PCA9532=m
+CONFIG_LEDS_PCA9532_GPIO=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_MAX8997=m
@@ -949,6 +960,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=y
 CONFIG_EDAC=y
+CONFIG_EDAC_LAYERSCAPE=y
 CONFIG_EDAC_HIGHBANK_MC=y
 CONFIG_EDAC_HIGHBANK_L2=y
 CONFIG_RTC_CLASS=y
@@ -962,6 +974,7 @@ CONFIG_RTC_DRV_MAX8997=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_PCF85363=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_TWL4030=y
-- 
2.34.1

