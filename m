Return-Path: <linuxppc-dev+bounces-7607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FDA85955
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0Y1yt3z3c85;
	Fri, 11 Apr 2025 20:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366653;
	cv=pass; b=oo97efGOXyoq0NoUCryHyK5PnaIZ9RPwW7/0QG8/cQOZ2Rn/48QuxD9+PktByTC3ZCNS8aU0aIpx7vAlu+Ph1ycugAcLe1m/Y6U0FLY7c9AQzpTmMws3tUK8FgmkomY4ENIakgfWfRa7FpOlVtsReOmEIyImUvwEos9bV/eHV6re8USPkI3AElGdYiKLdrYp/WB2i0lMNzY5TCfDWnNTLjCsMY6lKQzlA7TGfl65CR4qj44XkE0NUkBuR23CQtQWRL3pPpVmPbyPh1xoETjNRBCT+5et0sRrQ2wsoU55bBrwyftjU6vboZuSz9C/7Z02VvANwuKks3u3NxTWAJ2W2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366653; c=relaxed/relaxed;
	bh=WcrAIZirgylUNH88LMf2DUxNmDSlX2T413+4Roorcwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eInKz3GVhwuHIPdGvJ1aYPuf0Nyf5S91NMg6siym5QC97IVLgu36fJgLP8gXmXPQrLM8S7/24uQfdQnG0kmaptNZnqXG+/u+6hu8Vgt7nQiFEnC0fzkduWJNkVzrSYbuhfJf2us9ZMfWSIeCij2tPLT30QndgTbdVN24IoxNs1PP8I+p01OIoe3c9ZsEb86dQqmptmn33YBYgucFzH7M6otzVK0XKZeGj8j6ZpsqnCTIWhJRf5tgXDcVBP50Xm2PYSZvGOjQmLkWDOVYg67O24kh4pcP3hgDEBvRlKOcYfEY9EI8Nch/ioEwF/onCxpAhiU9BTstcR2cPY0ZCmVCYA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JMlCuX9J; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JMlCuX9J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0X2w7pz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqKcrzIBFpd4Q7+7KpWLbHAJukzBGdHYDJnMNTHVPkntFh0Jh2v4lh4/5e0WhfOOnGSoo6vR8GM0I+KMVP7BGV30w1paUgFR/sGuySpR2ThzXMIYzY3n3qES1wwhojVtAZxXqOU3LCPujFCld22f/XjaD6vkbtXLqsC+HRXafJmLxWsZ1vHcdnKTjSiK2PquGvUw3BwdWt+LCAPsdjsOu53sCiKocgy6YCrcaP6y3KJYb9Q8yeoJqX11gy0tDO+tqWbsqbkXyyx2DIY8/u6RuT18/mGTGkdtzw9ubjprrgkPgz+a895yho4cXdOO0BDJeYxTfBC4/b4OkkJBr76fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcrAIZirgylUNH88LMf2DUxNmDSlX2T413+4Roorcwg=;
 b=fn5NKeU5hgfvPkMV7r+9yiU0MYU2LnDPqAFcdwp1FanfHon4oZ9ZWkWHyDpL5XPSPX5UsGeid5eNyhuPiU1R4RrieBCDLBbn83S56koR8hRpcM04/wKlULfUHaZmn9GS2kGRJBSlC6gGLHzl7B/7/8dA/vjtKf0vjWmlg5cc0zVnVwLGdQouo+nn32kSTNmK1TdC3bGnHzPqDeSo2h1y682mbbUF/wnADA676gO1oT3uVDYPpTwGyJbbM5EZm0FqqHFvueJA6U96bT70XaEUv7wN36xVztZj4bpaIHS4w9wZY+YCP3Mf884hyilPAkywK9sVwlQ2zzzqG4yV1JWMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcrAIZirgylUNH88LMf2DUxNmDSlX2T413+4Roorcwg=;
 b=JMlCuX9JVfeNLMovDfrZvJo0lv+R3id47rdrWHElkYXlDQ2w0DTpP1F8MtjQH8vOpugFwe64L7QeIjmQa+b0D7ZE3gT9iMAlDKf2eQr4xkkxbpH+EsBEZQg7xLcWPHRgpzQ0RRm/Dm/7v0PSgKMpozp/mQ1B+dUSXYopwo1wl+a2INltoHnCJHhZXRBipZa2SIa+pxZQ/ukvoasQmWIBwZOpvs8gaz92ccOfxbmO+SP9BjpPwTlGDQhl9uCgeZUDpnr+7HH81FAC6XohMux89mLDNGf0tVn0HbujfTXIVs45ig9wgn55igBeyPawLHXjQ4z8eobVOC1h6rue6z8qzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:17 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:17 +0000
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
Subject: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for i.MX95 ENETC PF
Date: Fri, 11 Apr 2025 17:57:42 +0800
Message-Id: <20250411095752.3072696-5-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 00a7158e-7647-473f-dcbe-08dd78e2095f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pnxPhnxYFphRnq6cNTIxJ404F6lKYlz5004fkhw4pk4kNbAqUddMpFnVmJdn?=
 =?us-ascii?Q?hee7MBLdTiVvbVjMEm1SS8yi3Zf8maLB5Gds0uepy3AFJWSQY8Ns3S2miceu?=
 =?us-ascii?Q?gV+K6ibHzgIKJvD4NVLGayoYIuZcPuwzF7cXQp8ylkpV/DmiMEO2FqN8LeTy?=
 =?us-ascii?Q?YmHaYo+E0llDIWfkyj+3Prt7XJLA19BrE6kcRt2BIM0O7TNN2XfNZmXAENRq?=
 =?us-ascii?Q?gZ5LuuT9i6FTM/pd8YYDlqGyv+2J0PIXMxMye9E5DV2IgJXRiM7znXSvPclD?=
 =?us-ascii?Q?AK2Hfa50JgwdVzCp+91gVPce5lXl2OfksUHrQQAWGTod3UfA7iKntGbHG7tj?=
 =?us-ascii?Q?6qT4Gx699VUWxkFMiVtLz+iOUSbw9/hHpX+wjThbQPiIaPM4hvhCehijBOTt?=
 =?us-ascii?Q?g50pIu/hyZV4A0wI0uK+0+eo2JHmRQ3Kqc1TkNdGh8YZwopzqfy05PuX+5pB?=
 =?us-ascii?Q?Ep/fdCK/7yBvvkWYEcnxQVBqYzvsTjOaX5yc4CJlBZ/AG6LnMS++INJDV1Jw?=
 =?us-ascii?Q?pT24zdw3s5EfB0ntwaSXjwhM0XoNhZKLDclrPJu0Wc5sDxl9jhzn8cpf194v?=
 =?us-ascii?Q?K4ujE7OD4TZFhsUNNmnLiIel1i6IGGu3EBoKKd6EDfQWXjZ+HbT94sNCcYo4?=
 =?us-ascii?Q?T1F2CYYeBYqB836PbpaAbM2WWTGTjWMlCfMP7YfCsQ8RjLj5yK6KxrN+h61P?=
 =?us-ascii?Q?yXG0wPzP92X2yT5d17wIZdF3y2qHOMz3FCw8xFfIL8ilLYIBRYxjhKg2v5j/?=
 =?us-ascii?Q?sDu5KJwfQgUZ/Rc2SM1Cq0N8q5Q1gMnC0sLCqhzYyD4WhlSOq6zbv3r9rxpZ?=
 =?us-ascii?Q?0ClVSt9y/A69UgEwy6HCAh4JCJXSih9UdENTFGnAQ45DpB20jVA6nXomI22i?=
 =?us-ascii?Q?Nvrxww1RXuODKOhYOOWKeP40cKE6Q0Zq+AZa7NUDf9TiEQoCQbyGwWdNP0Wm?=
 =?us-ascii?Q?lnZJ0Ds4rzEL3TakGn/u2DYV+t4iE8Nvye0CSZL8KvMl+TfpOnfIOb0bBejE?=
 =?us-ascii?Q?mYo6qMIXEXJ6wSVGeVM9qPPmNOyJPtzSqEX3S4KJCan82HMkAOeBkOKLJS1l?=
 =?us-ascii?Q?zUha5IXVGESO+EKcZpg27S4jjAOxyj0kyBxIcOCjCLUR4dRWFK905VQDwRFR?=
 =?us-ascii?Q?lHRDxcjV9QSYoLq2CWHPBXHbobOIqMesJ3294PEY57W0ZccEvlljwasCdNna?=
 =?us-ascii?Q?TC1Matp2Rnq7lJzyx4/+ab0ow+a9+vqYkUwOVQ1yIC1xOlzQIdYY214rE2kg?=
 =?us-ascii?Q?q4Z1NwzzC6jMQYEWznfGxH9qoY/MNw2PXasLu2Yufmxb1swq1i3Kzb/yMCiS?=
 =?us-ascii?Q?SdfTBTFMj8dyukXss7c5LaN3efzpwgDB0ulKJdBDkI6reSQeGg4ihKcGJj6c?=
 =?us-ascii?Q?3nFOdnyrSfUoIPpLWjermHcvsDMXbPIrzEsjuBKFEH+anfdE++kZu54Ba5xy?=
 =?us-ascii?Q?10/Ps+t+zqjhxs3mPRobDKdP2zOH+z0X/rPN2TszvGAVcYlorImdvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yyLzRBkBVCJvTGR8tM5zPbYV1c7pPBfyUcOvszvFtkuu9UnOFb+zVutNTeAV?=
 =?us-ascii?Q?0QmNjo9PFuVbzZI1uVxFryNgdebs7dzJu45AB7Lt0g8urHCbLzS9ECDlqV1N?=
 =?us-ascii?Q?s4yXObOI3n9JkzDigdjeFS8QvNw4mKmXZ9SVUXchditZY/e76tney93U5W8X?=
 =?us-ascii?Q?Dv+HVywfckNfkrTittc/xUbJ5Q9tPwZXswyTWbKhTPmhkQyssympjoFZ/rC1?=
 =?us-ascii?Q?gvbxkqLILzQLP9p/eowbtXwgAVLFkDPJa7eMPCZqNmDvnQw7Cw0m1zTmGJ4m?=
 =?us-ascii?Q?CaECS5dx61G5d5fq3C8IsYZ7/VLillxIyJJvmOSbTIlrw+KBfL7ZNAqrzjeJ?=
 =?us-ascii?Q?yFsoPHwmelU1Fq0g+x3XV5sTReC/X1uBUtPrMHNdRge2/mbSwAri6BBrQkZC?=
 =?us-ascii?Q?Y8q2wdaxsjXquHLifNjNJ83rqT0bN44+7A/8rKewUo5MrW5DNscQyaNxz2r4?=
 =?us-ascii?Q?mUu+hkN8Vcj4vojnXqL/Bz7/5cyuchgvFAup0i1c/2PQq6EH/Db+ToVh6NE2?=
 =?us-ascii?Q?8juWCMPF2ljN4MKld1bHI8k3dHYZ4c/zCH1ZSh1MlI8EF/DU7TOuho+cUMyY?=
 =?us-ascii?Q?KGMB/CUvuTG0vJ/32GNS2kvxRgy/fZSdurPRci+NbSXc5pFhbgi8kiPLBACo?=
 =?us-ascii?Q?SONdpi+lLXSFxgnxQmwY1j5p4PybqwSY/fc4V86mvyCpjuBISO0dYSpV9Fb2?=
 =?us-ascii?Q?NRH83OfwRNxqdwGml3q154JXVfFft6xTHXaZ+VPBdVcAf+SR6WAe2Tmpn9Bb?=
 =?us-ascii?Q?cLyjIvi3hzCTq8MZpbsbRLW/l5mPVt9RzHK+tG1Yqcdb4ypUmqCrq5O7cKIK?=
 =?us-ascii?Q?yxVohloJGssnqH0usIJ7wrDbe/cUue4Fg6Marhywh2wgPZ1ZUx5KfyFMNzKm?=
 =?us-ascii?Q?v1H0YtXDc4oPkKs76kF7g/pUiloA7ZazZufR1SAmV0YfCZyZyPdJ/Txch51s?=
 =?us-ascii?Q?ywo94Bredw0dw28YePvRXxHW1KJz5I/X8qJhFZjb46HYeBk2424s5qxP2OrP?=
 =?us-ascii?Q?eZlMTMWeEPKyEqjqsnNq0Gs4qAchcxjtYEutiXWnL6YI7GS/tmjzNqoyeNND?=
 =?us-ascii?Q?Ycas2Ewq5+Sll3BMOsV1I0QwrVdW5D256j7/aLrMapxj+BU4KiWBuNTOYgHk?=
 =?us-ascii?Q?yQJP5IJkZyT+hXwD1r738tavrchmp1jNIxRwurDcS2pHSRwTS2GUYIYhbGln?=
 =?us-ascii?Q?i2t9T/QGEXC8BY6Z/WKF0A184xYgd12PpBHZsk1P69A7w3Z8wRQHi5uTs63u?=
 =?us-ascii?Q?KWBpYSxXYipFBU2yHs/svOV8r3Pfqwn2x7vAIAdyc0et1zII4koEX4iwy6aG?=
 =?us-ascii?Q?5kjoq1aFtYnwB922BVInN2sEG0shgUkG8ZpYQ+2xG9Dxz2/9K8qlTynuKEJt?=
 =?us-ascii?Q?SMGV4bbxiG3FvbDF3kRQhwLCsNhqCkljV+W+y+lxtYSc783EZGSO7tUuGc3T?=
 =?us-ascii?Q?2YtkxifSh5gdsxhTLcteD6MklV43h3sTEhbAQbhmjjQkVX2X8Re0Z3xlEDLI?=
 =?us-ascii?Q?siQEzM8JzFL/zBph2oYAKfU+pRFSrYDxu2Kws6YINhpAvWuis2QXVSSzgr8D?=
 =?us-ascii?Q?r3Y10I+3G60GITsO51q3/t315d2kd5duX+CAI0Zp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a7158e-7647-473f-dcbe-08dd78e2095f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:17.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qj9W8xPiVgU1eWThy47m6cl/uAebtELvU0F5j8EZeGlpZ3tHU39lGdn9zpS2WrfqjEbpBKGWAJ1lqME5K+nHqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
