Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F058F5046F7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 09:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kh25H3n8Xz3bdN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 17:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=JX55wPFm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feab::705;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=hanyihao@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=JX55wPFm; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfLmL4Y5Tz2xDw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 00:04:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eds2KC6ollFfbEV6EujqG1MWai/OY+FJ8IoZfWBfWntVo4GbjiVbDDKpiTUuA0c61KkdXUngIJbUFyBUvR8s7BvdqM80d7xE9yy6f+xQJfO4X9Lp41yCudyhSLb4dZu3/M+ZkBPaK75hvZm+3Bjmp+NC6IUuTvh2zHm3KY9Anzl8D6xvF10boO22n2Le552ABQ4MSjNcEHr68PuoTorUoDfKAoUb/h+7OTQvtkuftxrkkC55sNoKXhUylMRobXXL8x91TWLV3BXaB+FWMN1fR2500OiZuc64gIwGx6D7t7mATHfokEr/DCdZQm/yX65rZvUGyB1QbSmAftYx4bTnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvDRcUOEPLXaVETYYAHuWrBJa6tmWB68i3kWT3zDowY=;
 b=cgrY984hcyfTzqC9ldXjAv+qNpKYdop3C73GpU2swzeY5SykzhOBCYKuhll0C90ov6GLu0QiOiqFsYi/Xhnb8mhagHVYX2PZ36WjOg8/SnTsFLJifb0EgFJ3fUg0EE5wC3U93H74+kh7ap/RORqAhxhMgbPsmyx0wTmFqw16NXMLrufaf9YottjjhCIwXs7JFyh4my201miYT/G36MJP84xaZluQc+Y58RqD6uIk3AIirFZkJRa6xPhfoR5WkfYLEZTeSvOWwL+0XAmc4KFKbjL/MfoXgXEjbt4ta4JxDiMfvcUikLLQy3rnqXNDvTZ1hgyZYWi30TtvhHPuFCHFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvDRcUOEPLXaVETYYAHuWrBJa6tmWB68i3kWT3zDowY=;
 b=JX55wPFmyXiOG3KIj3cJg284TeFCCf17xR75wAhOz6N5/qXLKLtmaXXI2PofjrifuN3TbnIAywJOdSG6pGnMf7NVYTEIYREpYcyumIfuQwTT+DcgtsaqCw7K1pP5OPpfcYhEWKRphtG6Nx2bjP0f0p/p9JiShKJlkmZu6Cp88og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by SG2PR06MB2252.apcprd06.prod.outlook.com (2603:1096:4:d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Thu, 14 Apr 2022 14:03:40 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb%4]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:03:39 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Sven Van Asbroeck <TheSven73@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, Yihao Han <hanyihao@vivo.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: macio_asic: fix resource_size.cocci warnings
Date: Thu, 14 Apr 2022 07:02:42 -0700
Message-Id: <20220414140304.82751-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0161.apcprd02.prod.outlook.com
 (2603:1096:201:1f::21) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cfaa211-6328-4066-7ac3-08da1e1f93b0
