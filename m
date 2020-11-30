Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6962C8F60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:46:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHMQ0jChzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:46:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.7.129;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=gzw4t4LT; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl88z5H4dzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLF4kSlJ3O/2CGbe9MA6BmZ1H8zqspl47695d9f/86eDgodLwxOehAco80qzWamNBlNwPjjjZAWygPMB3QRMa0Qjp9fkZLv0JgPUkmK4oLHW/D4f+K70aL8V8qhunS+8zBUdXS+b8w6SenEigcrhiG90otrOx0ysZqAMS25yftIqZRcf7yR//UprSDiJe3UHKujc9SSDKEhTWZLhv+GcJobTehDu6DEe2YKwEIkWtPUgW17mwHLnvP/0/z5xnGPWyUZByV71repiBAbP/Yfc9JxywmFi3lpXHifvq8FP2NEXDKQ75/8gxuZE+5hRUYpluyx320EOOaiJKOIBdFtcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R00fsQ97csmIi0+7yknclmJ02BIQLxKYk5P4AQ5wxA=;
 b=TZnlbREFZi7Kr04Lc39ySt60CCaXym0ZbmmtJWSdekvrZW2hJS+yQu1S1IpNlYCO8wnaWnncZYmZyk0rOirM91b5mH7j9nVTH77qoXkjMKaUtWfz2mcl0b9TvH5Hy5rajCpnsRfoOI0zQe2MQex87u5T4zAS1SZ9Jo0fcCntEHIr15UBRtcpmfR4YBX7v4KcTudLK19+kJh4JT45nO6f4oUIpFZW/En+CkxlmMj5tYWXGY8kfYfIjFUGmoFTMx3BJ0tadFvHEdi830RfwoluLvmWlisJ869pKL5XyaGmSyitKDbGUuEKcI1AtuXxfqMtECWhoVOgclzKN93byozyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R00fsQ97csmIi0+7yknclmJ02BIQLxKYk5P4AQ5wxA=;
 b=gzw4t4LTQpGuayjpaqLlcnSrj1MuJIdGGrXsSYJhs1DEDM3l3sb+25R/hTSounRzfIRXK8VrfzR3mScdJ1tyS1go2oMSrpDsQxrfP0Sx/hXuedWIPCePoW3U77WtkQkDk+IPdtlCir6uORlatMMAmih+LQsh5rmof70mJlgqdmk=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:48 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:48 +0000
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
Subject: [PATCH 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:35 +0000
Message-Id: <20201130152137.24909-4-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1bc52065-bdbe-4fcd-879d-08d89543a773
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB2887A6761A5FDD64597E3423A6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ssuShPbjDwddCyRut/jfp2QqtPePNEEeBWCcMl59ybalWKz8eQIOlkVmKoSIXST4FpgWVl+UvBxGz9ptyRl/i7ivXrcDyvPgBgmBW/HomBH063EknQ8s6s3bMM1suAbrJDBRJD2mQS49ISslc1acLc45qISrBFKfGCwth6oHpiCWa/6yhfk8/AYUsfTuSIDDfYIbeyKdd94y53DqAp4JpEhPu3eeDRjRS8+lGDq6I6skawHtjlVq/dM+VFzVbnhUSMJy8bUunOS/bLdvRA43jYCnShXLMX5kVC7MsBIPJO1lPS6Yfc5q/V2T0pkbiRlW1cuE+1DNOvB5YrrXw4AeWCjZt2f24U2RP+expNoSX9aTKb+lW82gRhpvEgdW176jNN9j2aR+JK9q23C+j9w2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7b+De2oWUPvUmJldcnePghIzLHpS7LIVkmGQ0o3F504iC4nzlfw1zgxNPWXY?=
 =?us-ascii?Q?GeLV/npbd8tn9JKBLQwab/yNeZNgKRI6m4cx/peVAKS9YvTY12/OwVcGG1M5?=
 =?us-ascii?Q?khepDI4XME5+6gCWJ2T8EebNCNDIzeL4nYRMZjBdXlxw1KsbJYI8YjM6dgdG?=
 =?us-ascii?Q?dsfd27lDJkQVSM6C7BJa9bF92R8QQBUYMpIMCzJTPggEGTEGmVH30bOznsbi?=
 =?us-ascii?Q?i/buyxgt56dxoTBQQlhKbVYgEdAT1ke1mK5koqpQVK41sX6UTAcgYrhfSkeR?=
 =?us-ascii?Q?CQe1bHBcApJ88ILAZdqQOYQscmL+VQOFfwOy8vGgzq03agL+qTkq2Tinj2P1?=
 =?us-ascii?Q?4xfRz4nnqXHpRVrLu24VmCPScx2lJXUCimlRp1dOJaX77FfEHKGFZkTMGFzQ?=
 =?us-ascii?Q?K+UD1y1aCePNH3XwJz9rsntwdWlphomKIe8abSKTUz686IqzxrM+dZMQh7xN?=
 =?us-ascii?Q?zB6b4pQZ1MElN5dagj1DEHYCRms5pZEwPLcJpgmPLFYjDuBUDYJ3wExEEVWJ?=
 =?us-ascii?Q?D41Vrd1oJqZI7RYMD9LkaaJIv3OTGee6qyoo98LbNFkqB/ddWTlN7qKZadxF?=
 =?us-ascii?Q?SYJVGnvkWNZ24EYH1uUz033VeRRybWNQ0lXMWfv2f6X8u3iYpoe/Acc7W2sp?=
 =?us-ascii?Q?Snf0ON3wJmHT9Iybvibw5Ta4/kRWCBTj6uh6d0n9rntgWjOseAUhz0n5xUs4?=
 =?us-ascii?Q?XlzdMZbob2bCJQ90WgSboBMI7gSXsCdOYWFuThaGZtb6cTLmZKjKPEviCDWI?=
 =?us-ascii?Q?WxoNCIVUmeoDhMp0mqBkeRl8XW7nLJbapb09KUEqVTskumxPnCO5lmTaqsjX?=
 =?us-ascii?Q?nQfnyr6ACdzDHqmArGjjc+sWLA6adcfIHitFEXJdj4FM80jiN00QL38ipaSb?=
 =?us-ascii?Q?tvoUuANXSJcr22WQuL/O9n9PpHYwPiIrDpf0ZSthhJrZgQDG0chb+CLyzLIk?=
 =?us-ascii?Q?4Nn3novZXuWrrSUhZzGn9aaJIkv/V6gZUmPP/1UomQbnTpxv4MyvHQ1nQo2U?=
 =?us-ascii?Q?aAy2?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc52065-bdbe-4fcd-879d-08d89543a773
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:47.9138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjTv+IcUyF/pRAe8cls8JaRY/glQIdJV3v8VuaaQZ87qrCEbclGVYzfNSflh8vNL6edpLx7tGILwmmSHoPwA/74lF5HXX0sN6YHMqwdNW+4=
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

Remove BACKLIGHT_GENERIC config item from all MIPS configurations.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
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

