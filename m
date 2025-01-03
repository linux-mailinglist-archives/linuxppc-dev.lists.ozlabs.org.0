Return-Path: <linuxppc-dev+bounces-4610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2AA00445
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:24:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYSD3L26z30Bx;
	Fri,  3 Jan 2025 17:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885436;
	cv=pass; b=dyjTzUODmhBftksrpxbmzyeWYRT+kUiVnUVzbVBp3AvP7QkPwB8Sj98W2MddBZyt2w/NlB0sr8nBE9lz5oX8gQKKPC/maQcYIJgbix9s8LkFpmKGSLQIVkzKO1U+X7OSg/i5mPDI8HaJYtP/LngQqD7PRYDQLACHbF4dBZXvzLPK5sRqsgNBvF804JZ4jX4oLQ+7ALFzJeThYpor0pDikS09yNtEf37hlPBbB8MplVFIBdqe4j47GT7HmOYOt+VaVV7i69V4Yns0e/DAHIr3zeEbWeYpLQ6FY7kZ88+74LrZIWk2ECoN+euV929QY8ZHlHHFd3b+RPAfHM7qAcZEkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885436; c=relaxed/relaxed;
	bh=CX2D655hcMFUyMvofunkFGwzwcuxYlVeeLQenY9dSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZQN+zxnCBrzPq/7bd15PemDwJjQajLFlvl+3J+NJJL9NCuX1X02GjtiKJTzX65MhkEwtrZuWxBui4a3VVeJyXVT8x1yhSRSU1ugxkVS7V33buEfQ1l0ZeDnj5a7N34PH8kcfE5iX5OOUhKa/1Dx9pWlqriBSC9d2vIqKPnCQSFd1JLl1vk6zEvkJVTedxx19O90fGhw1QMLZ6mpX3Kkt4+ZgpD15uxJUAzwpf8kmPf2QJzM+oaGukBo89cn+o7j1K+X180+5cUNz8isypRm+mqQzJAaOtTvnJv/3v2PqH+c9Qq26Z0wxdvapt83ro8+foeNWSp0/v7yCevwU24bezA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HeChS4jd; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::61b; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HeChS4jd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::61b; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYSC25FDz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR8iYVsr7Y6kdldQF5H1H4SGH93lqtnidxpqK4Acy+W3n8Q0jRg+f0NW+sNUMDPfs9Gf2RsSho3pP9CdTgUIBItO1WVhZNWp3yFX/aBi9r2aP5LFxBXJJceImdWPmpQho0ZT6L8k0C9S9AatILSWY1m0nEvLnF1babXEkTv+v406dw9jEquTYeRdzUGg5bKGIsI78FeZ8jfrqHX8AUakV30WhqHxHQkpX68RgxyRiekMQBskpqL9vA9Y9QLSJUaENcceuG4/Kl7B/HyN5D7F6iL698zvBlUUPeGNse80Js1Kr9mOukZ+xZpvb+/Er4aJjjWQp8eIJlh2/SUiomiqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX2D655hcMFUyMvofunkFGwzwcuxYlVeeLQenY9dSqA=;
 b=lJF9CmgT9331/xLIXM1XrGEZOYr9Qxj0O0wDESE4uja5dRxg+CqLf+iRJSu5F7qbbXnVbj/r82GN7KSH69irbkXkeZfxqmLYThF2Uyzoso+MORym3m25/Ilj647CoKLqAzY0DEqK4mYUdcVs+RHjJBzY8diTnlAHCZnDEKqSFm2imLqPG9xLCZNDQ02U1kSeGU1X8KSvfYoIwDiax+dFJvAkvfJjbJ4NWSLo3H74xJxWqaIyp4POp4azHqYESbmQS1f+Anvdu3yuE/8bwOnBCDG1I2LUeBn5+y1I+zOug4F+NnmJtef1iE6h5bzDmQ0sf/AzL7Ksy/+vQsgSzdz8Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX2D655hcMFUyMvofunkFGwzwcuxYlVeeLQenY9dSqA=;
 b=HeChS4jda+Yqtiu53R0eeKBGaZTP/F2qL1HBdovaCDxjG0aXwHa5OsZ/eGePZGH6O8J9jVPDdYTt+M+mpI72iS5gF73ry2mAkP40zRmJ3nC1CeGAMr2qwKCM4jpPAHGEht5CswaTE2CCJifd3lsNMcvDM89hy1Bcrs9V46d3rPvTOEYlxGz8q8LEFGNvtFqji7o8y5t5Rz1VQS8PTOxkoNWA0HorX9awHNmvsOJV/USn7KWfmXX39sHxQv8L8wyLBbGAls0l507ccawLmNsmFi9kzoPiJzjxMLjGDBV/TZzJs4MawsvKmEzKq0psOyYN26xV9FjFc6aRhoo6TP08ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:47 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:47 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 11/13] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Fri,  3 Jan 2025 14:06:07 +0800
