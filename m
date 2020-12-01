Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2A2CB020
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:35:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClxkB2mNHzDqrT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:34:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.6.104;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=PzLaCUF2; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60104.outbound.protection.outlook.com [40.107.6.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClxdV2HfFzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:30:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgZwiMM1Snra1VgFMCHLcqVvHYx2aL5AcqXn32DTkFLv9pHBWVUTKIDrbdeKlxr6JCybhMq5Ty7DmanUzHzFafl6GGn9hyRP4RTX9jwQ+VGUFiOBg0U+CkrFQrKTFVPtJlN5GFhrV/r2aFlZkptD22fP3sF6Ax1kofvAA9BxyjHtchimQsn0zkrqfW03MUEuIIyWeYxKaWgVqUXZ+NhPLBQX6CplxdY6iU9m5U/I3oi3Q4P+VWKeH2zEYROH52RAqLb3AsyoSyDWZ0LHS5pMHzjbON+Rjr+pNQHGb8aGdsDZ2BGN/LTn7E+7iNx5x2P8YZyh7P15nsfTv0WSsjz3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVlzB1NfNYmdC6Y6Zd9qfd122vLOH4dW4xgAde2H9TA=;
 b=Ppb82mCZVPcfLvHFbZWsPmgEOcQ90u2SsNrZdFD+YbOtCflNaaB+P+Ny0IkzWeNh/+HMxlzXR8mthdtB+lLH7xd3la/SvfNwt48P/d4uWn6FzyIsfotwhuAm3j73Gm1XBthIymwbmL2TcDyAgTEWCU4LaLay/dsGPTRxMkRWhuXhFfaQl0CFGD0EjtIBG3pFB8+74QzBGHymwWAbSOaEt0aa7NP9XqQdHdTwf6smH5ibHQXmVbPkHfxoUYz7AqI1hBUbrYY4ok2yeN+VZRgLnivVOlbpQK6tbmgDNKdD+OUDO1xL/RBY+7RBwBLuIsn/bL1I3RqAVlbO1KMKMZNa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVlzB1NfNYmdC6Y6Zd9qfd122vLOH4dW4xgAde2H9TA=;
 b=PzLaCUF2yFvXKcqMnEGY37t2PZ7l+HRcDytWk6fUBCCX9zYdJgV/k3KSbu8lf/bS7V8+BnlLhVsBEhoRCx6P7QDBK0z3gU6YD7cq5EJv6zF4u7F/HKatcRRyP9+1UZ0aKEbtQ9rZwkb4u9NRex06UT0wQs3SjCksJdJYHgT4FHI=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:30:46 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:30:46 +0000
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
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, soc@kernel.org
Subject: [PATCH v2 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:18 +0000
Message-Id: <20201201222922.3183-2-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
Content-Type: text/plain
X-Originating-IP: [193.8.40.112]
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To DB6PR0602MB2886.eurprd06.prod.outlook.com
 (2603:10a6:4:9b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.112) by
 ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:30:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b906cc89-bc5e-4f55-f70a-08d89648bee3
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB62361B1377CB942D51779C2EA6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCk67c2jgGsoSOSrbm8OnGHxB4Dc9sDKmH83oUJK1pggLNcNidVkPnPskQHWntXiBuOka822AO8+YoYIX5zUfPxFTmWCnneWAzrq2Gkv/W6oAIUbb0BKaMvdKtuq4sHkGojXwKVNROHVKmoqGWjVpjCdBBq4vSNE06SsLKIGUmPTT1QzG+Fxlo12A8pc6KPrThXMYa9/PGEpp31QNCPRkmyPr0idDPO6Zhz9LFTcnAFeUUVrSMAk8zyG3+rpAH6KJOWoNpZSvFRgiRoCO2gEllxU351I5WHqAjEZpSjbdkfIBM4mPBEcOfsnAq0zuD0Unbgvq8HMb8Eb0ZJ1M8f3Pt+vJdCx6PTfS0iOSq03TY67cSCyO8HUb92MeMT1d+l3JeUmR8GdMGtYjNQvxb0ctg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2eCM3zkNBddbv4VxSIVNg6so3b/Y5C4tYp0kpO3VXcH+fo96TLsUr4mUf8ST?=
 =?us-ascii?Q?nRs7ty4U2VkLFNP+eRtcaQnzPzOcdapXTqtv2l9aaMZtfqweVBVxFpCSNzXO?=
 =?us-ascii?Q?GA/vFQq4OyZtsLSZ0/HnQryg66f7U3v20os483QTdkKJ93cORPWOAtVYvFQs?=
 =?us-ascii?Q?zewNzaH8arVqIZmf2dijWNLYr7SsDbonZidU3QSWZjHQzqnPIdZz8e8G9GM/?=
 =?us-ascii?Q?y9JFwCSjySO0oepFL645C/IJ9TAaJiSAMp+dfA667VZyDNj2gF1lQ3c0jInA?=
 =?us-ascii?Q?1i5JPOODy4lNNJOGd4xVOBiXegn1l7ucUJfnlIIUuBsD3iHnFzEy1V7+tZvF?=
 =?us-ascii?Q?u6ristyh7dbijUiDIbfuB6wFL/V+r1fGrEeodqJ/niwKuLmT+6gwoRiAIz7T?=
 =?us-ascii?Q?4qheABEDL4jA+MzLE1DUqSaE2thwz09VbbdLHEYqzZBavm/8rAVw2sz49t5N?=
 =?us-ascii?Q?MHuFiMGOeDOTHwVBCd9Y1Fr50OKprRZr6OJLy8AoeKF3N3SXhPt7rnYA8USC?=
 =?us-ascii?Q?HNc8v3YeB8lZ2/pIU6ySzHTEtzvorGJbz1GH1NowOq/OFZXZGMyWnqQkyvIT?=
 =?us-ascii?Q?Dlc2/SnbKkmhWvy+lQ7Bn9fV4Ud10n5vy69iJpZxtYOlSV2p3l8b9mEhN7hI?=
 =?us-ascii?Q?lwMxAtQscwR7LCUTFCFPBGmKAJX+rIDKd2MJ4I1yB/zXNqNZnGiICPQXaoyP?=
 =?us-ascii?Q?CKmFM4qCmEb+3bauLLlWIB4fBuiDjL3bmoaM0qw7xEUFZxglqItXXLA3i7M2?=
 =?us-ascii?Q?WuUXkRS814WZUPFatWbTh2nUBe9IA3PYqVcJOdqjRDPPBeMBJHzPE7LFY3We?=
 =?us-ascii?Q?8vUaklyJMxMEMNeqGs2rdflhdxHA1eSD/DvebAOmVEN4ddi96IntXnnDlHuv?=
 =?us-ascii?Q?kHp++i+8XCAjO3UqdSN9tHd6GzoruRGU9jKV15TA8q0KYLL3wPn8bV6UTKqn?=
 =?us-ascii?Q?pNsQGsNtFCpx7tvlOBobRkkbzNlkUJb1dAL2qgWJuwE5qVaQ5qubxgOOdr/A?=
 =?us-ascii?Q?7a+n?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b906cc89-bc5e-4f55-f70a-08d89648bee3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:30:46.1006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPjBIfw65gRJOD6dLHqB3J8apgkNNY2niuAndYbhU9PrlOhrbk7/iSJPDkg2VjVNPMicc7mI5In2nunwkW6u3qTdVixM7rRWsusmVZssKk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6236
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
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

