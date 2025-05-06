Return-Path: <linuxppc-dev+bounces-8341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EBAAABD2D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBNk6wwMz309v;
	Tue,  6 May 2025 18:28:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520086;
	cv=pass; b=J9Zf65Kuoqbys6KIMUFT5UZjCVo8NB9mKU+C+mHRoLM7tLleA8+sljeCIde02MH/8gju+0IWBRrxuOwritnzm1ox0RvnaiyCz2B5olyBpRtE6GBLlWfGHRtKr0LrQ5RMbTpQd2PqYwmkBywvPHbv6DZLXB59JrZn3MSovpjudiSmfL6QfIf5Lv5AdDMh6ObUZMDj0oI2zXrG+1pch7HQJFS8lhgPz1QwGrzp6SCfky2SJQm7VrwLxvriC6n5ayHoUpTxYssxjdHLoJKfkMYA0e7eu7WO1G7xZQ0XyuKLnrHdNhO0NU8FBMUNPQHtFGwk/U621ssTIhCZegs5BiFl6g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520086; c=relaxed/relaxed;
	bh=1wf2ZPHzooNqEyfUwWyL/hekmw6AY1g3HgCMe46dxtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YHAzrB0shtwmzWlYEJ+dxq8rkyL/k8N8IUlu3vx2y4nyJ2UHMVy/Pb5KSodPCSY9Gidb7N3jXKhOLaaBaVNdlGgkIjnOru5rZZUe85Axvuz5u8R//1+khCpUY8Rt/GYJcpsdatKg7DrYYnuhaQ7C71AvPJjiWX2FxGX9axmDnu8B0Hj2g89lhKIVf+m9fxsNdOFfrMwAb5OwZMlj7i2n1gNk8TvTM5hUBrppKmn3iFZGWvFPApVUwroSo1rUwhgQLPhdBKsxc5hXIzepMGmPhxcs9dJXMgdy1BFjU4DkUis1raXBIQIOckmylfm+aIC+PEIJi2/WCmc6PlqNLulgdw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H0UEMypJ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H0UEMypJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBNk3L90z30DR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:28:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5ul9SjZZo/J3ZyPkFaUu5yJSJO+ieVoaFjV2DE53y78NXGyRN5Uwk0F/sryOn837CSoHvPnhyzPNhkTnzwKKsbSHz26vDnLcV6lmVk34b9+RzWDdzcw0NXhxzoYLXT5tVwjun8jNKQl1nibqQrU6URdS2wdW0uDyjUbnQqkVwUdet8fyr4Tqnpcl1C9QimRy2Gb6mmKR34kF8zecOEtxd9l129XiM8g4rMX5/nDrkezT1FvRpXk5Xcx667J3iId1H+3TP2Hp5rpjk4JD1gdo45XnnG5bLzF1j8aC/4rWSRkBuxdNjBcueH1wDWJDxOHESMIsgmBOGxDY8z3oWcORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wf2ZPHzooNqEyfUwWyL/hekmw6AY1g3HgCMe46dxtE=;
 b=wQ9k6exmZYSOWKchk9GoCRSa6FQOK94GhxY8ScJ5IW6LBFE+fxvh/EqUIxgxqKdpI5XAj4cY+yWYEwW/9l/rrgRN9nOdWbi3tjQPaWe+hWwqCa4Nwq1uKIC0B9gkpSo1WCnuJyEiJ3PzjpYZKRbr/YhApkDo1mbrc3wQ+ZZza6yL+n39PmvZ15siMuPbVK/NpUAvg1/HZVKzcVLUD0LLQ6aGw1tvFFPR8nyF2QaRQB6fsrpztGymX8xb4TLjmyF/4x6aMFZVF4c+L0V2B3EqDpt2u8i7ifbhOnw5Erf51ePe2xHQfwi/Ja9vn4jzrfLVdsrvtSmUg7M3ZyB1K6DTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wf2ZPHzooNqEyfUwWyL/hekmw6AY1g3HgCMe46dxtE=;
 b=H0UEMypJb16QUHEMMinCJ3v+lFs8HpXJxtYd6g1VjnujXRxEDdcGmDCkXI+IWwHsXBQ4+Ur7wHhQ78RIlAMtZBJ6BSaJNrC/7WEk7v3p5MFE06WJCpbx5omFocZ+HbsOB5/QOElgw4wtvKOUbPOrM6av3JZj5STStVkgSG+sYyuGM6lf6xvBukkP8HMTWvgwNiQI3vcjPgIbTMNjMmMV993qt8tVBPC/W77qeGcpMEL/r38G37gpsAA7ICnrTXidrIWkECMn5KqSj5Prl95hGTfl6hwReiqiyOw8Yezug9YG0oMJ7DYfWmpNb8Yq5c7KvJ+tfVotkVzO2z2RzcW/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:55 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:55 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 14/14] net: enetc: add loopback support for i.MX95 ENETC PF
