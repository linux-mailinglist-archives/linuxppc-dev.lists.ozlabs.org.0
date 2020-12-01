Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B622CB01F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:32:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clxgc4hrkzDqwg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leica-geosystems.com (client-ip=40.107.6.95;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=andrey.zhizhikin@leica-geosystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=leica-geosystems.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com
 header.a=rsa-sha256 header.s=selector1 header.b=eQ09sOk7; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60095.outbound.protection.outlook.com [40.107.6.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClxdC2X5wzDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:30:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2c0WH89Y8pIqElsF5MM4xB6UZlgcXBeGESFjLP3qkNOy1onL/xjQYEtJhw48yt+huRo9yNmF5LsV3N8pE4B6odYDFJWwz5IVEdZ5mvVzWstleqMurgyYH1O6uiDqtk+CU1LGkaI/q8QiNF7KoVLmP+sTTE+9LP1dljcYyUNDYhsNQeKPYbdWubMcwdnzlg5s12X5AeSGKU7ic6Eoh9ucvQuP7S+YnM6q6TvYJatLANr/ovddNJX6KC2/TBkNK3/gIg2eSW0vLfX669FrXTpvDbnpCQZHQEp5htF3e9Xl+sRYiAdz3Z1yEVtjZjnfD+jGdtAdrJFLLl4076PfnVjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQNbewLV3VO5tnqMlf4O+K3vo3WTGO6NgmUHjhgup+Y=;
 b=NQ3384f/XGAJY9LXV/n5Qkt/sMBr0GC1SoDn0xuA28BTc/3Jsk6OvhndakT/LijqLQrhyWtW/e4Jjy4XJRP/uyxYQ+c9S7hkIiXIVZ4klsSgiX3EMwJDBtE/TGXZYiRZ85fhKBjR5b5U44yjhk/h96V4VMQd/va1T/uKpbGnH2q/0Vr6/5mGg8vY5wy/eLFCw/4GKhRjRjmpJFM2k/0tLszPffRs0AVOn71aNHP2xuyg9j5qC/gZwlyol1h47R3tAYg4GfzN2VUK/8zqxuB9awM/qUjVKNye0cXXcr/yZjp0wXrTOFig0qrXOid8/q8zZZ4wobiYD+J2nHMWHZcUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQNbewLV3VO5tnqMlf4O+K3vo3WTGO6NgmUHjhgup+Y=;
 b=eQ09sOk70ynAV45V+xnhcLw4G0yUnkXSVjHAQhy31jobfhGPfl2SRLEmc5TcbM2KjUjMwBbwiw7tcnM7wESzcHocHTcMSUK4UJMa2SLcwWfSUNu0sBqXk8qldzIZOcqj8aRcvKXFM7/SvMSBhALhgykR2gVaf4VCD84THifQfrw=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:30:31 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:30:31 +0000
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
Subject: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:17 +0000
Message-Id: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
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
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:30:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d365363-08b1-4c89-53ed-08d89648b657
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB623630EB4354F1D60BA7FD44A6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMo6z8928fES3UzxAxn2rkjR/2DcWyNdmFlZuZsjMi56KGuIM3Nx2fWh6p7xbSDjIdki39DSUBYYVpJl4Q2+1Xzv5aAA7xsLMGPNxG+AJ6PMMgoTQ4nt1fWUtlDfjsNvhG9dvTplrQ/2/JWfSPG2jLDfh5WOwP4/nFQ3jGQMbcN2Gq3vz9f04qqZZlJU9swyjcQJ9vqEMF5BD+7Y5GPWFZzvcNrmYLqstUrulPaIqxbofPKfeOc1SJviIa/z+yDzDnZZXYY9hY0GfN4aSYwFTDJOlcdKrdxlKCq2tmEtjtXRMQxyLV0e4uUVfr69Ioh0UUF+n8eW5NAbyyRMhhuk/0jGKg4L6rlXDglnr27pFfT2GPq4G6e5nvpszs2f2fKWymPOShj5hpQy6Wh4mmf7Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ORbQbhIKfN1uqEBuSZvSCSxgb7ianXlDOp0P935hlkpkr7kTX1hsYWb0pvsk?=
 =?us-ascii?Q?JuWjrSrpzpyVQ9EG7jGC8GOncR3Bj83cFQAQJYBkcDUVoleD01yRzMJ6ItN1?=
 =?us-ascii?Q?bIQMi1HV469ZA4r33emxW0fbMlIJwoKmlGuiOJFE59n1ja4nXfVM0+FU220Y?=
 =?us-ascii?Q?2cwKNn0zLdgRZ0nKO7xEmFzGML3mtfpmXkwvn5y4jeXvFSvqVahFWdSGmVsI?=
 =?us-ascii?Q?VvciL6JAGFmhS3xL0dyIQ3iuqhkd3nvu2QgQQjVF3ZpOneFDLdEW1NjJ79qf?=
 =?us-ascii?Q?H01pVTrjbpdjzCJLDR4hWbf+pKrxqxKhhel5VXUXdMvhHUpmnjQGSudEsS7y?=
 =?us-ascii?Q?Hp24mTsX8eSZT16Ac2pNF2Lkl3RL65Uas4sjE96G9+irKOOTxyzTo8o5OxWz?=
 =?us-ascii?Q?uyYh9Gz0FQ/gfstpXNVaU4vHcJL3FM+PWxVDUWjjUzMZVN2rpKth8FSSYQkS?=
 =?us-ascii?Q?4yj+ciu9rwzposHj41msORGbW1LPpB8/Sas+uWt2spdue96FuuoVfW6A0Uzq?=
 =?us-ascii?Q?8ZWLeZi1KQJSzxQIeNrlJPRhQLHF/VNDXEIWd/7gNcFqGtxvJxf4YRxbPYiY?=
 =?us-ascii?Q?9u6WA/cLn8t/4sxV8H3VT10OCeKimY6e3xBLj44rTKdPsqTiISIN2Yuiaejd?=
 =?us-ascii?Q?Gcyw8CCboP0MWxAJzPkNF9ujISn0qENneo//DVhBqf+hR0gSnCOlCzZOr4H5?=
 =?us-ascii?Q?5WcpPjjzLJTdhc0UijW4VoNAd6YNhnWFd8zC1A21N/t5qDMSEKrQxJONK+lF?=
 =?us-ascii?Q?BTunrekVkhREA5wb1CVnkFa3v4+NS+Jj9F7jCFpE2epNdFUgc7Jv8zpn++eD?=
 =?us-ascii?Q?hx8xskKW4jtzwfVcg1PG7nDuqBRvJcyrfo6BIuGvejSPfPgKDSgdYZ33gFq9?=
 =?us-ascii?Q?ospqmsyZxxqIcHAA8ljPJrOCdF+U0Bx9e5nBa+CcdkC9NMpKJPviqy4Jhypk?=
 =?us-ascii?Q?mAaEXKrRaJ8J/xWuHnh3WIb4hiQeJYfG70gpgXhqdPJxqA8DdQw0RWiDecF8?=
 =?us-ascii?Q?6n5u?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d365363-08b1-4c89-53ed-08d89648b657
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:30:31.7441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4iryKvc/eLM0i/wx6VOtknRmR0+bG26X4MggU95m8d0ngemwHphKtAlGhrxFPDWnhGYIjwuVneZ4bPk9qlbNl7SwzdJO7P9F/kZklGPS7s=
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

Since the removal of generic_bl driver from the source tree in commit
7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
unused") BACKLIGHT_GENERIC config option became obsolete as well and
therefore subject to clean-up from all configuration files.

This series introduces patches to address this removal, separated by
architectures in the kernel tree.

Changes in v2:
- Collect all Acked-by: and Reviewed-by: tags
- Include ARM SOC maintainer list to recipients

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
-- 
2.17.1

