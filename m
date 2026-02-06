Return-Path: <linuxppc-dev+bounces-16691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ4JKGsahmlNJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:44:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1B1007B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f70Kz6DXvz309y;
	Sat, 07 Feb 2026 03:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770396263;
	cv=pass; b=D64Wot2HOVRx3qW2EdV33r4pXqWf1dRMXAIVcp/UcI+Ox7juxSM+gXDTER3p5NXSMoRdWe5w+A+Ds+Zo94XcVsW5Ez1NSpBocJnQ8PDuz8ojy+Di6BIFzF5Awaw698LvXWxKbn59dWjsCoHv1HO9MI+2QlXZEsag78KSJahB1mM91I7TSs+6D0jYG+/wktMjw5kEhVIyPUnogj1Cpleaw1bQkA2o09/tYdUXX4nW6Ze8UTGUQPMiEl2sNiiix9Ebkt8oAOCuGdiAycALSjxbYVvyypkw5Im8M4KJVExa497wumnZl8OJdS0MsTVjtwucFJDiex/TKdtXJm2KM1qQpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770396263; c=relaxed/relaxed;
	bh=nFLaBjjK09rniIiVhCXK3VZjRMWijSK6xBMP31roE4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QBF/J3a4+XwyBluTjBR5VDjXq5G3oG8w2vETwlFVdKJ640mCnAE42ygV4pdx0+YMTQBy69uRyoTHEuuKfC6+RD+I2fbSA1ttvFW2eQMVKXDjkk7G94REGb8vfi+mrm0MEbVOgIdZuZTUFkAt/fJqHS8rhbiJkTLlZUlgggE/bUb464h28jOF89UUr5wQSQjOD8+JiIBLjGd7JmEO9G/z5fimM+ACjZErSU29sUY3oGteLlvdG0/Ngrk0fIvaAp+IwpZ9PmJ0dqIXFJqa89MktHZj55UooVoCuR7qmjZDQadOEZcDcEiZfksZP31mAXZ3IoKVDS2dsW5VRulxcDc0Lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jsDRl2uo; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jsDRl2uo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f70Kx5jTYz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 03:44:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTbExGVlYS78Q2yudSYWCfBhXIqbqINxxRtQgdh72EBAw6yNL8bVbl9we7A7heYnmpLwZ/akQSaG8iS2rfoL2sMacKA80rbfvV0p92F6ODqnxLe2hxu0M/ASn2KixQOG/8T9NnZmnm9AyRzRBMFwkcgcfRVbGklFprG7dTTo+22RaHLu5+L11VYwkMbIjNhIdUNVn2OsW6JwXiqsZ1jRCctXAXXcbpvZtj2MoxFBak0Pyho07BhvrM+7nKJdeT4+pFseWFIkNPqiUhVaWfwFJ/C/CAFaWc4oJX0RzlgK5Zymu7dRMF5qHKaiOdnpB39xwibTJfOOL8mk2aRQ9JDq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFLaBjjK09rniIiVhCXK3VZjRMWijSK6xBMP31roE4M=;
 b=pg9aCTDhFEmiQf6qQ+NvWKDGmYFGNcQQdSoAu/hLNYkSD9rnYH30tSyO8kAqIHS4i7JL6iaMXxDbJtcnNu0j09DpdmS4C+9op1pYlldnmcGp6W93Gs7M174y3kb5toz/Te5KYRRiPgNImhtR548mTIFHhdRHWWqHwO20hwmHgDZPHbnzKIBSJQsOSr51HDAD5XAVkkoEBgtIee2BJrGNe8stDo4VnJjc4HV2kzupTBgXdXjn1hHyeC0cF8PvuKihCOPeATim2vJ0zgFnNde17wIbwh+v0LBjxZpglDHN6eEsmCFNj7h4wH7qCYhM2jG/4m1AceVHNHWp/2xoasjxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFLaBjjK09rniIiVhCXK3VZjRMWijSK6xBMP31roE4M=;
 b=jsDRl2uoL35Go1NzcUPfUIA1h3syfiY6pnrb9Y6PTyPz6PV6x4xCkZkmBLntvZ7x4Gnc8k1/ox/slut43oTmZcxi0FISMZqPPRYkLzi7FHF4aqHW14x7RBrFrskx3Mn6ctDxGlvs5lMASyA7LL09mK8Pq/5/A4tUrlSpXkEyMKPenZXBJPuph02hBDHU49h6ucJOlvs6nk7ar0Xew/0ZZTjGwTjFHuseWeuwrs4qewroB7RnhaLKn5zBPVRhzqmVoHvXB5Kqv497DE5C7GF4QSHOErB+lm8S1AJLr1I3t3I8AOnLhPCzIVrJNztw9lwOY/5KG5z+p4FAvWLcY1lYnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:43:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:43:55 +0000
