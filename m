Return-Path: <linuxppc-dev+bounces-11165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 447CFB2DCBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 14:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6Qyp5HzMz30Qb;
	Wed, 20 Aug 2025 22:40:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755693305;
	cv=pass; b=T+oCiegyveb1Uz/bmgiVzgL6TkuBh2kLbo2zxqaPxrdEUdLAZUDic377/52BPVtHzlbOOGZs3P3XcF01uGnHl2JJZMKxCFwo6a4iYGQ/Dj8BG4U3O20HH1b1j8ZTuqqolG5184uIXTBEDF9W265RXVwNVX2G2syG++VotVhFn0HrATfvZ6vZlrkbFvXcqdSAu3DPkc2gI0zL9tl4NeOTwan12jtyADTEUI8MwjEy2kZ3w7dD6Pnd/ThiY/HJ4gRCQRSdSntvvceai0n/hJrgDUs1cyb8Z83Yq0q44FV+cPr4VRK38s51DQUcH5YqVuQw5ZtXHDXDSSzns/8xM246lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755693305; c=relaxed/relaxed;
	bh=rrEuGZ/ge0YAm3T9H8VR3NXEApCCgq4PKndZr3uDlUU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fhOU8KucLyZudpkOVEU9iFAHrD+QaYS9isPBRRXFvOrA9EGF0oDKPNchhjDoyoaVVGf5DIg+d4JMQZNkDX5ZHqvzWdA2giwbTih6hQmNYj5Whoh4pnq/d83uaf6io5c1HCDQVASlYe00vBbDmNSL1z/dq6kdbfms5L/fNoZY/oIZSnZq6fGhBOW7FAsoQeXxlZIsFDNepE5TVQ2Kj+WWwVHdhpnp0jcvHxKYqbF42gy/gmHZ2xaSbysa2wBCydKXDjri/R8P1DLNQ4v596OS3OLau1ujUDCm1NOK1R96pJFVxhJ+wqTtQHZj32ziQJiIJxFBKdV8uRzZwZd0g0gc4Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=Rdkp2fwG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=rongqianfeng@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=Rdkp2fwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=rongqianfeng@vivo.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6Qrk5jRyz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 22:35:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrSaIjGPke1mJ9uJFAKo/wvSm9cQAv+ZxWaQuBST1qOr/aTRsNipRoNwDVxorIGwq5wKPa7oHPgBrdB9OsN9UY75ZHQmDoB9mxMWidPPQYX/DtgkrsxFOWsgGGbVReOPCizJ5fG+CiGSuLMFmm8DG0ega73AFORK7Rr4gmEvCTlEKx7H+LfbNqpxhk6JjcjqSpeINWwH2RVlaDey8HdI1SNGeyBWbLCs+S9B7E5mvXSN7PmyaJPYwLYlkQGFlQUqV7TCNrvN1jGVzrTQWN7kzaHMqHvcVglU2B0fjJw5PqjaM+gZ3s4YZwKzxZAu2ao8OzYk7kKcrHdT3+egOD8LDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrEuGZ/ge0YAm3T9H8VR3NXEApCCgq4PKndZr3uDlUU=;
 b=Oi2iGzAs6vcLhNRt9PH1G5UP9+B7FAMZifDBWiFxZgCJCx6NPskCNXi24dcyzcqEYVg8Kak+SQ0MeLDUhprhF8yuj+8zhTGWIWN74eLCD4UM0LIUutqMXxd9I6VbRXOuMuhgeeOi95dNrmasVb20ga1MJzjrh7+/RsJtcOmbtwBOSfIgT2owitPH5k0rCYATAqJfInN3xmH/Zcml94gfZnpJxn9EmKeBdRS1x4ERZ4Ewqu9ks7z3yBhNbOAKbS07HPJLAoazZiK35EpRhBCzgRQDHIIQVI3tE3eAFRRPcbrqrO3/9tgQ9Dx2gzEWYPbPaJpYfvIykZWknz6xhCTFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrEuGZ/ge0YAm3T9H8VR3NXEApCCgq4PKndZr3uDlUU=;
 b=Rdkp2fwGl2tB/UxioQ/zAs7Uh581fuUlCFpPk8zLid78ElO8ARlCOdt9jzNhIeB+ZvPJUqLKGK8x4/r4tIuiFgzsXctolHCcHddkUx4zsKi5mAaQF3lQOks/uvcMDrNKVYW0qbNcHIxVFYkFKCB723lHecMvlvNuR0lUiH6zx9vkRckc3q9UMd5LZuh/Qf6mIbYrQBtyUOB+eCN/0Bx6yibVQN2drM000n744rtjyJnKz768mFzqawasqJnWeLswN1/cXZkCrJQ4J0Hn5HyKM1KFheL9Oz907EuuYS+/lwQTmAyqPGjcm8btQYgW94h4o6YaUOnnegMIjGbA+iBZ/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7177.apcprd06.prod.outlook.com (2603:1096:990:9b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Wed, 20 Aug 2025 12:34:37 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 12:34:37 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Nick Li <nick.li@foursemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andrew Davis <afd@ti.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-sound@vger.kernel.org (open list:FOURSEMI AUDIO AMPLIFIER DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC SOUND DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 0/3] ASoC: Use kcalloc() instead of kzalloc()
Date: Wed, 20 Aug 2025 20:34:17 +0800
Message-Id: <20250820123423.470486-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::31) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
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
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f09a36-9486-4425-e89e-08dddfe5ecad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lWaBPJ1COwn9VhB/lju6qq6p6HWXxOEw1zeIVEn54TpRoOrOF1DT5+UT+Ocg?=
 =?us-ascii?Q?1c1RAuitW8wGsBrcnkaiD8nrk395ULih9PR92OEV7gZTY7/dbfSGvEeJlGwA?=
 =?us-ascii?Q?Va63a5alYanavZqH5vDVupIrTvsS3rQMOaWonjO8pHxC7fmKMJvF8CbQ8Cwe?=
 =?us-ascii?Q?lsReIbA9gMhE+3vgxdnuN6bSPs7tvUbj5wZbx/mMk9Xa45QRt6ehpaXIoZM4?=
 =?us-ascii?Q?/1l+GeuGUF02qtKuBgXaVmhSCY77PU05Nqf6HKOZ388060nj1oxMG47AnxUX?=
 =?us-ascii?Q?Jff68lgGP4VE7plsx1PJgKJknUcB1TItR0xyesbGB/Otyro2ZyXM0hZI9gF4?=
 =?us-ascii?Q?XnxzTtL+HURsUu6sHw5h4UPBWt09/FRdVyJh8RxZEXNin04RshzRu7/NImQB?=
 =?us-ascii?Q?9PT5v6Dkr+ObVAs8Gv+tmINB9SSxENQZCFTqqQHlTJW196fr5JaJvjjf25wf?=
 =?us-ascii?Q?QtuAL3cMI8mcz9wiJfa6ChGr/9urLzGyxzGuf+zIZqP/9mcZXQqXklB7AB26?=
 =?us-ascii?Q?S8DcuNWzG1fJoXYRvT/BMGEoK/gtZyYdxqruXS2OBcayudjkX/VvUiHJTWYa?=
 =?us-ascii?Q?E/5eEn6bd/uOPzE0y0sM/zYqKgtHTHf4gy+jI/PK2zDCmVh9p4eZCFLiyF3+?=
 =?us-ascii?Q?DWgEqIKxuo1eXHybM3dxBSaowB+h7emJrfGh9DP3CAFDQtBCOt0wYbWy8Z0x?=
 =?us-ascii?Q?+d/4vf+JO8UjMhN3b6OihO09YDC/mqvtAHnxzEKyUkcxQoKMJ1L59B4NHdVQ?=
 =?us-ascii?Q?VLLtnL9q5n86zafbktRYmRWEHRwKfQOO/8Z9WFHK5E1Kcn6cD8ySxcns2VYm?=
 =?us-ascii?Q?ewovPNjEb1lfTXUe7R2B1tYgdeax8/17FjUXCDfcKvoP3FzN1kFzKZVB1yJk?=
 =?us-ascii?Q?EmllS0pjk0OCP5GOpFINBZRmFHIQIAMLuYF9TbaQ9H2OxbDjRKgLlOiqXJu4?=
 =?us-ascii?Q?+l7bv/rLbvbxbLCsx9q1s2h+wIWZqFltPFf3pSOQo98p+2FvZaTQyUnX0K7r?=
 =?us-ascii?Q?JqtJceoXeC/R9vWt0zc2w7YlNBy4eAhv5YwEEsXsbjWR6DWoWRkJLqtrYxfd?=
 =?us-ascii?Q?U6kDzCR4Id+zqmBv0xMauTBbN4lrLs+TX32ujiCu07Htuy3kavIPUXF1/Y2+?=
 =?us-ascii?Q?NfGu7TfZ6+tSTkQ0qe+t+B/CddBDbM5bfygMMB2qvxjj7E4EdrWvgPO0e+mf?=
 =?us-ascii?Q?8IwAs3U/2zgXvw1hVqUkcfc7KXlLVyxeoHl45OszbnC5ODpkmGIgPMJ7pH6G?=
 =?us-ascii?Q?fgrGigVn6jU1WC496u3Q7ejZi4rzei9jxhQ0AnIFQgRZ5os9lYuR0esf7mu+?=
 =?us-ascii?Q?GUegDctwNc6U/aPiKWARy3Hyuo/Ickbg1zRBdqvgcb6MOFsBPuWHpEDJ6O/R?=
 =?us-ascii?Q?SwufYBUGQfNl5BrM0G20B2LNBBSkS8PBJrWOoyrNNwXtBW7PhhJ/D40VSzaI?=
 =?us-ascii?Q?l9pqn6b4dVNutLPBHqO8zckuLapDRH8+NSNiFETIxqwDwW24mPoBfgJs9LCD?=
 =?us-ascii?Q?+5nZAW4i/txYMT6PH9D2UyLFZ5kd83SuTVS7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/IA0B84r1GFcleSxzjE2+M30p+ZWcGATpFjso5LUMv/4hqz95HUWACpSgXL?=
 =?us-ascii?Q?bW+OIJymNeDjAQrCwJ6NLXm8PSdAKMr6lsX2h9Sb91panc16mQ+lKFHn/vnY?=
 =?us-ascii?Q?UMnY4XwkI4RrfkHK8aHJTpbmKYpPhWzk1xUSVVP1eNHDSjXnHPq6HmQl4k+T?=
 =?us-ascii?Q?xUFeDN2kLitPhlCjwwnQSxtBzCkTWqtWw2YpRpm+Nc0km31t9AA75XnS1nIN?=
 =?us-ascii?Q?/PxKQz663l/aWiK8XOtlSVWRgR3wJB+gORrAKDlzroTITV7qLZSiTp1V7ElI?=
 =?us-ascii?Q?Cq58CSc4avlompMEeAVRzFpbikE8xC1LfzVcJY5l7x4HtEdSNBS25gz2u3ug?=
 =?us-ascii?Q?ScyZ9nh6gjXAD8JfnpMiWD+WtYxXsApAYzQD1pAT8RhSWdOFCJ0vrAYjaPLf?=
 =?us-ascii?Q?bE8SDXrS79y9udPTBku53PVvyUcSLtSTgKqb/Hed+/QjyFu0WKUpvHVb/qSB?=
 =?us-ascii?Q?DAktQk3bWjyKLn+0fiBq2PFZv8Gw288eFMafOHI4qgslTVJwbbkAJe5HFOdZ?=
 =?us-ascii?Q?VBFd/YooBVsHWm5Wh5XmLOlFV8mDkzdHFBclKVQbR6njtLPjlkVdzRv2UkCB?=
 =?us-ascii?Q?z9g8XKj9aQv6Bd0e0A2th+wkj9DUZe/R7A2YuxtjNWbPSfxiBX71ycW3jEKH?=
 =?us-ascii?Q?mtcxYGHzUjzRcRQfax1jtoAdxkfovDkeoQRxBoRzzzqzkmdrXt1L2X0EpiPg?=
 =?us-ascii?Q?rWUl245YzFX7DOG7Lyu3qASNRAIv1r3mvEWQVRY3Fywen+QEy8Mw+M04iBw7?=
 =?us-ascii?Q?TmsqvXvp3LDCwIN3h9NbPDDaomihrLRl5XN6BEbuEbjD9ZrKvhRonT93ij2T?=
 =?us-ascii?Q?ZYc2kvhJCKar1ZusxQChgqXzFVtxXbn28w3xn1C3YxLLnWyfAWe9iKYEBLN4?=
 =?us-ascii?Q?R5XKJJBbofenlODDJxkm5ehDLit53rY+mM/8s7taDubEWfJ7L5RZg86C17Cb?=
 =?us-ascii?Q?JHLvoapt6tnU6BeFNh1bsw6DrJjcBjwYgNu/f7k23Fo2Z1iHt849EIfBVtmd?=
 =?us-ascii?Q?eeZkzbPawvEO0f4rzvuwmJTJSaFJ/ds1VCWnNTyBi9wYERMGDFq+b7P2v3+P?=
 =?us-ascii?Q?neDupjypCwbG7upq+RCHumND5ibAMOAb/KCJN/GUc/MAtz2oOPJhuGplu5Vl?=
 =?us-ascii?Q?lw+jvz68BwfSmfqaDm02Z9NOV/3bya8z+f/pxQrHobTfYKNB6jCWY0hAm4Z/?=
 =?us-ascii?Q?gAlPMGQTMl6r48wJj0+sX3t4RF8k8No5ASM0aJVGQ1f+6k22LUYHMp+vIsB+?=
 =?us-ascii?Q?YYpPKos0h9FcEcYhqjDFGmNLqxze2gQ8m3Ftgd+CX1y37D1yHao+vNj7yiQE?=
 =?us-ascii?Q?qiCUcN2PKJXlrvYVwL1eL28ITPP2u9FqKe2R946BVIVPz7gpC3HXFjTdwE/d?=
 =?us-ascii?Q?gKS1qRyCEbUo/ny7h4txptuz8gmQxQm1pRwzHqimOceF1R/2xym9PvxA2bqV?=
 =?us-ascii?Q?PfHNi+JVRTYvNuwL1bG4+R9Usy3Xo2h0VodlxLOLdWzfmYwKiCAVbkj1djeX?=
 =?us-ascii?Q?H9romsTODrLbCJXkR9yFYS9HQ+COLn3/MZEBUT3IwoCaH1x9y6aKQGcQw4mZ?=
 =?us-ascii?Q?NASYmasSQFARCgaKK7//G3qW/ZcNPrkOYJYxl7Nw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f09a36-9486-4425-e89e-08dddfe5ecad
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:34:36.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43o2CpXG9KbMFNXAyzZ9blxwJ/93yzReYjaJ+hXjug0QdExgAdfEZ01Gj0EO5p+Ki9ikebipNZYzoEsEUQcJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7177
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace devm_kzalloc() with devm_kcalloc() in sound/soc.  As noted in the
kernel documentation [1], open-coded multiplication in allocator arguments
is discouraged because it can lead to integer overflow.

Using devm_kcalloc() provides built-in overflow protection, making the
memory allocation safer when calculating the allocation size compared
to explicit multiplication.

[1]: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Qianfeng Rong (3):
  ASoC: codecs: Use kcalloc() instead of kzalloc()
  ASoC: fsl: Use kcalloc() instead of kzalloc()
  ASoC: test-component: Use kcalloc() instead of kzalloc()

 sound/soc/codecs/fs-amp-lib.c      | 2 +-
 sound/soc/codecs/pcm6240.c         | 4 ++--
 sound/soc/fsl/fsl_sai.c            | 2 +-
 sound/soc/fsl/imx-audmux.c         | 2 +-
 sound/soc/generic/test-component.c | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1


