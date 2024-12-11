Return-Path: <linuxppc-dev+bounces-3971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B498F9EC2F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 04:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7LFh5S5rz30Vv;
	Wed, 11 Dec 2024 14:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733886632;
	cv=pass; b=W5gUppEnQuuWoc5ljjNdKwDXilLZpmUc7YxTjN0A8dgAIkgeeveETESZ2W1I0O+Qz+FIOFapKWyHSUsNZelsTLOE5t55hpOHyhOhSuP4zaB7z5CeEf3gd832145qWtIcy6ozZSIL6/cqAkOjnx6uTN7GLI4WJGM2CsFhe7AMvMls6Bsef4SqpGNcXJxZi/CaOzzjYtJPvwErDoaxK5KcwBaXKbx5gktQMez/Ejq9cGbzwivsYbN7M52A+8ukuCd4SKlPbuf8e6piJV10oOifKqpRq5RJDKpHrTh39rAmBIYrfZG7IAWJItlxZjv9ZQmdGankIYfG7GCrK9PVinlMCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733886632; c=relaxed/relaxed;
	bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LlFwsiSsJRAozJ0a20IPKCludyMYD5weSUA1so1TttkeweEGxtZq43SlHjgzedotuu1QM/i9cSN+dRDe+z7jeC4J21Vqzm9bfh+k/dbHOjityaFFMiylRHNzttIbg+SzN38XMUtratF40y+l1kwM8w2Op6pEl41xo5L3J1osknEsLzNw6TSh/twexwGM8nioUgfCcz/iNxh2yJBfmOFTkwHK56wUhZVK2ACG0hWWWgChunxwNJJYmpUqt2l63ViYRkBwS7VJFGi4fmdA76v1EZ438btrbq0p1AP/CxMxJSwjvf9fgUKGFBrlUVaTGuD4nA8bAp9ElaXMlftt9AX1LA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MO+v5p/l; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::607; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MO+v5p/l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::607; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7LFh0nX7z30W4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 14:10:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiUhax+7Qlt5q3NqLcwUlsCGm9PqxPNWA19NOv/EvezHE8dKFq5pInuybmj053mMHlhSf3VckPHA9z7o4AuaKmbtWaVebVqAwMpaaoh7vv66TPg7nf7ZXk4NGWV5CdLJuOqeeszONVRD+m0gIcluEUlcoZGC4RvZj1QtT0HTba486uCEA5SfGwX65Sej/BkUQqg7PQLVITt4uj9YlzwDtGqYjdyHUGmuJrdQt9JJuwue8AWJXQf/7FLtYpvVbIZPac4vYhm38kLiMoqScno16DDY6J/tdWKrIpjxnZxlIgZedOpRjuzvTQo069tCrFM1eXToxwCoNF/fUDeyT34dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=UvU1z716SV9vCBVrHNI0HoYNtchIaROV51Vonn0v0/Dekxzy/qVCoCPu8j5ioW065wL9cGZppjOEGj2mBPglVz8bA3tYQtiANKniQtcfwFEAimnnBMWpVDsYLDP4WQAEy1Z3XAsx2l7i4MJGRSot/JYrQSUNIGPQY2KTKFZyvINkTyJWcW/76HVsDvckJ+RkRly+ZnjYBfykevWX9FZl90SNHJ4kLeJhZpPIwN9RqmPQ7fDqABPOdI8RE89YN9rJfylJDGu0e9ZUtWxZqTcBSyufXMK9iD9bvLR/0HdahIkBB1Vd6kzON0Lai36Emri0iYnpL4bWWPQzXud4perI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=MO+v5p/l3lk+LxMP/BOFeeK1L0SXgWRhctdZMwoOUtZPmDKni+6jK+XGhH1dU5120DqWotukFfWwi9E42NI8uYM4jPCsqMhyuyFSkXvm85dFCVIYWqq8GroECRBZRGIkvhHsdSU2aYZfTAvPNR2X9+Fy8A02i1lJURUTvlrHNJYS9uz29ClhE1FDj876qAh+2uza5nHnVMGs+Zj7zrEftsli/3vooLsE/tr/qx5KjO64fkku+194/Cav6VNIRX7i2fjK1N9yQwwCahm/jaAUFdXmlXcoZ3xFMANdlYppVzvX8x+qjBLGZlroWmyBa1NCL82bO3YYLOgpsM/nkyR87w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:10:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:10:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Wed, 11 Dec 2024 11:08:49 +0800
