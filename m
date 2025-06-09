Return-Path: <linuxppc-dev+bounces-9224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB6AD2372
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 18:11:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGH395HDQz2xHv;
	Tue, 10 Jun 2025 02:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749485461;
	cv=pass; b=K0mTq/YbZLR+y990WdLV4YRI1jAZt2haO8wQOYxA++7ALBt2CM49U5/WjucQFrTxOms8WnRtxFYigZpBEksSortKRKSpxWA1U7PPebn/Iq/dYfs9+VvAsmRIlPec/zUukpaPMCaXXxFU3Nc5FoxtciYf9LDyc+dAC8w6FnVdrlB+snfIX0IeedGcnsbawHUEOZkqdrEXgSX8VsUDO93yGkeYA1sPFSWSupMOnoDq5La4qgLn7XC+uSoEhoDypd3tFjwCvJ7PI8/8phjfVRJojyVtMKvYdud5Lhx2Y5yizijK7LBZWMRYD/ZqXweGj/EiRgIrJSwxcVO6IlzbgwYnWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749485461; c=relaxed/relaxed;
	bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFQHa26lhdDiUxkmPRvdBfnnYeLmKj+d8vGphDY3aIc+7ylHy+f6AWi1wCGaVtSZTV3xmmhRyti3p9fXiZoSUsMzNlK95vu3woe7D8QQNu8J/E0RRYftGbLTX/JISvAyeo2+3zcvFK+74kokFLqZH1uY6eSHLZ/WCpKWqRvi0jKm/7Lhb4h6gvLO1e1tXerXDyK4GyqNx6y2/i08Qp4hpeZRbN3wFXFYrOkSSQ2NIkkREBfoytnbRrpPhCl4qxCBeFNVFqzzqse5JQLICGwtB/Eth9Qh8K6y5RbEnmK8PvvKeHM5wZcdEiyIvC7l8TC2gqCxrlxrH57I/4lSn+kEDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H75AC5Jo; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H75AC5Jo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGH375TMYz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 02:10:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymXOYdSqFNIHdj69/KKRwzA8vDLzzXVSrg41hXjpGwPo0wVH5NSYgGnai3ND1Xd1ZWSz1onixMfzAfx5bakakS4PzzZDMSOv8F+77Bb5U1ABa/JC8P0u7kuOmdiQs0MYLma2Lkr3UTDz+x4GSADhFUo5Z8GLbMrSTzgOyMb0ETQIkbk4EqErPHe8SWmnbOqzSKjR6/tOgfS55lFEmbOYpgecS/4OnfB9Ur99aeHiHJ9t2UlPCv5H7WYpPru6zFVAVEuJM6kcoCeYE/bVexOg0XbTF7eBZLMz8nLTStGz+zHq0+822p7E1DE6RZujzB7yitEaPaiH6uLPeqGHj73cJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=;
 b=Or0xhRCWbt32CqzwWYePWe1287IqX39KygaOrpElYlXifmqr/72oyzt/c1svZ8Zrwywqv3alKgmp1RDxVoH3TYJ6FK+gWkXseD7tBV+irHaKj7ylNNsAmfuyAB5OTDpwHH2z9Hxdv8KqGpEyFfgZYKIPBBd0sNRRv34eN93sYI/EAuONGAvKUgobdur1VC8GavtILXi9eW8UKASdwQUK1wfvmoj4WCdz22dzwPT7yOHPMMpTBOEOSxRqizzLmLzcCpN9SagdmeLyGkMZWVjEJulNaOwo++KWt5Jr72LK4lWuBqBqAp06NHWl0yQxgUZmZOEt40x2PjnlNteoKpG2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=;
 b=H75AC5JoTmd4cg+Z5NEbTYcwUVICAOli05XGxIW+EFWjNjsb0u62Ocra1q9RvszV1u++oq2a+fsGJxBwN3L5ORL5HpVTdPRPQ8ONql83ZF3rsCe1GRDLIVHpvPCuGdl1VgCIw0WjspHZxRlaGeux19fH2ZV/E3s/+cHQIg4D9yh0nGO/0IkciDQZEb9jeVkXlIeIm8VIyC678f8piS5j6WS9TPQuzNuhH6jPDJ3x2Fooq6favJi4Ae7pffDRpjHM0bIDW7q3tp0FE3aiPM/m6VrgWrtKk4E65fqGALpNEj0yWLRPz2wts8GEUpkkb7yd5sH+Omw2iOFpnHSmVRJ8Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7545.eurprd04.prod.outlook.com (2603:10a6:10:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 16:10:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:10:32 +0000
Date: Mon, 9 Jun 2025 12:10:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
Message-ID: <aEcHcZucl4745yd1@lizhi-Precision-Tower-5810>
References: <20250607212813.747203-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607212813.747203-1-robh@kernel.org>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 37aa2f7c-04d0-4a42-26cc-08dda770292f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dD/MBkX4ATTLmxp61CwyyNY2JsDUZD+Q+zdrs7pymmjE6PCEx8CI4QmCATa7?=
 =?us-ascii?Q?oKs6jsDJYgnMpvCgo4i3m70roUqdTSwMm85TDd9gNLU8+EwcUafcEIC3bAqV?=
 =?us-ascii?Q?AYvou3b8FqIZlE+qLxBDS0IVVl6/t26N1Zw/5hCUIRcfqreAHLC4ah22QLjZ?=
 =?us-ascii?Q?RHTFw09zmQiiUfz+wRebJckFC2Uw12Lp2OQD+Z7FWOjNm9NIEUHoO05hUXdu?=
 =?us-ascii?Q?JxYYcLM94AIR2iQGmAMmDIIv1Lg3CT2+7L77e6AgScReRU05TFj3DalsLsGm?=
 =?us-ascii?Q?f2uKEyLHJbhhTLBf33CXnaTVahIsjcZb8HVF5poS7G8NKOG+flT+EV50oy/Y?=
 =?us-ascii?Q?a83KybpnZ6adwOW9onoKUmBM71dhZgdkgLDvwLbIsPzksnfKWHRuTuGpc/Hf?=
 =?us-ascii?Q?9P2yB8EST9j8jhjYfIHiyB6LW2rdzHYHISlNVHDWbCxHGnsg01OQQAKOQpX0?=
 =?us-ascii?Q?PbsfTIlaOAc8vvQlbSnxuF/+0cKeL1F8/D+aAQqAhkWCpMQlSEViAyIX4hOI?=
 =?us-ascii?Q?QIb1Uq3KfV0aDuPaHgQ+N4fGsxQhg2erXyVSLeoZefB6GDuquIVslVo841gD?=
 =?us-ascii?Q?Ee/SP5i3NxHUQb3Q0rqSeQ7jgx99pdETCTZwjDRabwFmXjWN3kLNz3NLB+fP?=
 =?us-ascii?Q?4cT3pMEXqVoWGGlPy2h6yKbUfvYCD4ugJpfZq2P6QBQe6ISJg0uPqkqH3kow?=
 =?us-ascii?Q?aPkGRGcVfU2znGQn9h8hrHGK4ghv44pMBIj/HYThoH/p8kpzyYw3NXB5WtMq?=
 =?us-ascii?Q?3eAxO+jNYQKRRPP4ntSfDIHzUycXbdxPyi2ihTYwMXpZjwQcTJtGj3hHEevS?=
 =?us-ascii?Q?sJ7N8wccBGgKiKFo6loeOq+nZYrtt9U0pjYqzIoh5NZCogo3/47PALSMSADx?=
 =?us-ascii?Q?8TkPpZ0SBlq9BLvqtmjguVG0jYfeLBX9Tb8TVjR7JlWEpDsMRflSOYjRayyN?=
 =?us-ascii?Q?ZCRKMUvy2Z7MwDpFo6QE4lWuZRwVdg8j0j9sBB2CSkJz55SeyLLhXVM/JT5O?=
 =?us-ascii?Q?SLF2epR0Anba5Yo/LJ+S15c7ow10Nsv/AKCiiGMM64Fe4AdSNOAZPnDfE9d2?=
 =?us-ascii?Q?yHbCn1l3bllkjU1xnaLExEXQKEgZbH921gMRauWDJX1+CXqHFNKraNEX/22i?=
 =?us-ascii?Q?6k7gHEZYcyeQmP8VhBf2yA4SwREABFVwE0V1XHkixklCRImcOpK2+s557o5P?=
 =?us-ascii?Q?Ued+yIWQ0ZwjJi5GN6+fm6wyWRoseqM4EXtSbNU0MVDD59633ETmSJ7P5Hx1?=
 =?us-ascii?Q?BMvwiGhG7/0VI1ciTqgfISGeCsuLzORGAbHdohQ6STisQUonVC+EKXUXF4bg?=
 =?us-ascii?Q?BdLyXvJc8nJv8j/wFrPbyFCChnEhHNtMvy0oZphyUa9gJcqjWQMyEue6WaFI?=
 =?us-ascii?Q?kGyn0e51QKmTBBM0YWd0yy3P0WXY+J+xezESe6B5CGe+xqEgWUdTm3+TltAV?=
 =?us-ascii?Q?GxJAKtk6SFyufOgPWnXlLXWdW1g6nLLu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FOI18SU8y3Z3vBTMGDgm4F5wJwbQa9mDj7fhQWwW0NcGx9kEV72pl80gHB25?=
 =?us-ascii?Q?pey5rZlOQfHiBNeyiq3vkOPNT2sEPTR+HlEPbiSyI3xtLbfM/HiwSXWUhwEg?=
 =?us-ascii?Q?3fKZxNyIwHbKJMXVBKIPE2FT6ehqtbNU9atCklsnfPiZqO8jywtqmCq3K09e?=
 =?us-ascii?Q?3O61Aze23sJocNf71AUW6H4mdejSCvU45Crs9I4Sl0NaByOiLHR4EHGxxjQD?=
 =?us-ascii?Q?S+Yt8Z7CiixS8Qy/frt4r1KporCZYp67gRIB0tnSxvLqYEjW1zetqbWmbZMF?=
 =?us-ascii?Q?gMuNxwrUDBdGNK1K/9Y9i+Q26yerAJlGMrbnwipqBYQ4VIqN3A+1j347VewH?=
 =?us-ascii?Q?qp7U01NcD8thlRmw/Haw1JXE2lOvQOJJbTvltzPoVI5oFpY70CE2vmMc98hV?=
 =?us-ascii?Q?VL0IK5u1P2XdK7C2TVOBl/m6EHAaPTxsThrQr+5Wg9HFTJWALW/c4JvjIZwm?=
 =?us-ascii?Q?XYepGLSN0QPoiEIRFbS3hS+xPqtkUUJhnXMYQ0W05g69jDsfGRK4ifZ8DVQN?=
 =?us-ascii?Q?Ne+0vQDPvOh79k9isEKXZ0uC2nTHIgjgDTPZLMfjQM6m8bP+Ml/hc5dRqd/a?=
 =?us-ascii?Q?BjxmAbhCojC+PAsQX4XGOEBSR78Vim7UCZO3jt2My2ea2Lka7r6l3q+9HOFR?=
 =?us-ascii?Q?thRkp6Jvx+qdujvdE5SELnQha2+cEIyybzWdf1l5wsECJuxxzfLhwunLpDhO?=
 =?us-ascii?Q?koMGWxm72t8XlxC0PCdWntp/ZN6IFrOXFqS9xcW/q/ZSB9R74EK1ySBCmDCx?=
 =?us-ascii?Q?hccMot3TJtmcfz/YnwGHSdIDq4PfFgzsFf8BA+9xBxCbam662zsoqKm4NY9p?=
 =?us-ascii?Q?lZ9DjwgkPrPZ5udJ4OXwdqLwgt9smrLSrSMLf0F+CUoHWxYjPSV8KcyOygVt?=
 =?us-ascii?Q?6k5bzp551JNGWN/iVD/kb5EjMg8pvfSQTMjwj0Bsm+HARAq/9KBJ5YoaNSMn?=
 =?us-ascii?Q?FVosUZn0MwAypOZKRuFXpNQBydqFVBsA/787Fxme3zuli9lgGHrI1Tr96ap+?=
 =?us-ascii?Q?OZpCh/JJgLZTquaVCuPYcN8P8n79AY06PrYCAwbSBI+LEXRpR26cpC4GVE1t?=
 =?us-ascii?Q?2pleaiOnZAtdnFdj+7aF8X59cHW+BDjcmEaFAY9mmZkruMitsuBdY4SkBRfz?=
 =?us-ascii?Q?v5fTXVSXJRiyplAHtTJAPDBA5dBh4yhWk3IbWXTfSKVGy23Rfw/bRlY4PmiX?=
 =?us-ascii?Q?eqyLLmdd1FupWw7rK0SzYhj7HSm9WuZd2iB/K1UJVY6dUuWsbeQm+4/2RhKX?=
 =?us-ascii?Q?XMGlhWLS5ltBgpcqg1vFPFfi7aPes2at3k27S3FL+Ta1xRWb7zC+OEHhN04U?=
 =?us-ascii?Q?xWdfu5mTR1wYpkmeGJXg6y0o+OPvx35J6a2JvqFeAGJ7lge3t3DB9e++9Ygd?=
 =?us-ascii?Q?OYuw2LvPbj/EePYDSklPqAFK6Wj/rtveotP59oMHZH3PwQqTG6Ymk6ZP6pf9?=
 =?us-ascii?Q?PakoquhGfIK1sA8Ey0r2wLttzGNyWn6tksvDNu9VvP1UAmliS1Xlhfgcxccy?=
 =?us-ascii?Q?AcV1xmO08QqtmTX1ql7dzSbDVYN5OyXCT6rf+w7BaC8NKA7fFpaMb2X34A97?=
 =?us-ascii?Q?XJTyDL2sZMSAQAlwUtsOrT2OPijHUxYmW3G0olE+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa2f7c-04d0-4a42-26cc-08dda770292f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:10:32.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ixthnq0q/HZBI1/Qwl6Me0/7WaJLvdlHstcVXeSwk8vR1A9f/Wzdi7rvWZsw2sNx27QzQwachvHZLLkuTrMFpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7545
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 04:28:13PM -0500, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> index 234089b5954d..b43df10c5ef4 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Freescale Layerscape Reset Registers Module
> --
> 2.47.2
>

