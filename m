Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0550D0C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 11:26:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmN7T3sXQz3bfh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 19:26:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=R8OyXbN8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feab::71f;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=R8OyXbN8; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmN6h4mS1z2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 19:25:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFmjDSvasYP9B4fmSnQCIiRnb08W9+11GwlIzkUG6+eDyQX8C5ed3lMeDG3eq4JbDAWhPik5qPZ1j/ujggosfHeymvRJZH+BBxbfQQ7cIUuqQqFm1hAqwXFo2kclKijmiVgpSi67d67ZxTdFOZtSQ84UFwO4Iws4z+lGu+mHkKRGuEdWRZQSO9EKR16GnCRzAyZ/B7Opw8PZy4DQ1oFkb2pnhsB/lL86WsnEOnQ7P5gFfbH+vWelwNyC4hP9QNfge0mRflO/5pIEwCbe2OfaWmNaFS+SguhGvD1FCFNAckfAQ2IL/hY5nWWa/UIHFLY1arvhuphIh3UpRC8zePikpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQOUK/Ne0UkX/FzbxTbNENOBpVva+p93KRg87jkCfIo=;
 b=BceeF8Pwh7j4B21RYrlw8FpxoriOcSLDVQ8lz+MRuNFeutUqZgWogeNjEk3I9/ifs3Kg0UwJlztSdhuTdDmiB0Zbu7KXuzNaif4Vh2L05G11nClajVScM5qjoyVfgl7rolMyzS+aLzl3mIZUL7MvKLDKuUY2J0Ylkl+saCnU/B6/DLVb44ht8nzRKV+0grzEuLdMvlTxxOW/YGlyXqwVIpGjgYCk/yI5WfA81xe3LqO8IgDrTIYOAPNM4frdReNOTZ3fbiaHe35SADYi4qXIK3xGfOyFUgD0AmHOYpFRvklb8iUw/oYS6/xBAVMjie2rBFd5CytaxkVveZjecAHOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQOUK/Ne0UkX/FzbxTbNENOBpVva+p93KRg87jkCfIo=;
 b=R8OyXbN8aPwws1aVF8qSBxHAM3v16R8V+46CVmCBv4m5awxEqqzwVuPBStKFii6DfYrx1pmSdyWH22m4kndUjEI9Ts6ZdMNRKlAzgE/r1Nu+Y2stfmvbfj37S6a6mrb2c9f6/y2EWIt1BguPm8WmW0D+8pEPhW/wEDLRoTwR4YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SL2PR06MB3241.apcprd06.prod.outlook.com (2603:1096:100:3d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Sun, 24 Apr 2022 09:25:24 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.019; Sun, 24 Apr 2022
 09:25:23 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] tty/hvc_opal: simplify if-if to if-else