Date: Tue,  6 May 2025 16:07:35 +0800
Message-Id: <20250506080735.3444381-15-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: f576df2f-315b-4461-7363-08dd8c77e69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8P30YHyQgJJKymYIRfzqg6MSwFRKGWkcS9o5s41+vNcRksr8e7OYu6CX7yPL?=
 =?us-ascii?Q?KHKk0HIYrxzl7EBo97TIxR+F81Q8qJkCV8SuRVKFP8jX2GbfmzvhhKaAIjkV?=
 =?us-ascii?Q?F/eWSaHkl/9IGXDs1PUEV7oazFE6ieEP4H9ylocqq0svCHljpWVI9iUMVuJb?=
 =?us-ascii?Q?4jJAoUbXiDULOnIXvp5TNGWEzHvM2XjvPuNIeQVC7yFcffWJ5VpqALk5f9CC?=
 =?us-ascii?Q?RV3RK20PD+3PekGfeAQVt3RDPVdj8ooNgavu28vk47nG/DdP1jCekZKYjuAK?=
 =?us-ascii?Q?UDN9UDf5MnpZcGmen/9ApvT6koNuw4CMbGgyqpzX2F8Xsp3U73EPTB6tXgkP?=
 =?us-ascii?Q?2NofKwqiqvLWePavVnoBKgjxLqEpQ0EsU0AANuU7X8j1L9Igv/5fq6yZNyXv?=
 =?us-ascii?Q?lcuerXuS+vCA4u1X2SVAGPTVX1jEGC0oH4hL7PN360Pda46CTXfZn4/tFEOd?=
 =?us-ascii?Q?dcinOg+Eufr7if5gYUaN6HDfr6TXl3NO5XT85PeBgtNdaer+6RTI5leAWWvw?=
 =?us-ascii?Q?//tzKSx7K765NlQm6PHUWPMu9GlnRVwaly7B49ti5LrBIHSCER7nFbi1rIHf?=
 =?us-ascii?Q?WsqCYJkA09rMXDYhCj/vOPc1PFSxOqozvLDh8gnAdyo/WwgXT8NtDFMVf1VW?=
 =?us-ascii?Q?ElKF5lxcTYiwtvmYIGLBj2v6f39xMK6ZUJadEO3zxCdy8mEqMrGLPudW5JM2?=
 =?us-ascii?Q?Dfy3NvHF307Q+eavurnpH7iwHCTqlMcX14ZcJDGHi0XsBznI1Q+RdjcFbiEL?=
 =?us-ascii?Q?iu//BmHQJ9m8dsRrBOrBq9bz1CS3Q1fBrCz5V5gh+uJURvm8J0WIwA1VmAYe?=
 =?us-ascii?Q?o+3qUZUgl0zv/qB7vDNU0zO6bh70+62gohPhXErEhF+PIzM8P3Vg3RbPhteZ?=
 =?us-ascii?Q?bCZqiAXh5fvx6zhQYZItD0fDPU6a8tg2CX2sMI9CvyCd2fhQ+wB3nmVaHRZU?=
 =?us-ascii?Q?ZYI9vRSROez994LycWE0dpPMFw0+wKIsKfK5fDY80BtnoGtAcc2fkQmwu9Cg?=
 =?us-ascii?Q?EkYKbQn4Da9+zLQ0KiIeMkLzxaW1WKYO+g7V4e06xCzrXyW8CjTcyM7fn77h?=
 =?us-ascii?Q?UR3J9Eq0obNF0RR055mTt5LqmBh38CM4RJMs47scklQsNdHFLSqh9Kza2gM8?=
 =?us-ascii?Q?w+AvIONarFFjojG8vZJcoNi8nW6uakw0NJYm9xR4sAemN/UMt10LGQAG4k75?=
 =?us-ascii?Q?TIB2V0kxKOJCOw7QNY74PVj18APrK3ACGe4G6uUeXkefISKB1luJer4/zWJm?=
 =?us-ascii?Q?EYyyG73lE6TJRYlLvsy1+zB5XzkUrhn0ABDdZi4zsNBjYr6J6WEPrH35rVlE?=
 =?us-ascii?Q?67WZmSc6BhUipmb8YmyL/LKdFVS9OV/jE8cgYnzxptIPb1I53EGeItf8xMgN?=
 =?us-ascii?Q?5P1s4BiHtI4Ze/0yjvgJtrGlC6nOrFQMr0hn04DWWlxagAVAru8mwauLw6cn?=
 =?us-ascii?Q?1P4eNyrUhrP4Jrn6aHCwWAZJ48iIOsvT1tjWD7Ny7dI/TwowaYCvfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjDt6nyTjDI89RRDnMVRb+SGd5QFULlUYQLFf//c16A99a43ZrX1BIz02p+e?=
 =?us-ascii?Q?4ZfWWLqOdlR8ChzdoixnCp/ZMFjXeBQw6Y8WJSwQX8wu/xhfzBycV06PGXgo?=
 =?us-ascii?Q?yaEmvVgCsRij1C72XbCie/cvlG1ygKp2d6qzGYet05h2HRf4tsSfr9gTHCN1?=
 =?us-ascii?Q?Z0y9i0sMgMpkW7tA/39Wgn+UJDvpRp4tiQb7U+kI10IAFMWvExHqsYpjGCtJ?=
 =?us-ascii?Q?JU8qdgC5NnAD+c0YRXcPn6IuIDXGQ6pEaiAg7aCo2PHYRnAX3WxJZEuTZBG/?=
 =?us-ascii?Q?tlFWSCMXZ+4F7B17Xw6M7zGzsK+00UmB2qNl9UZPxmAIk6yFyTax5sR2fCeN?=
 =?us-ascii?Q?umj9OhGXjf4b6Kv+VFLDM0SNpNJAATIVbQyJKILhL6AS87P9A5tNYg+omhy+?=
 =?us-ascii?Q?cx4uCOZUWpxYq3GDTTnzCXyrfm5r0T28H9haSgTWYduw4TePLrHLtCsNfyhh?=
 =?us-ascii?Q?DCT2hXC+AQTd8VAAX0sHS9f4h1L0M8hKLp6wBZynft/rqqSKWZhP6kQna6IP?=
 =?us-ascii?Q?pNGYifH7TJgyxUc9fm5LmdZEDPKA8BQYqUOS4Bb43DBzRJrIYWa1PHD7Nu8r?=
 =?us-ascii?Q?EumbZDX8gRtY4z+Cd2Gb9x9SXuoqDBalgGqYR79nTxm8wfJ7NDzF+C6TQuz7?=
 =?us-ascii?Q?st6bmDJqbSVeERnDVhbjhE1zNV3mAbxYQSJcdPnISuUaa/JUH4GUHG2/uBfN?=
 =?us-ascii?Q?IgIkzSuDvrYIZ2VjCF1mgFsUkqefkRKY+MUKFHDiPcJLVdMpD0S2clZH2Pif?=
 =?us-ascii?Q?z2DXCkxmvqPWo2q+nBQQCwhs9uGO8ewcTrUN2NPSq1NJYCTaohIZFtwYd/cT?=
 =?us-ascii?Q?XZ3Qp+7Yx4BdHPFlutc3XAx0b7eL6OMuuznmpRyrfchPweS3I7vh+L4dNyMM?=
 =?us-ascii?Q?5ccuK4cTWp0gkr2y+q8u1wY1Eu1ZaefXcIfl0dhu3Kzlrmja8Kg8sonDy3aY?=
 =?us-ascii?Q?qYyLY0saFucRysP8yCiC/FOy7dU1vXzyq2lv/mRs7iVOSiquagnrsiDHE79J?=
 =?us-ascii?Q?SLru0ZfI8lkN6AprOc4Vong/80oEGafTaDwM6HaA4S3W9c0y9lkGXhoW2o0a?=
 =?us-ascii?Q?XQPM6vQZWjMM9yIE7Q+mq1VTrZTa9H1OZ8ZNOBQ7eefadTMQ2tjHuRRnto2r?=
 =?us-ascii?Q?5nf5DZ6G6S1rA6mDFUuH1ljg0RpnNfVV/ldLLVTD64Hy3BBzYtqkcAhoxp1r?=
 =?us-ascii?Q?Jx15P/Zv4eNB9MkSbUl1kwa5tK9C1NmyUtIt2OW0o+zQkYwlO9YOtZW0AKlQ?=
 =?us-ascii?Q?FyadstVjwQN/hKPNwqfvAW2rNw4ptWeHTVBB3M6L8F6iSpPxl9EOF5e1GUAp?=
 =?us-ascii?Q?FRFm9ZivHs+8V2BlaAkYFbpWJJb9qrGmRJCjS9J4KV9T75NQe6BgDl+kGhi0?=
 =?us-ascii?Q?pHm+FZOZAgQP7/PbpRHQbke9qYhPBkLGbcpfG5XATn9ZByclfGU/tn+kA6Lw?=
 =?us-ascii?Q?uXanMVpOcbliFA2t+PZHAf1cStQhPykW1HEd32u7Gruhp9xjUU2HiGBZVb82?=
 =?us-ascii?Q?rDDzzTjaPiORqYS0DRnF5OtuwfZ7QSdcTOJ1diP10E319M8yJsPmpnRgfc4q?=
 =?us-ascii?Q?YURsh2DNb/cteCOuL5vShslm6t1VrBOp6vUaomUJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f576df2f-315b-4461-7363-08dd8c77e69e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:55.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K7V8oes9kHCmmKqJHaKa1HsqP98HgDmznShiDZolGSF4nBZZ1biHomuRbaskWyCALJ89apCUG08PS98h5hX2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add internal loopback support for i.MX95 ENETC PF, the default loopback
mode is MAC level loopback, the MAC Tx data is looped back onto the Rx.
The MAC interface runs at a fixed 1:8 ratio of NETC clock in MAC-level
loopback mode, with no dependency on Tx clock.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_pf.c   | 18 ++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_pf_common.c |  4 +---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 1f6500f12bbb..c16378eb50bc 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -101,6 +101,21 @@ static void enetc4_pf_set_si_mc_hash_filter(struct enetc_hw *hw, int si,
 	enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
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
 static void enetc4_pf_clear_maft_entries(struct enetc_pf *pf)
 {
 	int i;
@@ -536,6 +551,9 @@ static int enetc4_pf_set_features(struct net_device *ndev,
 		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
 	}
 
+	if (changed & NETIF_F_LOOPBACK)
+		enetc4_pf_set_loopback(ndev, !!(features & NETIF_F_LOOPBACK));
+
 	enetc_set_features(ndev, features);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 8c563e552021..edf14a95cab7 100644
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