Message-Id: <20241211030849.1834450-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bec2f83-ccee-410b-3eaa-08dd19915ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzsXn9prrCVIBZ9PqEuVKD2XvvPOIGDICyIWSYmuRB5UatXT3F+g48ysE1nw?=
 =?us-ascii?Q?7Auv1Tutzw5UvMB3Lf8nGI306lUzlndcg2XnOvxqASQorMowcfjrPkPxCRxx?=
 =?us-ascii?Q?XnJIviPLhL21B0pf0kqFaHKrPX/YASNXiyUqq6Y0QFBhZggWA2GWhfgXecEX?=
 =?us-ascii?Q?yMGFl63QOqolAvK+frGjGCEFTHgB9hsgJ2JudMHR17z0mZIeGVLRvTI9JLaw?=
 =?us-ascii?Q?5LrY+uzL9U7ILGaMzbZs0B4m+onE885sFcADj5NOZBlPn8+RqEakJVpEOlGf?=
 =?us-ascii?Q?94tCQdmlOcTBM3wXJN/ziYD2ot6g8Rbuc/B+7BDaeRVYT6PifyyRmdMofg+r?=
 =?us-ascii?Q?uNzHEav/M0W1L4DLx+xEQx8THSnyjYXiyUzLwRtR6kW2jto1BozGYX4ThbLh?=
 =?us-ascii?Q?E0VAHK0fbMYtBkr+swfgg/TP8tgAgQTnlXRzIKm0H3IFuNSBcLD35HQoPY54?=
 =?us-ascii?Q?1liQIVwTZOkpvjsJFg6xo2mkRCtIemnCg73RBtmMwPZi95VmIcqjKezMxPj1?=
 =?us-ascii?Q?1Eu04v65fYEhfKMp/CAnSkV7CS6u0cDx1vrdtrn9Hn1wbCEDydkcM/8NRe7B?=
 =?us-ascii?Q?y7W02WqectGdWR3OF7Ll5MKSJKBtjo/LTQU4J4+GU7HcJr391bySoGP5iVnE?=
 =?us-ascii?Q?pEzg+Szm0/sAFOGYl6K+dJd42Y8DYj2Z0CBBk+uySLkNgSkFtlZQmK88uNDF?=
 =?us-ascii?Q?ffdvEhQ0+ly+2LH8oJlOLynJngx4aXQj+IDFnieAupWblu7AV8P3Nx1JNcDH?=
 =?us-ascii?Q?Dj2BYyeaUe9Uuo7Uom7f36oZM9Tg0gxuGVavYohODXB/woJsr1TEKJiaYmTX?=
 =?us-ascii?Q?iVpYgzBwE9vWOu+e6rjm3WHTYuSinGFQmmR88x2A9ok+NoafOTbz+oS7R3tG?=
 =?us-ascii?Q?NTUP89jbT/n3fSaN67PYqnwx+pCg3TI8XiuSt4M4GB9FHKKqT4gdEGKf12Yw?=
 =?us-ascii?Q?3TpUHMAyLSf7zGORoo+qHP38Q8JLClQCzlEfb+tolBajGOQlu/H0tKye9/yW?=
 =?us-ascii?Q?Uz09cVidwgxXoGoRVZhfMYGArb/hkCVe6rOH8LGgQAk5L7lZBGkh0pn5YVNC?=
 =?us-ascii?Q?bWRdRMfp2xEy8GZO7B1L7J20g8nKOQYy2VNDXyY/3qOV6dWbydg1wbIsAJ7c?=
 =?us-ascii?Q?V0JLjbvBXJD9nPSKpm7GtjRfLFputN9py28ZTqpOi7dsH2oSUPNRTILyubAB?=
 =?us-ascii?Q?1o6XTxIhKN+X+He3PryM5ZE5qzeMwog0d+fYe8CxAJsOOTrHDug+BWUoYG2W?=
 =?us-ascii?Q?oLhdV7YAM2STBWYK/nU9+O/N/3uN5uDrU74xDT5Za56rzcmckrEaJEKDwTy5?=
 =?us-ascii?Q?w8sBapKVw+rM4DiceTyYF1vaYUoJCK5KQX9nKo172bIvbiXavxA9wldMNH+t?=
 =?us-ascii?Q?P2FGhUkyMCaz94aZUIO4hLxV++Mvkgu/JUpYSXUQA6Bi6gkiV0Hh0XgXd5up?=
 =?us-ascii?Q?/zngBZBUndc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxUSfzAJxEkdDBpty2YhUB3Abs6/3053Jfk/kmLy92B/eQRgnzmy4vYOcqpR?=
 =?us-ascii?Q?D+I9laydrmEtrpWLlvUQdP2FB4kGZhU1mke3ZyO+7zfYhPa06be6E/ltYfW+?=
 =?us-ascii?Q?YGGD+1hjMbuEEc8k8hKNFLyaC4bKQ1mescOfFravrUnMOVtpiSFl9/GxnCuV?=
 =?us-ascii?Q?AspJDwxkLMIfn/fMo7crWPyLdZMjeesHVfvLkPdCQrohM6SZW1CXYgoFikjF?=
 =?us-ascii?Q?Amhztj3+U0op7ahBZ+Tc2m2e3QWY5IKnG1Xfd3AnNV71dO5mGmgBZmIX17sc?=
 =?us-ascii?Q?vIF+Ys34fYAHEAz/G3tkrhSXTXqgPkQJ65HVq0YbelRksKq+pfySXkMHPSAN?=
 =?us-ascii?Q?JaH1Gopsf+3RBwI11XRqQ8dgaaWESg0LDfEZypfj4vG2MzpcyhcsbIjUYCez?=
 =?us-ascii?Q?3/SIsGHaMmS4K7J3Y2KDB/NvTMSAcGNepQuH+BGplAa7a2jIgx8qR/NmY9ZI?=
 =?us-ascii?Q?zBoNoOVa3cVq3fxrV4UlSNsxA5ldFBqP9+E48nyBq0f/u6wB7F+d7jCutZ19?=
 =?us-ascii?Q?6L9cfFCnJqY/WDCbOeTGbeHVSe70nlJP8VMFd/g2Q0mbFK6YJEf+klL+cpTZ?=
 =?us-ascii?Q?SJABUj3BKfsW7bUGLajIOSnHXguRDsPKEBizsSIk1B8lrEI6Un34f6ZZn/wr?=
 =?us-ascii?Q?trxbt1Ovv00JmkfvAzPKiG/rgZSw8sHVN2n5JfLOE+54I3Qi4twGWwlOUfYw?=
 =?us-ascii?Q?ShxGLQ5Gh64VgnfV4MhEcPddshFkzEOcsNXff7c2xo15rJzigF+SUVSs7R5f?=
 =?us-ascii?Q?Lc6b/D+phED4ribIF1X2f7iOs8MaJ96RaQ6HpV+RC505knGivh4wUilgg7yf?=
 =?us-ascii?Q?rF7IjqgUlGLFxmd/qjnglfUIlPgi1nQbWNCYblvglR8jirB8V9bGyt7EGvcO?=
 =?us-ascii?Q?RsI+W3marZnSIom59o2G6Ys1KiHywH9x/zeNewYoWzmrZNGMPpCQKhZH5Oxr?=
 =?us-ascii?Q?nDMexPpk1sWaqbHnrDIl+9LwtfCm9lBvtWu7nN57Au5qSr/yBUFURfcb26/S?=
 =?us-ascii?Q?bHBxpRbny1S9+GHkaseciCbHYJkSB/S78o7ji/I2gT6OvaP1tvX9Hr9QScoG?=
 =?us-ascii?Q?3bE+57rl4FU2XMVWUmG9Q6ALGpFDDIEMDCCPi6jHoOJyNeYPjdye+ew8mIdE?=
 =?us-ascii?Q?XSAJ8NW+HopSWy9bmfEO1KBIyqIOSODqWqw5JWn3CKnsM9SsAwqVoPHxwIOT?=
 =?us-ascii?Q?l2Z4a/6wHoktVCv/YmWw6Bz6nvPLMbnBtJSdtCeOsZ2ihepgBxqFV92CZWPZ?=
 =?us-ascii?Q?68Kqh8mDiJtqpj/a5fvKT4KSDXUV/XmsjwWaguXrPXthIfTbrrzKSuL/yGPc?=
 =?us-ascii?Q?kmU7sYBi9zCdZaoNd+icjiVq5Z1yeaSSTB09fyEG54QgE+AW2m46MAOOfNE4?=
 =?us-ascii?Q?l8YRFeFSk9TTaNqniHyAYVOYsSsi+iV4PoCfeKKnGVer6kJzaZf3kLO8QT8v?=
 =?us-ascii?Q?tgWhD6MGx7yFw8iUR45aSSIZ8hwqbXOe04q+8/uyYQsR70tNYhHDg/zVuXvv?=
 =?us-ascii?Q?l5Xb/8jaRYiNJH51OGb3KSBIePV399B375pLYQTmDy4usFMHql/Ml1d/UCVd?=
 =?us-ascii?Q?FVNprKTFhH8t/WkqEzyB7UffMnTY0xFYtnEQ12qb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bec2f83-ccee-410b-3eaa-08dd19915ac0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:10:24.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1+6LI6ww+03ib7Df7MorPY8xmEmolnUI2sN6rJxyOJUvNzOfYvY4ppd47fDeXjKJNXNhtTqDpTg9FWeCcdGBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f17a185a1910..f404a39009e1 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2204,6 +2204,12 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = fsl_asrc_m2m_init(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_disable:
@@ -2213,6 +2219,10 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(easrc);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2313,10 +2323,29 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(easrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(easrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend, fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1


