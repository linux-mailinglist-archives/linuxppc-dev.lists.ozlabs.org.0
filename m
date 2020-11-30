Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4E2C8F6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:51:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHTj3C9bzDqB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:51:53 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=W1wYWs2+; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8922znnzDq98
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsP3zkfCwDfYYjb2fv4cATq+tAQWpd0PK3rewpyWNRH98gwga62bZT2OyJJLcZPO9gfEyppC8JZ2ObEk11vQGTUCWNPqFRZDq3nhfeVbm97vVceWYvTOB9NpwxvdbKzd3/c2suNIwDxnc2rRfihzL+dmq0G7E07JclzKXwXmffXE8+tHq92WF7AzCRj88tNyjeSKspMMi8O1R7kY1Bg6x9UMbkarhENfaiuTtQx/Zyg9iULcSxwAs1NINlMohUYRG3IG6Yn9niujIgude3PzOu9gCfYGNM/0tkw5DWlky3T6lAR/LSg+JvGmofEH35X1uEJJEiEC07rntY4r3lQdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PASe6tc0Bvnd5P1hnlXar0wMMeVaqkBIb+of2OVzPhw=;
 b=mScUhJpIfgHCrHlnq5Vt0dwxODM3fyAUzDCoOt9QTJc5O/omIdVSCZT4fpLmtywVlwXYleEObiAmTywG9reCXRDrV1P7GXzPpfsaZzMOT1GpmezmXYsUTaAwdlIYXRsTfUQwwuL1wSneVN9P94bkd3q4QFrNh5yRdn3jut0a1R+ZLcPrm1cgrszo7KiGL5oOyfIpH7N+LX0gbMl0EiCAnvpsDnM1xJIXKR1yFZOc14CKuOmMZsSh7lbPFEDPaH0TDBAahwZa3fDthIwaGgKgkjfPrXH8zr5OmEw221jj6NUyoxZz10YDfRywK9nc8w+po4CfamZNJWGv/U7g3Bn0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PASe6tc0Bvnd5P1hnlXar0wMMeVaqkBIb+of2OVzPhw=;
 b=W1wYWs2+itm38aJFHdsocsi/GYlX2Tn2WAZqOxxsOxbMcypQCerxRgsx7ejrizFHKeXLnI2WKcpsC0yl2Ed8Kq8ntoLy+2pkchJ7UfLN4H8o8maqGdiMRZUfVWHipHXH4ydfE275WLRVftruCadOhfteiVQDUaRgbx774Okm4zk=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:50 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:50 +0000
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
Subject: [PATCH 5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:37 +0000
Message-Id: <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05c7aa9a-e271-4d76-897f-08d89543a8f7
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB28874E2B958FEF2A76647379A6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtMIUFO3Cfg7TZRbAD6eYE9/KNyoY37Irjnv5z/sQHEflWAZLH7NTJAXnXoByVigBtefZGRqQ+CRMt/ikZ7BKmqB1jevghEBiNbKQzT4IrvhQTb5jrXELHMKZxpbguPTD0tq5KvLsELdBrPLSJ0zIE8cV8gRTvmufzzF5bYx6xMx9ytqLQ9i+km6pVx15NNO2CE9z4MLY5iB1JqdgH1e0W5ZFXqlhkbhSSS4GHgzp/zwZL0h2b4NdOqBC1phig8uoqLC+RctQTLobzOCbNuTGgofeIFdsVnQexa9fEBj55zHY+7+EmfN71A92S65rl8y78fu7aUTpKqN+hCKjM3DOJIi0fwXnzQzvv4xS+ZOW/taHTMoUwLTk8YLTdIURrvpobxSBr8KWS2ms0hNhyy7og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(4744005)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WfDKOrYkB6FaKQty1wl/EOFjlYKUWiwVQ5qiKVzRNQ1cpp22rmkTsWfZwhuK?=
 =?us-ascii?Q?YGFF38wDMocxCXSmeUjm81dRTUpvHR5om9dQWhxckdeTugwJs+t43H1krPqq?=
 =?us-ascii?Q?IJZxjqhOcGm2bis2gVb3oLsV0I9sR15auf+eb4W/jPBlnVwTd7vt0rRbG61k?=
 =?us-ascii?Q?zMWO2s7lDXGukeKsHkISHHSFoA0n1JtwSjz3Q+8sUN9XyjFlZeKk6xhHyMOo?=
 =?us-ascii?Q?0mOuubN45561OdTW9NRPo6uLXZyt88CwP4yH/hHEYXTxCD4LVek4fDHi2jpH?=
 =?us-ascii?Q?lE8G5fQr8++6BMmVavAHnRYSHuqOmTicAZMK/0ZMCtrCvZ95vFAwDgrCuHkc?=
 =?us-ascii?Q?b6sqcoUI4AFURyomvhUSUiaLTaMtqfO5El6RMfT3tCZb1r4SJ5ngbu+Nst8W?=
 =?us-ascii?Q?vUlQiRnlYseOBqwoQ4yhyTBXBDFmzpCTuZ4j9KvC/diBrWVFrNPfSMWpVG67?=
 =?us-ascii?Q?goWxKk23af4SxCf+zuYOR2H1EQzjpYoMQNgcPK9GdCLeoR5U2KyzP9bXm+2t?=
 =?us-ascii?Q?ggLE38t0jTNMo2ysAw/8Bm0PesqK0yT9LC7xX6/fVkjkpNGRn2LkMww28Cjh?=
 =?us-ascii?Q?fxqJwqj8Sw/8SPwhSk2ZafNHq44s2bC5kxxiYTYjlHZ06cVrsVlihhAXi3ea?=
 =?us-ascii?Q?QtPqPKtsqhXFLQDL13l4btCL32JIR8jD5MW0qprNW0JwU8RxrYXdG6zyWayV?=
 =?us-ascii?Q?V47MDSA7hFq2LQocMLHzipgrMsbXVRpVbQCidgePAd6rxVn9YPwGmKpqapqf?=
 =?us-ascii?Q?PXojVHWLLEVePScpMQJsHPYGA+J0QY/UCEV4qw2emAM1PkDZ2eoBPi4fGCi4?=
 =?us-ascii?Q?KQy3cEidwiN8t7IeEpsreN2D9VAgGFwt784d4lZypUwkp7ulpWRCZ+AlXFP8?=
 =?us-ascii?Q?4WlDYPyO7My5EPljTKzVE7iIJ4fg+2ZcxKIEtmGljQ/yBxRgEsGfzEkQSZiX?=
 =?us-ascii?Q?eKmcs/4Lpt4rAa2F7cbcweNgi3i1Uv2kd0yvffLjjLZlVraAT7jX3CHb57z5?=
 =?us-ascii?Q?QJYG?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c7aa9a-e271-4d76-897f-08d89543a8f7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:50.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mslY1LtSYuJztu1x7vCKv6hSlsi8aVHltnH7lf7hLv6TKXjQqBjs3fmqjz65W4u87DLOsCEhGIjKJ3RUD5ULIOXETzg9AVSdfOKKrdDhTYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0602MB2887
X-Mailman-Approved-At: Tue, 01 Dec 2020 07:36:05 +1100
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

