Return-Path: <linuxppc-dev+bounces-6489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15655A45B2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 11:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2qrB2nByz2yvl;
	Wed, 26 Feb 2025 21:06:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740564394;
	cv=pass; b=bZjn1lS1Eit3tSBDLmiQAaBArfWD4z1Dr8ZnvaM/xQvtcDKeDs/MgfEbiBmO7asrWlh4E5gYkLOuizc9ltQumQyQF0wb9wxIA0VgZhXH70sT+BlQusIlOkOYahVrbzSwhSWHtsNyg2sUr1U2qNpVqUkp0ZncIr54oYsvHM9qRM83ZKEvMu2LDsBiEkRc6/Ns246eSFaRh8SAYTT/3uqw5OcmOa61Vi6FkX3hqNJFJZJy7vFv8VLeHhQPulcAz38i762olNKDue0Bs8X8yPk3Opq8hD4si5bX58OQmNJgE7nuXYqHM842REYexkmtqp5oKWEkJlWlhipZ766kBo7DBA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740564394; c=relaxed/relaxed;
	bh=1RrPVB/RVJLhXmJFmtZVtws0I2Qc92FQGa6bSApY0tA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cUh9vaUi6Zx57Su6OP5WXS1hzxqmfbiOKVY6ZSfAYzj0kHWexCy5Cx4dswee/9XW9h7iWSg8rZy/knHPagD5yQOQb+RPTAIGe4969TFX2+SwAN/M13Ygda7yUcmzCegnZqAf2jGs3TtOuuQs41DvAmimDhU9AO87278I84QZzWiUvHraLCdevnwZowEu02N+bUiOt7204XjLJHpmbhymKLtPUvMSNQcjw9yRF2Gq7oRQkld7ThircZPNWtBcCuTCYb6ofyDyBO4eTGX10tYGhOsmKf41vfJIvo1I+JOpOfdB7lanBImUfdxsiL6B9dlCqHRz2OaSV0q+1Ee1vEGBEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KDdqC3Qm; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KDdqC3Qm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2qr90YDVz2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:06:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkRK4aJ5vUDMdH70KoqeSy4HB+XNYEGmzGEq1FhxSD5FDkImi8wDhzjAa7C0goD0djxXObsNe5zY2qIHbi6yZYJ+DLoVic5GeAquWzisbqRg1KdIvDXwJt6H46T7T6nQil/xiCsInsGHxpSyaZUG5qTPsBm7lUd0t0s5euH14DbGUj5XoCo0hgEYvMLy88WZq2YteD2fPdmoLCiZ3PfstrwFvHk8RZ7Pb7/Hw/dBK0nKvEeMiI6Ro1pkcSQP7DUNNuBngwPq/31QxMCC6LWWiYGMA5u+bzW6Iq//dG5TXtLCcdgf7H4iggbExpxiIJEc8X9erjRZZiLas54IctAQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RrPVB/RVJLhXmJFmtZVtws0I2Qc92FQGa6bSApY0tA=;
 b=fGA/Pv4mQNafoO4/rWPLCVTDpQq6HIxUKLxhj2vHHojhv2SriL3SZ95ZoznYIsXt5tgsAefreOHKyEDtinD/Sc+SxKeV1hVxHn+e9ceohvq2kpu3lpGHGAmfWwPhqMfC1kxww9/DUCWuTU/nAwJUe8orJCHigpe7arqmyDm2uB8Ge73MxkS2qpa5XXaig7pv458OXUl4wYPVDR/1Pmzsv7QU3ttxHHF0GJWhOFbpsBN2xMnvAl3uUgiaRDrpcXC+BlgRwSj4ZpFbvc4H0G5v+cPuGFxVOnN8cCSOWDGPlLJxFd0f3PImDvl/T1QSmRWOxPlQQFDAs/IPz9XkPEXgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RrPVB/RVJLhXmJFmtZVtws0I2Qc92FQGa6bSApY0tA=;
 b=KDdqC3QmceCEOAOe/ZwMJWS/pur6W5Rp0Latt4q79Ysu/6wwFQ3HQxsKbQbZftJS/ThnLqYyX6mQ7DnUnNNWtyY4kqtvB7Ho2QjnY0oWoHJaLusJRX4TeMMkaP+7exuK7JCabElA4OS9B1Lu+tESpRxD187KKVnyfehCzLeXX4GmuRzrvXHMn2nYNpAMMv+f2bdgbl5FTGmU9Qrmjvz9Zf6ZJknrqfdU4Emq9fJ/uzm63zUCNdy4n/e9U+nf8J60tIijgVXNanBDp7tr/0dmB5PDMnQBI4dOjBvWaPZFICjml8KTkoIeAHG/z/BcbX/UZyunsF1Q5VUCN6AG4jq7+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 10:06:12 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 10:06:12 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] ASoC: fsl_audmix: support audio graph card for audmix
