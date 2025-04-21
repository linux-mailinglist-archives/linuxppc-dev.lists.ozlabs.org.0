Return-Path: <linuxppc-dev+bounces-7863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F98A94FA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh2Qh53GKz3c4Y;
	Mon, 21 Apr 2025 20:58:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745233084;
	cv=pass; b=K0ZjOFmCn/lb96YCZ2Z934EahUf3JCw/BDAfpGVENI2GBC2rqYwSExztkimrayBsxeNXul9uX18ygTg1PKTyXlCuvZmjHJGFevyB3oiMeetA8qqIfqAdLPexqR/wnSJC15uPqs+xURR8ra5zSHcRICKJrF5SnFGttYflBF3u3Co1IMyeXwv1u5jbbyGAfkHiRuo5jiZ/X8TeyZ/cW43GfcFkeQQ53NpBCrDt8S/bbZzVdTTP5YTgT/R/ld2nLDfZGewr49Ve+4EKZ2UIji7IS5FzPptTNU3qyOAJEE4lVNa7voP+mI/1slygUtBnRtMfNMj3B4PnOzcyVNNRs2zweA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745233084; c=relaxed/relaxed;
	bh=dBqQFB/QYd8jkS3LllgRKucFmHf4odJYK7ckk+Z2TqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIHinIGuwQ8W4hiKfVyqbZN8Ldh4rAA7klIVswECPn1f85eH9gZa/bY+lDGH5hdCWTv4nLHhQjtqJs6DDTuc9aGkO0JMVDcfi1l7jwgqlOwFEhXAERoskpkANz5VhzrRg+JUu3D0cNY+3F3kkuzcAcDD3xbLbVpu9biYagT+YuPARzEu8m7YEWQo4b18L33NcnZ2uV7+0P4ZGQ1UiQRTG11J18KNFc4P8qIX5TkhOhp+iiW+nuwgTN0U1troZXGi72cZFzSXgzJsKJd/I5qOReBpHmBz+4Oa1mZamVgqTY9o7WwUUStUUJjp4aCR/15vLYLGNeEi50e26VV6Cd225g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iIJvV+Tf; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iIJvV+Tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh2Qg54NDz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:58:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6V8U8fGs5KLsuZ0r5iLjtyYr/GDiAfqYxNlx7n9W0U6+QPDizCaRdEvsK9QwDUKELnLSGgokJEKjnhc0DPl6et1nfdW/yKd576gND7r98eqaQrr0UpdbsEOMFlj26N9wBgY36BbBRbXoO2ptIh49yFu7zXPolPaTxlxBu3Zfw19vWGSWqFV8Ar/9PKy38sSeGBQTWMlG+zK+o3N21MuFgJrEH79f5J7tEe2tOubS9yeGtzQEDufHcyqejgS5q1uPxFHD4njMc2EX5IssYBegbLZtd10DzoqxY5ukmJ4IlDlExXm+IX8voV/e2XfcmOZffmMLGlnc4hU4JNNvzb2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBqQFB/QYd8jkS3LllgRKucFmHf4odJYK7ckk+Z2TqE=;
 b=LhS6v6exTVytyTCBOtFncBR8z/kzCzHnkH4WzraZki2MXXgFA2Mvc705ZWfXKQW7fJzGEqg9Gv7eq7PO0vK2veWD2qV+ylHniw9jlOPzaSBjtxroOERp6rrbREPyriCjTg/tjDIuwNsXxDOEYpjAYLNCGtM5vMQUH0EPL48BrZS/NB/QwwRgzqQSW1zD7VNifrPiCLJQ3vHpGSvvkxMsS9Y4fZrG22f7D8OoENa7rWGmsVHD69xWgDSz9fwqe/4Khx61VJGb6mLKJUsnX4ohdZ3PIiUKoaGt20PMZM06oWEkRiJlLPyfQtE+y0VwBZDcs8osz0RGjlU+eZhHdATe0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBqQFB/QYd8jkS3LllgRKucFmHf4odJYK7ckk+Z2TqE=;
 b=iIJvV+TfdKgJX3e1+QscLJ4PtF0tuig5gnyBXzNTc4MUQW/9ch77kNaV+RSYrOdCxpys/7HD5BR+CqY1eb0Wocsn+EFcd/9IoW2+gAguJurlXpbQ+D4Bi/FR5cu1QiT2GJnVXjPtxgHQtZySMaVGeb82YGUt7h6w6qC58f7H8wkHepxSjZMqdTAjSMKmH/Z0FOVZ2zMEvEZKakak885McmAtHsnJfXIRGcZtyFeMSBtlHmg55oit4WXrd6fMXlSLe71DpXP0qQgn8tgTdCSNcolwXOXJ7F8IehGBzW9H/LpKW+PeCZJbMo7gRpSmWulPcuSVVh3lOLBuEBJRaw21rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8710.eurprd04.prod.outlook.com (2603:10a6:10:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:57:33 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:57:33 +0000
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
Subject: [PATCH 2/2] ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream
Date: Mon, 21 Apr 2025 19:57:01 +0900
Message-ID: <20250421105701.2273588-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421105701.2273588-1-chancel.liu@nxp.com>
References: <20250421105701.2273588-1-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68e0285a-8b8e-41d3-1152-08dd80c3519f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mLW6EQSCWBDadZ/w/4hNfnte4HBnehoUeHPKvYrbf7+VU+f7wsIl4NPSao3+?=
 =?us-ascii?Q?/0wZEQtGfbvzsvjFvjvNcwvpCLqW46Kpyqh0T5OA8XSu1syv6MTQ33FJ96MU?=
 =?us-ascii?Q?6TyKq5zzgf25zu+tx/CzoeioQi2tjj5wScCrTCUkH1oWJcFJDzwvauLbCq+B?=
 =?us-ascii?Q?wSWPO7rTOwRnYlRYykP35KIvNqW9gUaQyxw+Ttbj+LErC3gLC2ZpmZwBaxtL?=
 =?us-ascii?Q?7Ux2KlVRt7jDUuhAhHeC0SDsKUxYC+EYYU+d21PnOO6CPOtmdfX4FUucARw5?=
 =?us-ascii?Q?xS//i1018SDZSf3d5GcsAh/b9ROtyHhdgS52+hIfWZY/d7kASQRfKKbRBlR3?=
 =?us-ascii?Q?++qtEW34FA3uvfdKJs/vrD25VpM4QmlFuOaC1Qo/uNwNATQAnYw3ciHxPJ8j?=
 =?us-ascii?Q?2mknSMRKLTyvUQ5dou/YhU5oeMJFoIVQEu3lf9PXd1X6ADPbmxiAHKoSh44P?=
 =?us-ascii?Q?FPuPMHF4U4ehawGGsMqFUAqOzEnBAzmTAM5588c43KzlcLQAVQIboa2QTYI7?=
 =?us-ascii?Q?P9RxzBBR4nQZaNB0Ck9IIPQI1+GfVv/+HfVi0II5JA/yVgWOJuZ498fCLLab?=
 =?us-ascii?Q?iH7qCyR4qRaXqPt72gT22Q/QXSZa7IRVnEuvYUeTyU1VzkiCNLGYYZyVaSST?=
 =?us-ascii?Q?dUnYLK+3SMm/cVvNgH5YH+0mISamWsDUSJAN3DxAiTQoFWu2qCDdYXTVGk1Z?=
 =?us-ascii?Q?MeTc5fZa2l4UP0ticY8FIoPijC2Nu4A8TuPIy5YV7VvBCErukWO5NAlNE1K4?=
 =?us-ascii?Q?eRoytw3aoDZjTPeDGIohG/RVm4wiGMTo7JZQk8+6yox5PaB4LER2NDtzyAop?=
 =?us-ascii?Q?+wQ/UzK4kIX2dI9+/VopJEXDCtdxSWsZQJdPoNMSwJWA6Fiqt7a2r0NdWzIb?=
 =?us-ascii?Q?bA3lGYsWuLcUV9uc1HZyA4lUEr66iTuyuv1e5YnRpRotpjWySj2NPcEmTO84?=
 =?us-ascii?Q?14kx6XDjdbkDigcPO78nk2bpjYrmTZR6Ai6qYfFreUpfv64UfqdqNT6GO6Wn?=
 =?us-ascii?Q?pYJ+OKz4CQt47NpKyNn+R39wrtJbS0tQvwRoHcxsgQoozZvKf9BwVHhKd9in?=
 =?us-ascii?Q?jbOKjgX1uPka8nGlKo+F9XTk79Q7HfFzVRWJW8fdWDLQ5QQqLwztgVmtZXjZ?=
 =?us-ascii?Q?VgchbAzA7pqmBXGtm+ZbtGVLF0sQTd9GMu2MVq97T+kLLjI3oGO0baKde+QG?=
 =?us-ascii?Q?Pk3waYUPOIiM3LdZ2jSfnUW37NSU0xl5gnzR/951UXCMj2l7VE7fHP5d1H7F?=
 =?us-ascii?Q?F4d3W5fF34WoXs1uiOOplmFQwvgAz6ksqqQupF9SDzGxE0vv0mgbNSSYJqSU?=
 =?us-ascii?Q?MC0QTWjyogXwpucQ/9RPMMdk8mXY5dxLPC1hv6pHDQi0kQBK0uIHwwEvMBby?=
 =?us-ascii?Q?6oUHdU2KEzYe9QO7iK+gehMxXpdOvPHd8uYkIcp40wKwQCFUvhfooEGa6n7m?=
 =?us-ascii?Q?/vR9frKIZTT/V9G3PLV0dmx18Dtbokc+3NoLHE8zCt7f/LiYIr4UCSBBW7ML?=
 =?us-ascii?Q?4qCWdf+jxeCAB8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iEa0Nvd16iLhP4ptltAxa127lbUCtbUfKlVTQeRx6SB6sz66/sxm7Q8R24u8?=
 =?us-ascii?Q?ksl1fQ8CVMKZJzb4jFbKURsj3QXgjwWC9JhPEKZRMhU/pHkd1xkb2Fn72ey6?=
 =?us-ascii?Q?rC+ofk7RNG/qzkMl6zLq8Z+V7JnHNu846OWZi6nx4tsOQcRF7G1dcDCc758X?=
 =?us-ascii?Q?bSa9XxiTrCuJcEd0OjXyyFIne1J1x3+bMZyxia57BEkhPEE8WaeKipu2nzpI?=
 =?us-ascii?Q?0Dc+t0dD0KrBYw7AzfZPhrozcbpbxgrFdzB8ABUhYa1TcDYA1BiYwsH2YE74?=
 =?us-ascii?Q?pXyr5JQHa+gR4yINAI/g098TFs8B5EQycfYxQ9QW6xZO/97Awx38cU9yFubE?=
 =?us-ascii?Q?E0L5+Joxr6kOFyBuvVqpVAcs1oLGVWLeh8NhBSXT5x4H8QwLsvXVBXWJ7TcV?=
 =?us-ascii?Q?3NCw9h+MVYdYwx5HFGAdOrKvkOFVFbCDzJhv21wNnC1yVHFhUZuJttLFApZi?=
 =?us-ascii?Q?8ggzZXc1Th8XoGlQ9ZDAPhtyeXShzx5WXnxtKSeUAoyoqfQ6KutIZ40eVUcc?=
 =?us-ascii?Q?9+bD6IvHA63ZTLCZ/S7cHljFl09KbhJOXllTibcJVcofn5DyyfGVvTx3YhTf?=
 =?us-ascii?Q?P8CgX7fxC1kJ/TQYTKUf696G/fUiE0gb2texGtuhzDDNgYb5Zq+w3tCLGciR?=
 =?us-ascii?Q?Ccj9eGMv/ZuUBLoFxnV5CKZ2rCZIq91IzmfNAnm7FSTzk1/zAokw7IF9r/kA?=
 =?us-ascii?Q?H6jIwCy3fJDRUzqOa2DF/UXVIdmjd56cw4g9crtcPEANEJJpz3itL7Za7gWv?=
 =?us-ascii?Q?St6Z+inN7nDPc4MaWPjB0IIwBFTCqCQzN4xncPWf1/DUL9P1p+9OIogZA3wr?=
 =?us-ascii?Q?xv0HyFDISKoZWkn7DOoYSDFgJD9se/eABzACwbih00mPwhwvYdNXolySgVep?=
 =?us-ascii?Q?I9eb8FHEMG0aXv2XOPpdYK2jXAGy1yXbOP35WgRZ5lPB01sYGX0SRn/WzuDC?=
 =?us-ascii?Q?Whl+ku36kvfF5QLFC4nU2RtE5X4VXory0TmiRiQ0TMbKxk1cWY3ZLHt3XZr8?=
 =?us-ascii?Q?rRt8fRHCt90cJh2jGDYyIS9Hqciiyp3nuOGapf8KH9hpq5/LINRjl9k2pXgL?=
 =?us-ascii?Q?jOncAfeFztk3IF5psuJ4N+yxG6NZC2nS4B8bOOw8huuK64r/4QryFNmIfTe2?=
 =?us-ascii?Q?/kBZsevg2WNwdfoMLJigymxpVlPkZdhjwskjSJhHJHc/qWWx44pvM8G1AP2z?=
 =?us-ascii?Q?lhWhr7318YFrMa7/lsHmShn4GPZ5eaGKY6uFLjSUpZDE6DEqHf++8Lo/irQV?=
 =?us-ascii?Q?yIwN5ErZ2tH6AhI6g8GhLjsidKLj99RQTMERUm1lE+dhv5btUV27Jp9eiJH+?=
 =?us-ascii?Q?GcGNYoT+ne24XMXWbZ0LLZH/9ft+Z7hGVl1MGamPO8sF+NkAHrA0q/3VwvQN?=
 =?us-ascii?Q?NfH80MfrQPpGvO8FJYVzBW85booMPIVAlqPWMf9fKjVwn+wWH4GCtHAymXgJ?=
 =?us-ascii?Q?JWiY6yMWDWY3Ss/0P33pq2Z6DmMCoVm6nkUYnTfhejl2kZplCWLydDuK9YxQ?=
 =?us-ascii?Q?hga6fktGMg715uSY+t/s9jnUZ1hoJ5WEcojTieyrlzafkji5vyB9r0AGAvIO?=
 =?us-ascii?Q?SMDaANwsfNM4qzMtKUXcZXaGjadNZ3VAIs7VeVca?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e0285a-8b8e-41d3-1152-08dd80c3519f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:57:33.4900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOdeHp4A/vQJUOnQOP1PGNurCaszk6Jg37RnlmCmjd9R3+rgEvFThaBVtoIeRdoWJd5OzBqKYYZP7t8o5cn1uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8710
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If both playback and capture streams have large buffer size in low power
audio case, the total size will exceed the maximum buffer size for this
sound card.

Capture stream doesn't need so large buffer size in fact. So calculate
a reasonable smaller buffer size and allocate it for capture stream.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c     |  8 ++++++--
 sound/soc/fsl/fsl_rpmsg.h     |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c | 21 ++++++++++++++++++---
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 4e3ca05bedd6..5708b3a9878d 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -24,6 +24,8 @@
 
 /* 192kHz/32bit/2ch/60s size is 0x574e00 */
 #define LPA_LARGE_BUFFER_SIZE  (0x6000000)
+/* 16kHz/32bit/8ch/1s size is 0x7D000 */
+#define LPA_CAPTURE_BUFFER_SIZE (0x100000)
 
 static const unsigned int fsl_rpmsg_rates[] = {
 	8000, 11025, 16000, 22050, 44100,
@@ -241,9 +243,11 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 
 	if (of_property_read_bool(np, "fsl,enable-lpa")) {
 		rpmsg->enable_lpa = 1;
-		rpmsg->buffer_size = LPA_LARGE_BUFFER_SIZE;
+		rpmsg->buffer_size[SNDRV_PCM_STREAM_PLAYBACK] = LPA_LARGE_BUFFER_SIZE;
+		rpmsg->buffer_size[SNDRV_PCM_STREAM_CAPTURE] = LPA_CAPTURE_BUFFER_SIZE;
 	} else {
-		rpmsg->buffer_size = IMX_DEFAULT_DMABUF_SIZE;
+		rpmsg->buffer_size[SNDRV_PCM_STREAM_PLAYBACK] = IMX_DEFAULT_DMABUF_SIZE;
+		rpmsg->buffer_size[SNDRV_PCM_STREAM_CAPTURE] = IMX_DEFAULT_DMABUF_SIZE;
 	}
 
 	/* Get the optional clocks */
diff --git a/sound/soc/fsl/fsl_rpmsg.h b/sound/soc/fsl/fsl_rpmsg.h
index b04086fbf828..1b1683808507 100644
--- a/sound/soc/fsl/fsl_rpmsg.h
+++ b/sound/soc/fsl/fsl_rpmsg.h
@@ -42,6 +42,6 @@ struct fsl_rpmsg {
 	unsigned int mclk_streams;
 	int force_lpa;
 	int enable_lpa;
-	int buffer_size;
+	int buffer_size[2];
 };
 #endif /* __FSL_RPMSG_H */
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index de5f87600fac..8ed62d43ffd5 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -261,7 +261,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->send_message(msg, info);
 
 	pcm_hardware = imx_rpmsg_pcm_hardware;
-	pcm_hardware.buffer_bytes_max = rpmsg->buffer_size;
+	pcm_hardware.buffer_bytes_max = rpmsg->buffer_size[substream->stream];
 	pcm_hardware.period_bytes_max = pcm_hardware.buffer_bytes_max / 2;
 
 	snd_soc_set_runtime_hwparams(substream, &pcm_hardware);
@@ -597,14 +597,29 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 	struct snd_pcm *pcm = rtd->pcm;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+	struct snd_pcm_substream *substream;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
-					    pcm->card->dev, rpmsg->buffer_size);
+	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	if (substream) {
+		ret = snd_pcm_set_fixed_buffer(substream, SNDRV_DMA_TYPE_DEV_WC, pcm->card->dev,
+					       rpmsg->buffer_size[SNDRV_PCM_STREAM_PLAYBACK]);
+		if (ret < 0)
+			return ret;
+	}
+	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+	if (substream) {
+		ret = snd_pcm_set_fixed_buffer(substream, SNDRV_DMA_TYPE_DEV_WC, pcm->card->dev,
+					       rpmsg->buffer_size[SNDRV_PCM_STREAM_CAPTURE]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
 }
 
 static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
-- 
2.47.1


