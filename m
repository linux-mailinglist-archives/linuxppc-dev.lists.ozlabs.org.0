Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A492C8F5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:42:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHHM0QWhzDr7M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:42:55 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=smh/9VAd; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl88w0QcDzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH2MNBgbN1y//UqnRkt+4+Q8QOHB5J+SrJDlmpbFbRfzh6Rmk9Q1dAmURn492rWqzVLEXnFAWQyNJOihsa4sakbPAib2oryTczf0SZt+BmT8gEkFwHsKWHXNbl3hhzVi9HFTDbgiB3hkx/ljXeI24oc51aSHm38ssWUO0n0sa8FGpues5eQXiFq7KlbfpPvhpVTAqHfKUPaAELvulj/78gYcCZwg87NZb1VZhMhfSOy0E0qBYr+ilPi47w2KmBpI4mnIcKmQgGgTBUKAwNT0URX1OvHZAE+YHVCOXpcAMKHXR+KApKz4cTcrIWeGK4gyYY38/fG7rnBcyt8/dya1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYFF0S35be+pE4+Hs+KM/e13O4Xj03iMy1mvVlKlyMg=;
 b=fhKz5MblxEMvIAlFMXZzPX1JLYKr0j5QDo3jH/gvVLF0vL1eClrb+5BYzCcKl/NcQS7U5BUA8kui+Q7XqhEt+iBYwOBps0fPuK7tEd8uDgfkRRR4c+GhN3AptHT6V707H+ZKqdFOgdy2PpUfm/05B02U6YDYVPvy0jUvK8pqj1EoDH//c3WNcO15OuVruc1seoSCm+N4MPiTzAEt+eJnCUm+SFNsp4iEoseULQjOZknkgnWh8Ov/a7Qu1OdHtbeg32A8rosSbfoMswKwHjlvPblgFtI1g63S/BdAGwVKCD7s227FZrUouC6AdGBBbVZ6I3Dhv3rB3nqtaDK26E3/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYFF0S35be+pE4+Hs+KM/e13O4Xj03iMy1mvVlKlyMg=;
 b=smh/9VAdWgcG1D9dJ0gWO6DXa1E4U+VmEpj5NTC/P6Abw2NbB+efRz7VI5jIk/E93kuxq10FaOwVCiEDl6Z59sBmnGRPCaYT3YihPiny8JZGIHJA6S64b7pTlz9Ud2T22NXBFhsRTSnv4EPOOaji627cuY//AditXkHX2Ml3jGM=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:44 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:44 +0000
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
Subject: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:32 +0000
Message-Id: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95d7b698-5292-4930-f51d-08d89543a538
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB2887AD8134FEDEE884AD46CEA6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nd3loQ15nj+k6hYQLhmPL9e6smY/UmSaTcWyqEPpv13qIpQHfXiHzpKmYs6yRY88IoM7OA8EI+HInQSY0+DDtLAvWit+QiYWdpsGKxJTeX5U2pkZjvq03zh3TDujFKSB5IMcr3NH8p8c6Pp9HkrgJuvY+qAR3DAWW7u5Ft/oxRZAQMHMNbSxpCfBpbKDHoNdni18QjUyxFT5diCDmw/8NFm/fQm4VBwJeoyPGTbRerF/DcsG8p4qkR3T0tolmusJrEw1Y+JWCi8iT2A891VKG0HsArjY+t3AFkSnoVnD6br7Knj3HjMBXvVvMx5zWqne0cRIBj92zEorv3wzAVExcT6BRWXtEz/xR5uGystDlu7jLgCN/v9mRu1s6xKj0/GE4WbBjPdN667LxTpLcIcrgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kitQGbAHk3EE3Ey9YOYZ7O8FLyJVuIMD1TiiWcmL9t1mNsQjrB4jtGmbTHNl?=
 =?us-ascii?Q?BMursxnuITuEajAo6wSx6Z9SsYtX4l2T+R+7R2lNDa/81FA+Bo3GMT+NqSWf?=
 =?us-ascii?Q?dxiKc7Fg7DO3u5sAv37BjM/JiqRiwBy/lfxzQ6wAyiF8uqsZwa8Ji/Kmb6p9?=
 =?us-ascii?Q?xDbRMAgpNHBHQIHQXqU+4/19o8V3G/T7nK4J9RoRaSGMRgoSON98yvuX2qmR?=
 =?us-ascii?Q?hyOgfIfExql8V+hBO5mLO5bzK26KWqhXLljT5/+tml4gFV+uIPkDvMWxKDrT?=
 =?us-ascii?Q?iV4nXHvZTBIeU4u+p9m9k686qgHh20bQnrvHaoULkKpPbye811iNYqvARczh?=
 =?us-ascii?Q?B9RyPYsB3mP82COFVkIsI7hjdFYNQaXum8+T8LqqUCoiQ1Njlw+kihsqHEmh?=
 =?us-ascii?Q?g1bIHw0R7zxGmUG5H+03cFMO20XpvbrM/avQ3orGP36/4T1uRT6MQLFb/OK8?=
 =?us-ascii?Q?LxiEn5z5KvoENpEG5SSjehnRxmUMcSPZuw17yjVAPmArN/shoCI2cvNUPCU5?=
 =?us-ascii?Q?0IjipO4xhampV+3d3Nw+GiTRpKPmyzeaKSlxgLc0jKtuq6178DTXzM+0WQ//?=
 =?us-ascii?Q?jdcLDl4KEPjmsshx/4CgCtkMQ6Y4bG8JQh+6ScX+G13uc6flF1KbZDNPnygO?=
 =?us-ascii?Q?lyC+trjlg298EN6jEliGM3n4mhstypRQoLQJCvq36/4bGcZYDe3W5qTbR+rT?=
 =?us-ascii?Q?MA5BsGvM6TKrzeGJ+lmboFadqXB/JC6b4g3XAfBZmbA1bPYDxLnjeZ/Uu/Ak?=
 =?us-ascii?Q?209edxpv6/zl8+Bi2H92im7c7B5dVlAjB9Njif94cFamVeXDRuqg8R2v/EzA?=
 =?us-ascii?Q?KOLaXTfMvh1Flzjg0nuQFalsliJP1hud6MdceJVmU8L9x0B1JFD3vixKeJKX?=
 =?us-ascii?Q?fm8GjVbaEQs6oZZuc200FYIzeOPphD9uNY7jJXFMBQSKG8UlIWqzqjNlamdp?=
 =?us-ascii?Q?20XrACDjUK4kLAkEs5EDustyLpTxtxycPGD0ze1wLgF3KF5AjmX7wPuPuWv1?=
 =?us-ascii?Q?6MVd?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d7b698-5292-4930-f51d-08d89543a538
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:44.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2W1ShaxXCjALLxQbLA6jmqUp8Gi08QpaeQ8KWrj3vdSv3nL/R6SJp8BNxNRSjHk1dDcifGMCRU3GPdULbk7pR062FCDnmHrSD8upGxQrEw=
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

