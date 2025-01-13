Return-Path: <linuxppc-dev+bounces-5127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E91BA0B160
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm112rgnz3cWq;
	Mon, 13 Jan 2025 19:40:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757621;
	cv=pass; b=Px8zyakqOttEjmHKUS0DHCCthDWxZIl7OGmzZguRrOARoDS05AST/mBXxyC2i4hl1WAEk/JEMQZSdfB9DATfAOSfsVfPhcWXtphlNc0UPRPhH9aczKw59yOygx7SU2V+BRU1qyNzBxOvu9CXIdmvFQoETKikKs0N6pNHaLiIYhVTu8ObY2WYLjsMOYbimXP5X8tDUYMpFbMSnD778Sww7PqXdTqPmELA5U5+AkxXAB/MIQFmZi7eRq8e27yXOt9tByppCBA3ANgS+AobukXZXUbd3BACigXrf8XL+BFXucc+ZVkRytCxSeVRc3+JipkLyzXlsbDaUkUqstiaUSwldQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757621; c=relaxed/relaxed;
	bh=KCEdnqAv6xJ8uCZlLxtdljvIMQ4bWcUrAVnJ2LhQ9O0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DPT+eisFju+oI+mvEYdnqzcWOBvL/ibrx9CMWnaNTrYdzH6NZPlysiyaexKPZV2hOyCeqX20HFe/JQepcqMygAWqyR79Q6cpBcWJGihxL1tTAXznZ9XrfdFhUdcSLX9Kpl3i4ofZuEK5NShMZLXfzZB090hKPfZnFmkPtTswlsXRU3CjN54PQeHJ4yFWDuYyWgZrrAgBhz8/Pe7H0Xo3TbzAgmat12i335I7aRTSjJArc4934X0YWySulVB52Y58cG2AfR0kwoRq80Z6IoyH+uXtcb7/wcdojuUDTc28cUThAKcseJUA9FYfAfUhZUrA0RVZRdq+IDA422DVVs30iQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QFVyKDEv; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::605; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QFVyKDEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::605; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm100rFJz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIV52VYWcpbu5Dmhz2QffuGjLt2ZS4b36XAlSB6kD4QVTP7hnCApRkVIgrAr8kmSoWGi5N++hmmnkKuqKbYZW5Xw16xfwnLq2kcZ5L0F00qdnVKpv+Ao+BhyQYn5MsdN9GEBYyuYH5BpL5lJ8+JahRkazS4QCBgp3oo8yZQh2oa6CQbUf3Z0myhg4hi8/w09SRJgccQY3YCUc+WkC2WGCk9bmodqoG3ZITaAbxW8DotycWzZ9EKAnsGSOvTbbA/gKkM0QIoUOTQ8dQtin9qacy9fxSgHeoX6yMB6xOmP2YeaFHGqZJpZDS3EymAJS+XZ2IZZKLguz550VZXoxP5ZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCEdnqAv6xJ8uCZlLxtdljvIMQ4bWcUrAVnJ2LhQ9O0=;
 b=UAUx6JXg6+OZeAvYvtQqib4PPweoLvOXQP797v1YgjDptaLJvjp08CkdGMfP5ey+vsx4d4P1/RE7eonDl5cEw3Xss5a+ozjcNU7DhFnVsxshn5LVZ08LTwUoWkfUk41e+5MNQhuE/h6Mm1xv1c33znw9AM+nUwi8eGFIQptiytHWIWavp8kMsg+DbFnvwDOASWmbhZ0/bcXgRdRcdrKlA2RKx3krrsoubAZR+V+GPAnnHAVfXCEYUi6CgCI01kVoVQqnW6k2dW99xwioiGsI5BQnO7m704FHKePCNdmpHXyb0vPrE2jXIKSbxe4vSChiOtx8wuc7OxlqXQV2fY2qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCEdnqAv6xJ8uCZlLxtdljvIMQ4bWcUrAVnJ2LhQ9O0=;
 b=QFVyKDEv5I9m9dOaU0IuHXXxSGQ41X8jUHbQXqXXIKKexvKouC8FbkIJRlGta3hL1zUxHVEZfSk1O4XURammKJ+Vpnh3PieM4X/lhegh2JWatTSbFDRg/oUXiZp71AEmqay9Z9Br+yuK28Y9jcCnoveaTxEXaGPpUiU2goJaaX2iU3SI8xmJaFWftnTUlvCszjwPrEgPJSPe1h6xvbeH4OvD9ijzRmvIcFSNtgItR41MThTaTB41iEJTJiCpQRHofjzOwfmxANGTDhqUv+/EKOErlc3NCZNE3qiSxHC+6n1jEJqbZ9CRClSxd+Al0m/ZqAb8CBoERNbUbNc7pNooNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:17 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:17 +0000
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
Subject: [PATCH v2 net-next 07/13] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Mon, 13 Jan 2025 16:22:39 +0800
Message-Id: <20250113082245.2332775-8-wei.fang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 3240b3c6-a06d-49b1-8d9a-08dd33ade7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pzvykXNqLoloyxSsdpcOiq5imfGL9Rl9KWnQIcPr15PsWnyDr/4ChmxLsddl?=
 =?us-ascii?Q?Oj/JoDYWPKvuEJAhFst+N8PcDu74StySOb6bjtY4Q+oj5K5fCSlnhV8VruFY?=
 =?us-ascii?Q?fvHBs1+tHWXNp5dRFbXNiOzsXU5U7ymzURWMz3g6+jpI7nuxNye54syUF/Q1?=
 =?us-ascii?Q?Nn0Lru5vRZahgOY7Uq2qH8u7/awbsjAUoGQ30mnMRkwF6/9eQ6x7nGYbJcNk?=
 =?us-ascii?Q?1C0PUwBgPBammTYZ+FwZIa9DYwUZZKda7EuCsWjPaKTxIoUxxAxgBTOgZfOm?=
 =?us-ascii?Q?3JeVmSLYWNwQoJF6R94IM098DN1HlF3lmL0rqNM3705gnudHaf3a2T//z7iB?=
 =?us-ascii?Q?tlA3YbaoqUdsCL6sgJ+bXB9PZUMtsiDoB7TLOsvUIp5Stqc8pPztwCUeTPIQ?=
 =?us-ascii?Q?mgbZ5D+eGJ7FhILiFj3Ahiw24jets/zCj4wOOhlHz9wvWyaiTgCatdL1yyHp?=
 =?us-ascii?Q?JgeAovxj4zwQ8FA1H6Edfkf8ROOkzdJGICdcvBnjSb04r6h48AxksLV6Yj/M?=
 =?us-ascii?Q?a+2BRZrw96rSoUkg0M1ScAzcUxfGoDMormlZ2jG4CcAsWntjFqGEbt6OR7dT?=
 =?us-ascii?Q?VfuqTpl8n1edQirXGPELIcWzQ5IdN6z40jC3Glj1AyJ86u27rLdQmxDkBDsm?=
 =?us-ascii?Q?FjqHZexYok/dgWAFvSSXJXoqS/eWOPdZRC/lJKub2Jj0fc3GnCsyZSHSJwCb?=
 =?us-ascii?Q?oTVEZgCerwGm5pPxwfyGKT2ETkeSe4kxH9r/erXznz9Vs8YhBRM16ohPOi1V?=
 =?us-ascii?Q?WyH9EbryXBiEO9T6qyEw0tttSm5D//zR3sUAPYSuDX6nR+9bvdfHf3iRGdPM?=
 =?us-ascii?Q?FX3LvmAQNdBpQvjoSqAe3kVHabhYzVLmzlw7iWTYiYv+hi29OZq7sFZbjGqh?=
 =?us-ascii?Q?3PxQ0ZTWs8mLOyiFh2hSPXzTkOjVVyr5ks2ecwkQsBUBMjqohjMeYUP6Rorv?=
 =?us-ascii?Q?G5zVy9ssWuBcupHUr+Lp1VqsdGA2bhRQ2Ly8ra+Gw7lW5nUn1fQ/pP/ICO2y?=
 =?us-ascii?Q?n/3GFJ4f28kaulSWCBSuRiKfyXpvDp5713t2j6azAnQFjCMSRNEefrzO8GzW?=
 =?us-ascii?Q?ARCbeYvrdtPt4p1kOmEwXXd/CrplK+kbYSN3fwSAlnAUkirafDwhfAMgMUVU?=
 =?us-ascii?Q?HWqkmuRgXvQrtHr5AW+kYpkjnJmM6I/S9daPZJ8ZzcqIMYnYS7RbwWTvxc8S?=
 =?us-ascii?Q?XV1e66Jc5NuSLI741qlTUkLBroTd8uMhvjaKRJyFs/MgZW0128+lecqKvgj/?=
 =?us-ascii?Q?Lxs/kqip0ZH0IdkFCe+rsE/gQrX1qgeQ15DgAsnltlwFiNTfdt8+x9lX1kjl?=
 =?us-ascii?Q?0ihjnCP++Jb34FekPE1UCxKHNvqFJamGYnc0ioK1aKhpCt2t5pHhM3wW674q?=
 =?us-ascii?Q?yGPUu2eY7NgVp002wI+8sHMDHuAOgALei57DsmJLiLcue95WahygJBREDYA5?=
 =?us-ascii?Q?cXV25rVfHrlViPweqsN1VjeRF34vp4Aq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jfKXLLzErivZQvMAH8kns7ygA00YM3YYBExQlenWO2J9La/2NQU0bV/U8hHZ?=
 =?us-ascii?Q?6KNUYNX2zX9EzFSZKhFcpP3mWkUPosoJ7dqW6qAi1OURjX8kZMBPzv5pXWTH?=
 =?us-ascii?Q?D3TPqliF029naL6Fu2GfMJyThYrsEWZeS3gjeikfrRqnLW/uvXsr4xmZacYk?=
 =?us-ascii?Q?cCbYKF+f+jWGR3kI+sSNyF77qHaaOl+REPO5Xwfs+n1pxmNcFl4QJXGsrr1f?=
 =?us-ascii?Q?zYL8GUznmuVxs3siD9/GlAXqnA9OiEAMP9LaFuk1cL4RRR590ZijOlxMJ/oc?=
 =?us-ascii?Q?M2C72infHD/nf1GK7/WQyjQVNEegXFnYJAI/smmdO5D07osN6SVWiao4omNG?=
 =?us-ascii?Q?neyTMnMR/ee7G3epASNxfK8yylNX6aEI9qefqn/E93t/xmaCQPDerHjCAp5V?=
 =?us-ascii?Q?YEB3AcXUrIUTRxZMuNQ9jeThLkmvGPPSCzAowOyIYgb38BcTXXqEw3/7f173?=
 =?us-ascii?Q?jCLhwjmYtzJEG0sFnvmAxzpHTnTOQFp9q8gEnYXRqKCUQDiUPSlLVtqA6VlZ?=
 =?us-ascii?Q?uy4Nc0Y+wqqAZCaMaY4NQj5+Zyx2/QfdfVCEVEFbvzV8ak+G7yQp2lBz8LCl?=
 =?us-ascii?Q?8mFcAwU/Cdkz+53oxeR3o/pOj39UcvDXfAHXQ3gwy727CmEMXtp/8mT2nOx0?=
 =?us-ascii?Q?nIpWqa5LPr84KW31gEouZN/oJsAiVq0MrNwx1RJ0VNRDZSAcg8KppF7cIcXD?=
 =?us-ascii?Q?7FFIOqwED9kQ7vxxzcfH5kwccZ/yTz6KIjyVaUVJyqQyPsjW4nazlRJ03xgR?=
 =?us-ascii?Q?Ea05IyRsro8rW3MoBLGOV5MijXdUCTz6zdjEMD+lkwgWtlc7yObYX3lOFek9?=
 =?us-ascii?Q?S6T9/4Smxu3MEhll8GiGL0jMuTdOnM/JvCf+pfi6fT5o8Wmz+ME2PF4CGM0K?=
 =?us-ascii?Q?YQ5KYoCRSk9G7R+cqzrPe46Lf5/Nwjb/ZUGviEZyU7tGxRi9D9L7NS4w+nyt?=
 =?us-ascii?Q?1X0nZ1TOLK8QTaDIotE5aNH+fnXk6FayJS8tDteJkGrCl+k6pZviSLWG/vvX?=
 =?us-ascii?Q?by0wM4C9QubkVg+XG7uCJKmbq6VhVdixANWnhWP0Co/m9uTQi6xZjFsOgLTx?=
 =?us-ascii?Q?5xhSe8yeJN/9hQKZsE/ikufQqKrWo/tW9kfJvVtsTIiLR3yg9/kGq9XC5UNG?=
 =?us-ascii?Q?IPt9GzM4xo8XBVtmDfiFBoB0ikOBDEATg1nIPHfY/omd8R/PIHGEC6/C7xWO?=
 =?us-ascii?Q?ca/HyTmEalP00Z+VOvEpJt4n4qRMI1KzT2HZl2MxloAiRDq/MjbncmfOXYz2?=
 =?us-ascii?Q?pg6fJcja//yXsrfWIr4l0292jgIcWGM6jA5qNtKzHpR5b8JrSyhbuhE+PoHU?=
 =?us-ascii?Q?q93gDXECavVUFGEotAT/CO8e8zAdHW/NRAQdWhzv9vikn6fWusnUOb5JImJk?=
 =?us-ascii?Q?zPFR3ieLzsCuhN+e2fe27NmOaIIfniZYlwMsHdx4f7YJz/e8ASIZwPKGBIea?=
 =?us-ascii?Q?Bh/Vo96ChK1pHaMCRbuBGZfRaYadnM2GwRM4IaHiX6xmRqIjvz7XXnGw7JHh?=
 =?us-ascii?Q?2o4/JulvEfCif/xAQSSyUTYzUengmjbs7D85j8x718ecf/LpDs5V8GkJigc2?=
 =?us-ascii?Q?NPz4pslzwQVwbpP2iNImnAJD48MliGp86bVI6f38?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3240b3c6-a06d-49b1-8d9a-08dd33ade7cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:17.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL239J+81SDDMuaViF3Pb8rKpXVeJnH4QrcEoUgW+X7E9BWohWyejF6bRJpp/XXxMip/LL7FZLT0OPNGpCdMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve the
