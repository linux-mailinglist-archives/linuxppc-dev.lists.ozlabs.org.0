Return-Path: <linuxppc-dev+bounces-3110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497D9C53ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 11:35:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnjTx4jtBz2yVG;
	Tue, 12 Nov 2024 21:35:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731407701;
	cv=pass; b=cgdwtQTeeQhs+40WJW6GasmzFmKe10+4w/7zuf+oBSrPLl41UI7UiQ1o9wmvM/YsPEY4/Y7Xpe9JQnmBc+t4OgTVfBQjYCDdm0au4SjsTpSkc4eKBDosqedKcWpNh/5TWVo+cbsXQQk4nntxxv9Leed2TxJAud+lYwP7ZE6mlx9fahiDQdTS3XhOtYPqvQw2FQ4nTvRGE71W8Y0+vfSSTHMEah/7m49yVr6SRsE80vXhyNQ386NIPfrfdRlpck0h5jBYVHB3CgFuIgzWaX279WkD1bNaayM43D7WHoody9MAfkAwNoHp72lvO4viJ5m3uqnszZSmb4AbnaPfq9mL7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731407701; c=relaxed/relaxed;
	bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nN0j24deyFD77A+I82Q1P1teRp+O7wN29FM47leFTL/G2/owne5lCUG9+tu0W4EhJcxl9sDzC2Bl67G2Tjkeef9DPa7nwCcaYVUo0A2lS18iBGDyjtwetPoIIfZqyZQegbi/vTlWt83YWjO9zVygt9OkUz4vgvhY7FCneF5TGiaJFtAvaaw00RwmDiP3xixj5dd28xzxImyLWcbO5QmUEQhpPnZ0BKelhRx4eO85aCkjawIhgqBLO1iT5WiIOQi10cmGAvCP0fjHmIpD5AalQkqSD0cxffwBSgXi5t8mbLAE1qBm0wTOSb7s/KNPXBPWkX/eUrXEMI+J1LheEIe42A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H3MSp4As; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H3MSp4As;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnjTw75R1z2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 21:35:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+EQjw68E9XWU7o5vejt9HaCUqRL+oNyWB/BdwjEGu55psRBo4ByloSLmhnBQzrNaxvNm8TtktRKmgVlrKyJns8pyIIaCpi8NuxLthLUmkHqSlND6L6vyJsCIIDTHJx8Ngv5bDYMBamVBaAAjll/OlkJ//tBQ6kNAEoVwmBGxnoUnYiyYfKWHX8xm2yCL89JtpMqzXI1j6+7deFWBZdJNmlvbGPRVtHpdpdioGCkN6LQPNFZ1CftUR3KMC8qh+9sWIDPSUjSirtwJfs76uqN5oyNVpdM/SvtjbEmYK4IQnVj3O5E1EX4P0SIzPfmkPlAMDA2bMHaOeOS97BrxsMKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=ZnvbpYGcZc8G94Ha0CVFwHYsYWQG2OD2E2NP1mEsAO1IjGBSVIyyugIc0jRhqLV1jnUeoGwXGZfohpYZ1DYMcv6a1MWVWO55bxk/Dl8Ua23BeRBGvrDCnU6PqmEjqhj2BSEzRl4YRCTm2z3P8KqwAHrkZ1KYhtjjea4M3p65nqF7o80fSzU+HRWcOWDeHGzAXrpB75k2kxp70H4iuMLQSLnS5uvGKniYwDimC7Q5O4isr1Rx22Q/81ZXCfnsxwRVakiFWyAq2wrcEK1uU93095YC/4woPrtWjFsEawpwlaCi4Q+vosqJbufAWr3J8PyTPuX967cb3kV0uR46YbOvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=H3MSp4As77kErRkyi+frno9dYJqscxiNEMbV81ceEppmQBQ9Tq2AIZjCvbcQS3oXRsn/C0t5NicqQ9fQUofVtyB3X6LFjuOJWvPfA7Gequay0riqAJp9o3wc5fxC+Ek17+wnupJpCiHZE/P/2XsnnIeeZLhXTDsf+059rKtWGM8c3PhIohZC1rS4RSKuLT4eHNMbM+3U69ZT70LfBcgEZiiSQcDBJ9iyXs2eeA0Nc+OhI7nYxGDj0A0NjlETTmFpu6H0Ch7Joi3QKyoG3oynQMUuW7bXHsm4gLWvAYRHUYpsWfJNyNnF58/uSJNijUFx4HedGibSECa8syKJm87ixg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10757.eurprd04.prod.outlook.com (2603:10a6:800:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:43 +0000
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
Subject: [RESEND PATCH v5 3/6] ASoC: fsl_easrc: define functions for memory to memory usage
Date: Tue, 12 Nov 2024 18:34:01 +0800
Message-Id: <20241112103404.3565675-4-shengjiu.wang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10757:EE_
X-MS-Office365-Filtering-Correlation-Id: 833dbfb7-8024-42cb-c483-08dd03059e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c75y06nanCWY0TsDXfROwN40jq8L52Snu6OnHk8O7N4bBOXEG9SM9KKIrSpQ?=
 =?us-ascii?Q?CGUpY20sa8gWR0XCyOpNhHHAj8TzTiw2zGzJsQ/7nRRsLge4fTYzlDs56JZe?=
 =?us-ascii?Q?/pLqiuudF/0n9LEr9gqNfI1rnozjnadFeVI7fZYXO5AYitTlR4CeQyibP5i9?=
 =?us-ascii?Q?8JReAH4z8V/6kyulHlPijZpWcIAursjkQjX7rloCJ6cJ39k+BVKrPq/RPeJC?=
 =?us-ascii?Q?rW//IZTZsurdmQnMx+5gl//kQBxdH8qLlpWXJuvbPGGyR/1JOTDlvh+AsJl5?=
 =?us-ascii?Q?LL6nUFz9HI5pum/P90SJeqLE43Y8yHJwa9GNRQTfHUhd86bk7yTQvqA523hl?=
 =?us-ascii?Q?4ghIf/l7ggxMPdDfc43b30K/ndLRSyLyddjz1zKcA+8tZhTCI4xmr08eniY3?=
 =?us-ascii?Q?NMs7cmXDYYpUKDQaUqGbqTXM0Di+sn6t8+f3UTM03LSF/dwF1U3cMPc+11Z3?=
 =?us-ascii?Q?TM+7W7VulnaVgSAHXxPcWS7vXi/f85PCYhmG2M31/TE+Sg+AIMQmH9GbPHzj?=
 =?us-ascii?Q?Jqh1ezueT1+i7g0WCeMkCxV1gzKWfisHzn+OcnuTjWUrZR7nmChnT+v5nGLZ?=
 =?us-ascii?Q?aFW29int5g+KHrD23jgdUB00PPvVnvBqRN48R5KRw+Bz8dKPYeoogkE4F5Lg?=
 =?us-ascii?Q?5u/ji0iu5QA590m6nzrxtDbaI2dbp9mKfGacRSPopVt3IkG3UJ+d8gcaZ9xP?=
 =?us-ascii?Q?02b05uH7qvfYa2RA1HEW7lvz/UELehy5KBvXJnj20JWqDcbQjn5wE4gKmCg8?=
 =?us-ascii?Q?FnpYGqKq5hn8wZzmj7cRAdmUky6SSaa1AdyEsRqkxQPG6xNdXinHfM9m+qbh?=
 =?us-ascii?Q?4G1epLvh/9lRq8xh9KTYN4xlNVhAL+k7/0gYkJ5iCF0jW3+oA2b2CmBpmluZ?=
 =?us-ascii?Q?UXjpZx+wC/tX1dO0QdPHr//7juTui+NJith79K1zr+qqtiwamxqJeJA2D1pa?=
 =?us-ascii?Q?0cAKkEmboUGz2zpw31pECLi1yWEgwds96UR43uEVxdu1tOut6BTgDtdktc8W?=
 =?us-ascii?Q?/P39yNxsZCnodAOoSm8ci8iTok1zUWpGaQ3/1av9A3IaEqfgWOZ69Uodk27b?=
 =?us-ascii?Q?RySC9F/zWvOdbVq8voAhHVYxzztYjRinOyKeYzYCpHY+xSeZaJ8eyOlEpeu0?=
 =?us-ascii?Q?qawtJoistqzLm66jgiUfhyAzAIXnqDq1ptshFk5uVDr+8HS3ikI6je3TkKJ9?=
 =?us-ascii?Q?m6YNWP2M9qLkwmiZ63NO9eSbWzWp3m/HBDzzIfi8z88nhI0m4O0rHBeJYPhm?=
 =?us-ascii?Q?z30oPYaHtY9pNzqgaCd7av5c+tqWFgGnEvWRMyI0jSxL8M+xmUZTSRQr8bEE?=
 =?us-ascii?Q?meemtQjkFOyj2wc9n/D/hXprQjcjcsks9yP1ti9KJ2sBZxufnNl5/Sv89syE?=
 =?us-ascii?Q?38urG0rH7OZw8xddIPyBz6Ev5oO9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZpUWuvGfGBR5GOMLI/ozoLMGw0uTl7FLjUIfpvUR2LAbDVbNGaqdbj54q4u5?=
 =?us-ascii?Q?yJkZcxIO2btKSXiMjWJw7rOR5hPreWO9qVbNtFalxzgwasa2RO+FKjPWFknn?=
 =?us-ascii?Q?Jy8ehaGBTG25Chkp8OGzujINtFMLRXrja2qoma62GCmESpMLXfxPjBZw/8/G?=
 =?us-ascii?Q?WegHQwL+5Vbo3yP0KknIW7SAwLYFxSmh+qk03STkfNEksrvEZNTa3BaF88Zs?=
 =?us-ascii?Q?Mug9exQZp7oX10f1Mkkgho5c3xb+wxeUZEuTRXm/AtbIgTmKzGUuAc6vRuHj?=
 =?us-ascii?Q?DbnCDu72EGw2ZR1jyyNsQyoYEAHPyJ+G+FiC1ZsmKjodx30KKNLRlTBao8Nt?=
 =?us-ascii?Q?Z62IP7fhYxOgvPS+sgMV3MTVTNKifnkT1sGQVAyHayK6l/0ZoyZjT/Qo/MnV?=
 =?us-ascii?Q?rT4edUB4Mc8pvmiJVsGDLo1Pdw+EcaIl8sbPCeMFWBQTSPME4Yg2X0BpIbxJ?=
 =?us-ascii?Q?FhPx9IjIU4ymSD+qVYdIL2iy/fiNVzipQispnlwEk6G5LukUQ1NaKYiL2BYi?=
 =?us-ascii?Q?m2/0WLwTzdEWCCJpNg4rmM6+yf52QLhJvDZxfscrg8OxBdJA1aMKUSfdo82f?=
 =?us-ascii?Q?hr2WM+LIM+wVGDfbZU6r7W4AXDcb+KF2Sm1/+NWo1HOHtC+2hAQ+oeITKxFU?=
 =?us-ascii?Q?mryvTX2S3DgRQ2MjuUcW/W5aUrl6ivBULRTe13yM5VnydVrBCRt3BVDSRSaK?=
 =?us-ascii?Q?VYAI8UNaH/HYnTpaBmEveWJrkH0oNQ5eq0JWYsQSfQ0gFWh9BeU2EAdr+hcE?=
 =?us-ascii?Q?wcz8z9HOJu/xd3AHphbcnygqoXo/LUmANx0+TH5C4ZM9CvEuTjkgSdVNOkBX?=
 =?us-ascii?Q?gKIXV0AYlRKewyuDrdrrlNo2YRxzUfj2WupJ9y9gpiE7iC3mUMXe+/pZ13/y?=
 =?us-ascii?Q?jid81obgMBKaVS4JGeRcsR2UNPoLPGA0wAo0DbM8SRjPWGmAgfXfAdNlzqSE?=
 =?us-ascii?Q?KPJYnheBOrkXq91/tv7zNseBufQDjx4mjKpLz5aQ3+0FnQPNRUIhSJC6TtKJ?=
 =?us-ascii?Q?rZDVYA0loa3SK1AfX/OUTpLeFXe9jClqbUI60mItRnwHG3EwQXhoFnNResIc?=
 =?us-ascii?Q?l/93romDlZ2TxL0bXfpqF6bomDrTHXioc5qNU9E/NaRJAojx+PJemGfx3pS4?=
 =?us-ascii?Q?2BhVjYXtiBD/TMph9CcZ7C8Vtaq52STqhoCPqSiDqkIkgkY9znkTvF3GrfOE?=
 =?us-ascii?Q?O/LGNMMiypXwjQqlu4xsLvKMB1jPCngevKowO0J+kwzRG5kkQIS7DbJl6TBP?=
 =?us-ascii?Q?ThtuWVvpN/Z4FTDhcgM4RVoiUyZXXq6PhNVR5OrMQZIm/CdVT1UB27baV6Hm?=
 =?us-ascii?Q?P9u/bQrislrLqF6VHvpglzRJ4JpHRjZ3HeGbtZv42nViiNs7Wf9zBckCaRs6?=
 =?us-ascii?Q?ndSylt7tD661DZH+HtrK9MllrT5hMxk2jO9PZ8ayGiUfoeq0jZHFJZpuMyz1?=
 =?us-ascii?Q?SpTU8jF4EQvAi2n8L68cwHFJRVBlC5fSJVoqzrrEIpzFMe24UnN7DyUBcPHn?=
 =?us-ascii?Q?qjn2bRJGQUZcAG+uCKOlYXgE4rZnyCzW1T6l36WIzPXseuC1s33H1NJ16afu?=
 =?us-ascii?Q?BbkWs6J1BtrmN7PAkmP8nx8uS9k2meDp5b6D5CQ8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833dbfb7-8024-42cb-c483-08dd03059e87
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:42.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: It4piUhJiI2B9pCobzwMBB5Pt6PKJoKBHx1r8ok0wGbuEnIQ5sOfwJtSIiAsU4+UQHMk1qcvUib9KvTyDzJomg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10757
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage and export them as function pointer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 228 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h |   4 +
 2 files changed, 232 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index d22f0621c465..f17a185a1910 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1861,6 +1861,224 @@ static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_EASRC_FIFO(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_easrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_EASRC_SFS(index), &val);
