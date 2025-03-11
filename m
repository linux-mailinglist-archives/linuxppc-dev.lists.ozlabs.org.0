Return-Path: <linuxppc-dev+bounces-6871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AFA5B8D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhJ4DlSz3brd;
	Tue, 11 Mar 2025 16:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672624;
	cv=pass; b=XwHuvh1n3erHyVNsc5rh9VXOWL0xnCjWquSvj/lN9+oGyWuWMwcnKFfm1usXvoS6wxgIjz5yxZyHAelghCK+3TKRtQ/xei/gUgJrs7zgbcfzhlwaG+2CkkaIUxLU0rrEB0pwm7jl3w7AAd5dzLsLWvot2spsXYUYURUiarPuCD3iOP/AH+u8WNs2BlYQSbO1AIJwSOVKijcq+Hw3qWUUFd6sBcLY3mlzXKb+uXF0DjlO/aUSiORuhMDbNa3AS/xDuigCumlxgGjOsuxJHGnSvcdChw0v58QsoRe72fp4C1Kc7UoIoPNyyjABNyjANY4BjsGuRNxOwdUsTzkXdd55ew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672624; c=relaxed/relaxed;
	bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N9ldA3AWfDHCahG2fFX979ZMhplPG97ac9cdyPMM7ET2ce8dxfuBQTUUNna14T2QX8A5GaIi6lWbxpeiMK3FoV22f6q/G81gVt+VlUgVWnttA3sylbk5eGBcF1InKTTV1TxGOj55xfqFI8Y+t8ZavoB/F8fydGuXuTDermf/7w1BE8C1REJLoLs1OkCVU4TYLkclU2gqpwtAzmqpNEn46w+EjTXCpT/RjZu4AzN/kVB+jBe2ccE385MLOvPyFd8i66Th6JJJKiPKJWQ7zDq6kJDDorM2/k3ZHZEVtDDnzDRTGNmu4V0oryIePQ/Cdd3jaR6cc1BEz/FKo53YwqNXAA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=d5AO9WKN; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=d5AO9WKN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhJ02Gnz3brv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0rqZHLa5AWDBeK44QRrJrruQ+rzYv2ikOOSZZrHB9TSMv1bjnrozuLyGvzmLrUDEz4nHSk9inVaDuPqzRywftTscBorNG94B2Mc6p2KwDGFJ7ju5Qaa01QqhQxF2VB1NYarPBx03+wDxFfLJglfAJp5c1CYDF/zQv6TTkRJPvAKHDSAw1YEZuggZamqdDcs2gHew21AzSamtUMWkDeC9MdQoFrVCteyesXGjwhwB69RsYU3hlo4KHBOh9FECd/o+ZHQuR3PVV9gJ6XSWIAGzfVjfzaz5a0k62BMDG6M5YmY1rB8MNFzy8ztukaAK+1w5uN0p22Isn8ifRrMM+k96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
 b=rPajPkDm4Cr5x4BLGbaqkyUAvaPxww38N+ydVBW8o9l1nchrddc3ErZ3bI6Cf7e1D9/aG2dxTsQ5Pb4pGMi5pVRLY6ShYJ/RD2DEyvlCHQnY2Od2tWy4O9LyGMqtQfZNRnLuy/2Yfye3rhhQIt2r7cVRCD0SWDn/W/vbA8F/OAO2B00behHBDMuzfkbRmcq0BT+IIhrhPcTaO7qpZ+O4i15I5TuhNWiL3h50UqnTF9h8LBBGGWABPSXYO6tCkJDqUxZSkINb2GdiHI6XdviTgCGU91Ff8iDmFO7mkopy9LQvDaZpnZ3snQeS2Ly6nwS9YmNqNsZPrP/U7C3bDjEAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
 b=d5AO9WKN5FpQVyhZpy/5dwCCetWGb8YQx5kUbUXbFmTy461PCY6x1wHSlpsidrye9WcEkjjGizBfHfh5jSTGMCoP5D5L2obrf5TveNkaE/oR4scmKRbAJheKB402H2hgEX5EzfPsh2/cQy4GexLWPQSinMrCnhXU8/6E/+RdP5bXMcHKY+orXshO2UaVd9kZln4k6I26/lKcjmTO1I2rqfvnyCtVcOBFmfmGVAoSr18672+uKsLdp25szzcXs2CZJfK+j73BlzrM8h/RgBXaK9raCHjpgbexMzJSbG04DCf6wxifo/KhGtldO/RRytI0tj6iFpS35hQA6HxjSRZd0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:53 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:53 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 11/14] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
