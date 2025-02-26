Return-Path: <linuxppc-dev+bounces-6493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212BBA45B36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 11:07:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2qrZ03VLz3blv;
	Wed, 26 Feb 2025 21:06:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740564413;
	cv=pass; b=gKI8Y+R+A3vuOWGaPeemTev0LCGoZ21D8/stTBMcg1bnUAkdV8Ni2lpD3g+EFLiLChyHGihC6BJLUT50kWnmervd6NaLTgD6Cyw24e9L/aCY0gG36/B7F/ryHLzG8incy6U3MAuXzIo7QIaHNP4+LlCX+RPzU5f8J+H09peWmog99ycbkUMhFy1YoLBV/Jj5AxkW0J4UF7xhy7eaqgHdpNeYflXU1LzBAWMyuKNAZKChbn7lInjXtsVwSrjeYUDn9cCrqmX7Lxno3HXEthBSoYDnmYK/Ve/InGvhAQGaxyuG4ebV5nrm78FXvB7Rht/k/lZhUdCrZ9Q5GgX7fhfU/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740564413; c=relaxed/relaxed;
	bh=CQbdZpGQhEzZaIWe1VaRKAFdzvFmhscoeUhgD0ejWw4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETN/OeNvHk9QmdfpKp3Kd/0TxEU8DNdPnGIwxZVXSsQD27avf+7Hvz+D10MHTNUKnLT1vqSWqN4DlEUAXgODXismlltR/ZMFRpJvuIPlqVXmA48RRWVjkTqeCOEhqu23KGPvzm+Esi2MXOCfCX8muSO/qUKYJENS7K4flcZRL8cCXveQh4iC8jbMdCb6cp5hKp2XLn3SqkrCC3AwFtXeGe3wHVLs7qkluhuZnU3FMWW/F4QZrhhZeMd+vbkYmAobEiUNC7427PEIbJYxC9P3xfUYEfyUtahTNJygMDHjQ8aMhRZnMN+xF1WdjnWm8tgeNHYTSmkesElZksooCznPmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mU3JSAkk; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mU3JSAkk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2qrY1hXqz3bld
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:06:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJhcbVBDYEzB7XXugi5dqgwaCX2i1TXVUJe9LpQC6BnI1YuLLwnUU3m2TaLH+9+Pe/i5Aku69VaTFZIScIwOZIhYLPhFlao0nEyl1r910JQgvODmpflw9UYSJNJZNtQezf/mpPBsNHJN57a2h3qb5LZ6eG6o90brugKBht2VDgEVM/4mSY54dTVz8Cgr916hTqzNZoE/Ji7sC3MaoDG2wdzPHVjUkhhzkucadCNC0JpMx+q3oveApp8ms1WofxhjbsyGis/htvVCUz9Ste3pPF8kOZ+J7KS5o99vjdyPcri4+5vUPlqvlIzzqDAoASu7SL/o3zsjKlHMPhX0SNbELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQbdZpGQhEzZaIWe1VaRKAFdzvFmhscoeUhgD0ejWw4=;
 b=ipi/CP75bN/omNo+CBNQUGjDmVdxDaaZJmPDteU9smu5jFZzEwCbSDGsGGPu1WmvYrazICYUxPbgxQF4rvwRhP4AG49yZHZFHF14ZkRd+ixulRRdyRW2y6tcBS3yjErEcMuAL9eg6RZiGGTFquFOc3qfflyeRyBC4Th8xpAzESBGRhwh6+xWxICdrqzUi1N+Jwl7O8MeGlw2FNfZDhecjij7u832ayzp19BK+/bypf7cD83C87UvThnE5bYFC0xtYIxtPKnGwEJ4BQZSsx69AtVVhTDjvrBVvyAbYAi/RWCKNj6K+r7X3fXwLKLxlm/TEHwk7L5JC41CRNVkkRCQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQbdZpGQhEzZaIWe1VaRKAFdzvFmhscoeUhgD0ejWw4=;
 b=mU3JSAkk0HC/2FDj15ljF3LvrfAPdS/gNIXsX41wJldqsy+nTi/Gc6wafjSuAyM6TReoLLPatUdQg/vGKvuHp1fa4sJANhPJFLSROyO5+g6s0GPnAd8LVSTBBZUlRpDRNVscXiAXtf0QlcIiHBuLee/rI3F0+Sd+Z3mnrXWE7A2hkaLyionz5JA69RPhDjzZG6A2CnLaJ1AlDXX5uy5zqcfbglpo+jSdydzcKOgGDrpNxnLdwCPAwqZMmBSexOul3q2oTRS0mU/5wZqsBQmbCrnrRGuFK4bXf00P9MF/HUgAwuqoAZbEdn8LCwxhmM9Fx87JwDvVRNvBVsLkCjR2EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10720.eurprd04.prod.outlook.com (2603:10a6:10:58c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 10:06:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 10:06:30 +0000
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
Subject: [PATCH 4/4] ASoC: fsl_audmix: register card device depends on 'dais' property
Date: Wed, 26 Feb 2025 18:05:08 +0800
Message-Id: <20250226100508.2352568-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10720:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc27086-c4e6-49eb-526e-08dd564d3dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V+/gp2qTrTi5BYFwU5IpADJyyJa/QgvdpKec+PCiX7lBc7YUtdsYwIKEVyRL?=
 =?us-ascii?Q?sUxQOPqVOU6gNQYRcBSV+WfqNo93JeeAH5huNQFqFfmgYxOQY9WLlX9Rq55m?=
 =?us-ascii?Q?vEwnKNZh68Pd0M6VPp7ksM4qSjVWNFimBuXKDabf2vC8Xk5sMqyRi1gEJr4B?=
 =?us-ascii?Q?cKMfqzYs3E93wYsMr3Hotse7CMM7D5ImDhSz6qGeE7oXvw+28cQszwF0BY3U?=
 =?us-ascii?Q?m8vjz2Khyc2Cr286hf5ENHi2fUPHNCPUZhgwfhSDByJqk+MfaTouYYcewOsv?=
 =?us-ascii?Q?SjKIfxLPIBqn+RGoYmjOVeLBNEkJjq/GR6CiKzQr5DoVP8cXbDcFXIH/DMEM?=
 =?us-ascii?Q?Am+vJuKqarFoV8l/UDtZN4MZt57HV2XjqdcuK+5fsB10jq5GiDwMulzGnWX2?=
 =?us-ascii?Q?TVi62CevM3g3oUJxkSGDxtaLNx3ZpOm2fLkPBF0MA9/fVXCfouN6FzPpOT30?=
 =?us-ascii?Q?04ElFKgCR3+L/Q6po+NOycGlIk5FlC2vtt4XEf5ZQGsw5pv8EMyNBZ1ihz+a?=
 =?us-ascii?Q?X/NpMC+QPqu6Tuz64MO+AGG9NRhPmPeqsu4vxiLaSl88v+/9NDgs+Y6NFsSr?=
 =?us-ascii?Q?cQE/cjDvFXmFYapLiSAl0MhNq5GGacs6KalZX1GQoatsZewM98nkwPU8TCKq?=
 =?us-ascii?Q?W6QKrWxksImWA0kRIxRAYHHauNLNARWDBr2ZcQKAZSoSs8vJxwcf66P6LNoh?=
 =?us-ascii?Q?+IrEDcqfNsUcVClG7OxGmLCsDXKNvSUty7ClbtfFxdW021EaXofc3NlDkYlv?=
 =?us-ascii?Q?6zt+PgsIcSKPB4irH3naPpdxOvEBzmMjdP64OQgUzQ1Vde3/WLHwI0qqFMno?=
 =?us-ascii?Q?mH4fyH617ITDPZWnpGJsVNKF8WuQUXI+3dR/FKhtRg6qJZDgyUCDmZWaeM9n?=
 =?us-ascii?Q?Xar2VJUSlrA5Ij9P7lHdl+70ff9ElT3jgJFhXn5JSx+x1+5yeQ+dJHew3Vmn?=
 =?us-ascii?Q?nvBlIpHJ0tp6ROxLKy+dhWPKAkwwIbm0sAf9P6DKECWf7Rjjvdgyi1MVDuLi?=
 =?us-ascii?Q?Tqi5JY0uyIsOkGbVPEGZeMdgi3wlFtS9gOr32YGQ7LmhGDgQTIY+fq/p6uV5?=
 =?us-ascii?Q?7ILfdvE9sfGYiJlJ7gNy1BtQ1cGjAksq6+NHS7ZrDQ7kXYako9ioTMKbhN7u?=
 =?us-ascii?Q?Wv7rPygcjeW85bpVsIYDo8y713r6BkVlw+sHYfW8vUcfIRgP298vYXOBtGjz?=
 =?us-ascii?Q?9rAULW0FlHTp/ajBgob6KjSXD4wJKYuoVnC48MJQ8npW5m5luq6zsN7fJ8Ge?=
 =?us-ascii?Q?rH29+/xh5qUFI6au55VtK8yq9R9pWBVOaYQhyexmwepVFQAzA5KvoTHFE5b2?=
 =?us-ascii?Q?M7BtllUnKxahhYaxlC1Us6zkfPgFcTS9HlWT+7MSdiibr02dv8bT41DkGgmu?=
 =?us-ascii?Q?CjIrmWmDGM/19Wu3vch6Dmp5rbTXKdLCpdIZ9HFPW33ZChvWkGPXdZsZHdo0?=
 =?us-ascii?Q?AbGE5ZvKrjTB4lxABQTttLwUuVGXvljxcWdM74OQPsD1nzKG3lxlgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NbmA/UvTSJPwT8N6pRM+29JvepuAvC+YcOko2KgyW/mcCMEl9qQr/q0504by?=
 =?us-ascii?Q?1JHCyhnngJ4jsT4NfQ2Yiyi/Uf0v/OLsd3fiIIwy5x7Zo4MgFX6+4FPbnWcS?=
 =?us-ascii?Q?O+nP2OUvFm7gp2FYVIfxrSHg48rKbz4cce/BtGJ6hscGP3Sp9y5WbCd2Sdny?=
 =?us-ascii?Q?q8QWI765J4z9+4hfPtLLjSPByTX337/H4SbzRXvsQFngER/ki7n/x4dczPOT?=
 =?us-ascii?Q?CsHUaC7BVibc3d0bIE9kw9s+Sq2f4hp9oz4kQzoTKCsr705tzabedBOfH+xw?=
 =?us-ascii?Q?HHZE2NpYAAVvMC6/ZNlbfVIT7fLnh1X7f+lYcMlSLwlHHg32skXsnGZGNyI0?=
 =?us-ascii?Q?UlENiFpkQaVXYUJPHTzMG/ORJfQfousi2vfqooYHwzgH3YwWIaTRRZvpIO8K?=
 =?us-ascii?Q?RYdruU7RGqL4+YFb5fmd8c5BRutZj4wlLFqNHt1+wc/ruptazPl3qcgV8ok0?=
 =?us-ascii?Q?58PeveRV/mTeHMf0A32cCFlGJ0+Bv366sTOi57LC537EpQwFCibu0ztahPmU?=
 =?us-ascii?Q?+20brAWX+n37Vp4Mm3tLRI2I74LmLKSL9XbVIwoiet2q1yrYIxx/WmMNczMl?=
 =?us-ascii?Q?wLx9duPCAN8DpuskjBjzWW62bllLHZAFF637A5myVaBX2JiZbXD+dL19l7zX?=
 =?us-ascii?Q?ZC9xvhms8vLwNMmYAtwSQ9KGAvdRpwAKRYa5gJA5flepeYF4HAFY+7xcQ43K?=
 =?us-ascii?Q?pltlOaSmakbhnSo5d6PFbJ9/sa3ATfpkSDfm5l1plqvc4FrIijQYWodUonZt?=
 =?us-ascii?Q?Ga7kC/GRAtiOlUe2G8a8QLq1aUDA+irazULi5u9shDrrzYPzK9y21UPH/TVp?=
 =?us-ascii?Q?O+idjhetJmaRETe4EI1iBLiqy6iv/QQln4Zbt2cFHVsDyCNSPAmaKVGEmDgM?=
 =?us-ascii?Q?y1THAfIvzhN0hgeMwTw6ESO4CYQPzPAWkyUrycv8U7zu9uxO1cvDUfjlLS1h?=
 =?us-ascii?Q?TL+VW00wRVrodyMd2rMSbnh0UIgdJugRqYkHNttJFVwNjYLAdQS8naYXZRiI?=
 =?us-ascii?Q?RL6FtWoZ3rqQS7sM9+9i0ZokYp/KkXgFswrOpbpWW8SM4Owkv2W3UE6e44kZ?=
 =?us-ascii?Q?/BIAEA5C+XLYoMhYlEJm6KlPSV1LKE2XzmzuseYK93FO7Ndk1i8H/GbhlFVp?=
 =?us-ascii?Q?PIrON2ysN3tvvZfP52U2yWxxO96zhXYGnjYG0UKkVZ13RJAnheBbNdkeaX1r?=
 =?us-ascii?Q?kM/Sg3uWV1YUqqrgjgbwAvBYWzlXSzb0W3f4nMnK7WBZTTb14Cjyuo+38eQh?=
 =?us-ascii?Q?KDbqiK8QG8pKDUbiz5zx4H4s1LgeD0JSU3YvzCLQZaSYybPOssBBawgltHn1?=
 =?us-ascii?Q?QXNM3cR6PDNOACcZREb8rHkZ7MT9YNdKebKD7MJJjdW7qfAURJr9h/5MuOJy?=
 =?us-ascii?Q?9/VqG+LrxUCN1YyYbotkq8JFvRkioApClKdvS8bg2OFrpYLtUrgGpOeTgJN3?=
 =?us-ascii?Q?+WP5EoAdoiqvPphtFT7Q0fjnHd/V8WGINfJUN1wyUW55h5zNQjsxlUc7e3TN?=
 =?us-ascii?Q?Z2kFPZTYah1AB1wMJHhtCUvmqLBCex3lB4SFg6IYJGTuEGweN6cZBEVaSpnW?=
 =?us-ascii?Q?AW/0VZ+EHaoXgLRKCdxvS+Z8ke+oq4kEVhmdh4NI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc27086-c4e6-49eb-526e-08dd564d3dcf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:06:30.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEkKGNVHC7O2Ia1P7A5UwZc/nqAlVJl5NcqhE1x51sGkv7fAzX38NZ+wt6Pdq1HEz7+wJmIA1z0EMiiWu7FPQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10720
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In order to make the audmix device linked by audio graph card, make
'dais' property to be optional.

If 'dais' property exists, then register the imx-audmix card driver.
otherwise, it should be linked by audio graph card.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 3cd9a66b70a1..7981d598ba13 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -488,11 +488,17 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 	}
 
-	priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
-	if (IS_ERR(priv->pdev)) {
-		ret = PTR_ERR(priv->pdev);
-		dev_err(dev, "failed to register platform: %d\n", ret);
-		goto err_disable_pm;
+	/*
+	 * If dais property exist, then register the imx-audmix card driver.
+	 * otherwise, it should be linked by audio graph card.
+	 */
+	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
+		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
+		if (IS_ERR(priv->pdev)) {
+			ret = PTR_ERR(priv->pdev);
+			dev_err(dev, "failed to register platform: %d\n", ret);
+			goto err_disable_pm;
+		}
 	}
 
 	return 0;
-- 
2.34.1


