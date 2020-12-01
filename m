Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203732CB056
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:42:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClxtM0yDszDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:42:03 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=selector1 header.b=tLtkVXfH; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60105.outbound.protection.outlook.com [40.107.6.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clxdn44D3zDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:31:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk/JUNMGYXFs186Re4egR5a2ZoNSsWazK9EO/6ao+4UpMeinZ1fB1JDTpFR37BA58rY8NJsu3dKxTBnUBHJoghAidfF/0TKjWBUmsnBAhnMsvhsE50Uoh+k844Cs3HASjNRmajRcmJUM2LPdT9vTMK48DOsg2xv3t2WsBMJW0YGTJqDeajtnq3IzC/neFrxcgUQ9Tid4blXsISN2w/DDCN6dwQY2HaWx4NlUL7fIDce/hGSGJoGZGprgECQZrSeRCkTZxe3zd2cSBQXGlRqsiIR4Fbbfra2uHRi/ILJz9Tpk1MoD+rtNhRNpiN0cotgqiPvoYNQpbkFCpeXiuMJo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKAQHR3MC8Q6hTAeZxSeN1p0KFDXyQZMzl/SLStMYHQ=;
 b=K6uK+eDDMIHHpSCnDugeZuyI48Y1OSSgmsbvI6okDFsh/1k161PKLOoAWSXXHAESpzolB4+2t6A9MWsjYigEEAGMnFTnfP1T0R+CcJjvIgJUaRZRmuGTZ9TJ4yo4sxCHDg+w1lVSuRqi4kPq0nPCd68j7s/6FEXog4jc2ivlu7rpBBeRn9JT9foviIghoTKr/Z+EBn3fOaOkuWLaHp9367QWeYJGKkal+KzLruBNvN5Q1ac7XVW6NgoGda+XpQcED8pBKEGSRunXTVbCEFpY3R0/965i3ISTIj5CcpBiqgGsQxfGcD0FUOJ5GICDPVEdW6yzCjGLO+SrUGXDX4RMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKAQHR3MC8Q6hTAeZxSeN1p0KFDXyQZMzl/SLStMYHQ=;
 b=tLtkVXfHYkU58w18F1lKciVhIFG2BV/Qp3zm3GK47OHT65M5ZQmUN/DE6nBmkqtOyp/R0VuuDzxMnTSReW1Lv2NtTlQWf1TEgsLEyFAq8q0Eusg9YHexdNbzJtFsmpx7wPcX4YNF8J/rugWtASJxfNKBI+LSShgr1JpRjGg7Nb0=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB8PR06MB6236.eurprd06.prod.outlook.com (2603:10a6:10:10a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 22:31:03 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 22:31:03 +0000
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
Subject: [PATCH v2 4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
Date: Tue,  1 Dec 2020 22:29:21 +0000
Message-Id: <20201201222922.3183-5-andrey.zhizhikin@leica-geosystems.com>
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
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 22:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6120bd5-c74a-42af-e852-08d89648c98b
X-MS-TrafficTypeDiagnostic: DB8PR06MB6236:
X-Microsoft-Antispam-PRVS: <DB8PR06MB6236A74696250465132F631FA6F40@DB8PR06MB6236.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkbtrvT8MR7gkICbt9a2lxNYngv4sIUjYArvzBSltAd/r2DdXhYW3m9nzbRlS6t04hH8RbNqDxmZjqUsILPbljlI0QxPmtMSzToqEJRs+f0LZsvop64zhyDyp9ZdUty7ZoiM6mxgbOjEb53oN1jizqAIv596lfHoWWW5saI8PT2JXfraneTwfKWuAxgpT+1eWkmCnnJztfZKG9XgR0vHbZLk4dE9ha46IP4HS9xdQo17i5lXGPlmyCduMFP/td4AtXNFJjl0HoOLVNXq5GYpFipPPJWlHdtIzzcbkcIkiu8gw+Xo3CnwC9Ypls2dlOgH+pi9hj0kLk1wOMs8yfZBDLQKGJdAwJOwgtGFnuH2n/EEhFgTmebUZcjVyhLv4K9SML8tMD++WIIftB/DZAUa/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0602MB2886.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(66476007)(6666004)(66556008)(86362001)(66946007)(26005)(1076003)(186003)(36756003)(8676002)(16526019)(83380400001)(2906002)(6512007)(478600001)(8936002)(7406005)(316002)(7416002)(2616005)(52116002)(921005)(956004)(44832011)(5660300002)(6486002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V3OunZRv7/8ZmiUHs+aJAv/D2Dyu6Ifr+PIl8t/NT55HUuHoEqzAw7MbvlRO?=
 =?us-ascii?Q?LgS18rFrgZkmd6xfBJSIhUFkNRTXtTmgwoFFQfcUK9U06UVTKfYPffnYzZCo?=
 =?us-ascii?Q?8x3CjnRJ+aw6ObRY21QN6JScOiVUZrjONa9OSs7bL0/lux1wsWlHDnWr8yHR?=
 =?us-ascii?Q?yYh4hOT+O1ReuO24fgh6OGUB+qyA28wLDbbiUSWgIa8cfUD4d2F+4EgNrLNU?=
 =?us-ascii?Q?MaOaeyItvw4PF8Fam2oc7TFTC0t8hzJ4vdrKjGwKs/akSc8nmXAvg6CXU6w1?=
 =?us-ascii?Q?PK+RxgBrcbBT6/YPS9POhYszdPu9aL4ycD5QpWpsGQEus91TTf9bV5uGkN5f?=
 =?us-ascii?Q?Kmuc0QPUEUHbDT5CYHH+9WuLmjpDoMSP1ntMSdzDCOjIkOcDqW8Ql5rKwdw6?=
 =?us-ascii?Q?I9YEmBrYq4DEtI2zbHvyM0XwQolEVc/WlKcD0F+3kzRi9FMuBx+5BSznjol4?=
 =?us-ascii?Q?7TKxOqXSBT9LrL6SaNPYyRcMaoO8bX/MHOOrQXul29UYgGBEv2dj03WWc5es?=
 =?us-ascii?Q?71AoU2F+PZ7SEMJUMStVOwSZ+1cO1+PJHPh6te5/7CBI20eX+wAjhl0tkudK?=
 =?us-ascii?Q?yWogyn4OIr39vgBVHg8UIDS+vdFrMaXNHxrmxUYAtroHtYlWDRTKW86wuOnI?=
 =?us-ascii?Q?LmaL7eRVTaFBQM6BRAct2s1ihBhwGv2+fasLppH6jwsBagk3/sDd3i/WQXFf?=
 =?us-ascii?Q?qzgN5vet/P0GkJZ9Q0AURBOkxBYHw4P3ALgORVcBNhC41pcCR1E/MIB1qQ5Q?=
 =?us-ascii?Q?6ZJRJmb8pmrfofeEyZWKFRt3MZ1R3p8dtA2S0PAW8Dbl1esdCNmlFJzmkn9T?=
 =?us-ascii?Q?lhNLzs7IUjECFLkQ59dkuOPnctDsqmUB/RD63gUEH4FMYSm2Vd2KjNXjR17v?=
 =?us-ascii?Q?IWMBmwtMu9GmgyKozd2SP/Uq+gRlLxawEJqnk+DgZAQRMwHsvmgAKHbAIqiA?=
 =?us-ascii?Q?29KCpEkp8ymv4WdOfnfphgwQoLxGHHX9SInz2RUnKODmJM5H3lzA1JNQfGUl?=
 =?us-ascii?Q?k7B6?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6120bd5-c74a-42af-e852-08d89648c98b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 22:31:03.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSiwXEjtaaDr5EmJ4KMo/L/BL/cFfWknGQQqhTfeNt4azxGRB454Tb8iXUA0fuR69j+Wy7hx/8n3RlFTJoPAENpylAyZuCIJ26g8vrb2/wk=
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