hash filter is implenented through a 64-bit hash table to match against
the hashed addresses, PF and VFs each have two MAC hash tables, one is
for unicast and the other one is for multicast. But MAC exact filter is
shared between SIs (PF and VFs), each table entry contains a MAC address
that may be unicast or multicast and the entry also contains an SI bitmap
field that indicates for which SIs the entry is valid.

For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
observation of the system default network configuration, the MAC filter
will be configured with multiple multicast addresses, so MAC exact filter
does not have enough entries to implement multicast filtering. Therefore,
the current MAC exact filter is only used for unicast filtering. If the
number of unicast addresses exceeds 4, then MAC hash filter is used.

Note that both MAC hash filter and MAC exact filter can only be accessed
by PF, VFs can notify PF to set its corresponding MAC filter through the
mailbox mechanism of ENETC. But currently MAC filter is only added for
i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
subsequent patches.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Refactor enetc4_pf_set_si_mac_promisc()
2. Split enetc4_pf_set_si_mac_hash_filter() into
enetc4_pf_set_si_uc_hash_filter() and enetc4_pf_set_si_mc_hash_filter()
3. Rename enetc4_pf_wq_task_init() to enetc4_psi_wq_task_init()
4. Rename enetc4_pf_do_set_rx_mode() to enetc4_psi_do_set_rx_mode()
5. Remove mac_list_lock and mac_list related functions
6. Add enetc4_pf_clear_maft_entries() and enetc4_pf_add_maft_entries()
7. Refactor enetc4_pf_set_mac_exact_filter() and rename it to
enetc4_pf_set_uc_exact_filter()
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |   3 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 251 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   3 +
 4 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index c3ebb32ce50c..1573ff06fcf4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -301,6 +301,9 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct workqueue_struct *workqueue;
