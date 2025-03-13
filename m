Return-Path: <linuxppc-dev+bounces-6979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A1A5FBE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 17:36:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDCmX5xCjz3bwp;
	Fri, 14 Mar 2025 03:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741883756;
	cv=pass; b=bjB4RYsUblDxi7yujysg1ZhVq42EvLYctiGLIm8JxXf6qWoFeke5XK42hyLrOAnEmBwSsuGe4Ao+8xBlp3cGrsOdTClxJwV4mi9KDZHh4Yz0v473nH/Od5v/ZuBpoYl4ImxGGtU9Y5Z4HYVeSEyoFkDL4e349JD4LWr8uo3KLKKUn0tvCmdVUhkOlA5KFYQWph7vvDN5kPMupnr63DSgue8HW2chQsfwUk9ZorMLvZyGXLWCEcCkuwYA822Vz/7fT0FkiQt6Vkg7lqCjqWaR4oQXureAtdV0re2kBQNnCRnbYE7287CPttkA5gTeiPG0o/vhYeJOHixIhsgcpUFNiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741883756; c=relaxed/relaxed;
	bh=Ej2f3+3nDyCIe4KkTLJgRT/uK/tzUh6M9PtQ7LcYZao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XPkpSbTW9a3PtdjVPGglnWttPujkq5cyPLBYfjDX3Y7z2fkJpf2G1ZSWh/o8xuyzR9KxDVFgxjcQC3Jx5yV9B9im63nEeZST1meKXCmy9vP2xEQBrZggGPO5DRFBQK0ZeJhsx4e7F9HJXJHTXgti9WAjhaRlEoiS/vPKhCL133yy7AvsDt8ycV2i4lfu5maxofB1cd3+/txc7yN/ERlOTNLvsE1ijRUQh3zwso1WMofMkbaF0hMfityO6NQO9txmDzllEhYshQe+5k5BXLN4At4HQtRU6EnA+MJY0mgKfHldk/ZIQDpTB5gT/p/A15dpiNKhzuJH/SGVK2qgARdYzA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bcXlmNxj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bcXlmNxj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDCmW0dxjz2ygS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 03:35:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isMUqCt2OzS2sQSZwOQPxaO4J4PdS7lw5Qb5GK8Z+GLpxMPsM7xLv+Iqeig882P4mOZadgBWCSJ6+LZkTcjcQX3mN3FxgKtM2NU5Q/5wfwZhkO81y5ZgIkAZmdqn/017YXyA/Fj/WW2mc27dEsCP62vJdSPzrWtfbVvbOi2AP8YwLZ6kX0eqJ+9zjkPP80GkZNzJCQ1XceqL/kzIQdC94QttG2wmYbHzIgzx2u49WXT0uaz/Mq3pF2RzPpxOkzUbeEeiApraGzmc0vKTSmp6qWw2RI5oOouc3KmVLnp6g4UEWIXqWVqfxkWLLW17Xi4Rb4uj1KBhsTFTJN6khtcg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej2f3+3nDyCIe4KkTLJgRT/uK/tzUh6M9PtQ7LcYZao=;
 b=kARAemLvuTHr7U3eCK2g+0w+0lC44Iu9jtw5b6GMGO9cGJXYtGa9iMFYDKEyYO/CjYdDLbl/7otAGW3gPdBw0GZy+zzzTuGbjJdf9FmejQv+gyJ+Ifzpaaqf2oPunmbbihIb2ByUmzIxicD4c3ELIWPnRjddeQ6PUNGEDgvTIAQruTnmAcLcRObm0RU0HDJRnUuppywXx6qXE2eiTNtVilgs67yn+SdXiV/NhrYvBmaa8W+XcGNEC6CP0IPhbfINlcTmB1zf0Nf50nIlMTVjLoJ9tXb0+yVonp+8p6zwHUii6MLRMvJd3WI+5N5zK40bzcosfKSkWCi/SUXPnpyN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej2f3+3nDyCIe4KkTLJgRT/uK/tzUh6M9PtQ7LcYZao=;
 b=bcXlmNxjjSqj/e7/Q+NAIUFS7PCOu1AkjTsjV9V/ftth73qr6+iWg4HuYsPNXhbgPlZ17C09hBuPKXjX5AKgjNA9UK9D/1WQWTSX2f2bkJJXbPtukzWvGwyCt3Tb2J+tMAtgnRsDm24ARPuZqnyWaHpO58PnZg4gxrp4PHIv8uB4Ohq13xageo5+6ak1h8cf3fmiARK9EUZsnH4JMzxFGf/PFhuz07F0r+eSjKAQ7hks+vgine1Mlg5xnrT+4G7VtgpReAcL+vVM6b8uwQz2bA7oAP0iXdJPbj2YKIgRAzuUdAKKuCgTO6tqBQGVIj/lODkvK3owKV5Z4oJNQu+92Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM7PR04MB7128.eurprd04.prod.outlook.com (2603:10a6:20b:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 16:35:30 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 16:35:29 +0000
Date: Thu, 13 Mar 2025 18:35:26 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250313163526.pqwp2wsfvio7avs6@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-2-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::45) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM7PR04MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe83c20-6444-4343-fe5b-08dd624d1109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRtKTJvC5x09/DzsicBCC9+FkYsrDVHndSfpREdPg+r4jASO6kFSwd/frMce?=
 =?us-ascii?Q?DGgHKUW1MFoWHGSeJeGxvWhI9k3oP8cEdauNrYAFqLj+pQZbN4BsuO+gl7Ez?=
 =?us-ascii?Q?6S2XIGS63cJxMUn7GJLvNUKzjC+s6nvn5LZljOTAotCaYu4YxbFHg7MF0az8?=
 =?us-ascii?Q?Dh6XFa73MqJNDW7iRqHgigpQLNlSeIBKfv88P+TuVblZMtv2kqY6oKDetP63?=
 =?us-ascii?Q?rL1eEvL30EpgaETGUUWPCQ6iuyK6ths75s3KPunFRDW2t5bDmlrfm0+VclBs?=
 =?us-ascii?Q?H7wS8cyk6JiYgm/wqJkFngmW1NnLnSv7pKa8NEqCz+Swe9+hDL8RRqDkJnbK?=
 =?us-ascii?Q?KYoY5EmvMV4iNZbAyjlqOUogdM4bT+pQ86r22Erdt3NguVTs1mlpDbA1VB0q?=
 =?us-ascii?Q?IFjacUzy+UwKoKm7evvqDnVqVVhdWpVT+kDS+TJzaDCWQ+um7rOfyecom0/k?=
 =?us-ascii?Q?rQqnjzslh7vpslXHGC/Wq2rkWwLEgo2J50yDsE4tLaXTANBp2cfUE26l0pm9?=
 =?us-ascii?Q?fqMlV0XG0mrB6sWS+xGI0z2DT5vXIAd1LveHTUoZDUVt/ozaW28p8rZln6ja?=
 =?us-ascii?Q?a0+mt2F2JbZookl9NVPfRsTZaU1VfbZ1WEAD3+9qUc899DILn1xEK4mmhzrO?=
 =?us-ascii?Q?KsSjiG/0R+IJb+OAD+QMsFNL/yJl01aJvkyvM0YVTmRQixZ7nM2pGOnP7Ux1?=
 =?us-ascii?Q?5CdIVrHh2Cya7H7AEIUJBSRVZoUcmWhnZ9K9RYil7rahy4I9zoa14oTojyVH?=
 =?us-ascii?Q?KC2AJ18NICX0wS57rVwE1RtN6jjWwzSiC7ANgmodFg/Whb0OPRDy3tIO8+sl?=
 =?us-ascii?Q?lOQWPqlIhjp7d+VpH0W3MZkJ1VPwmDTXc/JdE0QxyWxDELpnYRVPyc47gzCw?=
 =?us-ascii?Q?+wxbhzP12KHSi3+XAGNAMrHtlvGf+4ozgmoRTTMpEvIfFRgTdxIo7mhVf0Ff?=
 =?us-ascii?Q?5WXuQKzVB0RcLBn5ny5H9ktSQ7jejoePc6ikpoSlkBfV1jkKyT4N7ro5ojIV?=
 =?us-ascii?Q?o2OUbVpKhTI4CKAHTw9F2YO6/GtJOGz47Rtln7cBg0v3jJLZFeCnYvb3C0o5?=
 =?us-ascii?Q?SPGJ2u91I9xDNB3xxD243J3a3HMXrhvTYJyM0xi+Ax2q4Ing34FMGYl94WmH?=
 =?us-ascii?Q?jJfvxaJ5dTcVKQsOkM28bgcgXLODMem9EgGLrbKrJHGYf4sYzCtfg6PcStox?=
 =?us-ascii?Q?u5wbKkfkXxRiXYuqtUVrz3ICjQwbonub2j3ji2+ZfV3y13oUW4x5WYT/LxTt?=
 =?us-ascii?Q?ZvSRBoHNWNcw1SFdPMsJfTd1fFFnqELceUK7gVurKqPPtHJ84oSoflIVPJng?=
 =?us-ascii?Q?Wt+AGBb0O64/z/hCymi08ygwK89LKJQxQ2SMQcz1sk6sMcZqGZ+CADZt2Pp9?=
 =?us-ascii?Q?AF0G1/hThGSxBSI+F159+g5SS63h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEEhx/1ELSiqlQI3MU0qTRvPJp6L1uR5MYiHxewpJiZc6Dq6PwlLde7g6LzR?=
 =?us-ascii?Q?74Y0fOCucb3GOfpWxmL0PmIvGY78w8RBMrfy2HyLqlrOepizEsxVrpI0JyYC?=
 =?us-ascii?Q?4PCHrDKmFt0dyfkszNixLO33gTEYcLv2RuegbbsQWLCljEdJ9UHLxGvOJUbb?=
 =?us-ascii?Q?K85JL78Uid8nUzyDd1wpp1dO+gPPl7wfoRvDI9WZBOln+92JNtCIVgC+980V?=
 =?us-ascii?Q?mnBaPD+J5tQwpsEVvqW7HMSVnIxWnWeB0UdunR3Zu8msQ3GPqoR+ewZ1560G?=
 =?us-ascii?Q?leqQ4xCo0ug8bkSk/qCKi0kko2NQO3twd50NTV6kLp6Uxiuyu/49dW99U3XL?=
 =?us-ascii?Q?5rGhnYxbkzh5chK/P8KiHaepJq5nHm1fWzsxWGBor2Q4VKkd4icBiKdLAwcI?=
 =?us-ascii?Q?BtHzM8rFb0dt5Dzxt0q7LTc01qtM59EGU39FWzq/PVfc34nbDv129QcoZoiH?=
 =?us-ascii?Q?IDZa84Yq2e1hgTnU8BcKTfHQyFo+q9p14ryR6VVR5iGVFWOK0FUDxUGFc2oi?=
 =?us-ascii?Q?GrNt1hCbfaUgekjD/K0US74zixWIQSSwqT/ymOT+Zdg87pKn6M2HbPLiPtpw?=
 =?us-ascii?Q?y/iTiANTZn+2oIDGpJpeSv5LXFTeJA6iXbddreQACR0wRV3ZEzF6nGFmnRBk?=
 =?us-ascii?Q?5rHqsMMa9ZvbdwF2WUTc/e9+Zu0fMFsEriljxfrEn3FqoPwqucfmL5UeDnDj?=
 =?us-ascii?Q?M44fwvuC240uiy2hInlTCThq8LlXlcDsLp46Ch+XLZTRPM4HKgLm6w3OHqzq?=
 =?us-ascii?Q?ziKpWGZ3R99tDBtE7LUNaC+ShYDJv/IKRPjVJySop5IGsQvMtwQDDvudb3Ie?=
 =?us-ascii?Q?2G0+HbdiXC0wrfcgf+8nmdbqUDQurY/heUBhmNJWz7L5g7/CDnu9aut0W+tq?=
 =?us-ascii?Q?i+1vv7MQAofj2Vq29RYUPmIXWoqdoJQgOltp3y1jdJb5XJQ3862TWtuz4uSw?=
 =?us-ascii?Q?YDsaTmh+kjvOBrVZ/Y7MiHnPVyzb0jYE7c7o9h+EGmaUdTpUJXSHIG4oh8QA?=
 =?us-ascii?Q?R8MuASxYqwb3/n/WFa9SxPmN0PW44oHHnYiahazSZc7w+eRLkf4kE3FjYwD9?=
 =?us-ascii?Q?jCyjLg4yf3Gjc2W/h9MCHpvDtCihSF0nw0sdFvyycTb7QIdOJbWIV6M9VmDo?=
 =?us-ascii?Q?53MelccUWBd2uPyQFmvAySDGNZQb0VATFX+9ZW2E6CjexQpLvpMFXPI6ny+b?=
 =?us-ascii?Q?rd9biAUIWnaUSWR54q1Qtt6Al3cpw20/8eFDf9g2MUskKeqbyMF2OFNVK6YB?=
 =?us-ascii?Q?p5UxWClkOKRdEXXusO5qJQUyUIdpsb7yHZ+AhdmGKcNSgIBJc7c7IPOpXNAT?=
 =?us-ascii?Q?HaPb5xAjmnJSPOtF6quJqGBKHdobNjMT+bAkvJaxDXrQb0ciGZDdsOe2TvDX?=
 =?us-ascii?Q?xDkgwPf7TqxGzp/IMelkVfMA48tvn9seslrmt2VIEMwTvCq9wO4MNBehkul3?=
 =?us-ascii?Q?UDSRgvELLfA57Bp67cgDFiLg8wxIVo/CL990LcmjPl7X9oGIWMRTGPe+k3zi?=
 =?us-ascii?Q?hyiLc72ZZn3zc9J7JJUeLorzXUh/YEppoavE7ark+kN9WcfqriS/N1lm+KxT?=
 =?us-ascii?Q?V/DJsjkcoYoBAAhLemqgp+tJT5TWvgklRlJobxGvlJgDsQnCATXmH3JvfmHa?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe83c20-6444-4343-fe5b-08dd624d1109
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 16:35:29.8729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL6jwr85uXzeVV9h7v2G6wXiH+qLFvGzQIWVHMrS8/zetuvAtab5KOiFXEy3E24sB9qDrF2jMLEqw4jdvvsFtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7128
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:17PM +0800, Wei Fang wrote:
> +int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs, u32 *table,
> +				    int count, bool query)
> +{
> +	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
> +	struct rsst_req_update *requ;
> +	struct ntmp_req_by_eid *req;
> +	union netc_cbd cbd;
> +	int err, i;
> +	u32 len;
> +
> +	if (count != RSST_ENTRY_NUM)
> +		/* HW only takes in a full 64 entry table */
> +		return -EINVAL;
> +
> +	if (query)
> +		data.size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
> +			    RSST_CFGE_DATA_SIZE(count);
> +	else
> +		data.size = struct_size(requ, groups, count);
> +
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Set the request data buffer */
> +	if (query) {
> +		ntmp_fill_crd_eid(req, cbdrs->tbl.rsst_ver, 0, 0, 0);
> +		len = NTMP_LEN(sizeof(*req), data.size);
> +		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
> +					NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);

Please either use a commonly accepted abbreviation such as "hdr", or preferably,
just spell "header" as such. This reminded me of Kevin Malone's quote
"Why waste time say lot word when few word do trick?" :)

