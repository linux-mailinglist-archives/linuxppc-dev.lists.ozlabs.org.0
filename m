Return-Path: <linuxppc-dev+bounces-3112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD89C53F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 11:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnjV85rLZz2yZ6;
	Tue, 12 Nov 2024 21:35:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731407712;
	cv=pass; b=PyVNss/QBI+i2qi5SVD2T10xL7K1Ht36Ea1F8jvdard06kRpjtJxuP34ASW5131W9ErmJNisG16g4Iq/y+xYP3ktqvu7MyAlz986+1R8BQWek1cXZSVxEavTAFyaQafzC6KghdU2R61fGG2utU5tbdEYQ9SCLqKvpMgRCSPdclidxEodlWUQz71nYRz90DPMro5a4xbCHYHmxa8nXlzMZ6U6WO99Quhd982bXNRw71f7OZcwcz3P6Bjmw6CJR6OLpHWXqAylcZKZN6Gyrzm8gZTElBN+PA0ny8lPLpaSSeSiMQrysx6NQgTDRck4PCwLaty+LOzG6EFX1TBwZu783Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731407712; c=relaxed/relaxed;
	bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dpu0JsHHUs7cdR/tQJr2g1q2SZJNR/6XavFEvLG6Jrf9C71KiLAcB4NnmWgGjz6BrGruIuBVnIZhmaLO2eElLaO65GByEuD8YMiTB3un+fzYE6K8DuA6Qmhatqyp9qvHRqhP1fCiESsp8ApQSVAzveWnpEVeQYPYor+lLeLg5CCLdGNLlJKREJ+5nfPDaSYNAGJDD2QywNy3nfsAgCdobxaTXUAjZW2MYpQv5O6gbQ9gAQapvezXsOPd7ZGiETyIg7xSsqzAT7gvPp5ehMaC6+Y3c6YZRX+v7y6n7HNuTmbB3VNixaPqj/uh/6Ys7jIQxp3zjf/fbULNXnCJhoBKbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hlQHZJtj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hlQHZJtj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnjV764Qlz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 21:35:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGJdCHpS6MuLE+E50cdzhkOsS6vCxxpkvuVYq+y0pm3yKmUEM/UWBT07QZvypdHjJFuCkoB5RE67UeLM/bVDk8XfWbVqlhgVF9t2e2qxLH6/QJMH1sJkbLOC9H7dka0ri8aHNkogpHaCsvm5hb7vZbBJhLwr1TrsKtI1lKsGqZCaLZSYnXRR6ZyCFJHFzXqL6s/DfJZY/K3kwFl+nLUOZetFntg2w2EnGKitSK6VTcL2oMVZRZsfba9nb/f3tELEywgHW3XV3xiANGjbFTvttX/gOmnSnp7WxbGRo38KSxknw5SLTc9T0JrVk3fjDFbAAlWkw1CIn/TlgxzyAiSO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=keVKNjRCo5Q26JadeLImSQzBygErDSYFXVGvLG5qO62MM5QlsUwmM0xa+eB2Ojurh3ZVCWuJGHwkF7Ic6WeDrQyZ8dw8r/St1QhM7FmabJslqtLhieM8zpv7pbEvo08wqfNO7PYgeNBClNBu0Wmljy2fOociRG3zGnYJeUCEvMm7AXoiu34fVLADDFPse0AxDYBKyGxwnHQdPq7WthJ9yrFp4B/hIm2X6oNV/lyUQfhF3ZW2LqoFovYZ5mVJY/CeSjXX0EhMketL2wz5Xp8YJLFpFDxGGUmHyV2kdz9O+Dz2IiLulVDYggqo0SQ2FUVIOfLT91rIJBVpDw1PoRcjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=hlQHZJtjmbiN68QIEbyz+qcEMY+QoVW8hSPe5lLRcFUXuvfOgE/qrUNPtyLAGPT/GQRizjepxM9Vf2W8PeGWv8TicF1V8zPh5EZmKsosSPkgQ1XuS/vuQZLqqtEVIxpg2NpArnb5sw/ofaHX9/P7BrJuVoJ6DWZAWcbjys2/jxjz3HHncPlcjR41rmngZCQ4VJ1qZ6L0x8pkA+o4xbOLZrt6WIeNZIO3z1GAioxe7OIhLYJSvVDhPYcu2Ng/BUuBB4h0LPGYZ9/9rjycftLIX8RGDyIJ6wov2PbvBw3ZImxudHLbuaFz3S0znmzDoqfoROPsJeXUotopjZPs78agIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8598.eurprd04.prod.outlook.com (2603:10a6:10:2d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:53 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:53 +0000
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
Subject: [RESEND PATCH v5 5/6] ASoC: fsl_asrc: register m2m platform device
Date: Tue, 12 Nov 2024 18:34:03 +0800
Message-Id: <20241112103404.3565675-6-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e29fb060-f81d-4f20-568d-08dd0305a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0uYVh9heItYkAemVsrYjYjEeSvzD4Sfv4UyoJzqmzhDcxA9pYdDN0O8KcOCC?=
 =?us-ascii?Q?YGJv64ZcOsjcG8t8Gd7K5BL5i3JDJcxqZG+yVpgQnucKV0Tb2i3TDn7r72tv?=
 =?us-ascii?Q?5b6Pf5C01BK6yga3iFWXUI3jtt3EED8x6FRFP+9UpD69vXu/ldZ6HTCw2wAF?=
 =?us-ascii?Q?D5b7Uj5e/JXycEU8jHIIr6BKTVi/oqqSllSpCNmyJk4Y4Tg2nuwDuylnEjLU?=
 =?us-ascii?Q?JU+SivodjSiXJ2ZpJD//pWPKZXjO6SLY6bz9xQ1rX9zJJ4dfU9ui33409g90?=
 =?us-ascii?Q?hGedkQOYyAZXhWcEiJKliUtc7atgq80kDl36yj1sEJUpp3aZMlEG6pvhVLq/?=
 =?us-ascii?Q?1w3smoqNFxW2+ZZkJNuAk4rnUNM71WKTyrskiMdRFszOOlpdw67/8hAV6e64?=
 =?us-ascii?Q?RjgbQ7yP/2bwClWb6aUbRItk5gHYHTzLGxC3pPbd+oLcz9cUWItcfDDLMMvp?=
 =?us-ascii?Q?PQgHBr1j0cblxcSww5QgELD1T5wYe2DVBOKGEYx/YQNSGHVMLgTEijBfutWp?=
 =?us-ascii?Q?ZwLQFNbRTeSQjcL5vUzbCrOQGGjgR7KuSvrNizx+EeJg81Tl9eUZTOmgubod?=
 =?us-ascii?Q?EyXGf8O12lRFqR+zwFD8Na2TWgmlvq8JketZJT/jcmvAA4goNz7q3wXgAzMu?=
 =?us-ascii?Q?ceCX7IhmTXSHkEGJEdXAnAxM08IaQwdKh0EY/86w1n7H8umCHR2QhOKpjQ8E?=
 =?us-ascii?Q?vfURzD/w2JsFBWTUWAQiyrmutIwgHiz7f3Fc/AJBzPymVg+2xGRmJjE3gHCR?=
 =?us-ascii?Q?nKabXKy1mV1OAOu+UnkFdIqRfZ5FWSDsU1Y4S2fmvaF1nBE1s+1Wdx2xaqEp?=
 =?us-ascii?Q?WOLb6qkdm9rmQ7+lnwYxoMGWZg6ags81SFHXe0CFxgxBjpM5mhMqFYVwKg7k?=
 =?us-ascii?Q?Jo1iNCF3KTUcuJ1riHTPyKX3nSOOp4zjugY45jQAzDIj4ol+TH3m0EnIuSBS?=
 =?us-ascii?Q?XS2rKc3jqUbL48jf1NhQEDYTRId3qii0y5YDmTXW2W84CFdetWI9FXBqKkZf?=
 =?us-ascii?Q?cfPhrmaR/XFWvTTclFx6dQ1sS93eNj+HzTjJAnkp9nuv5s03g9mUioTwYdsY?=
 =?us-ascii?Q?uRQjbS+YK2DpgXF7N4oPS7xtJFsQKlQsyMDUZGwjdSC1PkZ9o65x/SpT3Uw4?=
 =?us-ascii?Q?Ckkr6DSAGQZlSiUqjnBprQ+qQz5lwi/u2lfiT/yzGNcVN5IdHnuDtEqYnCG3?=
 =?us-ascii?Q?a9egSeHL/6BMztuJagnd2vSfcQsMjLp6XQIPVKrxEA6yCMSVw6FlZoF6uqf0?=
 =?us-ascii?Q?ioghXTi8DHUAtNO4v1A/YMVfcWsZi1mL68w1L2aXkXkZObR/4jQ8rJc9nhT0?=
 =?us-ascii?Q?ExPiExCwf+/ylOoDVAA+iyO1FDDZ+TXD4HULcYWICspzT9dRF+V3UGa4Y9q1?=
 =?us-ascii?Q?z3Wy7IV9mmJxwi8BU3Bnf3HfwbAr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEdFvAp1D0FbIqX4nozbXavC2mYrYrYgz5FLKT6SQq5/vcMorshs2jbOeFKj?=
 =?us-ascii?Q?IzfbUzeIb26FUjLjaqjdsxSUHujrH1GE/fzqcBXkDpvD1+JdyDFYwBwSGUq8?=
 =?us-ascii?Q?iRyXONtGIYXFs3875qd+hXE5Ej+5HMr8OBmooRrCBkPlyU2g3MtQJvh6NHgT?=
 =?us-ascii?Q?PJIdXmpFWMHp5gkuLL2agWgH1OAVmHn+XCoRkAb/Q15SVMNrxLjtNQl5uvem?=
 =?us-ascii?Q?XHPdC6JtAUHvWPvFKaYpwSQ4aDgjXC9Pqc8TG9Wmp9PhR9EgV0CA4LKMbSi5?=
 =?us-ascii?Q?6VeejLuhOKPxez4gvnxt0DXe5cAwaRBBuET19WKw5/6z1uB7SmCn6b3Zh7KR?=
 =?us-ascii?Q?5YxhXjUWHC8ZID+0Vnkr7IvNo1ujomLfe8PjYf8FINJNhFh1zfZ4Y3Cw8cD6?=
 =?us-ascii?Q?Uu6564MGOI6TCbjci5Sit4FILOvAXUCl2RfVW4O2azNdM9+Xwbqk8eZ+pe1X?=
 =?us-ascii?Q?S3Ak2mt6sx9f3RYSBPTlQrgdCP6S1qGkv8HhJEKExPxEjZBJAJuMw6Y+n/6n?=
 =?us-ascii?Q?wRCqKyLXMeiE6UUA8UuinUaCeWAWylHkhQQXmE25JKKiuGrCZODpKtKIATSE?=
 =?us-ascii?Q?6DpKqj/IsA7qTIRcgjmLc1B2FqEpi/LVNqonvBs0+xx356dNWdkkPgW5kEOE?=
 =?us-ascii?Q?VHrmQkO3A4CZsP0LlH5rghC1X+mtB749PB3ojGKgZPY3ie+S+RHMw2R50eHf?=
 =?us-ascii?Q?yI9mEaMOeY4K/wSefGkwrYlCFLU9tYKN4X//p6bGzsJsPIeXVetS9SxQb0BN?=
 =?us-ascii?Q?oONphn4s5q+p5ebeZeDrjhkxFEv5UBhnbYzzwVkbmeJjBAMJkM740TJtRAmy?=
 =?us-ascii?Q?3z/q0f9nfpkkdTtVJhsdnY+WyHLzjtMV9ptZiDzz7Ea7oYoL/mMtfHQkhfkg?=
 =?us-ascii?Q?GPfcLlTjKK7RB0TlnazDv0vC3Rp7BsiqF2kBAFHp7OaiTLbeByfx+j1USWo+?=
 =?us-ascii?Q?RI//ASxmeYsFy1pumj9Kz2N2GRdPhMHnijEkwxTcsfj4CZI4ZQoEfrGs2pdX?=
 =?us-ascii?Q?L9tuyQDb1ELKSBKJ6WwPjuTdPydA0VXSEPMc0luk924yrtc+aAjhx/kEMt5x?=
 =?us-ascii?Q?rT9dT3FO4gS57uVVlTaSxz/uNaY530Lszc/cpd/qTDLJbYWxI2XzxjbId02c?=
 =?us-ascii?Q?khSZD4aD7tcm9P0XPYjSJPnE4NzRII7jkRBRBJXQHb28cn7BaaiWT2NE3Y86?=
 =?us-ascii?Q?1Gr5N6neG9YRyQ6dSJ3Y+g5/ANK330SGfyxnWysAqn8fj9ikgUjxjltiEz7x?=
 =?us-ascii?Q?obboY++5dBOXZLjUpKGd2FmGNxUmG9u/gX2H0oEaqEMJqipJE5ND6DmynK3F?=
 =?us-ascii?Q?XSrbjsSzZXsXZKRe2zUw2xKLubg8TlLqa0p0JX18EJcEAKrzuBevqxixs9jK?=
 =?us-ascii?Q?Jtf4HA3HZTvxarpTIZ62sao+QxyJ3fuBnLB7oy9vvvz1CEaV/k0BEXZ5nx0g?=
 =?us-ascii?Q?kP0XnZ4KWeZeLpLzrxxB+tzl2hyAw/poINnT9qhYBAhw3Ju/Wftc+QWQXVqy?=
 =?us-ascii?Q?oGdwfa2b4irLKg0JgKba37YFQlSRBvFkuNrbYXduqFyqHERQvkHMRN31W367?=
 =?us-ascii?Q?RP5En1pdIsgUh4CCmgoUIJPvH/t8fB6j7AiZnzAf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29fb060-f81d-4f20-568d-08dd0305a474
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:53.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNP8HkmVir7OFqHflmtd45c4u4rCGlioYn0ooLK7dqYTs3BwyC2I8IdNSx3YhvAhkcDdKJ+zB5QImt2hglC4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8598
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Register m2m platform device, that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 471753276209..677529916dc0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1384,6 +1384,12 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	ret = fsl_asrc_m2m_init(asrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_get_sync:
@@ -1396,6 +1402,10 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 static void fsl_asrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(asrc);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_asrc_runtime_suspend(&pdev->dev);
@@ -1497,10 +1507,29 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int fsl_asrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(asrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_asrc_resume(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(asrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_asrc_pm = {
-	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
@@ -1538,7 +1567,7 @@ static struct platform_driver fsl_asrc_driver = {
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-		.pm = &fsl_asrc_pm,
+		.pm = pm_ptr(&fsl_asrc_pm),
 	},
 };
 module_platform_driver(fsl_asrc_driver);
-- 
2.34.1