Date: Tue, 11 Mar 2025 13:38:27 +0800
Message-Id: <20250311053830.1516523-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: c872492e-8642-4733-d2fc-08dd606185f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qZXZYKNpDaTCEta2yklW/u1tbnWx7TIM1AtNH2c1aOI+ot6DBO/NHhcPUZUT?=
 =?us-ascii?Q?9fkZriaXFp3jM0abmXaTYp+UeHGChopLjhJ1GujK3xBNlafaz5+06qQN1B8D?=
 =?us-ascii?Q?dugUOHi6mDKBr+R3eDFoMh0/u7MaeeghP15ZCE3cUUN7CO4iFAqIu0B6EjXj?=
 =?us-ascii?Q?OzKq3pYVN11JFBJR++A0kQ62R3/uFyxdbybM23/i3BhxukCXJDhHm+rlgrYf?=
 =?us-ascii?Q?jDqwegtDqs3PuYVqRwFj+YPEqBOZG8I0Pw7jz568+xb161DKLMGPIH4PH3bV?=
 =?us-ascii?Q?663gtSJMRRvWBdif3FpQzwd2Oe+8DhMuN+ASDsJBarQST52yaTG7L0h4BUsW?=
 =?us-ascii?Q?tOnoN3UzpQ0eFWcP9eKxhKNHTiIn9PcG/GRSzC1cYH3b50J9Se2L6omZM3Bg?=
 =?us-ascii?Q?/XQvQj01YEhmqU5u4k/gZRhg4cq544qTvVFR6BgWQpVAk1jsf+fvU02Hl2qW?=
 =?us-ascii?Q?y6IKF0odDzSVkdW9Vn+z2G2/DZYli4uU7VE1PD54lbH7CsVQWwOQzy3qyJxa?=
 =?us-ascii?Q?L3macodEb6LwwI1PPDz7gvJl8WJOb6aBhRl/QT5bNSWQML4NFK6XE1Ze5o/g?=
 =?us-ascii?Q?85PMkxwUJdhacGBeg+DpCImreJ7fq9mV2yEDWfCwy7X0OcSFD6kBHYMezCwR?=
 =?us-ascii?Q?WidgCs7GLnunNwXx8tGnBPJg3JOaKtrxo3qdrHjERBtwFbi2eQOEWmI1OIbH?=
 =?us-ascii?Q?ztBLmxmUAnN4zWfVZi/xn/V7l44JhVCrHSK/jMl3ScYCg5WxjAkp6LAnEOZc?=
 =?us-ascii?Q?MU8MQJeG5YaFn+SZx0R3PbVr9hEkYElVylIZMo7t/vZviRQ5ocmCW39Ko9m+?=
 =?us-ascii?Q?KcF5gB5bA508DtvpsM9pey6xhmjN8OFYpONqQEgaIp4WuJcTlUARrKYJjKLR?=
 =?us-ascii?Q?h0MEbNAmIi0XCSVZXZNCSEJ9EULZHlMRK846ouVs/zDsUcQvKbYCK4R57dEp?=
 =?us-ascii?Q?zn4/8xUseXtfuKQ7yreuf6EFBfWaG+qjPKlq+gio/ZSfg4ITAfte5pPfu2JY?=
 =?us-ascii?Q?QyDxFKv1Fdlvc5K1YnmQfG66e0+pcL0Z4yyko42lG8YErE1lAZvLK1kYFxI/?=
 =?us-ascii?Q?g4f1N4N1V14dwFobxe87k9gWdFKf/UuyEpXNJRfSGvhpxjxyKn9HoMeEoFSw?=
 =?us-ascii?Q?BuGmLTArizRYt6PEnAcyWYsbmca8A7PHp9fuN/wzVNMXdFejXBXBUd4MK40p?=
 =?us-ascii?Q?IbUMQF0u1fFiIt7vrWtkszzXz8kbuRAyWl3Vuj9x4C8fpUCAqf7EK5TZT3/W?=
 =?us-ascii?Q?KfPU4LvAG/zv3gmEKVcf1VSrhjcErbI/KyTTsyT/sql4/DHbjlUZWgpCebFK?=
 =?us-ascii?Q?7npjEVUpATwz7pVxt80lb9cQT4cWF2QgIJeRp5igNpYdaySkdBzrPxqarOm2?=
 =?us-ascii?Q?Y2XrtcDEbsOcyHjIKEV5VSyWKjyO9GleNm0PHAaudL2d38bKtZuG8fRQGwuY?=
 =?us-ascii?Q?CyGCSrv1XfJJoBepZ4u2lPrgfR4R1Gqa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mEQi81cjBOcFiJBypmW/xqDh9p+rntlTLTJtTTFObMuL8tBEnjvL++zZWwSF?=
 =?us-ascii?Q?j7lz7Qepof8SQmJhMRjJiFPg8dYca0aSd8ewcYV/n4A11uiqQB1t3BWCmsG1?=
 =?us-ascii?Q?NxwciC3LlW1+tcc+v37c3c4YFvX1XtjYQHN0p/vbzs1CuqgJQCDVnpKtOGie?=
 =?us-ascii?Q?SKls1c7jdO0lKOIqlQEkZr8t1vwSaRUEsGojNKfEno/njnF4/zv2Vr99CjEV?=
 =?us-ascii?Q?MX1bLka5F8Y4FCo6/ydHDsa8mpY4mF2TDhbX7OMvkHE/O9iV+NGlDUap/6UW?=
 =?us-ascii?Q?4KKIJ9mHMr0pTVo2Hf2GJcgv/xMtCkXGLCfcXFGk5crEf3trFQCMy6F2IA2F?=
 =?us-ascii?Q?djSibRMv6vH1myMIzEsvkmstskuRq+wFTDhv/PHTVhMBQg+4He2RFgc1Zgwy?=
 =?us-ascii?Q?y54KvC+SiurVPijfHjwFW7CBSr/Y+m/dxC9ka4orTuFjMkxeC+w/oaMtcfAz?=
 =?us-ascii?Q?uyGeXd55ZsH8veIqtqtVnuGiuw+9M12GFTIKnHvWT9rUvyTPldhIa55SgTYV?=
 =?us-ascii?Q?0gWWEai1/rQjmC6t2pbtuaItY5lICUsJQiwllZoLiqGIwl2rs41/gnraaNA9?=
 =?us-ascii?Q?9/evwWJgpV6Ueg1eKBG6qgXUP4Yxw+sHiOHvRGM+gkgs0B4kh59pyCbSu+IR?=
 =?us-ascii?Q?G5Odyc5Ssz3zwzK+EVQLixXQ9PD1/WcsNg1OUlJZ3mDWiUnOcpAVjNKJfPnM?=
 =?us-ascii?Q?bbdpvglYpV55g5i2P7OtEuTCjlWC6A6+BfOuBxcpoJO4aM33Qq5cFoZystht?=
 =?us-ascii?Q?8Eo15VigxC4OovATQjxRYbND/MZhucHHIzFzCp59iIi/E6qWwsDNHHeFe37J?=
 =?us-ascii?Q?CTENDMjJZo3GXNGgTQgldWEvSjDogA3YbjFglvxMsOH5u4DtWITDtz/SpWtI?=
 =?us-ascii?Q?SDF870NcmS9SDp3qI/FM2T2DPVVav09ClqoK0GuGNoSsgA8YAs2EeorwaZ9X?=
 =?us-ascii?Q?jmXaOcrwTYmTVXwUW2BS6wCeRx3I1e0jyRJPdsj4pNx6X4hup38a/+7TzblD?=
 =?us-ascii?Q?Z8zzBKc+vLX8B7KVYL6SvCNgBhz9967hYwxf5l9xAwMojP0KlygOwxrgT3Pm?=
 =?us-ascii?Q?KYtwd9CqyDOYBGDdrl6/vvtQNe6hhcUYzZOuIT3TPywKSiC7to9dptmYgG9v?=
 =?us-ascii?Q?7Gqw/mAGNslZSyzS06DJdYiiu79uoRv3IHxA4oMuqOfDHPW/wI6hfc7i3x6N?=
 =?us-ascii?Q?OVnmLiP9wTRTwgKHwltntPFjtCc+onUUxv0PDDKB+LoKJSLnnLhy3ETDsQfP?=
 =?us-ascii?Q?5CELpsMK22ph5N7I3hM5YoBkjc3z94GBjVRqpWSt5LlQxBkhjGIQMZ7IcFKv?=
 =?us-ascii?Q?Nh9dMVy3InFHxlrRmq0BcDIHPm2pgvauSzmESkP36fJ+HDxDEWv0ZXEQnXxz?=
 =?us-ascii?Q?ehNhTs6NXR65MnlOZrIt1sdaL5HsPPeVv3/agVeUq1808K+zPINl+ADDgIlR?=
 =?us-ascii?Q?yOzU2fwHRTKNzMf+DU2UZM7Dg4gQ3MGpe0QCaF+GOT3T1gh/fvFoV9Emn5sP?=
 =?us-ascii?Q?g5u1DDU7MJxUe5Ouf/s5/5UDCbRFhlRyZA9ucnQuiMKaIUrKEtdCiuL7wOq3?=
 =?us-ascii?Q?6rPFnWts3mcb4KRLPGC2J0TTZudS6g8toXc/OMbF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c872492e-8642-4733-d2fc-08dd606185f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:53.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKhNFO5kt7K7RCBLDeYNh7zMPCUgFX08IBjeIcvlYDluLQ3i1kLuWdm4S3lHbQEUDDCmAlTn3qKGvUKrTBlQ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the VLAN hash filter of ENETC v1 and v4 is the basically same, the