Message-Id: <20250103060610.2233908-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: a53bc9f4-c8db-4000-7dc5-08dd2bbf2e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c3nqkw5YCeOeT7nS0BnV7JPLTCYl7gsIUqZ3ne+oK1CRwkCkJFXpPEnu0yBx?=
 =?us-ascii?Q?jk55dvysFetqoJj8qLbm4cYTMxea6WVmUSHrsr7nQoIKS1Cg1xY3h8dx0ItH?=
 =?us-ascii?Q?XlmV0pHKLh8bb2dSbfkbPxuEm1GqICsZl5OClVU4rK6497WdN+vQr8wU+ZXj?=
 =?us-ascii?Q?xhOItnTVbF/TbHiXLtqLakO94h81/WSjmME1qV6hnDP66Zk3TngYCzTiA9Is?=
 =?us-ascii?Q?8CWDoAR3eEYcaj+t2tNAXgCfDodMsi+JelL/FltERpMZ6jZBwCkSNWpD3jDJ?=
 =?us-ascii?Q?1Xv1luo8wQiClH6dZeIwI9sVuhueQ9WR398tAZZdGb1ALpSzLkXGPzXq9s+p?=
 =?us-ascii?Q?14NhXI1OslkyRUKv4v1PROb4BvKh1vzOE7DutytP3XhIJqZhLusk7rFMbFM8?=
 =?us-ascii?Q?lVWOTg/z1YB3JIzFE3gu/7pnch5XEWlwhOZKQrbA8Vd+tvQ6fPI2FP09oGoD?=
 =?us-ascii?Q?56Jz9sX6zuzhLjNHidrudrjzq6f7zTPo0dHf0e2vz3wIK3sFuegL0fcc5gCZ?=
 =?us-ascii?Q?J7qk/WFqBrQHPAqdWcf4hO1RlwOENV5gRYWoC7PWlYlTJaIEexHvxDg6ynex?=
 =?us-ascii?Q?GJZp077MBzoTYtpgla1rFdwyei8UweXodJgNAtXKolKaKPI6p8olXz23xO6X?=
 =?us-ascii?Q?MFGtCoIhuwPMJctpIjkGbIWDtei9k4ZyPVbNxo04A5IWzkyOeztYikP+eEji?=
 =?us-ascii?Q?sK7M1bLrCiAVthCgXuHrXKjAz+i42vSC+fDQA6pcu6E/lly2/YfjJZkw1yI3?=
 =?us-ascii?Q?75nZYXo7hdictZE5I5SWZ4StLPhmsnnTk8ZOFk6WsdHfIJ2yr8IsLdiTKnhI?=
 =?us-ascii?Q?F46ipGw4Mr8IcLgvsT9/HljyK2qsIREpymVpEqQU0ltPfit+hkGmt+2k3UHV?=
 =?us-ascii?Q?SqMjo/zpgzbnNNfPRbmAppz8RqS2Sct886GJO/6OSn24DKqEEq8GOsS4KdHF?=
 =?us-ascii?Q?6izil52/tcR1LRoZPW9/wlDxzyXtFrMsfR38ZMhpPz4rgpEAVblCUR+dXf0k?=
 =?us-ascii?Q?GxquSzGsnqBq3FeBVVxbi4Z6x0gXI6oVVnJTZcTl4iNFrPe9jyPQ/+mKbqhh?=
 =?us-ascii?Q?fxChEHX/hhCq1pfV9K5RVoALXdYnV4wKBw9qZwxZ66D1b1OdbY13s7AfndFq?=
 =?us-ascii?Q?dyC+H/OyA4WRxF/ZKQkN50GYLCjqJQmaMUEgElwVEeHt4WGyd7rsNNLEL5Ux?=
 =?us-ascii?Q?fpW7VIFB/6EiA4LDK8nA/BsfqMemnCLNpVvnywjaNVEj/vsijRETSTDUL7ng?=
 =?us-ascii?Q?XnNr/JIAL0HXD9X4/hHtcNgdAPDZp7rRjvWvhq3BUu8UfpC+ktrKDb0NDUw6?=
 =?us-ascii?Q?NTyWOVoguTxb8dWSR2mwDj60sfD7aZgH7r0aRpz3M3UCA6+XI8/Mf4nTFStB?=
 =?us-ascii?Q?dlywqgWzE8ilMvAIPMl+jCYcNb6YLnVBsroCY88wNJkWYwOUAgpx4AmfvzVU?=
 =?us-ascii?Q?ALLRannC5eX6O3IC9a9A77JbMfamyIEc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GPg/TkkamfxhaQRN4gcZgr6c3ZLzvWSgQ6mpEHS5DyhpUWZLXXRO+QzhdrOQ?=
 =?us-ascii?Q?Y1TWKx11zCMVBpPX1EVFI8KBJJtxSoPej6mCwhtxpcyOwotXITtqJdJmpOcA?=
 =?us-ascii?Q?WCAYYrEZXKsPLaiOU2p0hPXQKFay2kGu9yD1/8KPox6bDwY2woPZz67UT3pz?=
 =?us-ascii?Q?l6LuzYa2fldnTf0sY5fQt03Bsj482V9nDaHQ/obAomd/hxQHgO7RJ1cdZwUM?=
 =?us-ascii?Q?HU3Uk0cI3G1ve9d8E3UzZEb94gwMhbZsDk7q2aCjCV49oxnqkPEB6gu93YGY?=
 =?us-ascii?Q?4W6NHnqX8fbyEOcu1PiSfPXM411UJJ6pGyMd5jqlYGpeg5WFifwAz2XIiXsL?=
 =?us-ascii?Q?IeNO/N12ifLmtJfKq5O4nPFxIw1HIjWL5TUkvU9s4GwS71zDodXDxBRz/MXm?=
 =?us-ascii?Q?onXmgmwrDPhIhOCBf62dnbxEiYL7lnb/VJVDcb9kc1WrEkUI9hPnR79qDOiA?=
 =?us-ascii?Q?cvkEO4/OaHN+1B9AKdVDcHWMrGToE/bAbHMBfE5GIsEPkt52A6E6KecBtcgF?=
 =?us-ascii?Q?tE7fJu9/yC1pLZ/kuIMbL4E9kpSQLPLQSwj0sgQ3GmcNFE3MAdjiAMixTiZw?=
 =?us-ascii?Q?F6X3Iqz4cuQlegWmhDgNhmf3tsaVvzHsvcrSbjMSBkx6WSSHrnBGZe++llhy?=
 =?us-ascii?Q?5PDvS7GvcED6ls8zq+G/A6yA9QLzR0aLc1Oj/hfm7wMEzlMms9BeiW+jljpD?=
 =?us-ascii?Q?PsjL/uyB6YhRlslOuCBPK0E7pTwtki+KNv2rkFLRRRnLBuwOfij9plqhsvyc?=
 =?us-ascii?Q?1ULJEpgdXVfgpwem/BZrWw8IXKtLoaQ24UkvCTdvJk41TuCENLyBg2C4MPum?=
 =?us-ascii?Q?HRnk4DIwTHI1g+MIAIr+ztwxcvX0VgDqJ0QwSgxylZ2iSjFaU9K2V000zae5?=
 =?us-ascii?Q?6wmxAkfIS8sKGJo4GZmVK7jo+1AhvO7UCZujWmj8Auo1KMYqOfMF+bqO0e7p?=
 =?us-ascii?Q?7k/tEF+PRRQ0rW95sAky6AF+yq/ST/m9TpSnnc2beyqG7ROFNYuV3IwI1k1o?=
 =?us-ascii?Q?I4taLRIJoG6I1/cXOOYlDXaCcCtL88B6EmJeZLxTH+ZVriDshO9kIhAElg+T?=
 =?us-ascii?Q?FpoqyRvMWfELNfG/ZaFif90VaWbZOWMVcIlbr1auQcp34Qfcv3BOrxPGB3Ta?=
 =?us-ascii?Q?Q4t/UD+8QlxsnrtewG9DiQFoNBdElikjLD+8VJ6HiyA3SilgzKUhW4cvs9WV?=
 =?us-ascii?Q?li3w6iuMyAsVdoY/c98gJIfhaiiI7ivaE1ylvG8pP8+aH6Ph56HttlILYdy0?=
 =?us-ascii?Q?aab65kjoxaXLkdvxNHY+3qiHlfteJYajkNvRTc7pB2ThMD4K9zOUYrsRIY+K?=
 =?us-ascii?Q?DMYdKooXsI8Y8KyokWbu8BMkGwOx1HbZAyKndYH0dfQ0btN9RWj0rB+uEw72?=
 =?us-ascii?Q?9OLt7wT5bGy/Tm8zcaSkc+ixt5rQxiKVxx+zP73g0GBZM4JH3Z/ENDe53ML4?=
 =?us-ascii?Q?I5wW11rH04VMSBHLYwoE9pmdYFlmnF69MzjT79HgQvwJqLGGR8vWktC+FedM?=
 =?us-ascii?Q?o6rCIq3f61BPpD0LpFFk7u7UTQohJfi1+c6thVZKxevONwimRwXoKZjP9Zpg?=
 =?us-ascii?Q?kEk17tmh6lxgBC74B2lVXxFYWsD0f+9H79WLVfE3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53bc9f4-c8db-4000-7dc5-08dd2bbf2e7b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:47.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nVZ3V47yQGRRVZS6eawUoByhTd4UBv6mqYTqH4yJXuWefRdPO0CUzUYFieCO5B3p/UbuiTfmn/VsBveqLqRqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add VLAN hash filter support for i.MX95 ENETC PF. If VLAN filtering is
disabled, then VLAN promiscuous mode will be enabled, which means that
PF qualifies for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.c         |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 4cd0931baea0..e2eca28eec06 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -85,11 +85,19 @@ static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
 		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
 }
 
+static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
+					      int si, u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIVHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
 	.set_rss_key = enetc4_set_rss_key,
 	.get_rss_key = enetc4_get_rss_key,
+	.set_si_vlan_hash_filter = enetc4_pf_set_si_vlan_hash_filter,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -704,6 +712,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -717,6 +735,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 9f812c1af7a3..3f7ccc482301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
-- 
2.34.1