+	val &= EASRC_SFS_NSGO_MASK;
+
+	return val >> EASRC_SFS_NSGO_SHIFT;
+}
+
+static int fsl_easrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	ctx_priv->in_params.sample_rate = pair->rate[IN];
+	ctx_priv->in_params.sample_format = pair->sample_format[IN];
+	ctx_priv->out_params.sample_rate = pair->rate[OUT];
+	ctx_priv->out_params.sample_format = pair->sample_format[OUT];
+
+	ctx_priv->in_params.fifo_wtmk = FSL_EASRC_INPUTFIFO_WML;
+	ctx_priv->out_params.fifo_wtmk = FSL_EASRC_OUTPUTFIFO_WML;
+	/* Fill the right half of the re-sampler with zeros */
+	ctx_priv->rs_init_mode = 0x2;
+	/* Zero fill the right half of the prefilter */
+	ctx_priv->pf_init_mode = 0x2;
+
+	ret = fsl_easrc_set_ctx_format(pair,
+				       &ctx_priv->in_params.sample_format,
+				       &ctx_priv->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set context format: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(asrc, pair->index);
+	if (ret) {
+		dev_err(dev, "failed to config context %d\n", ret);
+		return ret;
+	}
+
+	ctx_priv->in_params.iterations = 1;
+	ctx_priv->in_params.group_len = pair->channels;
+	ctx_priv->in_params.access_len = pair->channels;
+	ctx_priv->out_params.iterations = 1;
+	ctx_priv->out_params.group_len = pair->channels;
+	ctx_priv->out_params.access_len = pair->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(pair);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	/* The context start flag */
+	pair->first_convert = 1;
+	return 0;
+}
+
+static int fsl_easrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	/* start context once */
+	if (pair->first_convert) {
+		fsl_easrc_start_context(pair);
+		pair->first_convert = 0;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	/* Stop pair/context */
+	if (!pair->first_convert) {
+		fsl_easrc_stop_context(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	unsigned int in_rate = ctx_priv->in_params.norm_rate;
+	unsigned int out_rate = ctx_priv->out_params.norm_rate;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int in_width, out_width;
+	unsigned int out_length;
+	unsigned int frac_bits;
+	u64 val1, val2;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val1 = (u64)in_rate << frac_bits;
+	do_div(val1, out_rate);
+	val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
+
+	in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
+	out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
+
+	ctx_priv->in_filled_len += input_buffer_length;
+	if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
+		out_length = 0;
+	} else {
+		in_samples = ctx_priv->in_filled_len / (in_width * channels) -
+			     ctx_priv->in_filled_sample;
+
+		/* right shift 12 bit to make ratio in 32bit space */
+		val2 = (u64)in_samples << (frac_bits - 12);
+		val1 = val1 >> 12;
+		do_div(val2, val1);
+		out_samples = val2;
+
+		out_length = out_samples * out_width * channels;
+		ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
+	}
+
+	return out_length;
+}
+
+static int fsl_easrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	if (dir == IN)
+		return ctx_priv->in_params.fifo_wtmk * pair->channels;
+	else
+		return ctx_priv->out_params.fifo_wtmk * pair->channels;
+}
+
+static int fsl_easrc_m2m_pair_suspend(struct fsl_asrc_pair *pair)
+{
+	fsl_easrc_stop_context(pair);
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	pair->first_convert = 1;
+	ctx_priv->in_filled_len = 0;
+
+	return 0;
+}
+
+/* val is Q31 */
+static int fsl_easrc_m2m_set_ratio_mod(struct fsl_asrc_pair *pair, int val)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	unsigned int frac_bits;
+
+	ctx_priv->ratio_mod += val;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= (frac_bits - 31);
+	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_EASRC_FORMATS;
+	cap->fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	cap->rate_in = easrc_rates;
+	cap->rate_in_count = ARRAY_SIZE(easrc_rates);
+	cap->rate_out = easrc_rates;
+	cap->rate_out_count = ARRAY_SIZE(easrc_rates);
+	cap->chan_min = 1;
+	cap->chan_max = 32;
+	return 0;
+}
+
 static const struct of_device_id fsl_easrc_dt_ids[] = {
 	{ .compatible = "fsl,imx8mn-easrc",},
 	{}
@@ -1926,6 +2144,16 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	easrc->release_pair = fsl_easrc_release_context;
 	easrc->get_fifo_addr = fsl_easrc_get_fifo_addr;
 	easrc->pair_priv_size = sizeof(struct fsl_easrc_ctx_priv);
+	easrc->m2m_prepare = fsl_easrc_m2m_prepare;
+	easrc->m2m_start = fsl_easrc_m2m_start;
+	easrc->m2m_stop = fsl_easrc_m2m_stop;
+	easrc->get_output_fifo_size = fsl_easrc_get_output_fifo_size;
+	easrc->m2m_calc_out_len = fsl_easrc_m2m_calc_out_len;
+	easrc->m2m_get_maxburst = fsl_easrc_m2m_get_maxburst;
+	easrc->m2m_pair_suspend = fsl_easrc_m2m_pair_suspend;
+	easrc->m2m_pair_resume = fsl_easrc_m2m_pair_resume;
+	easrc->m2m_set_ratio_mod = fsl_easrc_m2m_set_ratio_mod;
+	easrc->m2m_get_cap = fsl_easrc_m2m_get_cap;
 
 	easrc_priv->rs_num_taps = EASRC_RS_32_TAPS;
 	easrc_priv->const_coeff = 0x3FF0000000000000;
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 7c70dac52713..c9f770862662 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -601,6 +601,8 @@ struct fsl_easrc_slot {
  * @out_missed_sample: sample missed in output
  * @st1_addexp: exponent added for stage1
  * @st2_addexp: exponent added for stage2
+ * @ratio_mod: update ratio
+ * @in_filled_len: input filled length
  */
 struct fsl_easrc_ctx_priv {
 	struct fsl_easrc_io_params in_params;
@@ -618,6 +620,8 @@ struct fsl_easrc_ctx_priv {
 	int out_missed_sample;
 	int st1_addexp;
 	int st2_addexp;
+	int ratio_mod;
+	unsigned int in_filled_len;
 };
 
 /**
-- 
2.34.1


