Return-Path: <linuxppc-dev+bounces-6674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BBA4D508
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJw2pxbz30Tm;
	Tue,  4 Mar 2025 18:40:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741074032;
	cv=pass; b=SPS/42TdYnELn7MyZ/y82kDcxKT3mY4zHxTJh5e/ou1xJCe6nSuYx0TvcVHQtwVdITtb91XLfk/dxFbUHcY37RTPTsM5CjKi5ygAdLINPIt5buuHdc1ApHfgga5/Ai7Kg1Oi1QzlmgB6OeCcxL1YKr7GKS8391AyTDU0Nv0gcEb+dFlL0ZB38CF/FirgNXQfHaE9u1Fl/cu8z5Mr55fXwuJ+dR9KH5aDMOGbkk38Tr5lebbJ1mfV44IUpmOVofCTc7z1PRS0tZC7N9UBESqweqvdIBhyCEMCEHRwiPnNAiQHYb7sMoa0RJEi/vVDd/DcyxASVYxi/gotoS3NnHFFvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741074032; c=relaxed/relaxed;
	bh=VW/qrnEyG86Az3cCgIFF6sCfe/uWdPG3zLsqFfGGouk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WCyZcK4x2FFLh8LENCcVHsd+muLOc30C4M9GXXo/MkkesrBrlDvo15ix86w+E/xkeDajSAUnaulgKwCLcRfl/HTw9BfSOU+ysLNhvbCcq4WG7PhDunfhkbkrKPLsZ0kKXt9VO4Y/3mEOfz9aj+ZdgjagnQbjsCy39WVAR5jEiqx65kKIPPS87+u1XZN+IFV03rgfqKLWwyPlW059vrsBUxF+0J197VesRu7hNbVMs/vtO5CegMKSCaD2ig7DDmHJA8xrHUD+9FMMsrXK9G2/BaozZThDLeAUDckHQlLvL0BKhkZ5Uj2UGplxCEwnTlwjmSgh5786w3ERbjyxJAVAOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=E4rEdElr; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::61f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=E4rEdElr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::61f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJv4MgHz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:40:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojfxNbcY0UivGvzepBj6Gq3WkS3nkIAWAkike7skvHME9rcUNguUqkYypJYrZed4Y/QG7gKWR7VYLgNYE07/CjdkYIQNrAwDqK+Z/31vPFbP893g5Djfvr4HchqAk9aZ6ziT2cLMdFc6cFnMroET5AnubdfD8an+BjiZzGWkh4dDeO4PtMd3hQvA2ID2JAmUQ+91IAkDe87+YYDNP65xR+Ngdl4kogAaHpLxFdRfQQ8L7tZESiWikARYxCzYLM0k/o8qmLjlowsF5uWUSLIAwSKNHa+aleiXgJ+9kD+dhwoyLee9RMenp8qJcEwzhc2iubqEREJIKCjeJ1l+phrOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW/qrnEyG86Az3cCgIFF6sCfe/uWdPG3zLsqFfGGouk=;
 b=YS+3f8sdV9x9pWGLQbeQMGXmjy4DmjcGbPJSvC2QbY/uZPzkhiEUkw+pKDFIDlfh/usMfaSXU6LHnfRVs1BOZhxcG1NCwDqMFuLX4k22uYLgdHQl6JDKWky0TXoNl8EiyzlJjdzxNIeriMPMgCVTAt8FAYWMgmUF4ega2atDr6bJGkU1+8DHtTMELUCgdBM/uzaKcXy2GYZDgUj+GxWwoCLOzi+iG/gA8eSpR2O3uaJz8lz8H+HRjfVVQZ3mQxISu1BHaauEDOkCcNHeE2zHdGa5F+lLcwKZogh6UY8ioiS2xVkO5ossZFVy7t6pW2bCPYe1TCkl07iiv88ikStv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW/qrnEyG86Az3cCgIFF6sCfe/uWdPG3zLsqFfGGouk=;
 b=E4rEdElrJQvktIsb1PVxcOPEjo8NECpZvXPuRZdt2wKbAyEfoUt7iNX59V/L4UFRtL/XCdkz651NN9+/tkIZQTObqQleHCxK8/WcMAqkUXHhE7BficWavVwpCiva93AW+fgV4VA85gudcA1wS0UFcN5b4se7KKLvmW2447ZQjfkZfehzns7R3bgIQDIpyXIsrUciyMZGzA4xvSfgQq1aSqr9/NXODY6vhKmmg4jU1k1QFYjzVYHn1B1v++rKqoVzMHG0i/RYjNarj7V/fJxiDYObAOL96MTRSqKxLvZmCmFp4Ig05xrdZvg6xOGIU7R/meWmuhNQDJkXHemdGHtIzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AS8PR04MB9191.eurprd04.prod.outlook.com (2603:10a6:20b:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 07:40:12 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:40:12 +0000
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
Subject: [PATCH v3 net-next 12/13] net: enetc: add loopback support for i.MX95 ENETC PF
Date: Tue,  4 Mar 2025 15:22:00 +0800
Message-Id: <20250304072201.1332603-13-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|AS8PR04MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 86132595-03b7-426a-2f95-08dd5aefcbe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qQByjGvh60qG9J8MVQ6mpU2UhxLpN8/Gcekx2KZMA1G51HIenjdXi1yxQoTX?=
 =?us-ascii?Q?I3poeDVvqcTmTuzgNdqVC9DItjEq6yVB0u3WhrvZ33Xxwc9aZ77Bjb/Nm1A8?=
 =?us-ascii?Q?exh7aPL447kAnBfzq/R0s07+ynr7v8ON1re9DYUapGQibv2CxPfYRI1Zxteo?=
 =?us-ascii?Q?OxxwghsVWQKURkLZIo2Q5uVJgs1zLyLNZEOvp1eA9D9XWuw7ivexK1EeEscc?=
 =?us-ascii?Q?5J36/icVnOZ8Wg0dsdYk9JZ45/1fdmcjDQo/+a3lLs/9cJ1zgf5xDCbwejsh?=
 =?us-ascii?Q?/nHPcqtWCsMjL5mvVsAZbImE0qJlw0SaUFG18Vp7VM2yngNeR0tm8RPzJg2K?=
 =?us-ascii?Q?qqHFTKHDHfdh50PQHRG8yjZ+CGkpaeYxsdBf+Z4Oq/BW6XfwtDc4GLefvc5K?=
 =?us-ascii?Q?tyxYoirBF0CctEq8fmyqJ3C4GS8dnxp8NVUn9nM5T/RbFjKQimiEWKN3JoH+?=
 =?us-ascii?Q?vuaK1HgoLvo23Vj4crNpxIan9/iJl69BGrla1ODNaaFJubfD8EHCsUfY7Aj3?=
 =?us-ascii?Q?iG4ngbgZ/TH5JsT7DrpTvvHWjQanbQgzahpZkg8JS7lVnmg7LTRh26wASVha?=
 =?us-ascii?Q?bwEeIKQAxvaolpVkF9sRggZ7yqliQqQ5wpUPw+nulYgLltkeswN9ekGT1n66?=
 =?us-ascii?Q?fJCKTenO8YlvbaBzipruLV7rgPfCkijgKiIWgyljMp8udcz/Ppe1aF6/TiJm?=
 =?us-ascii?Q?YRk3HgoziOwcS8Y9r/9zKmArOTBPuc5vvE6jjdAJgg/9CTPiGrEHgiqILOD9?=
 =?us-ascii?Q?hEmB2vNp1r/jEe/oNp1f5HlIOpbv9E7rEE1c/2mS7sVXUKVhk4aUxjjlXagt?=
 =?us-ascii?Q?G5YCgLd50wB95HUfTB+LsiSPE69ZiPUrFNwsRyt0xg7ApWaMpRNVIip14Bxu?=
 =?us-ascii?Q?6w9k+e/G6YZdn4gE71CYgwIXQjSuqR1VhuU8qk4MufJvKOEGCVwQ9kcnN6tu?=
 =?us-ascii?Q?hoQmdLJ/g2Mgd2ggfdI/uIGV59SNIsiQffPgXllDATlzV6ryPg2J3WQoXMkH?=
 =?us-ascii?Q?ZoYbCZxmqxFihHvLIyl71VWLAOuttGEAxtsQFrpSDs2EjPi8N9yCNeMoKsi2?=
 =?us-ascii?Q?c+U+XwoecvhlaDqm0KH08JA+2V5u9oaGekONt79udacjKfQDQaV8k1xIMwC4?=
 =?us-ascii?Q?MSyaf2uAUtaPjawNmpqiDN6qK6rAxg4pAYUc6EDRb89gdfph2VG9WyjBe5ZK?=
 =?us-ascii?Q?TexYfMp5OKC+Ulod6xSHGKr/7Ihwuh0euAlZftFYtdJLutPAnspd7gizq+0O?=
 =?us-ascii?Q?8V4DydtEw3nt+GMCIAMO3MZ2lUy+EE51ZcB9rp9jDGydNrQNBMBG+PZcLUv0?=
 =?us-ascii?Q?9BjSTFKTeGnhQnluZ/WEHOwUPTYahpVC1dUkpBontv/N/G63p6qi7IZDfHNN?=
 =?us-ascii?Q?KA08HAKRb5hX1cNdyxsBAo4MyYiPQQz+Fi/7h+4qV3DiE7a4CawE0RXVqY6E?=
 =?us-ascii?Q?HpBQit5hBUOj/DNqEZDw0xUpJjn/gkzn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6dNuFzncxrFEbP/1kqFkao3phZjPqFxeJfOXmTEKRLdoGK2r/Qo6+ajPkJ/H?=
 =?us-ascii?Q?Z3XcVou0nEi5mM6+QreO9shmoYW2zzeAbtkyhxcQfU8H69jV5FQvUbK5EaBv?=
 =?us-ascii?Q?eWpBZe6HIgaIZDSf1vtZEQWus9BRkT+lhngAKC2SXeIQ8qhdyVFDJCAOh0qv?=
 =?us-ascii?Q?ufImHASub/JtfDCDt37AJac/p6TN9f4ertXPXWz8SgRbtqzDBwdlPQvspmiF?=
 =?us-ascii?Q?XuCAWYpCoV3FtwCMMpzWajVz0xBAuh84B7uEOsZE83i7qAy46JkNkdiG9tME?=
 =?us-ascii?Q?OcNrtOBiNuvNigGf/24WY33xMCAbQ6donbZ9Lo5h/i6v4DTRnAtJI0wIyC0C?=
 =?us-ascii?Q?lg4vEiomIuYOf7iW4b8wAXx8vT4R5Ta187SdYzGFuE0VvhSuYswlosJmByaB?=
 =?us-ascii?Q?WIMKh51ckBcaFQJMQvdvZQ5o9FRpMaUmD7WsogxCnfgM16l7SIP3tFBgk+Iw?=
 =?us-ascii?Q?H2pYbv6ZsBl8XEVyLMqoiWGKkQPnYR6B4sQFqCk/TBVb/Ei2x5BrkdKdpQrF?=
 =?us-ascii?Q?PPs2u8OBNOqA6O8EDxF6LLeB0xIw2dJyHJHMT2ckoclAy7G9x/r3b2v3baxb?=
 =?us-ascii?Q?yVHPhlRl54S6RM0SyBUxwmzYAoETV1RMa+XgICBqWXdAKhp6Lnsbu+zgq14Y?=
 =?us-ascii?Q?EuS1xYtspmKc6gi46y/ZMdJsuyLKbSnxCBg75GWuS1jsTCNQdXCaJ5+p3vSX?=
 =?us-ascii?Q?tVTrZATSLd0FRXuA65Q7JuF/5AznoWqbLBVpENI0Zzli99R59kRxLJjdSZTO?=
 =?us-ascii?Q?dqc2FY9gr83CjidkXDfKP7kWK9m3pc2yAA88E2ObmCgbDKmxK7rUs+8wYVm0?=
 =?us-ascii?Q?RtBFY/1ch7YQhlUlumx6ZAkZnvQ3h0fakl9J6Vij0QmaknuZrClbjG0KVcVs?=
 =?us-ascii?Q?81N0Ms/xtNu0C1WjoJPZJ1p/EUsax7WXf0EHD7FzJ5L+UDcaIUQaELhMgrv1?=
 =?us-ascii?Q?Uk1NODwlwrKwv8JcKxSgt0o/8TricQsduV7UK/BUhheqHpStwH3tqigyBjKC?=
 =?us-ascii?Q?c1nqng/2kl+PNd1x5lDR+IaiGBo/sDTG0aIn3nFJj6LoNwT+hKvzEiZE8tb1?=
 =?us-ascii?Q?ijkVyy46uIhEa+vww1sr6W9L5ojNfd7bh1XrsFc/0bU7uPz8JMND0JX/dn6P?=
 =?us-ascii?Q?5UAqMS2ouw5LNcQxW0sZJ5sMOf3mWI8EUpnAkEa9K39p3/0p5rL5z7JbARCV?=
 =?us-ascii?Q?6X0AKE6L0Mj6liVJ2IhjolmresqOYipw3kdokicLLKKTaaPw+PwSXCcIuQyD?=
 =?us-ascii?Q?sBT7rl3pYSTr8aJipKy33Vzuq98UtVyXV71qafrEqmmnVG+qwX1BbWetStar?=
 =?us-ascii?Q?Uw+Ryw8xaBCOCXksQL2SmRXCzktOUdN7/rVWWP0pdWmKrYaFBbhGftUzYbls?=
 =?us-ascii?Q?ZHja8KHvlXPoJY+uMNmCFzlTuArG3rZtHZwxHgdQx7PT8yDHhJGhG99QDlk/?=
 =?us-ascii?Q?COQd6+PgI7Xczei9Rw5s33bKi+AJKNr3OvtlP4zsKDrw7SidqJ8V1caBF7mo?=
 =?us-ascii?Q?tD001hKLWE5U1KP5EwcwSqPqTa+AjK8mS8slAxCIN8D21T/q35PgtxWXgajx?=
 =?us-ascii?Q?BGLdMfi1mJ2tCTQcRxQpS69F4rfb3+epi8rTfCYJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86132595-03b7-426a-2f95-08dd5aefcbe2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:40:12.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UNG46VXDt412QiZ/h+J7YtGyafVK7VfuuGtVoTtNiZeX2L9bj6qJq/vB2RQvMfGM77l64EMazxevFh4gjx+bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9191
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add internal loopback support for i.MX95 ENETC PF, the default loopback
mode is MAC level loopback, the MAC Tx data is looped back onto the Rx.
The MAC interface runs at a fixed 1:8 ratio of NETC clock in MAC-level
loopback mode, with no dependency on Tx clock.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_pf.c   | 18 ++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_pf_common.c |  4 +---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index e08d06e22898..ea859792ccfa 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -108,6 +108,21 @@ static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
 	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
 }
 
