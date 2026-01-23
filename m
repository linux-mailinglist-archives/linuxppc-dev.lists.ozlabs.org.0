Return-Path: <linuxppc-dev+bounces-16219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MpwHKUwc2mTswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7F7271B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy9xM0MT8z3c1J;
	Fri, 23 Jan 2026 19:25:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769156758;
	cv=pass; b=AzBEo7JbzbSGzJzniFC4K/a7Xs4k8ZTGhFT0/bSSALc0yOgEWj4Zg3rT1yqqSidlcK3wLlm25PVTb7N/2IZl1P1ZtZ05o5LP9BQMjYLbF9QEOO4CllWQv7i4bq+XWucwhOdfm20h1MDWXCSbtlArpSKevC1eAxS6U9UjvOsRUhFoLmP4qOwUyb9mv/J8f5KdKw6BQlhjZ+nn2MO2jWXm5kn4FRA9oPlX9yXaKbigw4YvfXZgDWMWhap/hkN/G1rK1VcL3XwFEhj3rDXCIm9lC7NxUUOosCUSh/YatFftxTaYf4jwxrN/pvlvVpsj0q4cszPtlGlx7I8jOBvrCJ+vbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769156758; c=relaxed/relaxed;
	bh=o4jST9vks0Muawu0iPnd4u6NfR4bMuB6A+eHn00mAMY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OHVnFTyvxG4GZmB3VLKfNuytxvXRB7+CLcg9oAx6vfM+Fm94iV3fb73vRhjSgIrcoXH7TR2qNLWrLcwJAmGjDusWqQgbzliPdn2OYjJBALbz+PIVTMxozaKZ+99DoGf78HU2GY+PE89mRAMOdJuyP4ajD6pa9XroJpSnX+eKNVWR5uBx4X7RlwwyG8WWko+lV8o72Cnw+KUlDs3VpRkaW9MFO6cWEsKR5vNs+1S0vDO8Ee/CubO4W6Qs6IIYPgP3HjffW9YUJMH0CRVCTU1lJb3/8p0UFOZBTT3ei9f+uUpKNjnYdhqjwu/86ZVTUoIxnYSu5nwsPxyMkRj3pBkqFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KaSFDouF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KaSFDouF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy9xL22Gnz3bmR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 19:25:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID8TXJoiEkWM59hP6eEFBfxW6iwgMJldxgR/etg1tJOxukMWUxJKVBala/DYUvtNkJHfUBD/ZkUR/S9FQl0NppBKMJdZkGxlzudMAsDVnU9BbdxQqnTGKRLBnZnfE4JA1Uh3H09FU110wQuxbKqInMv26ayIZcpa6hr8gGbMdv2BzcFmlsjNDHLbo913zcEG3PiekVWoNuVv1iLVpe0uAaJjlasI9poMX6+Hwwaf2FTuOA6Ardb0uSTlwHz/0HJDczbdD1A0jD8AzhRYxBKUDAxoLHOxfi8HhvuUpRCl3Lg53bfT3umk2ymdYy9MTWWAfCtnkBlsq2bv2YL614T+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4jST9vks0Muawu0iPnd4u6NfR4bMuB6A+eHn00mAMY=;
 b=NLDUD2lNzFZnSuA4VbL5a5/7lOQJ+zzZl7DNrOhbefKJneJnS90HuTIXJwU/ecoiUL+DR5FXimrtJH4vNvuxJKuHq9YXkRApuNinL64VLhi8o2owL4pDSTaGouCopLESvlgHOH01511IKMlqEqnQslrer4Bt+Yx1dfCWIqYl4hEUGcqXR27OS+V0fWPSXExX44EuyL+Dqr5HqKHpUl1QkO6g6u8WScXZNYejUMCOiQCVIyd/Uw1uXc40Bxpz1aEvP0sHDFZWfPAgpob6BItbLN2ordg2de8WUxjaJY/GmYte5CnCXiIAy7dcP+YHPCa5xxKkRVVBtdPYibSjsgl4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4jST9vks0Muawu0iPnd4u6NfR4bMuB6A+eHn00mAMY=;
 b=KaSFDouFi7leVwWCk0zW3EyETkby9oU9RSC8LXTD8kjgaEkvzbKRow3K2oVhwi19f37ym4AMkFFVPbrMb8FcrxE51wbEf0LrxFbmOI9VnGe0cuQRQdiSxKv4YfdVWyRttg0VVXgWVsn19xIICCOt8b0yz3vRibICxiqE9/9ifR3JP9DCAY2Gg4CsQ1DehlgMFEmkpRf3+VeEou01QAk9Zd3LFjtbibfGvZ9YC1hsB6ySKTV/4dhr47D15xhTqy3URrzmDhxt4cQ7CrwpjfQi8oalfpHZnZ+7TaAhyI1nH12C7L7YehUrx2s26miWockuIcjw8PJ6Du4dwPreb/jpBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:25:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:25:38 +0000
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
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
Date: Fri, 23 Jan 2026 16:24:59 +0800
Message-Id: <20260123082501.4050296-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 814a6c05-882e-409b-cf39-08de5a58fd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n+BBfVr5dku0ewkV/cnupZBo7oPeB1JbBnhAjnjfvx9rM1bNVjC1LYHd5FhL?=
 =?us-ascii?Q?UPs5RorbSZ1IC8iU//Uw2mBhhI6oEySIh4cOq/pjDjZISlY4SVrDAbeFNDX4?=
 =?us-ascii?Q?nZ99Wn/udcNoXMZNe3tk3Q8TcqEdwHXL6b4T7tR2essP46AmELKxukQDtKDj?=
 =?us-ascii?Q?UoIQSMXprYO4pWMKMM399XeL3jUNeOmcVhoIpZpN+kULzQmn7oYwA3SMlcu9?=
 =?us-ascii?Q?0RUsQqQwddIBi5tAoxYyeiBsvuvnHBqOInjlMBYeZE64U72mFOJnLYYdyL3y?=
 =?us-ascii?Q?o0sDMeHh4qmvlM3ZQ8vvgVPYgc1RR/UA6jrDJLYGjFP9mWEZMUF7u9RQvJV2?=
 =?us-ascii?Q?2DcqF8/RW4rX4+H8A7cIQFKcgv23hkfjmrMYpb4BKPwP4JmuEVHTPubw6KG/?=
 =?us-ascii?Q?jWKRW5HoLxMRUzVB3NFQ0zkuujXm4SwyrFJrFOQZIQzWQkFKJqWRKFyv66K3?=
 =?us-ascii?Q?8pBv6nLPbxQ0H9RBir7MPrs3t3HtTuccsYTAVcbkkGMcHyIZdSTdFTh/YFBz?=
 =?us-ascii?Q?i6wJ7v3YijZ911C0U5L2B3WjXJjTdMHG3sapWuegrKEuH4/XNQvzdgMsebdt?=
 =?us-ascii?Q?irUps9M212zJOKW4czc0bscU9lIyeW1rih6tHfxtEp36BfuAKEE8P4bnyTJ+?=
 =?us-ascii?Q?dnPzuvvKctMBDkJbe9RUFav86so9486W5WYiZuh855BpdbNZpYqPyOwiVIWm?=
 =?us-ascii?Q?cqVXVldnj7kijvcnvOZSjXCmy+oKzbHgS3l0MALPsEbVbRM6+sz5e7ijkxpf?=
 =?us-ascii?Q?qTCvm1h2X+y8GL0pcOgXFHzVvRYWXDOHgyv0jWev4L/h57FaZ+wKYESoF6gc?=
 =?us-ascii?Q?ZlJfVZ/rSyK6btT5HW5cSzvt9TlBjEkulZBr0kLholCygoq+Q2Pu5Gauddev?=
 =?us-ascii?Q?N6ZdZclwxUzyUKF344sCfftsPv7yGxnIf7cz/JYrcm8EQF0I26D+s48ND26q?=
 =?us-ascii?Q?u7/Xva/2iG3sUvVsVlvXguqdyvCATUw0bbteoCFqotVOa/aNnorrWiO8qO8J?=
 =?us-ascii?Q?dpj8Jq1mrhSytym+EWlMOSa+H+1098qjJ7h8BypubBha/ycMmcG6x2tH3GOI?=
 =?us-ascii?Q?bH3uCrM/vg6oSOB9Vt7FeJg9RXza7o7f0dvInPjT15kASTvVX/MvCnR5FiKq?=
 =?us-ascii?Q?fshndNccF7ui9WgRuEqJolyVp3CwvSVzbKyG6MG1wLxs0fAYy+NbB9vgPO+L?=
 =?us-ascii?Q?gnr0v0q2IEkYlAi3X37jlN49vreCpaAPnjYWiqfSBQKlXmFwCb+CD9vus+MX?=
 =?us-ascii?Q?1SZy8TEqqjf4mhXkk5hQvPIdZjrZOjb+qqHw6/vIXzCYpuK0kfQtctOoiFh9?=
 =?us-ascii?Q?cLFUb5F+EoIhJZlY4fEXj5fH/PjHCbEENpA8SS2wKgJmldu/E6YyeV2apOMg?=
 =?us-ascii?Q?HP0Y1+ywe5bdZV77Ij7Fv8YCa0kJOsIb1DX1BQP0V0SXkE7fLvCdKtO5TKg3?=
 =?us-ascii?Q?EHHsZnIPGHajQ4R6OEVIzP85yImp5m8YdfoQsN9LXjM3Hu5EXTn87qd1D+7Z?=
 =?us-ascii?Q?wjX+bgOttVVk+NeLDQzDBndwFd4udwNy4rLMA1olD5qE6F9v3/y1KiHrOi7G?=
 =?us-ascii?Q?YKgII1EDxGJqdVDOiklgE/bYpMSUhCfRTguAINybrFVoW1BBp9NTADrhrryj?=
 =?us-ascii?Q?eNl0dS6JXxDROgiCSdUEB161VmRTVrxb+6x6hUhJDArr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mn/AqGf3krexjMXOitcEofnLi9nvfV8YzMuFpy7oNNsd1XxnFu++9H+SVKIM?=
 =?us-ascii?Q?m+VmwUBkT8wUb2ojweYXazgpOUlXMF8kZ3QSnS6fLJAiTQNoWDGuIk8zWQ/0?=
 =?us-ascii?Q?ir0FhRMqkj9Ca7G8rpcK2jRnyjverwSbI0GH1+eeHfxg3CMNSCzwjLBLELlf?=
 =?us-ascii?Q?cQy/O0zZo4EXEERqJh9YKguKyUvQJEcChPlTr9mPR++hZKAl4lYv6Cf9tgOO?=
 =?us-ascii?Q?A5NqmQ1bRCq9IxewMX1RqjOfXDnackadCBPp+TRc/yqwZ40dwRgvIiqAHt/v?=
 =?us-ascii?Q?5UqIMxqNbqaLEmQY3nSgYyIl4GKJHcmF+S74j2oQl1oW03AvkFhS7ZAS76EW?=
 =?us-ascii?Q?Kf+fGlBF+fEoWUiBFWkiqA2x9CFWXdh5BW7IbjIdNtUk9e8fVTZme871h+sR?=
 =?us-ascii?Q?VXE7BF4gx97ZfMgrZDhc4fLnHAIkvqrM5LqyTiJt9T3brdwGllfOECnlfFTJ?=
 =?us-ascii?Q?K2P90AwofN6v6pT3U4WXDHuMbpe10MZxv8RKnNEWyDY/BddWqho6g8j8s7QH?=
 =?us-ascii?Q?c5wBCVQ4x2c0YhUcV516cbP8TaNh1AORUgYt84SdD+yo94BEPQQY3l9k51yu?=
 =?us-ascii?Q?taKEEBfTvkxXmpMFP0uygx6mA3Oo5kCoI0kXjlE/lFc1FgT2TtQ6oZf6bQcg?=
 =?us-ascii?Q?W3B0NcX+Bz9Yk60Emy66qv3U8uR6PyupK2NkhG5CXZrp+0OaUOOu60cm3lqX?=
 =?us-ascii?Q?Q66yBKowPdJ3RSXg9VQkn0Pm3e1+mBU1gL+s/kRuixTmq46aHvDzxczaGnHr?=
 =?us-ascii?Q?rHGxt4rkZAKC01mmvb+KpH53j9lOu+4AhzuO9OIh8ixSmkqyNAurTzXpp49f?=
 =?us-ascii?Q?m2YRRLa143PJOejkhj9az+JQEv6IzQNYzP5eU0srVu0/N5AnZtqNssIVfzcz?=
 =?us-ascii?Q?Ke8qn7x8IbIU72ZfRR8hQ4Do3KpGWGrRUFb23pQM3/MKMjpGhu6bHF5xLxUf?=
 =?us-ascii?Q?nQaOMuaAdaJeLiIsxGHk+SrX9y2Tdgpekc4g/95k/gLEkm0m6U8ARMasNgxA?=
 =?us-ascii?Q?rm/fHFoPbQxxmTp7qbAWPxjXsbGyUY51tOGrz6GK38yPsGzLc8IDNFL0JsNg?=
 =?us-ascii?Q?Wb9tYnG1IK97QUKVgf/ugMshFuuicFq7p0bc+1Hl2h4xpsxkENlJt4wpUm9s?=
 =?us-ascii?Q?XjJQus/O0C2jgeM1V5L0WHz1dVUR5//odP0rsollK2kYu79BagxpDztdiWCl?=
 =?us-ascii?Q?NUeciMgvEH4BYrOqgW6ifuljH0cheNwTkMq040tcUFmgju7idqegVwcu4LHs?=
 =?us-ascii?Q?aXbOECdR9GeGCQci676p/fH1xD5SxLwKexI82ZrjCxHN7GcDBnEZDRfCBI53?=
 =?us-ascii?Q?D/EW7CQIBxF3FP/VN9rNJ5nUHU0uJBRgqKG+1Xq5ZFPAB316KLHjaKCrM6JK?=
 =?us-ascii?Q?9Tk6LuUiyZ4XYZe6he73FQ9sd7hd0pLvgYKA5CNT0aYFMD+t5d17T6fBU1S1?=
 =?us-ascii?Q?sQIAsgS5QjYWbLSn0DnG8meb68xcMlduAtOfSw4Q47OtcoBNXGtK8d0WrtX1?=
 =?us-ascii?Q?dBfSbl1a6RvKqgRUc2e51H/hx//fX7EC6SlhkRZ0JuOlws+JAJuTQl7Ed6jh?=
 =?us-ascii?Q?7KMlH5e0WFcibrjVdx8Gxia7ADt+SkGlrxdbpmrf6v67O4ptFVmWghBact0X?=
 =?us-ascii?Q?5RzV7cNhwzVtkkCTSDJJ92LYMd9+L6dv2tb/K1CXgD+fEW58mAcesgv3Aapu?=
 =?us-ascii?Q?rwe63FCBUFD4LY6rRE2fdGoboM7GxYDXeTNT6x9bGIB9JuAVEHPT03CMYxyp?=
 =?us-ascii?Q?tmUwm0TP4A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814a6c05-882e-409b-cf39-08de5a58fd3a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:25:38.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHvzlwyOu0nV1YEsCUEq+AUy2AhOGIEkz5yY5vqrxteB6xmzx/VYn0RacJWfDu+QEw1GanI4+NqGuFtOR+UHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16219-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.849];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 8EF7F7271B
X-Rspamd-Action: no action

The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
i.MX952. There are three use cases:

1) SAI -> Codec (No AUDMIX between SAI and Codec)
2) SAI -> Codec (Has AUDMIX, but AUDMIX is bypassed)
3) SAI -> AUDMIX -> Codec (Has AUDMIX and used)

So add 'fsl,sai-amix-mode' property for this feature

fsl,sai-amix-mode = "none": is for case 1)
fsl,sai-amix-mode = "bypass": is for case 2)
fsl,sai-amix-mode = "audmix": is for case 3)

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index d838ee0b61cb..83b5ea5f3d70 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -133,6 +133,13 @@ properties:
         - description: dataline mask for 'rx'
         - description: dataline mask for 'tx'
 
+  fsl,sai-amix-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The audmix module is bypassed from hardware or not.
+    enum: [none, bypass, audmix]
+    default: none
+
   fsl,sai-mclk-direction-output:
     description: SAI will output the SAI MCLK clock.
     type: boolean
@@ -180,6 +187,15 @@ allOf:
       properties:
         fsl,sai-synchronous-rx: false
 
+  - if:
+      required:
+        - fsl,sai-amix-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx952-sai
+
 required:
   - compatible
   - reg
-- 
2.34.1


