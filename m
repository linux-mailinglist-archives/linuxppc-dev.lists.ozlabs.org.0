Return-Path: <linuxppc-dev+bounces-16532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHvVL+lngWl5GAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C087D403C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4pTX0CfQz3c40;
	Tue, 03 Feb 2026 14:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770088399;
	cv=pass; b=Tv7qPPgpfSZLg5zFMalq6PjauQZHOmQBNhTVKrBoxsHb1CGmk8WFb4y1mz/FQovttrlT6swBq0Lb75vMTTt/YWGNS0kIUGQNcn+vL/ryL2sO5CwhB+fVvPGZN3oob2vMyY398skqPtWD9EJnre69rM/4um1XXkZDUaKaOkcdSRsWmhHSju1VKcO1xR/IAQ/bNb0KMSgz4OgtW9tm9mQ3qJCpJFuiaoLl/s+0dZ/JOj9yBJYCyI9qDa2HbmH1Z6tMic2CEOLItR0+KQmf5UMd8jtAvKSJc17rsaI12MsMDCTrHAYiUBdOeS7c3TrFnfuSa+Bxk67eyEERvQGrlcK/hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770088399; c=relaxed/relaxed;
	bh=XrqQoNUJApiBabW14UbXfivulvXqJszRM+K34cpEnkQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NeTJcw/ep69Sf1VC2OPPo0akEGC+GFRUkOyERVAdEnckaolhcDbDrsF5NrcalQzuEbWG2kq7eMj7RTe00xsF7rTOjcsOU0p3Mzi6pgN5GhjASno6+SXXcZ8QEJJ4JVtNjgzZVA6fQWkGHAJP+72bk63owfykxfKjXVOkNeyf5hRW6ksGi3MEJ5TxASi+Uy9ZJYLjyTlcrs3h26GroTQ8yeTp5YcKZzPwRVMaiUW+zP+/XBDxuV9v/bqn1O78/Y6oIH4b9LLW2Qr2Ip7jN25d3DN5Dj6dG7L8obiOKbPbWIxPwpvjE3Pa2sBIn3v0wRmO/KlXLVeOZ9Z51vsi76UTfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MK85dOd6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MK85dOd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4pTW0pb7z3bsC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 14:13:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv/mXsObIQus7bjNKOCiGpl2Ormc7CaUEgl/8Z1tbC9UYAo+Tlq13HH+PlKwzOQXc4Exv5ApvPWMMvlITjkQVP7+Tn8iOtAxgAoZpb3oCo+DS+aaOGU6qQog+WHKj/jfKGpFT1S94+PZLkSz3d7A7KMo7Kh9NXJh3t7hntURN7WSkA+G+oxjD/cwMWO7ymQT59BnoAImegHeo5SHzvYcsxhyUM3+inuA9yt1R9R1nQyAWZIWtfQ+mzEWlkuFRI0Z7if20dPMLsMk9LJuZRPv3exlhEEy56u0yFpfMdAJxmyfIYlQwRHn2Z1wsXVn8P7DDFwaWH27LduR7MD1gD1y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrqQoNUJApiBabW14UbXfivulvXqJszRM+K34cpEnkQ=;
 b=Xf7vbgk2meb5iAME5dJnBSqQFUwmnkIQZSg7bS51Cnnvq0MAPQXq5xZbCksxjEDJDIDzY6pA+bpErKI5v87rhQAe6oSm/2TpQ/+vrlT5kMOmJwDa4d9zvosQFHK4xHZqVM4bu35TEN6ExOEPero5mylPLGZBkSfHJ9mDAutyh9auXnHxVDjxP7kPE5IssDWk5QjF9KJsyowfmDuR4RIrdRol6/gk6xQoUBTFAbRLEidy9S1HSA+ju7ggN85jwZcFQ4sGm8nw6MXkAj5L7jqBN8Bpjq5Kz7Dmf/Y0nab37ydNN6si1a/sg1KV1kqUDRW8XF7e3eun8xc9HhUBJ/nESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrqQoNUJApiBabW14UbXfivulvXqJszRM+K34cpEnkQ=;
 b=MK85dOd691BXnoJlBJdZrTuIIFZDghIKXXXnIZI0Kcu6WmZ0Hqcw5Tan8BEogJxOQKDQRcVKxF7k/npT059jk69wT+tit+BsyabFdtoe1oQRqnNc+IBhfGxzCeV4LmPOnyFtNdXIa1aRyEzJRzC/j0GojjHpevKxkmr9kghPla7B1Ac4Wut6mGbtCWT8QoaNULZ1mrQ9uPOlepxNlV8X2oH6vfwNdnrE6BnQ/+Rbv8WXC9ZsOBCmD8q8SPcCrr9yeVtuiGluCwIkk4WIDzg82NT2qARuarBCDDhEt3pI28JpClGmIlbvH3AjzMkLYOXdNIhU/0pVkfLwcCdADTPl3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:13:01 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 03:13:01 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
