Return-Path: <linuxppc-dev+bounces-7610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3956CA8595F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0b6xK2z3c9k;
	Fri, 11 Apr 2025 20:17:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366655;
	cv=pass; b=aoT6C3TyjMcNgFf7gKUSZZSiPQX8RUo/ri/TLf17DV2tQi78UJzngZqNN2hy+V/3vVDgI6yL+d2KtgnGKkDmOtV8p/Y9wOqG19A0+lpuqHQ+zyq2rm69K+03IHIWIm02e/MHeLkLd9RfDVrN+H4bBtb6vpWxx2ywfwrbuBtHFj5HjjXDtv3Tas6qjrNEsrRT4EA3p6rkiKS5oOofacx1QtzccDaARbHuTFzPgqtdTVcWYfgdvhKo0zqb9CKrSkbFL/iC+rdztrFqTKrFbGvSDjJU8tmfH6KHE0FRPbUHPMPZ6v4LFs/tHZQf6B/u7P5GYcKm2Z7ZHmLnObyZlw7K9w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366655; c=relaxed/relaxed;
	bh=ATGfGtT6ew6tjSWw3jWVFcGS37VS71SRdhIcPtDdGNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aBEkeNKB1gTtlzLSdzNAvZc2BEwhanYUr/dafuolMhWO1XUgI6ENcz5fG3x+aPyzVaIXWjMuz5tchqORf+yocxmJFAiYN88LrKBpK/Cy3jeDpSytfKtjpj/b57fnRj2tMETI9sIoFcu4HioN6YbwAaptr4LnOrcnWoO7t5b+CSNS5xEyU1P05YFJBsMeAnGvN+XM4wp11MMYQ6dL3o/KwJHQoKPxNMMqSsAAQhqOBYC6VM/ETRlwl2EnHNpoJ9Q0fNFKypMWMdY2narH7S8Mdv2wm4zhIQJQYftY3RFKXbIZzNQqohVw5zcZscHW6lnN2Rl6/0ZJ003UvZHsLI2bJA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kJFQYhYh; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kJFQYhYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0b2G6hz3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isGmHQn6GEQoFUWhpRhjQD84G0ko7LtShQ42suyvZjTaF8hbeAczcFVEpImdCBWJaV0PFd/sjxmY/LLr87y+qec/HYj60tjCy1h0M6WhnTZhJImGuZeDB8T95CUL6NVaeTbaJd+VITV5spGHL4NwUyN9OwtcvTHygJynP9dLJz5VxwLl5k1So5I71nlCfsl+OGoV1SI0XUjsdNEXpfbxkPYn4j4xFBljwoicE18LuD8ydFfEmiQ3KZcUj6YKZazkIpwrAubuD/8UVL4sR/KAq+6TEnQhp7vhYzM1a/fwycW3hPGMdfH+Hif17FCKe07IM6KVdzM9M7q1TAVFbwucgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATGfGtT6ew6tjSWw3jWVFcGS37VS71SRdhIcPtDdGNc=;
 b=Z5gRqOiq0yK96LBJKxvQAs5gmk4vzEanNsAEZYacJgVYKVA1or2OWgn6+l2pk7lLUnR+HHFjQBdMLgRTgO6qC0nCbu7BWmIp8XyLcxbksMWzQRpuhuxrLtmyqDO2VcTduU4+jBE6fsTpokr1w6oQIsaokCC1hZ2OYuXOACO5NtkNtGvA768Bz4OT272Q+OUgBoKgjGSYTRlcCRTYZZB8eVyhHPP9X14f55FHAsqWqGmC4/EqFO2vJll+mSayOTjNU+BXi/Okj6KqH5hSYc8tEUM89wg37VXy37XRsKABs+WUyJmSTwdFIxfIW650lvcoG+JFBRNw86PnrToNdEXBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATGfGtT6ew6tjSWw3jWVFcGS37VS71SRdhIcPtDdGNc=;
 b=kJFQYhYhBGKL760sh+WDorlnSKSpcH5y3pDGE4OF+bJ82j5PSZl0Vw8WJpFWihYfDhf9qgzkN4LOr6XqBpD4mOMIxpdsOx+DRTP5xGqHJfEaVBAt7LNjPVlnX5t3Pk3pZD3yQynTJa/Q65pfnPnUCYq/c3tO9AXUqpZt7qX9SmEa7yZq0+PoSem1WtU/E5EO+8e7/Ns0tBwADtqxY5Xt6/oobCaumN5TvERRzLajMpemrhAxYetypMlUyegw80BtkGFuXmCll84vByZ3UQu3e1BGbm9YhsUM3ZNEvR+hPcjRz1EoklP9eKk/MaMl7DeXZWtOGLaPl1lNCJUoQ3xFyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:32 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:32 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 07/14] net: enetc: make enetc_set_rss_key() reusable
