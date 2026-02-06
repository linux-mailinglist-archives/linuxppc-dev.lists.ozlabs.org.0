Return-Path: <linuxppc-dev+bounces-16644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO5gNU9IhWkN/QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:47:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078AF909E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6cRM3pNSz3bjN;
	Fri, 06 Feb 2026 12:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770342463;
	cv=pass; b=LY0ZSvQ7Gzn6RwQGXTLCUay/TpPtQgu2eCzgY6YNEKtVcGtVf7U5Ro6/8702nU6YKQNLGun3N1e81UAOxl+ZUtJFbfS1wvLaTmh2VrdpuaYtEKpzvRmlvvQS6u4gvr2wPkkfCMXHKKCU3eymrEpUpiuhSbv8ms3vJI6Qvu18AeVvk6s9IsoGAvoSvwyi+jj1vapTfKBFKlrt3aTGAv8b/dJub112NjkZy9CUOm3e17BEyDRppkg18nK3dco1zd4k44W1mog+SnlRBkXOn7xTGStELKZLM64yeEU3GI+MkKW0zrJ1bQuwbvuEizCU1+YoLVTDpkOxBLzrP3XenmxpFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770342463; c=relaxed/relaxed;
	bh=16wScQVt7+8JGYgK5sVfiypVACqnX33InFoYNXDrzrU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX555xpDjqSFBAJoErfkAIpR+7KRPrnZEdOtg/6WhBCp8BlitPKxM2nF+KdAb7+WzQzHwFwbUuR/Hx+wMw7oZDOENSFMBEeWUB3DBse1YUmgkQwZ0IKiee6aVuWyiUH4ZXuozDTkVHnG0rx9ZLQSLt2Ql4t1fohoR3LlAWfHUuPYnDfDaCn8JywOzxieCPog536H8HmTJIYg47Myjj1WjIxN31n5nuRrSn/Wzt8rgL+dcziIbZTmhTs6jgE6QFszWuKw2jcB8ohu1914TS1zXVSa46sorrRi+waxJw01JHaAzcAv0++z6qC6uxGBTaNpgqLT8KEHJ5GLXi3+gs4xqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=B57vNUQV; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=B57vNUQV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6cRL4dv8z3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 12:47:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8YnehQvcEQi2JaP/4u6OJKK7/U8UgEKUsp6IpNEr+lF0skKDMr4BK8UzE0rlEAeQqaGnlHo7oK8nH/+a70tQMeBMjRZ0KDGAu8068J9fnC8TpPqmcBROfH14xC1bz9swUJ5QbCykdNptR1tvTLJvBtGfsGvAGSCP3sDIKBh1HoUaXOCRYArCpLJWVHBDy9UCQ/4YcFj7ma8heVyLFrzCqHQWTJX3Oqw5EI1gyR5ROh3g9LEEDPJcrARnvfgfmU2yfCjP0VfBvY7zSYdmMEf6ZWyJohNTItAxWYRJBy/FUqTM+j5odkZWJaVG7UMVKmOUssT3oY1TNkiTS003gLeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16wScQVt7+8JGYgK5sVfiypVACqnX33InFoYNXDrzrU=;
 b=lRRnEKIB4G3L0sfOKNkYfteGAJ2g5hB0Dsyc52kv8R4Lj5RmDF8w7KHkBCyvXVEMVsZQhkREx3UlsGCS0jvlq1Smc07rSjRJ+jMGG8hOYhs9OPcEDqjzn8cJp9kCyh9bf+aBcHQr/VHllyPn0P0yko/oOUaefRqk5ol2wWvI5zEPzpqVbL+65MT1kSfZtSI83G0a+isRnQoaP/6yivjS5KO1GpsZzB+D2zubjKbUr8N7cbJ7ifotZ5EpCmoaI003NdBJiqyZhIbawD365HAcorh3i5RDuusAtJvq2aJXLuOi7uGGb1AODiVVY+mZmbNAVNUFo9GkBZu1Um10xbegEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16wScQVt7+8JGYgK5sVfiypVACqnX33InFoYNXDrzrU=;
 b=B57vNUQVw5HxNqO4xn/xdqbFKmB036Zp7JWEcSupDuBharBDjPTyu3gG5kiBZTeUNz802IghkGeotnwJd16Sx3q7QAlQ3O8KtkRB3pTdbCfG5rhpDqyf32xRLsW1qUlmlnxejCRzva9osHzC6qoIA7/0x/V7Id4DUUluNPZMFxHRHIgeP0F6pVuGkO4f0McLnRHEZxc+1LeCeXcWJdU9WI83OMN5vyggdPsIGqt9p8s3UTtKKSW3EbY2ZYoMoC0XCw8J/Ee03bE6DmcKWXQepHDt3nLVHGD/5iQSdNYWBMVhxTSjuBL5AE0oN0XyNHp3T2h/fwssFV51uc6qzSyJhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB12210.eurprd04.prod.outlook.com (2603:10a6:800:335::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:47:19 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 01:47:19 +0000
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
Subject: [PATCH v4 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
Date: Fri,  6 Feb 2026 09:48:03 +0800
Message-Id: <20260206014805.3897764-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To VI1PR04MB7055.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB12210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5073494a-ed50-462e-096a-08de6521aa34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e4JUpWsNWtrlGdL5azkFGrnydv7wKoCftpRXQIPI+6ntbM+5Hlu9yNKn5KyJ?=
 =?us-ascii?Q?5EenbUT6+ptn9bqQjFZq2AVAifuOXZOJwuJyjr3vbz2kHbDYkwR6V6XVRnhZ?=
 =?us-ascii?Q?lr2Fnm2TqxFAJsrj0lA+AlYX4SSq2Bp3pLGYLLn4cYRgfKrW0V//SYGZjOTv?=
 =?us-ascii?Q?3voEtCc/qnuFY68Q+41iBDE9IGwFgESUuIm21Nm7V0cDknH0WVq9vM4wgOiM?=
 =?us-ascii?Q?OTwSoqCC+PaVdQXA6A+S+Ej21PJhvwUxSGZIzZQ/d7zU94IcsGLsK8C+CSGy?=
 =?us-ascii?Q?MimA5mCG0LNYonC3JtYlUmipLWvW8s90EA9rvCV88LYhIvc5+acCMw57ULO3?=
 =?us-ascii?Q?31r5h5sZcphxzgLev3J7ZwI5UaDHO+Sj6+B9AFmKzB8A0MGeFZ4S6L1yidyg?=
 =?us-ascii?Q?yBAdLahUT+ou7lqd+UQNH9CeVHd4JWrUnSb0ETKelrgVCQAeQ7tqZ6hmCElw?=
 =?us-ascii?Q?68uS26EN2Zmoly1n+ovJohg688AbnjQBwt8/spKSOTKsdKHIHUnVuMMYQig9?=
 =?us-ascii?Q?/zgLQ5e56Rf9TF9wUPNq93cQzA6+V4e3RE72Nk84gthndr7nBwXzMskunbjU?=
 =?us-ascii?Q?4A0GS4JFsVDMRXQfxTam47HQgcZ43Peu+oI62yw5Zy/BawfH6fIfPqi+/osV?=
 =?us-ascii?Q?VrYlfcp2vuCrRPFZBWvMB7TLogMnaXTCBfDQCVjvPVhBJCeyTH4UIEoBrArI?=
 =?us-ascii?Q?OYJvtc+qmNkTRld22wcoRVFJ7BXukFncw/d36E7HZpsNbXXWRuOJX8yDpBzc?=
 =?us-ascii?Q?aFNd7bSKywsnCJywLAoLE0enRHEeMh16QTIiDFdlO/mXnBX00C+poCbnzrpJ?=
 =?us-ascii?Q?+psM3sx+WMIQbHVhEpKV1edHmHXjla72hVhhz06Q1FpbjyF9131QEMxgY7pI?=
 =?us-ascii?Q?+Lz4BqT0MANrKSk7UCg+14fXtTmAu3eQPM6+xdPJrcihDefqO9xH+IYBq9Ns?=
 =?us-ascii?Q?SAT6zosJ1rLL2sIMrhYwEj/zOGPzNSgo/Q80PEVXz+swlM0iR0A7k2mb9fng?=
 =?us-ascii?Q?yGPNYz3J7tYOtC5LoQKoOkL2f2UXpCba8AgssOcglVyYp4yH/PnbBk3/e0TQ?=
 =?us-ascii?Q?Yb9G5HI7vP8tCEMyaSjL38kggojvfzugTHLEwQoUtIBwANflzYYgBU9hWOXf?=
 =?us-ascii?Q?dh5hQXqg2u7R3FmwinkdoHRtQZlaf9HBZ3qIp7ths+vSyXRzLRmVvzAE7ITP?=
 =?us-ascii?Q?6jDvDmmzfMS5Ob4adXldUxlGFcX5DYTngihzX9w4aBIE6U4XacOhwmaqRs8+?=
 =?us-ascii?Q?Td3s5Yhij/A5/nMb56pxNVVRNduRPmiR6hq898QQUxMrO6K9q2GCk09Ie7eQ?=
 =?us-ascii?Q?0/NlBAGgAHHdpnFuMxlQvhTKQrmEpugVlPUO8DTgMcc+CIJ8QYW9DNpkZVKZ?=
 =?us-ascii?Q?xvEdl4P/jOHT0c/BkF+PJ6oOsj3L5NXyeSokgoqLosQVw8+thGwCHDA3gKE6?=
 =?us-ascii?Q?6I7Y/vlgXGBPOaySuwsQb99pWNMgIagnBey1IU0SPFKzO242SYVtAIokT6By?=
 =?us-ascii?Q?JAeVDwIdy0ctH4pDEiFPOjSIGBcKtftYBfpV/020yE8DsX0bL1yQzdZcydK7?=
 =?us-ascii?Q?danTnC9QNh5wITneO1xeDnkeaw8c08K+c/NvXiWpzizXJQKi4lDQNBqFWWbi?=
 =?us-ascii?Q?z4Nd7+s/jh4wnQhtxS4MfiXCyXGHGqbkySWet2cQ+Reu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3weUTS9ZyseOJf+iX7AxCA6ylHvt5Xo44GwvXp26Tg86nrIH2w7Cvi0a6CiG?=
 =?us-ascii?Q?Ggu9wzIYA22I/T46jxN0hZrKliWsZU3H0UOGNAtyeEYuxAJRsW80wYF3ERZX?=
 =?us-ascii?Q?urP2omNjz9d/Errti5KJVZ5HeZM/V/+Yjg/VhEf5Plm4iodSgwP0LFEERWQH?=
 =?us-ascii?Q?YD12h9YQlxLQLgGdET6rEU7b5YMoiJp8A1O+sBuDAt6o5hUdwW16xgDLwjlA?=
 =?us-ascii?Q?t8Q33DOLXx6NipH3578sdnZVbTbDijbcb/xg+3ZDmWH1wZU7O3VCoWBK0DSc?=
 =?us-ascii?Q?DopCD+bYg1nrGCxJn6I/2xpZDchu/XURLKB9aVzaYahG3W8+64qomXwrukbW?=
 =?us-ascii?Q?1KNn4cAD3LEB8PAn3zq206DXvxAWRSBrISFJrX8HCcixKAKHS7KU6Zx5I/XE?=
 =?us-ascii?Q?zspP+wP99LdFz2CFtkC7R8cY+WC7N87pjNTIZ0Yr3jw+B1iXmsK78nSIEoeE?=
 =?us-ascii?Q?Z49WmrHOh2SxKLJVdy2mKech/dniv+YsE1UocN9Q/+aq5jg/0XvOvPM0PBVk?=
 =?us-ascii?Q?jrtTT13W89SOKh/faxbofcGy6MxqoTfzXl2dIPmVzkBUs/XCVnHguCLK56lK?=
 =?us-ascii?Q?azVLQTsIF3wpvUQj+5pUk85qO8KNSjQLMjeKsKFk5pwmMFfLMVrcrfeJIXnM?=
 =?us-ascii?Q?l1vC5TUgrw/lq3Tliy6FnzSGRNnYJVPrRgtljgRzVP9aIxM3104JUcxNUDYn?=
 =?us-ascii?Q?rc4Lpo5XC8dK4ZGU0H2M+I0aQvsxjr/pXG6E3Anxz008OkSdbYsmKCokZWvX?=
 =?us-ascii?Q?zv4iO9IpbdhRc1nsxVl/rMM6agL8SIhiulO56mjHOMaLsZTzUFoQyNhFaM1q?=
 =?us-ascii?Q?9xLqA8/R2ejztGwQdiWK+2HpiLJAvwRAOHCak8sdWu5/PcLrdktmUw7MmoZj?=
 =?us-ascii?Q?v23t38fzpaiwD0DfFrgwWwt9xuY89RhwHYCsO0duU71c6P17Ibkh/zLXBPQL?=
 =?us-ascii?Q?yTVcQWQrP1D1CFLrV/Vcbm7dwjm7XD9XV5T0FLJErzMmZFIjWsQUYlupXdAQ?=
 =?us-ascii?Q?EK8+8U2bzx6sjdcKYLNXrMDuCjVq+MV5d8xYfhUMjCNnDTdSv0OOCWdiFs6J?=
 =?us-ascii?Q?WR1w4sZGfjCcAiaSlZnMu7l92TOLpTMeW1j+6QVUZLhXfW4jsQ00EFW8KOq2?=
 =?us-ascii?Q?mM39vZOHDAdB+H7oqhp1uFWX6J7aY8c0ARnNn6O03u4KaYYYzkRo2Lhqtqab?=
 =?us-ascii?Q?Ipp4dLOZnOAMGLPpd9OBUOlz8SezWKrR2VA4+jMfMcih95c5ulbVLmNEdTQs?=
 =?us-ascii?Q?BpVyY+2b5wVq6oTlLSxD19qOXiBJLh5yUI5ArJgmgXka62sMgmSpOi8YNMaW?=
 =?us-ascii?Q?FiYdKpC4nnR6cfCnSrDeECWwMTtT4mDiksQMnYKjW4fiNl+X/zzCTkS0rG1l?=
 =?us-ascii?Q?/oNCopsAC9LmJQG6iFm5XEr7ixVmCsYWrsgj3ezf1OFUIxuauHaFaPe6f3PT?=
 =?us-ascii?Q?/abBk/r4YfkN7SOgxTn0JS23SAERnOP6NpFIwRX8fGZ5edFTU1HTt82VK6ZJ?=
 =?us-ascii?Q?k3H/VNMO0ZBlYLw748+ZEkbtWbO0qYKe25H5L8HivyrQQHDJ5u+dhgrfAqmg?=
 =?us-ascii?Q?mzK0GGt2gleAWTKjrG8hS9Y0yVs8JQ14EwifJZkNmMoKgvxKfUibkfMQfMlm?=
 =?us-ascii?Q?wQNZkcExVJxf1DHSbPTxUvU+mH3UkaXAOa6HSaaBU/DnY1984EP95v1coYex?=
 =?us-ascii?Q?EBY5G78uUr68qHKETb5qxDIMeyanugX7Hlb9tFlaD/cUiEstKnQ8Kb97p0+k?=
 =?us-ascii?Q?VLu8N4CAnA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5073494a-ed50-462e-096a-08de6521aa34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:19.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMCJhMqvMC7Kb/eaPVcaUnsgXu9IZGWX2WzR9vmVtsCITltDE5jBjRB9DhIMoaS2Kl2HyFuAdrUZttdoDx+4YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12210
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
	TAGGED_FROM(0.00)[bounces-16644-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2078AF909E
X-Rspamd-Action: no action

There is a limitation on i.MX952 that dma request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped
from the input fifo on the second time if dma is triggered before the
client device and EDMA may copy wrong data from output fifo as the output
fifo is not ready in the beginning.

The solution is to trigger asrc before dma on i.MX952, and add delay to
wait output data is generated then start the EDMA for output, otherwise
the m2m function has noise issues.

So add an option to start ASRC first for M2M before ASRC is enabled on
i.MX952.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 22 ++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |  4 ++++
 sound/soc/fsl/fsl_asrc_common.h |  4 ++++
 sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 92fb16f7be45..2fe25667c888 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1078,6 +1078,26 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
 	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
 }
 
+static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+	int ret;
+
+	/* Check output fifo status if it exceeds the watermark. */
+	ret = regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index), val,
+				       (ASRFSTi_OUTPUT_FIFO_FILL(val) >= ASRC_M2M_OUTPUTFIFO_WML),
+				       1, 1000);
+
+	if (ret) {
+		pair_warn("output is not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
@@ -1275,6 +1295,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
 	asrc->use_edma = asrc_priv->soc->use_edma;
+	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
 	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
 	asrc->request_pair = fsl_asrc_request_pair;
 	asrc->release_pair = fsl_asrc_release_pair;
@@ -1289,6 +1310,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
 	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
 	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
 
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 1c492eb237f5..60b6865ca952 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -257,6 +257,8 @@
 #define ASRFSTi_OUTPUT_FIFO_WIDTH	7
 #define ASRFSTi_OUTPUT_FIFO_SHIFT	12
 #define ASRFSTi_OUTPUT_FIFO_MASK	(((1 << ASRFSTi_OUTPUT_FIFO_WIDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
+#define ASRFSTi_OUTPUT_FIFO_FILL(v)	\
+	(((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
 #define ASRFSTi_IAEi_SHIFT		11
 #define ASRFSTi_IAEi_MASK		(1 << ASRFSTi_IAEi_SHIFT)
 #define ASRFSTi_IAEi			(1 << ASRFSTi_IAEi_SHIFT)
@@ -432,10 +434,12 @@ struct dma_block {
  *
  * @use_edma: using edma as dma device or not
  * @channel_bits: width of ASRCNCR register for each pair
+ * @start_before_dma: start asrc before dma
  */
 struct fsl_asrc_soc_data {
 	bool use_edma;
 	unsigned int channel_bits;
+	bool start_before_dma;
 };
 
 /**
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 0cd595b0f629..c8a1a2b5915d 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -107,6 +107,7 @@ struct fsl_asrc_pair {
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_format: default sample format for ASoC Back-Ends
  * @use_edma: edma is used
+ * @start_before_dma: start asrc before dma
  * @get_dma_channel: function pointer
  * @request_pair: function pointer
  * @release_pair: function pointer
@@ -116,6 +117,7 @@ struct fsl_asrc_pair {
  * @m2m_start: function pointer
  * @m2m_unprepare: function pointer
  * @m2m_stop: function pointer
+ * @m2m_output_ready: function pointer, check output fifo ready or not
  * @m2m_calc_out_len: function pointer
  * @m2m_get_maxburst: function pointer
  * @m2m_pair_suspend: function pointer
@@ -143,6 +145,7 @@ struct fsl_asrc {
 	int asrc_rate;
 	snd_pcm_format_t asrc_format;
 	bool use_edma;
+	bool start_before_dma;
 
 	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
@@ -154,6 +157,7 @@ struct fsl_asrc {
 	int (*m2m_start)(struct fsl_asrc_pair *pair);
 	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
 	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
 
 	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
 	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index f46881f71e43..77999526dd9e 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
 	reinit_completion(&pair->complete[IN]);
 	reinit_completion(&pair->complete[OUT]);
 
+	if (asrc->start_before_dma)
+		asrc->m2m_start(pair);
+
 	/* Submit DMA request */
 	dmaengine_submit(pair->desc[IN]);
 	dma_async_issue_pending(pair->desc[IN]->chan);
 	if (out_dma_len > 0) {
+		if (asrc->start_before_dma && asrc->m2m_output_ready)
+			asrc->m2m_output_ready(pair);
 		dmaengine_submit(pair->desc[OUT]);
 		dma_async_issue_pending(pair->desc[OUT]->chan);
 	}
 
-	asrc->m2m_start(pair);
+	if (!asrc->start_before_dma)
+		asrc->m2m_start(pair);
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
-- 
2.34.1


