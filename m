Return-Path: <linuxppc-dev+bounces-11164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E1B2DCB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 14:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6Qy90dC1z2yrT;
	Wed, 20 Aug 2025 22:39:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755693305;
	cv=pass; b=SnmMhqchmmTHexBRcfWRkqqwXla1kyQj9e6S3GtFKASEhMOtApc6cON6Q78eaPbwi6gDfp428INEzSaRY9q71omif9kcX7HY/mrJvs3GfCxt0UIDT9dVoCuQhHpxZ5N9wQL4aO4whEWWLI9gfWavHys7glUJLvHD80EHHzBdMdAKQ6anAfZk67OSGxOGwOYbVTIYwX4dH/yuosL/1e+sxESWAXYOtjpRpwZKGZ1yyhCnjCne3ICB1vqVaQXVCIB03qDdmvyM9tW0TGtsSObOlAPEV6y+Ru8ohTz4wtXO+YqsZsmgeLR02IdHIfPjvIZ5E37tyMgmFQ+vEEfLtuLOnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755693305; c=relaxed/relaxed;
	bh=Kv604vguj9Ujt5NoB/DezOqvihci2+dHznEyU7F/Dug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRf+CIoX8My9AdQsgQL4oPfBiYrZ+Cc8ZI/RVsLBZTDceqe2/3C6B9fA2dUxJ9FypnLdYGEQndLIjOD7iWvF82EXQuH7mu8eQmLeVo58JJqIeUWlHWS0hTmf4kewQry5Fc0hehQzX6ULvI3QQnsstitH7K+s67RLopTCU5+uZrVMCl4vy6xvJn8dQ9/Bu9rRbqaZoJtsihTHKZbPV2Y31wrbSBwV95E//F99LTAUVitCakaD6VIviO86o4lj6JdZNYaNUCMh965x5NsCqZm4aIHVivhtSlOsMetorCt1B5GjEpLt3GBAs/CXdQcUZpUWG01ivD5lUcPsWmDhjsJ6GA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=FL+M8c6I; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=rongqianfeng@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=FL+M8c6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=rongqianfeng@vivo.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6Qrn3HFqz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 22:35:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrPiNhiFu1aN3r79F3vloXuhTHp4nFv7ndQsa2d0jft1li7UNNL+LeS6eKfuXF+1qeXwn0fgCixG2Y7kIBotvUY9Cu1AFfIQNtJ2+92E1ZSsBDDTXLS9PSOFvpPK01qOg1efLLiiYMyAPFVC2Dp8sFqVra+UL/MxpvCy2Gy5DNsn9eyb1pKEXE1ZBZpZMr52DxfFpcnwuLEnl1wS/1aWdqpJvAjJyfY26Ct9rZ1HNUAQAeP3tSw7Dz18TB6bPP1cxXKvusJFv/glUb8MrU7RNqLX3MIaPbhyU1OtL6NSEkZkT2ZN6iGx7b+AF1jOo/ddDmBuzbk2RLx0AVI+xQMsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv604vguj9Ujt5NoB/DezOqvihci2+dHznEyU7F/Dug=;
 b=DBjbpy/rZLYBVSmiywvu73gqY3+DIs5CUv3s0C45V3oD4RAerNKybPuKJFslgEV5Wt8Bgzhilr+21nWLJnXNAzsSPmrwUgdQ83XRj6AX4ZXyqeAybl+Bgwf1WcMI2KMoXsFS+pjoYRTry/9fxbSLKwz2ZJiwki9qa34xm8uIJ26ei6Kuh650T5PeVznvFknu+Bj0c/H/KsoUCvlMCDygr52InJKw3E3udnhWFW2IQokttWm1JvmPoxOzYn853Sjc5YB5lCDwGbtFtTOXEgDP8AwDALcGHZc8ktrDWNnxF+xE4IPhYVUbdIsX+ojahIQ7KOBEo4U+Peu4u2VCxYiSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv604vguj9Ujt5NoB/DezOqvihci2+dHznEyU7F/Dug=;
 b=FL+M8c6ISFXTMf2PaSZpaGXQvgmpq7Ykctr2LUMKp7GU1cA26zYzd8/D1vOpAUrXzLYltsU1kg0gp/+5p5vxvyMkab362JRBUIy2Iz3gRew0/BKcp3cj9eJpVGT1OTF+hLeHjhRh9fqgWAq2m6qFjaV5e6WvL8LicnxiSe47x2fGHejQWqVYIKnaEaoXyVi/8gnaO/wXy6aSGe65AWAORjBuEuykqHQ87l5tyZmMfAtURnpMsR46v5bPhVTo23gTOGAUw4nR4Xnmx5lpXC1K6F0KjFzn8MfLLZ/hGDBylsYHw3Ydc1PuYHBymnqqLYSkVxrFELjTXIayxxrVMeCwGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7177.apcprd06.prod.outlook.com (2603:1096:990:9b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Wed, 20 Aug 2025 12:34:48 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 12:34:48 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org (open list:FREESCALE SOC SOUND DRIVERS),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC SOUND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 2/3] ASoC: fsl: Use kcalloc() instead of kzalloc()
