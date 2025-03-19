Return-Path: <linuxppc-dev+bounces-7207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF30A68867
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHkLB1Yczz2yrf;
	Wed, 19 Mar 2025 20:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742377426;
	cv=pass; b=O1XgTbCuMLUNOIXV+rnyQtzULqIvQGduhMSiNEPGnGGLGedd2yIB8dA2x+7NOh5A0oKJrsCSvo8yescHWUyl0r26scTga+EOO637WLPjYd6eRKGirnhRD8rm01u6j70Gob7vuP5PrZbuTyuZgy0PMN0Qpq012yKPSE95Ls8sJ4isZUWFroX/ZOOlsLn2tlHmct5NlgF7/NEmkeAXDCGNecS19B+mcNUJH0ssKrm5N4jX7Wdg/HzOcj3BZd8fKejuocI4vDYMkEEd608RaIgmZ+KtT+HGe3HjSwrFIX2LEYl/rqmCQhJm2q/iqlvzkN2j2LBbMkKpVYPr2Iyit2B9cg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742377426; c=relaxed/relaxed;
	bh=8iXvJxYHMUK+Hqhych2W+aHhBLSkpXacPXnXrkI15wM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kvbgI6/vYFS9YYhJYofee51q9bBWksjYMRUbrbl/E4FYrmdjX3ELhrAoOJIMv4rc+a4qq6UqJEOiDzqtcSQ06G7eo29I1iDCyX07q5cb72lxPVjwCe9xknQextE0+moNcxqTsaBHVdG7Nsx3MFDOyK4TCZhu/zT24eioxoYN0DnJj3zqOZEKs5Frdx65rz5ux44cp0lqj7CTcX5ZrhM9FAxZq0I4iL5c382eSvnmvZveqd1LoqtLQdIgPd99qIhvINrMSg6lHgHcp6z9XCDOAbQp7B0M+zMlOoxRH/5s+MPgGL50c3IrwsF5lrSv3W88sq+CDNI5JqMTR8Omygxbwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XV9Lzvb+; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::61b; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XV9Lzvb+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::61b; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHkL86N1Qz2yrd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:43:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9GgFCCkRrUkLo7GsHthtJ473TPhyL3/xp5yuJK0zT3+GnOOb/sYqhEtBLDxwIfZJKH4RI0vpPEAht3mZpbWbWPwroniNe4OpPUPk/hp2akRz6DmLqvjneYKA4ryPNMFNz33okXaiLs+eH2PVlQ/gjG+12DEn+mYTIpu/HgZ1LhGz4InyQ6XAzo8tOfuUY0EN7UF3TudT0zyEr3ddBrs2YznScxL9UnekCa/diRzjUJDhiSTuGOUkpZUFmBuzqRTpge4bKAw4b4fSrk29praGHQB7p3y8LnAI8IEXsWzjaPMXVJiUNLEOMIh2xZ9pCzKhjL8QggDEjTKTke1k6y0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iXvJxYHMUK+Hqhych2W+aHhBLSkpXacPXnXrkI15wM=;
 b=ytucnN/EWDYYjxzS+jQ2mgEoZ06oiHnIu9wLhS7OUgpTq+t+ByuXJua07wEFN3IVsft0olpcFz4Q0GTW9UKfv9FYyXbh8uRMFedWiLD4SpARc3IbNIdXx67e/xo5lQVHWEUUwmZzz1QqQZzgNGig3XYtYiYi1lSaIa35Xn2Y5WTBSqpvMi89swV/717/kW22uZOKBadB3H5PTGtzTN79jLPnLEGw6yBBkhgpAaXUv1ZgUpMOnrgflWC6i+NuYLOd4alnQmcrdd6MIuy+DSv13l/b/l4P4yDaxKzO6rD2w+vLwoYZqJgZeiivJGO5wQo7OC8xWspseomXcFbWoUiSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iXvJxYHMUK+Hqhych2W+aHhBLSkpXacPXnXrkI15wM=;
 b=XV9Lzvb+rH278joyQvLSZGF3d6LjobotXoeR0PzuQTs0cFNM9XHzLnMgk2bpOX/VCwylJrH7xqExAo0MGFwDDmCFO3mSBs1zZSFP7bUlOqixJmm0PKvGRR7zzVXRB6XEGfCBdsOBup9a0kvPriI6qn2zRluekjQDyepnN2Kz8VBMQ69uykvj00cHQDkCteEoO0pUvy2XDHUv2CgeDns2hsyHZ/fOxDSsP2lAdXagI8HgcF16aeXOoICZSFrzI4vjmxypQ38c9/yALEQKqb4eQCJUPwdt3rhxgtSpaAdWeI36MIOoVjYnzDey+ZiHHODnD4ecOfbh88QSAzjN4Jdtpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:43:25 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 09:43:25 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] MAINTAINERS: updates for the fsl-mc bus entry