Date: Fri, 11 Apr 2025 17:57:45 +0800
Message-Id: <20250411095752.3072696-8-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca83c6a-ef7b-4c53-b5e2-08dd78e21219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tUIJ8TMpAh8FR+/RMAANdXfK0RwoTIm6ps0ZDBMvKmDuRacJeAKODgBjy01G?=
 =?us-ascii?Q?VUYgGkATmO36J4FYp7/gfiWNY2raAtDT9ryxEhNZ5db3MX+KWkZljAxj3aKL?=
 =?us-ascii?Q?JGuMHlo3jxgMuN7hUQ3hk37xkU3eyDy79UCW0+eaSIyYjHzAPF01s0+Ed/V9?=
 =?us-ascii?Q?MG1HZVQKW9ugkqqJNTXA3+Lc581SwKfd6oRjU/1hwf63MgbeyaI9vcpKLboR?=
 =?us-ascii?Q?gQEOboBKqh0SsEXEBHckZ43AKDwCOSDU1yJxpF7cByuEkjEAilw0RRKFkfUu?=
 =?us-ascii?Q?RmQrlLNDhPfIFIfvzrQgcIb88TCSHsaFuIV/GrLSaokWml4Ih8YsARO7JQeY?=
 =?us-ascii?Q?j+znbfsL+GB1iS0nKq3c45kwpDYBPR07A9Z3FSpptYyjRoWMsBklaKqPU/pK?=
 =?us-ascii?Q?EOYRi5tNbN2Ed57ER87T/5f/ErNvPTf+DubyInzVBLPrms6duP/x+JyVb6N6?=
 =?us-ascii?Q?PeDzW65/43cmjUilYzKS73ATXL37xFC6sAL+RhcHXJ8N3W0xVgYxVJv2yi4l?=
 =?us-ascii?Q?Cp7YihE6zXEyN7bt3keEmpfwaO8LN4udW0XZnb34eJLBL76i4AwWRKfYHoq/?=
 =?us-ascii?Q?/BvdK7/pMOU1AOv2U8R2D0n8o6L2Oi3BUgDxQOmDcev2ApeOhs+XYSsrb8Hh?=
 =?us-ascii?Q?4CjHdApkPpjU3VUhtKa4vaIXNELPek+PIO9YP046Be+4yDjZg87L5XGn60cH?=
 =?us-ascii?Q?C+T0fS1+b/2pVDrnuxstxe3tSZM0I96KoH+K5oHJyv9RVCS2sa+D/IhmcSdp?=
 =?us-ascii?Q?oETuOtjE5tLAU8Ev/Z+1cpYLN6qMYu06mUOm6Ecn+04y34GoZFgdOQ4yOSKK?=
 =?us-ascii?Q?gtJ+mxWQYdNSWwAnBkF2BwoiSvq/4DuwNOWwVKbjWZYsDnuNv/MKxt50XMrt?=
 =?us-ascii?Q?joIC0b4uIEvSr2t/JkhdWEVI4wa7AIVI+F/2GWWA2JaGzaiLGsGZi1NdUgPs?=
 =?us-ascii?Q?BYKyff3hzqggXVjGLftjTyBqUwbLQD2/qqDGn1i0KDXgimmhMqdkv7298Tgw?=
 =?us-ascii?Q?3j0Bu1+/N1Mz1mZbij5IzJfD+3RZCM5tNwbEtTdM0YuPQ5JdBUfMOwttD0xE?=
 =?us-ascii?Q?PaWCkBy083B+oAKrtv7yakg88fHhHYv8hvE3pdfBmz1JIm0t7C1J7UKRUrKo?=
 =?us-ascii?Q?DxTpNi5xztzRpJiRRvZczhC8ml1mvEguh6HrgMnbeZNUlr1P6972UdFop1D9?=
 =?us-ascii?Q?slBK3x4/LlbSKKMex6GDYFHG736LHgHefqFhzaOkfxweGa6MSroqO/BoNi9Y?=
 =?us-ascii?Q?EuNJSzWDslj9QsweTB6XHrI2hMKBuUKqxf6BHklG7Z3Gr79eQyEEc4aJlepf?=
 =?us-ascii?Q?k5gtdhWm7vUNqX8bSZUb37PhWccl7Q0Q58Ck4beAOxvDYnbGcIILjdWNYu7b?=
 =?us-ascii?Q?YyKSVkLO/tUlqwtIZynQ1hugVMsLAwauChYIStMoQ7ps7xs5/clsAzEdEbog?=
 =?us-ascii?Q?CIhYUMYKS5Q0eeiN2HcaSsVvKPzCQj0oUHGUNlcPyo3YwoRbDhqixg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CcaFeQkRdV3gYwchvJHVN+bvGS/Wg1IxhGVnGxnhBfuk2NlLRKLk0EugKgw/?=
 =?us-ascii?Q?t9r7GcoVVdtoZf+YRgAgIba7K9XfN4HpHEeLprAZvhUdP/y0gE423MHel089?=
 =?us-ascii?Q?pE72xfuAlBOr6NQk8t+Q2fFsHGeYd3i5M8kRBePPmT2HwiJg2KVO0oN/OgtT?=
 =?us-ascii?Q?eF9uwRco7H4HVVsVO9N4ufF53LKB2Wit9iaLj4JkFXATYiV46OSmLYNFiWIK?=
 =?us-ascii?Q?T1gz47g9j3zGUSXj4OLqN4osPCuQxuwOEHwtt6F+h75LJPD6+W1CHGqnIixJ?=
 =?us-ascii?Q?ji5McA+N7NvnGplHGBtyxoz5SmO1U2hXnMRHc0CTP6C0irgsZFqYfv+cSoM+?=
 =?us-ascii?Q?dqVPQ/OZhXhruVywvFrFbodrey8O5bHLcIjihajJj0OizGFfzZHnx2WSfhiN?=
 =?us-ascii?Q?FXNWqoz5yDY2SnazGy9fTQnp6uxYNdlhm+J48fE479c78F2Pdeml9vIyJgCi?=
 =?us-ascii?Q?fhNO+4VI7hm+hEQ1vAQDO0aCj2i6kOsLnFZFUC5n+MJLdUweuMAegnZMpo15?=
 =?us-ascii?Q?mB1WVI2KdZyx4pqwfByZBVgRYeh9Nxi07cjO86CedYbqf6m7ql42xE1Gbmzj?=
 =?us-ascii?Q?gesH39OupnxeEUmKszE3JRIcppm6IMfJtYvXstZtl6runwypDwXuvRbL8kES?=
 =?us-ascii?Q?IKeesMEZFDgt3cFXRbAlCaiNZ8eeJ5GN2FBwBROt3Lk4Ehb4ZfL4E75BMne2?=
 =?us-ascii?Q?V4PSwuEKJEg/ev1SdDfr33NrHNeyH/1ZTqalxzmQ5bmIb8106qXE1ZlWSnH6?=
 =?us-ascii?Q?eJLBSnZ69PEeTMcul8LefBZVZjILFD9ykd+EIOJNlbcasm8sfHR41giFjcsa?=
 =?us-ascii?Q?GYnFUeNgCDywkFbnqZFNer1+PqQopUcF8VFy5f2MZvCom9t/6YVq15cW8Acz?=
 =?us-ascii?Q?Z4MHc4b1fa7RDlGDkMiEFLWKQ1LIkUzosllXCj4UB0joSUFhSrraFnY7SiYg?=
 =?us-ascii?Q?vl+ckcA4Jf4uDURCiZ/P/XFrZCE9dgT+avZPcTP+1uekSBYR6xGVvg+B5k/C?=
 =?us-ascii?Q?G+M3c4tWygCHE1WhJmYNbJXYkq1xMCfhWQH2TZOI3yCcPo2yhHdlOddJYvxB?=
 =?us-ascii?Q?VNE5QdCeP5rNe6htTRLmXzu19kKxkTKkjEW8NC/dCtW3f78Guq9gYUlBu13E?=
 =?us-ascii?Q?miWhY2OGHAKHEc+lXByDukCmLrJ6T7sHuskVZD9RK6bVaZ8f/yWstBufjeAP?=
 =?us-ascii?Q?N7PBEhHvKn62lWEnC+POdbtTPks8rq4mtVEkkZa8w9itsqGXaJQO3Teeonyj?=
 =?us-ascii?Q?lUAJf5ZEOOfATYmy18CwZ546njA/oA7yyVbgNA9O4jKcFFD/BtDdg4Isr42O?=
 =?us-ascii?Q?yWe0Nb6MVuqak8rmnKO8yGgcnwZLbJetCdXl+oUo3EHh49gki1Iy2FK0W6ME?=
 =?us-ascii?Q?tBPbMegEMR6PB+vXVf+T2wJmjuEsjtoZR54rpoPQjINQz8eAbwJICZonv6cu?=
 =?us-ascii?Q?E1RFi8mxxIWhaXQLVGPTXKUJBj4AbwcU59qY+KSiCOJSJYnde5lrf1pwjoHB?=
 =?us-ascii?Q?jW/6ac0gm0UxU/TfrtLfrla+nsOcpqtJAHHD1mzV0Bk02K0Ksf7ap+Vr9HrB?=
 =?us-ascii?Q?8HcXoPp0cxjJCx85IFKPvIBvJg12R2q4elRJ9G4u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca83c6a-ef7b-4c53-b5e2-08dd78e21219
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:32.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu2aIaa3hb4XOoWC9WPj5CqBHWF7AFicF8Vr+tBQ8OuYNKAFQHOI2p7euMK1gfgDiwOoqM+X4kykDNwp+dzmSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the offset of the RSS key registers of i.MX95 ENETC is different
from that of LS1028A, so add enetc_get_rss_key_base() to get the base
offset for the different chips, so that enetc_set_rss_key() can be
reused for this trivial thing.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +------------------
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 19 +++++++++++++-----
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  4 +---
 .../freescale/enetc/enetc_pf_common.c         | 10 ++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  1 +
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 786042029b1e..e49c1626e7e5 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -537,7 +537,7 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index bbe16c140875..b72a365625d2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -413,24 +413,6 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
 	enetc4_pf_reset_tc_msdu(&si->hw);
 }
 
