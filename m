Return-Path: <linuxppc-dev+bounces-11655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C4B41975
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 10:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGxPW5D23z30QJ;
	Wed,  3 Sep 2025 18:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756889967;
	cv=pass; b=mAa48yisXYrzRFjYKADZPsABEf+uQ1OLXTeSylp6SzEVloAIiUefGfSRfH2N+Ino7aYMKnXKQea65ZYQylf94hDjb81naw8RMuSqR3kkxGXR/1TR/2dAnQvQZvD80pzqhK8YDaXF5jkDoZWqluoxEMBddQWdEtg2E49XF4j8JWi1OkLS+SuG3Bwm3TfyDcRhfB6eY1/ibfo6RdFUDQnqyo/lFuJFbKntRjP88b43b1FQ8ihFzfSYFN697il8XWQUuQ1HnpGRbl2LkkBVc3UMzt3+A0YMVznHlr35MVeZNmVF6e8txeOlWTq6igDNNsR557SGzsq7Qk3WsRH0gds8xw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756889967; c=relaxed/relaxed;
	bh=UUdRNazR5yRi10910sLZacymZrIS/EDC+AVrodDQSjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RnoCN1WiQWsBim69/dgXYridmGWpfwA1QTAZYyh8EMrsirHjptcud0dV5wIloDg7h4zeiCAbeSHy0b6H63O+InKn86X0ChOsD3UAih+MEp5/l9invLZ0qs1p3zyqaI+ZDlSkBHGNL7R1tHanx24OD3MZu/P+C0DExv7hQDKxgLiaYtsBk9ooSxEgwj/wGReuNqioHnoKmqQ0WeekpZer4mh1GGgwhoEb7uvsbNb8nrIji8cJfWTmaMZXDM3/oSDe1BO542Q1iui3+PnNDLUUPoNMVmsWdhBywaZeSXgFiyzMOzo2pPxWIlb4MhnwMnSBbxn1spi7k6lsyzbyce+f3Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Q9ousvqQ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Q9ousvqQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGxPV6Hlmz30Jc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 18:59:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZgl74RdcCZ9JRTJoD+vKNayqcLkZYIZBLlMDlXIZ2hkzRLF59pmYnTqnXs2S/uECv2mfsS5VktSBwUSnALO/bY2TOVYs0Dq28nUyMiwovAmFaesgIB75OOI8ZeTYSVO/AcHn1NBw8FuTEkB9PHw2LRHAT3K08X9y1kCNuEHUG+U3gPA6mOnBZ/OAR/Qa/XdE26xqQOaCUT9A2tfRiLJr7mdOr1sCE0fpuwZIx3oLYILd8gQz2ygm1x4yTvSvB7UvyKIpxPoztAw+GTq/8iwgyvACixyL1HBTkeMGviJCBr3o6lVU3Ji9QA4mWhGmZbqXvqWRpxRcS8lmF2z2fKDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUdRNazR5yRi10910sLZacymZrIS/EDC+AVrodDQSjk=;
 b=yW/+VgNzDOt0iMXMaJN7hAVc3qAZ9GjzpFSgKOu88kgLBrXIqeTvlePjWOFU3P1vthyZntw9fQHNTY4bNhLFkpJXkavRCx4IEqzTe9c3h+6QFcfn5I93A/hmjINzxJYzzEBCESP9gZE+8kgcSVf96EHWsQrobchVCKarCWw5Uf2SAMYSSsQgur5B9NmtkQvsBeMYCo0gCgabfQCiijCyGiU9JJ4ChdtmNnyYYzXvV8PxPaRTpsW8wzSKiLFhKnrCXzVAM5J4Ib2MaiNJu/m92L5NXCWCwp9BdsEQkr7XJpfhTjpwD9iOdyCGO6gpSNzpM/cbW1k5PXXLPdTMgcvTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUdRNazR5yRi10910sLZacymZrIS/EDC+AVrodDQSjk=;
 b=Q9ousvqQGNASlhZrIal6ysnry+/ELbwrLD6rwWFNbDS5v4BbIoyvmWjJVjKFmEjTTz9NUU11ApzOYQTLwCTsoJ0blUHOoauUqEuGdWFTDDPIte8jLcAN6GQo0fokno/5b01sKdiP2ugiyBzfJQhX1cFUZbVW5Dp2lI+ywbABAtaXVbCQWToUurTSlOuAdOSxn+zGAvseGf3hdAITg0BSpzqn0xNMXarSiwEkKQo2u0kPMdJOVt3rzcIFJ7qZ262pa9kV95O7XvFnkPCSdQezewJmOJFrEbjkw6zZ3VyCbqJbqQBjJAqmUcd4rl1je2tJt282XHwaYf5B7Q3Nl+L+xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Wed, 3 Sep
 2025 08:59:03 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 08:59:03 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 2/3] ptp: netc: add the periodic output signal loopback support
