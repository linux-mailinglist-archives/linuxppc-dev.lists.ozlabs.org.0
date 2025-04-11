Return-Path: <linuxppc-dev+bounces-7606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC84A85953
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0X17Cfz3c8Y;
	Fri, 11 Apr 2025 20:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366652;
	cv=pass; b=WCjD/Ii9E9rVoEUNgykVzuhM1elVu1CaseXxczmvo95Gd25m/SIbHg4cZPhS6Iw20IhySijaKTkt15iKwwUanHDinkhuarHs+Oeh9BViHks6R31jGnsunUUagqgO+MPB7yCuw0iOJPf+g8XkcHVYLKdmYwLh6ynOt0bGkLDPNgY+j9HobvhE2qjXfCr2p4v2J/fPfLfalXZgDUYL4RQYFP18xKvsIsEDIyaeETuqIR1KqpvrOEnQv66R8AFJo+JDAq3/zL0dXQdDG5BQFb0hRyGl2AmcUrWCuvarDiKedA6DSgLYMk80YqlFbjng//T2LWQsJO+vIe0FxRadSuxm7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366652; c=relaxed/relaxed;
	bh=sLNW82CmmqrFkuFUjFOhZNNgPhyoY6P3ZKpewLAraXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RLw4kayLcG3j3xxL0qolXoS2bckpedUm6K4E6yS0rF82Uu+4LLyYnqZ2RudG+ugfyodvzrL9wdAR6/h219yZzZ2E7ICJJLf7cqbCCvHX6poF0mTsVfpCqJrAgzwzhH2GfCoMLmSPhvMq0ml2XbWQ1LNLwqWHMcx+SKfcWW3ipnXbaT1rUL0+59J/dc1518e0cDf/eYZpbkAfvBsz1TmqSI34qCmOjaYvlQtf1+w7eidygf4RRFdcDzuvsmeFZ42AnUiOy5Lh4nYBqzGtn06YpZ4vJcAc0+/0vH36RrVG8VvX40nVCd8uw1M2CReERRL6dD9HApE/ftCAOEcbD6o9AA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fnMMQh7V; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fnMMQh7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0W3YV9z3c85
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFRV1F6QV3zh16aYd1Myqs7daBeBitBzO3QfF+qTS0N9H2e+X2vvEw9ABTXesmKP6KJhk6ZxsZqRgaeEzbQxzUlK+C1RJDULqMy6SBtm8bBxln6rV1YAn9AslAMf4RD3bZXSIyXJsyq3Al4Z7+A5lslAQXediPfyOrZh+BvtSlokr4f87QLC7siU3WCLnbr/C9Jz02yw7ZY8xaxwerrCQQ/qwQZUDeiCSE5Tdr2KrG4tqKtpiEgxN4bUUNVnRzaTQcXU+xEVbnBiOqihrJDRXBVb6Fc7AeaD05a2YY/O4IG/hbDovIvA3XAIjN4Sw0IKSAICuN2iudhInK1KTRF5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLNW82CmmqrFkuFUjFOhZNNgPhyoY6P3ZKpewLAraXY=;
 b=Ga1WbAA982W5OMxyKWf/YtRZtqkW0ATI7GG1p6gqpDVFoVymphReEvfkeF7U2fcWFWX0fi61lwPJpurizpLdvacwJMlgySpcXwx8oCTVRyQElYjMIBSrbE2mnAJMmklN5PB33STjqmmjnxYw3SjkC1IVNNW/FEe5qXLzENFNum0i9k+JAH0xx2aRPcyeDFuO7T6B07t1aNAYMO3ljpuJyv67niXcb5XfV30s9KdIawf6/i4gLA99h1RaUM7/e37TsYAoSqPpkdgvD9Hq7dFmlhkn3VcTMkhnCxqZZa6Srd/PkBHbJAQuUV+2FiofFrmLnFX9xybrktfXXGAURggWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLNW82CmmqrFkuFUjFOhZNNgPhyoY6P3ZKpewLAraXY=;
 b=fnMMQh7VqgpRyrCHZAzQHz/yoOUghKXTEjEgM2w//xwqzUSLQYZQSrdI92m4DwPzlu8ORDH2CCmmG+StZloHVJeHBDdlYzi6Ky5K8E8h9eKLOjcyE2vmmHEyCj2iBWEVt6OWxMLainholVQLYaUas7rle9/+xTAQ1E1UepSWmX0v/YWrxLEjJAnb8ai29JrV4BpcLe+Wg4duCim8tCF5Qul3hVk+JjZlkjGiqohDrUI03TLXcBSI6nQUa91zWBdHOELINEApkY/n5aGZUWRluXjcakBRwdx60C1xVadIswjlCG83hl7fApKuDgwKq7lh5h7wt3d2kG42EMrzDtP0+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:12 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:12 +0000
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
Subject: [PATCH v5 net-next 03/14] net: enetc: move generic MAC filtering interfaces to enetc-core
Date: Fri, 11 Apr 2025 17:57:41 +0800
Message-Id: <20250411095752.3072696-4-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0eeec554-1983-4879-1a8a-08dd78e2069f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y3tB/BdzydsNWqmQYVNxvXKUn6K2jn02r2ppsxUQOQUmpCwgZEvYnaSL4BbY?=
 =?us-ascii?Q?lSkCuLmY/HooqDHxPzIl7maR4Ox5eGc54GHTjeSM7tktWTR350/eFuzKXZJs?=
 =?us-ascii?Q?piJgfndwa6YwpQfqtFn2Tpx0uiLmOaXzQINg1CjqYCXjPBOo+QS6LnPZsIpB?=
 =?us-ascii?Q?MW+TPfgBKl1okNloWm8Pfgzpb9DpOZhsVgrXXOpzcqjgSJ+lHbuxnjWy5ZRJ?=
 =?us-ascii?Q?RGeTFt/VopoC5PS4Dezv19imva6WTVTkNjaLl/QCZvl0++skgCb8ZxW8kHyZ?=
 =?us-ascii?Q?aoY5jPGRYlLoRcLixq9PH+mtB02n9gpTRf2RTB5q/+Qs5uoOd3hwKIw7WaUB?=
 =?us-ascii?Q?K77/3erfK7emM1eVkWTlu3YpDsGvb/Wn4N7co+lWT3+2gXUflXKGvIO3FLIH?=
 =?us-ascii?Q?vd3ueGJfJy5D8hHBh87ZBzNxUTwoWIv4VEL6oO3S+nXqRutudv5X1o0b6uEC?=
 =?us-ascii?Q?h2FfOQU32rczv1DPNpWHCklUbjfxPo6Ik/S7zDC1ucZ22/lN/DX2mgzDzc4q?=
 =?us-ascii?Q?fcSQac8uT9Sy6vqvTUGwSwnZjF9XfkcZt85lNiP/1AkbQUPTj92EifSnBfao?=
 =?us-ascii?Q?3rUrI10gHddxBzRQLLG3saSk2D3SgjhJjtBuCSK3k4sAtrFT9cLXJwkXFXmD?=
 =?us-ascii?Q?p/4+HvVyUXIo7OnFCemlzyE1o5yB/h3SFnCAkppO1daB3Zu1ksIEP54OIrs/?=
 =?us-ascii?Q?2VGtyaZWRVNoMHzZXL9ODokxIojf4d84/GBzqksv0iB+ZhbPNBfE8w8a2qs9?=
 =?us-ascii?Q?W2/iw+JA73oe3kJsAHBKpYjMZOx1Y4eUaY2epBZASEFtFiegLCMzCoApXYYW?=
 =?us-ascii?Q?loslgzipKIIMovoO1mrg5fB8xwRnzFGrCro4quKmUOz0XraCorVYpHDAC4cF?=
 =?us-ascii?Q?tL1OgkDUrQ84rI7KQ78NMOBcFWTo52FvOK1tbm0CDgyrwcop7W4/NYg+t1XY?=
 =?us-ascii?Q?PRCgvfSFOubQn2iVQI96fwc5p1OcSv7G23+6ctk7OgHw8xnQQN1r7cuRAd6M?=
 =?us-ascii?Q?GyprLQkbr1d2/mGDXzjMPdJEYg05CNacPxVlbHKD4u/5ca6UAZHpL+dCOtOq?=
 =?us-ascii?Q?0YFg8eQ8IZ0GNqfUcncaJpGv7uxgAzxbKzLOVR4v+rxYr43hlKXGIpfjclrX?=
 =?us-ascii?Q?1n+TNLG/ife8bqGomW2Z4DEeNDYj6j+BUmN7WP2eHlGxBWSeJF8iQSNczTG8?=
 =?us-ascii?Q?6dCA5U1WMuPz4ezAgvXifDtsL1T/9sNbDQIKeo54I70WRDxZOcLU2iZwujHz?=
 =?us-ascii?Q?0eWSE8D4Y/u+jLYfkFBgRKpMPlpdy9mW1cHMeD5Sv8f5mlsnpWzRfPskGqjW?=
 =?us-ascii?Q?6BSxNiZhaF/6FQkaY7ymugGwcH3xjjedXefpAxEhWcGgb29zP3JbnpjPUAxw?=
 =?us-ascii?Q?r0abfuCwkz8+M/+vv2toiODJJdkU3sRgXXyfFqQDM43dbHr3p2pNBtI6zHaE?=
 =?us-ascii?Q?x9kOGNxRxzL63A3kfhCQoQs0MMk/9niPhEyh/gJh+qodBS56bAVIWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MNkgo6T0CaB7rn/3dQntTg9+3y1NTQdNAxmy28TAlZNLrsqlacBLRjGgU27Q?=
 =?us-ascii?Q?rtS7w5MwMliiHoN4q0R5hoM4Qzs/PMOWMst+wW8wlr9Mcq8EQ87jvrjWhYPn?=
 =?us-ascii?Q?lfq0JtU7G+zod0uUagsRzgeqiAZgapYjCIoxBK94vHvOcIgN+ZkDOWlYC/xT?=
 =?us-ascii?Q?NKT3KXr2FJofRCHElKi+5sP5O82pzxif0Av9vH6nqGDLSpUmHlkVdSkvo+DJ?=
 =?us-ascii?Q?XiqF0X/eTRdglZlUFspluLIwdPQKduLy2XTLoWyrWsX5FBn/6Wk49wmSrRxq?=
 =?us-ascii?Q?iHSXpLJfRxHnNAMyJckZR5LEbY2YV6LStTbqWxTtk8Q03+GAepbP+EOvdjrM?=
 =?us-ascii?Q?cLgCj6BI8P6DDZvA0PitaLnElqNfUAi77Pa9fh/jx0Ar63XkIio5clZyI1IS?=
 =?us-ascii?Q?CGVyB/mEu3ncWEI4J0+LqxIG1CXH9EHsdKvRCfrQBylYtt8eXy8FmDf63Tc1?=
 =?us-ascii?Q?a9UqQfYvREA3UXQ94Fw54cK3pZBITeZtKCIRx8eIPrheIyXBToe7xg45wiOu?=
 =?us-ascii?Q?tvgK0fuwOQqIxlReIx2k9IBQPRD14xFZghRVgbZg0H1Hltxfy7kL1eyYIYz1?=
 =?us-ascii?Q?e4yMbu50upmpnVJSjfKeQPKc9al815dGeZTqlGVTCIh7uaa63/FnM9hVSNdp?=
 =?us-ascii?Q?7oR24MWhJjnIodbNu/6AgeaXtdvXIqpAeKE7YSKIqOAjEDPqZMcl57ufxV4N?=
 =?us-ascii?Q?tXE2am+7Ntg2/iSgzbRtA8H+ypGvQNxYR+B+8TIxTRS8se36gBBYb/5xBFBZ?=
 =?us-ascii?Q?Xh6bz5dLEtZFj9+iiqEoqSg0JMpQ63Xa9DPdDjQzvpQkh66j1SwbyLkoz8NM?=
 =?us-ascii?Q?NcQETuLPHf9W2iOQkf9iFy1Ttrj2iIRTepJpjeGs4aJInbWkCIwSTe6sko6z?=
 =?us-ascii?Q?jnNTidoaVQTI23PGHA/3P/8h4L4poCWWUiIrODajWx9f85eTTF5ZJ6LrNwGX?=
 =?us-ascii?Q?OyFYEFFtlvWc2/bqZEDZwCW30P4R5yx4+2GCdFegPeYie/k3+S19ZGRtLuV5?=
 =?us-ascii?Q?t3UnquibnSldt1KYWsGIlkzUUp8dW35w3E25DD2eTnZaZvGhvfWvr+8C3Cs8?=
 =?us-ascii?Q?tLIsH+PbpaM/9EpDsBN/DdPuaFDGMkI0WXr5vmeP4iPPEIxQPHHCsw+DZDr5?=
 =?us-ascii?Q?ldEMH7+nT3dCTD8gr85uXISnoakYtugU3y/8wWdk7F49Sk+/Ae4qxTtXb1j3?=
 =?us-ascii?Q?XtOTDrWDHw7clc60OlBwipsHj7AOgsIxqkrFmUqXSDGdYAKHUFhrkrFMSp+n?=
 =?us-ascii?Q?LOjP1BsMe7Yld9DN6H7OrbzIM/Ed0loqf8f8JwkM3NuWlQj082K73VqtR4w0?=
 =?us-ascii?Q?0C/kZOz1drwOuE91QjM5890QKKoSzGAAcCsls7LRHc/HvWnqwzz6bfJMhwix?=
 =?us-ascii?Q?7ki0ipTaclwTYZ8TALcxSfqrFX6SGvEUgx5voF4C5r7QSvBr53w811TYmwq0?=
 =?us-ascii?Q?jQCUR7cS66RrcO+YoOmv/DDUUJeIo+o+BXG5//L01YNzQDw1cPxp8QJOUpx+?=
 =?us-ascii?Q?I9VsJXLJut1A7GEdoXlYClw5Nw0tqkIJa3yOk3U13haOtzjDLAWxk1vO8Wn5?=
 =?us-ascii?Q?W0mQVfbAj0QOSggsUebR2cT7xkFDqYeNKDY+6/Wk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eeec554-1983-4879-1a8a-08dd78e2069f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:12.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpxQDEphZSE4Vnscn6pInJBuI3oCIwqMXpgKOfb/SamXrK9MKl1JE5Sw1+i5D+WFF/vjOsQ7gjZDI1XnueHXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
support MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Keep mac_filter in struct enetc_pf
2. Modify the commit message
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 +++++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 15 ++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ------------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 11 ------
 4 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 2106861463e4..3832d2cd91ba 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 384e0bded87f..c3ebb32ce50c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -471,6 +483,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..f76403f7aee8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..a8b3c8d14254 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -5,19 +5,8 @@
 #include <linux/phylink.h>
 
 #define ENETC_PF_NUM_RINGS	8
-
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
 #define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
 
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
-- 
2.34.1


