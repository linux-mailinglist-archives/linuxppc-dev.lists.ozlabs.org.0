Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 502892C8F6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:50:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHRj42gJzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.7.114;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=otpHa7GP; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70114.outbound.protection.outlook.com [40.107.7.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8914q3yzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoDQoxrwxlMXVgTIQRagqUzXzdLKtYFcmaUEEKpAN05ArLlScgRIdgLHmXvSxCFy1fp8TiUa1vIENU/gs8WT1ITVLGRVGt3sVnvk9XGHwbnJw/zimJWM17jg9Kt0W7vHuGuhxQypqH38QgvUgWnL/L36gzLrPDHQD8NqWF430HN9TN5agOMGoyFC5DpbbQXeYzJ7RjMABhi8SthAYH9HZ03ty8hebMdw1tJGjdbVA4xn6S0Kx2n4SWFUYUQoyd3eLS3Rs2FHXtqXurrnr+SNFmZewlShQAaycvtqzKX4x15sFAXPKoSBwNo2HPjoGaKtWsDKrV16z0AE257pFIfbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H04iWc8HQ4MFHYld7372V1SxOvcFOJnMeG1ejoJQJCI=;
 b=CsKgoK6ejn9yEjNZ+8+kqbwgTqh8LviF1heqxKmfruhCvAairmq+3UN8Nny5fF3G6LQEHbMlFTb2F6RGqKxeGaep2+EI0HIRoSE/B1crwbF/rw1zd3Jkdrlm6n6hoqCvlJVqK8LHKpAEwEJjkMB3dGqhez2dssfaGPcsYBosSU7PEfj6rxhbNJ9ALxBO8scwl5xryQO6q+f9PlJxdE4bodwO6aJLhquCXwTtnmmkvzy7l4AYuMrwhXBoi7Gw8+XQWHUxTAGA7Mc+vBr11sfjYkoxYBf0KEsIPdJnzdMT7BVvAcAprlcM+WVNtueC+jkZDL/Szy7yotkL9MHzavoY6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H04iWc8HQ4MFHYld7372V1SxOvcFOJnMeG1ejoJQJCI=;
 b=otpHa7GPsxnmlHOaQfEmLGG+OleP9NKDbG3PrCNIt2ATiABhyvfCUx5c/tMA9M9B9osEwBVkf1idbYkT51jtbfAhSUA/9dxKe9PCnHFxDFiSJOCABCDMtSHyH5TLrUJ7AlrLRzPdEhSbXKCW3qVYUpSighhAwLBMoDfx3Mq9kac=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:45 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:45 +0000
From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 tony@atomide.com, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@siol.net, thierry.reding@gmail.com, jonathanh@nvidia.com,
 catalin.marinas@arm.com, will@kernel.org, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, lee.jones@linaro.org,
 sam@ravnborg.org, emil.l.velikov@gmail.com, daniel.thompson@linaro.org,
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:33 +0000
Message-Id: <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
Content-Type: text/plain
X-Originating-IP: [193.8.40.112]
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To DB6PR0602MB2886.eurprd06.prod.outlook.com
 (2603:10a6:4:9b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.112) by
 ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 378d1a03-2167-4a99-a857-08d89543a5f1
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB2887E02DCDE569D82F28730DA6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1v7BRtvj6Wph1rVDDNXFGpSiS4bwm9TCVQKlmtkbHlbQCzmQLcfmTRKuocx2oQN6TKLHxoQ6u6ugH9MuCaBPX2dms0U/yosjrwhqN46WYM4BpnYJmDuBlPYseHVgEinF/dnTiEwhePvJRI6COISIFBMageCLpTBf531tampgkMN6CT8/UhQWxzVqpfTtYRNQwMXa3xYzRPhSJSUzPQu2qirHy/VWygIR3/SkuJ72IpZEbU4BRW9sQtiCPG3J6xh8xMu1FLUzldvS1yk2p9B9uesyp8Zywz5k50sA55V3VarUIRL2Q5707pi2UFAK3x5RkIRZqnLpwQGUFMUaxzpWNtTEQ2UUTrR6Ukx14hCoEy3pjNz6fSpnJ77ARhiw04+KoOIYaAMLCZxrKOwz/+vDfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ioiWRWARBCkY3i3F1/dpZh9d01ehbe9/z7MIp0Fm9P/oGL//PZee7RDtfsct?=
 =?us-ascii?Q?/RaZMyVhBnsO38bBLa4IRGttkmEJjHNo4OevOBEUTLyB47jN8M9RScTbDTjR?=
 =?us-ascii?Q?z1vv1H8+qx3KsqjBQG6G65Gh34BXuvExaP7hC4Vi3PDM+NEpv+umJu62nOGb?=
 =?us-ascii?Q?X50zSIQoQItpyIMaN9claL9FBeVIOtLMN9EYZa5yGXLwcelS9ZA7xNylq3IA?=
 =?us-ascii?Q?uas8il+u6832Z/2T5o7Q51s6No7PWIzNb6y5tnFpbgDoAT+j8UGJNKyC+vDm?=
 =?us-ascii?Q?bxocEnMyE3Xk84rBAK00BGr/ngwl4bE+8YcUM8jfDadE5f7J/Wpu6dhTy1sl?=
 =?us-ascii?Q?6VTaWmfj6aOZsRQKKMYG+u2aW1Zzzxwd5cqYwYSvUhnXFLyQabYV5c4eBXyQ?=
 =?us-ascii?Q?Q5f9ADx5hmuQNElAJtEGq5ZMWcOvsFkt3HnuI4bnSMteaq2jKvl23XHhKGTi?=
 =?us-ascii?Q?/qY2auF8blcslx9mYlCqYAC4OnFCKx50z0PCTd/iSHmAirVDh78xIhzOlJy8?=
 =?us-ascii?Q?Jwh7kqJQeOOsMjM84zWAZ3QkN5op4IjZsSt374wN1zn9LeMPKecsOtOavbdL?=
 =?us-ascii?Q?IGC4FSpB8BSsm92TJq3v3AypLiH678oMh+PduvNY3qCXjka/RkP1K+HrSW7b?=
 =?us-ascii?Q?jaz5eOONkOgSR9erWUNh0ev3NakzZkn/xDIe4+G1yDEiwNpyCQ9bFussou7W?=
 =?us-ascii?Q?5g3JAqIjpEmcYcaXPmiDPKzKqBmD1FFyeH7uO1UyypGGQEN6G1sMJMbomScU?=
 =?us-ascii?Q?lJhaDKUdyBvrUNP8kSDGKSMs1PRi6hMgWvSuqtLu9k++e1DBcnmNV/pOIE6R?=
 =?us-ascii?Q?aXVIgkUhm+RvgMolfJvFzM+pfTDw8HICSnsjTUNleR+01stG6t3OTg5COttJ?=
 =?us-ascii?Q?U8Z9HwhmvkBbe7EmrN2jfKHyE6xQO2Ff8ti5wfzqlsb5Lc0eR6m4zOOUCNRE?=
 =?us-ascii?Q?lGkOkFe+oL28Ea+OrStSoWtAmMqpN613l687Pdtg6j2qwD+5CMPw/IEC8xzB?=
 =?us-ascii?Q?/uCC?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378d1a03-2167-4a99-a857-08d89543a5f1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:45.4069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WCLi4C+I8/t7y23pF+YYXBdHkoTyXfaK1lamHDPKffaWJw+aJIlB9SCWdncV2MIoL7iSM2FKu4HbIY37dlaWCHqckWwzzARPBOZ41pCH90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB2887
X-Mailman-Approved-At: Tue, 01 Dec 2020 07:36:04 +1100
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

Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
unused") removed geenric_bl driver from the tree, together with
corresponding config option.

Remove BACKLIGHT_GENERIC config item from all ARM configurations.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 arch/arm/configs/at91_dt_defconfig        | 1 -
 arch/arm/configs/cm_x300_defconfig        | 1 -
 arch/arm/configs/colibri_pxa300_defconfig | 1 -
 arch/arm/configs/jornada720_defconfig     | 1 -
 arch/arm/configs/magician_defconfig       | 1 -
 arch/arm/configs/mini2440_defconfig       | 1 -
 arch/arm/configs/omap2plus_defconfig      | 1 -
 arch/arm/configs/pxa3xx_defconfig         | 1 -
 arch/arm/configs/qcom_defconfig           | 1 -
 arch/arm/configs/sama5_defconfig          | 1 -
 arch/arm/configs/sunxi_defconfig          | 1 -
 arch/arm/configs/tegra_defconfig          | 1 -
 arch/arm/configs/u8500_defconfig          | 1 -
 13 files changed, 13 deletions(-)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 4a0ba2ae1a25..6e52c9c965e6 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -132,7 +132,6 @@ CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_FB_ATMEL=y
 CONFIG_BACKLIGHT_ATMEL_LCDC=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 2f7acde2d921..502a9d870ca4 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -87,7 +87,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_TDO24M=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_DA903X=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
diff --git a/arch/arm/configs/colibri_pxa300_defconfig b/arch/arm/configs/colibri_pxa300_defconfig
index 0dae3b185284..26e5a67f8e2d 100644
--- a/arch/arm/configs/colibri_pxa300_defconfig
+++ b/arch/arm/configs/colibri_pxa300_defconfig
@@ -34,7 +34,6 @@ CONFIG_FB=y
 CONFIG_FB_PXA=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
index 9f079be2b84b..069f60ffdcd8 100644
--- a/arch/arm/configs/jornada720_defconfig
+++ b/arch/arm/configs/jornada720_defconfig
@@ -48,7 +48,6 @@ CONFIG_FB=y
 CONFIG_FB_S1D13XXX=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
index d2e684f6565a..b4670d42f378 100644
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@ -95,7 +95,6 @@ CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_W100=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index 301f29a1fcc3..898490aaa39e 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -158,7 +158,6 @@ CONFIG_FB_S3C2410=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index de3b7813a1ce..7eae097a75d2 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -388,7 +388,6 @@ CONFIG_FB_TILEBLITTING=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_PANDORA=m
 CONFIG_BACKLIGHT_GPIO=m
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index 06bbc7a59b60..f0c34017f2aa 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -74,7 +74,6 @@ CONFIG_FB_PXA=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_TDO24M=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_DA903X=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index c882167e1496..d6733e745b80 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -159,7 +159,6 @@ CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_LM3630A=y
 CONFIG_BACKLIGHT_LP855X=y
 CONFIG_SOUND=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 037d3a718a60..0a167891eb05 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -161,7 +161,6 @@ CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 244126172fd6..af6e80d1a0f2 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -111,7 +111,6 @@ CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_LIMA=y
 CONFIG_FB_SIMPLE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_SOUND=y
 CONFIG_SND=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index fff5fae0db30..74739a52a8ad 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -205,7 +205,6 @@ CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_LVDS_CODEC=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 28dd7cf56048..24aacc255021 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -92,7 +92,6 @@ CONFIG_DRM_PANEL_SONY_ACX424AKP=y
 CONFIG_DRM_LIMA=y
 CONFIG_DRM_MCDE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
-- 
2.17.1