Date: Wed,  3 Sep 2025 16:37:48 +0800
Message-Id: <20250903083749.1388583-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903083749.1388583-1-wei.fang@nxp.com>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c621e35-791d-4a2d-b0df-08ddeac82196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnVQcCeICCiYC2TSuBtyHY6DV70VCMSt9s7BNIRG6iScmqalIkt1RgTNn0eV?=
 =?us-ascii?Q?pWhwEfz4a8g0wpHHcQfpmvyfa16d333EepCzE9oZghYAnZvNJlExcpyHvucO?=
 =?us-ascii?Q?AezV6+tVZzRbH8pSiIqNqZ2lTB26g+qXAtg7JblGjxuu5yuxwKNHvZ/d1oEQ?=
 =?us-ascii?Q?DLeEwD5yJIJW72970BF14mZ7Qk24TE/fulkutZ6h6ql/9q+MBgmteGbUmS0d?=
 =?us-ascii?Q?p+j8cqDdWZy5NbMF8hPcB6K2sXOfjV+2WtAhBjtltFe+aHkn38we1lel1Tq2?=
 =?us-ascii?Q?PAXjyoY2DKgLjUXgZLaUxcUg1aFf21DaoZTd35pUAo1R4oMK+1l4UWb6zBBc?=
 =?us-ascii?Q?RFB+Gx/9tqCOfYOig/P5AYFU214Q8BxrSfEi3sWpxCHZU/gPR4tPJW3YsdZb?=
 =?us-ascii?Q?m2VWpEADY5OglhD2alTXQ3FhiFx3R1cUxPmuJmNIHXf5K5FGi+ZpAgMcBiju?=
 =?us-ascii?Q?x1n6sDeWF650zJZ4zD421e5JWTo01HGPpXEcLrFUrwIBSuz6Sw/IvodbZXOT?=
 =?us-ascii?Q?LUtANVvoJPcdSO4h4lmz+U7vrd06/GU/ttoSdS4dh9AOaVNncR5WgHnA+CcJ?=
 =?us-ascii?Q?yQKLdp08OnAopqp85D4xmxnG/rMvdfb0fi/vGqGb4F0rBNvixB/BaYxKLrie?=
 =?us-ascii?Q?/cXzGOcjFT2T6+TNhIcjWA6pL/5V8d1k5jbtNqAru5tjk48U7v2N3K4Zo/iw?=
 =?us-ascii?Q?HuWQIWmzMelnoD4rK7S/wZtLn+UB/NtOwjFs0EEJgT58ahfpTGDe7yySg04Y?=
 =?us-ascii?Q?iv4bY/whlcbHYL73TXDm6IBQ4j7AWdHWsn/b/YRfEXueUqfz9JKpApT+Q34n?=
 =?us-ascii?Q?Dn4ECxRZX6BhyYkbcwtspgbdKWHR8LdAhNGpJ6ADAfcUdAxv12O5HTnO4KUi?=
 =?us-ascii?Q?LbW3TfwV5tk5ecNyLPQm58rFFUTh4EXDL2P/IVNESwDe3N+MGCFLvgOyBuaV?=
 =?us-ascii?Q?zs0xAmFKkx4ao/q6htF/Q6Xn7THBRF7EHIhYM6XZ2j9LqK0P2MQCiAIkYfF3?=
 =?us-ascii?Q?oHbAxiBcK83pz4qrj4qe8diaOcDiu/D9YLErf30B5fzrHc/uY5o1Vn5oBxgo?=
 =?us-ascii?Q?1iwFhIKaQvbYsygKBcQVsSJotCcV60ddADRZ7gSCydB4SdCE09mazpm//OPp?=
 =?us-ascii?Q?nkDKDeLQQtQgxhf6afbO/kLLxc+v/AXgW1TtEpAnvF5MoDeVvjlub9TNPwHI?=
 =?us-ascii?Q?B9g+TeEDq7EmI94Miwsb1+x+37lf2OR7QMCpw9D0Nu1hG7rCx1BTKbYkIVsz?=
 =?us-ascii?Q?BVz/CSS6MqaAtTwSA9UiufeftYw872x6bMrdO9jfdcG2GyGZ0yrcY6YMAy6H?=
 =?us-ascii?Q?kbiiswFvVchzmzeYtjc6F76c/JJHaA1VXtu3bBBKq+3f9ZNiAvucLW14eJg/?=
 =?us-ascii?Q?fQw/BRkP5mlFO9eTB1OZTVnVXoVi4GR/8ps4STZ6tSJdE0VmgDvQFw1yoNh1?=
 =?us-ascii?Q?Fj/VNbP2FxSLaraSPd7tVTcbvZMbNqcita+gYwMRpE8d6IOK86Q/6+NLId6C?=
 =?us-ascii?Q?4ppqh1hdiv5Z/0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NXh0dLkSA6aN57IoDV3/YBQ2bG5ps7WgqsHTWbKhIM6zCfI6kwDas3WJ3tM5?=
 =?us-ascii?Q?/o7qTmtttft5S4oqtMQp8dx1PQyMEyR3FA3hCldrioQNlf3dhYX1aQ2OJMx0?=
 =?us-ascii?Q?lZW4gdlOOJ1+0DaLW57KVmddmsf4zEaIoYp+n0qH6gNz366U0A9JHhtO+Yuq?=
 =?us-ascii?Q?tryB3KvaOTWPfo7DLCkQjmtp6nwdcOlsGejFXwgJ3lpY9DgpqLIiVzdwweAz?=
 =?us-ascii?Q?rEDSkkwPSW5gZAK7MNFMkYiwUXbUIeTgS1tIgwssgWwnUUGgZBvR4zbwkSIP?=
 =?us-ascii?Q?d0u1Two+3LeJh1KTSpf0J2+O7OhiJ2HNqVcvXnPZzGSmJ7xnWdf6szkt2Uq8?=
 =?us-ascii?Q?4ensgPruaNRw12l1usNFmo4GGe1T7hzpaqZnwLRu9bEuUTA92dLxn5/mVnPq?=
 =?us-ascii?Q?EjPNIrbQy3FWmbIaFqPuxaHGiwF21dZ7wCzFxlqqPgKv+tI+6Ln0ZUK8oaaz?=
 =?us-ascii?Q?OkF2GgkWoJmVNR/R5jW3Ckd3UBDUr50GzDCBhD6xljGG69/VCpUZJTwzvgTX?=
 =?us-ascii?Q?hJ1q8kajq4zOiTjJ7vcNXlncb9hNg084No6POLIoSHyGfdf/oJnTWkxQP3MF?=
 =?us-ascii?Q?HN70N0skTOvNjuRdhh+mQFEfBOwO/jMB1K6CmX2qjIl2xFmCACVKPbKBEEjI?=
 =?us-ascii?Q?YPCEI5gc/W7+X+XztlIzW7xqBXVuijtMF37aWjKZZB3FfxrGUdHfp73Jj0pb?=
 =?us-ascii?Q?p1+3Ht7xQDtgTrdnR6hec1cfJNBVxen6MujDmZCJk8WlZ0AxDciAOR7Fdo/q?=
 =?us-ascii?Q?djm4ACKVUj4JgBFd4peDdl5eEixOI/G472dJQLkB2P5gRgZu8HNqdeUJRX73?=
 =?us-ascii?Q?+DQCCBtIQE051lL608+mqM5vIU0Gu7rYCYMjmXTVWZwvcklYpGV0t5hpsT46?=
 =?us-ascii?Q?GNxcjWL0VeGX+/UuI4Or2jbbaea8UeFXBnoJuFg0+NRsN5AOKGCMmhLb0pFB?=
 =?us-ascii?Q?3K7IGH9woTFzlQmVNxfI2rTKtWMPQ/dzMuzhKA+D+FkIMhtiz3vAoyIDkLCC?=
 =?us-ascii?Q?KX9D8ynY+7oXh3ZCk4orONSVRO9lLiddHXgHcIa0e7HJpr7mFap0SLP7K3uI?=
 =?us-ascii?Q?IPBpj/c8GN1c3RceopwtR3+JBKBcPlxd5d+6PG8GYdYEyFAyNRBFW39S2/JD?=
 =?us-ascii?Q?Aiqmhf+QI1o9Khr+WSGR4KLK+yLu6xhep02z4XmYGovI6SwzjUuD77inVeyE?=
 =?us-ascii?Q?mbF+/uyf2SXZu0tEQO5RR1/MlDxeMn4l0UvMmxN/H1E4TNOCVNPqjcJMA5ro?=
 =?us-ascii?Q?3+wqFf6qjGjzDKA06aIDimsBJ6lnwnBCReMK+v6Yqve/6u0F91UZT7lLd8rW?=
 =?us-ascii?Q?RqxOzQOFs6rg+xITFMvIaFxHtWkt33fdaPU+Y1M7Vi5iMsD2XPYnyyu53YRn?=
 =?us-ascii?Q?C6ihuPRxp6CnEi8oSBB7FsBJMCD6YnbMP2i0aOoxosoPASQznpEx7taLlFfT?=
 =?us-ascii?Q?rzNA4WHofTUsMomRWJw3xd1IizPQ/gx9+uUx0Hqvw2Q9JR50l4oQcMp/wSpt?=
 =?us-ascii?Q?6Ugl8SrCOp61KtLMPBNGGUBG+dL0zbLE2+JqgbBW12vim2JOo4Xj3wFWo35v?=
 =?us-ascii?Q?IRODQKeYjUE3mWqwfGrPqCjIcpRPapJ64f9PvuwG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c621e35-791d-4a2d-b0df-08ddeac82196
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:59:03.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78Tygq20NGp3o03Gte8SahwZ0bUbQeV1DOME8gxq66K8uuySIs1Uer6a0xqic8BmBEeXoUIYkgXlNuQh6K1flw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The NETC Timer supports looping back the output pulse signal of Fiper-n
into Trigger-n input, so that users can leverage this feature to validate
some other features without external hardware support. For example, users
can use it to test external trigger stamp (EXTTS). And users can combine
EXTTS with loopback mode to check whether the generation time of PPS is
aligned with an integral second of PHC, or the periodic output signal
(PTP_CLK_REQ_PEROUT) whether is generated at the specified time.