-static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
-{
-	int i;
-
-	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)bytes)[i]);
-}
-
-static void enetc4_set_default_rss_key(struct enetc_pf *pf)
-{
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
-	struct enetc_hw *hw = &pf->si->hw;
-
-	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc4_set_rss_key(hw, hash_key);
-}
-
 static void enetc4_enable_trx(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -443,7 +425,7 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 {
 	enetc4_configure_port_si(pf);
 	enetc4_set_trx_frame_size(pf);
-	enetc4_set_default_rss_key(pf);
+	enetc_set_default_rss_key(pf);
 	enetc4_enable_trx(pf);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index d14182401d81..1a8fae3c406b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -677,6 +677,14 @@ static u32 enetc_get_rxfh_indir_size(struct net_device *ndev)
 	return priv->si->num_rss;
 }
 
+static int enetc_get_rss_key_base(struct enetc_si *si)
+{
+	if (is_enetc_rev1(si))
+		return ENETC_PRSSK(0);
+
+	return ENETC4_PRSSKR(0);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
@@ -701,12 +709,14 @@ static int enetc_get_rxfh(struct net_device *ndev,
 	return err;
 }
 
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes)
 {
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
 	int i;
 
 	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC_PRSSK(i), ((u32 *)bytes)[i]);
+		enetc_port_wr(hw, base + i * 4, ((u32 *)bytes)[i]);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_key);
 
