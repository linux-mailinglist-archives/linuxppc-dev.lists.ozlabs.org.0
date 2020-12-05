Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F962CFE66
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 20:32:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpKTY3t15zDqSY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 06:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prevas.dk (client-ip=40.107.22.132;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=HT8ffAt3; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2132.outbound.protection.outlook.com [40.107.22.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpK9j0bYgzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 06:18:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVg/OPtMnqDfTgwEVDTlvHAgaV0ZAFDJNL/wDn4ttVBp1OzPwZzIC2JrR66KwqQEvjx88Sfjvzd6oSpmw78JAJwKHYJHDXSBBxi3kxlZr5TTA+AqPQjN2YP+MiQnPVHuRt3QjB8/Q8i2nMOo8itcyWmK2nx/U385Nljr6HZbValMq7nUclhRNop0CzOukYNjoKjz1CxD44Dxv6oZoMRZV23FSkXIxDlJqAQgBP7qwje8DW2S63cXtacflGfz5sQ324TuCLjheHI8IIVlt/u1pekj/DRjXwMxAhjLCHDaZsU/BN7agXRwe6jAulSa/6gSgHj+OOvXuBuuI9y426ml2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD3p33cq2Q/qHWFYl7dyPaDVPwth76FWgEjkXuOOk2k=;
 b=E6kz3Zy19HuMOsUbCNhiJ94nLWtt8RdLdFSZrJCv0WteqWeKO1nelDaL1gFm8TItmPKeNVfWIz2jKJ32P62HG88ey/yfTpImvQe/Minp1+j4gMwa9rVfIPyH4/qU1999fgHyGMTynm4dgFZiuQqJbDYJZu39iLhv+oRowMsUtsF0LbarEeJmUFwDj+51esMHLgzKqvH7+rbT4Z5EUZ9xZiJI81R24bu+jTKrG/UMkvGt25Os6qPNZiJeepi91tqhC+koZQnYsiHDUNoL6Yy8KrLRzogfmIEKbcvfBE8p5SI3G8f00sCAuzJv7axNx8sTq4seMAZTyIXra0cdDGD5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD3p33cq2Q/qHWFYl7dyPaDVPwth76FWgEjkXuOOk2k=;
 b=HT8ffAt3Ay12LAz0u4GGleeMOyEmplnHZocGeL+7m6hRs5uF8mhFPpSnCN0yiPXQJN31VrVgEeWJ/xXcck9WJbZYG/nZf5/iFr+ec+UPHQgsHfP+cXHLo+FklsZVYU1jDhkkiJ5jgHpW5KBDxl4624sfhFN54ylWs3MjDY4G11g=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Sat, 5 Dec
 2020 19:18:21 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 19:18:21 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 05/20] soc: fsl: qe: store muram_vbase as a void pointer
 instead of u8
Date: Sat,  5 Dec 2020 20:17:28 +0100
Message-Id: <20201205191744.7847-6-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5PR0701CA0063.eurprd07.prod.outlook.com
 (2603:10a6:203:2::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by
 AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Sat, 5 Dec 2020 19:18:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1121de58-b2c9-4ddf-8a30-08d89952875e
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1363816BE7591AB0F4519DCF93F00@AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7S+yvHFOXe8CLDzlH1DjO5GCwol/bLOxJqOPDeEV0FCZJdd2GsGFtH5EuAY8eqqqX2D5THRXVGGFycwTbrj+ZUpg7vM5FImB3b8HGL6VIakl9QTetDlSD48IjFTLAUTuI5XtEGaKZv82ACqQwGpzc6gWthvdoLRz6F+A4T5pGSoPvOYiDos3Wnz62YqnZWIDwbxXMa2mNsitBD4Y/IV1zPd8bH9UQ8+2SRuSDRLS74WeQApeDW8hCPg7COdSnJYcCVDdxGO2kBtomg+39262vYLQnNXzRjIKkda1aW7M6nrmmDFEYbFdj9WM/GUQvTkvzONdtgTRkvU2gHeqGCQKnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(346002)(136003)(366004)(376002)(2616005)(2906002)(8676002)(8936002)(83380400001)(52116002)(36756003)(66476007)(66946007)(66556008)(4326008)(8976002)(5660300002)(1076003)(6486002)(44832011)(6512007)(186003)(26005)(110136005)(316002)(86362001)(478600001)(16526019)(54906003)(956004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FQ4P38eHL60L3b62IsOr2JpT1fMjnyvNBjzKSa2CObinkIywVXPJaGI7+5ry?=
 =?us-ascii?Q?gkNjkxPxyQlUFzRF/PZiKsiAoC5IMf8bC4DW2QaCrB6JuWnfcBzPnZ2T4pXY?=
 =?us-ascii?Q?DWaDjFSE+n1KxmmkgAeCK4Xape4zZU2n5ahjWeTHLpcQJggxvGK+luQuFzVY?=
 =?us-ascii?Q?0+IKz8u0HFF3GSpwQKYTgYmsGpRL/4Ww6B+Vzl6OO2n26mt/w4Xr694nGc4c?=
 =?us-ascii?Q?BxKLGmkyIsa3NgO8529GpOG3SzgJkgCH/RpdeSJcnj4iX9wdS4FMoeLd/qNF?=
 =?us-ascii?Q?sDocRId8gId1lVc46g5xlfVp2FGD8EWHtF2X6EJ4UBPVbJYyrDsmmoi5bN9a?=
 =?us-ascii?Q?EMiOwjRavSCJzgzTD+F+V+5/7oKBmnKm2TUjz+EhuE3mgu1huIO1KI2jFA+e?=
 =?us-ascii?Q?hRJzJ+D73JgIfRLVRORbiC2YgmB+4jzJ9iXu7q0olwSu9pcEIAGVgzgI/euD?=
 =?us-ascii?Q?jfp1Pb/jicI/ATZGYUGmFiUgFcLnp7QgHfQDDC+6KmJrRQnQacknJws9sVsN?=
 =?us-ascii?Q?mlV22NUoR/j1FKhEdF/k6lq4YeekMOqus/vAsN78HIcA36ywwRhwsUAsUEK5?=
 =?us-ascii?Q?atHvC2j7JNz6Pvwx/1kNYVEReJPbobzBHUgjN/i5MaoYcrNxKepSqxhE4Yod?=
 =?us-ascii?Q?zLyY6YL81AhkWuXXGWmHR8CU3nnP2URqdGsIjYnFmelA0cxvpbDBSPqoP0Ge?=
 =?us-ascii?Q?vzU0+BO0NV6LRuTSViMR9WKq6dkuSd/89HGHS7RUDzrrCmkMFCfhNXDttu1N?=
 =?us-ascii?Q?D/uIpwEqO4VktfM4VTdIyhBqIDLOuIEVgDzRogQL1J2CBxPThjxGiGtkA0+L?=
 =?us-ascii?Q?Q6CMf8yDbbz9vFUCChnsV9gMwanHack9kndNUriHll1fU1hkCAIsieCNZyo2?=
 =?us-ascii?Q?72JdkVzHAc1zUYxkr22HMItfgZQfnbYYuRUm9A4/H3uwFAuCU4FXl3q4PtO1?=
 =?us-ascii?Q?u/kaxBTk3q2UuyVSvUiHdYKSGwp6AUH9X3yz9+sZXnXedx5WvbPPlkRdwdzF?=
 =?us-ascii?Q?4i9K?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121de58-b2c9-4ddf-8a30-08d89952875e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 19:18:21.1882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka26JN6H28u3Vkn41HV63GNA0YjSP3uoijgPSUNjHFugy+4cOyVStpdWP0qLE+sqtqd/liTtGnAp4gyMq+gv89b8cIfVhBZmZZ4AJHvFKOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1363
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The two functions cpm_muram_offset() and cpm_muram_dma() both need a
cast currently, one casts muram_vbase to do the pointer arithmetic on
void pointers, the other casts the the passed-in address u8*.

It's simpler and more consistent to just always use void* and drop all
the casting.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 0fbdc965c4cb..303cc2f5eb4a 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -27,7 +27,7 @@
 
 static struct gen_pool *muram_pool;
 static spinlock_t cpm_muram_lock;
-static u8 __iomem *muram_vbase;
+static void __iomem *muram_vbase;
 static phys_addr_t muram_pbase;
 
 struct muram_block {
@@ -225,7 +225,7 @@ EXPORT_SYMBOL(cpm_muram_addr);
 
 unsigned long cpm_muram_offset(const void __iomem *addr)
 {
-	return addr - (void __iomem *)muram_vbase;
+	return addr - muram_vbase;
 }
 EXPORT_SYMBOL(cpm_muram_offset);
 
@@ -235,6 +235,6 @@ EXPORT_SYMBOL(cpm_muram_offset);
  */
 dma_addr_t cpm_muram_dma(void __iomem *addr)
 {
-	return muram_pbase + ((u8 __iomem *)addr - muram_vbase);
+	return muram_pbase + (addr - muram_vbase);
 }
 EXPORT_SYMBOL(cpm_muram_dma);
-- 
2.23.0