Since ptp_clock_info::perout_loopback() has been added to the ptp_clock
driver as a generic interface to enable or disable the periodic output
signal loopback, therefore, netc_timer_perout_loopback() is added as a
callback of ptp_clock_info::perout_loopback().

Test the generation time of PPS event:

$ echo 0 1 > /sys/kernel/debug/ptp0/perout_loopback
$ echo 1 > /sys/class/ptp/ptp0/pps_enable
$ testptp -d /dev/ptp0 -e 3
external time stamp request okay
event index 0 at 63.000000017
event index 0 at 64.000000017
event index 0 at 65.000000017

Test the generation time of the periodic output signal:

$ echo 0 1 > /sys/kernel/debug/ptp0/perout_loopback
$ echo 0 150 0 1 500000000 > /sys/class/ptp/ptp0/period
$ testptp -d /dev/ptp0 -e 3
external time stamp request okay
event index 0 at 150.000000014
event index 0 at 151.500000015
event index 0 at 153.000000014

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 8c5fea1f43fa..75594f47807d 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -21,6 +21,7 @@
 #define  TMR_ETEP(i)			BIT(8 + (i))
 #define  TMR_COMP_MODE			BIT(15)
 #define  TMR_CTRL_TCLK_PERIOD		GENMASK(25, 16)
