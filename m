Return-Path: <linuxppc-dev+bounces-7609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1FA85952
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0b0St2z3c9D;
	Fri, 11 Apr 2025 20:17:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366655;
	cv=pass; b=NVvUyWDIHOvhibIfpKP5zzxcAeCAsvdNcqkxbvG/p9uQl3PE9JLDUAzlhfZwOL0eg3FD17QlCnL6slNEgMrVOLyBKUwcb2sPI7nDMhh8+l12BMMOWQ1PYHO+IEngcE/r97i8T7SjbenRu8wsNj8gCktYMK/34ZUjVAs2rlgUla96C6E7ik804lAf9HWknVzO3WqcsxRz+mcJiTDnJjTKJxIEjPdbdPOZq/T9etHxybG63K8cABX4qZd6J+oZ07wL592NuhiAhBKLEscFBj4cmlL+3HMcsfZcyWXl36osZxh03IQib0dHof6sdA9+M/eekJVkCwOqR2YuQrPatOSgMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366655; c=relaxed/relaxed;
	bh=o4PDo7S25nbumDzP4V65kvg0syGRtWi02tga+8OkrCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c+zNjo6MRVUZ4JgDZ7HyRAqgCog6h/6eaq1oDlyuksD92z8983KhkZ7IYiRjEaZP3DYNEXuxS3RynAXsopX8dpzuNbAB25iT12zuJsQgG+9OwT9JgK8TKWt278KIqDoGgE1/XnX80cLLth3eN4ywdvprQzJZkeUfKRWPo9+T7KR/p3Fa75oIYL6QBG4MM6MMQVIjashwekqkSJ1VLOySwcQ+/fARZcYznPjOEPJVMWZcHDdQ4J4ARvwFx49ENikoFgMwxL+uiDFDKm5sl4tzCyj4InziQmxJa12bsU8Y/KrNZEY7+ZDcw9gAG4+H8AV0faDl/Sj1b9eErWRLvUBbdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ot9KRibO; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ot9KRibO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0Z3C3lz3c9k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKqv6f4ddR4OTn8JqtxsKvMsx2lkEvmjuFLI4kyrxKUOpnt/Mo3hf3Br5pvX+0esSmnB/FHfRTGEonKPL5vN8j2763gkDKoq18RMhfQ+eAX6lY1nmyN1u6bAJuhv3bz9YJe9PDN2il/1cytSfIwy96szCZG4u5OQmjWXPsv1QG5FIwSuLuZSSPn6V6un+w4gEAiuGi7wUmWbGGPVXP3OIcHqNzQzdYZ/oGW+JitQUSeceQ3datEdq8z1XcFQTMkhmYxfRqTcwTC6RvTs/uhMwG2JuG9j9TyuTnwbD1iyTI2bUKlL+/8NVezUxVE99iFhmhTrjWBwikDefQ7+NtcOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4PDo7S25nbumDzP4V65kvg0syGRtWi02tga+8OkrCg=;
 b=bHmnDTn5d6115L1Vn4oFiWT3xBNlfS8Uvcycv4knu4PJPKWnzxwVXkJR1sbyZcOfQI8evFi53IfhuLNkt6Jlw0bAKE80CoEw1HHRxQHkuJEnH/phAfpyeuwUEos63v+PPu3k0tTq6lJZC4qBLx09k8Am1ibHxStRiv3/SCRrTAbkBsnB3dyx+gNiyFzftgIqbuo2MwijG+qA9m3oYzYJze7MjhOZrQ7JVhBB0lgZaprQ/UmQ3MWhPuSFkQPi/0j04AU95J7TGBTP/U/Thy2qrvYT0w/IG1azHEAMqqpnVMfBierjvaGtXhOOoMdnw7yX2EwN93KWCvdCbeiDfTz08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4PDo7S25nbumDzP4V65kvg0syGRtWi02tga+8OkrCg=;
 b=Ot9KRibOTrEdm2oi8sPQvSE3SKHWcs61gog3zrKz05/9UPP47sE+FSdujs9+b8sZZNtXAJoPrNSmGJtQecAVuCgvWdL7j3TX3JTzmZUopzgcuXT8mkEqGqwIvRjVFmVGpKdN5Kb/CynNUWNX5QCHgkOAGOX52dGXuFuaxaq/TOPH5ME7KZ7/Jc6qNqLTghy82flDjnM+4UDKIXSe/qAMYxRTI0UVr3c1U6yr0sEOZkUIF+M1OUeWeJDXv5FBwOnrVQVTcOvv3B4GNFic3Pwu+O+imJjGoGC/BdKs9XIjX2K2rrN6nd1dZcknbHO6lXkSrGdcR1OQC5SxT2vWuQrROg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:27 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:27 +0000
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
Subject: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table() hooks to enetc_si_ops
Date: Fri, 11 Apr 2025 17:57:44 +0800
Message-Id: <20250411095752.3072696-7-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: 230eab67-0320-4b00-984b-08dd78e20f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DtU1GYkQw+Va4TiSKMefucmgO1bxV28elFhWUCdjnLuvd/6ZzVKNK6MytYMU?=
 =?us-ascii?Q?h6TAuGcwXYt+bHYxx/YNcA9UrnYiOsISFbXqm5gunzY2jBeRdqxBLnOgPRew?=
 =?us-ascii?Q?aXZVza99lxE7GZ7MIrEZDcsETv/V8xYlTxHTqYbzUXGBqOVx1rjxoGgTCUYe?=
 =?us-ascii?Q?qJozJilD8xSFMEWCr+cxMmQjhry1Feg/D9B0nsT+WXuM3eTJ1tKf7ssJh5q8?=
 =?us-ascii?Q?8R6eP4SmpnnGs+nbIhxDajuTHGmKCailDmG0VqTQp4TBrJf/oGwU7UCvByvY?=
 =?us-ascii?Q?t1rcDbzzWzrlb61fhJAc4eV4vAiMNFJnCup3x/jhMEv7M1NUXhzI2hsMetC4?=
 =?us-ascii?Q?utZaBHK6hhN20k2fC7gqlmlaM9MvuDOy8p81EEK1dzxhpNCsc2ZE9qLcYe67?=
 =?us-ascii?Q?9voN6ACQwMN+/Oiunw+zoi9V22R6FkMQ5vH4l4Q4sPJOCU9ZY/YWH9NQfwzM?=
 =?us-ascii?Q?sxst6rgaIuduwnuj634rPLR+S79GwQdoqK5zi0qMb6HCnxyvb3t4bFQIM/YN?=
 =?us-ascii?Q?2lf/fa/swWjKgpGbaVulaDuKwxWByr0SBzVDw0BhDigmukKzX2dkX2Hy8t7K?=
 =?us-ascii?Q?BfT6ELR67hte1eoUNkDcMBCCSKmdEve386/rD1x9AHGHgpyiXy2zGnZzLgNY?=
 =?us-ascii?Q?a3bw7VzzjvHDpIz1ySkJ1a5TNNIvgI68V8ilJHvSaUjbAl7NGbF76OXpsU7i?=
 =?us-ascii?Q?cOQ3RxhrmZlPsAiKwzXWnATNFl/LLheeuZ/1rVZXXl7e7UevsJGLzqGIfEVv?=
 =?us-ascii?Q?LLpMsGCpApTr/kuyQ1w3GWRkXfKICwAYxhvYSRak6ub38652QtoHBprN++AY?=
 =?us-ascii?Q?i5yl1eEx5IWzaa85YGwnCU1acgdoVNShKKqpzK+tNdRF9W8iQNOF+3mg57M2?=
 =?us-ascii?Q?hRhi6/4MKEXh1r/IfdJrLzxK5z47Ap9ZSuxLMGgaTDALM+jh0nlnQx3Aica3?=
 =?us-ascii?Q?pCg5s1NlJorEjaWxCRJP2p6rHU6efLXIyRIWJkkoVC3KGhiz186ozwprGC/z?=
 =?us-ascii?Q?L5sv6deMaeeb6EImGHeHGt7V5K6ZAnAUugu64t+xBX3Yzum3ByNW1YHBXzWt?=
 =?us-ascii?Q?LQTcEjDuxqXyRwmSYwa0zNALt7yev91kEmYGo/XPrr6vxpOCzTXHVfsTGNp7?=
 =?us-ascii?Q?htKlTR7yTD3dsK760K0N3Ja1NWiFYFCS+UEJB4Z4IpZupXlYhdy7KBYszqJR?=
 =?us-ascii?Q?F+5XrJa0YiU56KUliiTaeG2kGdOiYnSqrN7niApDg2yXNcj883jVh49dlTvd?=
 =?us-ascii?Q?HA4XBC1YBYikLdVDl5doGRn50ZQP8BGfhsLU6p3RwU4EyippQfiWlIKAxwMB?=
 =?us-ascii?Q?CXTbqm8kyBe3AK3eyx6kEdI74wpbfUHxfHU15qB8DTrIdHp2tCdd6/PopleG?=
 =?us-ascii?Q?Iq1WmLN8rjsv2XTQFMftr94fnIzqK2dGRtDwDPp7Zz/cGfj9dQswQM9lzimq?=
 =?us-ascii?Q?sPufA3toeZl1lcAtSIIo/gouVBNVAxxYKC/2ZqBynIrxA1/vv7jPLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sUBMES6LazVP78TZsd5nfmMJmrrSZxtZUSsFHMfklWA5yfTxMWufExT3PPPs?=
 =?us-ascii?Q?SN4Jd9mKLlqiv0yUeNBxQy/7X6451CtG3TZT0OAC5RkwTLNRawHZ57H5CyLm?=
 =?us-ascii?Q?L08HxLB63vMFieqwOTo4/wUEXsdDUAn+f0GVndHg/9Xf/wZBwkEhxWhg4Da8?=
 =?us-ascii?Q?+5uhLqnDCBScaLQj/2/6eXJhkawvCJS4YiWfE+7bUUPsge7yzKYbLILpXAcz?=
 =?us-ascii?Q?nW31QbWtryhmLMBBR3mP7Q9EueWQU1Wyt5OKK/a6/cGUHcFe8YRit5asl4Jj?=
 =?us-ascii?Q?rwsOmgavfsyBlQlA9ZuoeMlgJZkKmsvwO9uip+kizLTgBb3U/VBXMtEChpTf?=
 =?us-ascii?Q?L7hwtOWosYvZzM/4pmbWSqWpwD8mLHA0rRwbWneNowqStn7OxL+hXsWdNvpQ?=
 =?us-ascii?Q?6cmvRWvyPJutVjr3643sxlFOdRqv78U2XEV58X/OsQuwHTJHNk1IjZ6SesnK?=
 =?us-ascii?Q?F1tC0sk1GrzXGiSctIoc5n7feIxlChlDb4KGc9mTaM/BL3HMsA6rHvxKBu2v?=
 =?us-ascii?Q?olyM9d/VwISd9ZG5W/peLaX2AidfP/SxcmWH2JFI/MTaGZULv7uLePRQeDwJ?=
 =?us-ascii?Q?tcTNEUokVAUKJ6MEJ80xQjUBlXIsX6y5MTTm7WgaaQfDLltQq1Nkli/FEKkV?=
 =?us-ascii?Q?2GJsXm1nV76vC1e7bomSUgQpT712RryXjMG9fndLr7MLMkbLQ7pUvLmZ/VBn?=
 =?us-ascii?Q?sD4x8OPDKmfM75zFAJ0Zj2olXC4WeM+7a6RG46S3vWpYkv3qu/aY2/lC35Sk?=
 =?us-ascii?Q?zIB4Sfa707034ESXKIP1t4jppo/QkpmnbYy62SBjYV2JWIeJsvvTRvtSddEt?=
 =?us-ascii?Q?nNtzhCyS1AxGTItxG8KE1VusglC7ihuIShMprssl+6QyrDHrogF+CkkhS4+r?=
 =?us-ascii?Q?UFM/92L7vmkMu2BehULPfXiEWnexfDEzGXwBrhb6LiEhSYQKpqE/cxPu+kGB?=
 =?us-ascii?Q?k64Esw3if8IZplfdUICDKkuF473KfUD3RS4Ag7lfEapCjauY4GSGiGtz+vs4?=
 =?us-ascii?Q?uz/Vk6jcWxF3Z1mo0hHijb54nd4LWm7KiqD0p0QVJKdFOQ2247T+UMLr1MwU?=
 =?us-ascii?Q?3yAyiw8TGAXofHtOSAnbVJIB5qrnOjUHjuX0UkzD6ag834IDL4anlXMqxQD1?=
 =?us-ascii?Q?3srhrJ7wLgUEwc5gVfeqFlPo5Tw/dLwUSzPrVGZmxBVrubD26qbREzwFmurE?=
 =?us-ascii?Q?hkFH0VHD4R1fsWZPzknE4Q4ZDD/qhibZkNWUSBWef5CcrbWkF+igm0/ZPDiJ?=
 =?us-ascii?Q?38BAHWCWyl0VfENRzFj/TXdbMhML5BmR1bToqKN9+dJfY/lDDKFPehhZ2QGo?=
 =?us-ascii?Q?mik+ZEodNc4dXARfPhoZxCcbJs71peHpNvUc/Ow8QUliqvY8q6Ecdluzn0sg?=
 =?us-ascii?Q?3my7xDXFvCHJUvPcXFkRTuU1O2mrR9edFrphCEuCMJuI9p8TMFHZ6WwCSyVu?=
 =?us-ascii?Q?1UfzXeP1d2hvBWzPKvkSnmFA35NkqLwTvit5zvgkneIPeCSlRn9v1MkTMtrC?=
 =?us-ascii?Q?ASbegqrCt0XPf5ITB27i0fYYopmO6hbj1ihzsO+aopRzY5tRGxQwFYvZEs3z?=
 =?us-ascii?Q?7l1VDkDCmF1fgNRjklj3cEEjYldH89u/8z5pM6UJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230eab67-0320-4b00-984b-08dd78e20f3a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:27.2615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17XxcBPXkxXiTiyrZIVzF4BIhvaOjG7jO8A7rXOUZfIye1hR9Zieh3229UVXB7wklrYIpuGLKTfTBBgwqxgXHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
