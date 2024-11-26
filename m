Return-Path: <linuxppc-dev+bounces-3562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC569D9163
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 06:34:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyB883Mq4z2ygY;
	Tue, 26 Nov 2024 16:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732599240;
	cv=pass; b=agu28tIwY0xT9hf3B6UMgYpQsWY/6hU3xeyYJOpPoCkUW/S1sHX/dxKsrXT7dijUeR4Wt9tNSJX9B4pOn2eDCeRsP1UEn03iKZ+mMd6cXiHSkPTwVnEavqAdfTk93o3jc853vxzRiKTzGmAagM3WAupe3rzUR9JgoqvJ/QJ99JMDJWI1kIoGN7/nelCeI9IIRhfywhx9zYrFCzfA7/lOS4ODctRKiBpEFqk+858uxwCnZqZUfQdCBy0eQLb1Tnysvk6fgKlYkv2EfCB5kOm+CoGkLDG6/JZot16UaN2+EpfRGfpOdI8dPOwo2SJ9i5q0Xuj/DnWuWrzWN93+Ss7u/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732599240; c=relaxed/relaxed;
	bh=+SBVo+6R8TMqDZjwFMlALR7NB/5af+hC6iksur8b5MU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RYeXr1R6jkZ7NrChbwenv3vESQ4eCjqq18ExpfI0Ll+TgMVeo3Mci58XLg1xj2p0Zx9G5kEOWOxrFc6u1AHlTKxuqSmXrH7CUiAE2x7iQWDLvJsiTrYlwpPLvK2W/Yx0kv6dNAclkFIR2zH/xUSAPpNsd+k8yyKThuyDocNN/vycBAVbYp/1OwjpqGTKe5TYxxwBC/TPYdHlj+qxwSxQaH90DlwMoy3dZORKMZ25J9XqiK8MedgHKzNx1wjEvzZ8IAPQbpMrDFTdLPFkuD4rzutR49eXHEsDgK5Zu/BqBnmh0KgixdwnvB2KNS+ROvDSgSdvNwVltxpBvGy/d2Rljg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I7Obt85M; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::615; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I7Obt85M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::615; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyB875LFSz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 16:33:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ6JTeoEBgTU1zUH7gLuoRgMNXs1rakje6Fn29uh07EtfXwr9lZ2lurn6Kii5jLUBEaahkO6zR5N5pKQcbCb9Sss6SId1VBP/mXAXVHFosgcyuGFQbPQJK/RoGOj7kFUK89FJfHRnxpvZMEiclp8v0lI94PTg7nnpbAJRuEzRSi7AecM/tTwchR6IM9UOYq2nXYvDaSIN4jHJLPkiEk0rFgYLhL+lQHt2zSFC1DstMRcVZ4gyqwSNfBPZTjoL1CWeKgSRA3Zhx8SUNzjQrwaa2Oo9JSd3emx7ykmwnmy+zAqadVyIUgxDcBgYlhOLfUZFy6L1S9BN+YxkAaO/atSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SBVo+6R8TMqDZjwFMlALR7NB/5af+hC6iksur8b5MU=;
 b=QgS92AMRUZWtA/3y4rV8QdkR6vQUbZ0X6KAObvdM2rse+21s1VcTBAYMrdjf3GNBa/8OBgdX28GPSHGSjopLdcPNTtHQ2WHMZUDrVw2yforjGnRxUnwMzoXGbbnUmhl7xONLe1mKsdtB3jtpAwOsIfPUMNi8bGAM7r50xlclUHw8uhx4jmsCMi5kFhVYvDsCMXV7ye4rda0w88IdvHXnb3IfRf6ar7YKVIgqh6gy3qsIv3oNmxUJ+YaqjMWi5BwColg/ggopR51JVsHxd8WeIgnvtHKFfALbC3yMvNnAY2bhMyTEpXm9LQZBjYQSmtQX49BHWyMTY9B3tGsl/5OHLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SBVo+6R8TMqDZjwFMlALR7NB/5af+hC6iksur8b5MU=;
 b=I7Obt85MP+vYYLNvyp5w1tRKbBcp9uhoI5+8uBjkq24tb8eFsN6s1O8Esh/yWkJgSjwFG6uajYWJLvSYl9NzHyO0DCYHbHdcbclAs5v9rSlJRCDT9RywzEkJIhq7VjPCkNUiCpA6T91cvM7LEb1XWBaLRghMG/6vVJnPTTdmLQ9WIjgeVFixX0bqPoJh6JqyAS0AkI439P3WyKDgpZsHNZdVH3X9OyBcbEzXDbeTt1rrW4u90o7K/uw03M/Zf1B+wqkMl7W0DJn5jG099+s5lmnYv6b+yIGHN3siOdUqxc1CyR3u6eFFCuzBcyvcrkq0txD6kvDbNSmMJkiHIuMakA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 05:33:37 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:33:37 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