@@ -716,12 +726,11 @@ static int enetc_set_rxfh(struct net_device *ndev,
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
-	if (rxfh->key && hw->port)
-		enetc_set_rss_key(hw, rxfh->key);
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_set_rss_key(si, rxfh->key);
 
 	/* set RSS table */
 	if (rxfh->indir)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8dabb80ec04c..8f2616fd83d2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -515,7 +515,6 @@ static void enetc_mac_enable(struct enetc_si *si, bool en)
 
 static void enetc_configure_port(struct enetc_pf *pf)
 {
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE];
 	struct enetc_hw *hw = &pf->si->hw;
 
 	enetc_configure_port_mac(pf->si);
@@ -523,8 +522,7 @@ static void enetc_configure_port(struct enetc_pf *pf)
 	enetc_port_si_configure(pf->si);
 
 	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc_set_rss_key(hw, hash_key);
+	enetc_set_default_rss_key(pf);
 
 	/* split up RFS entries */
 	enetc_port_assign_rfs_entries(pf->si);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..0a95f2ac781a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -341,5 +341,15 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+void enetc_set_default_rss_key(struct enetc_pf *pf)
+{
+	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
+
+	/* set up hash key */
+	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
+	enetc_set_rss_key(pf->si, hash_key);
+}
+EXPORT_SYMBOL_GPL(enetc_set_default_rss_key);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..e07cf3c35001 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,7 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+void enetc_set_default_rss_key(struct enetc_pf *pf);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


