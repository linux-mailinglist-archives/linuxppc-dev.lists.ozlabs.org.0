Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6C32CB043
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:39:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clxqg1CvszDqQS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:39:43 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=iJ+8WDxn; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60104.outbound.protection.outlook.com [40.107.6.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clxdb0yXvzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:30:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2PuWOXU+ilJE7eX1aafzgmaD4HToLxw7TMS2VNIOFaAG91twHQz84n3OJSVhJ9pKTdwtbqjW9bkXu6HrpM39zlUjnsr0wzUHTjglgDZ0HnWUdY1gSpXNV71b5SkAKC1HEnwN/0ohMlCu36YfKhy/QrFFn+bzK0Y28SBHedFnCsmOiQWLYU+8v+BwdmXcJ/oQi+PMdvNfcRhnEFJO5Y4P+CBVy4LH0uBncLqlcAxMGMStCpPbgWH5OY5uRLAX8pUiNw6ZqtxuuHTUtfmzTPbvmk4A1DH4b41G+DHGMFHEZ5TjI+IZR7t6DhFPYISrFqzQiWBgpecPGIDx9xVUx1D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvxTVpLo7EyuC7lnoOhD8+IaM3NfXhXEx5J9lFRGGHU=;
 b=f2ljklkPPEdB84U/poBEaIXLysYFRxlIJF9WcCMYFzm8tLXBPgZ/S//f7SpyRde0W7kzvDUDcvf2GkQwjwCSIQkEfM1wjXglHpWr2jwHXK/lgWrwsMvmmIrrcILHTiadg47yVR8CypUxjJqVoKSyEYixCcKxz345d/OqT/GYCVnKTMia7fBE+MQEx23PTm8xU6oAcZFUtRJ2g1yS+efXpIjjtWOBjlz0To8xZyFpCewqi8kE3+0PIYZWuUBdZ8cwNxJ3p3HJQSC/ohCbB/zLnhSkN3qT7Jx65nLgFXnRrhDbDhdxwRzJaP1iRN3UuOjg7Q7wI1WKsKk5dC22W67FVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvxTVpLo7EyuC7lnoOhD8+IaM3NfXhXEx5J9lFRGGHU=;
 b=iJ+8WDxn3eyrh1+/Di0dfLPqJqCeS/mlrs8bV8bSlqLM9rHiGuOnMrVm3Cawj4ORziAyBEp0vIPV1ZIr2upTsLoLhxCYFSIEhlW5XVb5iaecxSMgHA33HL80/eaVbmiIGOgV+FcraRl9UErQJoS1KnJEx8vDOi65rP6JHUZ78D0=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:30:54 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:30:54 +0000
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
Subject: [PATCH v2 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:20 +0000
Message-Id: <20201201222922.3183-4-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9513981d-5d84-40db-164b-08d89648c3d7
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB6236F509049EBD457D851019A6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bgePueDPCRnPYAbPdO2Y6lnqzSmqcV1j2lfRAQjhbWDosaSjTewZKIKmJ7ChM/qei6zSXPPRuKLEtCvOug2AvVHlMXV2vJxwpe6dgcfV/5wUyB7i7kZgvQcrD2o1OPdYAkkBmZnbRb157CJnTQSYDBbsFjyH/4c0+MyHH69lHriujV5wpZws0TpMFB9Vv1HeV8FWRvM+Aaa0etXVMNAd3CcQ3h2J7ZVot7mLiypFWlHjIY6iFUDNw/3y82Vysb+f8mME7/U3yY8fY/ZEFcyMCiWUaxmUw+W2bQU1goy0rUREd8hqWYRVAUkk+b0lROw1MErSDsi/J3SX1JECDOK9+AOfCwFs2vI7OQbVowhQyOpqtBD8TPltnS1JSefOD44iB7/5vey2vIXe5bsobHtWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O2iTE4L72yjCSIsYcmxdzPi/nxsAnSa2OYtP0h2Z7gk7S6M3FGeLvrHaSvEI?=
 =?us-ascii?Q?7AcSzZAstwzbcatwNXbav/hyqbgB5it2/qlGaNayHhBHSZduvvcyiLa/ufLP?=
 =?us-ascii?Q?zIDX4JmCh0mbxidpiEc+R2++8QnMENryOfxv02YOm8TTJykUuT6IBvwDUt1X?=
 =?us-ascii?Q?tYmucL8lAzvl1Tu8exD1UBOUbg93o7rZi9tLBciU01yt3i1mqLKwo06XG2zt?=
 =?us-ascii?Q?tg0ChrB2kYL0oPMLOj60JQiuLtVzC9yc7tknwIz9LTzwXiedzipv9tKuGo4h?=
 =?us-ascii?Q?trpMpT+wAPEDewAsFOQqHHvPQz33ZCtAIXA2jSIGsJo0b4qO0djAMM6jEyrq?=
 =?us-ascii?Q?IE2w3BGVfT1NHwFiDV8qiIWOxUWe2+rlhYxVix1JaQWz8s3FQqSnlFOv+zBj?=
 =?us-ascii?Q?qk0ojry8PF4TQF25k0QyRoabptG6aSXG+2lmZce8nTsVbTrTJN2PdnIBYdFL?=
 =?us-ascii?Q?bRHAWb2HbvoGPwaYVlcFl9MvuxQoYYdVWUiygHjI2/eEy2GodUyLi64le8Vl?=
 =?us-ascii?Q?780Tq5N3S4Y+gm0DA9rWFsyOoCbdkbllxYzO2eWcTzIkXuP0eJp7q/6Fi7uo?=
 =?us-ascii?Q?wXF2zO5vVbhVHOTAUgAkmWCR9G0+eZQ1SBn2GaLehyM/VWvKgGKb3zacuoea?=
 =?us-ascii?Q?6+FjZPKhWf/twvJK+K0Fe4pRlIKTI3NLfYlUjLdpJd5c/zl7M6CF6iI4g4zr?=
 =?us-ascii?Q?vJtWyGAXN/ZRZ+iojHuk7Sgeupj/i3EWWw58AblKJDw335IBxeyiVC2EOb/G?=
 =?us-ascii?Q?dna4fbCZxO08qd9Sg/l5FJvu0SbNqPT6GsGn7LfVEAefGzoaT/FFlKDfBgBc?=
 =?us-ascii?Q?s23mQ3436t6gxvhK5t/rOHtT24HwynJE9WSpBWe0dqvS6sO+ki7h/U6Aenpw?=
 =?us-ascii?Q?ow1dnVPc5vha0XpCZAtW/U+B9oikBd+gBwZ4H/qoFeQ6D+N/C2FUKQ5rBa0E?=
 =?us-ascii?Q?3ctCtIu3QSjxfeTcBJhIgmGSzLFO3BzvE+na36i062gv8FaO+iE9385E91H7?=
 =?us-ascii?Q?e4kl?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9513981d-5d84-40db-164b-08d89648c3d7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:30:54.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPrbpF/Ikcgrh12gLISX+BVWlQlCmF9B/izgLtoqO6g6G1T2hSc4oPT6u3StBDJpp80GDtMy4ie0/e4iwphT3Fhgur7O9HQhBY9et6YisWA=
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

Remove BACKLIGHT_GENERIC config item from all MIPS configurations.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/mips/configs/gcw0_defconfig      | 1 -
 arch/mips/configs/gpr_defconfig       | 1 -
 arch/mips/configs/lemote2f_defconfig  | 1 -
 arch/mips/configs/loongson3_defconfig | 1 -
 arch/mips/configs/mtx1_defconfig      | 1 -
 arch/mips/configs/rs90_defconfig      | 1 -
 6 files changed, 6 deletions(-)

diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
index 7e28a4fe9d84..460683b52285 100644
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -73,7 +73,6 @@ CONFIG_DRM_PANEL_NOVATEK_NT39016=y
 CONFIG_DRM_INGENIC=y
 CONFIG_DRM_ETNAVIV=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 9085f4d6c698..87e20f3391ed 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -251,7 +251,6 @@ CONFIG_SSB_DRIVER_PCICORE=y
 # CONFIG_VGA_ARB is not set
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_USB_HID=m
 CONFIG_USB_HIDDEV=y
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 3a9a453b1264..688c91918db2 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -145,7 +145,6 @@ CONFIG_FB_SIS_300=y
 CONFIG_FB_SIS_315=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_GENERIC=m
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 38a817ead8e7..9c5fadef38cb 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -286,7 +286,6 @@ CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-CONFIG_BACKLIGHT_GENERIC=m
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index 914af125a7fa..0ef2373404e5 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -450,7 +450,6 @@ CONFIG_WDT_MTX1=y
 # CONFIG_VGA_ARB is not set
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_SOUND=m
 CONFIG_SND=m
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index dfbb9fed9a42..4f540bb94628 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -97,7 +97,6 @@ CONFIG_DRM_FBDEV_OVERALLOC=300
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_INGENIC=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
-- 
2.17.1

