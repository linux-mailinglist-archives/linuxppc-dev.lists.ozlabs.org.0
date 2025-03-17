Return-Path: <linuxppc-dev+bounces-7157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA02A6599F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 18:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGhGn5wb5z2yr6;
	Tue, 18 Mar 2025 04:07:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742231233;
	cv=pass; b=Z2VGLdetwy+it7ITGKOw2adpdUScHJJdvS9FME5DfeoWk3qOaZG7wHym8Pv4VLBO4vZDfmP7CQAZMxZ/IpgxprZm2Oorw6Xzq76UkKoKTHEIxDKNkoZVnnAidXrz9NVGjSJV0mS10DaG4f5sELcySpXu1God9exWDPBI4A11Zh+SESZE27VBil4gNcoSuF3DYRSNF3DfJuelWPMEU8h9ncjTV1MQwkWWCCz+M/ACUx+ohmW3QUMv/QX69h6zXs7TBt881goyajoz/hJDJWUmfk6aMCpQRqSCWdJcCVS621BHZ8/DrAfUAjJOGuEAmvO7K1mCvPcj1y+7f//t0Ps+xA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742231233; c=relaxed/relaxed;
	bh=zZ7JicH97IOIX0mC2Jcn43IVeloptJKXUjIGZVeDN/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eMZOthIUILL6+fPPZVM7jzY3EdLTRSFMZtKxjfef2mBe64fTidms4AewPShT4inoQ4MuRmZzeYa3gpcwCauclhTKMStAPnlQXvXalzmc1DkICvEvzj7HxnYwM6elPUW+NeeGyF9bkM7h/off3F2ZISY/9wv7xWdFbwQlHA2UawjOP8tF87o1c3sHLB8l9lMoJeiGEuM54c+34BXHksJIKgv102xMI+Zz95FDcQBjDSdZXoeRSo6c8BT0eTDL7+KY3GGWAtTWDUbZohZKLeh/tK3ReUxtCRgVbQRH+GZHxrejirWfCZTEMj6sXGWKoyr47jrjehZFkU8ZCpWYAAC5Nw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AwfE1nEc; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::62b; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AwfE1nEc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::62b; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGhGn0SfXz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 04:07:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBQPMIGOsr/g70ww27TY2R8TOu924gqNbILkWEbBob22eP5JCHO77bA3mODKAIdHtjQH7xnfEcjLtrYMaUNDwNMWdDkxfJsl57R2bBFvNTJXSepAEzUHHRGQPBZgEUUiC2cQ/HSajsF//rTaGXP48/deCrX5MEOPZDAMLbOEvrIvZ8sM7+5nGry3LoburuJKvY5Rkm0BXZx71I5q5FJ4kl5qsRlKpJelKQFVV9MiD9sk6/QHcwT9Elbri3aXUkiG9RPmvupZRH8KYigGrbDqQqd5emcuQwgFSdP63L5wmOhRa1UiVoK8oa4j0zYwHu3qSJnPhiKKvhNyoWgy7VQoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ7JicH97IOIX0mC2Jcn43IVeloptJKXUjIGZVeDN/I=;
 b=XCebIAdYIbyeu2FkUs/iAHBH9GF42guCZvxxRq2IkdrQ/l5fBzh7chnhFj6eOsguPg6+wbLZM7RF54G4sbRoUuNRjvNStKOUx0q0hxLoPoLZQMte/I0p3XDlA3rHxCFb9I1CGiSyfbIrGKth8JfjwliHbhuV6PzaKkU7T60K0f1OMJaWP68MOR4cX32tCtmVJcC1Ux2VWjC1e8WsHnxJQ2fxksT5orkpqYqN2TWUA6n3pSFJCMZGRmaVHu/m6sGRVHdbk5RwwE57Xr4kIoks281IBzYQod9LveGvffTd5hdKTsu9zn3fREcMr/6K4yTZaeCKyqC48DWONLSPicNCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ7JicH97IOIX0mC2Jcn43IVeloptJKXUjIGZVeDN/I=;
 b=AwfE1nEcn1WGJm8hnuPv1T47934X86KKTndwy9iEYugaZHn45cC1nMu2pN5Pbr2HCoCQ/0vTsl+aslMN4/AXg+IrDeCh1lDHDbgiNaVAXBUM6txhxpv9gMhOjgTrYtqJCzDP/GuV9Qk47oWH7j3QcmQNIFOR4UGrU+aB7XnueLadO58XSbG0grYlkxkjd+adufV7+liPEfzYtD4mGMJPpBezasWe9IKyAuUV+RoMjB7XW/B32fVxIrVpLogoNGsI6qpsMYzBZoXKjcs+J3VJzPHNg5/H5BnfvHpbVFeVMWGLRLQSzneS/lduOZFdlRRk1whJ6uZYHqfZ4YeNEqq1kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GVXPR04MB10897.eurprd04.prod.outlook.com (2603:10a6:150:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:06:53 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 17:06:53 +0000
Date: Mon, 17 Mar 2025 19:06:50 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 14/14] MAINTAINERS: add new file ntmp.h to
 ENETC driver