Date: Tue, 26 Nov 2024 13:32:53 +0800
Message-Id: <20241126053254.3657344-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
References: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 689d76fe-4228-460b-b275-08dd0ddbe016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYtXmsfmdmqpVGZGM+TgrtpwDsn+Txy83+aSawNLk1wyMYKuGXYmCDabu0A9?=
 =?us-ascii?Q?yUZIYOFlMSK5s/IqtluNlWaA5O1Gz+L9Wge9gBmoDawTBpJ+9Ay9rCjk5vUk?=
 =?us-ascii?Q?WMTLzpv2xguPcV/hyKvRR5Y32fnijvoV8ljq3qNEDdMejnfiPoQtqVKS9rRi?=
 =?us-ascii?Q?zuaLQDe3d1ayAIVQKSBfaxhjL/IDEfJA8fopXO2XZ6Ziwl2vS0YbmgGYu5f9?=
 =?us-ascii?Q?0JP2MysMfYNT0vJagFVhabL9SKf6gcGuCQOokLuyLip525WxI3FxEPSV91MM?=
 =?us-ascii?Q?HOdQoIu/aVABTUkPzf/oP67SnJ7DZzPWzRn/azgM4PE9rtvCY/DmCJNQW7++?=
 =?us-ascii?Q?YAEg2OhMLsOL/kNgGTAhhhvkzDI2GWjWkdnxmYQLcNHjE5eZ7gHXhrthE5md?=
 =?us-ascii?Q?2ZVP27GgExvhmGUEJ+4L2ZB375CVK3/m0/Q8SZPshEcunPb2Acw2QC4XE7Yf?=
 =?us-ascii?Q?ftAfXi3mlEQhlKd2PW+dMXjAwOJ5ViDF39uZYcm646hTkhYe7mz4Ht0ZAEFT?=
 =?us-ascii?Q?sHhIxvpFKVOxWz7sRe7V2xZf2H0mQJMeOfKv6AwdDIhnzGIfXrDgd/5Jmanf?=
 =?us-ascii?Q?qBFpsEfTpr9W0+JHsx5FKDnZZMMKFhIixLU5EY5HVsuzJz/KxHCqxaOHzsni?=
 =?us-ascii?Q?m2MSu615D9SsIvGoYTAqzpuCMcCnpIb2oFvxASPrJ665cP7MvH+EP60qhJSx?=
 =?us-ascii?Q?GjiGuv6tK0jKSE4Z5TiXIIS+RU9LHAjAk3LkkTOdww+MsfXfdx8q78GzIfGE?=
 =?us-ascii?Q?tICtat4TROUMVv0nsCbEuZNVbUu/CsRe7IpYN02D+7+n3x7s2LqzJ38sg2J+?=
 =?us-ascii?Q?zN3Wyt7k15De0QuBSm91jT9TyIrHXzi+L3a2/mthwGeUTQiK+OsjvuEBXTBd?=
 =?us-ascii?Q?PMhNXVmZWIYKz8UhnQZ1PFCMsrgn3O3zn8vvFd8IjaWdlcuEqbws/8tYZcKB?=
 =?us-ascii?Q?VDzsYQ/+YUhNwxOLPEWtyPXmrLdhRtX3yc66hXglPr7o6x3+YLfZ7Y6yOefF?=
 =?us-ascii?Q?lWVPB6QDKpgTtW44UtnmBdH7/SRevTFCyazd0TZPRMN6X+imzOQ55a+7Iquu?=
 =?us-ascii?Q?A7UuMDG6E58uQiBzB3XZXjtP5DU7xGFnQ3n5dFNioIm4j1rSHnY0A9DcVW/I?=
 =?us-ascii?Q?aHUafr6yYO5M2NDYBD8v66JwglMNM5MUFlv+CnURE4Ro01XA8+8YevwIsNxZ?=
 =?us-ascii?Q?n6wHuypqPMwZrLPfD0Q2cpk9BqaCWmovtl8MKFsOGWCF7OdcMZ//A0mtumhJ?=
 =?us-ascii?Q?BZtq2UMAHEJj17nBR0x71wEFVvb67FwrNXr9KVJ1t4PnvTfmng/SDbyCRNpv?=
 =?us-ascii?Q?Ggdjlv4pCmIVm7tIUOMmc8jOewmtWnWpjvTZ5hoNyd2FOYK/AIvf+ONADtGK?=
 =?us-ascii?Q?RcPhy6cHSKi4wWBKWCIs8RlzAzKr2SVe9gjLCTPL0ihy1KHocgmYVbwd6h2o?=
 =?us-ascii?Q?XM+fzS1C76c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MWR884j76w3IaRdcHdDxZG8WCgq3kVQzgJXDzjZGQdOaM74DyZcntTXAM76N?=
 =?us-ascii?Q?sHPaePFe1nGMcLuSTzgxdIgdMdq/sUzmzv8+VpEB4BA0Y+2tL2EheJJuJXdR?=
 =?us-ascii?Q?1HBYr+B1i8PKlYiv/kLtQGiyWtsBINVFsihan1rdV6erWOf/4mq/x4OPU356?=
 =?us-ascii?Q?AwF3JO/dPo0msD5fdGcU7pRwyAUgJ1v6gWPD2deHQTYWbc6jpD71p5Xnc0TN?=
 =?us-ascii?Q?cT+Q4w9EYz6S85rjPlQAhBiKTSV/gy04Ogm8a1gKIuhjBc0k0cttLoWLWMLJ?=
 =?us-ascii?Q?7ogZLBzSbTAPrUD5tcYTUBod+epg7HwMtzpwXNVc1f05v5tmaLfyIb6rFR6k?=
 =?us-ascii?Q?1uVVZpSQ/WnKz+TTfWszIPiM34jUE7a4yEDNBy5M98OTRsgEywpHD5B0VfM/?=
 =?us-ascii?Q?rOdfIbnyAx3MKPoO4p+3O1PnDWyPWpzOGbI065RzoStCITPTMtD+lupBUMpL?=
 =?us-ascii?Q?tbPaUXtI+1KJkdKUaOtEfVp82GOBy7oy3K5kL6IdpG7EiWHiwupjlmx60NRY?=
 =?us-ascii?Q?CVcs3s8tsPqUjh9cAzY0oJrTMRnKexoVouV8GsfvsPFovp0dFmqYAwygFEM4?=
 =?us-ascii?Q?Sti0nqeGkT9+/k+XJtX7B448zPxysjj/H5GBxUGelMdhri5OgeUhL9ZwsQmf?=
 =?us-ascii?Q?evf0l2aYhXqobq1uZxUVSGkkgeTjTmCa7hX0zAvH2wrfivKk7pbL/o+a92z2?=
 =?us-ascii?Q?5HC5heAPBlsiOU/QkPVJckVUKgDlBjicIQudowtXLTsf2wMuDnRlV5nVFNYZ?=
 =?us-ascii?Q?flw6S3kH9cQEproKb6YtVL6TLj+7L+k5qPPD+EdMZ/+y1K6gMxQnP8LKCnxn?=
 =?us-ascii?Q?rayIeak+zxjyXQzUF3yBrDQ9JDb3x7j8q6gY1fKCVC7bozGbwKFgXrj5m0HC?=
 =?us-ascii?Q?BpaAS/wc47L8+WTXpnmhPqMcr1D8r6wl7VxZTNFczwXGvbYHkamV4oxykjxM?=
 =?us-ascii?Q?p/prr7eaFwnAaC/n7CLQEzDT57CbmslnnsXjV8BYxGRfb2trveU3suUfa3r0?=
 =?us-ascii?Q?JyEKYQsJ8XBW/oEITAKy1tf+PlwdKAVJfH9PcLcZcR3fXodcFgrP8IweGDiG?=
 =?us-ascii?Q?h6BbuHOM5zKwlbMgkJGWIuKR61xZWuJZt0MJLdvqC2SJtYdmtKMWZabftoNF?=
 =?us-ascii?Q?3wsmuwxrz1UDzWIzR7n5hGmk8RE03uz1VKeJPqlgYNCdg5frmZTZ/aMFr7UW?=
 =?us-ascii?Q?lV9fyQRu7UtgV97hfnDte1lbvPVwp7GB00N2e41kUhQwQvjNAI87JdCEyGfW?=
 =?us-ascii?Q?lSACFUH6fUVprDR83C/7vtcRVZ/THBTPXTFvHe0ASl4Qx/DxHrE5/yjiJKWG?=
 =?us-ascii?Q?8mkkCJEaVq/kWsFhtMi9obkLNJNp6WliaqcAUUPsWxYvsudajOSjJkpTZeFo?=
 =?us-ascii?Q?MoS6CdbM8cgCx7QvhL18vtMX229p7mZZSNpDMEwemEclFvEqBOggsoiVuvA5?=
 =?us-ascii?Q?iyJ0ioHUbop/SPyLajEJRlUYXGhqxuWZHL+G1jvCwKGG0uxi5Xn/l1YElgY2?=
 =?us-ascii?Q?+9CgV+dukUEZOGf21o9lKOx7HuhWYp9eptLjmhJ3E5NlwGgBbFJAZ4IscQ4E?=
 =?us-ascii?Q?6yKPUVm2+fWl9D0kQNwI3pcG+zFWK71V8nN/t2J/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689d76fe-4228-460b-b275-08dd0ddbe016
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:33:36.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kE166K+/49D5oc8IUOUkxap2X5L/b+d43HhxGDVMipKvTRd+XnEUle37RG5LQIjniGHPZ7GKdwmjhZ9hUtGMcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As the snd_soc_card_get_kcontrol() is updated to use
snd_ctl_find_id_mixer() in
commit 897cc72b0837 ("ASoC: soc-card: Use
snd_ctl_find_id_mixer() instead of open-coding")
which make the iface fix to be IFACE_MIXER.

Fixes: 897cc72b0837 ("ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 1e0bfd59d511..9c184ab73468 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -171,7 +171,7 @@ static int fsl_xcvr_capds_put(struct snd_kcontrol *kcontrol,
 }
 
 static struct snd_kcontrol_new fsl_xcvr_earc_capds_kctl = {
-	.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Capabilities Data Structure",
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.info = fsl_xcvr_type_capds_bytes_info,
-- 
2.34.1