Date: Fri, 6 Feb 2026 11:43:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
Message-ID: <aYYaQtF46oDTR-Mi@lizhi-Precision-Tower-5810>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
 <20260206014805.3897764-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206014805.3897764-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: PH7P220CA0064.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: 62647d6c-c46c-42e5-9785-08de659eea84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k4/+y/DhfxsaUyqK1UBcAVF3to3gDxCu6GEZl3j5rRRDwwwQTf7cMii+5KaW?=
 =?us-ascii?Q?BvkEY1rF9dhMEKzc5UQ4Tz5Jjto/FX+NF8BB5jQn6eJXWnhp3YqgFa+cUeZp?=
 =?us-ascii?Q?bfK5LczKf4nsa7nOL+cjOhUGbwpQxQMcjQH6C4oRVN+e+eXl6HqeVambAXiJ?=
 =?us-ascii?Q?eUfu+Gn9RvaCVJIVMUbOPVjjA45scFhDUfU9B/fc+GjT5ZdgABEMRMebNCLd?=
 =?us-ascii?Q?yTkKRVw05z4dHCrgch9TF6EmYK6bakMzVnSOXhXiWRrweNSKlOsYfI1EbQx/?=
 =?us-ascii?Q?klKSB+oUGOtrHK2TyfVGGsF019XGnYlVUHqo4s+AjtBzGV3IT6l9mnzbp6Eu?=
 =?us-ascii?Q?nH96hUWbqiPV3NLv0j830PfYzdM0wLQwiTWqD2WUOR/BX0TUcIMU9WY9RpxW?=
 =?us-ascii?Q?epGa/zZrZKizxWc9S13QkX7UqDihdh/50uzuXFn7gYovpUCsWlhIglF2k49l?=
 =?us-ascii?Q?3QVEpwG49njMuorSshC/Kw5eRvg3Xu7x4aXPcwYIkse/vAvxNA+XTxmynDkh?=
 =?us-ascii?Q?F7x18pUb7pG18icOsJiX3tXvFYREO9x0V647ufischTCrLLN9TyMF1txVgWO?=
 =?us-ascii?Q?v5KXTpzqJUY5V8UeDYYNPBC8v9qnDu/IwVITtLW8eweeLlFKKDnv8cRCQBWV?=
 =?us-ascii?Q?WGpxzPzb45eu/qThZpq1mzeg0LcEus/klfMWDV1EPD42ezDzv7r3B6LODVMc?=
 =?us-ascii?Q?Kzwq0ypsLzcJIlzHLfqGBTABjvbPvPJaEPQJUYuRgVHcu5IQllMBxo1KVgNm?=
 =?us-ascii?Q?V559xQqp1f8CiQwz3FDwiARFIhbnweaIxzAXVKXfRgVGAuWr0dYbjSppjjUr?=
 =?us-ascii?Q?zpmwvc2qLPLqLPjg5s1B0tF0EtPlgDeBxPY3atrq59dkqQDOikuoLrjqe0IV?=
 =?us-ascii?Q?ei231/C52uquDz7q4yE/AFVUPYihP5eUANgHzujFi3Yh0zpzHgXBd9Ekgp02?=
 =?us-ascii?Q?chX9wbpeE2ro+hpqUJAFKd+4OCtoroW+dqqX/Lz7o7XYEdS9CDS4GoYGnobd?=
 =?us-ascii?Q?HVf2E2kO4LWhDxg8Uv1xkSXXCbJjF2EQ56F1iAdwRxHUCrjt3S65md+O6RNQ?=
 =?us-ascii?Q?x6i6mDSX5uVL7s3z8NpA2RqGPTqWMHttgrRv/qXd45pYnXh38aUZGS2dpbf5?=
 =?us-ascii?Q?01PtFXlEgxH35AYBHKOsWi+zrkVYygEn/q8RKHwXV+WAI8M/+RlSWi/rk17v?=
 =?us-ascii?Q?3v6t2VcFMbKqWd1cGGblB9Fu/l4hc2qPqzminnNjIbCbyYjX9ufejWjNLPsD?=
 =?us-ascii?Q?jNbTUQsHsJ4DkvGquH+hI1PU5gkOaE/3A5s1NZOL1q3LV2lULPC3BkhQwyGs?=
 =?us-ascii?Q?XkPeomMoc8ItqzIkX1XX3Hybek+tcAj6qwN2Iw/RFHG88nTgjSdY1cAwNJI7?=
 =?us-ascii?Q?Wa1iTJhv59J6SGAwUoiNDC7/5ZSek79JeZfENB4tZmMQs3polKn0FZkP4QGN?=
 =?us-ascii?Q?+M8S8SXAsnI3bJjg3C3lZsCZvtLJ2ewx9X7U1w4+yf3m7IyD72bM94GJ+bFW?=
 =?us-ascii?Q?w9GL0E0Mh7jjE3fnoxlAQzdj/TxsreHAfPhRLBckMT9Af4YlXiMrQgzCov3k?=
 =?us-ascii?Q?bDwyrKIf/j6kkB1brMZylgc3NjXRY0QnRFlDFHaQkzWUsroxVl1ObxEmnHj2?=
 =?us-ascii?Q?KbCV3xZZvnLETREmvYxgn5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CgmLadXGnmZK8lbzveZDpS2+GGqPjtw+5PccBgtX2r9NcpShWThyRy4HhlQ1?=
 =?us-ascii?Q?C0FT4MWBKQwGiYQ5fHZR+weGUWpA3JNJOEdstFroGBjAgynCt7J5iIxTkQO/?=
 =?us-ascii?Q?3ZDS+boS2SQl+9JXDcbnovu6irkD+TXy6b8tymk15KHQpI4NGbcRb+fFsp6S?=
 =?us-ascii?Q?9onA5bWpeamQz+hLbUTBS3nqieMBwdwRIUD+7BhKb8mq3A7hidT65bCifi3S?=
 =?us-ascii?Q?fKwxtOJf9bpdAWNjc0PSFSjRHLUmgGkjYI5AWHWNH3K8SZ30IWNrDx2xSqYa?=
 =?us-ascii?Q?zzQFZ+AbBxH5H5cu6IJeEpIZ0GN42WvudnBEzxqZNqpishHzpcGPFwPDH5iB?=
 =?us-ascii?Q?wvH7sqGSQa1ZGsuljZJcJT3B6TMkP6w34alHkC/EqblHAue2sSEYWHjp1fh9?=
 =?us-ascii?Q?wzDG6aml7KXoxhS9pX4SRNDsbpayfPkXwopgiB3pXcNyAIZ7isvGJSfFEU00?=
 =?us-ascii?Q?YRdRsHvDgkNsRFvxWggW6HBe9kLFV03wJIgmVq3/EP7zhaBLxQ/amkoP8xvR?=
 =?us-ascii?Q?OL59+8Zb5uhOZiuEeb/Fl+la6cFhZxq5tWxQGBX0+W8k8Rt3SxVV1bF0CRHK?=
 =?us-ascii?Q?dD6Ia0lct1CC4u02FZ/nRsHuxpRSpC6fmiAO8/PnE1q/kGPsKYRmcrcsQP1f?=
 =?us-ascii?Q?MfmrHhmQ1TJPz+oOzj00hiMiBt2J43Gex2znH+orsNxqLLezMPMc7NVJ7cJb?=
 =?us-ascii?Q?SqAzespW/LvtuYYjFStB5i9EEEzDI6SdrFv9GTnXqe9Qo/A+PFHtY1Blno/9?=
 =?us-ascii?Q?T0/yDrKhAB11uEDgBwxnkh+MpTXDp7kUV7bfTusKKJvTEe+BYMeTWp1Ny7bI?=
 =?us-ascii?Q?vyrREblAHYwQMVw5Wuw+zOOnhIeBUMH4gOSvP0nfZqXQCaSnKkWsRjuOQX+V?=
 =?us-ascii?Q?GbpoXPvByAN2/MHW19JWvE0erdOTxldnaqsxnMOH9FaJ49gLWF2RIj62H5sD?=
 =?us-ascii?Q?oATBiPl+YYokcQNoCWkIbJeP3CcrWv2ewPVgnFC0uaLpO8XojflNjNDPcUPg?=
 =?us-ascii?Q?Q69+UDtJ7XGLCCmbHr5X6L0vAFsYq/4U6A1GBHToAD0dlwI3lM5hAdxkciHN?=
 =?us-ascii?Q?2CUz7tdCgsgNYQI3FQKTzsm4lnE68CjfYZI6G3wNtHERMS1mUNxd+2tAXR6n?=
 =?us-ascii?Q?/YUpdS05LbIWBdzjNCEBrfswkrFd90BgGFA4g2oP/c7DS5cUszuBDmMkjM2q?=
 =?us-ascii?Q?2EW2RZPMgVrp6piS8h6deSzkvokmQHGyftEL5SycMFcjgGp4mrA9fLE23NJL?=
 =?us-ascii?Q?1bnE343+2Rlp7zXnog3G2hXzwU6AP8sI/3KFyIA3C7QbHofoxinRjq16Uzza?=
 =?us-ascii?Q?2UpaUVVMV236iPGwTcM9dnttmsnz+LaCv9zdPHGSUPb+KixT7r+yhaXSd8PM?=
 =?us-ascii?Q?hEh5e0TWcUN0hK8hPNHF8PdW+cOOT2b9h3DUgkXnDgAdHCb+PeVcYUvDdOzs?=
 =?us-ascii?Q?Dtz2bk4yYGIYh4DT5AhW78S2z6Ugi+RSx+eRrZVfOOSsBXxSRQbBSShl0Yig?=
 =?us-ascii?Q?nqRjWakIZaPD8UU00dtatuTEtYijjifntJGFqpN9sEvzHj8g/CMPHgjm8xq/?=
 =?us-ascii?Q?Sgvq7qxAQGgPBZcZOqSgpZgxOifidKkPg8dBAXZpca133YdhYIvb9gb4kymP?=
 =?us-ascii?Q?dE9M6jYkolGNfK7BBBWZ/jtkboJFBJUfAgcCuyNtW4VU7FDSzeNp6ge1unZr?=
 =?us-ascii?Q?7UL3KqzJZr6K59MgsLMuZXAszz9KQIbZzl0HlhLZcrY1EoBn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62647d6c-c46c-42e5-9785-08de659eea84
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:43:54.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vhyf4uNPP0Noe269heaO1U/WUUq/mV+NBBV9FHCKUDSnoeygM9cxHjo2zo/kC5Xz6xr09zQ5krNR+4OWEH16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-16691-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A1F1B1007B2
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:48:03AM +0800, Shengjiu Wang wrote:
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> The solution is to trigger asrc before dma on i.MX952, and add delay to
> wait output data is generated then start the EDMA for output, otherwise
> the m2m function has noise issues.
>
> So add an option to start ASRC first for M2M before ASRC is enabled on
> i.MX952.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  sound/soc/fsl/fsl_asrc.c        | 22 ++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h        |  4 ++++
>  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
>  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
>  4 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 92fb16f7be45..2fe25667c888 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1078,6 +1078,26 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
>  	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
>  }
>
> +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	enum asrc_pair_index index = pair->index;
> +	u32 val;
> +	int ret;
> +
> +	/* Check output fifo status if it exceeds the watermark. */
> +	ret = regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index), val,
> +				       (ASRFSTi_OUTPUT_FIFO_FILL(val) >= ASRC_M2M_OUTPUTFIFO_WML),
> +				       1, 1000);
> +
> +	if (ret) {
> +		pair_warn("output is not ready\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
>  {
>  	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> @@ -1275,6 +1295,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>
>  	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
>  	asrc->use_edma = asrc_priv->soc->use_edma;
> +	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
>  	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
>  	asrc->request_pair = fsl_asrc_request_pair;
>  	asrc->release_pair = fsl_asrc_release_pair;
> @@ -1289,6 +1310,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
>  	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
>  	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
> +	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
>
>  	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
>  		asrc_priv->clk_map[IN] = input_clk_map_imx35;
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 1c492eb237f5..60b6865ca952 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -257,6 +257,8 @@
>  #define ASRFSTi_OUTPUT_FIFO_WIDTH	7
>  #define ASRFSTi_OUTPUT_FIFO_SHIFT	12
>  #define ASRFSTi_OUTPUT_FIFO_MASK	(((1 << ASRFSTi_OUTPUT_FIFO_WIDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> +#define ASRFSTi_OUTPUT_FIFO_FILL(v)	\
> +	(((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
>  #define ASRFSTi_IAEi_SHIFT		11
>  #define ASRFSTi_IAEi_MASK		(1 << ASRFSTi_IAEi_SHIFT)
>  #define ASRFSTi_IAEi			(1 << ASRFSTi_IAEi_SHIFT)
> @@ -432,10 +434,12 @@ struct dma_block {
>   *
>   * @use_edma: using edma as dma device or not
>   * @channel_bits: width of ASRCNCR register for each pair
> + * @start_before_dma: start asrc before dma
>   */
>  struct fsl_asrc_soc_data {
>  	bool use_edma;
>  	unsigned int channel_bits;
> +	bool start_before_dma;
>  };
>
>  /**
> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> index 0cd595b0f629..c8a1a2b5915d 100644
> --- a/sound/soc/fsl/fsl_asrc_common.h
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
>   * @asrc_rate: default sample rate for ASoC Back-Ends
>   * @asrc_format: default sample format for ASoC Back-Ends
>   * @use_edma: edma is used
> + * @start_before_dma: start asrc before dma
>   * @get_dma_channel: function pointer
>   * @request_pair: function pointer
>   * @release_pair: function pointer
> @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
>   * @m2m_start: function pointer
>   * @m2m_unprepare: function pointer
>   * @m2m_stop: function pointer
> + * @m2m_output_ready: function pointer, check output fifo ready or not
>   * @m2m_calc_out_len: function pointer
>   * @m2m_get_maxburst: function pointer
>   * @m2m_pair_suspend: function pointer
> @@ -143,6 +145,7 @@ struct fsl_asrc {
>  	int asrc_rate;
>  	snd_pcm_format_t asrc_format;
>  	bool use_edma;
> +	bool start_before_dma;
>
>  	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
>  	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> @@ -154,6 +157,7 @@ struct fsl_asrc {
>  	int (*m2m_start)(struct fsl_asrc_pair *pair);
>  	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
>  	int (*m2m_stop)(struct fsl_asrc_pair *pair);
> +	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
>
>  	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
>  	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f46881f71e43..77999526dd9e 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
>  	reinit_completion(&pair->complete[IN]);
>  	reinit_completion(&pair->complete[OUT]);
>
> +	if (asrc->start_before_dma)
> +		asrc->m2m_start(pair);
> +
>  	/* Submit DMA request */
>  	dmaengine_submit(pair->desc[IN]);
>  	dma_async_issue_pending(pair->desc[IN]->chan);
>  	if (out_dma_len > 0) {
> +		if (asrc->start_before_dma && asrc->m2m_output_ready)
> +			asrc->m2m_output_ready(pair);
>  		dmaengine_submit(pair->desc[OUT]);
>  		dma_async_issue_pending(pair->desc[OUT]->chan);
>  	}
>
> -	asrc->m2m_start(pair);
> +	if (!asrc->start_before_dma)
> +		asrc->m2m_start(pair);
>
>  	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
>  		dev_err(dev, "out DMA task timeout\n");
> --
> 2.34.1
>