+	struct work_struct rx_mode_task;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 695cb07c74bc..826359004850 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -99,6 +99,14 @@
 #define ENETC4_PSICFGR2(a)		((a) * 0x80 + 0x2018)
 #define  PSICFGR2_NUM_MSIX		GENMASK(5, 0)
 
+/* Port station interface a unicast MAC hash filter register 0/1 */
+#define ENETC4_PSIUMHFR0(a)		((a) * 0x80 + 0x2050)
+#define ENETC4_PSIUMHFR1(a)		((a) * 0x80 + 0x2054)
+
+/* Port station interface a multicast MAC hash filter register 0/1 */
+#define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
+#define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 175eebadde76..4c2d944d6b05 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -11,6 +11,15 @@
 
 #define ENETC_SI_MAX_RING_NUM	8
 
+#define ENETC_MAC_FILTER_TYPE_UC	BIT(0)
+#define ENETC_MAC_FILTER_TYPE_MC	BIT(1)
+#define ENETC_MAC_FILTER_TYPE_ALL	(ENETC_MAC_FILTER_TYPE_UC | \
+					 ENETC_MAC_FILTER_TYPE_MC)
+
+struct enetc_mac_addr {
+	u8 addr[ETH_ALEN];
+};
+
 static void enetc4_get_port_caps(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -26,6 +35,9 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
 
 	val = enetc_port_rd(hw, ENETC4_PMCAPR);
 	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
+
+	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
+	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
 }
 
 static void enetc4_pf_set_si_primary_mac(struct enetc_hw *hw, int si,
@@ -56,6 +68,180 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
+					 bool uc_promisc, bool mc_promisc)
+{
+	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+
+	if (uc_promisc)
+		val |= PSIPMMR_SI_MAC_UP(si);
+	else
+		val &= ~PSIPMMR_SI_MAC_UP(si);
+
+	if (mc_promisc)
+		val |= PSIPMMR_SI_MAC_MP(si);
+	else
+		val &= ~PSIPMMR_SI_MAC_MP(si);
+
+	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
+}
+
+static void enetc4_pf_set_si_uc_hash_filter(struct enetc_hw *hw, int si,
+					    u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
+}
+
+static void enetc4_pf_set_si_mc_hash_filter(struct enetc_hw *hw, int si,
+					    u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
+}
+
+static void enetc4_pf_clear_maft_entries(struct enetc_pf *pf)
+{
+	int i;
+
+	for (i = 0; i < pf->num_mfe; i++)
+		ntmp_maft_delete_entry(&pf->si->ntmp_user, i);
+
+	pf->num_mfe = 0;
+}
+
+static int enetc4_pf_add_maft_entries(struct enetc_pf *pf,
+				      struct enetc_mac_addr *mac,
+				      int mac_cnt)
+{
+	struct maft_entry_data maft = {};
+	u16 si_bit = BIT(0);
+	int i, err;
+
+	maft.cfge.si_bitmap = cpu_to_le16(si_bit);
+	for (i = 0; i < mac_cnt; i++) {
+		ether_addr_copy(maft.keye.mac_addr, mac[i].addr);
+		err = ntmp_maft_add_entry(&pf->si->ntmp_user, i, &maft);
+		if (unlikely(err)) {
+			pf->num_mfe = i;
+			goto clear_maft_entries;
+		}
+	}
+
+	pf->num_mfe = mac_cnt;
+
+	return 0;
+
+clear_maft_entries:
+	enetc4_pf_clear_maft_entries(pf);
+
+	return  err;
+}
+
+static int enetc4_pf_set_uc_exact_filter(struct enetc_pf *pf)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct enetc_mac_filter mac_filter = {};
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct enetc_mac_addr *mac_tbl;
+	struct netdev_hw_addr *ha;
+	int i = 0, err = 0;
+	int mac_cnt;
+
+	netif_addr_lock_bh(ndev);
+
+	mac_cnt = netdev_uc_count(ndev);
+	if (mac_cnt > max_num_mfe) {
+		err = -ENOSPC;
+		goto unlock_netif_addr;
+	}
+
+	/* No need to set MAC exact filter */
+	if (!mac_cnt)
+		goto unlock_netif_addr;
+
+	mac_tbl = kcalloc(mac_cnt, sizeof(*mac_tbl), GFP_ATOMIC);
+	if (!mac_tbl) {
+		err = -ENOMEM;
+		goto unlock_netif_addr;
+	}
+
+	netdev_for_each_uc_addr(ha, ndev) {
+		enetc_add_mac_addr_ht_filter(&mac_filter, ha->addr);
+		ether_addr_copy(mac_tbl[i++].addr, ha->addr);
+	}
+
+	netif_addr_unlock_bh(ndev);
+
+	/* Set temporary unicast hash filters in case of Rx loss when
+	 * updating MAC address filter table
+	 */
+	enetc4_pf_set_si_uc_hash_filter(hw, 0, *mac_filter.mac_hash_table);
+	enetc4_pf_clear_maft_entries(pf);
+
+	if (!enetc4_pf_add_maft_entries(pf, mac_tbl, i))
+		enetc4_pf_set_si_uc_hash_filter(hw, 0, 0);
+
+	kfree(mac_tbl);
+
+	return 0;
+
+unlock_netif_addr:
+	netif_addr_unlock_bh(ndev);
+
+	return err;
+}
+
+static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
+{
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_filter *mac_filter;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct netdev_hw_addr *ha;
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		mac_filter = &pf->mac_filter[UC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_uc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_uc_hash_filter(hw, 0,
+						*mac_filter->mac_hash_table);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		mac_filter = &pf->mac_filter[MC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_mc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mc_hash_filter(hw, 0,
+						*mac_filter->mac_hash_table);
+	}
+	netif_addr_unlock_bh(ndev);
+}
+
+static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
+{
+	/* Currently, the MAC address filter table (MAFT) only has 4 entries,
+	 * and multiple multicast addresses for filtering will be configured
+	 * in the default network configuration, so MAFT is only suitable for
+	 * unicast filtering. If the number of unicast addresses exceeds the
+	 * table capacity, the MAC hash filter will be used.
+	 */
+	if (type & ENETC_MAC_FILTER_TYPE_UC && enetc4_pf_set_uc_exact_filter(pf)) {
+		/* Clear the old MAC exact filter */
+		enetc4_pf_clear_maft_entries(pf);
+		/* Fall back to the MAC hash filter */
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC)
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
@@ -303,12 +489,55 @@ static void enetc4_pf_free(struct enetc_pf *pf)
 	enetc4_free_ntmp_user(pf->si);
 }
 
+static void enetc4_psi_do_set_rx_mode(struct work_struct *work)
+{
+	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
+	struct enetc_pf *pf = enetc_si_priv(si);
+	struct net_device *ndev = si->ndev;
+	struct enetc_hw *hw = &si->hw;
+	bool uc_promisc = false;
+	bool mc_promisc = false;
+	int type = 0;
+
+	if (ndev->flags & IFF_PROMISC) {
+		uc_promisc = true;
+		mc_promisc = true;
+	} else if (ndev->flags & IFF_ALLMULTI) {
+		mc_promisc = true;
+		type = ENETC_MAC_FILTER_TYPE_UC;
+	} else {
+		type = ENETC_MAC_FILTER_TYPE_ALL;
+	}
+
+	enetc4_pf_set_si_mac_promisc(hw, 0, uc_promisc, mc_promisc);
+
+	if (uc_promisc) {
+		enetc4_pf_set_si_uc_hash_filter(hw, 0, 0);
+		enetc4_pf_clear_maft_entries(pf);
+	}
+
+	if (mc_promisc)
+		enetc4_pf_set_si_mc_hash_filter(hw, 0, 0);
+
+	/* Set new MAC filter */
+	enetc4_pf_set_mac_filter(pf, type);
+}
+
+static void enetc4_pf_set_rx_mode(struct net_device *ndev)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+
+	queue_work(si->workqueue, &si->rx_mode_task);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
+	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 };
 
 static struct phylink_pcs *
