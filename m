Return-Path: <linuxppc-dev+bounces-5133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB081A0B16C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:41:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm1r02JWz3c5q;
	Mon, 13 Jan 2025 19:41:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757663;
	cv=pass; b=koilJW+HcjXJ06uoEanavGF09w7+1Xha3YzMB+MEknahmRyok/IOaIMXsS8+NIzqg55TdVXLf3nUJQrySwasHznPNyjuPnczJwt3qaCq9Fy3CW9S09u0Kr/Nfma1smXadCXGVcd3sS4pg104hZlRvVbI916jLQk1kyxKjnWk/TluBqXtjzT/QJ4bpmU0lKK0ibiwvZKT+w9g74s26pmH6p55RpLrmqf1OX9xm2uVW4oCnjL5ErzVnSVuGhYmC32eLyhaj/zUOngP9fggzGtxtV0xIZtQxswv0B1MBtHqd42WnAeeUoLHBclinHKo6nmn9a3elZ8VRh1NZcrpjbMmnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757663; c=relaxed/relaxed;
	bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KAZtkat3u/mXm2RADpgZIds+A6EWn/bERXFLvUTF1V0oDBWndRFPsQ6hKH1JhgFHab7k0cbqD0hPPhhS1gvM1v9RsAH4kx9h7bkKclPyoDKErae52fn01SiraUORHK4oeEvOUE8jNN18d9czq6nZG0OHdJ4KjD4/sUCpX7gOCDu5gU4Xuw511l89VS45+rAEsAg0i7hISLr2FPx4OCRYEKu89zBIUYR89d/zKDlhvZcyJ5wPVYjAiYjqkj5U8Rk9jlLibguydduRgEVXsQzZW3y3FvkqmJspaZoTKNgplak3jHPGueZXf5PMP30Llba8uUk6AjUz87e8F2CCHEx5Cw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SCRkxndy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SCRkxndy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm1q2fKjz3cYL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:41:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7MOE0kkcaIUiMJ3o7L8zHCTOYW8NuVBJQxw9Cnx5jG4muKSnZ21IpwF4EknG6Hl7xYeZKj3TOq14AhEMg/795fN78jQo8hiOjI38KQMF62LmLcSSUQs/9igNkI7Ysbpd8zM8TJ0eUDnZStmbmGNioCll2efoak1dUodwde2F6D3QqkYpa9enPHFLqLdopDbBqRxCEi26p8TO9M2aUbBDhQ7FE35dR+QKptLuE8UDF+54mHQt9XZ00gModFN/Jcvs7JmQbknc7TDOwt9VWbXumvXXnuAQNqlcB8Abyk16WqhcjXOX7fbDMlvDUtGNmcWdtbD0OZAAgbAiaI4B5dIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
 b=Js/ACnxHa/oZAuoiJ1G5LEFvH5QWE9pjwwFZdlb9HR8uVLfbkb7zJA/5jzt9ireBoXxQ1iP/k3fRykQsGsCdFIFee9n4LeNm45YO4LtG96dEDiK+BrWyfIE3t8ZqCi6slRA5xatNT7j+dqtIMobj6mbb8rwaP5wdhY8yVuJRi3r+1kOb/Dhs436Rssz4KbYlSsSIeuDP9A4hZFxz2lbwCi4M1oVDAH93KA8xrwHHY2iUJPer2ss5e8gf0c7ZtQAr65kfX7h4HQ5M9rZO2X7bPO1ytbLhw1HNPYZHUyvwp7GaHi82XQKMVvY0OmGFMNDPczpxCJ1OEZAJxOUvE1f4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
 b=SCRkxndy+qBweyqLbqLhrsK57glSd6aARKjcaDn4d/dt9VvvHDzcUr+L+C8becIyXIzMLkOSb91PgoyZ6zqFBGV0fpOwlwTDs6+QiGdTC5kHeN7AoKIQaV7dlUBCSWIxiP/42YPbk0oBdk96joLnQczIn2K81HAMvd4gRedPV706VDiae20rAUU5YOXt+AkZ6qpUdaPeRhBCMwKdqZrU18FRAWh9EuFygbyU2zqtJAEnmPFyT3OmZ/zV4G15S0ZzsKvMHHLoz6fyf3YDiL9vW83OGdywTbvRmDQtsrXmV6no3HbS9PYuH04+2wp5nJlnTIwDoI4GoThxKapD1+M9+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:44 +0000
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
Subject: [PATCH v2 net-next 13/13] MAINTAINERS: add new file ntmp.h to ENETC driver
Date: Mon, 13 Jan 2025 16:22:45 +0800
Message-Id: <20250113082245.2332775-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e021ad-93ab-4d3b-8b04-08dd33adf7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zQTZ0qrkACURqewpmBF+vq7cHPHpv76x2ItPeWp3Ob3lnG4EmVVAaS5/PZaA?=
 =?us-ascii?Q?ASDsOfMCV3v39e6bbSB6OXhywvtQPrboJmM6WoFl25sreqpxnsLZJ8uBJ0ym?=
 =?us-ascii?Q?APVSIZ+PrUUZdVjFLhWQ4/uHBlGpdDf1GwtI9JEMpycbsKcy+b8St5UjQCMG?=
 =?us-ascii?Q?chp+rfKA1//gKQM7tNhhBHIzohtsDJKxdLkoPSBtiTgrLDeX+ffo5Ba1hL1j?=
 =?us-ascii?Q?Lm/SbWYfurWhMYyrPCnJteDlvhyGWgbo45f2Vhs6ZG3t+q6VF4IIH6Wrl284?=
 =?us-ascii?Q?gAIaQi5FwQMaMqTmrUioGCfK6S9cZGX/LVcOobqz0xL222JVWdhRsdDeY/H5?=
 =?us-ascii?Q?1wGwWk8cboMt4XQDrk38upwNZ6gTJu0ToU2DQfYdrRVwwh4AKNzMEl5CQsdG?=
 =?us-ascii?Q?l4rf39NAlZKZmJ5rHr1bLA0dsDkeJrI4WQ5KXwsHu0H2Ca5hoT3IKcQe8I6o?=
 =?us-ascii?Q?SxH6B4TRsc4gQYmeV7RA8KNdFKKHX9i2KBsLWREUo8u3CXobtQXI1WGTzbRg?=
 =?us-ascii?Q?kszYnAgE3K+AO38sapNOmxLWOA30eGrqEJn6QHFEoLqG5TJmSO6KIsMQX69m?=
 =?us-ascii?Q?053mH2wKfhmHagl62K7sbM9p3mmJuiq/q+WZH0E+dYyRyTHos9VY9kq5H0FG?=
 =?us-ascii?Q?eS2Tmoz7LDmpGGhCInpPRGFi6zNOZZTi10QgE34tYJDEZXU+yAa/3kkzM0Nu?=
 =?us-ascii?Q?ePoWg8J9UqIKbgtkmV3lUx6uPnMgPQwQlhxNdnVuI6KQH6v5plRndRO7Wr8e?=
 =?us-ascii?Q?R13bgT413zsXwvtjMalgbzn2jrE8tsS1T8ZfXKUQ9t0aft7kyju5Q8cTogJk?=
 =?us-ascii?Q?+VaN4krhrNVfcv06UEZ8aWm6gG2ldCtED2KZ7okNrFycVo007tk9y0fmDyBI?=
 =?us-ascii?Q?NRr98+jS8XHZtFiKvCIOzc0DJYWstKiOoujVybgdWno1X5fSwQkBDYPp0eUC?=
 =?us-ascii?Q?ZmdtD9nO91RhMMfQ30OKu3Q6IG/aS1xsscL4YMWGVvD8B84zCAcrqYrEPXUh?=
 =?us-ascii?Q?IalgaSJyZ3l+69cAdc0CS6piZqohw3WLjzA0vMkOn7Vq5X5Md3YtZqmTj0kj?=
 =?us-ascii?Q?SzIR6ijAdZPKH0qYMB/r3d7J0zgVUR7kPJ39H9GWmGgunG8whn/FjHeQOra6?=
 =?us-ascii?Q?Fb008eoSNbNFDqeURyFcKth3JOzjAJPqWLpgYGT4ejjbAkVQ+KwkvG4HthRE?=
 =?us-ascii?Q?VFVlwrzBa9fkBmCkNB1mXUMhrn77vyEkx1sdMOHy9FJWQo5Zj9X/WbuCTMyC?=
 =?us-ascii?Q?06SQ+SEkKhlpz2qoLn5phc5w8nY3gKqwiII6vzFc6lIFAgJIoFoeBl7Z9uRK?=
 =?us-ascii?Q?5I16OWE0r2sEkx8U4aq4M4qgo1cgsd+UJrw6xI7SWxAFk7XNF+ZjQkubsJHk?=
 =?us-ascii?Q?S19vaev22bpBSQKwxObT/lyladFmODltMX7xyK2+5CNg0MrvGbTLq5odOuaR?=
 =?us-ascii?Q?3izYCUdbRvjTt2nBIghrKP0mgv0/ydiq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/iCR7LmlEx/ZyRBaWfJm2OIuzG7+c7yV6q+zzGMUv+tdq+IY2g0ASqdUyATA?=
 =?us-ascii?Q?zzhFpRu0AdlD87RdgWZ8sbitvRfrnh5naWHKE5gLf4A34ECHcXHd3TinwmsV?=
 =?us-ascii?Q?tNt0qpRwQ8UCsBZO1JUiE6PP/dlIbNyv/OzwmG9W8TjFJb6ppIcuc2+UYCZT?=
 =?us-ascii?Q?rwcEGpuIBWg7mrJTsU12Otfs++b2RbktwANd3RBhFhbbyJFtY2oNlXua061a?=
 =?us-ascii?Q?LudWlcuJ7gx9Fqf6kwhbiXNgfpzgVgZKGtUfuE7iyyBs8az9TY/LYMHtxljM?=
 =?us-ascii?Q?15LeckE97JDvYig6Y5tfBpBZj0qsJafZCS7fzE7qNDTo1nXaIQWdYPsdlInU?=
 =?us-ascii?Q?3xM0G8XQoCTLk94UF1fW8fZra42XtAiSngV0CMXQnQ2ZX/cTzJXdJgc+X3Bz?=
 =?us-ascii?Q?SKJY+nzo6EkELzlSXUUKLj5jABBtRrhFnQEgkKtyXK5wCofA8GvVjRv9AFXh?=
 =?us-ascii?Q?2WAUGktUQ2nfL6Yfyqa5ydJ3GChhdQnyXxhZEQTc6+f1sMcFfPWTTI3EqB3p?=
 =?us-ascii?Q?dUZnLea+AEIvQuccDTj9UmxxDSB60U8uXSzEKKuCvYmqUiUV1/xZuetRS2qh?=
 =?us-ascii?Q?RCLqovhzfpTf17MXowVAaCPv0tOWXNjhVrfTvjcJuECANWzpyrFB01qkf0LB?=
 =?us-ascii?Q?9nIRLNuAThrwN5NGglIedD/eEMEYWB39s4JmspMAjqZ/ynqx7J02Un4Xs+j7?=
 =?us-ascii?Q?qk+Dcx1HSNCuIPccUMjG16iyQ1Wv9rdCbhqx450x9EZI9OXsv5djoUYuUI/K?=
 =?us-ascii?Q?le/HBh/YAoNratm4kvRNIePiinRj+RdbcXP5ZOlyUPBIiwb+jARHBnTR6vs8?=
 =?us-ascii?Q?SExP/DbNjyAYXgVGVCKimkCqQ+5OXef3DiBW8/0KS650yY0db8LqMBeSPC/l?=
 =?us-ascii?Q?03qjgEq5v7Ith0nmiiY1Kf8x5O+DtgIcSe4FLvt2akxY+Vx0IrTmC8oCaEqU?=
 =?us-ascii?Q?reKF9wDtc3X7u5P2kKVzvQjmqMCDfosKEJzLnQPG9xrbgUj5RukCDlK8XuMH?=
 =?us-ascii?Q?XI4wVVLEh9ZS+ItfYj1BfVkATktKUnXoenyT1ABF6vlUVfrPT8wtHjPRSeVD?=
 =?us-ascii?Q?jJ71J9bG8db6b3LC49waenoZczBJsg2zKjKIbX9a7zVQoOwqsL8lEeWjyH+X?=
 =?us-ascii?Q?nCL/P43B78f6cWHRAZjv4mSnREh8agvpqcaT8OdcVM93QFqWTwV6jryobnTX?=
 =?us-ascii?Q?HdWk+TuM6nkRJWENbdor1xVOdSLJovXAlHikozwnZOSrgWBh2nSDhsYZYrx4?=
 =?us-ascii?Q?1tEMHJSM+eYKVunkycI+7sbtjvvDJ0q+4tIweFxS3kwuW+DbPolXeKdG+dBW?=
 =?us-ascii?Q?TiFkaSeAVoQ7Re4wh+iQBHo3r7hbN+unaJXvch5BvRSjrQX42Sckln4j1OIa?=
 =?us-ascii?Q?lTNvBNRdWfiSl/ENEenSvaE4tXWjdHv1Z13bN3CDcZUI7O1jd4Od1dq8UOo4?=
 =?us-ascii?Q?DAwxc/rT8lR5NPO72Jf3qjm+P5cNdGAbGasToKIpgRTKJ0lZdZJvY2nli1TO?=
 =?us-ascii?Q?xlZ3Uy7YNW8JDDx0sIY+G4GjavcApKwyRgT+fqkIKDDr2vwXy7jzf+qCt+Dx?=
 =?us-ascii?Q?3OiSzkpB8RecFBKILXLevihe+2rR0G7i9FCGXlbc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e021ad-93ab-4d3b-8b04-08dd33adf7f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:44.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEb/AFjOlSMq0TRaDZC6MjmusLt71a8KTONStf+YzAM1RbYf/cp4hYnOTFOQ/dZD+VsJn1g1gY7nvrZ9xFy3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add new file ntmp.h. to ENETC driver.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1579124ef426..ac28154f7eb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9099,6 +9099,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
-- 
2.34.1


