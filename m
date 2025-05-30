Return-Path: <linuxppc-dev+bounces-9044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15620AC9332
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b87c952Jfz2xHv;
	Sat, 31 May 2025 02:14:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748621689;
	cv=pass; b=EicnZwm76DtLOb4Df2F2jHQPv5A/1ZIbYzV39/kVQqpztouzLBsG9TvUxXrrRp4Kqhlb0fuOE4EZYuhWueScHk9Xwjal223kv7ujpArci/+4eVcpLoI53p5gyLbWgxtjf8BAe4loZxG/HcLmwfZ2XuAhluEMpdWsA9XWkCHn3dXMxy1KJla7Nd7xhrqnzPcsvkysKtkIvfwhsQNPKZH1Yi1Fu1XXV6EjxKHbOUkYPT6jhEdXbmN6S9C1lVbQRSkWSVJc+JPinnWg2KVqG+/RkqRlUP0CKkqXFaZ8zUTts8DTsQh/bf2sYY6Ft55Hcn24PICAvkQV1QepeSYlwNVSfA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748621689; c=relaxed/relaxed;
	bh=th9oJsN/wXTmkd7tZ82swm26S1lJzQ7yQ8UijfTC1l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P0DlqUjt7bwZMYH1rscLZbHSliy0/DlCmt1rDD6rrsgqS76PkKL4IRb/rqj3bXUDt9lOxapmI3hj9edVJjfT5VJmsRyxeMTNRaIAHxCiYWSNlmIHDzFMGd/if5sqX1SM4HYXEK0zOlRed3Ps4FpQHQgsNm1/Kf0/7CBSUN7dTAQYkuZMtrCwuA8gmYIPiXqhw1y7xez8JIshWUzEDsqFrbgLAfX4IgQwB1VNQiwqoU60ijh/RswyWsvyTUrSaYGM8xVdDHad4c2RQiRG0+QMn7s4J+JL4vs39yHgLKc+6p3xOhXmGAYHPk/Y9v1DSHNBL6rYNytBC50WXISSZxpVCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bLutvWzX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bLutvWzX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b87c81f9Mz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:14:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTcTfoX0ctcIz7e/2JJmYSH2JwtrozvtQd174Q8L89cCcmlXyDXi0zM58LE09ZV3oDvES8GntNDAVf6IhCT4esAYNetfX0oCwdsC4FnAJV3GjDCLKl1DdfLjj4Gt5e0TCmrHght9v57bYhadfQQZp0wi3QI+OYr/olUPDoCwx4J9lnAyiTIFNPoOM2OARD6AIBTXXD6Y3rczafhw6Wn2qHnJH7lAAUtqg6pSfjKYKxYN0Q/mTBH3RRUM69j2RKPyeR9er+IscBiso9COD38HVr3gh0b58FFN1d8YPm2NDYLT/5EGRDqP+8hoUNZXYIsv6NSwnelFMGhf7IGVO2MSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th9oJsN/wXTmkd7tZ82swm26S1lJzQ7yQ8UijfTC1l0=;
 b=MZeT8fVhGeo4dsZrkaU12vd7f5P0dBGgRuu6z08riHGvGWykJs5SCRZn6N5vSMptYcp8vm1++M8zSyCvluQd6aD9KnKR3sF0RhurHHvTtxstxcsKoBEqunhxnxMjnIPOGMKq7cR/sZYX4DT0t3MeWxw5sbqLXwyRgkA2yASLpeKjBQ1Par+0jqPEhEJk0XGv9lL2NEEiaaGNnvWJvIUtTGWRoIxKDh0tFi8E5ZvyZ1r/5j8C4YnU/KPxYVeyT4Fv5pHawCW9LGV0sCz637l1CX+COw0w2PuCjLKNeVxDOUC9pXdzSiJ1rzByhjj1efCwG92iK95UhiP1R938hqeQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th9oJsN/wXTmkd7tZ82swm26S1lJzQ7yQ8UijfTC1l0=;
 b=bLutvWzXl2LRNYvkn98E5HDnK+uD47XVpBxhVjq7VPzpYPqKL4eLyX03dX5ZJJjAOUUOyIUGBeeNoNd5e/AqTFNU9ZU2Wr8zvMX1cv4JAzbpqkQ1Ae/CDiw4mkvx7RWuQbME3vuOQoHMf9dcvmJNj4t0QDwSuK1gS5OC8ZL848evWENPw/afF908Enclk9twmD+Oe2/FS1i0Zr1sTL6fIaLmw9wNlPYejpPP19zkK7Vb1wjfns0++BGehU5Qvr+B0ewwYDJ7QPjnV9i/CMpTm9tDrB39U2niY5YNlQSXwaoISTzUNHxfS01+RL4XA1tLSiBrPPr3qU8npEmSTP6yRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10992.eurprd04.prod.outlook.com (2603:10a6:150:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 16:14:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:14:22 +0000
Date: Fri, 30 May 2025 12:14:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <aDnZVmOODuVaEzww@lizhi-Precision-Tower-5810>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
 <20250526-unpaid-mushy-d47196d04ad1@spud>
 <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
 <20250530-construct-library-64ec665a6fea@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-construct-library-64ec665a6fea@spud>
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b53dc96-7bd0-4264-db36-08dd9f9509b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7LDT/HtAb1bfJWjDFuy4e0lrYZjlONttd/QFXyFlFVSgsxvUoNSt8UnYcVHF?=
 =?us-ascii?Q?2QPq9VKcOv5h0UUIEo5U+KJmbEZgjXrvJ3b8et0dPN0TMF/8ZRuHuaOo2plC?=
 =?us-ascii?Q?P0UG0KnjUOHoWcM1XfrLI9DMssKxkA4aEARifazNNLf390Tsq5FW33XwjF1Y?=
 =?us-ascii?Q?/aM3HPIos/n3fK87kTEgQJcJeDrOVlxk6O8AJmSrc3kHP3q0EKBOo9HZJzN5?=
 =?us-ascii?Q?D/787HwuVrkJQXk2D9Fr83sUSfFjiEF7zFSmRLIzDz4kyij4+F40Stfegx4Y?=
 =?us-ascii?Q?J9KiIL8IwHGQzcUxqn/w/9xGkH9lLRAK8p975apOPiI7sCG1endFIvg1DT4K?=
 =?us-ascii?Q?cS4dWopqJnxAYC7UrHuzo+o5Jbng2HvT52t/1DbFvMGwoe4VxkDe8Fb1fXkS?=
 =?us-ascii?Q?Bi9/8tsj1Q3+yzHNYtZaWLUIgTjbBNAPJOACkrxmMkHiJPbnlpXPXXnwTJGW?=
 =?us-ascii?Q?/SYsoJmaoAAI/1wQwI+DuVVR3s41ZJOXmHoOdCpuTu9BXc6jhkfhEmzuBsn8?=
 =?us-ascii?Q?jaW+TEYf6U9L0w+rPGag/nQzYMZBy1nE3KSvseXA067LGMQxI+pcpli34RLG?=
 =?us-ascii?Q?EExfJjwClmuWFyv/M/Shg+ilDXphM6gQ3XM04ejJB5cme8O/OQSbu6hxdczl?=
 =?us-ascii?Q?ihyKqVqqs9G0gRZb+zx8Yo1+u5o63Pc38Buud1B/PnkX2Ammv0vaq8kpfXxo?=
 =?us-ascii?Q?3aXniYvLdpFfqv2tu7umPR/V88ZZ3HFhEB0BXV7YvsldeMd2wrtS3MudNJlb?=
 =?us-ascii?Q?otgVtGoIXiAWVGl/Ju39h575vXsTLIx0KbPxZdddAaQBvYNzEPSYsI5n7lZu?=
 =?us-ascii?Q?QCNFHwHilgOVz/PHdET49Avu93FeNRM8HM2TXJ2/jD0n46iap7xGs5/S5Ns/?=
 =?us-ascii?Q?1iU9bogenAlejF0+pP2FJbGENPIzKb7OD4RRN8cBO6MM+zoDDbkjXMy0SMfs?=
 =?us-ascii?Q?b5gu78LX1/NuOEalQfmyWq1nE6ZtguUHRjylGSxF0BmRjnXEY3faMh1BfPqt?=
 =?us-ascii?Q?Y/IFUwqxwKkc/xjVV854PgvWauyH+068e8dRW1HQYsYjwchLjoy4k1btSVEy?=
 =?us-ascii?Q?Hgk47GOBqOlCOcpoQFWCJZBHfCzR9KjrmH6o8QRA89Hx4VkhFNF9id260wCv?=
 =?us-ascii?Q?3tprimvgDdg+FT6UVxzE4D0Ro3r77yL01WhsjsNQMEtyr7ISDjACzEpxw8DP?=
 =?us-ascii?Q?ZCYSz3QxrMKMThd5FRedeMam5kzjfzdMzKCZJGrpQ0ARkaBIm9BfkP7EDNE+?=
 =?us-ascii?Q?D8TP466U4z7S6DLWw8lPd2zACT3PwTkgSA4gnSXAWdOwO3SyDc9m+KsiMD8o?=
 =?us-ascii?Q?Ggcg8MARQ/ok9qu2AfkHKp1YXm4c3yZImcXZ2ELkSPXVbJu4KbJKDORfSicx?=
 =?us-ascii?Q?EEArmAEMxX7WsV6ZdxjAipP7HXYt1r3g2GQReuUqU/E7fWkuj10kooUfG4Ob?=
 =?us-ascii?Q?/Y+7JprhUu0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOTtk77mduodRceHP/0BYhtRKIG1lWRZ/OahXMuzSov2UMvN764djCQbiZim?=
 =?us-ascii?Q?MxK+dkmqSDqdUrUpXXVzSU+yvMtvYOSAFTRElUIr8HVPnPnt7xUE2RCApmZJ?=
 =?us-ascii?Q?Al6kjJ4vbRzOp3bToLnULWE5n0uvgedTM0H01v2ToZULEGuAvL3MSC41kJKE?=
 =?us-ascii?Q?k+8ARdsUXno7816a165gusCc1EIchfACueHObcyP94QdVaI69KMund2bGyos?=
 =?us-ascii?Q?xiOXZZy7yJLGNOmppIdIG8OMixjdcTqtjS+JkpX7OpKdXnKyfFe0rUJPiLM1?=
 =?us-ascii?Q?5cq47n3dzGUjk+A3UmBmQPCLtNEW7mSm6pjgdFKP+XX/RGV6dVCnk62Dm1Pk?=
 =?us-ascii?Q?X0oChdodTlkmUzPGUSTTmxxbW2gxjOJgSXKLE06ovHQdfCOKoYxDwwuLI/GE?=
 =?us-ascii?Q?W0r/PE3PlA4IanTV5oG+N6+wuJcFMKdNVEvyalXnkTTEh67tDMaqvxiAfqcO?=
 =?us-ascii?Q?PYIKW8CsRRDbH4sEAqgAajb7A1ufV90is5sKrc4w1jObW/3xQJfozprNYxjo?=
 =?us-ascii?Q?q0oLBOJZygaUc9oc9PlSKDehpfO92k7eOAxexGM3MXzVOTO/LRNmHch7NaFa?=
 =?us-ascii?Q?onkzSwpq4iNagBOSXTTznQ5ZG8nH0bFedhWFVj26ygrtztGu8txPD8Rwf+HG?=
 =?us-ascii?Q?s4MK+t/YSfKNKnLcduTPKqbDA7ze7Ztid6ygozYmsQjbB/zaZOpmHt+DlI7q?=
 =?us-ascii?Q?M7RhOpr1L8m9bTaRy0sVaeDt/XiRmi2IbDgQvHSvXMETXQaPjosxEMWk7xCU?=
 =?us-ascii?Q?KVCRvIp7H0yFbJIPCOibe3/cUjmmQhVDrdjZXnvhj22NCro6X1fM/y2HCQ+h?=
 =?us-ascii?Q?2YkH3XrWpSGfTmebGK6BgaBcArwWv58qLUnK8nBBlrdReQ+LfBTqeFo6NLfd?=
 =?us-ascii?Q?PuXvtwdRU7kytFkNzP3AVaB0TRNX7Jqb46o8BA+LojPGB5qBVTS0LcMkP/Fe?=
 =?us-ascii?Q?iLNLwfaOmHlLynPKIgjVuSTBqlRrzxDr4cjwJv7zTPGFPHy0bTRwkI4ezR5z?=
 =?us-ascii?Q?m48sKGoU0815qImOMHbUOzTW8LjJGr5h6s6HROzwxle0KNJjU+thQQM045Pv?=
 =?us-ascii?Q?grDT+Hu+1APwjFTN04c7HXtxyVjvAgHuwQg9EJ0d/zTif9sUPt4LOkdP28X+?=
 =?us-ascii?Q?rOqW7zQAW3MwWoTq1WvjZlDn4yiG8h2+WcGR0nab5CnB9vg2F7qyAwY+EXt9?=
 =?us-ascii?Q?1JnJ1FIgQi/vIdQ49M6e7oQRIbjJVM2SteFb5Oj7VS1YuR/ZPYRVkesOxXue?=
 =?us-ascii?Q?1r9kjYseBceaZhO2l4PcuL/AXNupc5knGNA4F9SPFoNrZ/MFYrPbcsCSOuVG?=
 =?us-ascii?Q?hRqOw9eJGLj5SVpRIQLWgjT42wgUOfdM+tBB3T0GppNFU/iV43VOFLeTc3Fy?=
 =?us-ascii?Q?pDJfv0hnhxUS7P2mUlunrpjF6AJudfIGG34HhcuR/TBytKeLtc+xpYLl0h9/?=
 =?us-ascii?Q?YsFLbQ8UC+tSyTZbb+x1FcGLE60k1BqyFFPifznKoKT3rT8/aLKrB2o9KYDM?=
 =?us-ascii?Q?d9yKig3LYLQj77NMgAnIL9mE8ubCBnEMMq56810F3UQGSm/++g41EU7csZyF?=
 =?us-ascii?Q?EsqxVzn8PnPuwvQRt/yg8sZGFy4nxme4/PzdFYyd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b53dc96-7bd0-4264-db36-08dd9f9509b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:14:22.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzKX7ZMYKzHTvIJ4tFKGRDJilEk8U1Ytf+zmYurETYJTF+SQ4q3GJOQGR1hJrlXT3yusF3jFvthSGx4/BLDxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10992
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 04:23:31PM +0100, Conor Dooley wrote:
> On Wed, May 28, 2025 at 11:43:59AM -0400, Frank Li wrote:
> > On Mon, May 26, 2025 at 04:54:30PM +0100, Conor Dooley wrote:
> > > On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> > > > Add vf610 reset controller, which used to reboot system to fix below
> > > > CHECK_DTB warnings:
> > > >
> > > > arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
> > > >     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
> > > >  1 file changed, 46 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > > new file mode 100644
> > > > index 0000000000000..4c92a5e4892bf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > > @@ -0,0 +1,46 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
> > >
> > > It's a reset controller then, shouldn't it be in /reset, not //soc?
> >
> > It is not reset controller since there are not #reset-cells property to
> > reset other models. It just provides syscon to reboot the whole system.
>
> | Add vf610 reset controller
> | The System Reset Controller (SRC) generates the resets for the device.
>
> Giving me mixed signal here chief. If you call something a reset
> controller multiple times without any additional clarification that it
> does not provide resets to peripherals, how is anyone reading the patch
> not supposed to come to the same conclusion as me?

Yes, reference manual call it reset controllers! But it just indicate reset
signal happen. let me add more descrption at commit message.

Frank