@@ -714,6 +943,19 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static int enetc4_psi_wq_task_init(struct enetc_si *si)
+{
+	char wq_name[24];
+
+	INIT_WORK(&si->rx_mode_task, enetc4_psi_do_set_rx_mode);
+	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
+	si->workqueue = create_singlethread_workqueue(wq_name);
+	if (!si->workqueue)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -748,10 +990,14 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 		return err;
 
 	pf = enetc_si_priv(si);
-	err = enetc4_pf_init(pf);
+	err = enetc4_psi_wq_task_init(si);
 	if (err)
 		return err;
 
+	err = enetc4_pf_init(pf);
+	if (err)
+		goto err_pf_init;
+
 	enetc_get_si_caps(si);
 
 	err = enetc4_pf_netdev_create(si);
@@ -762,6 +1008,8 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 err_netdev_create:
 	enetc4_pf_free(pf);
+err_pf_init:
+	destroy_workqueue(si->workqueue);
 
 	return err;
 }
@@ -773,6 +1021,7 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
+	destroy_workqueue(si->workqueue);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a8b3c8d14254..ae407e9e9ee7 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -23,6 +23,7 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
+	int mac_filter_num;
 };
 
 struct enetc_pf;
@@ -60,6 +61,8 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
+
+	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
-- 
2.34.1


