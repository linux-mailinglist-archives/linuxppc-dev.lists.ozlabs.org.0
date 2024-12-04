Return-Path: <linuxppc-dev+bounces-3768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 067F59E331E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 06:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y35nL0GXnz2xyG;
	Wed,  4 Dec 2024 16:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733290485;
	cv=pass; b=WOsAIx1SYLS4soYmTVk3Xf8W2WI2dlpP8wTQNHMR2e5Ufg/I1p2AUKt427wqK1NBvsEQ17vlH7SVCqNOBz3Cn7rF4kmIvgyJdRPYHJ5YJ+EBmYnY6xbldCKqFgadHmnWn/6mP53/P7urcyU0rw+RhJ0xb0pGsR2s1tyqHt3xqCjPG22XJ86hthaK2OgblCr+Mzk897BltWjwNwVWSPe/POKeLOzVxYT+lhD6CETQizM+pUgNEkSZg9Ws5R8g5CcvYtOwz3JoQHyCZie9ukNKkHph8JWnK016wxxkoPCQnxCzOTPr75yOu8Tkm/EM6eB41IBCKhoyMB7YZZpVojs6gA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733290485; c=relaxed/relaxed;
	bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k0yOI3C804FcrtD3xUqpTivNvxXNYtnWvoxggE0k9ehpXXyHXHy1ERorUYCI2tFKbkGgQwVciq6pz3PzM8hWOZththEMGXa1vw/DCK4RvpKBc9vVvpFN4r3+XTKL50dFje+Ep7OSb6TYdgpE/DmoznEO1vAMYkDPqeCtLnmlHfnKIdtxEzW2NscaN1nuSCRoJCAR/9s6Gq4+gZhF7o/5tiyyRu0gOdm2GCdmSHTrUjuCOfpdUiKrSbiEK1Y8AkiCAl30CSVHdCR/H8zlU6LX/wOVclr2Fpp+Wsg5cFO868/rfyjs1zGVPozUFF37bD7Dd1pLP5Kx7KvmS6AXjkZLmg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ennPkD01; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ennPkD01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35nK0JWcz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 16:34:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKxCbvvS26GQ4u9omof8aZthQXT9q9hXF4dL11ZZYIV2+wNS5wKv5oj+5kVdCueil4CrBn4UIfs48EWbTJ7IVayZ3flLx9J9vceOKmBgmeRy+by2+2VxyD8HPvBhSVAvnJ5tOJPqg0LvkLXcyUoqi+RQdqhDAc3EpA0m3l8tptGIZva8sARHlasqwP+3iFgs7EA2ATObuSfYM8KDwPKO5aQrnxQaJljIfC+C7e4719zdYCPpJX3Jq+/eO1S2fobiITha7QE5tSp13y7Uqq31X7URoDM7LY3MpPjBfv0IHWeRxmNFSpMcy9ySIT5KyS3BnFfV0/GhYuGFma2iRZVrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=uIBxm104xp3ua12/0OZUyiotoy8bDG8UqUDGQqDFkEjGMFLoCQeHO18OBaxtbMp97aaDbk3K7nTEOy+FhIjd0I8MSofTL0DPc43DWK6qLYDfW0FWaYUbXlv5PrIlGKIKOahEZnzbUugR0NCzVLGoN5FCTXVjewaphxgcAqMEtigcEOvBGhP3Kq89LCv+FvrAVK4P++o7xJDpl0L8fUkVLV+/tjvuHR5iRs5J3FV7XfqJ+oxu65UmKnkes2YlJnxLTuTAvsja/EZaKSPMSJU8/8LeerEBQiR3T9TWQI5TinOGzqlmI1NDfKJtazgpmEEoSR6Y6fjCnH5sBwJx/G+JBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=ennPkD012vrWxwf8kSqCK65SHuBaOwWM1M/LHh6kYhNPI60gy/k2PHQ3LGk3li+UJp58BRXak84/J0tDmRuz4zmGfgQb5WmxJFrTfa9i2jl0nYAOKGHg7fY/to184+W/FQbX5jY80hphvJVhP6KGz1uYeN/KRaOT3gi+k7GVpvaNz6rv4/YAU7BPYQ+qyb+VL7l6CrlrYV2t0kkF4revpiyU3O+ceVLQZoKcLadI9BUExzmFh3n1r/35nkMC87l92K7aZ0JKJO92QBb9A9YfQSkFpzG0FTJL/1uxjkqvCn1a1ppNv1X+f2UBBfozL98kIT7NCtWJ9eBqYZ/wzzh0Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:25 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:25 +0000
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
Subject: [PATCH v5 RESEND 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Wed,  4 Dec 2024 13:33:42 +0800
Message-Id: <20241204053346.1865723-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9a8427-37ef-4a6a-36e1-08dd1425506d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k6Sn1y5An2d0Rl3/+XrPdMRtdWrzY2jh/EQ8croQqDy/FM24g3JLc9WW2/0h?=
 =?us-ascii?Q?Z2O8bfSWcvyMFrudg58p3bdWRvVhNrygOkTpKkDFTlEhhzR+xRgwb92LuZZZ?=
 =?us-ascii?Q?OMoS/CaSwxH/ibqpG4/RSdDyGp6BGCOk6We3X/mcruHYX4eIp26xqt0YCstB?=
 =?us-ascii?Q?OmgCU4iiCBSZzZ+sliry0ND7eEjlAPFa3dWONNHyekY66Ei35a+2QUCr+9Yr?=
 =?us-ascii?Q?LaqSXuEW89npgJ/bdkXMcTNin0cZzuWORY8aXw9whwgMIf4suHTyqmtOf4kT?=
 =?us-ascii?Q?DQ21RrjWD25J2/iJweEQPn14GjOl9LtUVbgviWkJIvQrZPG04UJ4CoNIRnkk?=
 =?us-ascii?Q?8y+r86wZyLTH6hzod4JD9JKqqzuTWy2rXhEbdcEO8UnktxkibtqvAFDCCuGG?=
 =?us-ascii?Q?Jd3V4yfspzIaBa2AqKkRWsJbY4nIT3IFbSYPzZc0FwIBBnZhFtFPWAnYjGBV?=
 =?us-ascii?Q?rQdNkKGiz+hJ4Vfmy6d8tayAQCYLuBQ+OnM8IzHTUfqViOEZ3CHpxQJnyxzN?=
 =?us-ascii?Q?7Z+RtHIQHBZH+fO2Zh4NosqY7x1RcmIU8AoxhYC5QIKv1ehDkbdmVu5AVKTP?=
 =?us-ascii?Q?/eaE5RAe15nAmohh5UKWHUm6NobOmWe/RDbDyTr8Dm6MBuS1cEwqc8qCInxj?=
 =?us-ascii?Q?sb3Ettd6GXxUBFbVOTZzpn3xvvDAB8BN53jnr9tL8+oUxRTemkxI83wOw1ds?=
 =?us-ascii?Q?ZX8Nz3cwPoWy+3NjURIyC73OCDPYpimYON9zxp40OUejoNXJZ3ov1/J5yCVC?=
 =?us-ascii?Q?Z95j6A+k2YW4xSaeO4hEcem2yet6FxsUTt00wN5T5v+ZRgD9L/1VZHDovjly?=
 =?us-ascii?Q?xDml2hlqF1wupA8MQVUo2taLioTulwo5IjwPpePhbJjfg2uLxUGD8y+iQzUH?=
 =?us-ascii?Q?fRkJUL/1cz0pN6qlLuqcH/5c4mdGhitSRJxslxIPRMmPqqzFU1TaZIB25TcL?=
 =?us-ascii?Q?F+Qkvyg25IB2aHyCOZ1sUfsOlQ2MNcyzdIDr/mHtQjMoYC+M8v25zsYIP8Ag?=
 =?us-ascii?Q?9nmWUS0sFyQzFgWuyKlokF8bWehZ6gCsc+NloC8hVNECqvT3DJQYT5bFSPGR?=
 =?us-ascii?Q?m4hlvO7psn/rg/Hc47BJK48kBt8z+WWnZrn8cjvW1/+R/dItZJJqQZH0Yq9J?=
 =?us-ascii?Q?tOgAOthafD8Beg15fSX6h62JTLoWfW7bLSrkd/u5PcgNPFFK9PqCZNBWvBoP?=
 =?us-ascii?Q?wIZuXPLMPrvVz0Y49d6s9JvhVap0hhzhenCRzJbUwgySfe0IUIA3+4t/QpYE?=
 =?us-ascii?Q?gI7V4QDxgfYm50YcSOQP/r6kWpJ020t+HCJxlBkjtoVX8FrVB1P4buo3CY0W?=
 =?us-ascii?Q?ah9CuyB81tdHtTYi4zF/B93YjqxjNi2bTlDj9c6huGeiL7clzyhTol4yPjOv?=
 =?us-ascii?Q?mlWrE4EJVgXkbXaYzpJ3p3lPRJ5K8mnawUpUqPKNtqY6JVSTxHWF3tYUvdUj?=
 =?us-ascii?Q?If4UhjqH4x0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/q/mYeG8FRKBcLPAdg9Nl30UV9rKcAIiBulZEIfkWnJI7cJDcQWYiyXSIK5?=
 =?us-ascii?Q?cui3XXmNM1e3YzIm+O5SNo6Kh0OLJ5zo98Rp28trKWg5lK+Imnm4MKpAlYOX?=
 =?us-ascii?Q?8+cCiAO6mpSoMIpE9CCfict2q0OjlQytLQZPMrb+gCROGwYb3JLPveBox+HO?=
 =?us-ascii?Q?/71nE+W/2c4zNyDKyzMJdR5nyPlJrGOE8AlvZkecOKS5PnGyTqNtumyRDgeT?=
 =?us-ascii?Q?+ojRL66oZNU8fiiSGeXojT6I7ZBpLGYQY4ogACfpriAe8uCqwpisyG4XezT3?=
 =?us-ascii?Q?NIlY41GBh8SoQrwLInx4S22ehUj6YkWqqf4xfxuC3A28my3Do9VVepv9PG1t?=
 =?us-ascii?Q?xt1Htdi64O5ZQNCYnl0rE4ZpEJMsdZvlQ6JqTbm9lhKWljxSyulGcohar7px?=
 =?us-ascii?Q?KlPQi4iLMhQvrjYpqtYxwGiHZTs3iRd5lK6Kq5VJR6QF5fqSqolTCyI/W69w?=
 =?us-ascii?Q?Xxrun3cUz4FhjOH0FRx5guRFnBlbdmjof4n04T0quGB/H1uGQYvKhJfIgK8H?=
 =?us-ascii?Q?LUVsM+gogaIxr3rukW1myoIZSRAzvKRvZKFp+UhNZoJy6fyTvgMGNaN9MMGD?=
 =?us-ascii?Q?XQmA2njP474ZA7wPD+CE0sv2AuStpb/eojCDQfBpx5nvgI7qBxv3eu08WB5G?=
 =?us-ascii?Q?EG42WIS0uJO5zdDwuoyzSXG29hxJ5a3XUGcVy/Smau7kyJfgL3wforJviz7t?=
 =?us-ascii?Q?7BnQ7Scw8JLQoxpu/5VmEaYprwlgiAgZHZXlWFZ5R5vpGd0fuLEo6Q2blMT4?=
 =?us-ascii?Q?GHEMks2pJZN5STmerM3JdtNvxyjsv/fCtfn4tkVP75Ox1rtefn6F0V2gMEr1?=
 =?us-ascii?Q?MFigDS9WBG+kGY2/eZ/OyvehZOYdf+eoEe8agQfqTkIkEXPpY02hKfiWN48e?=
 =?us-ascii?Q?jY7o3S+lFJxsLJP4YbXlAzZKRAvEZRiVDiLfd4xuqw9QBaikkbeS+gk8ZV6j?=
 =?us-ascii?Q?e5i9cOA+GzuqMANMmCTF3x9bMtysscG6tBr2OPTpJtYtQeGKjdjnSO+DYMQj?=
 =?us-ascii?Q?DKhR07OiXLiWgXVCzsPvDyPoj04iffl6CEwDEvE9ASr/p1dvrx79H5n0oXOF?=
 =?us-ascii?Q?09rVxoA8hU0XatyOhPNufrSlK9lZs+iI+GtaKsE3KJsJJSrGY8NtoqYOPNq9?=
 =?us-ascii?Q?DNcHS7rC2wIfJrrNdUEENYTqi410vYwYR0PAzO9TwSmGiALmNzz7sSE46Jqu?=
 =?us-ascii?Q?BQguAojM7k19BoS+dpF+2awVPJ23S6xB4TTTrzQQBaWN3YNwG7VMcaUGL7x6?=
 =?us-ascii?Q?fw9mQhhGhghqI7ewRwNKJPv08NbD7Jc9Y7GgyGdfOC8RsEnmHylyWViHVtm8?=
 =?us-ascii?Q?R5uwpFI42qLewTcfPaY6QvWvzatzCVcvkFpY85ddv+lBdsc2f6JbKvtI9aKJ?=
 =?us-ascii?Q?ZOA9/x74wJaE46seNdscGpRPVZj6HFGDSCUqbwTeujfwb7CGYDO6iLbYkJ5p?=
 =?us-ascii?Q?/NlLVLyxPlVhPuPn18iP9m8oi/CUUisOIKTDU5klFjf+PPDhXQNXi1HYH2mF?=
 =?us-ascii?Q?DXbi488oammT26imTNmwq0oaCEb+nTVxZfaUEvojwzI7HB75ap9vd/cgAr/e?=
 =?us-ascii?Q?AupWw33cJm58t1XC0/bCcuC7pkePyxtUICt+hH8l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9a8427-37ef-4a6a-36e1-08dd1425506d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:25.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02TWQbtktz0MaS/q3yiycMHJTfNxaSKm9oqKdswlsOj2jG/brKUuPzqPUEyelcMtS5VWjJP4fT7QuiWh+n8gjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c        | 142 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  61 ++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bd5c46d763c0..471753276209 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,139 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+
+	cap->rate_in = supported_asrc_rate;
+	cap->rate_in_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->rate_out = supported_asrc_rate;
+	cap->rate_out_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1280,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..3bdd6ea07c09 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,26 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	const unsigned int *rate_in;
+	int rate_in_count;
+	const unsigned int *rate_out;
+	int rate_out_count;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +54,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +76,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +108,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +144,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1