Message-ID: <20250317170650.4oux6kxh2ng4z725@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-15-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-15-wei.fang@nxp.com>
X-ClientProxiedBy: VI1P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::13) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GVXPR04MB10897:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a332508-581a-48dd-fb96-08dd65761d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9+uf3ra5q8xd4r4ixHKFHLG3CrTEFxTzvzI9aGc2Och8CUmPvPTXgj1zp8W3?=
 =?us-ascii?Q?H69P+af4unOtNJOiiv+XQp8ItJILiXgE/wGjYwkphJwyujd2o8Szjar0NsT7?=
 =?us-ascii?Q?WYvxvhQY+WczitUvS6pkkscBngj+qryLJnTqxZ4HXvPX37wMPwTfXcRDFRAM?=
 =?us-ascii?Q?LIlCZCzMHlpRQ0gLZPrGlZxf4+r8KI8OgkMv+2VIbHCT6Zs4b+yMXDgOLPdC?=
 =?us-ascii?Q?IvEDS1yVCiMM/ecbVBhmtOnV1WWHjT1JmbQNnkio2CrM5SDYjVSzMyQGTqi7?=
 =?us-ascii?Q?zYy1GdkZVDu5TFXPdCdT5HkvG2gway+rn/ztzlnLud+z08imHpp3BkdZ/uHk?=
 =?us-ascii?Q?uOZ8QlpCbi7ff48BOjqAu9W6Najvddeks8JF8TEz6yw/AcRnwzozpFtDeBEN?=
 =?us-ascii?Q?LR5XJc5FuTAQcnqJ+XYKAMZr243Z8Ysjyf6IvAcvHMwSHzvEdPf9jPM++yfg?=
 =?us-ascii?Q?A4Q0RH1du4CauB3h4QFFZjdc5NQ/HS2rewUKYhFIdK67/xrp/9y6aCwgagh3?=
 =?us-ascii?Q?UxWfNSr1OtuOWuuR2WRtg6JWZkGfQU95dLLMTR4mKJZ2Oo92JN7spnPuIuxm?=
 =?us-ascii?Q?ZeEYzcOOz/gCEpjQasgEde501g61b0v5GjEIWtypXj87bFcV93OaTPWKVw9E?=
 =?us-ascii?Q?JueNTIb4OlwdInksOEo42QLL6Pb2wyAh05FSuh6/l+JUgbvHP4PXMMLagbYK?=
 =?us-ascii?Q?bWZcHQvvBDPIUraW64Z4oVMNgcqP6EWjKcwcyRy9+vMr8HsRwxSzOXPMX6ww?=
 =?us-ascii?Q?tEwIj/Ofo20x0VJK9wIfyhYsgY/JD9/Z4pvb7SsfHWAONq7Xe0CtSvLbGjKl?=
 =?us-ascii?Q?4qhS7ivXUbCLjdCnfhCan/m85wkr4+D6lb4RdLNt85aWY7Ajz+buAqbKiYWb?=
 =?us-ascii?Q?fvX5AavdXHe+6fahUPO1lRlpwjDWQtrsurAO6i8EG7GyG8aPsplxbkBMERKA?=
 =?us-ascii?Q?+hJoOg5+hhWdQ+x/5aNOzux0QbDOMPp/LDs5uk/NCBLX+csD/msNtfh7Rlbe?=
 =?us-ascii?Q?XfKGwjI0SiYUox3EwOKp973GGycEY5u7KP7/Pu1o4a69veHYauBM0xQyOXuO?=
 =?us-ascii?Q?DJ2TlUPCLupT0ttQkBQJXpVrv+rGL9pmy2SDbPPd5pHOnoDsa0jNzj2dZ6Kv?=
 =?us-ascii?Q?hCZ2bXWZrTinwGgJEJL9F0XJFBl+fGsKV/buQtD///sYiyBqsePTnfEaTD5M?=
 =?us-ascii?Q?8QDk42s8ngpt6rl0B5COVZz/F3qt8MhcjpFrUII1WR9pF63MTBJIVS7KqQPw?=
 =?us-ascii?Q?c/wqYHlqcIjlv6O5ACaw2qJg+y/HiUkJlh4XPUhTjmjik0N21XVly8iVC8cf?=
 =?us-ascii?Q?mzwTLOSzYn6ARUleByg/97nzk4Qi1Xkr1DpgOBhp4wdnDLINBnFw3oavgup6?=
 =?us-ascii?Q?bNxO6oBqwCNtxdPNgwWLKU3/uvNx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUJYqkPHD2NEPFZKdEyOBIFoMBTHhPjJ/7TqUtGUHztCE8rWkaLMwA3cdI32?=
 =?us-ascii?Q?i65C9RM2JH5P1x3kQukyLVVSGRmIpyXQdXMO2+wJci8y8Lqc8SLCazti/OCX?=
 =?us-ascii?Q?tAjduJQWctRXWGEGjNcdCG/HUpNF3RHrzNE++JVUukV7EwRna9kS7NJuBZ45?=
 =?us-ascii?Q?8HtrDuq5aRQgiG1AE2QlwMC0kHxjrxH6cLKKLsGd5PWEpABvnzsJFy29XTA7?=
 =?us-ascii?Q?/ZrPg4Y1KCWmbsp6SYJsKnD++AQ8TMpBhu/B0oqHJ/d8/YCYFjOC0Nt5APbj?=
 =?us-ascii?Q?S7rn/tlZyw7Ugh5sQivURwPIVklxwT/71dRcrxFwwfEilgP/7PdcL1fW6DJu?=
 =?us-ascii?Q?tfNMpFOMo3eefzFbA2swWgH5v4WHZky1pYkmC6QBJOQ15nCKwSwlsBlzFbLx?=
 =?us-ascii?Q?aQLNGekhkZJ22+JPlIGO5S+LXdcqnC+s/e7feuZ2GiQcT0cKemEBb/AHhnK8?=
 =?us-ascii?Q?aBpD3cAMXTQtfau2DJRTgUpDIvjFOnZofzYsfuLs28lyzLLEJg5Ge+MGZik3?=
 =?us-ascii?Q?XXuCf4lxTBqcYo0O1/faV/j8K3ug3/Smkw5fwrf+anPgunw5etmraATTqFkX?=
 =?us-ascii?Q?+R3FPoZL/R3yXu33fzq/n5XbYDHzFL9/1AO/lsGFMNZP00gGZJJfB9X/rmBr?=
 =?us-ascii?Q?T6JJR6f4rDhlNry5vOhPZcrd1UfYut07nLSgXWFGtddjrVdV7+M/lHXFAW2G?=
 =?us-ascii?Q?x4x3jDKrz4oCdNtMhgP1abIyIPTup8S5ceZlSzDSCCzT2urhfRa6ZZUv2aua?=
 =?us-ascii?Q?1R+J246uVci0iBPkZ/kQ2Xy5XkM/nX4E4UbB6K8R0YD84bnHsmycsSmUy0fJ?=
 =?us-ascii?Q?4MMzJwAwADgtau+fJfLzNBR3/wbDLAK0PAvDhkooqKYTlzLz96ETn2w5/Ivw?=
 =?us-ascii?Q?zspJ5PeMMvedLb0ub7hKqRsW50Gu71FqdnLMrTJH+2wWDGCdvQp5rMivccQQ?=
 =?us-ascii?Q?4p8LlOqdQ2ocFUpGUk2qZfnDm478VY943d0dW01ctUpXIAo5cSzx+HCPBS8h?=
 =?us-ascii?Q?9hpA3gEhQwvjMZec/AUX4ZpFUM4WBvyUBxpvoc1dWp0edV1ShFrIxGPRT6Ed?=
 =?us-ascii?Q?RNqVocI6Anvn4rxgFmee7s8DZ3mEjTUJKFT0mvaf94FWbnG7qEM1//tpl47C?=
 =?us-ascii?Q?MGKmYrR21Vjw0BmK55+H4U0hMtRt1eMJfmzWnTxiSb7y/elqN5Bzfm/7fliR?=
 =?us-ascii?Q?WZ0NnzOCrHZaIY0JGXoJTUxiMCrfqI54o9kmlvTJxFwEd3leAAec9lCfwpmF?=
 =?us-ascii?Q?iHnVzdDgpXKvVWvYkqyz8i0XHOCMlv6UXRLWUSgYiY1l3Js/+ffpzU21BBsP?=
 =?us-ascii?Q?WDjLKbhmpanrnLjJY2M9ZDahaj+oKRcksGRYbju1q4ek3U9Ngw5Ievmp1Yzz?=
 =?us-ascii?Q?gG11HUTXdY1P44x7FF0xViVUszR67GESPfxOgjlHK3ecHogBM0q/JBeC3RwS?=
 =?us-ascii?Q?LLcG5HlE+fo9pHX1FitdZXnH4CnAV1/pBI5rO903NL2p+kTHXszyVQZFirB0?=
 =?us-ascii?Q?JoAZeSQD3pf82KlRCeXA84vvf3D00ycUi+XVUeGy9m4mqy5760iMuVIx+AII?=
 =?us-ascii?Q?l/OEcp9HDx659Dup+UTtUmJ7ZzGj12nZqB3SknzIH4tZO/ljmP/yfucECoKs?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a332508-581a-48dd-fb96-08dd65761d8a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:06:53.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adYNUQSY7yghbF7MGQNGQAOPNyjZWHium1L2R2P+1a534Nz70JJrOMFB0UrNYEhPC1LcgkCeuiOws2psnSH3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10897
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:30PM +0800, Wei Fang wrote:
> Add new file ntmp.h. to ENETC driver.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7078199fcebf..e259b659eadb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9174,6 +9174,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
>  F:	drivers/net/ethernet/freescale/enetc/
>  F:	include/linux/fsl/enetc_mdio.h
>  F:	include/linux/fsl/netc_global.h
> +F:	include/linux/fsl/ntmp.h
>  
>  FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
>  M:	Claudiu Manoil <claudiu.manoil@nxp.com>
> -- 
> 2.34.1
>

This should be squashed with the patch that adds the initial NTMP support.
We don't split out patches to the MAINTAINERS file.