+static void enetc4_pf_set_loopback(struct net_device *ndev, bool en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+	u32 val;
+
+	val = enetc_port_mac_rd(si, ENETC4_PM_CMD_CFG(0));
+	val = u32_replace_bits(val, en ? 1 : 0, PM_CMD_CFG_LOOP_EN);
+	/* Default to select MAC level loopback mode if loopback is enabled. */
+	val = u32_replace_bits(val, en ? LPBCK_MODE_MAC_LEVEL : 0,
+			       PM_CMD_CFG_LPBK_MODE);
+
+	enetc_port_mac_wr(si, ENETC4_PM_CMD_CFG(0), val);
+}
+
 static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
 {
 	struct enetc_mac_list_entry *entry;
@@ -710,6 +725,9 @@ static int enetc4_pf_set_features(struct net_device *ndev,
 		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
 	}
 
+	if (changed & NETIF_F_LOOPBACK)
+		enetc4_pf_set_loopback(ndev, !!(features & NETIF_F_LOOPBACK));
+
 	enetc_set_features(ndev, features);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3f7ccc482301..0a2b8769a175 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -134,10 +134,8 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
-	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~NETIF_F_LOOPBACK;
+	if (!is_enetc_rev1(si))
 		goto end;
-	}
 
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-- 
2.34.1