Date: Wed, 19 Mar 2025 11:43:08 +0200
Message-Id: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::26)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d5bcd3-6e23-444e-7c8d-08dd66ca7e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vr+I8VVKyhclFWaMRQvLzgH3xg1eiO4l7jdGaV2evgxZrAmcWy9oODj0YCRR?=
 =?us-ascii?Q?Uhq1NsMG/XEnaTE5o7VkTnXN/62Zhj9gHSY4cYOkp7E8ZnTni2MXxwqBTi3K?=
 =?us-ascii?Q?FtxT2awLfh6lr0hJ+mluV/QRUu3mRbdd6YrpgXa7mcPDySb61yV+pw13NcsE?=
 =?us-ascii?Q?+AtCIiBOiKheKX8n2L2aMiUokise0oZBe1QGbnW0/8llVHs7uj71AHDaE7pH?=
 =?us-ascii?Q?FLDywsjQnmfqHRLI1YPUWuLNZb6r/ypfhSeIqoBiggGHxto4+Q6oSDiCujh7?=
 =?us-ascii?Q?oKkzb4Y6+QNfYAViPH6GKUfq2xILfuBBvkCM+CseIbuhdKrcLWAvjK0duRie?=
 =?us-ascii?Q?T8Wz7E4QEZb/84vxHe0WHVAgetJuHlBfCkghtZg43dMyWCUdCDNDUa5RCI2c?=
 =?us-ascii?Q?EF2BcYVAMXiGQPT+beGkEDqEi9r5ze7k556bzin+C04/Y6wPHoBigrqFYEdR?=
 =?us-ascii?Q?3VdX9NOsMpTB+j1Fp2n7K959cE3vvSXsgqx775wtGwfzVKNN1AqLRvAo0GKO?=
 =?us-ascii?Q?JSDti47X5XRFFEr14hVsePpI1zJKAWsgUFzOjzMgPVAHvNiJUUiTJJUo3Mgt?=
 =?us-ascii?Q?RIIHdPqckDykrGVs2OyBy+Xdi1EkP3ise8yyeqRTO2MzbA3UgTaRHofwpr6m?=
 =?us-ascii?Q?EOBUWaAFik2yWQb+4Uv1j76ycrWLP2ab9IIugZJbvT9ROmFVd+kBPKCpTzfg?=
 =?us-ascii?Q?pFzFtiNIn4MfvsqRNgqpD9MQC44VWUkHGHY/VcsnmokNrwrLJsrcq4JM/8js?=
 =?us-ascii?Q?qyWkDDGJaRU84jVgVIn7xr2DjvBh7eKnKunD3wNk9Gh6/9tQCQeVEQJnlr/k?=
 =?us-ascii?Q?OqotaNNa5pcSO+Ie+bk4Xr06HAQO/klyACgl59Dy/J9T9uVArMgOwmzrCl5o?=
 =?us-ascii?Q?tnA+EwwUgUKyJc/LdCIp/THxDm/e+XT4Xt55w3mhnt/yyGXWHCU9Nx1JQ/w/?=
 =?us-ascii?Q?udQxcdVQDNIEWEQAlYH8FxRVsFCzZfmu9MxkSynpqkN4bfjp+6dAVEXWIn5C?=
 =?us-ascii?Q?bKTkIFs/83Pjo6u6cr4Qo8FRL95buQC7G3k5x/LSt4FcmTE+EFix37TaQ5Pc?=
 =?us-ascii?Q?T7hk2mhlkyzYR/lTeS8sDhUMYSp41nhlNtVBUnUF9JWSnYUHL20ELjDrk/yz?=
 =?us-ascii?Q?RZkC8qWJ8Dv3w24v1gIiRet2dKty6np67iNOum9GS7BivX3pcNIKAcPH08c8?=
 =?us-ascii?Q?gbutQaLtN88Whsa2V5fe/nSqDcsEGqbvEM8bcuitLshjDbuAuIZ6ZxXEpfKO?=
 =?us-ascii?Q?fxFhZRT6OTNSdHAqP5zrzQhdBiEvAIzqS7OgOU3ee+TFYr9+ArS5siafq8f6?=
 =?us-ascii?Q?EjH+v/2lSAyckGgFaijw+AwelfjJssbnJSKyuJRz3rxgJ/SrFpwgPJwtn4is?=
 =?us-ascii?Q?uDW6arSW6sSQtkiULg1vkn/XsDyT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ga7u88ZmBK6RFyoFJh1TAng/Vyf5bXgt8H91MtVtMkdaH6eOFi3OFBJ8zgY?=
 =?us-ascii?Q?1OLDQcarKei+wVGKsZ7u50IY7JtBe/FNOGZKa2ZB/aTd5FCQNPq8Os6QZ80J?=
 =?us-ascii?Q?HWmlLTYZVwtm2g0ysWa4FOghWzpXkHtUDIR2wQi7NSx60hll+3W2elqLX7vX?=
 =?us-ascii?Q?IyX0XbwgXgcmriiM5EQW+5toRJkUlZ4q5vagQZ3ZkZPTs0BPIReVr+TMxZZs?=
 =?us-ascii?Q?CmwxznCOq4uiTlmoajzSeStC1DvG8J9rHzOw6tvKicvcU2/FgBu6ZhRHVYq/?=
 =?us-ascii?Q?hx6x780ul87cgFWd+8x5WEmT0bKiVZJzU+Z9xpBo4MyxFaYo0cZAOaitQ3OS?=
 =?us-ascii?Q?dhXwoHh4RcEQEmjMjvZ0HAwb9pu/RPpwt4Zu/Fw9dC3qinhBPwoxhPh0br51?=
 =?us-ascii?Q?ppYJN+z3k7/FmfdfO2P8ESK+bKOgZiQpQ8lchmzQOFjkAlcOM+OaMd8PJiIU?=
 =?us-ascii?Q?YgBlAtOMfUVs2ziufmbU+be8eD2RZB3p3jqYD96I748S0E6SAUDuYUj0fGzk?=
 =?us-ascii?Q?Y55VcphocbW/13DiR5Pj+Yhbz2LIbcxhYi3xhUcBLttJO7BNpvqjqW5l/xx+?=
 =?us-ascii?Q?jYG6APsEBYFRWvHqfEbP3GTVhX+NYWaYB1DzWl4kXTp2132PN+EXU3x2Sxv6?=
 =?us-ascii?Q?AQc3rvF3OOS1LkwBihqHocZuKT2PMkI1g91aBoi3Cc1UyJiuOn0xeUyLcVlc?=
 =?us-ascii?Q?S2d+lBa0XIY50a9Q6IZHLgFNf++tsmV+kN1CRIf6s0Z1yN7V2GPbB5TMoz4p?=
 =?us-ascii?Q?88xBXEQrBddTFz4xfZInyiA6cKUaojSYR3ehS6fn+V0LvHcZ9bC5ewBoDoBu?=
 =?us-ascii?Q?WopQqlhgEepghyaERKNrSmlO79IhKDSNiRTm7Cq8DFfGo8mRP+CNn16Ees5r?=
 =?us-ascii?Q?ZkMBxTAx2vCBZU4s/eJvmYJjikVN7PJ8LS/4sGyksfTO5cqChqCAo6xEnOpy?=
 =?us-ascii?Q?PxSxcDQpd5xl/cU6xrinVqIWSgnkYhZFdbwOT0FRAnSamjD8kMVreosbXScF?=
 =?us-ascii?Q?1IC9Va74ROkP2YxKAUu7ErjSi8r7QONtyznZjCHv8GgnffxC/AmSJc2+2I2B?=
 =?us-ascii?Q?6ov9lnzJQ1PX36Pv7D8zNJCUhUNdA3d9ajnmHyOgVF62xM+3wCeQ/WHBjJEe?=
 =?us-ascii?Q?xY5u2+kLGYl0P4juWuOrcpl8tetrIS/D8UTfaJZ+FAqX3OKAalz0KY0CC5Zf?=
 =?us-ascii?Q?6f39ZoBpuW+HWHldAFHqXCOM75fQws4kAxLrSQ3TbPS2wH9ZmND+TbBDvREn?=
 =?us-ascii?Q?tzZx3snpmK08Nm7tefrajFhY2VoRHUDI2IXskM+MEhF5Zjp8qH5hslkWVSN0?=
 =?us-ascii?Q?fi4ZsOL9wlUS0Cy90VxOsJWwkj2IE7LvAN4GJprvzbWnijkW6+sOs/m64+fy?=
 =?us-ascii?Q?nIs6QNooXbHMI/cbtJDxhjCT+YRDYtJcfuqdcbAW3Ya0vvBcppgHIPLvV/PA?=
 =?us-ascii?Q?Ya68jYY+/VjKlFmCJDSAGE29Mys4UfWGALXeyIKnp8A/NvoNvczaaXMtRnm0?=
 =?us-ascii?Q?mqlSKwiL/bo3RHYlfMP+/6XdMdeN82wJZI+53K3W1QxjSLU8NAiG8ajO+b1P?=
 =?us-ascii?Q?cBfm38hBgpUS7yW8Inel2mEHDWL6oRP7rkYMan21?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d5bcd3-6e23-444e-7c8d-08dd66ca7e97
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:43:25.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8sBccCKQEHYZoY+TaNk+uZjycW0NQHHayfOMuXWddf3hueXClTtC0AcHQqg9c9+ljrg0tCrxkj5XktMfLJONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch set updates the fsl-mc bus driver MAINTAINERS entry. Since
there are small separate changes, I put each of them into a separate
patch.

Ioana Ciornei (3):
  MAINTAINERS: add myself as maintainer for the fsl-mc bus
  MAINTAINERS: fix nonexistent dtbinding file name
  MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1