> +	} else {
> +		requ = (struct rsst_req_update *)req;
> +		ntmp_fill_crd_eid(&requ->rbe, cbdrs->tbl.rsst_ver, 0,
> +				  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
> +		for (i = 0; i < count; i++)
> +			requ->groups[i] = (u8)(table[i]);
> +
> +		len = NTMP_LEN(data.size, 0);
> +		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
> +					NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
> +	}
> +
> +	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
> +	if (err) {
> +		dev_err(cbdrs->dma_dev, "%s RSS table entry failed (%d)",
> +			query ? "Query" : "Update", err);
> +		goto end;
> +	}
> +
> +	if (query) {
> +		u8 *group = (u8 *)req;
> +
> +		group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
> +		for (i = 0; i < count; i++)
> +			table[i] = group[i];
> +	}
> +
> +end:
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_rsst_query_or_update_entry);

Instead of exporting "query_or_update" mixed semantics, can you please
export two separate functions, one for "query" and the other for "update"?
For query=false, you can make the "table" argument const.

Also, from the looks of their implementation, there isn't much that is
common anyway.

> +static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
> +{
> +	void *buf;
> +
> +	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
> +				 &data->dma, GFP_ATOMIC);

Is there any call site that can't use sleeping allocations (GFP_KERNEL)?

