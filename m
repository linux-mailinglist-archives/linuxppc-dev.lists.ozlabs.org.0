Return-Path: <linuxppc-dev+bounces-6868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC6A5B8CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhF4zd8z3bn1;
	Tue, 11 Mar 2025 16:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672621;
	cv=pass; b=UfntSWQq7SOYm/nmPnsp4TJt+dSfTffFrWfvqltTMe6wM1lvG2zU590lYPgko7v6LvXs3chNYX3JFd/nnB93WSFZO79F7/WzI6b58/sO/SpZFMiU4fNIjLUNPwkt9RXqPCQvRmlNsggeGySRb0gkUNYubwtWEaI5O80a3AzGGCZQKsQoHI5ra0WqcRSmarhRmIjkwUjuLbSYgJOYCGH8wtQkg8ck3QwNm6wD1yf5Y46OTJYGe7uwzejLddEzIYpTSXeRf479pYsK8PlCqq1hygtOYSZez/BQU9rWlHtQFy4HGOBW84H4agHgehaOSUql5bP+gFzmx8lFN6agcBzrCA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672621; c=relaxed/relaxed;
	bh=K5QjmWheboFtAc1mU/6L4M6wi2onqIZsYVjlcvkcBEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L4iNi4V/zCwCfF+aK0Yi2B4SVWwyMWmNIfsdx70JoJmHhcVyZmRv/aX5X8KWcbxieIyT+w0LQNa7h0CCJWBd58/yQHwbp/ztwkgofN0DKO3sfGdW5oyXHvQ5aWbF1chQlha1vIKeZVzHIp2YPFeCon/uZjMIgnGLQN436aG5yY2xUNKTv3hiAQI5SqsUZjhDiyvpC+9ueVJsWmOP0TZ1PEjelxGfQDsiiupdo7mf/ZpI+D3v+oW3HaM+W8ITfDNa9gGG52KdsKUBLq4RlNZUiBNhV+QTndkTQQKNvzGgE8DwyDM3/+JwN1TroirS/0+7m4V4sCSm5pxde0BcxiHvMw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aMWNHMPg; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aMWNHMPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhD4grzz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=carhrPAPJaKidiO5P2eIa1/fY9yqmcCrp/AOhg8mqrRfiiwl+xZkUIzKmPYe/9OOTG+CUg4xTIh8j8GI0VkhX5xL8hR4rVuTIv/RaPf6kxJr4nA+Fygrz8NXqaDob6WCHkiV7AmNIzZtaTLOagW+fQfREJOFpdLUQ54YmkCbuQaaPn/lwFmJDNoFABk5Pd5Khwbv2Am7vJnhED6RJJKT9PEvb1yR5xTBSFE4CLeVYy0W2QFvUBVDTeOF5LO7h8KFl2j68iL0nPx0jJza9Um3uYVVqOM58hagf2/MR/JtLDYwIxvX+bFg1K5Z9ps0zFuNrK/b4SUD5aVBD9xHfolJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5QjmWheboFtAc1mU/6L4M6wi2onqIZsYVjlcvkcBEg=;
 b=NOQ6tSkZj7SUImyhwTrNMl2eCH2j/KTJ4gdIcKn9ETYD/JpdkQ8NaOiwVo1xF9WBurlEzyW9v3gLrGyd1Eo4Ax1548rpqzK4bqVbt9Q3fKubcePm7ZWaxU+aXg76dg6cRJ0A1HPHdnoqK3TjVIEfHge6RbVmGnWi4D4b6EvFOB1B+kzfpQTsG5KKBEZHkaFxA9j85rIEg+DNiM7bOqjnNHJ81OPQ0aqcYwXbEraaJjXDYnZvDR785G9aviEFhHE1w6EMe4Mz06bp34eXCDGiZdImGGVibUV5gnJGmoT3DhQuniNS6x+PAeyRJpfrFQc9hu5cTJF4d2o+L1Cp1UCfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5QjmWheboFtAc1mU/6L4M6wi2onqIZsYVjlcvkcBEg=;
 b=aMWNHMPgyQyh/NNmrWg65AlqhzK3X4XzzCa0F/mmS6w4RPIcWqmKglfWj8uFi0jtf+my0/MCQeU9UKnX6EXgRbkBl+b1mx/UGiZIAlM5p//eBNKkHaIJaLVD6Eg/2pAMmZumtPgJUfu/cRj56tFVAH2RyFT3poDU/vWQbUUelrEshZmLCcSagwjJobh4nDKbt1QmH7yw9SR6W+ICVu/0bILJL/l36VA0YRH3Do6DCfx6MC9Q06g7QsSX7x7Rds1W68x0IjOvBWxzyn6AZ+CFvug9ZkCiNyp7kOcYJtJLZcrD9+QSmLJBLF1YySHCFHf36ANnZCa2oA6QK1DYMDc4+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:35 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:35 +0000
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
Subject: [PATCH v4 net-next 07/14] net: enetc: make enetc_set_rss_key() reusable
Date: Tue, 11 Mar 2025 13:38:23 +0800
Message-Id: <20250311053830.1516523-8-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 5173ee93-580f-4ac9-93df-08dd60617b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n+lGPzPxldbDiiGTUBJ7QhKf8qwO/bFhQp6b62O/1XHniGkE7kcTZ+jUiQ/E?=
 =?us-ascii?Q?HdI3Q4b9Zhb42K+71l7q000ARV+LnB6dvOPqnUT6BB/zzKRNZvhb/KejvUGq?=
 =?us-ascii?Q?p9kE+u917u7b8/Tjeysa2O32dbff2medvQ3RHpUON+5SlDzDyCxmEbimuEl0?=
 =?us-ascii?Q?cuQgqg9A7hWXn9jz7Y3USgsiMTBlwziawlwD3DTgzcsLM1a6x9xIAEqzSHaT?=
 =?us-ascii?Q?eIDMI8ivKqV0ZNe2NwC3DS3mJjioCpv7knGcn31HlnILYOCRFwNJ9ZZ+LfIN?=
 =?us-ascii?Q?Tqcj6ag0BZvovA52VXEgYZRNWSdOgIH6YRS2BZ0iJFA+sI/bn1GYBwgoqch3?=
 =?us-ascii?Q?AfRqnM9LEV6sBe49pQgWdGZ2FVUsghEYQw1DfxLx5kCK9A3slM0Yjd2608ZJ?=
 =?us-ascii?Q?8utpvieAcrHdYK9XnKTv2WLZtTl+UgAFcKRWW59T2sMoRVj3rdkDunjJLO6/?=
 =?us-ascii?Q?YG3Vw1zmpRmntp6x/g6eLYTf5wsCeAvIjd0I/sneo1/qCS57op9dh0fMJJrW?=
 =?us-ascii?Q?HYu9UKwefG3bVZPmeejFI+irNbtifkrredgXct7FIZzKZoQJKIy72tNpxQTy?=
 =?us-ascii?Q?z1d79QE8UlRDMbpJokjwW2Aqi8e3eTcF7Y5+wpEj913qjWoU/GOyPPRt/umb?=
 =?us-ascii?Q?qjtazZR44cTZn9Bms4FGFOcKJ2jzKknA5P5g7KZQfN3uo+UVcWQB892IakRl?=
 =?us-ascii?Q?QSzra6EiyF3NbeBgsdqNrgNum0pQaf4sa6px15YFUH9OtbkmMVwL8PeMhMUY?=
 =?us-ascii?Q?9xycENJzdu2auuzNYaALYaKAcMlihW6lozPvyPKtPa9FO1qv3p0GH9pjawJO?=
 =?us-ascii?Q?72bW1fmYUupxlwUezsRoUcZRGZX3VfUOGGpKPleDhHxst2v6Wcu/T9/jhnLP?=
 =?us-ascii?Q?nJC4aGij2HKE900DZmmwWIoGMHg747QrxiK2tYBk/+dztnDxw2BZjc9oAC96?=
 =?us-ascii?Q?zeQ7ZHm4a/vwrA/9CrUoTQVExY3SNAub/yPb0A1SRCMlWaRfwhdCr4QvnmuD?=
 =?us-ascii?Q?upTo8PfcMHtieGe6lYXD7Bq5skHVlSPDdu0eZxziFvmb5xcPoc7mSAfA9TPM?=
 =?us-ascii?Q?Xheq3XlGGlNBjuLjYO1Z5TywgwyJ1o+fP618XqMBjcURxTpCP3xgcjyDjF9d?=
 =?us-ascii?Q?9sremPqMSUhYLuW9ueE3HmXHw9bqbrQQ9qsvR0Pr0dfLlFNUTy+uF2vpeFFN?=
 =?us-ascii?Q?yuKxSJas23DX+zUeQMV4kNK4FAmK0IZ0DbZ5/UsnR7JsSOVi9ZtU1pMgz7u7?=
 =?us-ascii?Q?7HQf0O4mg7vx8rMhd/f3IFA1SWgGnN83Cg6RO+SJwwFoFXTgeq4ocL8B7YJM?=
 =?us-ascii?Q?4w0BHA9tw1m/Hb+S2I3Mgkqssf6oAz+OiUS5jopYzIncUnvJZJOOcnlhFXvW?=
 =?us-ascii?Q?ODAwzpaGoYpikE4kJ3Ok4vj7FR1r3fQRYWnNYbzz2s5b8GLM4eIvZF3cttnM?=
 =?us-ascii?Q?NwWfyniXu5Dps7VH3kpMnY0flrJ1XIxV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Ln4m8fMMEqXUJ7eVEsEpveoTNtchU8QL3YGO9MXIr/hgGlWJ7NhxufA2WbM?=
 =?us-ascii?Q?rot7qlaAWTCEY2bJHE+zY/YppuNnQZEnbt/DEFW/pmHWTJvoM/4yTZjWSa7x?=
 =?us-ascii?Q?TUc8RKLgfQF6E8zegP6+KVLsPnctxu8peglBNYxoJ/+R7Gi8ggN1TW6mtzsg?=
 =?us-ascii?Q?QLJDZlxWYi9+llkZdOymn5GxVoRGvGsxMFBXrzA4OrWyCpCjowV0HpofHpUW?=
 =?us-ascii?Q?8Pidc5tAu2wZTeEaZEUa7bTynjcLrdD6uaMb/Z6FL4v03ccFSaYZJwWkNN3h?=
 =?us-ascii?Q?ZDhlv8s36G0zZZxzMUrOw+Z3t4sTjDQdtP4sP27UtvqbaXAJRmd19m4ab7+8?=
 =?us-ascii?Q?sw3dw/LAbH+KdtRKzjiXpWuHakA+9j4wkpC+7j4UNYLpFxM8OzA5RNY1lWXF?=
 =?us-ascii?Q?sv+o+5z67kghXhnsfLNnhdJ63RUPc09pDIHiJLVfAPE2TqQn01xQ8HxFdL3C?=
 =?us-ascii?Q?6bWXVq7zGPwFOIkG1DcjB2CQDsa6YQCFbRH7eBBqgQjwajfjfU/cjKlXWCCr?=
 =?us-ascii?Q?DO994+/hZgEOYAlOdIEQygP69PQF326ZxV9lnf7X8sthJKML3u/k2sqww4er?=
 =?us-ascii?Q?6w7ipetySXJh8NKoUKMZnngWLLtZ3GxqpZZQdPnWMwM8pBD6K71VQ1bx3rl8?=
 =?us-ascii?Q?mwuuT8rWmVkHmTOTK38UUbyk6w59qP0iJy0r21sJeZJpK0ajdn5IZsBkPt5V?=
 =?us-ascii?Q?rnhDry0pEHueNB+qCn55oDdc3ekaGmNTkaTQhfkq4FXZD3yIcevFleZWvh40?=
 =?us-ascii?Q?q+h20Mehh1kYTB87ZNKv1P+J9t3zAAqlgZsfEJtnjJt0J7bByJIXq0gT5I5B?=
 =?us-ascii?Q?q0XOzjgq0dQR5eSUautIw5LLArabZ+laAQOtdJyS3NEfCfV4wiJqJHwM9a6q?=
 =?us-ascii?Q?iK0oL+ztWPW5CoNKfNTvg88Gk8jcMzC/9Esd2eeRb1sxJGXe1E8kYrWMqNsu?=
 =?us-ascii?Q?WvitqlYsHbU6a64jd51Vrd9lhjBGrwzRh53ciUZEbwkYYH1GsOqmy7ffsUUE?=
 =?us-ascii?Q?8EdLmRKHP5FbxftBESq6Z3mQ7smY5KUzL1DrHxr/PZ+acK4QlfC59YCnKj7u?=
 =?us-ascii?Q?Xf6lXXm/LOmgWSMLp2NWfySk2jyeZQLyMGdT6NNzd/hOfv0CPcPuvZxHCb1q?=
 =?us-ascii?Q?X/y0WigGLfCmhYgVok6qXa+K/cwSPCmvduVaSgqqFK+9DBJyJX7Gt9r7Bfs0?=
 =?us-ascii?Q?wjcSNQZYTwXhf6QbdpUA1qCGapmRYpgLJ9dJkGsLM3I8KXH6D2ktm4eNWlmq?=
 =?us-ascii?Q?Q0bdiVLN2QX7PPGKp0J3l3wjZDD+O0H1HRU9oSpl3G7Rt2FmhkuvLW2LG2pm?=
 =?us-ascii?Q?gXl9DrenMqE3K9SxW8gc+50+OeJ1MCHWMCgUy44yc0wj9MW2w4/JY2VzAnUw?=
 =?us-ascii?Q?Hncn0oDe0VgNiYDGVuR6p1I9dARHUbaJrKMFCQGV5/EflFWki1yu3lpACzO1?=
 =?us-ascii?Q?WmDnwzFWk0r5ntRk6VF8Els/6z9HlNMbMcTW7m/JOvzp9ETuzxN8M01cW50V?=
 =?us-ascii?Q?oXY4VPH+NmFDMlXm2N6MtTeHT57W04IHN64CwkWcK8HLxE7zMHFDosCuG6N0?=
 =?us-ascii?Q?VLBTMl5A0KYXwg4s7aTSHCnuCoCYHb2w8mzs0XJP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5173ee93-580f-4ac9-93df-08dd60617b6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:35.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gC/xgyiZXk1zRlWIwxcH293ARzDJgTjuOzbDZ952UF3US1h3bhT6CJd9wpiEsuik7Xqd4Ac15J6OvK9LUpkj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the offset of the RSS key registers of i.MX95 ENETC is different
from that of LS1028A, so add enetc_get_rss_key_base() to get the base
offset for the different chips, so that enetc_set_rss_key() can be
reused for this trivial.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 11 +----------
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 19 ++++++++++++++-----
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index deda386b20a0..a3ce324c716c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -539,7 +539,7 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index a98ed059a83f..f991e1aae85c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -583,22 +583,13 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
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
 static void enetc4_set_default_rss_key(struct enetc_pf *pf)
 {
 	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
-	struct enetc_hw *hw = &pf->si->hw;
 
 	/* set up hash key */
 	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc4_set_rss_key(hw, hash_key);
+	enetc_set_rss_key(pf->si, hash_key);
 }
 
 static void enetc4_enable_trx(struct enetc_pf *pf)
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
index 097a5b50e448..38ec7657b9aa 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -523,7 +523,7 @@ static void enetc_configure_port(struct enetc_pf *pf)
 
 	/* set up hash key */
 	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc_set_rss_key(hw, hash_key);
+	enetc_set_rss_key(pf->si, hash_key);
 
 	/* split up RFS entries */
 	enetc_port_assign_rfs_entries(pf->si);
-- 
2.34.1


