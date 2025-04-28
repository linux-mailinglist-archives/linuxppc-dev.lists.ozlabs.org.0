Return-Path: <linuxppc-dev+bounces-8088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C6A9EEBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVl5LYhz303B;
	Mon, 28 Apr 2025 21:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838991;
	cv=pass; b=T0RVNy3RlBdNJdQlP0NkNoLMuYNdIdJab/6AVi2ielRWEIMrlEyTv9zU8k3ycZ6tiBh8WQD0NLYdVbWUU+GdHbGvTXSVf6d+piDbfxB3gXzRs0erwcyUGypNQjUUaFa3lKJPfeiXM43nLkywcgixX9l5OR05DE3yhFsBt5UV51gjscaM5/E8GGzZ5It6FUida76oSRxHuCiogoIIUtv3WkA43HxM+0U9k/2ljeE+Ae7R5vQyhxFjG8V++G2pQ0VLYKQf1H/wReddgg6kx8k8k0v/6tzi/yN0PvsLVJC82HPk5lgaRUc0m4J8T9s0mHeCODHUIL1CSdCRoFBtryOWzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838991; c=relaxed/relaxed;
	bh=292lp8dw7wQECSsIheOX7Zq92wdf7u358XKx2da5hP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=evLtvdjIUOcBISPcHuOe2Hbb0QtafvZ3OoQFseu6ZjbSdelsJCl00SczWgrwbqaFyJyqda5Fa0uOpJecnYDMJtAWhLqta16DGf2lphvSp+QZk338B40CFg7SxnYpBtsb2NXi9RVTbJ2bAgoBB9SiFwzwR8CIWPnK1yx3SlGWV24bI1hs5wYsMGWnd6b0qPtH0Ay/oek7MW1HnqIF6Utiiz/0BuW/mKH5fDGQbLW5/oJ0KpjrFdquXGzScO3cHlwDdBFsrKpXK0sUN4Vi+zhV5q5cuZlJaUaBrQQNvuQnSlXsRasEYxD/1XPqrv8XZhei3xagutBj7MhlB2jcVCpjGQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HUdW/N7G; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HUdW/N7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVl09pgz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrVz7sw+zHh6ijTc2tbeUgeu7pQ18Sed+RBDmZypWUo12GB0hP/vz+FTaOgK0Rs0Iy/yvhnR8Sykhq2UbHvYkQh3G9j0zTDt3/uUXMfC2AaN3YKSTtwZ7JcZBg/pYT2S0DvA0kgw12CtI6rQX+5eMq/ESFvHhHd8CSByF/zReINX/UFdm63HyDdYgOttZ42ZxD28j5GO76W1H4yjnW+dR22xlII2kBLbjsff/uLqvG8K+pQ0FhOwsCEFJCPSkMOGg5VvPxe7onMuli1W8pIIn/JCRt1hG33ShcMeiafk23T3qraGjVn9RAnrdpIjRjPcK8j6y19GWjsUSJD1oQyFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=292lp8dw7wQECSsIheOX7Zq92wdf7u358XKx2da5hP8=;
 b=a5ELvJm3Zs+hUyx/J41sfogaENeqsarR4YdDB+OR9aA3u16qHbjdtdg8QmdrG5qNqBbvbijherE3jsx1ouhqQeGGSRxXbSjcoalfYEJ3Xlv0KGOHdBYER6os9Ab1DFkRHOXywNkzvWMBXX6QJbaLcfY7T/vtxgbJiZXATEE2zU0fFTniNrNGaXHKO9ShkS50mszaJz7ri7nSZAhkMEJ3tuDHNVgEb/IP7TijorjqebZR4arSnfQfaPIgnUxyUz/+NfWxfOogDV8BBEai4XksbIadInDmchwJQNAXezAzZsO73XzAOisIiaWmsh2KksG06mcriKil+T1x3IRTYBox6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=292lp8dw7wQECSsIheOX7Zq92wdf7u358XKx2da5hP8=;
 b=HUdW/N7GEuPg/YdK30jHE9hX1C/xo2HKlRx2VKZmcr2OSnq5D7qsQboQ2fFLXWfTqfGg3Kjak2rrcyrdZ+KbMWOEttrCN0R455eBXdwRDJExss/Ab9q17ajqVj/1EAGI6nWIk0bdgbkyCwAHQon+fIf3Cuv22fjd4lgHBch9fKCVloVMWAhugMMh8BHpL43rSbVi0+Yf+26NDqYUhAZMoBpocN+Vz37b0ioEujMs8spoLBxUpEraC4H8dT/A4XqbtBsBBnw/nqUIG3QTWmR9zyVtQ2Kbf5gsc5sOTMQRC1X3JNVr55uIBrDQqJ0tL+21SIVl8hilBgYGYGxg02I+DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:20 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:20 +0000
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
Subject: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to dump MAC filter
Date: Mon, 28 Apr 2025 18:56:48 +0800
Message-Id: <20250428105657.3283130-6-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 76460d41-2456-47d0-95a4-08dd864619ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JRI9HRmN8dS6SgqvkJsy5s+D0pKtIfz2qOwZYwN43fPumKqkdwYXBZnJextD?=
 =?us-ascii?Q?hyrpSAovQ7ObhtFliBnncXBH0vRKlvF1Uylfix8pN9LnZV+cxUkOcrxsQCUA?=
 =?us-ascii?Q?iduaJxFp+Vd90h1qFSC3VMkgs6AKNmTEmHxj0TGaecHeDYp4RerlvbLwAg0i?=
 =?us-ascii?Q?WGh4OEEACcQ/lZYWv2u+/SbHq1k/ys5t+4u65AL2pbXlZXgJie7DYlfm4dKb?=
 =?us-ascii?Q?b6XhrNgdKR1fWw1J4mUb4om8g93ztTnBWvKBB2r5CKCqBSun+l9aYdhbhPz7?=
 =?us-ascii?Q?4N+XTeL54R+Q2mFU8/57utFEo01LKv/eVGgO48AX2QJqoAoxquud9IVmMI6t?=
 =?us-ascii?Q?3cQff6Oyj2031j/0PRMBYIORqKNsBZngTlkx/bsO20lhWuCxMmUUpR5AIFuV?=
 =?us-ascii?Q?jR/49nCVEsHMv+fyuuJ3vxB2BBrbq1dDhScCV+oCRMbK9o1FXN170IwLEqHt?=
 =?us-ascii?Q?oEA1ZwftgLBYa1dT4N4lIPkjddUkqMbh5VmA6BTjIAvGlRlvU2GUSvEXR0S2?=
 =?us-ascii?Q?YKvZTZuq9XfCB3Boi7hOUoKABdtDNDQZYwEtyh4liYVp482vYqKrclkHCJtl?=
 =?us-ascii?Q?X2KZxVr6g/4sLjeg3Dfdr/ts0D49drnlasZ4ZMg94NRYuh70cDZyvweAzqGU?=
 =?us-ascii?Q?dyBSPKr5/Mc5f6Bo79QFqhaY3awyZYQvrXoUqZjMKz0E4/tHm4p2PvecyqHt?=
 =?us-ascii?Q?V0HQCuqmbFnpp72SpR6Xq+281/HJvkp+dUu1mypi0J49/K75SD88qaf8Fy64?=
 =?us-ascii?Q?n7Ul3Vg4xScc2nF9WGZRRkxB6G7fmCwblzhP4rB5a3xIdhBsPPNaDjkNiSTe?=
 =?us-ascii?Q?KRBiuamswmY+uToAZ3vtJwQA99U2EcPBkKqnZceRMRBMcPWhoFcdMYyCizEr?=
 =?us-ascii?Q?PhgoXr2DN17E3lN9z+9Czml4XizForx2qRXh08ltG7AItSC6yFXfcns68hml?=
 =?us-ascii?Q?WvCPyo8O+C/igw/tu3QG01XsogWolBb6PJq9Ap4WfBfsaVGvauK+HsOXFIVc?=
 =?us-ascii?Q?Mnl2LeJyFmBqIsyMFgqxh3qTwocb2yvvpq/G68sTaG3mDgzLg7PERZlQYjUP?=
 =?us-ascii?Q?52L9C9jfXTQO0xuI+YbZHlimqzNLIZ7gIupMFQ1mvjWnOa8G51bgLJ/VOCjC?=
 =?us-ascii?Q?n3sU5+orKbwsgUdxuQ0nyUoAehGzlFs14D/XUczNcANEDjyE2bwTxRXdhxan?=
 =?us-ascii?Q?cA7Hb2xJnGmid/ZkDBADuisyjdaJ6islxKsjo7YSzDAIRVnTFkduhN/2L/EF?=
 =?us-ascii?Q?Z37A3UcZmu1fgOZwDnRxWUluw8j/CWCpz1EosmwfPtVfe6HRPVwwSngisAMu?=
 =?us-ascii?Q?ghcZw3t1rnBkKcbjouDW7B2KTpKh26XiqiQHDCubLL81o0ZI1Vwp6RPh/C3o?=
 =?us-ascii?Q?KTZlKqXao2setKzcihnJQdCyDQm7VX8pmvyK2hg1LXPcq5UvvnRvlwlzrEFd?=
 =?us-ascii?Q?J2BA1cfnqlfob970pLXlzdgceVX68tkjqa7XT2QEqi7za5fxfBLIxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qItJVnxcNpeASKURrULkCj8NQLw8VvT17Q3cHCBam5jjIfD6a7lv6yKQy8T2?=
 =?us-ascii?Q?TKOi6eVvXvrh2WZ2VQ/G+Ibwb4NIeCpCux1SFMaz8siShaf5MPm80Vk5q84/?=
 =?us-ascii?Q?PW8vE3FbL0wwN/tcRRsKYFTyFJs+Kf/6CQBmk2L3mT5AwcoWH+A11bH/eQ8f?=
 =?us-ascii?Q?3IVm7g4ZP2RR+/YgdEEz5IWp2FrWPxTbJ/cflhlNRjQ89o4SNbHm55LuZ3+K?=
 =?us-ascii?Q?rlVXRYGHfOnMCtaTUBH73C8Vd3dwYuc4jOVFgGMLHTqRqbzQKPzRPdpqXYxU?=
 =?us-ascii?Q?OvQPN53xtF5vdVU2jdnRvPmYYFfSj2K4v1dKDCXezXAoJIe3NWqVmULRe1MX?=
 =?us-ascii?Q?BJkqYFRayuEEl3BcdXeG1J/KUtQLXPgMatbSqq1dIxYlfpwjlb6LRo4OMUSj?=
 =?us-ascii?Q?LyinzPxgoLYMuuzwMkf+plkSJm8qf8vltKakp6a/7Gx2RieWkeUqlyingYrP?=
 =?us-ascii?Q?z3l4qrqRFAZeVsvEgFUB6wmzcU7heVriiEcCdeYa+o1oywy7BEKUTf6sSkFU?=
 =?us-ascii?Q?SQPnCsKgYoDhGculI5prbADjHuxdVzjWPaU5VSGt8BH4qOlFxNPOCKEslx2m?=
 =?us-ascii?Q?Ej9gaO8B7y6zDFfDa/At8bIXWdycJIjTOH/QiTr+Q05/qGDPAj+d28chy8JB?=
 =?us-ascii?Q?PpXPye6T++vm+zDAjMg92g0Hv4I+xO5s8vv6cDaQu+3zK9YuByaCcdNLzpWT?=
 =?us-ascii?Q?zrvNoEPcdzetez1+Exw/aeGPuAatmYw2WnisAWr+dE7VPtWcyz1OCi4MpG8w?=
 =?us-ascii?Q?XmQaal4RdrsmUdmGekHgyDU9OJLmetQKRq9Z9IWMahKvrYhLnfVS+v5J7Lff?=
 =?us-ascii?Q?K//BXiVuAv3jzaBrXRwUtQhhi/FqAMZScOEzSUquMI1q9UyaH+G4NAWL9sVJ?=
 =?us-ascii?Q?aJY+a66/g7oa1Edlsas4xNQA1qtGxnokikD10ZaswdiKxDM5ybR+lI+aVJDX?=
 =?us-ascii?Q?ncmrZnEyL1El0/2oZVzTmjT48rXZbPmLRAksL++vcnmFfSmd+ffaF0Q+kiJJ?=
 =?us-ascii?Q?6ukd4v1mb+1yOwGw0BUgy7XQxmOzTOGuKDTrf7ddyV7yFmw37ncj4VcqQWBb?=
 =?us-ascii?Q?aOA4Fw2+e/DSnYIQy/pKkCU6ExvMZ9rSD0Kd06d+EQN2osDYTWkz7i817Hsh?=
 =?us-ascii?Q?E+h7evkC03yLcDBz1KqDlv8JQz3ee1eCQkqRiNY3LO8/bLgTF1RWR7yEE4Gd?=
 =?us-ascii?Q?0M2Eluqbg1GAGfCqzx5f3LrtDvKYRpylYEEnri0j6w2Zvt8rfZvlpnSl7kwd?=
 =?us-ascii?Q?TkQjsQPVFX0kCT5ggF3yWGBd9QVHFjE7GJcmYh85C27A0+qwhRyyPZ3XnLxm?=
 =?us-ascii?Q?sD2pG8x4gbmFo1kRRw2/RufpCQbdW4C886VtLZk0J9gob/lHQ/oiqADU/N2/?=
 =?us-ascii?Q?sLYk8uO4uQioQTwKmHoa3UJn3+C2dftktAUHY1AF4RM475+HOTJPUyu/rE9m?=
 =?us-ascii?Q?QWOnkPEsPH8ZcTWFuGZT/A3z8Ha4SFp4LdPzm47tcjoey6YaFssiOhmDfB4N?=
 =?us-ascii?Q?drMn4b0U8/YJETggs4iXagB2TcILKNUn4p/eMPCRS2pPifVXOkOq/AH0JA8n?=
 =?us-ascii?Q?L8TYTYyQVxZzZXJNpJC+MJt3+cIICor9kwFijoQM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76460d41-2456-47d0-95a4-08dd864619ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:20.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/b6WqzXlgQwLSKaOlXFI/AszZnKuLD0Z1geA+p633j+He2OhMgESFDt5N+rBcV8KrEKhJip2fugt1MgVRLBcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ENETC's MAC filter consists of hash MAC filter and exact MAC filter.