> +	if (!buf)
> +		return -ENOMEM;
> +
> +	data->buf = buf;
> +	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
> +
> +	return 0;
> +}
> +
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> new file mode 100644
> index 000000000000..45e4d083ab0a
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/*
> + * NTMP table request and response data buffer formats
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __NTMP_PRIVATE_H
> +#define __NTMP_PRIVATE_H
> +
> +#include <linux/fsl/ntmp.h>
> +
> +struct ntmp_dma_buf {
> +	struct device *dev;
> +	size_t size;
> +	void *buf;
> +	dma_addr_t dma;
> +};
> +
> +struct common_req_data {

Some maintainers prefer to avoid definitions which "sound" generic, but truly
are driver-specific, and instead recommend to prefix their names with
some kind of driver specific indication
(example: https://lore.kernel.org/netdev/20190413205311.GC2268@nanopsycho.orion/).

So, maybe something like "ntmp_common_req_data", "ntmp_common_resp_query", ...
would make that more clear?

> +	__le16 update_act;
> +	u8 dbg_opt;
> +	u8 tblv_qact;
> +#define NTMP_QUERY_ACT		GENMASK(3, 0)
> +#define NTMP_TBL_VER		GENMASK(7, 0)
> +#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
> +				 ((a) & NTMP_QUERY_ACT))

Can you please move #define macros out of structure definitions?

> +};
> +
> +struct common_resp_query {
> +	__le32 entry_id;
> +};
> +
> +struct common_resp_nq {
> +	__le32 status;
> +};
> +
> +/* Generic structure for request data by entry ID  */
> +struct ntmp_req_by_eid {
> +	struct common_req_data crd;
> +	__le32 entry_id;
> +};
> +
> +/* MAC Address Filter Table Request Data Buffer Format of Add action */
> +struct maft_req_add {
> +	struct ntmp_req_by_eid rbe;
> +	struct maft_keye_data keye;
> +	struct maft_cfge_data cfge;
> +};
> +
> +/* MAC Address Filter Table Response Data Buffer Format of Query action */
> +struct maft_resp_query {
> +	__le32 entry_id;
> +	struct maft_keye_data keye;
> +	struct maft_cfge_data cfge;
> +};
> +
> +/* RSS Table Request Data Buffer Format of Update action */
> +struct rsst_req_update {
> +	struct ntmp_req_by_eid rbe;
> +	u8 groups[];
> +};
> +
> +#endif
> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> new file mode 100644
> index 000000000000..fe15e394c4a4
> --- /dev/null
> +++ b/include/linux/fsl/ntmp.h
> @@ -0,0 +1,174 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/* Copyright 2025 NXP */
> +#ifndef __NETC_NTMP_H
> +#define __NETC_NTMP_H
> +
> +#include <linux/bitops.h>
> +#include <linux/if_ether.h>
> +
> +#define NTMP_NULL_ENTRY_ID		0xffffffffU
> +#define NETC_CBDR_BD_NUM		256
> +
> +union netc_cbd {

Do you seriously need to export the netc_cbd definition outside of
drivers/net/ethernet/freescale/enetc/ntmp.c? I would say even if you do
(which this patch set doesn't appear to need), the NTMP library exports
an API which doesn't do a great job abstracting the information.

The question pertains to everything else that is exported to
include/linux/fsl/ntmp.h - what the API consumer sees. Is there a real
reason to export it? For many structures and macros, the answer seems no.

Even for cases like struct maft_keye_data which are only used by debugfs,
it still seems preferable to keep data encapsulation and offer a helper
function to retrieve a pointer to the MAC address from the MAFT entry.
Then, "struct maft_keye_data;" can simply be declared, without exposing
its full definition.

> +	struct {
> +		__le64 addr;
> +		__le32 len;
> +#define NTMP_RESP_LEN		GENMASK(19, 0)
> +#define NTMP_REQ_LEN		GENMASK(31, 20)
> +#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
> +				((resp) & NTMP_RESP_LEN))
> +		u8 cmd;
> +#define NTMP_CMD_DELETE		BIT(0)
> +#define NTMP_CMD_UPDATE		BIT(1)
> +#define NTMP_CMD_QUERY		BIT(2)
> +#define NTMP_CMD_ADD		BIT(3)
> +#define NTMP_CMD_QD		(NTMP_CMD_QUERY | NTMP_CMD_DELETE)
> +#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
> +#define NTMP_CMD_AU		(NTMP_CMD_ADD | NTMP_CMD_UPDATE)
> +#define NTMP_CMD_AQ		(NTMP_CMD_ADD | NTMP_CMD_QUERY)
> +#define NTMP_CMD_AQU		(NTMP_CMD_AQ | NTMP_CMD_UPDATE)
> +		u8 access_method;
> +#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
> +#define NTMP_AM_ENTRY_ID	0
> +#define NTMP_AM_EXACT_KEY	1
> +#define NTMP_AM_SEARCH		2
> +#define NTMP_AM_TERNARY_KEY	3
> +		u8 table_id;
> +		u8 ver_cci_rr;
> +#define NTMP_HDR_VERSION	GENMASK(5, 0)
> +#define NTMP_HDR_VER2		2
> +#define NTMP_CCI		BIT(6)
> +#define NTMP_RR			BIT(7)
> +		__le32 resv[3];
> +		__le32 npf;
> +#define NTMP_NPF		BIT(15)
> +	} req_hdr;	/* NTMP Request Message Header Format */
> +
> +	struct {
> +		__le32 resv0[3];
> +		__le16 num_matched;
> +		__le16 error_rr;
> +#define NTMP_RESP_ERROR		GENMASK(11, 0)
> +#define NTMP_RESP_RR		BIT(15)
> +		__le32 resv1[4];
> +	} resp_hdr; /* NTMP Response Message Header Format */
> +};
> +
> +struct maft_keye_data {
> +	u8 mac_addr[ETH_ALEN];
> +	__le16 resv;
> +};
> +
> +struct maft_cfge_data {
> +	__le16 si_bitmap;
> +	__le16 resv;
> +};
> +
> +struct netc_cbdr_regs {
> +	void __iomem *pir;
> +	void __iomem *cir;
> +	void __iomem *mr;
> +
> +	void __iomem *bar0;
> +	void __iomem *bar1;
> +	void __iomem *lenr;
> +};
> +
> +struct netc_tbl_vers {
> +	u8 maft_ver;
> +	u8 rsst_ver;
> +};
> +
> +struct netc_cbdr {
> +	struct netc_cbdr_regs regs;
> +
> +	int bd_num;
> +	int next_to_use;
> +	int next_to_clean;
> +
> +	int dma_size;
> +	void *addr_base;
> +	void *addr_base_align;
> +	dma_addr_t dma_base;
> +	dma_addr_t dma_base_align;
> +
> +	spinlock_t ring_lock; /* Avoid race condition */

Can this description be more specific? This type of comment is as
useful as not having it. Make the reader understand what is serialized
with what, to prevent concurrent, non-atomic access to what resources.

> +};
> +
> +struct netc_cbdrs {
> +	int cbdr_num;	/* number of control BD ring */
> +	int cbdr_size;	/* number of BDs per control BD ring */
> +	struct device *dma_dev;
> +	struct netc_cbdr *ring;
> +	struct netc_tbl_vers tbl;
> +};
> +
> +enum netc_dev_type {
> +	NETC_DEV_ENETC,
> +	NETC_DEV_SWITCH
> +};