Date: Wed, 26 Feb 2025 18:05:04 +0800
Message-Id: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: c736de5b-f4aa-493b-d4c5-08dd564d32b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpTT+GVaWNWnYB7gf+F2T9otzVDEqcbaS5kW1U5jItbjn4OGU4U4GNS4Lcgo?=
 =?us-ascii?Q?LEjtzD+SO8BRuhsi+F+QFcmCjSzQ+WBecXdOUsazpGHo4cqdUVMcGZ67HqeF?=
 =?us-ascii?Q?OHWvCSyvNJzCNiX6Ud4ASUGMDBiFKnB5W8+ku8rqp3oV8n6etmWGY7gLBNsA?=
 =?us-ascii?Q?YCHQn4zbEU0cv7QvrdziMd6dT9b6fN1++UYhJwuCnFWSWO99SfLOXQLIjVgd?=
 =?us-ascii?Q?Xlxl03l6eOb1Tas0PBuxCOfU5+NqC781HzaAbmWNqfDjP0Ogcc94R5e7YHf2?=
 =?us-ascii?Q?pZrJ6kDV+D18xzuT5VTCCrQ/7O9o1NItq80PJubtqD73wcWqx/Ifn8ILCGh9?=
 =?us-ascii?Q?8jxJtHlO+Sr9duoulSkPWaKKchvRf45jLhFExpLOAFiJNq8YtBgAAHEP2eFz?=
 =?us-ascii?Q?n78ynduo4TjBHDi6/6hmB4dPDji2L/Oea5Jad1CpJlR6HsYO9MLEJeay0jXC?=
 =?us-ascii?Q?4w8Y7w/R7HGXhQPbbYEe07UIFz+YaEbsfp4OdPDPyqvufTciv9SWLmUj9iSv?=
 =?us-ascii?Q?o5p0+ZLpL99JoJUJ9bmtp8cUy8L3rjjEh5TRHPK0GdBmLKpdwENVm9VG7dUx?=
 =?us-ascii?Q?hXtipPlG10Hb9Sn6eht+BSAB3rxBnURLSuN79fz40jxA8U2Pe+ww+nSTsQFu?=
 =?us-ascii?Q?+hyavqKft+gaOTz1gOj1chenuoRkA3Lzh3Xlebll3UnNWxu5Y/AzYEWp577+?=
 =?us-ascii?Q?S0P2vVW0jnF79+OSg/nBHQm2JhbjY3A+Z5Qvs+TK70OiXqiVAW3kuX+Jr2EX?=
 =?us-ascii?Q?Smr1Go2JHGwoxk6jjkNWCxx3HZ0CLTPLpLBNSZw0sWP2cuKi0Ob/M3UiPBQM?=
 =?us-ascii?Q?ccjDjSZzwSRlp8+XT4QsjiaP6zY1M+vPJ68d75tzrMgJMvEnPQPCmZfzFN09?=
 =?us-ascii?Q?37x/+SCxqvRbWB70DQ1a/C7J2PcN/PFMgZISzZubXIOjqj3h5nmYu8IrBavo?=
 =?us-ascii?Q?PufN+S5cgKzbIYcr0yJh0PELxQwbmo16bvFC6pS68Kw2/5WF4B2EZXA+zpp7?=
 =?us-ascii?Q?7c7U3yNJlW5q3gk08LcpHYQdH83gePugQoWA+QUdOTyZYEwsrdms5qJ9W5Qf?=
 =?us-ascii?Q?6jQGanVij7dtZAwVEdJuH0ACfGxznF1maUn+1/iUdf4hdnrsd0NKDgjDsA+0?=
 =?us-ascii?Q?FJn2g74ZNbDsBt87kgT5zp9VVJvS2mBPuIub36KDKRuAXvDUvn6+1OP9rSTj?=
 =?us-ascii?Q?46HGRhA05fUA2oA3oJbvqgB/dFTk0oSZQDr8QfynzI/txjV1MSp2JuyItuC/?=
 =?us-ascii?Q?0qyjjKfuvxL9eAsSST9qlvNZJiKZ5RMrruOGeHKPBxREDDz3UvDn22KeikZB?=
 =?us-ascii?Q?DCFd1BGiH7koGBsHsNQwcW3gYwPOQm/G8iJpIftOm/dkmRhCOyFnCu/gnS6v?=
 =?us-ascii?Q?od5cQhyqDpbHdBmFhDRj9xftqx/pHRBW/oLZ33W9HV3zroHDrdLd9jkGdoP5?=
 =?us-ascii?Q?KBudyHV0LxZ/21JEiFvUOFylOGSO0T7WHnUfJ7ckBW9sIj70Op48vA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+roJ0WPeGdePcIOMUAsvIeXG0Yfd37iB1ZKfjl1lqwHNZ4VLrqzDFx1n0oG7?=
 =?us-ascii?Q?lJ0b/VkYgJI68FCJnPQjhrY6MnEkGSQkzsdcivnUJKi8I91LBpc1xyEhFnVA?=
 =?us-ascii?Q?a/rwbV9Yz5oaACBq68oBdfM0BRs7Lv71Xv+o7ONvOT56cjgHUiXpopXgc1p2?=
 =?us-ascii?Q?CObOmvMrRq/y25XJBBK2gBsEtNtXLOZubaix6s/qgq6b9lv755G32pURSueN?=
 =?us-ascii?Q?6qbGMLHd0RaXt2AgULJKOVstpuFZDydLmpP8QoihYN+3jiozFfN66R9DQbF1?=
 =?us-ascii?Q?4LjttHfet2Mi/MEiE8McQdrlzkMG8nn/Y6hFr3YRxEpVFTCEAWs4MnAPgkmH?=
 =?us-ascii?Q?VAmoXHMDX8pOBJ4m6607cpWnT91zxDdpG7Gx/agXJdtQXka3JpPW48EvPqCr?=
 =?us-ascii?Q?u7DUghjEoMttYl2/LRcURZ4dKHgbB/jCPIewqAFWSqUckwca2gXEe/5ONs9e?=
 =?us-ascii?Q?oBmLchrWGqHXS0CgXlP2lsqD+1sAb9J30nf1I9kqS3niWf0fEc0ZUgoGKBtW?=
 =?us-ascii?Q?kY+hQYkPp2mDFmZxKLw6vCg4i+LgXiJg7uiEZNtdtjhWJx8zm6CWB7utDvz2?=
 =?us-ascii?Q?0xU6WlLEu4eelGlAtq1B4B54Ite7ZDwa/FTBvTqdqSjs9OF94QR7xMpqR9Ez?=
 =?us-ascii?Q?RcidX+VZMPTx3BMHP2YDPOxIMuFqktD6NdwdyHpwB3yKPUjkuFXo4TSG4+bX?=
 =?us-ascii?Q?ynrND2mpRb2ItvcN6ybtJgF3KPzaGDTRJlWPrLTioZZB+UXUH1a3A6U1PjXP?=
 =?us-ascii?Q?sAN1MTObzZ7B2//5p9XdFSmbmeAXs644BoK4L9E+1B42q0yqwatFU0gamfQS?=
 =?us-ascii?Q?pViMnK+oQqW1Sl10W16NfYfL0MosycZeoYzQ+A8xjEmysQVJj+x6eslJbnti?=
 =?us-ascii?Q?uxJZwhyRaMVBpqvmYZzS7e7KoGtj5C+1WOVKcroIIIpn6CPBq7x378W/qexO?=
 =?us-ascii?Q?kV2JbeSHlhZqrz1i8RooVZts14Y+RoNirg4PthphcEacW1+EiRvFHyLvBaRG?=
 =?us-ascii?Q?rPHRt8XzqFCaV76I89WUvahZny+6+/qcnLV+MvwCgwVysiA42eWkjDzNdqSl?=
 =?us-ascii?Q?Fp02rxZ5Rc/qKkCviw6Ar+u0xcBTBVnYLDSGzg6Oso6od4kyHjj+wK5iz5Jx?=
 =?us-ascii?Q?BcEoIMdwIiXXEGnk/CFyoxYtSyKjoxP9WT/1fuHgtOXmED3GN32DISEhYcKt?=
 =?us-ascii?Q?T81nYC2ZZucj8r3xIsS/GdSthpIqvLrRRZVADrGVEoJJsAZq3mgyR7c55nxD?=
 =?us-ascii?Q?Tswe3bwsc4bdbu7CzMC8gzBPHstuTUCtSv32zMOSRXx42DFG8TgwFLxiHu+i?=
 =?us-ascii?Q?D18+ZWyYxQGdTvtwUyUpcSn5zxbvXxjWjIyr87NCU71SXl/4vRDDNdIDzl7B?=
 =?us-ascii?Q?lDNKIG1oI4gtufmLL3zR8B+v6tgO90mKnJAzX8it2KYxHc7jQ4drqOVgOWBr?=
 =?us-ascii?Q?DWLy5R1LbRN5sI3qUKNKblYp96//992QZchFtf0vKOTYgFecVyutmU1mObFY?=
 =?us-ascii?Q?tC+BLK+pDTxAaUs/m39wIOnk8iWxJsx9Hq/OCY6Yz+TnN2ouc+vbaQ9SxIS8?=
 =?us-ascii?Q?792KEqAx63r4eXcXtdkdb72/6jR3EIN4/zLQ32dC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c736de5b-f4aa-493b-d4c5-08dd564d32b8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:06:12.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJGjUkteh8P0rP6ePOEC4SOyxyVqcJ3Tb5iWcH44Eip8TM6FwH7/2HtmJZ58td9Ap3Jy9QMASKvuU1yXxJg+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Change 'dais' property to be optional, that fsl_audmix device can be
linked with SAI device by audio graph card.

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,sai: Document audio graph port
  ASoC: dt-bindings: fsl,audmix: Document audio graph port
  ASoC: dt-bindings: fsl,audmix: make 'dais' property to be optional
  ASoC: fsl_audmix: register card device depends on 'dais' property

 .../devicetree/bindings/sound/fsl,audmix.yaml | 61 ++++++++++++++++++-
 .../devicetree/bindings/sound/fsl,sai.yaml    | 51 ++++++++++++++++
 sound/soc/fsl/fsl_audmix.c                    | 16 +++--
 3 files changed, 122 insertions(+), 6 deletions(-)

-- 
2.34.1


