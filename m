Return-Path: <linuxppc-dev+bounces-7862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D7A94FA7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh2Qg3KPPz3c5J;
	Mon, 21 Apr 2025 20:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745233083;
	cv=pass; b=CQNWkwlccApPFZKu9dOPkDaIihv5+YOrFQDjnnJDyw/DnueU4aSnhYDvhAyECnDXFFZyTbaRuRYDykXoFrCbxjxhPVOaH3ryxHNXVyQeofsN0oCGFzYDZmM+s4WP6G5CwOP5vh3xHliMqHfpBwNEseT88TtKqhlMf6lH/ZRJrumUuScmMD7tC1j/z07/7YgAjYqh104l7z2eSY2aQQ9yAuDMxis5YffnR3iuFHEJvGg2YdXs7xaatJa6/BNsUYrkxZ/+kJDZlwPnDJyyW4tX7/xYw40Hs799tTV+A61nFl8IZJj6oJ6leut7QKrPMOlkRHT2TduL0a/wRldRW/YpbA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745233083; c=relaxed/relaxed;
	bh=BdzL/TZo6Vl7Z6f8pGJu4dOs3UWIKSjuca3HftNC06s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Dym9uMcCit9SewQLfzGqEC2gal/hMXekKwM8kNPVlB4n7za2FWja3JDAHBwcDGFlcAbhMgeVIvmBmj4McuSrRi+P9AEhdJ4sadR4MYoNJbF0T+NJlpl7fOuLuT21GL/LulZfiQFrCjhMw114zMmqGzZ/Y9l5dekBxmviaw3/Aqa93Ngif9JCmK4rCDx7u1nNfYpSYROPwlLd21vDXE82saiWXwuTRJXxssUAw0CBeYo9lyLBDDCLLZSsmlfzYsY4ZBzDInxM9s65/uZzCltlzg1HgRqNEzXKkps4RzB2/D68bpU3h5dAEknHk8Z9xbQigfVr430/21h82BX7wUpF7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KXPvzgxU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KXPvzgxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh2Qc5xb3z3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:58:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV0hSOLWKhOAhhp7Iy30X5uMUXSQmVWLUoII8k2GTnl9lTaKZqlTQtFpmo1d3MQ4hC7PHvQ93ZThlRzEgAumzr/2PgPJr3yOUj4fuCL/diwGgWwQQAzAo79z7zIr8CnnZ1Yrupwr/9HOo3tB7VobNjRPThNja737W5U1RbmGslXY0HBl7eW38Y2n13vVDdzhuutshnrNiWtSQn5/A5CrrwUyzGwRCYFslLhkV/pXlV3koqEjpXnipT1s/ShBKrwNv6G+J48FEa6ugVsf5fQA3aO4W+6EvZXR68xfnSzvRszkakqP7wuoMaS4ESQ9/gfGBJuJZrQm28hNZg9yM57q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdzL/TZo6Vl7Z6f8pGJu4dOs3UWIKSjuca3HftNC06s=;
 b=yxHkQZwv5D3D/6brVhP2XhmJ5YmsumirKE/fjViRUFJ5tLyiEPedrwiTSzKNiQoV0QIGHYVCDdP4XsiIA94Nc09Trc/yjDR8L+tKMRbLkM6m202thNlwCHf1mKKNMqJ+ebA06aHmb0DRKA12Gr2y+PfmFSL5imyTBz3QyIAGXPFLOKeasv19WXjtm7FLjstKKprvQNYlWMygDAgBMqic0mjQmT+5rHmd3faEOEEj8Gi9e/1MuSbqaypZ9saxgOPu76dbk1sckRWBxMlDOVPTHZnI+8p0qrSFs9oiTw6YFLeCC4n2+HVrLIXUtTuPmHVcsImFHh0/hccuHBKT/3Z4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdzL/TZo6Vl7Z6f8pGJu4dOs3UWIKSjuca3HftNC06s=;
 b=KXPvzgxU7Ivp7ub2Oy3wevLrC0aZ/9BNJ5G3zu1gSdeYxmarG+8yg8SKZck0MAQg1dlYBHR6rmK3MHbk9ANo4xYUCDViMU4mdjOUagDdzLU9pLRbs7NWp1TaIfN+pdWWKxcS5G2+dM4ZeAb8mXJaGEEgFaRqSrDejDdcO5GgqglOLfSMsD6a7wqivpH0IhLStgsa13z1LYar1dO6Z75VNyQevOJ7K8Yhs1yWLa1VUkN+yYRVx5nVTwM/1eUbcbvrpox8kke/ORtk6tJVb9WmIFp8vxTMUF4PFtZQR2+idPh3YKcKiNuzFp/F93V0InKHdft4Sklp6Bj3neHikE0iKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8710.eurprd04.prod.outlook.com (2603:10a6:10:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:57:29 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:57:28 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
Date: Mon, 21 Apr 2025 19:57:00 +0900
Message-ID: <20250421105701.2273588-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 817266b5-df7b-4fc8-a590-08dd80c34ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbjzKiSwjzVSRDFtFpEOfypfg5PbCJJOzJYFUXWgN+TWLztDwAgZI8w8bLqw?=
 =?us-ascii?Q?TUZiAOYVM21Gpj3sRiKVHx9MsjzyNom669fzpg6dG+EooIk6McXYQcqqLdRR?=
 =?us-ascii?Q?jCEL+VMQUbulN1qyjylwEQyFS65qm3C3K5HatWNjiGT/hP1/CDtMqRbmGtIG?=
 =?us-ascii?Q?yTFoJ4PvLsk+rTUyADV6uHqoSL6c1rKr5T4YmpDnU7RE+oZaNUWqQ6TDY2Zr?=
 =?us-ascii?Q?sJPT/0Qslhx2w4GwT2YaOTkk8JmFa0lAJB8KFsGBTfJhXMwHrEg1aiq34/f5?=
 =?us-ascii?Q?DN4WgkojdHuE/clc63lgqabsBRy+NsZFKS5elknZ2hm3tFFcHO3b42LRqK05?=
 =?us-ascii?Q?J2cRpihnQNlWyhPLe2+a6L01ld4LtmRuj+BJhnPqggsKXo8RqVCC7Dl1aycg?=
 =?us-ascii?Q?mFcNuzqKGjwuDjLX5+XNUV2opSOrmpXWyUgOLxRd7BX9vwTZV4SYdskXehHP?=
 =?us-ascii?Q?lVltos3MgE+OGf+96iiI6qzjDYUWycB0bWbzhcvVKyQiolAv37JLnFFff4Mx?=
 =?us-ascii?Q?EJMubCKPRf9JoOGv366dYozfIfDevhlBcwiRZ0GWMEFSG/Sdvr9RjUwQh3Sv?=
 =?us-ascii?Q?tuHb/Pj/Eg9iis9UmcFsaq1eAOy4TaQzSqicbb4euA94eslQmGMx2KDGoke9?=
 =?us-ascii?Q?cxxC00SJZ4UGgrdL8tCXwcFz5FENKBSTu5EB7/WNyGAGDZcmdQAN/0ZxC01B?=
 =?us-ascii?Q?jVPe5arO96ahDzkafOZapnJf4bzbpUTOCjCDwqhFnkiT0pypJ+Cld3WJXcD9?=
 =?us-ascii?Q?taxVX8jtdFvPbro50AJtn1NZWAcsS1dLI4zG5Hs/jW+r0f6qIhQqvlC5dSOk?=
 =?us-ascii?Q?dRW8ehXFrg9zzwVkLg5phsROBt1s0UP6Lyni8LLq/tokc3giLj+/17YK1pn7?=
 =?us-ascii?Q?vkbWeDpxeBa3jY1L8xk5XCR/XVA0A1X4RLS2oQKoaMJ8PJkLtrvAh97xgG57?=
 =?us-ascii?Q?jfcdFvfyudzSZMZjiPwksuOwWdQKY7+v+hYQKSKi3vu2kdcNMYTNLW+9cKqb?=
 =?us-ascii?Q?61sgJoM3GFm4ruo2wsRgLs2jtpMQDVnew6EM7jPd5jHJsN9nW/tLKuOpBmJw?=
 =?us-ascii?Q?4u6fLVEJAxI4SRvAMv2qAvHAkog7t/nj/tTAYfrHngeknAcRPeYKzYOtmEdN?=
 =?us-ascii?Q?sy0dzdBEiP8uG1snMQvoH7/ZIGtTl8V05ckf77hByXw7FZOkfGY/3TuvsqBx?=
 =?us-ascii?Q?0DU0GR4zxXmDP9E3qlCNTJz7YApiB3GBYkqgOecneK7b6KXPHCWwzI39dS8l?=
 =?us-ascii?Q?kEwdC7bFp3tEhVorFQehMRpoYhNoIcpxMoxE7VTdtfx8WSWcGvNDwkyMYbt7?=
 =?us-ascii?Q?j+uDxNBTMax42ewUQBqjd2wesU3qW4Q7Ej6m25EW5Doeu1sIPijo42hbTwA4?=
 =?us-ascii?Q?PetkSrLKiMrNLKMn++5JBUGb5wbws0k53Ur96k6HbB2kqaDcJsVizS7irSzm?=
 =?us-ascii?Q?8KF+borHEI7ODiU6LYs2pWet2F9n4RpH//Nag8BjQj5l67ytJpXWDQiAVKqs?=
 =?us-ascii?Q?WlunnY4GMQVXLBQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dks2W5F/xafvGVmBs/NfkzxmxyWNj5mN+iDiDXn5M7j9NmqOjpKrr/CANLIY?=
 =?us-ascii?Q?cPTk1PIszVDszD4DykDaXV7fYa6xb53I1BedUSuc6pVezMpoQI4UmeUguCoy?=
 =?us-ascii?Q?xINBFWS9zA0Hagv3qlF0nhP8cAZPh2CYvbF0SNLOXNHHo57QoZKFMxEm/cIQ?=
 =?us-ascii?Q?C5LkCFcbTGme78HgrOGg94frCNYNFiUdrP1g9pUE3QUYEOGlq+UD/dwlWJ0g?=
 =?us-ascii?Q?VkWw6wPzIzHt9BW6aDWrAvi4paIKIvNFpyhYtpH7pfDl9Pa4RhabBEFKhGdV?=
 =?us-ascii?Q?x6GjTlTzBDDQmpGUFEuVZ/Xi/NTcSRtUR0oN14KRIAIxXAcMwtJC5dfh0QZd?=
 =?us-ascii?Q?ooEM1igK4mnqoGPy58sdqNUafw0OarB2JmIZd57lImg8cdL2A7f/3yCwwhQN?=
 =?us-ascii?Q?npWAJrvX85tOJQ+mhw5c/DjpTvfuE/gGlE/2ncYLmwhttNLb0AroLagibMa/?=
 =?us-ascii?Q?ySoGTtH9TTsSCX7BUtlAOscOE3Dg1GZ//qah8OikPd8zWU+9jsz3NUJ+H8e5?=
 =?us-ascii?Q?UEZ91uZauJfA42/DLkRnxSaG5uO38i27b65FfOrKIiPkAigpI39WoIfvLfqm?=
 =?us-ascii?Q?cfYCT9+/yA+wjz7VbzheVwPsjVvb+YTuosmwEYlsDbWUiEyV+Kqx6NnUCYpN?=
 =?us-ascii?Q?fet4h10eOIKfYeCa+T81ZEzug2UKYTdDnRl18HSfC5O4Jn7Ye3kJzVyyRBjb?=
 =?us-ascii?Q?bmT2OfMsY+mDnQW5zHwFFR0qVLUChFjhGDrqlo3pmrwuwV7KF4bdlIYXs/EY?=
 =?us-ascii?Q?AvpTd7ek4YxouPDun0LINacZbZxUq9jEmoDH3sw6seQ277nZviMZBL9sUmSs?=
 =?us-ascii?Q?wsQRMQBcnufyvCuB1n10IOI1S9iwvhSDCu4pfy8o/17LIF0uyea84QpEruFD?=
 =?us-ascii?Q?aEg8dntrk42fnGdqf0hHszX6jeErggfFUNGKn6zJgxx9sijx/UVSI4ksnl7p?=
 =?us-ascii?Q?OecAFoMD9B/yyKqWB3drz3CTXTP0ERn5wJm3h/O5g8QLU7ooz9YXIgIDpqJk?=
 =?us-ascii?Q?LbwR6E75KwUtphF5g9mYI2hT1ZK+dtScMrleG7UpxBFA8OsHMMpG/PWR+v4k?=
 =?us-ascii?Q?pqDCr+b7DAxdV2yy+x5v+c83fVcw5LRJTmJDioA1CNm38a2Pxv23EC3oP8ZP?=
 =?us-ascii?Q?1kFkz9V2T1LQA/zg93ECOiXadWMDY31a6pQ5e2onWl8+dK0oYR5S/eTcJlrF?=
 =?us-ascii?Q?c7Lil8KXSBUYSzo1s7YAYdLYEkzlgRdA3fRPyPs1KdQgwS5c5KMHNmAjmWKS?=
 =?us-ascii?Q?88PZy8i9+rY1YUFfapGct5JPo6FWOShHBQ6ntHwcvh3pjo77cJZIaZ7GPn+n?=
 =?us-ascii?Q?amsuDbjGYBMiwXM/eC3c1/PaFbpVkb+CxBROsTvD2w07x0qozBAMX+vSjwRk?=
 =?us-ascii?Q?ihh9JK6hsVEaR5R8WpP/pnuTlffZfqnuWJ+UjRZULVdKWEyFhuXepHWGUHWM?=
 =?us-ascii?Q?pJbN61sk6R8ToxPX365xc5gx68IwMth3TzEs62heeUKwKFcNVR7Ya0o1Ivy2?=
 =?us-ascii?Q?xmmhUDswor4E6hp6bhjYXE/RaUxWL5H0NCserXftOyNV4BNMBZRZvpaUiL6d?=
 =?us-ascii?Q?fHsancYaqdBzLY05UANay2vLsyCstUeaA4wuq/5v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817266b5-df7b-4fc8-a590-08dd80c34ea9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:57:28.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nX4fAJnADbfyUGccbgxyGfQmmE2e0VbVCSaOOb3DeVnGUHa3kUlmaLOneqDbp1lXz5lRwAvBqklqloyCMpQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8710
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sound card that sits on rpmsg-micfil-channel has different settings on
CPU DAI.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 6d67db4e0581..4e3ca05bedd6 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -229,6 +229,16 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	}
 	dai_drv->name = dai_name;
 
+	/* Setup cpu dai for sound card that sits on rpmsg-micfil-channel */
+	if (!strcmp(dai_name, "rpmsg-micfil-channel")) {
+		dai_drv->capture.channels_min = 1;
+		dai_drv->capture.channels_max = 8;
+		dai_drv->capture.rates = SNDRV_PCM_RATE_8000_48000;
+		dai_drv->capture.formats = SNDRV_PCM_FMTBIT_S32_LE;
+		if (of_device_is_compatible(np, "fsl,imx8mm-rpmsg-audio"))
+			dai_drv->capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	}
+
 	if (of_property_read_bool(np, "fsl,enable-lpa")) {
 		rpmsg->enable_lpa = 1;
 		rpmsg->buffer_size = LPA_LARGE_BUFFER_SIZE;
-- 
2.47.1


