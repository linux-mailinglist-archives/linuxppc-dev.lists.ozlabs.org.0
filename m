Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1247258B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCGmx74pzz3bnJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 20:44:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=i19xTbCg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.130.101;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=i19xTbCg; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300101.outbound.protection.outlook.com [40.107.130.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCGm61RSBz2yw9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 20:43:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjQ/RtbYfOcU+stJlaaQzfXXEL1SeFxA3m0Ate+R7OOIHhoGPF6N4oLANIh6nkewHBaoyojdN1PVohkytgomhk5mfVrZc6WoAUrlMXicUY7eyHTF3WZStqXgog58z0U2BJzEJEiwIc9R1z7GFJCaWgpoAyo3UIG80wjf4bTnYz6ZG22hezlcC2nUgArHpKxswVJr4MZqqYpOa39vplisV9uoKRVOmqFNLo6sVLBjWVl9/72tfgST0kKW3i5epn3lI6kT5wcbsfenVJMoso8NsmxbOS04Y109VBbojbfuinTDaEOgtjKnoyCfXBxOuGG49QlXnFE+i4dVZ9AVAVphFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZv6rWuXraT/4KPE6oifLgxFcTswNiwroZQH7Zaoddo=;
 b=V34P2OmWx3Flng90mWoCHpukHr97RJinlD1nCbjqi5vszw5iE1BY/KtprisM/cympak7M57WRqI/FXarc7PveS63bQqwLBp4FkDiV43q48FqwjhghAWTSfDHeb2tnRYLO1ma68+TT+li+SrwSpQ6vRtEbI6ix1c4LdjttTM8KQQfbnzC7/sm20SNLjWuRQEOzIwlB4nPucEI6Igtjcch8nqBuYOdU+V36G+Fjn51FL1l7BJzTszLORjijuYqqi7VaVf6/wyJAnO19/RlqKWB/UuSTahD/5agcfzRLgd+ssoOTPiuEfwbBoLe2Ya6d4Ns41WmGY41kTl7ODp1s6bdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZv6rWuXraT/4KPE6oifLgxFcTswNiwroZQH7Zaoddo=;
 b=i19xTbCgINoFuGF0QPQ/sRJXIOrxmrwVpdEqmDnonOXDysIjX//TCC+wTeZUDP2uhgSHtn1IGlc+P34ndG4BS2um6HQWpYOf5FEY4fsS85UTC+mJePdcHMR/U7Pl+AtN3omMj7h6PkedXQqEs4dhz0dPrqBPpjLU0QWxhTxnxEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3050.apcprd06.prod.outlook.com (2603:1096:100:39::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:43:00 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 09:43:00 +0000
From: Qing Wang <wangqing@vivo.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arch: powerpc: add missing of_node_put before break
Date: Mon, 13 Dec 2021 01:42:52 -0800
Message-Id: <1639388572-63704-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65cc7d38-5296-42d1-45da-08d9be1cf33f
X-MS-TrafficTypeDiagnostic: SL2PR06MB3050:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB305010D17ECBA96211AE7E5DBD749@SL2PR06MB3050.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQSTfRqnvtjctO/0L6HeokhsnMZMqBL0sulvuKXMyVyPTAGWOB40GHyYVY2sf9c4uENvdqd0WlvrA0s6O44KGKso7hFe1Q90zm+8zs0p8/FXiiozok5LuiEWX7aB1OeXoaQW75DUcX131NWbAl0qfFDlkRNKcVqQ0G/Iofo9jmiApEqczgdBDZA9MYPH0IQYV/cuaZbRvG5AaAE6i0EdaBxS8MSAB9RTPAfcyCLLhssChvAojpvvE7hWzc9H/51sI8hfSjzdnEsK9mgogSwxDDOeFp99decvPRLgIwOu9TbSEf9kgzj8strOKtcc44YDcjOrgcuo4VRSCmD9yqlH4PS0E8BuJIB78zRl6MpjtSirV5aKI57MZzmxY+QZ5ucKKgWpRrLBAHfdtOTzq9mBOk5/UV5Crm0eryLVMriueniWFMbI50hmtIWYbZvDdegzCuE0dh29p5nfW8uOKjvQCy5xx5MuMj6zERn6UNkaOYjdZfdKjFhBXb0q4b6xeGLhlwB6Yw2sVmhK81HfIANTTrDH7ezJJAKv9ZpvVvxoLSeLGPk5bssY5hVx93E8sy13s29R2zGVD0vvfB7z0Z8Jq+ZXvVasertu2C1FEopP/gKfyVB6Yt4dizLg29FGOKRlai/B2Cd6QF0HbsM/CKX1w2ihjlTQBD80t0I7URFJJtGaRJZTXYGBRRX4Ah310xFLL5JexC1NmoZ2PcHKoxLwmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(83380400001)(52116002)(6506007)(110136005)(2906002)(316002)(508600001)(26005)(186003)(66946007)(36756003)(107886003)(66476007)(2616005)(66556008)(8936002)(6512007)(8676002)(4326008)(5660300002)(6486002)(38100700002)(4744005)(38350700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77UTGkerUJEbY4bkbVY+OMG7sxWxmUAEoUZYL3tWlWc94ZZeGxliDlCCRQRb?=
 =?us-ascii?Q?Z+bIOTNopXF0raXc5Wc/5QzRBgXUfMOjBgwJnAJQg0N76gQHF9Jv1zvG5fyC?=
 =?us-ascii?Q?0q86+luTHJyl+SGWMZoWiOXG7mHb4gzgb0FE70XYKmmfXWRWbEOVgo+f1aWN?=
 =?us-ascii?Q?9enr6qbwa18YHsMTqPct4yOA9B5N4v+3WZMmnPLCEHFKt7otyl0dVyoCumxc?=
 =?us-ascii?Q?cb++5y216gUb9mHoOZHHclJh1XoW7hOkR0haSJc02KBbRaGrHFked5nBd5u9?=
 =?us-ascii?Q?PXTvKBRtDBpV+5YRQQb1kiVG834Vga3IKc3Bw5spSmYfo/NBdU5OirtA2UYI?=
 =?us-ascii?Q?NPQ5Dct1IBIsvKSX/p3+Tj33LNJPDn8h07cGKxEcjaJx366gu4p8wxQCxvYQ?=
 =?us-ascii?Q?R9/wW7Rbqj4qMk1Ua/1+X6HhKlCUCqQqs+zFcGlo7/4tmYokeAmlXwO7FbVE?=
 =?us-ascii?Q?3vd/XO1ZxbfeOpGiMmND+MxuptPR0q2jMl+9uwNwkAKV1X+f7pJJEioBeze9?=
 =?us-ascii?Q?FNOkvMzjxEEpaVJ6F6qO1cGGXhKB0nBxFHGCL3S4u3vDDaipRzUa/15RSvxz?=
 =?us-ascii?Q?5YgLY3d6DBSSLcUnC7uYtNknaaX+wybAZxd+VyeuM0/6Ep7TxqOPbwKL2gRs?=
 =?us-ascii?Q?H0M6hcHtFc31Dit/i51WgFMm6U7eKl0XDw37WxtzpJrieKC3QW6ky1c6CUfg?=
 =?us-ascii?Q?+qDj4E9GMLSaJSxNHGsHDkLIqcRR4rNdPGG1TCASh45YsmO2B6PmlFfuef50?=
 =?us-ascii?Q?0q9DFbCGDgmC5GAm2BzH21QLhw6CbUyYxcTZc+EI4Py8ySAqOxgtmypBHS9g?=
 =?us-ascii?Q?rgVvHiYKm03xfSjpgziWZ+s6yoPqnmJUflKLLKGD/SpfqZ9C9Jld1lCQsJaE?=
 =?us-ascii?Q?YkbxaB/QUCCC6t4RlVvmUwZiNqpDsWKod0d2v7IskUo2hKeRFL+yMH9POSlN?=
 =?us-ascii?Q?mNzw1tX20oK/g3OnLHvryyG2Ah2+HmAM1D6wfZGPzAZBCDa+eDC/yeoCugjW?=
 =?us-ascii?Q?nu9b+Ng8wsA23OvyY1au0F1zfS+4SuUmdPWKAGqzjDGm6kx36iVEAtzpjBuX?=
 =?us-ascii?Q?JY51t3lT/9hOcyGlCo3WKIt8XMlrwCnHNGPczlYd2iWonCVBqFxBb8CEbcYd?=
 =?us-ascii?Q?YBhEV8A/DDQdf+J5UBXv5QmvC0dKt0ocLPxuo243psgF0Vru7FrNyD3LYQBU?=
 =?us-ascii?Q?oxLSUgR0Zcq4R8xNZMHsecVf5vBPGG7ia2vKpU8IW4JiKIZWgLW6gfazl8wd?=
 =?us-ascii?Q?xJkyQwsoCBcFeGI8iShH/VYdSlIRgEFhDGT0aL4ZbTKEC/wvPUs28LPDz3b0?=
 =?us-ascii?Q?VHXbNJ6dp7zdWcYClpDF6jBfEOPlodvB3MsMd0g7ncIVYO8jSJdpzNT2ia2K?=
 =?us-ascii?Q?Aal3jiyuKjEjCF3fryvLDPHXexAmvaKSrvRBuXgczTq9pakBG5ttRW9TjCRt?=
 =?us-ascii?Q?8Ei18JXl3k6gxXC7+cvYUuIgWQEJFLZmxbbefauR5T9AKJvw+0oUs9FtOBsW?=
 =?us-ascii?Q?Qi/UnFgA7Z0vcph+EmUb1MrddLV8JAGSW753rVHStjtlPsJi+zRO5i9DY2lu?=
 =?us-ascii?Q?dcoeT3P+LVoI9aXXnfwrRHIcNMGj9bJrFeUrPxDknnPoUScGe5Fv576MQYoM?=
 =?us-ascii?Q?y0Hu8xusqQJeWQ8odYWg5RY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cc7d38-5296-42d1-45da-08d9be1cf33f
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:43:00.2105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FJi9MFKtRFhM+sv1NlM/mCMVxg2hw9WOAvei4I5dNri9sEJLJs+/KlKL2JXatiEgB/JU8VeBfYxEnyumbrQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3050
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Qing <wangqing@vivo.com>

Fix following coccicheck warning:
WARNING: Function "for_each_node_by_name" 
should have of_node_put() before return.

Early exits from for_each_node_by_name should decrement the
node reference counter.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/powerpc/platforms/powermac/smp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 3256a31..c9a044a
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -598,8 +598,10 @@ static void __init smp_core99_setup_i2c_hwsync(int ncpus)
 			name = "Pulsar";
 			break;
 		}
-		if (pmac_tb_freeze != NULL)
+		if (pmac_tb_freeze != NULL) {
+			of_node_put(cc);
 			break;
+		}
 	}
 	if (pmac_tb_freeze != NULL) {
 		/* Open i2c bus for synchronous access */
-- 
2.7.4