Can you delay the introduction of this distinction until when the
"dev_type" will actually be used for something, and it's clear to
reviewers what is the intention behind it? Currently the switch driver
does not exist, and this has no purpose.

> +
> +struct ntmp_priv {

Would it be better to name this "struct ntmp_client"? I don't really
understand the way in which it is "private".

I'm looking at this from an API perspective, and I don't really
understand which one is the "top-level" object for an NTMP consumer
driver. Is it ntmp_priv or netc_cbdrs? Logically, ntmp_priv encapsulates
netc_cbdrs, but I see that all functions take the smaller netc_cbdrs,
which I find unintuitive. Could you just perhaps squash them into a
single structure, if they in fact serve the same purpose?

> +	enum netc_dev_type dev_type;
> +	struct netc_cbdrs cbdrs;
> +};
> +
> +struct maft_entry_data {
> +	struct maft_keye_data keye;
> +	struct maft_cfge_data cfge;
> +};

> +static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
> +				   u8 tbl_ver, u32 entry_id, u32 req_len,
> +				   u32 resp_len)
> +{
> +	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
> +	struct ntmp_req_by_eid *req;
> +	union netc_cbd cbd;
> +	u32 len;
> +	int err;
> +
> +	if (entry_id == NTMP_NULL_ENTRY_ID)
> +		return 0;

What's the idea with the null entry ID? Why special-case it?

> +
> +	/* If the req_len is 0, indicates the requested length is the
> +	 * standard length.
> +	 */
> +	if (!req_len)
> +		req_len = sizeof(*req);

Objection: as submitted in this patch set, the req_len argument is _only_
passed as zero (the only caller is ntmp_maft_delete_entry()). I don't
know about downstream, but let's only add complexity that we need, when
we need it.

> +
> +	data.size = req_len >= resp_len ? req_len : resp_len;
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
> +	len = NTMP_LEN(req_len, resp_len);
> +	ntmp_fill_request_headr(&cbd, data.dma, len, tbl_id,
> +				NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
> +
> +	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
> +	if (err)
> +		dev_err(cbdrs->dma_dev, "Delete table (id: %d) entry failed: %d",
> +			tbl_id, err);
> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +
> +static int ntmp_query_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
> +				  u32 len, struct ntmp_req_by_eid *req,
> +				  dma_addr_t dma, bool compare_eid)
> +{
> +	struct device *dev = cbdrs->dma_dev;
> +	struct common_resp_query *resp;
> +	int cmd = NTMP_CMD_QUERY;
> +	union netc_cbd cbd;
> +	u32 entry_id;
> +	int err;
> +
> +	entry_id = le32_to_cpu(req->entry_id);
> +	if (le16_to_cpu(req->crd.update_act))
> +		cmd = NTMP_CMD_QU;
> +
> +	/* Request header */
> +	ntmp_fill_request_headr(&cbd, dma, len, tbl_id,
> +				cmd, NTMP_AM_ENTRY_ID);
> +
> +	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
> +	if (err) {
> +		dev_err(dev, "Query table (id: %d) entry failed: %d\n",
> +			tbl_id, err);
> +		return err;
> +	}
> +
> +	/* For a few tables, the first field of its response data is not

s/its/their/

> +	 * entry_id, so directly return success.
> +	 */
> +	if (!compare_eid)
> +		return 0;
> +
> +	resp = (struct common_resp_query *)req;
> +	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
> +		dev_err(dev, "Table (id: %d) query EID:0x%0x, response EID:0x%x\n",

Can you please put some spaces between ":" and "0".

> +			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
> +			struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
> +	struct maft_req_add *req;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	data.size = sizeof(*req);
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Set mac address filter table request data buffer */
> +	ntmp_fill_crd_eid(&req->rbe, cbdrs->tbl.maft_ver, 0, 0, entry_id);
> +	req->keye = maft->keye;
> +	req->cfge = maft->cfge;
> +
> +	ntmp_fill_request_headr(&cbd, data.dma, NTMP_LEN(data.size, 0),
> +				NTMP_MAFT_ID, NTMP_CMD_ADD,
> +				NTMP_AM_ENTRY_ID);
> +	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
> +	if (err)
> +		dev_err(cbdrs->dma_dev, "Add MAFT entry failed (%d)", err);

Can you use symbolic error names? "Adding MAFT entry failed: %pe\n", ERR_PTR(err).
Also notice the missing \n in the error message..

Same comment for the error message in:
- ntmp_delete_entry_by_id()
- ntmp_rsst_query_or_update_entry() - which as per review feedback here
  should become 2 functions

> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
> +
> +int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
> +			  struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
> +	struct maft_resp_query *resp;
> +	struct ntmp_req_by_eid *req;
> +	u32 req_len = sizeof(*req);
> +	int err;
> +
> +	if (entry_id == NTMP_NULL_ENTRY_ID)
> +		return -EINVAL;
> +
> +	data.size = sizeof(*resp);
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
> +	err = ntmp_query_entry_by_id(cbdrs, NTMP_MAFT_ID,
> +				     NTMP_LEN(req_len, data.size),
> +				     req, data.dma, true);
> +	if (err)
> +		goto end;
> +
> +	resp = (struct maft_resp_query *)req;
> +	maft->keye = resp->keye;
> +	maft->cfge = resp->cfge;
> +
> +end:
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
> +
> +int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
> +{
> +	return ntmp_delete_entry_by_id(cbdrs, NTMP_MAFT_ID,
> +				       cbdrs->tbl.maft_ver,
> +				       entry_id, 0, 0);
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);

> +static void netc_clean_cbdr(struct netc_cbdr *cbdr)
> +{
> +	union netc_cbd *cbd;
> +	int i;
> +
> +	i = cbdr->next_to_clean;
> +	while (netc_read(cbdr->regs.cir) != i) {
> +		cbd = netc_get_cbd(cbdr, i);
> +		memset(cbd, 0, sizeof(*cbd));
> +		i = (i + 1) % cbdr->bd_num;
> +	}
> +
> +	cbdr->next_to_clean = i;
> +}
> +
> +static struct netc_cbdr *netc_select_cbdr(struct netc_cbdrs *cbdrs)
> +{
> +	int i;
> +
> +	for (i = 0; i < cbdrs->cbdr_num; i++) {
> +		if (spin_is_locked(&cbdrs->ring[i].ring_lock))
> +			continue;
> +
> +		return &cbdrs->ring[i];
> +	}
> +
> +	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];

I think you need to be in a "preemption disabled" / "migration disable"
calling context for smp_processor_id() to be reliable. Otherwise, the
task can migrate to another CPU as soon as this function returns.

Anyway, much can be said about this, but currently it is useless
complexity, because the only user, enetc4_setup_cbdr(), sets
"cbdrs->cbdr_num = 1", which side-steps the entire netc_select_cbdr()
logic.

Please strip all unnecessary logic and only add it when the need
presents itself, so we can all assess whether the solution is
appropriate for that particular need.

> +}
> +
> +static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd *cbd)
> +{
> +	union netc_cbd *cur_cbd;
> +	struct netc_cbdr *cbdr;
> +	int i, err;
> +	u16 status;
> +	u32 val;
> +
> +	if (cbdrs->cbdr_num == 1)
> +		cbdr = &cbdrs->ring[0];
> +	else
> +		cbdr = netc_select_cbdr(cbdrs);
> +
> +	spin_lock_bh(&cbdr->ring_lock);
> +
> +	if (unlikely(!netc_get_free_cbd_num(cbdr)))
> +		netc_clean_cbdr(cbdr);
> +
> +	i = cbdr->next_to_use;
> +	cur_cbd = netc_get_cbd(cbdr, i);
> +	*cur_cbd = *cbd;
> +
> +	/* Update producer index of both software and hardware */
> +	i = (i + 1) % cbdr->bd_num;
> +	cbdr->next_to_use = i;
> +	dma_wmb();

Can you place this dma_wmb() right next to the "*cur_cbd = *cbd" line,
to make it obvious that updating the producer index has nothing to do
with it? Or is there another reason for this ordering?

> +	netc_write(cbdr->regs.pir, i);
> +
> +	err = read_poll_timeout_atomic(netc_read, val, val == i,
> +				       10, NETC_CBDR_TIMEOUT, true,
> +				       cbdr->regs.cir);
> +	if (unlikely(err))
> +		goto cbdr_unlock;
> +
> +	dma_rmb();
> +	/* Get the writeback command BD, because the caller may need
> +	 * to check some other fields of the response header.
> +	 */
> +	*cbd = *cur_cbd;
> +
> +	/* Check the writeback error status */
> +	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
> +	if (unlikely(status)) {
> +		err = -EIO;
> +		dev_err(cbdrs->dma_dev, "Command BD error: 0x%04x\n", status);
> +	}
> +
> +	netc_clean_cbdr(cbdr);
> +	dma_wmb();
> +
> +cbdr_unlock:
> +	spin_unlock_bh(&cbdr->ring_lock);
> +
> +	return err;
> +}

