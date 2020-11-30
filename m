Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 343152C8F5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:44:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHKL2qchzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:44:38 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=pCHw7t/T; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl88y1thNzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:21:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZBM+3RCYGbKHieYYMWXm/K+q6azS63pckxAqkLt3U9UxOZbFRLlQObTZne3PawzQ5phSvyrWwF7TEmBZaTdLx+EmYENWIcwD9U/XnVzQiF9oaVwJlpLDjK37Zluy/g3Qhoi3KwnerK5EFYUljipk6r0Nw+1LX7z8RTivmdOQEXbDD6rBtVVIOwYpLlQ7RUfsjxouzJWDlsOZlmb8e9AMRJx6wDVXBYv0ki0PJkPgc4q53kRHDbnyCbB7qE0SZ9+ENKwB3haMwkQEFGyVM4hATCxcMMaX8aeiBLnLiaLPkxltcU9o5c3qfPxL49gckfPdX8RLmrU+BX0IogRQZhTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXMFVkkCVwdRalnDw8e6jBzalFK8aL8e87Z4Y+PQQ4o=;
 b=ONTNO/lz8gxyuX0TsRAO1PTEAtqW5zf1F9M2EpCZ8/tCDXI6M0+SRIf1zc100UgMCzrIuHDOJad0hCk+vzpXYcoS0fgioeIzFhPSETHMXyNUGSc06XRrqXDi+kAUgGuctUDMBt22LML7lMBynKEWUdw2ud7U0jnVL1c793it+0OGDQRsMCZYMSsLkgSNSnw3/29BaaAoIKrF4cU2SxK9XvM61byw0cVpgLNvTNcauuIEnSZPXrroKTXBHUYP5fPpvs3g5CTD4/abzE8YcW6hVoAcaXXETInfdXz60lRMaT6GMnHXYqj0jOt5IgvzuwrXZlSbubk9+1NtgQ4DwtIbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXMFVkkCVwdRalnDw8e6jBzalFK8aL8e87Z4Y+PQQ4o=;
 b=pCHw7t/T9GaFUwdmV+o3xSVVU79zm/Ww57bJoa2h43Sw9N5o3mOvUTwI2ThvHjsX3Nplnkv1CpDJTJJyAW8roH5KVLsVXgFg4aCR/Yot2x1egt9OT344xAynqGadV9fKGBgc9KMNWQo7cAKv2jUFRwbSTGLCt5Hkwgls1J3pepU=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB6PR0602MB2887.eurprd06.prod.outlook.com (2603:10a6:4:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:21:46 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 15:21:46 +0000
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
Subject: [PATCH 2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
Date: Mon, 30 Nov 2020 15:21:34 +0000
Message-Id: <20201130152137.24909-3-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:21:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a842996-2e59-4656-2746-08d89543a6b0
X-MS-TrafficTypeDiagnostic: DB6PR0602MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR0602MB28879E1E62B9AB6FC9F4AEDEA6F50@DB6PR0602MB2887.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JH+4p4dvUryKhizgQ9+hqI2xhlqkD5n8nTnT1tRSJGljZ8U2doLXe3CBW+ugRoWut95wch7w3/gOPEkqhxI5g3fuZnIHnIsh8L0fxLxbnZdLae42QxeMwml+3SDxnY9S3TZuNk6nDhz7jHIyNCgvHTCG+q4hrCFpa2F5VD9IZEHi9u+qCus+2vvwHIzZl5lfwRVftlnlkm59ezlYk0cbkJ7dvxhWOEQPuCqmgi8j1JN2bR8bPR8exZ0fd6qYcT67/KypbVSe4Nx2TDVE0bnX2bz8VVuuuN67fZNyc8drPF4js2/jv/1xlm0Qi7SCDA212P5+BBhwsf3YucOqcGzcbtB/C5crfLmJaHGRxR3z24/rCjoxMW3SIrq19NCVzZS4seENwWE/Wu4C0RxKbT8TGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(5660300002)(2616005)(1076003)(52116002)(6506007)(16526019)(956004)(26005)(186003)(7406005)(7416002)(36756003)(2906002)(316002)(6666004)(4744005)(44832011)(86362001)(83380400001)(6486002)(6512007)(921005)(66946007)(478600001)(8676002)(8936002)(66556008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sziWLzZhIf1E2wKj0ubbbncbzeWdbWBQkG2uTmk7zzbMke5hcQ/lofv57YLB?=
 =?us-ascii?Q?5Ju0lXlrKNTCKRnkkwQ0f7nSpY1PPtQtRpVT7FgvCRtuVTf3FDowV++juE8R?=
 =?us-ascii?Q?KZS2GXmfg+vxPNz/eoU+jnLQH7R/USi8zFETQo7Z5JCMo2qtLHVflpxr1664?=
 =?us-ascii?Q?2MkuoIKMmCs6/Rj+ed0coJKTHL4auhKl7AmL1Rh3MWYAKbsnrEMKTrrwwkIF?=
 =?us-ascii?Q?+zNwD5Z9yR6S7YLYX5kdhzG77B0l0Mqkl0ZiLZwSEYA0ZCFoOXY5NVj6dPuC?=
 =?us-ascii?Q?56Q7m0z/eRcNWbI+tMDASQ5OiFsJCthYtkGPlMMI1X+8k70X8c4PRD0pqlki?=
 =?us-ascii?Q?GYbEg7up3aEFmxEbG6VfzUmhBPzWacFbNzEBR3RG/tiCfAHSZkpUrSOOJthG?=
 =?us-ascii?Q?xbkvVwr4KdsWt/5iTYDFrBo/YIJFsduvzuT1YOKvpaXawS6ieWyRZrvghosN?=
 =?us-ascii?Q?nxOCD2+KF5KkqXlDtOpbLraCXSrkCh6U3jrqevduMUEAbBtj5uR76IyaTnni?=
 =?us-ascii?Q?HJwOZBAbo4425wRgC2madlSzISxn8AXqJPNxgoCNhe9yEAnmpOo6MS/rxA9r?=
 =?us-ascii?Q?mAjzIYjYqIFIOF6H8cuxW5U8k1SbXWzpybfWzBWZGK777tpruqzf+PHMfXYW?=
 =?us-ascii?Q?aD996pEmJmHWsKK0jS6Md+ihbV3o7aeyWe+M2nA9JTKszu8Anr1lNNkailvi?=
 =?us-ascii?Q?SMXmd6QaIkhPb+fbPPzjFWEOKT8GI541u+ZbkJCWxW49OokPLcs8bXvZrzu8?=
 =?us-ascii?Q?QFErVYrysozMD8eKluPqRUn52v24QF+4Z0IDRk1T3qGh5stF78ncHViVO6cS?=
 =?us-ascii?Q?Yq6XaRGejC3iLUbeH4hcvPxYPvo1caKcAw1GAVIi3p/e4KkhDba7S9ryLQlJ?=
 =?us-ascii?Q?JTdZCXPVq1l1XXB8LygSUFjMVU18DesPmZwLpgwFZJKzD2Y9rcOt4r2hYE8U?=
 =?us-ascii?Q?AHjoJErjqTj+IW2n1q6NGHnxQ1g5hoEALSuG0L+TZbhMhtJ6izCjc6RNADD1?=
 =?us-ascii?Q?mmYg?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a842996-2e59-4656-2746-08d89543a6b0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:21:46.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sORhYq/HwjZtNtUsSvHRlyNzf327X6M6AGJbtvZN0VgOeKgMmpHcaeGiXvXjTsNMsLX7yxiyI7svr0oAukoNvXD4GzQ9IC4U0csbfDIHK3g=
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

Remove BACKLIGHT_GENERIC config item from arm64 configuration.

Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8e3f7ae71de5..280ed7404a1d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -681,7 +681,6 @@ CONFIG_DRM_PANFROST=m
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_EFI=y
-CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
-- 
2.17.1

