Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DD2C8F67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:48:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHPs4Mj1zDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:48:33 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=bwZ1W/Uq; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8910ZMRzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYtE5/99Cl6PneUg/Hlhn2sLiIFKbhW/nr0BoAMgG3J3dyuocUxzwxdZ1KHpHWKeUE/3KFnMiOYAyMHfISxKeXCPvRKeRCtjFvdznJctGg37EOd545G5r3XOHCAkMHknx+/ii5NrgUVbmPdc8AibwiKMOsumZR0tX7HAQ2xXZ3Bk1rdSiaCaBSmOOEJcP1+pVFm9y/mpz+OGmHNYcI5kUFX7E4KdSn3bJY2BsZH/TEI3rH9V4iVCqbPtV+AVWn35iAb4U2NQyhpFKJJDSzCowxVx5F02UTf6zDT9lsERMbjqS39Bb7d/AC0nQDcGlmMSPhc3FzyTR2rkIm9kc/yLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WgEtSuAe3O0EA3YljLIjDHDfa1VOa4XxI4tbbKzcT0=;
 b=FzeYk4Lu6OSFg9MMZtVBuq5pe1Tu6XKs0nfhohftMvUyFGCHudaJfNx+TIEEq5cfbBVCHkro06y5lmNwo/JiFUmWZfGMV1ZRayZ8qHA4Wn+Rkny/hTpZ4ZPbg/RsRe4R0LpLOUHrUPnAo7ha1awLaPD8OYCG0myelUOj0DT/SvzafrRcMQAKYdFiCqTmElY0kIMVsi3uRIzyRg4A55VaDu+4gcQpC0MVe0khEB2/lw7XbwGvMuxHDJo1051wtdPZuigtKg0Qkpzm1QgwoyueDDUTgrJbXmNrUvCVKlHefhTXE9CP8tSiLt22cDinrUHztuCXB7Nijw2+VgoyXIn1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WgEtSuAe3O0EA3YljLIjDHDfa1VOa4XxI4tbbKzcT0=;
 b=bwZ1W/Uq9/laDcfQU1I6mwKcwyazDK2SirC24bvlVoSkYGkgNEk1ol2pbwNV8vSV9J4sn6UXyVM6d0eolgO7UVzIyxrZ/hmNDoTHZceXyqjRflUYlf7gwwhgjTQNoKt1eCfnbYip3tcvScNdJusJI8eRZ/yNPUNi51RvZcg2iLI=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:49 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:49 +0000
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
Subject: [PATCH 4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:36 +0000
Message-Id: <20201130152137.24909-5-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 070bc92e-6edf-408c-549c-08d89543a832
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB28879006C6E9A8514390F23BA6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U3s9mS8THhlD+uhsadTnFLJADLMr2MbH58TrQHhIRD42tEWq6OGm3ibQGmYAgfZmHwFrDI/5LgiJT3Yx9DZbO0wAuA2E2ZUpRxGMEImZKFK21Lj2TNAWVHZC9Ory7FA0U+G1msnBlqrAVcksIkJ9cVTUuQmTfVvnHQK3r+GHzCQz6g6cb8dkMYy/OKRGX6eHMBWiHV1l/gOeCTU2rVXKReUr3ej1jjtkJzZ7kWuFlGFZatYfoH4R9CNH/cevEevlrDYR5zQm+PqruKKX/YTfTB9lRfH48tSQ1aH1x2dGTR4tszcFCOrmGz7UHtPKaXEaSkDfSR4Lbrsxg3g4CZ8+EjXMPMWfsmA7kkzvjefg4WsUY5n4gUbbxoK0tUS2AQYbQM8Q5C7jInx3JfIPn9iq+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(4744005)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5haAOmkMGiZZpaDfm3xH0vKjIubX8j24J4Z3qppswEJQNeJKDSAFZQ7X6a7W?=
 =?us-ascii?Q?lW5El4R/skhG9AAeAxRM+WrbK51jrAyxOu+6K473YqawISJ/7/4suF/XG2xI?=
 =?us-ascii?Q?GDYyzOIGxixFmhZ2qWuGk2ooESw5T0KJF/rF6rFYTBSXam7lzBic0IxlPFn5?=
 =?us-ascii?Q?i3/QPk3cUH2/qLdjRIZ7tra6pi4qyi6+4PdLt1KuTkIDS6rFxMnSIEwNSUsL?=
 =?us-ascii?Q?V4Kq0tNtWBEB0r8Br5pRSwUgbbOxxzV1KhQ+rpL5MskNalsaRupk9HC2MVCj?=
 =?us-ascii?Q?XvRclhE7JQOqWii/VUaXLvfmid+RlLvVlEPKTqpx5mWf5gfNKT1h3h0nGIdH?=
 =?us-ascii?Q?M2idd9OfowENC1mEa5/gctkCt/Nco85JuAI5hj6HrSVYnGJVUVCqgieQkuqT?=
 =?us-ascii?Q?kWGHbrYMWgs1hOvFkEYPveaj7k2WxwL83/t0+ruYM6c3REfBb8+k62jl7JeI?=
 =?us-ascii?Q?wYpfe6Z9G+5BkO90KwK7K5su3RIjkcORk94TO1w1J572nr+WYXkO3/NnaDDi?=
 =?us-ascii?Q?DfjuRdjO53NhMQ491PBKPhiaeRnFuSR/RkO5tLkEnHlZ+DM6vWVrtdFDptR1?=
 =?us-ascii?Q?0pupGEym1eM2WJ/wOMOsf5ASS4FJk+BZI+5voqq9Wb8mmRI18HkvRulnMP9/?=
 =?us-ascii?Q?lJfruf/K17HmD9y1J1PwkfviZThcfPa1Yz+achmLrFYrmgr5AY23P6wkm/59?=
 =?us-ascii?Q?3WCbrL3ZwlV3CZXSSlJlWz/eoVzDv3ClhBcgGN0uEe23CHX170t++qyy9Zmy?=
 =?us-ascii?Q?xYQ1a5I4/WtsY6sO3gU6pigbjeXuad24G6FTeJVchlwdO+ih5Bw1SzGNG1hX?=
 =?us-ascii?Q?BqFSy4n214PPpRETF9uSqF2KTALqsNOncgSpjP4HlwJNeQBG04zat+QN9ULq?=
 =?us-ascii?Q?X9P7SCJJ/3iXnNJH5wgLvcBFPnqisdcvEK1Nvq/hMJDzqBAL7wSyVXfKkELA?=
 =?us-ascii?Q?hGemayyfV02Vd4adbVISF9wgTil6rIYwmMpZWI7x2CtH6IBmZr0lPZsdFNpB?=
 =?us-ascii?Q?vqMJ?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070bc92e-6edf-408c-549c-08d89543a832
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:49.2002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZropdnXdroFQkJypIOvldXRoYsUx3l7tF6jdJ3ynk4SQq7wHETZyow4+95fvGrQ1y+zrGD/uNo3379d5j1mdEFG0V8ZAk45QfEDZdKXCcA=
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

Remove BACKLIGHT_GENERIC config item from generic-64bit_defconfig.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 arch/parisc/configs/generic-64bit_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index 7e2d7026285e..8f81fcbf04c4 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -191,7 +191,6 @@ CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_HIDRAW=y
 CONFIG_HID_PID=y
-- 
2.17.1

