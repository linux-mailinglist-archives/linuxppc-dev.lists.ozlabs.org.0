Return-Path: <linuxppc-dev+bounces-5122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100AA0B158
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0p2Ly3z3cCK;
	Mon, 13 Jan 2025 19:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757610;
	cv=pass; b=YjvbW6VrUd9Gvu0fbriN8t2kFAPVxELbxFu1PlaAEesTwXBVGz+SKZYDVrOqOLZ4sJ2i+bhwQ9N+lCbq7LdcBWAiRrSkpk9WdG90fn4Z6BQX7f19PxTTfJAFQGnGDdgQq+O07JUNpViskUw7zplmQ7DmKbv0XgC02jxBpBt+PB/lRz5Sf7TBW3biIKqYRnS0XHg57VECTrQRz9ixvYY4LZf1W21U0nU3MEy6wFZa72ZxbM+FJx7ywOE9fyLwTVGW50nqmy8KTP/cw+SbnN84BlrcboFmUF0CnjOYVmp4u8dYcPJ2EqWW5ANxrlTRIO885KSvUmGM5tUTIYwKGxOGcA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757610; c=relaxed/relaxed;
	bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kf6QhGN8mb6hnkkXN6EpzU5Q31T4l7KaFVGQMwAbc+DJKaMpNke56Tn5AfP3B+2UfFKjuuvRt29Sm2l902/m/0g1M16egM3wFJ7+WD3UnmxNXaQeLfkdAJLaKxw441tH7h0AWFzv2/qrS89snNR4eF4JuCW1I7TtUcKaEd+c+qnllNI93XDKH7pH0cfibmxYztB0lb58cl6soDdjACxGNRF4yPFHJ9wQz0aXXFpJmWoOv71vwuxzfHcBidNRwF2Gqk+kJrZfYBdVldP9ZsjC2Yvm+W2mQ+QJXdAlxCVLycajexF7qRfD/zvn7bYOo/40UwBlXKKPYb1WU0zHD/b5Lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Iss7bxfO; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Iss7bxfO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0m3r0wz305C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovPFtQpBW5kW07WkqwId8XKDNy8Z80w+xniWg7DuTDSbqK1vn7ZcSZm+zQH8TagzI/QVqs76L50RYZiNs7/UOf4C7YDZTF+Ly+ph09DK/ANtb+IzqlUfIJDlXlK0S1VBk0leSd2hc1jw6ua8nJQe1hoKAzmZDRZIuS8xlTh9EZwDoqdvTMyOGfThvB0/E+duRLcEt0Br8MDjSejJMv+kXbH4A1BoLkqeG2RYFkEHGgXz/wa0vQEIFKeDeftn2p3Wq0vLSyFlrRTU2akXpMjORDSnbHebfmNUwjLimjL7orw51wQVMjI87ta1qglq7moCpPtYRIP0luGE03hbWWk9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
 b=Y7dP0SJMiu8DypX1+EGHnh1bFhAKmgHJl31XWbb4l2WAmpRPx2hwklu71zEkeRvw9d8Cz/IQKiVnhlRGiRLFnlIoRYKRjMFODkeNbDRfiasuQyWj7T3Gj1sppdwC2rsP0U7ti1Hg0Ie57U52ZDz+yOis66ke8SbxrIfRecKgmK998mU0UH6VxQPwYyjXqAU46RIfcxT3k1uBlBY9cD0NZyhJ1BnuRKRFNC4DSMaoUVUGoPZAarHC7XXQ5G2N5GP1owCBYHp6IpKYp6MB/2VmFJE5FnBuZxpfUdQW4TXYXc7SjEx+wsdQGNHK1sG6jJgNiqdu03diBme+Xg5gfMJ08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
 b=Iss7bxfO1UECRG8jiCm3yHHlkXE6a5D+mfQs96WjkX9r1I4IBg6l+3W30xJ1T/5UgYTuADzGCow3r/FiNNw+xmi9ecDzplHNGAnluSffOcUXmCSEflF0DEK7pgEHBSWOFT3B35aapAO+lTZe5lQqSLj431yxo6QZGoX7g77R8F1teWi/mxhsHBy/7LPxwdkRQNRJx1DlqAu0iccWpuA5MufkDIjMxJCZ+vjPny+vBNdDoxM8cQUOU/aBT6+mgsQ4MasjSzrpcoEOnlDuXKz2/ySURsoKEH2345mIC8oj32HUDCcq/wLKJVMTV5smym6ALWl2M3jK0CqJl2VcbF9I9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:39:52 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:39:52 +0000
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
Subject: [PATCH v2 net-next 02/13] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Mon, 13 Jan 2025 16:22:34 +0800
Message-Id: <20250113082245.2332775-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: d42659af-2607-4859-81c0-08dd33add8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kcTkI9hJDHm2GiRsKGY+IF/Jarsb8Yy7sm2MkjuUqTCIHknVCR1wbLabBaE4?=
 =?us-ascii?Q?suYnzWIilo4ucKg+meWqarxOqdaVQXcvkOTOHrYwDXcxDwr+VzCCt+3mQlOE?=
 =?us-ascii?Q?yFlBhEOYJ/6JXU1fiyw9pYDWv80v/uqRfrPpq3cuttHn43r5fJPtyUr9YXLv?=
 =?us-ascii?Q?eHZ3pEEnebMvypw+7XihItxPwPgpwi5S8fekd1hwI3yJjLQ55h89Orj2CXgR?=
 =?us-ascii?Q?1Oqv38FPZEwsWTOi6g0653rXLHI9QCFeKWozACDknqMLo9Ft9hMemp/5VVec?=
 =?us-ascii?Q?CDbYaoVAScP/KKR3B36DLIboeSP4ffJl4qKT+4pcMkCpxxwO9qm06vUbZ6Z9?=
 =?us-ascii?Q?aru8ifqgnZaZR/+G09UiP37LDo7qXUrwLhDawpB3E6Z3Ge8aAXXVbr0ib22h?=
 =?us-ascii?Q?oj5gS2GJmeKJwKoFuwJqXT1UuCbcaz/UZic+qhJMmARcDB9FKlRIMk6qxhTr?=
 =?us-ascii?Q?4BsuMhA4HOuBqizv5rirnHOxPxuGXTDmnl9rM8a1u6P3LYrYWwg+dy7uZVhn?=
 =?us-ascii?Q?vtbXwuQMWN8h4dlUSvlZquhYgTaWs/64rMLcYqyUvDdZ9i4nsxl7pkq7XyDb?=
 =?us-ascii?Q?JG0Pi+1wI/TL47cDwY4EB6DxuHHOMBhiruxR3b9pfXPjxp8gJGFQvTyUSZAt?=
 =?us-ascii?Q?aq02AWcee9Uflp4Usd9YKWn84oVVKS2bSwbGklOP7RS1an1Oy/TXu0O02FGw?=
 =?us-ascii?Q?d+8WAJJJJi2el0giUIGrT0i0eE+h7/jjOP+vU0rjxetC/RUHL4ijR5yWCccv?=
 =?us-ascii?Q?XBG+Fh+lqBc6c/E2xJ/gnH2NUHziUxcWafGjD1ApQF972iUtX6BZyl8+DtOB?=
 =?us-ascii?Q?wuhM68SapfdMDt5PJYvIaZm2mWk+jqv7/u6ow9D9tbm3foGnOmCdqXjxiCCX?=
 =?us-ascii?Q?dBMUaRb2+iKU8AtCEhJEfwT65gQltDUaFU9bBcxbCttCCRxrES9SFZsfGcgD?=
 =?us-ascii?Q?Smrj6M8KM0GYDsAeHI1TGl8/rlni65uHaIJ+t5bXG5kPSQJyI9YALtf+hxHQ?=
 =?us-ascii?Q?DXPWFB5lilht1t33/SbX4eRy7iYmGK/nbzYM2tE5JTiofe8gMZHnyHRBQXo9?=
 =?us-ascii?Q?h+QgnuQTM9Y7epv+iuOIwzPd8FSizzgXdvFp0KVosZel6aYJPje1KGsrufOc?=
 =?us-ascii?Q?Gj+v2RKjEntWwn2p3TGEahksyKaqp/bhHQwUw1y6lYqRThRma6t7TG45f7gp?=
 =?us-ascii?Q?EGQfmzuOCSTj33udWcaCuyvMk49Z3Qs1qXJ31jAUiqCTeWKIvhUrvGdbk/aA?=
 =?us-ascii?Q?BSdqDCqEhrh5RWa+NlGD+vpUKkWjnrgdM5isFgk0YSlO8YkN6t6UplWo/M1Y?=
 =?us-ascii?Q?iWlQKSG3SAhN47qYI/rt+dx2GYfe1q9JV++DtApXeNTwO/qiTAXghY2aznYI?=
 =?us-ascii?Q?WZUVANYBfO6r/MEnBN17v1x7nowNAj4JFxAEYzFEfTYl5tFMsKkE9JbPuYCF?=
 =?us-ascii?Q?nEnqcDOwSG567/Ad14AlcsIW1DIOW+EK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4P1ZOnNrpdYHj7jTQTzmGJTmnQdH+85euBDGpcNRzFdLljt4CsgUfaw04mY0?=
 =?us-ascii?Q?IlKIDY6nN5dVbYcITyJf4hAvLe32owthbeZf2/KuK3ItLD4rBjWIMshpMaUz?=
 =?us-ascii?Q?SdL/lcR88z7wpabWWj65cL56v1WLGdCexPbixX0o9MOFnAGQXhDfqBrgXydc?=
 =?us-ascii?Q?SsEgQ1J9wR4aVcSbPuI6O8ip+3lMz3Nf57VWi6JlExvgcfZcLQMrBw/0Zfub?=
 =?us-ascii?Q?oMlMVTqlMkZTRI4tioyxARv0U++Net5NG/xld+TFOT7ayMzurCiy0wbNrAou?=
 =?us-ascii?Q?1oS4bmdIbsDPFF8MTnB9Y/2IFNuPd8lDiqHtpUFlsLCeQd+//hBj5mHLGq3h?=
 =?us-ascii?Q?l37gUxVHkJ+/kmoYBWDmxxtg4dw6QDKTQ2+4mToHmlTiaH3JY3ACmxQHWHlq?=
 =?us-ascii?Q?l1F7JHte1/6VoxqViZ9cAhC6gFX0nYgHkhb6FjgJVAgOmpNoGnfqB2ofhhgo?=
 =?us-ascii?Q?u4tJ7SHwmk/E4z975psivfuAkvCyjPeYVoryFwrNVzYyeabgZqdpN5vnH3pw?=
 =?us-ascii?Q?OK+oM1xx7uHxQP9z8ylS91F2LnIsVx1V/ITD/ml4NZ8Lfq3R1v3vm047bjkx?=
 =?us-ascii?Q?0nj4yU7t1gOUhOWsj6wkZLeCXPqd6qVzCaG/NyOy9chje7VVUAH9KaHrmrpa?=
 =?us-ascii?Q?IU5MqWt7cWtyAwzXtwLXEQLHBj2OlkWwQIWDF+nnryBodDqbok6p9fgTx+kb?=
 =?us-ascii?Q?JZ/un4hQI440mq2M3CpLPr5aIMFWNFSkqRiN8fK5ERulSPVrllbzcbbtWUDL?=
 =?us-ascii?Q?y1ksFMvyTXoGDfOQKN5fvNNdN8HTQJrk7bpbTL2lkBpHBhN9UnEdma5veUFf?=
 =?us-ascii?Q?JOhnfj8Uwxs+QDOhjSl6a3I459PebWXY1ZCYcr79joI+GlMn2jIxhjoFxMH0?=
 =?us-ascii?Q?vGKHbo+cxWcwHMJOEhhQppC1beZ925KJOyQgciSEMTh0XYmBqkRUniVSfG6z?=
 =?us-ascii?Q?e51upfarV36AUy+gTEbY6FAWpNI1eADXEYsWRYUq/rbcCpYjzYoZx7g1URHf?=
 =?us-ascii?Q?ph259nlkSidG3oTHINlPamvpipaSgBBVp0CNjVPC3IbEbDGb9LnrOUwwH9lT?=
 =?us-ascii?Q?mRKd5fk43XxBj7C8fxTAWgyLfC7KzJC3izlTuUVV2bEyF/QtwfLT7lLuSr88?=
 =?us-ascii?Q?XQkD3Wr49FgVvWCjdW948766ZWosXjHo1tlQTyoUZ/huQWKvurXtVdjhTMDH?=
 =?us-ascii?Q?StK4j3C+DYRP/ovktqK+tkl8jbwjALpkHAlGQRWklvQxw2yHcAT2QI6LAn6R?=
 =?us-ascii?Q?Dw5NPmXyCj46vzWJP4K0akX2FUq8lMm+KUNQCL5NK4SZQ8/GXwSzr76X1Idj?=
 =?us-ascii?Q?QsHUqboWvq7+lJ644YzPCK/ah2YhJmk3dyr77/wEakRbcLZK2oogVs4ejt/V?=
 =?us-ascii?Q?JL2HCGWaQ6uc80892k7KqmKSo5FO2ZFEr+8E1+cwb9OMdDyk1QwzUh1bs8k9?=
 =?us-ascii?Q?sqp/0ZClG8S9LbPsL9brYbY8pzwefV8ejP8jk/pTAHaeZbvbhSsQoICozi1O?=
 =?us-ascii?Q?Lt/EPAiRxQhC0MIT2V2D8aaNc2u/4yo7lohEQ7FceB3V+cQ/bZT2zyF6F+FA?=
 =?us-ascii?Q?iiA70XJC6NAZqCE2YPdPhBI9Tp7FitaZN7Jqh/FG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42659af-2607-4859-81c0-08dd33add8e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:39:52.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xs0yVk2191Ii7X6BQbUD/dFQ4EEXQ83bmqStaSBzVC1MQKvx5QrhQuf0G0FbNKHU5nIvd4jKW1h8+P8yBrf4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. In order to
