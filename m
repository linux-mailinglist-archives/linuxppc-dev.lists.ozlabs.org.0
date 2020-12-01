Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CB2CB057
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:43:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClxwK74wFzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.6.105;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=RKedLQs9; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60105.outbound.protection.outlook.com [40.107.6.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clxdq0GF6zDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:31:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBUrrbk7VnWffW4/z8HHc56QJ6hcKEoQGFzbLXNZdsSPeteC6ZgdTk6WXIY1WrgPi/aKmvh0Zqu/lTKrQCl6EL6g1pWc9xsYkCi4xZr5qhetnaL0bEFykSWbtTVDpShlTcZKxuXHo51eD8Gr6OrghWOCWvdZjH7nSspt7D9pe8H2fGj23NO/bgnXWCSuVr/3kGP3nokXjoVi7b6NAPDLEtd4tQdaakdYY92q94NMxtwQJg2QAf5dRCXjddhJxlUJQPFDfegflW2fvbRHX3LZFKq2jirWstzlG38fiIstWEAiaCrc5W9zmjMqeqP3oM85MHS3EEfl4ot19SUmlFnhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6jNaCDbQ2iCNvKDA8zVKbBQLowkiZO4HZctSGu660w=;
 b=MFGSY4vP9qFqLazE0L5yy1QsQTTkC9xDUCcaoZsm9ycGHudFKH5NiS7DqHUVyI6TCTFYZQtszcVyVLQegPPgKGNNgxKm3lofeDzIwHsRqBTk7aBWDKz5VIOu9mHn1cUV3D1t8+oHeu/42jXSe4DhXlzSzDYlJzaJ6QMVGlTR0hEXOoZJNUODmpy+w48j58CRYdfU5zO7KsRbmUMbQMU595CEbJQojRPY0fSMeoUOs9bjfDXH1mL4k8JXM2gz+f7KnxFTIVf/MwGB3nebSgQdOizeTG8afRCsxPaLoQDtKCconDwkjMBrOiZKMGNLzgAX0t3BAk2AhpeaeHY7/tyJFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6jNaCDbQ2iCNvKDA8zVKbBQLowkiZO4HZctSGu660w=;
 b=RKedLQs9SmXyQHw6gsHTTgAaGEPxPWci4fdo0zdwBL/B3B+PSJldLas5IH6eJ/F8fpHeMm8VumAp536dKB4Zm+0h8hkp2hBkbBj6LCYYfttbLsYdIkZ15jbjlsIHQ9/jLmt79FQhPFicOgkCbS5uHjJMFjhPJWhTc91rokqfPkg=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:31:06 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:31:06 +0000
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
Subject: [PATCH v2 5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:22 +0000
Message-Id: <20201201222922.3183-6-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:31:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26943727-d419-41aa-f39d-08d89648caf9
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB6236DFBDD0F0762D6DC719B1A6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxLw28SdW9jTITcpro/GTMTeG/u40sqv+iGbwQX2ZS/Yy8qlRjRYC/G95hc/FgSboQzFmdgneKNFoz0Y3sMRhuAIcjxkLvSH2bsdBppvAw1P+KoXbXuFrVWVg9y0ZuXXBOCnDAnJxakyb0TCSnI9EkO+Np4P0nZ/rMdcIHff5x/8U+U0Rg0kCOOIkbFOxzlFQH0YvddY7VxT/txnIZgr/hy/k39wOgqe49nY8CyVF9KJxnnDJ0n58jEqAyGp3rezSptdnMAmPmL6oCW0datJryRG1ZAD2nfw700eN1FFqyqRCGQBvoExSGJwFjgAUvjdo3cCaiTJKmprqtVxBv2g4HHnITZFPxl9wN3sciIhi/Cnp9aftF48xhtlu5epc8B/YDCxxaPAQ14MdCS2MWw/YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gIgy2COpXhjB0e80DwgmeEnGFiwx8Lied7vzGV/UaDaZHgTQf+7VDA02Kj6Z?=
 =?us-ascii?Q?pZAgxtXqQhHqfKW5C84H2bHNtVH4ErBeYjatLuVUKPeGyL7wSQM3tMuz//9B?=
 =?us-ascii?Q?IQpdysOla7ipcwDESRi7rI5FnNth3RtjCnEekFO8H2aCAwEhnQJ16O01Bn8X?=
 =?us-ascii?Q?MjUKtbZqLRKP7LQCDpAapGeP+cIVkXKB/l3kup3tf4UFDNn3rTVNsfOBXYQy?=
 =?us-ascii?Q?FM79rhLMJwgT0bWy2IR3UUgH327XtZA5X/LV9gjGAn9OtT63qd5dwd0Kn1u8?=
 =?us-ascii?Q?OUN/6wuJ0uWJQqopxNpo6mg93RebFGpVzQGcERZikplvDzLd42UCBOUDz/qT?=
 =?us-ascii?Q?T6QJLSnoAWwbbC40Hd+8H1rQAyiLX4nY9HUeIAjEo+5aRzVgy4+BEs7DMkMM?=
 =?us-ascii?Q?zIrK8QvWtTd4f1fCKeTzal66K4LoOfcvy2knuaEj43AF5mQ+rb2UHuI5bthN?=
 =?us-ascii?Q?7P7n708r/eV0dG+FehAtmWjClXKLqQwCS0sTQPdYkyqONsqKfdvdE/dWPlzU?=
 =?us-ascii?Q?d4YO9aXnS7PrpGZL7FWlfrj5MLkflGytY3V/FOGC8X8mKy7g2WmEfpjMieXj?=
 =?us-ascii?Q?PCoC+t+VQ5kDAczd+J1wXRCO8mxu92rR3km+UYYgjflkXqRsr+MkjqdcqFcs?=
 =?us-ascii?Q?KocmjJfoLtxrZDnQ6feihtPzRfp2JV6v+1uAV5ZDspS2js8z/dd5NBDJvhMH?=
 =?us-ascii?Q?jCFDD+xXmtvhlxImEtk41ec375PGIIF/5yvJVQtV91GM1vjHOlq+cjrfnri+?=
 =?us-ascii?Q?glUSbUATUvtJxnokbMGwg+2QuAPGdLOpCI4c0JAxeKVPdvMZWGZsxBX+ghrc?=
 =?us-ascii?Q?Z+olWtLmQMJccaKjMQ9WBs+VmrdnXlfrPHkN+CYfCEOHiubkVOzMlD48wFCW?=
 =?us-ascii?Q?beuAc019eaC5QQDTvy+M/y8HqL1Lyva1XHmNam3yITzJ+aa4y+xVpTEKjHDS?=
 =?us-ascii?Q?Qbpoj8P9rZ6sqc/lrz7FzlLmyPskc6n+TAH2uoo/GVRSe+hHZ0fLxLlXo9Es?=
 =?us-ascii?Q?tzc/?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26943727-d419-41aa-f39d-08d89648caf9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:31:06.2214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hvTi5gQyn5MnIOmFFcnxQipq1vPxjZbziVQb9o+Mc4BHmpB/WyX04O1nzkMNT5MaDnHMQ4tbi+Fgba5LJ42Vgpmc4gjsNBC1pHSELMuwzY=
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

Remove BACKLIGHT_GENERIC config item from generic-64bit_defconfig.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/powernv_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index cf30fc24413b..60a30fffeda0 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -208,7 +208,6 @@ CONFIG_FB_MATROX_G=y
 CONFIG_FB_RADEON=m
 CONFIG_FB_IBM_GXT4500=m
 CONFIG_LCD_PLATFORM=m
-CONFIG_BACKLIGHT_GENERIC=m
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_LOGO=y
 CONFIG_HID_A4TECH=m
-- 
2.17.1