X-MS-TrafficTypeDiagnostic: SG2PR06MB2252:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2252E4B7F22271DA504F22C2A2EF9@SG2PR06MB2252.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kmyj8XogfNGPB/dJESatiA0gzGo3SmQG1SRvYKplzOkmIoyKBYnRAlqCjCDWHIPUiFPzSClzhaF1yZ4MXHlUfqfCBrwjJxNFaMKhzqhcpxP9CQ4ZpRYSKt4wvkjxawd8RWbYLh/XVKrHfPENLT0Zgb5OneK90ttwjs4eg8Br+z2o1yjV9smBSyNYwZ19WJMUHJHIbMcmZ70pz41+9cT1NZBEKMZDNxXKSH6rwItePERPST66PNMC1L7X/HjAaw9LavDZ51OH2qMJHRQursFeLjdJlym9ZjZKu5TSXkO9b78u/dz1pOacnCTVxk9v5dkvYL1Tnf73MsGGcItEKdgV4o7PEkPS1vhLyLA6SSH1CHO+dW/mfmrCY28W3mqYgtEbQ1sQ1Er78q8aWSEowF2iR5SdLPBcvANEn+2pyuDw6eOYqroa7A5UtveEwXHm+l7gXV5Yt4SzNC7zoLrAQoLEneHD/7GRwAXI4ehHtuqZojQUmfaklBwlAWlICTv6yN5C9VGTqhBdfa9raZaUDZZeAuxfnM/5wHDEuQgnviNTCv1DufUzvhMbGc5iBGXF4BPR9PiJKHnfaxNMeiiHiaRK7AJLZp7zL4H3MtmETSVrNMsFnbvAM+DnT38XwICAx/pDnCfxZQeJVxiEIbVef8+jd+993piOejQvr70KUyfFI+2OsHz3wmbFMCRn4idF8DmaCkbaXNp0j0NhFSkcMw2/9yokebFayNdN902cRqI2o5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(52116002)(86362001)(6506007)(2906002)(6512007)(508600001)(6486002)(7416002)(5660300002)(6666004)(8936002)(2616005)(186003)(26005)(83380400001)(1076003)(107886003)(921005)(38350700002)(38100700002)(66946007)(8676002)(66556008)(110136005)(66476007)(316002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJYrTRvhgrcfzSjgYhonGT7OmVA/7d5wtIPy3bQyhP6Ue1RE7NoZ3391fv3F?=
 =?us-ascii?Q?K7ZEJYZM1z4l9Rh+NoD6XDMro/OZbYmMKsjyQzkel30e26zRqEK5myPkVqdT?=
 =?us-ascii?Q?WUP/Uv9j7VqPIjNIQTtkorJjfxnF3VDx/F0S7nZbDY4D3CnWfzWSxiaATtnr?=
 =?us-ascii?Q?y/a3w0ab3RuQXUpD6G8BMtdL7GJ+o4MrTRV1mc+6DwHabmb2GEVXNURwoO4V?=
 =?us-ascii?Q?RP/HlkkXCbuESA7zvWT6MzOafYc/3MK4RPsdLEBDaT44AC/eQwXAsotkZ9zy?=
 =?us-ascii?Q?Gp6iUbU0WSVVOccYayRAwbO0pCuKknGJAAEk1dhzq5npzVbZ4B1IAVzn1kuP?=
 =?us-ascii?Q?u9Tj0Z2R0ONznwNS0OH+ZYinbRxO6/vnUSuKNDgeSTWiztavrJV+i2b5Ulfr?=
 =?us-ascii?Q?dkenFvAKCuEphVXWbIZA5mSNu6x/HUfSXxqccjTdtzE3oyWhEejbz9UH4c7M?=
 =?us-ascii?Q?/mCqV8augxFMooxNK/QmzB5Yas0iqRWX0/WxCESofkhV8qIw1/kJOW/dy/+4?=
 =?us-ascii?Q?3qw2JM/lPo/HanLRTsx4dGBg8p2qrZA+BF3F1CE+s1hezfUEdw3dLxKXm3m1?=
 =?us-ascii?Q?24yshhmxnJkPOylU8parYWCEp4YP6mCZq+xns6TrXmjEp7QRjENrMqEH52LD?=
 =?us-ascii?Q?Zsty1layJwXTb0eJu8Lq2iP8ofAYsW5/q0oZ6/WnA/w1hdnHdXxBZqeygY2P?=
 =?us-ascii?Q?qQqIHadhQzk2cqpLtrrGtOX+HVrZNgZs3w1G7BVPxFc2jZcymeUHdJpW7pgO?=
 =?us-ascii?Q?nG3ZSVLtvfkfjz0JLlicdg5O17eWyGh9oQt+JeHU00B9vE0l7RBW1LYzYqPH?=
 =?us-ascii?Q?mFQ7cboj0CMg9PYt3GWRXdcVs6H9WKoAqDUhkWQ5PyzA8b6mt2rvMpNC07wn?=
 =?us-ascii?Q?g0PswS9yMkIXHtnZt11CiXltr/tAZhfaoFIn1Ee336ewhz5S5VoQ7GPXMXIC?=
 =?us-ascii?Q?1MwLLLS+LrQ3w85Qp7ugs6DTIX6k6ZetyXfwSljge2uAfpw4p1LXC9AIxkjC?=
 =?us-ascii?Q?YIvdwfbIOyGQpxGv2DrsmoW4lX0oogBkag7obOvNbE1vLSeqcTfs/l+jgplq?=
 =?us-ascii?Q?GqAnTG1Vd+4ZMWUijzpHSVRv2MOz+0mSXp+fjQQZVY/zNeZvLWG9OuYlKB+Y?=
 =?us-ascii?Q?tbWsTvXtKkpX97jxI6zImgjDuzZAx+z5LGwNx+ahfKJB5vEuYvuW67qcfGYU?=
 =?us-ascii?Q?Op9nEkCF1N5DdqLHAZZYC5lPSOF6Brivvt3zTgC3Wfj+BzVEUk8PhXIIl8W2?=
 =?us-ascii?Q?roOq4yfS1jDP76SKB2C3bjVCkw06GW6uSISutqmwBHQhdYLtpf3vVfokQQ+H?=
 =?us-ascii?Q?CfcUKaFgwpEsvhVyWOOsqI1KXK7IDTUZRxZkGZHhR3Qrr/zbQx2cJk0lou9f?=
 =?us-ascii?Q?W8k0mOe9jwweDU070BldWJP/HxJoWhIPWurbp9wHTjlWKzQ+vh5dTb1P6VUh?=
 =?us-ascii?Q?HYAk6+2KEw0xMPWpBoaACx81prUGccpY2HO8wfMoNSeHmN/T5MRJwcAqUn7h?=
 =?us-ascii?Q?EtF3H5z1IZZqa1B4pPW99ErBl7tgnKjIIusOoJ6WsJpD2vM3nekWj0SI+TFg?=
 =?us-ascii?Q?5QOSvQBthTkRcy4IVTpaOMwtFeJg3BkTNRT/TjDpaTibpc5Z+hLbwcQ7LM7x?=
 =?us-ascii?Q?7gxIS1NZk+DEZSx9hWIlxSqtr1e/5y/Vz9bluvjP9+fcR/E8alggpXwcNhkB?=
 =?us-ascii?Q?cZKTtsXr0NdIQBeGTNk72kA/QtybXNgmAeI3PeZQdTKAqKGRjJsyYqmI7K4t?=
 =?us-ascii?Q?Fs0Y1XMCAw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfaa211-6328-4066-7ac3-08da1e1f93b0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:03:39.8570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J5MdpxsDhImVLlVGaHnycbQM6gPGPkfAJiahg7UPozMTDU4RT8J4EjsK8VDjefX2XlIMwwhG6yb1rPTpCy3TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2252
X-Mailman-Approved-At: Sun, 17 Apr 2022 17:38:55 +1000
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/macintosh/macio_asic.c:219:26-29: WARNING:
Suspicious code. resource_size is maybe missing with res
drivers/macintosh/macio_asic.c:221:26-29: WARNING:
Suspicious code. resource_size is maybe missing with res

Use resource_size function on resource object instead of
explicit computation.

Generated by: scripts/coccinelle/api/resource_size.cocci

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/macintosh/macio_asic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 1943a007e2d5..260fccb3863e 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -216,9 +216,9 @@ static int macio_resource_quirks(struct device_node *np, struct resource *res,
 	/* Some older IDE resources have bogus sizes */
 	if (of_node_name_eq(np, "IDE") || of_node_name_eq(np, "ATA") ||
 	    of_node_is_type(np, "ide") || of_node_is_type(np, "ata")) {
-		if (index == 0 && (res->end - res->start) > 0xfff)
+		if (index == 0 && (resource_size(res)) > 0xfff)
 			res->end = res->start + 0xfff;
-		if (index == 1 && (res->end - res->start) > 0xff)
+		if (index == 1 && (resource_size(res)) > 0xff)
 			res->end = res->start + 0xff;
 	}
 	return 0;
-- 
2.17.1