only difference is the offset of the VLAN hash filter registers. So, the
.set_si_vlan_hash_filter() hook is added to struct enetc_pf_ops to set
the registers of the corresponding platform. In addition, the common VLAN
hash filter functions enetc_vlan_rx_add_vid() and enetc_vlan_rx_del_vid()
are moved to enetc_pf_common.c.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ++-----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 +
 .../freescale/enetc/enetc_pf_common.c         | 34 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  2 ++
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f9b179ed6d8b..d3ca9e33893f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -215,43 +215,12 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	enetc_port_wr(hw, ENETC_PSIPMR, psipmr);
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
+static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx, u64 hash)
 {
 	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
 	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
 }
 
-static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int idx;
-
-	__set_bit(vid, si->active_vlans);
-
-	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-
-	return 0;
-}
-
-static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-
-	if (__test_and_clear_bit(vid, si->active_vlans)) {
-		enetc_refresh_vlan_ht_filter(si);
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-	}
-
-	return 0;
-}
-
 static void enetc_set_loopback(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -953,6 +922,7 @@ static const struct enetc_pf_ops enetc_pf_ops = {
 	.create_pcs = enetc_pf_create_pcs,
 	.destroy_pcs = enetc_pf_destroy_pcs,
 	.enable_psfp = enetc_psfp_enable,
+	.set_si_vlan_hash_filter = enetc_set_vlan_ht_filter,
 };
 
 static int enetc_pf_probe(struct pci_dev *pdev,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 90137fbb8f48..704c4ee42f61 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -37,6 +37,7 @@ struct enetc_pf_ops {
 	struct phylink_pcs *(*create_pcs)(struct enetc_pf *pf, struct mii_bus *bus);
 	void (*destroy_pcs)(struct phylink_pcs *pcs);
 	int (*enable_psfp)(struct enetc_ndev_priv *priv);
+	void (*set_si_vlan_hash_filter)(struct enetc_hw *hw, int si, u64 hash);
 };
 
 struct enetc_pf {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a737a7f8c79e..9f812c1af7a3 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -343,5 +343,39 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+	int idx;
+
+	__set_bit(vid, si->active_vlans);
+
+	idx = enetc_vid_hash_idx(vid);
+	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_add_vid);
+
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+
+	if (__test_and_clear_bit(vid, si->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(si);
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_del_vid);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..253310859ca1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,8 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid);
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