ensure driver compatibility, struct enetc_si_ops is introduced. This
structure defines some hooks shared by VSI and PSI. Different hardware
driver will register different hooks, For example, setup_cbdr() is used
to initialize the command BD ring, and teardown_cbdr() is used to free
the command BD ring.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  | 27 ++++++++--
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 47 ++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 51 ++++++++++++++++---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 +++--
 .../net/ethernet/freescale/enetc/enetc_vf.c   | 13 +++--
 5 files changed, 132 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..4ff0957e69be 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -266,6 +267,19 @@ struct enetc_platform_info {
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
+	int (*setup_cbdr)(struct enetc_si *si);
+	void (*teardown_cbdr)(struct enetc_si *si);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
@@ -274,7 +288,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_priv ntmp; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +301,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -490,9 +508,10 @@ void enetc_mm_link_state_update(struct enetc_ndev_priv *priv, bool link);
 void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 
 /* control buffer descriptor ring (CBDR) */
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr);
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc_setup_cbdr(struct enetc_si *si);
+void enetc_teardown_cbdr(struct enetc_si *si);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index fc41078c4f5d..b957e92e3a00 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,23 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_priv(struct enetc_si *si)
+{
+	struct ntmp_priv *ntmp = &si->ntmp;
+
+	ntmp->dev_type = NETC_DEV_ENETC;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&ntmp->cbdrs.tbl, 0, sizeof(ntmp->cbdrs.tbl));
+
+	return si->ops->setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_priv(struct enetc_si *si)
+{
+	si->ops->teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +289,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_priv(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_priv(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -688,6 +716,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.setup_cbdr = enetc4_setup_cbdr,
+	.teardown_cbdr = enetc4_teardown_cbdr,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -712,6 +745,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
@@ -728,14 +762,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..31bb82ee512d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -3,10 +3,12 @@
 
 #include "enetc.h"
 
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr)
+int enetc_setup_cbdr(struct enetc_si *si)
 {
-	int size = bd_count * sizeof(struct enetc_cbd);
+	int size = ENETC_CBDR_DEFAULT_SIZE * sizeof(struct enetc_cbd);
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
 
 	cbdr->bd_base = dma_alloc_coherent(dev, size, &cbdr->bd_dma_base,
 					   GFP_KERNEL);
@@ -23,7 +25,7 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 	cbdr->next_to_clean = 0;
 	cbdr->next_to_use = 0;
 	cbdr->dma_dev = dev;
-	cbdr->bd_count = bd_count;
+	cbdr->bd_count = ENETC_CBDR_DEFAULT_SIZE;
 
 	cbdr->pir = hw->reg + ENETC_SICBDRPIR;
 	cbdr->cir = hw->reg + ENETC_SICBDRCIR;
@@ -46,13 +48,41 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 }
 EXPORT_SYMBOL_GPL(enetc_setup_cbdr);
 
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
+int enetc4_setup_cbdr(struct enetc_si *si)
 {
-	int size = cbdr->bd_count * sizeof(struct enetc_cbd);
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	cbdrs->cbdr_num = 1;
+	cbdrs->cbdr_size = NETC_CBDR_BD_NUM;
+	cbdrs->dma_dev = dev;
+	cbdrs->ring = devm_kcalloc(dev, cbdrs->cbdr_num,
+				   sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!cbdrs->ring)
+		return -ENOMEM;
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return netc_setup_cbdr(dev, cbdrs->cbdr_size, &regs, cbdrs->ring);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc_teardown_cbdr(struct enetc_si *si)
+{
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	int size;
 
 	/* disable ring */
 	enetc_wr_reg(cbdr->mr, 0);
 
+	size = cbdr->bd_count * sizeof(struct enetc_cbd);
 	dma_free_coherent(cbdr->dma_dev, size, cbdr->bd_base,
 			  cbdr->bd_dma_base);
 	cbdr->bd_base = NULL;
@@ -60,6 +90,15 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+
+	netc_teardown_cbdr(cbdrs->dma_dev, cbdrs->ring);
+	cbdrs->dma_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..a214749a4af6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -939,6 +939,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -957,6 +962,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
+	si->ops = &enetc_psi_ops;
 	si->revision = enetc_get_ip_revision(&si->hw);
 	err = enetc_get_driver_data(si);
 	if (err) {
@@ -964,8 +970,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
-	err = enetc_setup_cbdr(&pdev->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto out_pci_remove;
 
@@ -984,7 +989,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	return si;
 
 out_teardown_cbdr:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 out_pci_remove:
 	enetc_pci_remove(pdev);
 out:
@@ -995,7 +1000,7 @@ static void enetc_psi_destroy(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
 
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 	enetc_pci_remove(pdev);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..d7d9a720069b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
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
@@ -198,8 +204,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	enetc_init_si_rings_params(priv);
 
-	err = enetc_setup_cbdr(priv->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto err_setup_cbdr;
 
@@ -235,7 +240,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 err_alloc_msix:
 	enetc_free_si_resources(priv);
 err_alloc_si_res:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 err_setup_cbdr:
 	si->ndev = NULL;
 	free_netdev(ndev);
@@ -256,7 +261,7 @@ static void enetc_vf_remove(struct pci_dev *pdev)
 	enetc_free_msix(priv);
 
 	enetc_free_si_resources(priv);
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 
 	free_netdev(si->ndev);
 
-- 
2.34.1