Hash MAC filter is a 64-bit entry hash table consisting of two 32-bit
registers. Exact MAC filter is implemented by configuring MAC address
filter table through command BD ring. The table is stored in ENETC's
internal memory and needs to be read through command BD ring. In order
to facilitate debugging, added a debugfs interface to get the relevant
information about MAC filter.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Replace is_en() with str_enabled_disabled()
2. Remove superfluous "Show" in the debug log
3. Remove keye variable from enetc_mac_filter_show()
v6: no changes
---
 drivers/net/ethernet/freescale/enetc/Makefile |  1 +
 drivers/net/ethernet/freescale/enetc/enetc.h  |  1 +
 .../ethernet/freescale/enetc/enetc4_debugfs.c | 90 +++++++++++++++++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h | 20 +++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  4 +
 5 files changed, 116 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h

diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 707a68e26971..f1c5ad45fd76 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -16,6 +16,7 @@ fsl-enetc-$(CONFIG_FSL_ENETC_QOS) += enetc_qos.o
 
 obj-$(CONFIG_NXP_ENETC4) += nxp-enetc4.o
 nxp-enetc4-y := enetc4_pf.o
+nxp-enetc4-$(CONFIG_DEBUG_FS) += enetc4_debugfs.o
 
 obj-$(CONFIG_FSL_ENETC_VF) += fsl-enetc-vf.o
 fsl-enetc-vf-y := enetc_vf.o
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 1573ff06fcf4..b53ecc882a90 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -304,6 +304,7 @@ struct enetc_si {
 
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
+	struct dentry *debugfs_root;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
new file mode 100644
index 000000000000..3479c0abe9e6
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string_choices.h>
+
+#include "enetc_pf.h"
+#include "enetc4_debugfs.h"
+
+static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	u32 hash_h, hash_l;
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
+	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
+	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+}
+
+static int enetc_mac_filter_show(struct seq_file *s, void *data)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	struct maft_entry_data maft;
+	struct enetc_pf *pf;
+	int i, err, num_si;
+	u32 val;
+
+	pf = enetc_si_priv(si);
+	num_si = pf->caps.num_vsi + 1;
+
+	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+	for (i = 0; i < num_si; i++) {
+		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n", i,
+			   str_enabled_disabled(PSIPMMR_SI_MAC_UP(i) & val));
+		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n", i,
+			   str_enabled_disabled(PSIPMMR_SI_MAC_MP(i) & val));
+	}
+
+	/* MAC hash filter table */
+	for (i = 0; i < num_si; i++)
+		enetc_show_si_mac_hash_filter(s, i);
+
+	if (!pf->num_mfe)
+		return 0;
+
+	/* MAC address filter table */
+	seq_puts(s, "MAC address filter table\n");
+	for (i = 0; i < pf->num_mfe; i++) {
+		memset(&maft, 0, sizeof(maft));
+		err = ntmp_maft_query_entry(&si->ntmp_user, i, &maft);
+		if (err)
+			return err;
+
+		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
+			   maft.keye.mac_addr, le16_to_cpu(maft.cfge.si_bitmap));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
+
+void enetc_create_debugfs(struct enetc_si *si)
+{
+	struct net_device *ndev = si->ndev;
+	struct dentry *root;
+
+	root = debugfs_create_dir(netdev_name(ndev), NULL);
+	if (IS_ERR(root))
+		return;
+
+	si->debugfs_root = root;
+
+	debugfs_create_file("mac_filter", 0444, root, si, &enetc_mac_filter_fops);
+}
+
+void enetc_remove_debugfs(struct enetc_si *si)
+{
+	debugfs_remove_recursive(si->debugfs_root);
+	si->debugfs_root = NULL;
+}
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
new file mode 100644
index 000000000000..96caca35f79d
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+
+#ifndef __ENETC4_DEBUGFS_H
+#define __ENETC4_DEBUGFS_H
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void enetc_create_debugfs(struct enetc_si *si);
+void enetc_remove_debugfs(struct enetc_si *si);
+#else
+static inline void enetc_create_debugfs(struct enetc_si *si)
+{
+}
+
+static inline void enetc_remove_debugfs(struct enetc_si *si)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 7b801f6e9a31..db60354ea8d1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -8,6 +8,7 @@
 #include <linux/unaligned.h>
 
 #include "enetc_pf_common.h"
+#include "enetc4_debugfs.h"
 
 #define ENETC_SI_MAX_RING_NUM	8
 
@@ -1018,6 +1019,8 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 	if (err)
 		goto err_netdev_create;
 
+	enetc_create_debugfs(si);
+
 	return 0;
 
 err_netdev_create:
@@ -1031,6 +1034,7 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 	struct enetc_si *si = pci_get_drvdata(pdev);
 	struct enetc_pf *pf = enetc_si_priv(si);
 
+	enetc_remove_debugfs(si);
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
 }
-- 
2.34.1