Since the removal of generic_bl driver from the source tree in commit
7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
unused") BACKLIGHT_GENERIC config option became obsolete as well and
therefore subject to clean-up from all configuration files.

This series introduces patches to address this removal, separated by
architectures in the kernel tree.

Andrey Zhizhikin (5):
  ARM: configs: drop unused BACKLIGHT_GENERIC option
  arm64: defconfig: drop unused BACKLIGHT_GENERIC option
  MIPS: configs: drop unused BACKLIGHT_GENERIC option
  parisc: configs: drop unused BACKLIGHT_GENERIC option
  powerpc/configs: drop unused BACKLIGHT_GENERIC option

 arch/arm/configs/at91_dt_defconfig          | 1 -
 arch/arm/configs/cm_x300_defconfig          | 1 -
 arch/arm/configs/colibri_pxa300_defconfig   | 1 -
 arch/arm/configs/jornada720_defconfig       | 1 -
 arch/arm/configs/magician_defconfig         | 1 -
 arch/arm/configs/mini2440_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig        | 1 -
 arch/arm/configs/pxa3xx_defconfig           | 1 -
 arch/arm/configs/qcom_defconfig             | 1 -
 arch/arm/configs/sama5_defconfig            | 1 -
 arch/arm/configs/sunxi_defconfig            | 1 -
 arch/arm/configs/tegra_defconfig            | 1 -
 arch/arm/configs/u8500_defconfig            | 1 -
 arch/arm64/configs/defconfig                | 1 -
 arch/mips/configs/gcw0_defconfig            | 1 -
 arch/mips/configs/gpr_defconfig             | 1 -
 arch/mips/configs/lemote2f_defconfig        | 1 -
 arch/mips/configs/loongson3_defconfig       | 1 -
 arch/mips/configs/mtx1_defconfig            | 1 -
 arch/mips/configs/rs90_defconfig            | 1 -
 arch/parisc/configs/generic-64bit_defconfig | 1 -
 arch/powerpc/configs/powernv_defconfig      | 1 -
 22 files changed, 22 deletions(-)


base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
prerequisite-patch-id: bfd382cf1dc021d20204f10ea9403319c1c32b12
prerequisite-patch-id: 5397c0c8648bb3e0b830207ea867138c11c6e644
prerequisite-patch-id: a3c284dff5fe6d02828918a886db6a8ed3197e20
-- 
2.17.1

