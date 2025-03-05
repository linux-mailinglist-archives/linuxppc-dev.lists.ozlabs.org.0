Return-Path: <linuxppc-dev+bounces-6731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D3A4FD1C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z78pL5D10z3brM;
	Wed,  5 Mar 2025 22:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=67.231.156.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741169594;
	cv=none; b=XZWgpXNtqWsGTsjhxUSxP5mnG6zoWP3rOanKA6tZuwE++kkO824cNL6X5QivRZ2l4GS83r304ZJtSbeFCPcbZZEXkh55hDzjVNozOWnjU1wpmUvy8MMSMYAvI36W6ZU6bSzXFQuIP8JiRnnLweFqS64D7LFcMkf45wVNSjHJqmaV5oGF0YBtp/9N80auIq6xPKn7JfSPhcllVdR5HVMmxxdCvmWK7RH7GVlEvjWVb3Bl4ZFZcuo7vH5D+/XKeeGsntj/vJ15FD1E2UsGF0EDOY1nLyXRIo3IQlORXjJc3ja0kzsInUFl/2N75WKlPy6NNhm7GMUB7kx45srxe7e4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741169594; c=relaxed/relaxed;
	bh=F9e0Cb9tLaOb1T60Zu9e6cfaCnCvXd/FfDedhqg7p3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJgiG0PBJwwIrgeNqHvGP+EhIJu2q+HJcV/3z5KXgO8igdfXxd23KGuR6YmZXsCyLg4yy94v7v92GhZrzpB/EbHrcLuuuEP0OAbUeFaO7nSLJv9EjnTLiQ9BN07y70WiY/BlB0+GlbiXR9lxeHu8mtoCsv27ca3uuTA/JuPrk7cQ4SOM2M+5K7i8aEDRUQrlWUa5QaLnCVkJkyyzpBc6mmsmtZzS82hMTyuqydAD0rINlCeY+HjJrKvTSlchCpjEz/Bl5s+eQ94a5uNOPaK6+rqY8SaD/zBoemyri/s+UOheKqet49YVkJDnbRImoVpm/l8Kz0Meix9dOl20aILxuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com; dkim=pass (2048-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=OK5kLWPk; dkim-atps=neutral; spf=pass (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com; envelope-from=prvs=2159823c4a=gcherian@marvell.com; receiver=lists.ozlabs.org) smtp.mailfrom=marvell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=OK5kLWPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com; envelope-from=prvs=2159823c4a=gcherian@marvell.com; receiver=lists.ozlabs.org)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z77fd1qc1z30XR;
	Wed,  5 Mar 2025 21:13:13 +1100 (AEDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5259YRxA026718;
	Wed, 5 Mar 2025 02:10:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=F
	9e0Cb9tLaOb1T60Zu9e6cfaCnCvXd/FfDedhqg7p3c=; b=OK5kLWPkcHTed7Kxr
	JC6lpRPbeUDHT91fhfAj+JW0VyYxIDjT9LkSKcDFxa/FuJs9tPmp7L23bD05gjLb
	UvE5Iijy6sRxEnhcz9eODpj7X4JHEKSkURG78PdF40hfbsE1vPO/hKUVY/OdRG2i
	Zewv65UEoWaRcSkO/RdD1+Ye2WnUteVHPDuQy2iBTcnj13FXjE9fIUbWjfxc+ARo
	E3nKk8kk2DniMmsZtNe/0EYYXiGfvHUeTj8TbGX2NBAyYTZYmVSLFg12o3khacP6
	lnz0YlpuYV6KeRisxrVkn+MelzbaPAMl+vykdLu/1Vl2QiXSQAte4arvaMYIX3N6
	UVR0w==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 456m36r21u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 02:10:41 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 5 Mar 2025 02:10:36 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 5 Mar 2025 02:10:35 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 913C55B6925;
	Wed,  5 Mar 2025 02:10:35 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <jwerner@chromium.org>,
        <evanbenn@chromium.org>, <kabel@kernel.org>, <krzk@kernel.org>,
        <mazziesaccount@gmail.com>, <thomas.richard@bootlin.com>,
        <lma@chromium.org>, <bleung@chromium.org>,
        <support.opensource@diasemi.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andy@kernel.org>, <paul@crapouillou.net>,
        <alexander.usyskin@intel.com>, <andreas.werner@men.de>,
        <daniel@thingy.jp>, <romain.perier@gmail.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
        <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
        <naveen@kernel.org>, <mwalle@kernel.org>, <xingyu.wu@starfivetech.com>,
        <ziv.xu@starfivetech.com>, <hayashi.kunihiko@socionext.com>,
        <mhiramat@kernel.org>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
        <linux-mips@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linuxppc-dev@lists.ozlabs.org>, <patches@opensource.cirrus.com>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Date: Wed, 5 Mar 2025 10:10:24 +0000
Message-ID: <20250305101025.2279951-2-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=MPeamNZl c=1 sm=1 tr=0 ts=67c82322 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=M5GUcnROAAAA:8 a=X7iFPl28lcXy_p1_oFgA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: Dwjdb9jXf7HKGoz3EIqWJP7grkdWKQKD
X-Proofpoint-ORIG-GUID: Dwjdb9jXf7HKGoz3EIqWJP7grkdWKQKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A new option flag is added to watchdog_info. This helps the watchdog
core to check whether stop functions would sleep or not.
The option flags of individual drivers are also updated accordingly.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 drivers/watchdog/advantech_ec_wdt.c | 3 ++-
 drivers/watchdog/arm_smc_wdt.c      | 3 ++-
 drivers/watchdog/armada_37xx_wdt.c  | 2 +-
 drivers/watchdog/asm9260_wdt.c      | 2 +-
 drivers/watchdog/bcm47xx_wdt.c      | 3 ++-
 drivers/watchdog/bd9576_wdt.c       | 2 +-
 drivers/watchdog/bd96801_wdt.c      | 2 +-
 drivers/watchdog/cgbc_wdt.c         | 2 +-
 drivers/watchdog/cros_ec_wdt.c      | 5 ++++-
 drivers/watchdog/da9052_wdt.c       | 3 ++-
 drivers/watchdog/da9055_wdt.c       | 4 +++-
 drivers/watchdog/da9062_wdt.c       | 4 +++-
 drivers/watchdog/da9063_wdt.c       | 4 +++-
 drivers/watchdog/db8500_wdt.c       | 5 ++++-
 drivers/watchdog/dw_wdt.c           | 5 +++--
 drivers/watchdog/f71808e_wdt.c      | 3 ++-
 drivers/watchdog/gpio_wdt.c         | 2 +-
 drivers/watchdog/i6300esb.c         | 5 ++++-
 drivers/watchdog/imx_sc_wdt.c       | 2 +-
 drivers/watchdog/intel-mid_wdt.c    | 5 ++++-
 drivers/watchdog/it87_wdt.c         | 5 ++++-
 drivers/watchdog/jz4740_wdt.c       | 5 ++++-
 drivers/watchdog/kempld_wdt.c       | 3 ++-
 drivers/watchdog/lenovo_se10_wdt.c  | 5 ++++-
 drivers/watchdog/max77620_wdt.c     | 5 ++++-
 drivers/watchdog/mei_wdt.c          | 3 ++-
 drivers/watchdog/menf21bmc_wdt.c    | 4 +++-
 drivers/watchdog/mlx_wdt.c          | 2 +-
 drivers/watchdog/msc313e_wdt.c      | 5 ++++-
 drivers/watchdog/npcm_wdt.c         | 3 ++-
 drivers/watchdog/omap_wdt.c         | 5 ++++-
 drivers/watchdog/pm8916_wdt.c       | 5 +++--
 drivers/watchdog/pseries-wdt.c      | 2 +-
 drivers/watchdog/rave-sp-wdt.c      | 5 ++++-
 drivers/watchdog/renesas_wdt.c      | 7 +++++--
 drivers/watchdog/retu_wdt.c         | 5 ++++-
 drivers/watchdog/rn5t618_wdt.c      | 6 ++++--
 drivers/watchdog/rzg2l_wdt.c        | 5 ++++-
 drivers/watchdog/rzv2h_wdt.c        | 5 ++++-
 drivers/watchdog/shwdt.c            | 6 ++++--
 drivers/watchdog/sl28cpld_wdt.c     | 5 ++++-
 drivers/watchdog/softdog.c          | 5 ++++-
 drivers/watchdog/sp805_wdt.c        | 5 ++++-
 drivers/watchdog/starfive-wdt.c     | 3 ++-
 drivers/watchdog/stpmic1_wdt.c      | 5 ++++-
 drivers/watchdog/ts4800_wdt.c       | 5 ++++-
 drivers/watchdog/twl4030_wdt.c      | 5 ++++-
 drivers/watchdog/uniphier_wdt.c     | 3 ++-
 drivers/watchdog/w83627hf_wdt.c     | 5 ++++-
 drivers/watchdog/wm831x_wdt.c       | 5 ++++-
 drivers/watchdog/wm8350_wdt.c       | 5 ++++-
 drivers/watchdog/xen_wdt.c          | 5 ++++-
 drivers/watchdog/ziirave_wdt.c      | 5 ++++-
 include/uapi/linux/watchdog.h       | 1 +
 54 files changed, 161 insertions(+), 58 deletions(-)

diff --git a/drivers/watchdog/advantech_ec_wdt.c b/drivers/watchdog/advantech_ec_wdt.c
index 7c380f90ca58..5b62c675c2cb 100644
--- a/drivers/watchdog/advantech_ec_wdt.c
+++ b/drivers/watchdog/advantech_ec_wdt.c
@@ -131,7 +131,8 @@ static const struct watchdog_info adv_ec_wdt_info = {
 	.identity =	DRIVER_NAME,
 	.options =	WDIOF_SETTIMEOUT |
 			WDIOF_MAGICCLOSE |
-			WDIOF_KEEPALIVEPING,
+			WDIOF_KEEPALIVEPING |
+			WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops adv_ec_wdt_ops = {
diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index 8f3d0c3a005f..794cf0086912 100644
--- a/drivers/watchdog/arm_smc_wdt.c
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops smcwd_ops = {
diff --git a/drivers/watchdog/armada_37xx_wdt.c b/drivers/watchdog/armada_37xx_wdt.c
index a17a7911771a..4e5ed9e1ed90 100644
--- a/drivers/watchdog/armada_37xx_wdt.c
+++ b/drivers/watchdog/armada_37xx_wdt.c
@@ -232,7 +232,7 @@ static int armada_37xx_wdt_stop(struct watchdog_device *wdt)
 }
 
 static const struct watchdog_info armada_37xx_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_STOP_MAYSLEEP,
 	.identity = "Armada 37xx Watchdog",
 };
 
diff --git a/drivers/watchdog/asm9260_wdt.c b/drivers/watchdog/asm9260_wdt.c
index 45047e514b8e..24402206659b 100644
--- a/drivers/watchdog/asm9260_wdt.c
+++ b/drivers/watchdog/asm9260_wdt.c
@@ -181,7 +181,7 @@ static int asm9260_restart(struct watchdog_device *wdd, unsigned long action,
 
 static const struct watchdog_info asm9260_wdt_ident = {
 	.options          =     WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING
-				| WDIOF_MAGICCLOSE,
+				| WDIOF_MAGICCLOSE | WDIOF_STOP_MAYSLEEP,
 	.identity         =	"Alphascale asm9260 Watchdog",
 };
 
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
index 06a54c7de40b..93771f12895e 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -162,7 +162,8 @@ static const struct watchdog_info bcm47xx_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
 				WDIOF_KEEPALIVEPING |
-				WDIOF_MAGICCLOSE,
+				WDIOF_MAGICCLOSE |
+				WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops bcm47xx_wdt_soft_ops = {
diff --git a/drivers/watchdog/bd9576_wdt.c b/drivers/watchdog/bd9576_wdt.c
index f00ea1b4e40b..876ac9636f32 100644
--- a/drivers/watchdog/bd9576_wdt.c
+++ b/drivers/watchdog/bd9576_wdt.c
@@ -68,7 +68,7 @@ static int bd9576_wdt_stop(struct watchdog_device *wdd)
 
 static const struct watchdog_info bd957x_wdt_ident = {
 	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
-			  WDIOF_SETTIMEOUT,
+			  WDIOF_SETTIMEOUT | WDIOF_STOP_MAYSLEEP,
 	.identity	= "BD957x Watchdog",
 };
 
diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
index 12b74fd2bc05..4985a4724a6b 100644
--- a/drivers/watchdog/bd96801_wdt.c
+++ b/drivers/watchdog/bd96801_wdt.c
@@ -89,7 +89,7 @@ static int bd96801_wdt_stop(struct watchdog_device *wdt)
 
 static const struct watchdog_info bd96801_wdt_info = {
 	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
-			  WDIOF_SETTIMEOUT,
+			  WDIOF_SETTIMEOUT | WDIOF_STOP_MAYSLEEP,
 	.identity	= "BD96801 Watchdog",
 };
 
diff --git a/drivers/watchdog/cgbc_wdt.c b/drivers/watchdog/cgbc_wdt.c
index 702b055ba6f4..3ec2d53bb8e0 100644
--- a/drivers/watchdog/cgbc_wdt.c
+++ b/drivers/watchdog/cgbc_wdt.c
@@ -151,7 +151,7 @@ static int cgbc_wdt_set_timeout(struct watchdog_device *wdd,
 static const struct watchdog_info cgbc_wdt_info = {
 	.identity	= "CGBC Watchdog",
 	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
-		WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT
+		WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT | WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops cgbc_wdt_ops = {
diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
index ba045e29f9a5..5cefeb388ef5 100644
--- a/drivers/watchdog/cros_ec_wdt.c
+++ b/drivers/watchdog/cros_ec_wdt.c
@@ -107,7 +107,10 @@ static int cros_ec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 }
 
 static const struct watchdog_info cros_ec_wdt_ident = {
-	.options          = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options          = WDIOF_SETTIMEOUT |
+			    WDIOF_KEEPALIVEPING |
+			    WDIOF_MAGICCLOSE |
+			    WDIOF_STOP_MAYSLEEP,
 	.firmware_version = 0,
 	.identity         = DRV_NAME,
 };
diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 77039f2f0be5..ac6980342fcd 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -139,7 +139,8 @@ static const struct watchdog_info da9052_wdt_info = {
 			WDIOF_KEEPALIVEPING |
 			WDIOF_CARDRESET |
 			WDIOF_OVERHEAT |
-			WDIOF_POWERUNDER,
+			WDIOF_POWERUNDER |
+			WDIOF_STOP_MAYSLEEP,
 	.identity	= "DA9052 Watchdog",
 };
 
diff --git a/drivers/watchdog/da9055_wdt.c b/drivers/watchdog/da9055_wdt.c
index 9d5a2009466f..dbfe02647a62 100644
--- a/drivers/watchdog/da9055_wdt.c
+++ b/drivers/watchdog/da9055_wdt.c
@@ -105,7 +105,9 @@ static int da9055_wdt_stop(struct watchdog_device *wdt_dev)
 }
 
 static const struct watchdog_info da9055_wdt_info = {
-	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_STOP_MAYSLEEP,
 	.identity	= "DA9055 Watchdog",
 };
 
diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 426962547df1..06507af68f79 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -180,7 +180,9 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 }
 
 static const struct watchdog_info da9062_watchdog_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "DA9062 WDT",
 };
 
diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 92e1b78ff481..ac7f5f14a21d 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -198,7 +198,9 @@ static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 }
 
 static const struct watchdog_info da9063_watchdog_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "DA9063 Watchdog",
 };
 
diff --git a/drivers/watchdog/db8500_wdt.c b/drivers/watchdog/db8500_wdt.c
index 97148ac0aa54..dfcb671f1a3e 100644
--- a/drivers/watchdog/db8500_wdt.c
+++ b/drivers/watchdog/db8500_wdt.c
@@ -61,7 +61,10 @@ static int db8500_wdt_set_timeout(struct watchdog_device *wdd,
 }
 
 static const struct watchdog_info db8500_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "DB8500 WDT",
 	.firmware_version = 1,
 };
diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 26efca9ae0e7..74cd691cf900 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -336,13 +336,14 @@ static unsigned int dw_wdt_get_timeleft(struct watchdog_device *wdd)
 
 static const struct watchdog_info dw_wdt_ident = {
 	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE | WDIOF_STOP_MAYSLEEP,
 	.identity	= "Synopsys DesignWare Watchdog",
 };
 
 static const struct watchdog_info dw_wdt_pt_ident = {
 	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
-			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
+			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE |
+			  WDIOF_STOP_MAYSLEEP,
 	.identity	= "Synopsys DesignWare Watchdog",
 };
 
diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 6a16d3d0bb1e..4f47023d1992 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -469,7 +469,8 @@ static int fintek_wdt_probe(struct platform_device *pdev)
 	wd->ident.options = WDIOF_SETTIMEOUT
 			| WDIOF_MAGICCLOSE
 			| WDIOF_KEEPALIVEPING
-			| WDIOF_CARDRESET;
+			| WDIOF_CARDRESET
+			| WDIOF_STOP_MAYSLEEP;
 
 	snprintf(wd->ident.identity,
 		sizeof(wd->ident.identity), "%s watchdog",
diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index a7b814ea740b..fc5143b14553 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -93,7 +93,7 @@ static int gpio_wdt_stop(struct watchdog_device *wdd)
 
 static const struct watchdog_info gpio_wdt_ident = {
 	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
-			  WDIOF_SETTIMEOUT,
+			  WDIOF_SETTIMEOUT | WDIOF_STOP_MAYSLEEP,
 	.identity	= "GPIO Watchdog",
 };
 
diff --git a/drivers/watchdog/i6300esb.c b/drivers/watchdog/i6300esb.c
index a30835f547b3..ccbfd610a1a8 100644
--- a/drivers/watchdog/i6300esb.c
+++ b/drivers/watchdog/i6300esb.c
@@ -190,7 +190,10 @@ static int esb_timer_set_heartbeat(struct watchdog_device *wdd,
 
 static struct watchdog_info esb_info = {
 	.identity = ESB_MODULE_NAME,
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops esb_ops = {
diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 1280b9b1ec2a..2b5e9db39528 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -172,7 +172,7 @@ static const struct watchdog_ops imx_sc_wdt_ops = {
 static struct watchdog_info imx_sc_wdt_info = {
 	.identity	= "i.MX SC watchdog timer",
 	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE | WDIOF_STOP_MAYSLEEP,
 };
 
 static int imx_sc_wdt_probe(struct platform_device *pdev)
diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
index 756d262dc580..2f8446c8643a 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -112,7 +112,10 @@ static irqreturn_t mid_wdt_irq(int irq, void *dev_id)
 
 static const struct watchdog_info mid_wdt_info = {
 	.identity = "Intel MID SCU watchdog",
-	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE,
+	.options = WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops mid_wdt_ops = {
diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index a1e23dce8810..e4ce51978a8b 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -265,7 +265,10 @@ static const struct dmi_system_id it87_quirks[] = {
 };
 
 static const struct watchdog_info ident = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.firmware_version = 1,
 	.identity = WATCHDOG_NAME,
 };
diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 395bde79e292..4cfdc367b7c2 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -112,7 +112,10 @@ static int jz4740_wdt_restart(struct watchdog_device *wdt_dev,
 }
 
 static const struct watchdog_info jz4740_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "jz4740 Watchdog",
 };
 
diff --git a/drivers/watchdog/kempld_wdt.c b/drivers/watchdog/kempld_wdt.c
index e6c7a2906680..b1b8cc588d49 100644
--- a/drivers/watchdog/kempld_wdt.c
+++ b/drivers/watchdog/kempld_wdt.c
@@ -419,7 +419,8 @@ static const struct watchdog_info kempld_wdt_info = {
 	.options	= WDIOF_SETTIMEOUT |
 			WDIOF_KEEPALIVEPING |
 			WDIOF_MAGICCLOSE |
-			WDIOF_PRETIMEOUT
+			WDIOF_PRETIMEOUT |
+			WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops kempld_wdt_ops = {
diff --git a/drivers/watchdog/lenovo_se10_wdt.c b/drivers/watchdog/lenovo_se10_wdt.c
index cd0500e5080b..be5e27d4aa28 100644
--- a/drivers/watchdog/lenovo_se10_wdt.c
+++ b/drivers/watchdog/lenovo_se10_wdt.c
@@ -140,7 +140,10 @@ static int wdt_ping(struct watchdog_device *wdog)
 }
 
 static const struct watchdog_info wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "Lenovo SE10 Watchdog",
 };
 
diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
index d3ced783a5f4..b6ed7f52c1c3 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -144,7 +144,10 @@ static int max77620_wdt_set_timeout(struct watchdog_device *wdt_dev,
 
 static const struct watchdog_info max77620_wdt_info = {
 	.identity = "max77620-watchdog",
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops max77620_wdt_ops = {
diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
index c7a7235e6224..691df89d90b1 100644
--- a/drivers/watchdog/mei_wdt.c
+++ b/drivers/watchdog/mei_wdt.c
@@ -315,7 +315,8 @@ static struct watchdog_info wd_info = {
 	.identity = INTEL_AMT_WATCHDOG_ID,
 	.options  = WDIOF_KEEPALIVEPING |
 		    WDIOF_SETTIMEOUT |
-		    WDIOF_ALARMONLY,
+		    WDIOF_ALARMONLY |
+		    WDIOF_STOP_MAYSLEEP,
 };
 
 /**
diff --git a/drivers/watchdog/menf21bmc_wdt.c b/drivers/watchdog/menf21bmc_wdt.c
index 81ebdfc371f4..589313d82a16 100644
--- a/drivers/watchdog/menf21bmc_wdt.c
+++ b/drivers/watchdog/menf21bmc_wdt.c
@@ -99,7 +99,9 @@ static int menf21bmc_wdt_ping(struct watchdog_device *wdt)
 }
 
 static const struct watchdog_info menf21bmc_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = DEVNAME,
 };
 
diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
index 5dc69363f06a..38452f97b79f 100644
--- a/drivers/watchdog/mlx_wdt.c
+++ b/drivers/watchdog/mlx_wdt.c
@@ -24,7 +24,7 @@
 #define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
 #define MLXREG_WDT_MIN_TIMEOUT		1
 #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
-				 WDIOF_SETTIMEOUT)
+				 WDIOF_SETTIMEOUT | WDIOF_STOP_MAYSLEEP)
 
 /**
  * struct mlxreg_wdt - wd private data:
diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
index 90171431fc59..532f575f48bd 100644
--- a/drivers/watchdog/msc313e_wdt.c
+++ b/drivers/watchdog/msc313e_wdt.c
@@ -77,7 +77,10 @@ static int msc313e_wdt_settimeout(struct watchdog_device *wdev, unsigned int new
 
 static const struct watchdog_info msc313e_wdt_ident = {
 	.identity = "MSC313e watchdog",
-	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops msc313e_wdt_ops = {
diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index a5dd1c230137..4988be7db94c 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -176,7 +176,8 @@ static const struct watchdog_info npcm_wdt_info = {
 	.identity	= KBUILD_MODNAME,
 	.options	= WDIOF_SETTIMEOUT
 			| WDIOF_KEEPALIVEPING
-			| WDIOF_MAGICCLOSE,
+			| WDIOF_MAGICCLOSE
+			| WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops npcm_wdt_ops = {
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index d523428a8d22..7b0a2b7c3694 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -213,7 +213,10 @@ static unsigned int omap_wdt_get_timeleft(struct watchdog_device *wdog)
 }
 
 static const struct watchdog_info omap_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "OMAP Watchdog",
 };
 
diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 007ed139ab96..d384803f0fab 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -117,14 +117,15 @@ static irqreturn_t pm8916_wdt_isr(int irq, void *arg)
 
 static const struct watchdog_info pm8916_wdt_ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
-		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER,
+		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "QCOM PM8916 PON WDT",
 };
 
 static const struct watchdog_info pm8916_wdt_pt_ident = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
 		   WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER |
-		   WDIOF_PRETIMEOUT,
+		   WDIOF_PRETIMEOUT | WDIOF_STOP_MAYSLEEP,
 	.identity = "QCOM PM8916 PON WDT",
 };
 
diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
index 7f53b5293409..7f0b7a111e38 100644
--- a/drivers/watchdog/pseries-wdt.c
+++ b/drivers/watchdog/pseries-wdt.c
@@ -133,7 +133,7 @@ static int pseries_wdt_stop(struct watchdog_device *wdd)
 static struct watchdog_info pseries_wdt_info = {
 	.identity = DRV_NAME,
 	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
-	    | WDIOF_PRETIMEOUT,
+	    | WDIOF_PRETIMEOUT | WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops pseries_wdt_ops = {
diff --git a/drivers/watchdog/rave-sp-wdt.c b/drivers/watchdog/rave-sp-wdt.c
index 5d1c2176d445..3b366196a1ca 100644
--- a/drivers/watchdog/rave-sp-wdt.c
+++ b/drivers/watchdog/rave-sp-wdt.c
@@ -211,7 +211,10 @@ static int rave_sp_wdt_ping(struct watchdog_device *wdd)
 }
 
 static const struct watchdog_info rave_sp_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "RAVE SP Watchdog",
 };
 
diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index c0b2a9c5250d..e328f0b6915e 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -158,8 +158,11 @@ static int rwdt_restart(struct watchdog_device *wdev, unsigned long action,
 }
 
 static const struct watchdog_info rwdt_ident = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
-		WDIOF_CARDRESET,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_CARDRESET |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "Renesas WDT Watchdog",
 };
 
diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index 2b9017e1cd91..1ff740a97d96 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -87,7 +87,10 @@ static int retu_wdt_set_timeout(struct watchdog_device *wdog,
 }
 
 static const struct watchdog_info retu_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "Retu watchdog",
 };
 
diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 87d06d210ac9..db56540e5d94 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -125,8 +125,10 @@ static int rn5t618_wdt_ping(struct watchdog_device *wdt_dev)
 }
 
 static const struct watchdog_info rn5t618_wdt_info = {
-	.options	= WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
-			  WDIOF_KEEPALIVEPING,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_STOP_MAYSLEEP,
 	.identity	= DRIVER_NAME,
 };
 
diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 11bbe48160ec..b3569c881abe 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -219,7 +219,10 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 }
 
 static const struct watchdog_info rzg2l_wdt_ident = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "Renesas RZ/G2L WDT Watchdog",
 };
 
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..8c96e872e2a2 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -135,7 +135,10 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 }
 
 static const struct watchdog_info rzv2h_wdt_ident = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "Renesas RZ/V2H WDT Watchdog",
 };
 
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 7f0150c39421..246ff99af3be 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -194,8 +194,10 @@ static void sh_wdt_ping(struct timer_list *t)
 }
 
 static const struct watchdog_info sh_wdt_info = {
-	.options		= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
-				  WDIOF_MAGICCLOSE,
+	.options		= WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT |
+				  WDIOF_MAGICCLOSE |
+				  WDIOF_STOP_MAYSLEEP,
 	.firmware_version	= 1,
 	.identity		= "SH WDT",
 };
diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
index 8630c29818f2..bee1f597615c 100644
--- a/drivers/watchdog/sl28cpld_wdt.c
+++ b/drivers/watchdog/sl28cpld_wdt.c
@@ -104,7 +104,10 @@ static int sl28cpld_wdt_set_timeout(struct watchdog_device *wdd,
 }
 
 static const struct watchdog_info sl28cpld_wdt_info = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "sl28cpld watchdog",
 };
 
diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 7a1096265f18..4cc481157a5d 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -162,7 +162,10 @@ static int softdog_stop(struct watchdog_device *w)
 
 static struct watchdog_info softdog_info = {
 	.identity = "Software Watchdog",
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops softdog_ops = {
diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index c2125f204a13..fed64b4ba991 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -214,7 +214,10 @@ static int wdt_disable(struct watchdog_device *wdd)
 }
 
 static const struct watchdog_info wdt_info = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = MODULE_NAME,
 };
 
diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 355918d62f63..46aebeeca2ee 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -409,7 +409,8 @@ static int starfive_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
-#define STARFIVE_WDT_OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
+#define STARFIVE_WDT_OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | \
+				WDIOF_MAGICCLOSE | WDIOF_STOP_MAYSLEEP)
 
 static const struct watchdog_info starfive_wdt_info = {
 	.options = STARFIVE_WDT_OPTIONS,
diff --git a/drivers/watchdog/stpmic1_wdt.c b/drivers/watchdog/stpmic1_wdt.c
index 45d0c543466f..2783ebd74a54 100644
--- a/drivers/watchdog/stpmic1_wdt.c
+++ b/drivers/watchdog/stpmic1_wdt.c
@@ -67,7 +67,10 @@ static int pmic_wdt_set_timeout(struct watchdog_device *wdd,
 }
 
 static const struct watchdog_info pmic_watchdog_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "STPMIC1 PMIC Watchdog",
 };
 
diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
index 24b1ad52102e..2a3b917be46a 100644
--- a/drivers/watchdog/ts4800_wdt.c
+++ b/drivers/watchdog/ts4800_wdt.c
@@ -100,7 +100,10 @@ static const struct watchdog_ops ts4800_wdt_ops = {
 };
 
 static const struct watchdog_info ts4800_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "TS-4800 Watchdog",
 };
 
diff --git a/drivers/watchdog/twl4030_wdt.c b/drivers/watchdog/twl4030_wdt.c
index 8c80d04811e4..b80098bf23f7 100644
--- a/drivers/watchdog/twl4030_wdt.c
+++ b/drivers/watchdog/twl4030_wdt.c
@@ -45,7 +45,10 @@ static int twl4030_wdt_set_timeout(struct watchdog_device *wdt,
 }
 
 static const struct watchdog_info twl4030_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "TWL4030 Watchdog",
 };
 
diff --git a/drivers/watchdog/uniphier_wdt.c b/drivers/watchdog/uniphier_wdt.c
index 8e9242c23022..b2e7840c0f61 100644
--- a/drivers/watchdog/uniphier_wdt.c
+++ b/drivers/watchdog/uniphier_wdt.c
@@ -168,7 +168,8 @@ static const struct watchdog_info uniphier_wdt_info = {
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
 			  WDIOF_MAGICCLOSE |
-			  WDIOF_OVERHEAT,
+			  WDIOF_OVERHEAT |
+			  WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops uniphier_wdt_ops = {
diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
index bc33b63c5a5d..139adb8eee7a 100644
--- a/drivers/watchdog/w83627hf_wdt.c
+++ b/drivers/watchdog/w83627hf_wdt.c
@@ -314,7 +314,10 @@ static unsigned int wdt_get_time(struct watchdog_device *wdog)
  */
 
 static const struct watchdog_info wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "W83627HF Watchdog",
 };
 
diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
index d96ad8f38bd2..a7ce9c797725 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -156,7 +156,10 @@ static int wm831x_wdt_set_timeout(struct watchdog_device *wdt_dev,
 }
 
 static const struct watchdog_info wm831x_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "WM831x Watchdog",
 };
 
diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wdt.c
index c82c1b77d91b..476a6e8dcf7d 100644
--- a/drivers/watchdog/wm8350_wdt.c
+++ b/drivers/watchdog/wm8350_wdt.c
@@ -117,7 +117,10 @@ static int wm8350_wdt_ping(struct watchdog_device *wdt_dev)
 }
 
 static const struct watchdog_info wm8350_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "WM8350 Watchdog",
 };
 
diff --git a/drivers/watchdog/xen_wdt.c b/drivers/watchdog/xen_wdt.c
index b343f421dc72..0248d9c8c451 100644
--- a/drivers/watchdog/xen_wdt.c
+++ b/drivers/watchdog/xen_wdt.c
@@ -99,7 +99,10 @@ static unsigned int xen_wdt_get_timeleft(struct watchdog_device *wdd)
 
 static struct watchdog_info xen_wdt_info = {
 	.identity = DRV_NAME,
-	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_STOP_MAYSLEEP,
 };
 
 static const struct watchdog_ops xen_wdt_ops = {
diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index fcc1ba02e75b..ee42099c8b46 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -417,7 +417,10 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 }
 
 static const struct watchdog_info ziirave_wdt_info = {
-	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.options = WDIOF_SETTIMEOUT |
+		   WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_STOP_MAYSLEEP,
 	.identity = "RAVE Switch Watchdog",
 };
 
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..83b6407c712f 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -48,6 +48,7 @@ struct watchdog_info {
 #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
 #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
 					   other external alarm not a reboot */
+#define WDIOF_STOP_MAYSLEEP	0x0800  /* Watchdog Stop may sleep */
 #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
 
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
-- 
2.34.1