Date: Tue,  3 Feb 2026 11:13:44 +0800
Message-Id: <20260203031345.3850533-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GV2PR04MB12271:EE_
X-MS-Office365-Filtering-Correlation-Id: b59aa19f-3518-43ec-e28b-08de62d22372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90EQqcwGyLrL9J9RWv/IeRAwsSUhKOcSFKSEquQhuWaIFDmF6qX/XiffqAG6?=
 =?us-ascii?Q?noo6u50UaqAmLNrgqKR3P65ydSnZ0IzAynphN2+8a1/S/t4b57s1cNMA7ANq?=
 =?us-ascii?Q?LmDR5lO1MwxEJBaYmSzvHothlYbXoUQb35D1H8XCh3C3QprXX7LzPLLWSO/Q?=
 =?us-ascii?Q?AWH0h9pt4yqjNCN0DmZ9x2jlSy7MadKUWwxtxrVb0YIPf/jZq68qFYhdGtON?=
 =?us-ascii?Q?dhud8BKKF9f0mEobBOr0Phd2Tv8a6XWGwsKaoFiXHHKk7NyBl0IoiSIj8VRZ?=
 =?us-ascii?Q?0zr/pU3njYZNBpRobs67nxlJLG6V49j5VvSGxbeRsyiZ5o4+S6p+jxp1v+Ip?=
 =?us-ascii?Q?ZM2fH8D524J6SKTWVKJaK9WdaRcpMZymZZuCHYZMsxd62gaK+Sreine26FPI?=
 =?us-ascii?Q?z6mi/j4lHoYXcxjBqqYgCOfH7/OSUBOt+rxR6No2iffQ20w/OT5xOguTqPUU?=
 =?us-ascii?Q?AS89l005RpYyv5nFIWALwiEeOO72lpUdVr017QdlpjADFY+capuvRiAbJOxA?=
 =?us-ascii?Q?WePi5Pwld1r89/XN5DCiadrclWHyM3+M1UtohnbTLzGxLCUJtoKYvW6pgysH?=
 =?us-ascii?Q?PLvMfhCVS/7PE1RZ1ITGV0Hh1O7RmiJPnaNGtylswxJUF1BrlLfAcVytj2Nz?=
 =?us-ascii?Q?Pl1SobVB7vucewMq4D4/PMHWEqLHR+WNXKMiyFNfqFt/71bMNZ3mcrCOFAFG?=
 =?us-ascii?Q?gwS5ZrhrL10QHH2KVbvuGubHllznAzfHXJaefMc0pxaTtj8VNrRpflrn+zXH?=
 =?us-ascii?Q?jgz1gctmC9UV8MRmcE+8fkNUUZJeW4lvHq+D5I2Gug3tUwgJ/a+oEwcavFhY?=
 =?us-ascii?Q?Th8Gb5vdl3hAYcJaX3jMivKHu6H5RDiYVG3A3jAn3hToSp8oDdj1uF73swLP?=
 =?us-ascii?Q?s28580BULPJ5UPUwoIdziqvSN4X+oHl9sGk0mn803pFsbxZzJzJIBW+3h9Vz?=
 =?us-ascii?Q?+jizsIKj4FHeEK8G6YzW9AznceVCinCViYA3yW6p4L9zwPupN3lqcvQKKKMb?=
 =?us-ascii?Q?rDauwX4F06ustsAJZWU1cDk8/1/KU4BBLw3beJERQUAIGKAEAPiCnXXL6TEb?=
 =?us-ascii?Q?GW11PYVkrrc1DdKp9OxfElbP/cajnZo0LFRKlhhscBogMTwPm6i6FqVg94L6?=
 =?us-ascii?Q?z08uPyjhk5g+Xp480/czGOkCtSHmEZUIFR2YwEcHwGisr7hElr9/amUt80gB?=
 =?us-ascii?Q?860+buTyYMIk4itABvycyt8P/3JkjVC2BruuiQe1XPoYTq61jHobnP65b0zR?=
 =?us-ascii?Q?XICuPW++ihRoj37lpS4z479y4EfqfKsj1khKAJ95sKUb97VdoFH2irgndN6a?=
 =?us-ascii?Q?8OqEwW4f4Vz9b1e7/e6b434ztcHF+WUh/TW7rZ1xAW/+SGTKHiZGcg7npJd9?=
 =?us-ascii?Q?ii984xBXTyUvYluVpWjkJOwNYrXtYqQbnQhO39t2X35hPIY8DvaXU+1qbw7t?=
 =?us-ascii?Q?mY0kzAC52IKY7rVnltad87oTd2FjRa760P/qJeTnvnq7bepL9BbdVzr7jKzG?=
 =?us-ascii?Q?Vit8B1+Ki8dAA3pzivtKyzXyelJtHiF8G0fe/gQoz00pUiJhwb25PNhyqbBz?=
 =?us-ascii?Q?pNmqZdrg5gLQK1ZvzAtH2FzzHa1g1kT4BsWsB4euU0zBFrUNSzty/uQ2I8wc?=
 =?us-ascii?Q?jzsXf8SL4kaaQHk/mX/AjSIIfPYUwhTvyFBrk5nyx2mn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxfLIihM34r3I26nRHOLlr4EdTJGnaEy1CeW3Br3haJBkDoCNyrlJ66vkmDp?=
 =?us-ascii?Q?k0LNOZK/Y3r/SDL9XKOLo4MljxRaAe0js9Kc19cMAquR9yPm3QxTbKyOstgv?=
 =?us-ascii?Q?5uIU5Q19SNOX7sKS+ApdCc2adqShtXWEzYcLkbtz03oVznU8/zhIEnY7W4wG?=
 =?us-ascii?Q?GmCiW8BJ8tDx9xZ2OpcZL+hOgohDUv1r0YUvXZUthujy9BzGLJiRlhlDa4gz?=
 =?us-ascii?Q?DZfssx/3l92HybTeVyn0L70pWcqGWe2GqXdA/plOS5rUdwNlYL3aN5ywUUF6?=
 =?us-ascii?Q?pY2vhLg30Xk8BRFEuAvi41BZFXerDUXo3INuC8Ds1gX2ofPPlkAFzceGUIhJ?=
 =?us-ascii?Q?zMo6u5hXrI3bkePxLIBdkFaovRscCqWU8Gh3LpSHmUYmYnogh2ESsWGHZe14?=
 =?us-ascii?Q?LfBJwp2FY+lEmKbPtkA0M37S2XN4sWBUnqAlGRUggz+mXFkiwZGI9zbc86jD?=
 =?us-ascii?Q?Upk15yvlUxafKW3Y0ZTUeKZQe/K6poLfxAB12sQn7/3GC4+4+35WfsZPbSGK?=
 =?us-ascii?Q?kh3vUjOSXPG/cbyim/MzhcVNTS0atFE1E7QmGhrMcyP0A+LpFJKYFZj76TNs?=
 =?us-ascii?Q?vyvPbFxLiI+AOU56NvmpHrPqoyNfOFpzfughaEyjtdeBRGDTcqIb63KCJMWq?=
 =?us-ascii?Q?fPmy43VCZNQC7VDEQZoJL+olsjebL8Zl2ddHOxMPeNVZHsm5RSTk3iDszyKF?=
 =?us-ascii?Q?zfHsljutNiG+74bu0ZbTPJ7jUZ6wRx62X8+VO09uQsIlBIz4iCZknDbrR7dK?=
 =?us-ascii?Q?cPCSwu0ZHh072+JDmB7OEVNZhdSh5be7SZaACfX3jxBGknVRbLVh2ipYnznI?=
 =?us-ascii?Q?u6IrL8oijS0oJYpUc8x3esCQ9id0l2TNvkjCwjWpQJelYjxMwslnI181qRpv?=
 =?us-ascii?Q?XCUsC09gFS7h7ZlzMYtalHavvTkGKSEEj1mAu022pW/NGGWKZuDCXY6SES59?=
 =?us-ascii?Q?yEu0+fFyaPDVfIPZ+d1kc2OIpa3YrsK855khMP+5M1vpIZ2gtrDbhhZuIk2v?=
 =?us-ascii?Q?iOCUTIKjMU9VRBnQiURLHyb085yuZUxQfqx974cJgLn9LyQDKceD+2JfxnDH?=
 =?us-ascii?Q?TpubsAal9uKL7zRr3J7ffIEr5jNIvkex4KOTlMpwDMMqFCUA/sttMnPDl8Gg?=
 =?us-ascii?Q?/YC53yc1afNTqGmJntI59KOJ9PlLpZeiseiDBmkWS+kyjXPldDYyWE1DUpBb?=
 =?us-ascii?Q?aRQuJ54ddaCDmujcrZC6Uhn3h3j10elDJe9leLCQjUdlVvPTbTBE1LkoOakZ?=
 =?us-ascii?Q?hVWxPSNAhcOskTjLtUtDXsMAxR77fGCllL8SpTLl+a5x5SUp79yJ8WExltRZ?=
 =?us-ascii?Q?39qP0s8QddifeoZ8MwVR/ys/crw0waZjRgsFhMf/OTWVWOiNPk1im70Sfjvr?=
 =?us-ascii?Q?0d6TmU2jS3uNittKAHUt0qLoXZyV2Ntcx9pTv52X+Gb8WkQGN1apO8m3JwEE?=
 =?us-ascii?Q?T3lGRsT1mK86dvTRnTDnZh24k0LSyo37zZusOAKUqPPsB3o7V90SltfMP104?=
 =?us-ascii?Q?EtwMbZEDlu/OyQ4wGbIRrVYWJCI3N2qXqY4d66mUuLL4XLtVuAKWR9HaHZ+7?=
 =?us-ascii?Q?L3puf+Bb80nixfyBhjNkMAHZV3JFQJ4JiOjr8oXRvDWimib/cj8aG/RiJ83C?=
 =?us-ascii?Q?9K29iPtY9tgui0DEfMGZpH0HcTgqpvnAhqVoCZxQ1EcJOkheGkyBix11CASC?=
 =?us-ascii?Q?saIavapKMh08ej3Dd0uIeQy2xBU2jKOiIlAzRBLJXulSTVrqPqAj7NkdR61Z?=
 =?us-ascii?Q?ET1eIrU6sw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59aa19f-3518-43ec-e28b-08de62d22372
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:13:01.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq9mn1Dofj4LJB5dXTpuwSQqjt6nnwTlSH2j2ro6fhLghy/FUddLmFqBYlDxW75h5HBe60c4Of70WRt4PzSazw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12271
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16532-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 2C087D403C
X-Rspamd-Action: no action

