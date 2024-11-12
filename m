Return-Path: <linuxppc-dev+bounces-3113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6189C53F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 11:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnjV95F0Zz2yYJ;
	Tue, 12 Nov 2024 21:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731407713;
	cv=pass; b=PP7jQ2r85dBw/pb3youlNJixXXwiH9KpSbFoF4voQODecYjsTZAc7Fsg3cKzjk60Jz2T3KqVKVZFeYJsrc2Wq5F1+Z5bzmHaLqTgCwt1IJr8U7v1z/pVY3OkNGYjpJAnuk6RH8iTX1MzNEumEGMxd/6C2lYwddyXS2b46I7osJOXzEzCl00GZAD340WLdcYPQJG5WOhdSY8plVVLeyqT2uLomGP9H5D2j9llUrGCk6YHhkW46EA2184MBhOsaNMurmJNdMdZPWX7zcJIBDpAjG+9QevGgnsQ6GcCTo1r7XQ/hLrUlwwkg/WTfSxNLHGOmzg5HmOHEUpWQlhF1L2W1g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731407713; c=relaxed/relaxed;
	bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PfbQLHpWw853HafpYAtyVW4C/xwGywriVn3zge4eskq8e8dQe2fmaS+tQfFw89qSubL1BYkWnUYb6CfNlL+p9hwJSComhcMaqKUe80KFLFOTEBRMydwvicJqKeo2w56an6ihlZMvEkQI8O+540GTtX1DVboSFH5x1VhWPRDpHstyOcvmLajWcb8PohJkZ41frEfObMpAco7t3yk4eLDxEJ4AG4/hjitHK9/4Iq+HvgXOHXb1wNvGDHZ3iGVQWFCJnCx1f5+ObjYsDL4Avlfkn1AlsQOb//P9xY2tYfX06LUjPZ5WUidQWVzhVkUvnKS4Qp4884Wq8fnZaEHlWs3BMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NRk6L0Ga; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NRk6L0Ga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnjV90fnBz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 21:35:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM+GyKJtjCGZZQS/qD/c99saHQSMN1jT+QLLLLkF9X499QDpmjAA0CNtbZl5FDns5LJ9Ikq5SqvJmgR5rHDijmiAV1EJnsntSk+Eegt1UQE6dSH5U6lDcoi5nT/M9Ct3EsMEmzNodr1BCpfUU6FEe+qabMmS2gEStRzNnY/Sx9Do22/4bESuUGKKF9exR7MyLGp5y8ExhN9ysDMdmMuo4DbSU0z5RmlSis/Fnh9WmVLp70I+QSoFtIsTxgCiVRa4lzrJ8UkS7ZnIj1BlqqrXaQsF/MMfgtKEpYWhoN6QhwmD3M2pymfeizYVVWRusi7wTTlSdph1tksqPCaOKLlGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=ElZXc4NCQg6xLYgYw6C3ewa0o1VLc5V8ooQlljNjW0wdjU07iiM0aMmmxZCxDb3AiGL1+Td2Gr0aJ6LW9GHpcoMnrVAzmE9yOshDR6mm0wsMX9y5PQbXCC5GTquMUHUw13PA9QuXl/FAR/hz4IXCyr8KH2UvTfqbIayz+ILR3Xo1ouxD2bdV5ZEmn9ck25QpYfMFABRopEqS7uP0db6JQaBpzZgbmwMYCQ9VLrHukYDpNCYRVO+nA6Bh+//fF3ki4V4C7DZD3WnFefOHm5d3S78n/ze8wpZnCuQjRMLoCBTcnfLON4iJGUTj60sTU8kTCcOZCX29w45SPN1Odo5X8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=NRk6L0GaTex3erCOw3kQ7zsvQkvJO0WcZjtWwyo7mHyEdGGMRH2/uARGjFFs4iZg/oCklw7j0nj8jlzBSFtzeH3Xi0OKU8C/vNZc41GwRm0CA5Z9MVR9Vn2+1y+S0MAcFWkzO+DXY7N/yKWQBZOVlrTYHfy+JnaMAaRh76J4GV83F5n3vvXpGfnCBCw2/QSxzO/TDh4PchfSz1L+hs1Dj+J1RwuGZkeMPsVQQz5LjaPWBvCYGnITXVYmLXLTgexPHpBBdqLl7EpJPqgZBBE1Q+ND3iW0pZ/Z9BLPO9S2oXuTzv0Tmaj1gHePk/glq31MAjd+GWR1OKkWvIezjJMPCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8598.eurprd04.prod.outlook.com (2603:10a6:10:2d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:57 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:57 +0000
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
Subject: [RESEND PATCH v5 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Tue, 12 Nov 2024 18:34:04 +0800
Message-Id: <20241112103404.3565675-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
References: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: fea32b8a-671c-4a02-5d6a-08dd0305a736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?08iqkw6LXXBhm+VaxPe9tLt3RCfOuKFRdSqVL3I27l+wCeoe1SMjjgfzllva?=
 =?us-ascii?Q?GdXYNKQ71R3YMsfr30CundZKuYvuNNWBRKLk6XX09wRFgmETGaTP44RD6E5q?=
 =?us-ascii?Q?QY+BhBhcIjQL0PqnbrlnkXO7COSBuYQ6vtaNtGG21oV8eIqmE50kOeHo6Im0?=
 =?us-ascii?Q?7Rb95zD1Ph7HCurIm5GElTtWhjQS5CYmONs+y+vwfek54y/R1gtz41BX8s0r?=
 =?us-ascii?Q?/ebdv1JSMDNVzumPLsFvZZUkw2ePWinL3nOWUjCahcYbwS0h3PdA7EGs5pB1?=
 =?us-ascii?Q?6mI2hWx84x39XyKurm51trnK/ISwKibR+5UetKE3tXd1a4uj9XUA9scMaDeM?=
 =?us-ascii?Q?B6W+F6tWqkUdT2Ap4UENmssFJpzxi3MJdHzKDGvzgdFJ0xlHepLOAlgO85PF?=
 =?us-ascii?Q?ctuT/9IyPKvAVefqVzDDLZujcYR9pughRLKn4hI/QfGdc3oi1yFAvCdBdV86?=
 =?us-ascii?Q?+bST0i3RtyRk4aTTgNNSys890YQMiIvsRL8+HJSfOnoXPkRbkk7DRDJjNzDo?=
 =?us-ascii?Q?088U2uZgppXs9jadAjkbQynRP5eJgFoYEmmHZTBXJb3geQxTS+fTrySpuQ6i?=
 =?us-ascii?Q?KhwqzCT1ZEj5kWraokwDmXOS2eMajF/77oh2cK21T9JmiLWsa0N4kwl04HIk?=
 =?us-ascii?Q?WeXR6LnHovDR72tAd/hE1rZH0Mx6khlgAUMQnS/EuGERFPZZz4M1khFLgnD1?=
 =?us-ascii?Q?tqGY093aKf4G8IJghfgZYAIlIChTEp3yJ86ocRCmiCFCmFZ3h+e0UWZrV/nx?=
 =?us-ascii?Q?oWpwq1JMzxcKCNRB+ZYKlsjKf8hLSk8PQmgQ6C2JZqdwmPPXA29T77T5uOMj?=
 =?us-ascii?Q?kAilIP/8MG0LbU8vJUQQt33zIJGniKDiem12x5Ph56oQjQC/T/UOXapohaGD?=
 =?us-ascii?Q?de8uVZFzj0rJLKLPYdMgKp4uAqVsk9AmPNiqDZsJrP+47WBgjZaTzXBYqtpD?=
 =?us-ascii?Q?IUaEDeVc0jLysIgRhvcBHYySitPbWL+LxUuuAG2m/67GvBiBX4h2hgGvK90a?=
 =?us-ascii?Q?uwQ3+ybWtNh5GCJkJxUFL3OLAaaPj/Ht7gt1fBCBuL+9EhGdkW0mpVQFaEFq?=
 =?us-ascii?Q?SZD+riiN67qO0gC80ZQxhI0lQnK0ZuXNWqiUvP3NvJzXW8qf7I897NuwyOfY?=
 =?us-ascii?Q?YXJ24jg2D2Jdo37AFIVGcVd2H4gJP8haVvwLssheTPkv/EIrXNeisL+daLBf?=
 =?us-ascii?Q?wWet/LR9P/UbLxLtRhyitVgr4hLwAslZDa8FFLMhz3dVdUWhPz6YNZ6nxwNe?=
 =?us-ascii?Q?coa+AeDrDjal7XoXWE0OuTHRtwH38dFrofeRnTMyS04Yx0PXA3heikZJQIzw?=
 =?us-ascii?Q?2acTUgyf9kFQ3CcO66Px82GUANTyYY0AtUDah88gPtoWPzyCpMqmdjAkBAuO?=
 =?us-ascii?Q?Rp22dtemgASv7lJLvhD5t+MRY+DE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BuRrEtPRIxInbM5JqkhSzF3c1nM/oZZ+3hZxuDe0lUp16DcxGVkjTZGC2DxQ?=
 =?us-ascii?Q?Z3xJBzb6BR/MyI6FyvepTEtOjit9Jv2gdLf30ShyivRMQzB4uKSDWW0iTQvc?=
 =?us-ascii?Q?2kN1jL6fnQVcyeOcJENZl2UL8klgG5C2FPeZPxwwJcvsU495gVWkuzhda2d/?=
 =?us-ascii?Q?YtCIQBSc15T2c/EZsf0HLfIaD8qJ1/YlT72VV7rGcb4oOLODaotYFnm5yXka?=
 =?us-ascii?Q?XA+3nwdEHZ4B2JCUIlcI8yoFJMOghb1gWhoeJezxCJjn6z+aEHxXYu46G6FE?=
 =?us-ascii?Q?mlUAyCAv8bbuMaKVO8THiBG3nru/2xhD+IjEfqCmwQoZeTavbhhhH1cE5rGm?=
 =?us-ascii?Q?yeD+cCVMKJS9xMH50cZzThHJF79JwcsiXcQ0UBpwbLXk90BicBLmmrFPv6hH?=
 =?us-ascii?Q?FwdztxAHfgE6WpRVEoSyafsbqhoeAHjgr0V5wVV27x3kxPiCx6bZC2FjqVb0?=
 =?us-ascii?Q?cXHFniamfkIVbiymi+OV4YLuq9Ic1N+Q7URyyFSiRlbPH/29yX72KXbQ4rX5?=
 =?us-ascii?Q?HAN4SnQyNtdD8RKjP1bCWra6yV4MayjphUbjCHpOQTBjmlemTVEJCI6SgHy1?=
 =?us-ascii?Q?dYjCXzJPjEazTH71Jjs1G4Npaz8ZHZs2G3sQhbqofVnOvXdgMO0N3OR6nExK?=
 =?us-ascii?Q?09rM4hkE6boH4a3vbVZxQrNbbBPxRo0dspajf95JHc2Zy2YBYIOjSCTWZLhO?=
 =?us-ascii?Q?Mi5Y2oznVoyH+Bl2KTM35jgOtC2sUsRp2LZrXcxKgrSloGgD5epBf6tWOIa4?=
 =?us-ascii?Q?Wp9Sli1os8gFHXSEn6XkJnIImngJP66HAIrJFJMwkEDJ/URtB+n3NZb++hiM?=
 =?us-ascii?Q?qvIGXsuAQRmJe2qcoSHvctQ8zmdY9wQ+tDZNBVOesBoy/r7P1Ct0RegRk4Ze?=
 =?us-ascii?Q?tmea6WpXMUskGDspL53C7QB7kitk43VAG9laCHR9AnlYweWm+F6uAnHnAYTZ?=
 =?us-ascii?Q?GbYTPVZO6pU9ve9/odCsX3gmIgcjJLF8r5uJ075hTJra6gLKUoDqb8GMSawS?=
 =?us-ascii?Q?GhzZvEolXOmOjhFpCeFkUmwhsDxHRC8jrQ1RWdNaJ+c8q3D7rXIPrG5i0ZKi?=
 =?us-ascii?Q?rXAF48CugYwHY2XJCDudx8ox6J0xpPU+qKzcFn7OACns8/5tqOGSyu4jnTXw?=
 =?us-ascii?Q?CXBBymz1FFfPjinfSbDeAvTF7Jan7CsbmwTh3hrVgf2DKaIvIU/L/H6SP/s6?=
 =?us-ascii?Q?7H+mqVXYah3YL7ZfyiBeVYObAzEAGQbKKvYNmTLKGSuXG+7lGegVJ98VL8A+?=
 =?us-ascii?Q?OdWBwHyioGHAa68KO9lmXh9xrG/m0O0xaCmREoOHNMhUlzaB14dJDzU6QpRu?=
 =?us-ascii?Q?dVFuz1ol84VQf6sAu/wIkOZbQcsDdf25ji8TjwrccVEDzWhCV5gV5bWHe2/r?=
 =?us-ascii?Q?+XdVxGRjc8+BR1T/yzZPDqvSCcEOuMg8AaAE/A6I8vAHUbv7csXuYb+ULOg6?=
 =?us-ascii?Q?eNe1okDwwEbXrkap92T4jHbPXhQAFCF/8iOnYP4rt38p8cPJsnbRh0ZNCON5?=
 =?us-ascii?Q?KmTpObvuo/o0L0ZeFQAo1b7AHc75iDkWHAlCWJI7+Firkl46re4MQn4ofBj8?=
 =?us-ascii?Q?9A/CKPHD+3gz7ybf/sDn5nlS2iPCVI2SZLY5nKhP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea32b8a-671c-4a02-5d6a-08dd0305a736
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:57.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /e9rB9C6YoBf14w8/45HflvU39ksrcMt7wGsHpy3XMK9QpbiV4qh7JvxERc45LlZkr78bJcFO0jiWCSC2LiETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8598
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