different from LS1028A ENETC (v1). In order to reuse some functions
related to the RSS table, so add .get_rss_table() and .set_rss_table()
hooks to enetc_si_ops.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
enetc v1 and v4 drivers
---
 drivers/net/ethernet/freescale/enetc/enetc.c        |  2 +-
 drivers/net/ethernet/freescale/enetc/enetc.h        | 13 +++++++++++++
 .../net/ethernet/freescale/enetc/enetc_ethtool.c    | 12 ++++++------
 drivers/net/ethernet/freescale/enetc/enetc_pf.c     |  6 ++++++
 drivers/net/ethernet/freescale/enetc/enetc_vf.c     |  6 ++++++
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 3832d2cd91ba..2a8fa455e96b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2405,7 +2405,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index b53ecc882a90..786042029b1e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -279,6 +279,19 @@ struct enetc_platform_info {
 	const struct enetc_drvdata *data;
 };
 
+struct enetc_si;
+
+/*
+ * This structure defines the some common hooks for ENETC PSI and VSI.
+ * In addition, since VSI only uses the struct enetc_si as its private
+ * driver data, so this structure also define some hooks specifically
+ * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
+ */
+struct enetc_si_ops {
+	int (*get_rss_table)(struct enetc_si *si, u32 *table, int count);
+	int (*set_rss_table)(struct enetc_si *si, const u32 *table, int count);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index ece3ae28ba82..d14182401d81 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -681,7 +681,8 @@ static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0, i;
 
 	/* return hash function */
@@ -695,8 +696,7 @@ static int enetc_get_rxfh(struct net_device *ndev,
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -715,7 +715,8 @@ static int enetc_set_rxfh(struct net_device *ndev,
 			  struct netlink_ext_ack *extack)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
@@ -724,8 +725,7 @@ static int enetc_set_rxfh(struct net_device *ndev,
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f76403f7aee8..8dabb80ec04c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -905,6 +905,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -924,6 +929,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	}
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err(&pdev->dev, "Could not get PF driver data\n");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..4fafe4e18a37 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
+};
+
 static int enetc_vf_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *ent)
 {
@@ -176,6 +181,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
+	si->ops = &enetc_vsi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err_probe(&pdev->dev, err,
-- 
2.34.1