Add a compatible string, clock mapping table and enable the option
'start_before_dma' to support ASRC on the i.MX952 platform.

The clock mapping table is to map the clock sources on i.MX952 to the
clock ids in the driver, the clock ids are for all the clock sources on
all supported platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 16 ++++++++++++++++
 sound/soc/fsl/fsl_asrc.h | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b6d4f1e09e2e..7f25c4d066a0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -106,6 +106,12 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
+static unsigned char clk_map_imx952[ASRC_CLK_MAP_LEN] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x4, 0x5, 0x6, 0x8, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x9, 0xa, 0xb, 0xc, 0xd, 0xf, 0xf, 0xf, 0xf,
+};
+
 /*
  * According to RM, the divider range is 1 ~ 8,
  * prescaler is power of 2 from 1 ~ 128.
@@ -1338,6 +1344,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
 			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
+	} else if (of_device_is_compatible(np, "fsl,imx952-asrc")) {
+		asrc_priv->clk_map[IN] = clk_map_imx952;
+		asrc_priv->clk_map[OUT] = clk_map_imx952;
 	}
 
 	asrc->channel_avail = 10;
@@ -1576,11 +1585,18 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
 	.channel_bits = 4,
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+	.start_before_dma = true,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
 	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
 	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
 	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
+	{ .compatible = "fsl,imx952-asrc", .data = &fsl_asrc_imx952_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 60b6865ca952..7a81366a0ee4 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -326,6 +326,13 @@ enum asrc_inclk {
 	INCLK_SAI6_TX_BCLK     = 0x22,
 	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	INCLK_SAI2_TX_BCLK	= 0x26,
+	INCLK_SAI3_TX_BCLK	= 0x27,
+	INCLK_SAI4_RX_BCLK	= 0x28,
+	INCLK_SAI4_TX_BCLK	= 0x29,
+	INCLK_SAI5_RX_BCLK	= 0x2a,
+	INCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 enum asrc_outclk {
@@ -366,6 +373,13 @@ enum asrc_outclk {
 	OUTCLK_SAI6_TX_BCLK     = 0x22,
 	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	OUTCLK_SAI2_TX_BCLK	= 0x26,
+	OUTCLK_SAI3_TX_BCLK	= 0x27,
+	OUTCLK_SAI4_RX_BCLK	= 0x28,
+	OUTCLK_SAI4_TX_BCLK	= 0x29,
+	OUTCLK_SAI5_RX_BCLK	= 0x2a,
+	OUTCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 #define ASRC_CLK_MAX_NUM	16
-- 
2.34.1