Date: Sun, 24 Apr 2022 17:25:11 +0800
Message-Id: <20220424092511.100309-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab21901b-caaa-48d7-babe-08da25d45be6
X-MS-TrafficTypeDiagnostic: SL2PR06MB3241:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB32414653CFAB0F6E30519420ABF99@SL2PR06MB3241.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UeiPmwfQwNM1LsHmOMDSRBEQE5vH4XFAFDgyntyRrx3T2WMcZcGKEXXiIiPyUukFMgZeHawu51I1DklV4j6o68WyVfv1epzUS5ldXRH51hs7nKQ+sLbtVOJ7Yy+gFkckjGqWiG+6VTVWOoHyo6RQW5JJWwkQl/JXG844UvZGgys8wC6gCrmjqMlGaj2zkE0a/kh9b8RArKFiTy2bVUnzw2xH5gXBvSV1D2vNJvvoMG9eKBI92VQsZmsXgd+Y3kJyYkB/TnLQQoPwNXAPEAanpwMlvQPmisEtbK1gElfy8Id1nlcsLbemXqyOo0mwmqpUbAHO35k0MRhn5bAIUTnjjxUhnVwU8Jc/dnqZfHN2/lAxaVkU7IafYcbHtuAUZlz+EVZUYh34c3Lg/79WkWg9753K7ttxKMxApWxXWiUAuJ3mEz8+uVenSp0/Nlrre8vlrXPlmWQp9vbsL4wXksjGNXe5jiAaRx52YA/KsyWyhAHLyczExSql5QvK1Tmemre60Dtb2wYOkBFvkVhcYhG9qg3uYuKfYvgrjojg9jDe5eysM0LVlbcEv+MDtUP4QsADGffOFdy0V3DDKs4jbqRh8rKhEdB8I7GGfCgYoIi3pC1qd/WP7E35ctmgMQYCMP7zkYOwPD0PNVLc6SHo82r1b8+bKwsvu3TmkHGjtOzZbEUouZezHLDK2QkJbaeW6n9LjSRKrHaxjWTb/uwC7CD1Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(1076003)(8936002)(86362001)(5660300002)(66946007)(66556008)(66476007)(38350700002)(38100700002)(6512007)(26005)(6666004)(6506007)(4326008)(8676002)(2616005)(52116002)(2906002)(107886003)(186003)(316002)(83380400001)(6486002)(508600001)(110136005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJURF6oGKcGyNIBd/QwA7BbNUj4y7PrRrfFgKGg1rERj1bIm1VKjPbx6g5Jx?=
 =?us-ascii?Q?xqvSf/9Pjeuml8nuOh8f2U4EbgkbJrby0SiivcvIj8z6HwLnfXSZQH6k4NM4?=
 =?us-ascii?Q?RLDUvXvwE0qFOjyiNJ6rhr4WxK2VZNmCJXHdFCXtfKEG8UtDb+onV4b0oTur?=
 =?us-ascii?Q?idRngf5A0M6bQqnxptnpYB2XK8bQ5Vu31LawUcK2vp0q++6VfK0vv2bCscAG?=
 =?us-ascii?Q?s7wCuvhMHoKzqkWtpKNhra809+3CbKrwgtYZRkNexCMI+9Ikb5pCxOcIb2Rs?=
 =?us-ascii?Q?cZphvVou1frj5hiPbSpR53I4wBXH0ypZpfdXolrwBPx433SbqdJGZBFj21iA?=
 =?us-ascii?Q?Rv2XmqE0OTIfvM5DeaPJ6rX8JkHvyaRMUllpbZsdRZW/avBCJF1vQXlS3h1C?=
 =?us-ascii?Q?WxR3waU51pOj+0xaxieuV2tRb3P6EneJlhDTbYXeKpELCwlgwu9UkvnFC4fr?=
 =?us-ascii?Q?J5cSDoZZCD7eohss2kStnGUkQl8rPBcMkQyVLDUtL3XTWQdm/OP9JdvyNCxo?=
 =?us-ascii?Q?o1P6Dt/Xwax/GdH4tgGq/m67MxRCYYPdeiCsqC+8h4I7ADTAPfU0MHr7BZtC?=
 =?us-ascii?Q?QEMlFJRAIyNsURLsx6WEcJyEXI6X18cVvYrxRUYZmt1SHjbWYbeA2Bz6C763?=
 =?us-ascii?Q?cTZC9ZV2zt0cI33W4p3XmNn3ZlM3pBT6A+T+qdsD0UtDB3x+hhzCZ0lkKVKH?=
 =?us-ascii?Q?UOaH5vMF3g27YrryPGtxtCWgPpWZ/vSvboR1U35MY0ZRFu77P7AHBYOcfas5?=
 =?us-ascii?Q?+AqMBbbGLpcyMpYEk62IGzk96bfSBaij8OycycBqcEe6RZII2aIXadIp7YTV?=
 =?us-ascii?Q?m3mB9hRbjlaDZl350wRBIUn0Mj2n3uStYGD37RSJW7EA5HyFGO/wm08O5U5f?=
 =?us-ascii?Q?MF0XNOU0F8H00CnpG5GgQgB5lqpdnwn9TCJm3iRTGv8aomXDkihy84/GDLeY?=
 =?us-ascii?Q?jjPF5iwzcmrOARf8xTyQes3lzPHSYs1iXhTWd5ajbcN7uyasLTGIRJdJylX5?=
 =?us-ascii?Q?9Ad8j0lr2OvkX1+kK1t9LELUN0oQrSuLJVvXa5C2Yggr0y8Oi7lNKKnd+5Ut?=
 =?us-ascii?Q?7BwBIo6Osnhw4SH6C9eaZSfjFTi5Vt66AC/yWHJXpIA9C+MyKSLFiYM+p+iK?=
 =?us-ascii?Q?p6KuVamIRBJrOyW5rkSes/TjfnR0/VNfj7cTAh/2snIa0zowntvvNOIGpU0Z?=
 =?us-ascii?Q?3f1t+dmNlKt8abn3ubE+bKyQ9sklHZ3rqe5LQTLvTYgwHmDD4rDqdecUIt9I?=
 =?us-ascii?Q?FRsxYb9b9cVBHh5D9aikQVDtycaTkb+mIyqbKbpb8TaCKIOui6XUfqz8wqpy?=
 =?us-ascii?Q?DslqdPpj4RJ8eQk7gH/EC6vsz3iQPq37kODGg05e7ICMo8UM1EenMnlM1WZ2?=
 =?us-ascii?Q?vw5v9Pfes83Wqm17klOQlHvHDysEYlHoz74j1YdUUfNQMTL9VzmjTpQyq1PF?=
 =?us-ascii?Q?4dNSEjDL+PQdQsS1OWuqZHTZGMJS+cf4xMYa/iiNptC5cSknF4SrR8s5YtLp?=
 =?us-ascii?Q?99k0HpikglCu8+xW++uu9gtjQwCY6cY0LDD59JOXqv06VSlSM1AmZb0rPzmz?=
 =?us-ascii?Q?RLLV/noYV5Oi9NykmNew1yr7AHvcse0ieo73RcovI8Cb8z2QKwkqWwXkrbox?=
 =?us-ascii?Q?lXqRs4GonQqJVisaElGcHhJutRWARqFwAiLE9dGxXMoKlED0qSTSsBWp4t16?=
 =?us-ascii?Q?ryFssWNvdVyz0vYQhPSDm5FggdnQ4qwQfQSrteAiFxOiDLReGFsSg00FA4wi?=
 =?us-ascii?Q?YNtfP6/Dlw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab21901b-caaa-48d7-babe-08da25d45be6
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 09:25:23.3832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ci+v+N9GnV293YxITS1+bO6ZsQpsjmgNQtCG0CMFpDJ7XJBEM+y6Rlwuwfe0ZyqfNtTxpTUgVSmOCOz2E4Pzyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3241
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use if and else instead of if(A) and if (!A).

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/tty/hvc/hvc_opal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 84776bc641e6..2dafa0964c2a 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -344,14 +344,15 @@ void __init hvc_opal_init_early(void)
 		opal = of_find_node_by_path("/ibm,opal/consoles");
 		if (opal)
 			pr_devel("hvc_opal: Found consoles in new location\n");
-		if (!opal) {
+		else {
 			opal = of_find_node_by_path("/ibm,opal");
 			if (opal)
 				pr_devel("hvc_opal: "
 					 "Found consoles in old location\n");
+			else
+				return;
 		}
-		if (!opal)
-			return;
+
 		for_each_child_of_node(opal, np) {
 			if (of_node_name_eq(np, "serial")) {
 				stdout_node = np;
-- 
2.35.1