network performance and balance the CPU loading. In addition, since both
ENETC v1 and ENETC v4 only support the toeplitz algorithm, so a check for
hfunc was added.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  7 +---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  4 ++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 37 +++++++++++++++----
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 14 +++++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 33 ++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  2 +
 .../freescale/enetc/enetc_pf_common.c         |  6 +--
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 +
 8 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 6d21c133e418..233f58e57a20 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2363,7 +2363,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
@@ -2394,10 +2394,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index fb53fb961364..2b0d27ed924d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -290,6 +290,8 @@ struct enetc_si;
 struct enetc_si_ops {
 	int (*setup_cbdr)(struct enetc_si *si);
 	void (*teardown_cbdr)(struct enetc_si *si);
+	int (*get_rss_table)(struct enetc_si *si, u32 *table, int count);
+	int (*set_rss_table)(struct enetc_si *si, const u32 *table, int count);
 };
 
 /* PCI IEP device data */
@@ -540,6 +542,8 @@ int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 798c69e83c8f..adb5819c091f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -69,9 +69,27 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)key)[i]);
+}
+
+static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
+	.set_rss_key = enetc4_set_rss_key,
+	.get_rss_key = enetc4_get_rss_key,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -263,14 +281,6 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
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
@@ -691,6 +701,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -698,6 +716,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -1106,6 +1125,8 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 static const struct enetc_si_ops enetc4_psi_ops = {
 	.setup_cbdr = enetc4_setup_cbdr,
 	.teardown_cbdr = enetc4_teardown_cbdr,
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
 };
 
 static int enetc4_pf_wq_task_init(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 31bb82ee512d..6d85c0caa04f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -295,3 +295,17 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       table, count, true);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       (u32 *)table, count, false);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 56ba82830279..a3059498f146 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -626,6 +626,24 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -698,7 +716,7 @@ static int enetc_get_rxfh(struct net_device *ndev,
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(si, rxfh->indir, si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -712,6 +730,12 @@ static int enetc_set_rxfh(struct net_device *ndev,
 	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
+	if (rxfh->hfunc != ETH_RSS_HASH_NO_CHANGE &&
+	    rxfh->hfunc != ETH_RSS_HASH_TOP) {
+		netdev_err(ndev, "Only toeplitz hash function is supported\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* set hash key, if PF */
 	if (rxfh->key && enetc_si_is_pf(si)) {
 		struct enetc_pf *pf = enetc_si_priv(si);
@@ -721,7 +745,7 @@ static int enetc_set_rxfh(struct net_device *ndev,
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(si, rxfh->indir, si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -1233,6 +1257,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f050cf039733..59039d087695 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -923,6 +923,8 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 static const struct enetc_si_ops enetc_psi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..c346e0e3ad37 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index d7d9a720069b..072e5b40a199 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -165,6 +165,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 static const struct enetc_si_ops enetc_vsi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static int enetc_vf_probe(struct pci_dev *pdev,
-- 
2.34.1