+#define  TMR_CTRL_PPL(i)		BIT(27 - (i))
 #define  TMR_CTRL_FS			BIT(28)
 
 #define NETC_TMR_TEVENT			0x0084
@@ -609,6 +610,28 @@ static int netc_timer_enable(struct ptp_clock_info *ptp,
 	}
 }
 
+static int netc_timer_perout_loopback(struct ptp_clock_info *ptp,
+				      unsigned int index, int on)
+{
+	struct netc_timer *priv = ptp_to_netc_timer(ptp);
+	unsigned long flags;
+	u32 tmr_ctrl;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	tmr_ctrl = netc_timer_rd(priv, NETC_TMR_CTRL);
+	if (on)
+		tmr_ctrl |= TMR_CTRL_PPL(index);
+	else
+		tmr_ctrl &= ~TMR_CTRL_PPL(index);
+
+	netc_timer_wr(priv, NETC_TMR_CTRL, tmr_ctrl);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
 static void netc_timer_adjust_period(struct netc_timer *priv, u64 period)
 {
 	u32 fractional_period = lower_32_bits(period);
@@ -717,6 +740,7 @@ static const struct ptp_clock_info netc_timer_ptp_caps = {
 	.pps		= 1,
 	.n_per_out	= 3,
 	.n_ext_ts	= 2,
+	.n_per_lp	= 2,
 	.supported_extts_flags = PTP_RISING_EDGE | PTP_FALLING_EDGE |
 				 PTP_STRICT_FLAGS,
 	.adjfine	= netc_timer_adjfine,
@@ -724,6 +748,7 @@ static const struct ptp_clock_info netc_timer_ptp_caps = {
 	.gettimex64	= netc_timer_gettimex64,
 	.settime64	= netc_timer_settime64,
 	.enable		= netc_timer_enable,
+	.perout_loopback = netc_timer_perout_loopback,
 };
 
 static void netc_timer_init(struct netc_timer *priv)
-- 
2.34.1


