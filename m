Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A91546550
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJLx6DTjz3dyL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=jpyPPLUY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feae::803; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=jpyPPLUY;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn20803.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::803])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJgNM2BHHz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 20:30:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7MQOIQus5cdtYuPb60iMT4vVcrGlFPn5mEOrARx13s9LEWg4AYoXo0ZPHjdoMeuX2EwQ5ptuXrKZJY9q2Ww+jUhPp96OcWTRQ2vHm7+tdEKislGNrmzUda9u1qy5ijpd6BsPVW/q5lo8euaOXb+BppqV8kn2ZGTltsQFL5vNoPtJoObnLi54uENQ//RHTnnXmJvxFPCb1OLE9HcNbnPiCh4CUGYGpOM0kGScybJGiKa5hDczPjlLz7C077qkGcwFHrVjZ+nmy7ySgWgYH6uhvONR+IvmCFtXxid6yHxEM867CYS1maXV9Hpr37vULV5fW/t2aFjxng3WruczA80TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YccEbO+J+EsVaxPpodCdzpuJD6ioqIE9g2SGziuKwQA=;
 b=h+ECTw61FW8duK983n41ezBOoet9URFTXb4Bv4KzmpT1Dn5LEPHOPCMjk2LR4VANmrpoIhX3axxrgi3h2wWXONf3tgTjFbEgNgVVcm+b4O0awd2oSZuc4pvEbOoYaBN0iLxldM+FGiiornMhwYUt4xT3O9kwK8vYAkuAWOO07oZW4b6myODgPqTCqmEIXrD0cSt+/LaPY7whs7MstgwU2qRYbB3jnsjMMhPS+CvfJD429SMfg6qQba21anVCYRwjG2ttBI3ZeoB4+5l9c16WQYudoftd469ihsNNwqy4eQklTNH1ZVl2PsvBcEY/nXOEZItxgqhagIEFGZgqEbNybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YccEbO+J+EsVaxPpodCdzpuJD6ioqIE9g2SGziuKwQA=;
 b=jpyPPLUYSYeqRog4n54Ox8AFhkRtjtAxxDt73zyLj6bCT6eFjp1EhWQ42M8BdVB+QhRv2iNXxggzUlUHWEWFQ2jVIQ9+SUHTjpDYNkDAMi5hZwOS3F+Z+NhScP5zNAZLU1svlFew49GpGjOmU+DgbH1I/RxMvPrR83rX6o/sU94AM98OM7p/w/H3GbZ9ZruEYdOBzLIXVLYd8CrY6lPO9heWdjNJ0vd47byWUxy1dG7hUdG0Ymc59KL3o6nunaDpI4ZoDhYdIBdOrk5lAjS/E+blxxpUYdCkeHX7faLd70RwgORFx8ujwpNYKSOTCUqLeoHZ8Qtj+wzjq8+o4aRn9w==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by TY2PR0101MB2607.apcprd01.prod.exchangelabs.com
 (2603:1096:404:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:30:25 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:30:24 +0000
From: Wang Wenhu <wenhu.wang@hotmail.com>
To: gregkh@linuxfoundation.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH 1/2] powerpc:mm: export symbol ioremap_coherent
Date: Thu,  9 Jun 2022 03:28:54 -0700
Message-ID:  <SG2PR01MB2951EBFD4C4EB2A2519FF4199FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609102855.272270-1-wenhu.wang@hotmail.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [pX7jNpbj5Y3eeSMaaFj/jBOIU876NDQR]
X-ClientProxiedBy: OS3PR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:604:db::12) To SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15)
X-Microsoft-Original-Message-ID:  <20220609102855.272270-2-wenhu.wang@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3767a3a6-8ef1-42b9-61f7-08da4a031020
X-MS-Exchange-SLBlob-MailProps: 	1y/rb3p5sI5XrCbyF3D9QHqr7oaVHdWwWM695qwZA9aBHeqZivW8mBuLanMLEjNgtrbfRk3uFiUkZefB/MgHj5JPPmzqm/u93+tJYKMacFTeMBgwuP3/ossJnz4aqDZ551oNlClSIVx0bMSjA2wv69v3FXcbiebWdBv6K6dq7K+33fJnjf9imXIkgpnDOu/HBJKPXKTPODq4R+ImD7O8JShZn7DLFdsBlw//1/PWS+6IsWYoLJI8KwYLoTBhbLeF+J9zUoGbb9A0DzbGR+/ylTQyIZfeWIreNejXBp25p7D12kDfu3KqniRnJ0mXMtJRlyFnPTAj3gPw4aktD0eBXHSCxpGk+rj1GK4ZDgXKUY7sCtkfFdozBCb7W0B1QtdcVxv+RX+atxPXmVeXPVe9mQNXmQOzua+0z+PYc6VWjQmpTSZVUL1sIpcpVBZ5FiL8RJzIlzcMd/2PRKPV3SFx0V4EeZsG/dv+iLiwpZlCINzfuB2qYZdLzPZIhl/SSISfLIZBVXRKyYBu/jaj2EzDprEmZ0K6HBXNlcTxopQdM3xDua7qKh7m/OmYFLUoJelIHbDx56NKAH3yP3riiFvn6XQp1xDYAD3ZRg7W5czkKQwKx2RC6vE97JkiP1LHkTILm9Fy2K8t7mJHhlRx1T7f0PwmcHr3/uAR7E/KbyWHUtUbQzcfsT9rOcZpcM9Ug2v5XnIdRx/06PRJMke3xyGPPm7JxPZFOLCtE1Cl8c8U4PQ=
X-MS-TrafficTypeDiagnostic: TY2PR0101MB2607:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XhXHhiQVLZkSxH6YNGgdOIiJWdPTYBRFyfOMCuO3BWm/HVovpnWZR0/2i5guC1xP+10nerWO2rtviUkRvHeBbNqg5h9tBsazQgbqAaRUSvtYrqTlJfWXGqM3l6xBSt2mUljamhffTp8LdDeP5BhcG8MPkLaMQfWoNUKuHGUEhRpjwmvSfdUQDWnHRMHXcGntl9Rq6b6hHynlVwRAF+ItO4LFW2mmOuTkYaj99XZbK8wzWPf2Q4p4XwMywdTowE7XU0VwuN37yo5VJYu8kiVAeoQqt+cD26ek25Ldmp4DW/rTm38MOhbNo2ufcvD6uoIaX9yvmbCbFkOPiVd5WF1rumbwqxOa+q/Yj2FwmkOpnBwR7j9OJvEzlYngh7QnXsGn4C3PG95UKYru7RhHo3LHkoIsulmfV4FPy4ZgENUxlMomrLhl4bmJyIIvIEh030caiSrsI9GfRreQD7WabmpY2d5RnNcHSz1+SDfwxNkFQp/LFms0aBtDAY6LIHKCSyacwMerpsoc52kSKPbvMZD7RhCC+QoDoNeufyrsV07MJv07PZC3u9FLC2nIj+Dz3wVn0/rqzOz8YqGhbaXybX7icw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wgHyYe1m4cw+nW1AQFDNCsGLUQ99qrEXk13VVPl06fN391+LFhJLc6PyT2/p?=
 =?us-ascii?Q?6RYKmzcjV7BLcuXc9ZL88n6XpHTsnB1EY17tzWb3HRXSe2hlWS/T2VTSh3pn?=
 =?us-ascii?Q?s7XTMvXoDKwhuORwePTYG5kZ2xI0BO9UUklHVFf1xad4J+VFzcA0utdd1P1m?=
 =?us-ascii?Q?vR0i4pe8mQrHR+F/mhR/sVR5VbHyJ6Pq6JgUVUjWT7ikS6blmF+2XeMjWFNw?=
 =?us-ascii?Q?bgaiZuc4fO6ndLjHuoacKX4adgKcPFZxDrK2RSa8XWo7oN9ZNXWSkC58LxWy?=
 =?us-ascii?Q?gg7ieGFmm6XlAEapfhMl/c36Dfvu2JxJj7n8Wj8VPE6h55DrWLdMwWkod0MF?=
 =?us-ascii?Q?MDIOkoIDA79VHxg2GZUUm/Ygau+V++QyOU03EnsCp/1j9QEeigc3f+XzbjoQ?=
 =?us-ascii?Q?yodoNne+i1zazbiIQHh6xTQOCoYnnThGnCNI3OACVSwDvypkkJbUOEK0F4tm?=
 =?us-ascii?Q?KqnyUDTNU8ivZVxaT3t6mTojZWoo24g+67G8Q7K9RqAgyp2kR43x30Oxhvw5?=
 =?us-ascii?Q?KcSmQLzIlHQbtZuyuELj6V0iFzEUKpesj1LPrnrtii6JB/ATya7qrBmcCra5?=
 =?us-ascii?Q?tQzxtE9jzaotmIslpjmBQ0h9aJcnPKJ2IYwZ8wVbOB7e4nrJZwiUI7JcQwiF?=
 =?us-ascii?Q?a0WBYOO+GTf7mwq/4NRU77VV0vicPq8TmF5MuxjyHByGeOgGNOFermVGewLh?=
 =?us-ascii?Q?93LtTHjNyl58ZongU2luKMW2rVaMPxZvYkKPWdsoXy3yJ7HwXhhnRpX6RToC?=
 =?us-ascii?Q?trI8hmfLNNU4QAVitwI4vI1BHMx63FO/c48Ng6yOaW53aMC5y1ox/Z9US7zT?=
 =?us-ascii?Q?dIgnT3ELNRq5mV5zZv/bV/RHLOCsDCqFWC2kyELl+iCeqPnpPs+g+QfxoC9D?=
 =?us-ascii?Q?xYO2GWe+OkY44JSvLJhwlYnUQX319Qh1YFm4bHC5Eezs9ByOmhUOOzxso8g3?=
 =?us-ascii?Q?FRoOGhxTh33lja6OaCjq78gbJNNLzSGNOVBytFIj5dFeOANK2Ych8WPBkoHA?=
 =?us-ascii?Q?CAO1P61hb/ogVs+sv2VRie6SVnR+bJhZdBo1A3+AzkmIJ5tcGmXad3ZK4m9X?=
 =?us-ascii?Q?eWQ88iH665PQaQfBvwDyqYUfH5wtxGL518jlPakEnhG4ER1Qf1HWoOejMIo6?=
 =?us-ascii?Q?9IV6GKQ5lT/JARtjpOeQKijHStohhKX0YvSDWfMhUYrZ2WpGK5kpd/ozTlpD?=
 =?us-ascii?Q?UwZ3vzF3NDUGiYJ/npxpiAB4sGN3+1gCRJw+d/DG0hql9XrBgDWNaK2fVc4A?=
 =?us-ascii?Q?HlxZD+JZ45haDwMVCZ4g/ik9cvFQ1aoq3Fq0ekosRRw6k9oatowlWPOP6Jia?=
 =?us-ascii?Q?w5W9sbHTlEaj6qMYITYwWw8TWMqoXTyb79fZnhbcK6lfzddoS7LtgOO6+Eem?=
 =?us-ascii?Q?2Ig+cLhEjvxeun98Sm0rtHryGJ2q1Og3PAtP4WRG/tyyGWVqxClmH3NlXZLs?=
 =?us-ascii?Q?pjCl7+aR6Xk=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3767a3a6-8ef1-42b9-61f7-08da4a031020
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:30:24.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR0101MB2607
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wang Wenhu <wenhu.wang@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function ioremap_coherent may be called by modules such as
fsl_85xx_cache_sram. So export it for access in other modules.

Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
---
 arch/powerpc/mm/ioremap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 4f12504fb405..08a00dacef0b 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -40,6 +40,7 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
+EXPORT_SYMBOL(ioremap_coherent);
 
 void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
 {
-- 
2.25.1