Date: Wed, 20 Aug 2025 20:34:19 +0800
Message-Id: <20250820123423.470486-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820123423.470486-1-rongqianfeng@vivo.com>
References: <20250820123423.470486-1-rongqianfeng@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7bdc11d4-5be6-4716-09fe-08dddfe5f375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oi15oPWttKw74AbcV2jH25FxgoRtoN1knWqw9V/DGUPmsK6GI3z2wp0vevQu?=
 =?us-ascii?Q?5wi+hP8XUyyOB+n81bPGR5OjrUMC6d2raEwRO7ESaQi+6EokV1z0qDjgp24h?=
 =?us-ascii?Q?9p9M0w2xICX7FrW3lseErHU+4r9s1i0T99nmvFvcDJ8HFCr+a4rG6qgBvcW+?=
 =?us-ascii?Q?IsmLO06pfXxJWMvv2vqGUrdJou+U2WihH7SympHhjKnwkDTiHb9tQFt4P9eM?=
 =?us-ascii?Q?pIfPzk2wS4BOnj7I8vePOdKOfEBuZGSc3qRkdnah+uqLYdPa/r6e1TP6Aqdh?=
 =?us-ascii?Q?y4BmUaCEzF0uy+8lRbnoyvAnRD9+0jTcD4pvidgHvVkK0GOp/mr+So33Kv8R?=
 =?us-ascii?Q?u73mELd0GbxyPJh3B9t58X+d9rA8bBkuXNZsiGTtLliEK3QQ4XyTaNZqYLFJ?=
 =?us-ascii?Q?shvPYX3Jp3ol4HywgGkp1tYww9sm4SD+WDqO6rv1kDd1SnXzFXBIIBu6MvBI?=
 =?us-ascii?Q?8E+53BGQjQ4AY20l31LXGdZH1w8EJA2mA1dNevcHYcZmAVJCwyu94EEJw944?=
 =?us-ascii?Q?4JztxiXXRafgbP9bBdttXpwWLlS9fgovKjm37m3E+pB+9y8p6Y/IFHNMejlI?=
 =?us-ascii?Q?GVi7QqBn4Es/3Vy0gCNYyEBMMzAWGpFxwB7zIOzmp92VRj9JKPPhMrjrfarD?=
 =?us-ascii?Q?NnHx5U79HsJfh+b7hf6bb7OmFwZMFC/HU6L88WXYdrkAPHtF2O13iaq8Br3m?=
 =?us-ascii?Q?+c3M9xIBThQxljREcuM7bULUszvEtkyK+E1nJ72DrO5MDB/5hd97674Atsag?=
 =?us-ascii?Q?+P7T40dcVs6sy0Ra3UT75c58v1i4sYNLsos4WMi4Lk8awHLVN3JA2j72E777?=
 =?us-ascii?Q?GAYtGmx1HOvptIQW3fUN9Ls3zs2IHKo9aB7AsPvzvVH5+YIAbMG+VUlowmKa?=
 =?us-ascii?Q?/kkDSj2ofJHHMURsv7aT3t8yZf7CZ97BE/sSotegOBFMV19MKkimbMVfd6t1?=
 =?us-ascii?Q?LA8ck8NbWRoBSe97JoHEGIuwBM5930jfcpkNLwQLvbi0n9KcHIgfQlCko1jk?=
 =?us-ascii?Q?FiVGEZYzImtumuoNCzTR3PdHPyBk+pHvK2X7ca/OSqWv9cVz+27sVOWH+Xg8?=
 =?us-ascii?Q?MslFCJR+l1PZMJA5ANfhWrpApvGrsn8VuOJoDD+ksPsG2/0tjmwQT0QrqmFO?=
 =?us-ascii?Q?txX+3btlqPxaAnn0ucGdJeCObW5SGTQBE6+0htOOlU4yG3pyaOgmBl5EVdZ8?=
 =?us-ascii?Q?8NphUC8/cjrJjgiFCDI1RdA3HYq4kgPzsgHLCZbbGgLA/onYxXmMTP+kETiB?=
 =?us-ascii?Q?FfykvdF9nof8ibNTKyGie96+yLNg3ryD0yFERTo9pVZbHl58i78h+jUfVrPY?=
 =?us-ascii?Q?lYtnXnubAjPvW3GdnRS42CsPWztlQ/2p+zbETFmq0Nxi0u8BTOyv6bIpwncE?=
 =?us-ascii?Q?pCRhkQ2PMD3QNrHs2mtEXFVJ4XrhnEXLZG1f0J9z4D2QWSzsatIHzftSmSDq?=
 =?us-ascii?Q?DCfTc71rjunS6NX/pmrykF9tGF6OT60YnuazyPPn93CVz24pX1wW8A25iseN?=
 =?us-ascii?Q?A9K3V82KxjYmeFg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9oQYpsy7xQhEX3ZJK5ytJIOWUBPGb2BRwApuDIlKV6WU6YHE0WVylvvUgBer?=
 =?us-ascii?Q?1o68VLuNdFZraneLyOQSt3pT+OFPmRuMy4P+mvFuQdiiPp2guRIc+Xu2qYZx?=
 =?us-ascii?Q?tLv8qK+1sMc0t5DKZ0ZEvjofpE+VkZIR8XlPnghOEVAJ6Q7fmJpCrygwXy9G?=
 =?us-ascii?Q?riQWllqtqR2NF5YkgQUotOsN9OMKMc4W6L6UG0FVdcSnywk2XYdFvAt5Fm95?=
 =?us-ascii?Q?Vfb9l6QeHVL1AcONBcXaRfH4QgOOv2rYMmOkX7JnQubA9oAaLAF/Xaq0sCFT?=
 =?us-ascii?Q?h6Fc83W0BXEy+3YpXp6kqkZCc8zGHwxSeA8Fc24O2YfrVpKRTBDc4uzHIAFV?=
 =?us-ascii?Q?/9f81wb+FbrG9f8v4N81N/TT3oWiWPfNxb23s05I2gzVn0W3CqmdrzjFiFVH?=
 =?us-ascii?Q?mfJxAlE1vAnGoeGR2tY8sfM2d/K1W7HgTaiam6bTKwWlCCTlGWZMjCzpoFQ0?=
 =?us-ascii?Q?eOCl06JOUfIf0PPqmTvN0CiU4zJ1DKBcYGIFn0/9Vyzkoxf5aGUwDnunHdhz?=
 =?us-ascii?Q?pXSnx/fobaIF2CT7SkHsI2uD5patyI20mzP+sYRMSYA+xvbwbdTm/qDJgQ+V?=
 =?us-ascii?Q?uQ4hBtdMr6RaMR8QZil0/2OH/uv5Fhe6UsK4UOgs2V0sa9Y9mOkstbRq7qWy?=
 =?us-ascii?Q?sF+pWEHtKGgx1Ev8OCGKo6ykskjTXL6l1iVLyyEq43BRSNy+HoSHHCL1YFB1?=
 =?us-ascii?Q?q0TsEP/pkpLz4XQRCL2qjBUnbDU8DTzbpI9HkVo2VQ/kU1BzhdCaMhHJ3y9p?=
 =?us-ascii?Q?ijkABw/Izc77L6s23WavZr+0tA1ai7UHLzqsZfS7PhDANjxq39GerylKyeC/?=
 =?us-ascii?Q?ppRpFKByhVmo9On8Tueai/STFuRzQi2zGkuKDik13qwrMx8qbAHMlyfSpEnv?=
 =?us-ascii?Q?qedDaeLY5Dhn50kuuYjAP4abNrstxZcO4VIxSXTpU8tUTj5KULvWrPKF60nX?=
 =?us-ascii?Q?7aV4V7WWfOG5YN3SpCC14kSAT30vk/bHqTP/mmlszHS5dMekS5h6WLn+YEoc?=
 =?us-ascii?Q?Qdbo1v3VL8JOmN6a38mHyrpbnWWyFgO/cFx+rrpOQuxh2HJb5Ef4GIkMD/Zj?=
 =?us-ascii?Q?yA/DIBtsxbGNgJQ4p7tg4nqrdx1xNOQUTyKtUQR4TQd6Rahxtu6k+OEI2Cre?=
 =?us-ascii?Q?lwoHv+TcUE4eqlrTxpcI1ZiwPpz64HYq2DeN61dDL/vyPaVamMW0TJ6HOu3G?=
 =?us-ascii?Q?r69A88/eY4xgk7HgBKA1t8KS1ktppxg2QfoJIKXc+CPJnlNvrCTg7BrmR+mi?=
 =?us-ascii?Q?uSBK3PaMsjMJZV6h2ORbzua2NipAW8X2JX28875UIGnoXpigJ3MO5e6xxbyb?=
 =?us-ascii?Q?WjHMdkMz9Y9FQ5L3yxbQEZiXz8BJlhu7gzCFNWKAs8y0JmkPrROHerK4nFlq?=
 =?us-ascii?Q?9QxIWP41DLadZ30wOFXo/EnJdTMXNPNzIsD32wIXGl8Ze5jx34KINDttvAcy?=
 =?us-ascii?Q?byNo5yq2CY62envOFIyiPsNSccVZZtzE9BbyyqDhwMWwn3xE76VMuMo1zPNg?=
 =?us-ascii?Q?Z9Gmssnwk0+IWI/QxbuGPUNmklrqLQCr7Uxh7SPRrUDpLre5TgR2czbcFOXO?=
 =?us-ascii?Q?2lonR3dpcekeK0hi3YXxk8Q/TfUDO3h8DmVGvgjZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdc11d4-5be6-4716-09fe-08dddfe5f375
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:34:48.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCC+fOUC02r2T2WbRy5ldrJVPwZgagPlqpa5LoLgeEuPRAG78APMTlLFkhfnkfpqvM6/QHSVpSQWuuckY4ELdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7177
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use devm_kcalloc() in fsl_sai_read_dlcfg() and imx_audmux_probe() to gain
built-in overflow protection, making memory allocation safer when
calculating allocation size compared to explicit multiplication.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 sound/soc/fsl/fsl_sai.c    | 2 +-
 sound/soc/fsl/imx-audmux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cac064a60349..757e7868e322 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1345,7 +1345,7 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 
 	num_cfg = elems / 3;
 	/*  Add one more for default value */
-	cfg = devm_kzalloc(&pdev->dev, (num_cfg + 1) * sizeof(*cfg), GFP_KERNEL);
+	cfg = devm_kcalloc(&pdev->dev, num_cfg + 1, sizeof(*cfg), GFP_KERNEL);
 	if (!cfg)
 		return -ENOMEM;
 
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index cc2918ee2cf5..f8335a04595a 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -305,7 +305,7 @@ static int imx_audmux_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	regcache = devm_kzalloc(&pdev->dev, sizeof(u32) * reg_max, GFP_KERNEL);
+	regcache = devm_kcalloc(&pdev->dev, reg_max, sizeof(u32), GFP_KERNEL);
 	if (!regcache)
 		return -ENOMEM;
 
-- 
2.34.1


