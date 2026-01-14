Return-Path: <linuxppc-dev+bounces-15708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8AD1DD6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhdW4l4Dz2yHD;
	Wed, 14 Jan 2026 21:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.84.58 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385295;
	cv=pass; b=eyP5qqVIknGK4tM27Xu3AKCFNAVBeVa/GdCELRAHV90P9zktG6i+QtX3CdmLXh5D3QxSx14rOs3zKI7VFrT2dupq3ZN7r7h74OD1zJNCTzK/6OVgq7KoNN06iodgi/F7YA3Tmi09gLS1wgvGujp569OR/WQgUXQkh0dicl94vrRh0SUWit5fU/LHlJqFIfAyNbcsD+8jlAcrgfptdrbK2FQJq/wGpr7e7lNFDzPxDWQ3pULI/o5cPVRw3zWFGGuNeMm+ayi95rTMuN+/78cXnsBcdVxFmjOUXul3b9n0FUFoUGuFScZhuOiZPLAiFCvBaNhg/iSGhHaPAt8UQay/BA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385295; c=relaxed/relaxed;
	bh=jJeMaSm2bwrbKZ4027cmfjYIkRtzoRsTDgImTv+aIuo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxg4IsunaPRu62Nt5tGYK33ToMN2q9ZUhi74gVjfdyRjCH3VcAKILk74aArThLH1FZt//enyx/xgYyQEiY1LaMLhq7mHM7DxiUyoYOZlTPYZREHR6ookED5d/ahclzkUnKrNLGenGmqf7Gws3nd3pDA34RKGWcmkPTc+fi1ClIvFxeKEHqx1yp/MZusfA15jiEMgDRXWPkkOqhfzBGs62JCrtohR/WNcT3p5jy6nDIrVjHMXgkBYc/eJb9mkfHAXq/qhmUkg7mkIG6dIuNtHAQ7kFpeknpEXIAboAWerKCHJ0i3zkvEsJ7Fhecyd8zhEnJ8c7RFN4noTz2Hp3GLxtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HUjOq6NF; dkim-atps=neutral; spf=pass (client-ip=52.101.84.58; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HUjOq6NF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.84.58; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhdV6LfDz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:08:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtPnQGUJ1ZfF8qGlFB7W1plIavtjAd7SJerHCVmXAHAGfyQxtrIDUOmLm3GuwHGBklsbachrZTPYa7/TkeUiSMs0GtrHIivRPLJF1GmtjPV+t1VpzROthaTLmBrO56NLjc28i7T6gG5PiAeXAOoh/1VsQbiyxi8HY81lcCJSYphZhYbG1Sd0fJk5s8i+KLLy7DXtk+/zkxWp4eiu804wH8tf9ruz8i3tRG0mHvNv7GESXp8jp04zpwmlJzy37JsKprB4uhsdw+DN224ASdwOsMNZZbhVNM3a6dOE8/rITxEmS06mbF9Nf5Fmkb4HHhp6pPJgGwIRkpj24Nh7TDLRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJeMaSm2bwrbKZ4027cmfjYIkRtzoRsTDgImTv+aIuo=;
 b=NJ6sxLesUjKWXb3OcFIAaKX4beKnR4qJu035i7t/k+iI/9qtHNVCXQxconaksGvMrhBtiVnbzuQOxK/rgXVSCldOXSYbuxGyzhco81Tqpk8pK2QCt0VMENdTDI2G2Vd284xuwn/fgtHfjTt1BBE2+g/YvI71qGkuv3KqA12psRiHKMiEaI6ryra9M5nudoM1IMi8KgUv8UbHOO1FD95qvJNUz1LfBigTVFV/c39c2ahiUrwkUamoO3TDAbylttDENXdzjtlJ/k0rDbF6kU72W0onXBiUgUYjlVrRNACUa820SlUle9ys9qgO1X8OAwjywlQ0ppTJTRgwh0Sx1DmXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJeMaSm2bwrbKZ4027cmfjYIkRtzoRsTDgImTv+aIuo=;
 b=HUjOq6NF2Tn7z485IXDAvCTO7q2bUL5cyvAhkPJOoQFL5WA1ERiw7GAKf5qumjWBnMipI+c8xjYocWl2nlajSckp6TxOIkjisNgqGOk3SD8bhJtX3D0HafAqxY+coCC7Ox07QnAV6kFgB2DScwRO4HHgX8MuEeEMxOnzAyyfqSO/B1xSvMzOKCWwkI1ztmsJwZXLLlSOk3dpd0LkUnFrPYE0/59E7VFtOXMstiHPkjQXrgaJdoepDT5C58BfgGbbuTNpi9iJwQv7HePr3I5JiygzLOn7WLEUR7RkwSfNOhAr/+y7aeBaGmYA77s/ijbhn8ZeMGsBJHyeKUzVgdAJRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10533.eurprd04.prod.outlook.com (2603:10a6:150:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:07:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 10:07:38 +0000
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
Subject: [PATCH 2/2] ASoC: fsl_sai: Add support for i.MX952 platform
Date: Wed, 14 Jan 2026 18:06:55 +0800
Message-Id: <20260114100655.3885926-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260114100655.3885926-1-shengjiu.wang@nxp.com>
References: <20260114100655.3885926-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 47aa381e-8641-409e-95a4-08de5354bed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7C+OJ8VMpjAZQa/jnaCKWrC2ZoQ/h37OnRXcugtlLjJWAHQe6A6C2YpvDvb?=
 =?us-ascii?Q?5iPI+Ye4JLYHgbTUX7C+SUm514ZRk9p/jN0NRS+F/YQ1pjTp62lqjcRfu4FG?=
 =?us-ascii?Q?T8JwtH0DrqzUbxWrGj9GNcbftuO/OPMMQtTH9Uy1shM/C8BUor+GeEFTpehY?=
 =?us-ascii?Q?1aXAj1DknmpjwTyzkfKMAWXwlZD3OEqBCATKA2br9YAFDIFAtvPIfvmgLmbV?=
 =?us-ascii?Q?ShX75Aui6j3Qa9oqJj8kKgmtUDqUAD3soK3Eq8Yz/AMdviI7wYgfRUKRt42b?=
 =?us-ascii?Q?OciaS/z+q1eNRFgYLotQjDo+LY37iZgVc4w+BPWv+8tdNY8wugC23d6IiGQY?=
 =?us-ascii?Q?6pDlyeuoN2+XfpNpTM7ivLZhwlcB7jtx72P8/o26tD4egn3chgK+7h2vBiYR?=
 =?us-ascii?Q?BRs91QkadZTj+8jHzI5djm9t9kCgzm0DR1akFi+r7nhEA7HQoc9zI1LKwfms?=
 =?us-ascii?Q?pe6T1+NUZ692c7wP3pUooPEKWtbs5lPMnfEHEXA6SWffR8xnaVZovSxItnfl?=
 =?us-ascii?Q?QZKW2gJb2+GcB2rBSiBAN8SNuKC+S2kGrlnH02jXu/OhecaqgsIsd32t8EeI?=
 =?us-ascii?Q?MuEDYw3BLotlk/B6Y1LZqZAA36ea2lAL3Yw9Ofs5Gwc4lg7V361CHaVMl6yS?=
 =?us-ascii?Q?bnDrSQmYF9HzwVtWvh79M/hijVTiq8A8lN7A5DKFven7OGyMKtOhwRjLrMAH?=
 =?us-ascii?Q?eCihqq5UYiv1r/SjEyAgEoLCN9Y8Mg/2eNDpRQBzgaTCU89L+7sObeSqiqyR?=
 =?us-ascii?Q?SUCcTRPUgP+ddYO4qV5m7XLSLisldIDCAbcbsCrvfqcro7WunQhn7OtTBk9r?=
 =?us-ascii?Q?JKi7HkOyAVg1RmAkJky6fqZhEGiPFDj/uVdnEbyj9ngbHYnftBDuXAtT/f8q?=
 =?us-ascii?Q?+IVU+WyTjXx99sQCE52bK7gFoKJkC3JPbSZ4UWp2Ne3W+7cg7VzPEnLs8bGR?=
 =?us-ascii?Q?6oP5IjOvDYcQmX3TpBvYXNKI+hu4vtbInl2CzzTIDmL3lgf1f2OZu+062lzw?=
 =?us-ascii?Q?diJPWCC62rubWpskiXPuryBuovTNfqkrX1M1j7jT/N+wvTTtRoNm2JfVn/tr?=
 =?us-ascii?Q?slebcUoTlJPknBwJhy8/o+6yHxgyN923R/sRQBFvxJg26OPyoJx7vrqXIk+V?=
 =?us-ascii?Q?Vx1cT8qEhW6UG7TGmVxy+3dSNzOGBBZCH4kHsx8U3fNHPP62Zscj9ivutKyy?=
 =?us-ascii?Q?TMdwqJSIEigBdkS515mIhdnPG6ta3q74pOe3G/Rf1qNyvuXxOoe3y4fhHb5J?=
 =?us-ascii?Q?Pp5bI6uaiqaULkavQljOO5oVrbdw334MLOUFhxIIKf6xApv6Iq/U+T7GlW7U?=
 =?us-ascii?Q?3mfj6ac91dTWKfNSSnpB5VV00rRWcdN7jModXl9efBzrtm+a+XE9JkymA5If?=
 =?us-ascii?Q?WMOaw79IXasL25SKxFkdgAGbxVuJ189S4wCtsbgdtQxG8121qjK4eiwXZuqt?=
 =?us-ascii?Q?lM0KWyOvRCJ/KgFN6BxjyE+qUNqR7nrhsqtPPyo9Pa1+Jph7AEtzbPC42YxL?=
 =?us-ascii?Q?msT79lMtB+HjreoacOwCPn/xX7KmD8NjLqbODl32e5NvghPu/Eq1jW961Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lJLKGtgvUy2UaV9WMqWi4SqV3swqx2EB4GtoFMozOMlFTs/N0cB3Mo479I5d?=
 =?us-ascii?Q?d0D5DQFp9k2AZTOtF2cjU+/iD0kCtBy6XsJVR29sxwayiQM78wYDLHvC+9sF?=
 =?us-ascii?Q?MTgnBFvuKzVgOH7l1h+Jcbs8xRPqT6CzEGXdLZeyzCEH9/4fljStvJBtQj2h?=
 =?us-ascii?Q?SPf0NXsYxGLJIJ8RKXQLmmSrUSAaDibtimfl5gCEBo54z6LAUo8FezdJS/TW?=
 =?us-ascii?Q?BozOhI3aVcDQRRvdCSdCNEISzcSCjRL10tgQATY2lIjtoCnZNYYnJDfnyP8N?=
 =?us-ascii?Q?4wGqZIfOJOCXaAIY6SOM9hLBVzNbeW2qN+pW0U3uJWxSr1Lp8u6H89KRCGrS?=
 =?us-ascii?Q?c0c+n7MoJt+gAPyu3iCm+5p1WSbj0Y116Pxdfe5m1sM+RnsjOB//ZdO8iZSq?=
 =?us-ascii?Q?G2TthhUC/MguaU/knYV6mtaBJmR+aTxa2c73s2H+VYVYpUFfQJpq68Hzr9EC?=
 =?us-ascii?Q?4bFx4VZOlDSgXFrmGLnghcpVKYrk/DBLkf7G3gSDbEdnJ6lacb2UO78DwIIE?=
 =?us-ascii?Q?pWFkI4PJfMGrzHffyDhZntE1b9Ak/tK+Bukm3e+/QlauI5134SUKeVGIMxl3?=
 =?us-ascii?Q?0Mr4J68GEPaVxouW4GBXwlSR8R0ybIpPhKpjdUwJgQixqMu0rc4T9T/wb+6q?=
 =?us-ascii?Q?DEAL50NZoqXFjWHmNnCQm64FWCDqA9Mgxc02AVr9HccZuxy7WMYjMg40+aBk?=
 =?us-ascii?Q?fFKe8v+E05A+Iaf2FJ+j741M0jEcKdroqZA0sQruqvvMkjQ2wLQvsizw2WBx?=
 =?us-ascii?Q?PTv/Gcb8jmgei2cGf1Fdv65lQB5dz/agE3yx6fV5QkKkyQ7wT0wpJ9zPRWAK?=
 =?us-ascii?Q?RvUq9JHKPvArtCwrz4xO0jEmtKn8sIGq/PNsso72zMS6z5bKApiAB47jmM6u?=
 =?us-ascii?Q?BEMnSGn/lrzIRrQweMX3jRsd1KECsu1NL3H3l5P070ct64EXiIlxyjpEaIgo?=
 =?us-ascii?Q?ABnaQN1XF9pt2xFpL3b3ilh5QJ+iYYaORJ38lMXtZwiEiDS4hZuf9pTtmheq?=
 =?us-ascii?Q?ggETr8ziqpGw4JO98Sz5fMVsILiTFpj8j5jdc0qBtBxyXlqMuW8uE3UMkfdZ?=
 =?us-ascii?Q?HgEDTuaCG/T1uBdDuB0RuBA1MwX+6zeupjZxG8HJ+Qu4HE++0VA5HH/sIAWR?=
 =?us-ascii?Q?YEnrjOaluvxxwa5fLYKwr8Cjw/gc9azZ/Uc8xtK3fhe1yjk+a0NSRTwk46ka?=
 =?us-ascii?Q?m+ekR9dgENM3dhNuXIsKdDjuT77QIukcdXd4eunqyC5peBBQ+Gg9ChzqRQrT?=
 =?us-ascii?Q?8qYAcU1Gi8NEpNU3WIgDkDqaqv0xDo7IlmtEGU4sRbs4LOFbO9L1K/kNM/VY?=
 =?us-ascii?Q?vJRymL+uPuypMqCByY1fAMRxQr6xqhWKVz1gbdaW0gD/oiYLaQP1otX9SNMM?=
 =?us-ascii?Q?cFfw6COeLL9X57qHV7MdMirAga817Jj9PDSBxwQcOZ7P7rWU5GQungKFZloC?=
 =?us-ascii?Q?DgUcC6o0m6/ZwHaQrE74DJ6kW387+sX11QvIcvkJ4wM9+4RGS9sOmJ+QGAN3?=
 =?us-ascii?Q?vf4Rcw7IPzjtpNjlmA5gTfE3agFl+nqIGkrGYJSvlhFyCuZ1FlTLeu2XCu12?=
 =?us-ascii?Q?fSuTINYd1bxOQAs/myKPLKJhYrVDoAfgpx9ujiTSZfy9zTKPwJ8Smw1nlJbf?=
 =?us-ascii?Q?qvyWr3/D2rMlr7sXqMweH5NIiHE0ys+85En4EqAEjohUqiR1g5vU8pQkixBy?=
 =?us-ascii?Q?y6KPrr0zCfmmvveQ37EZoKAuqk70Lfkdhht16mfc2oWazMiExwtFD+X3sY5N?=
 =?us-ascii?Q?/MyHy9hUKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47aa381e-8641-409e-95a4-08de5354bed4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:07:38.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVQji8CYXjoc18WYuWa3D2riNPogrM8I+NH1nOPaydHxCsmAMT+MmunKbGG60lOpcNkonm74X08jYbbdTo41kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10533
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add compatible string and specific soc data to support SAI on i.MX952
platform.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 2fa14fbdfe1a..c025041dc079 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1765,6 +1765,18 @@ static const struct fsl_sai_soc_data fsl_sai_imx95_data = {
 	.max_burst = {8, 8},
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx952_data = {
+	.use_imx_pcm = true,
+	.use_edma = true,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 8,
+	.flags = 0,
+	.max_register = FSL_SAI_MCTL,
+	.max_burst = {8, 8},
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1778,6 +1790,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mn_data },
 	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
 	{ .compatible = "fsl,imx95-sai", .data = &fsl_sai_imx95_data },
+	{ .compatible = "fsl,imx952-sai", .data = &fsl_sai_imx952_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.34.1


