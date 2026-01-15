Return-Path: <linuxppc-dev+bounces-15776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04847D2343F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGs70FMxz3btw;
	Thu, 15 Jan 2026 19:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768467018;
	cv=pass; b=H0AO4VtKDGpi4rms0OHfxrQHzLu4sp28+dPjL95uAMhsD5og7UvAk9+DeqMxLQycLgyoGc8mm2groxRapzi0/P8L1PLcJ5XObTyFcHciuBTuULJv0bF8tk5Buds6hBIyqE9Et2n6ziox7NMuQNQeFLaqnfAR7/VDjhjl6sCYb8V9NZSPzwkiLDNo2r+ftzbShXbJNZzY3UUrmEz+WG834tErFg6LqW/c45wBcN1oO9JtZoHUdykdBmhe0beMQ/308xNPTmwAynNX9ePYTKfwfAmQ9i9A8l2nMq0h5ZSAbjBOAHzxmWPVtA7uzcGifHZfyYK3cDtD/h8MzMzR6GaU5g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768467018; c=relaxed/relaxed;
	bh=5/FCN4zK7QOhJvUp4xtQGkDwseM6Wk3ZqmWzwsmuA5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QElBDpl2nIbjZKt7WSCNeV1F4wV4j8BH5PGPX4su9/QTHqWKkKGBGyIKj5ku+MrSmy9+32eomzTWPaGupK68z6VOsd2rcfsw4y2Ratr1EEAmcbTwBeTr5ZkWLQOrUVnL9akamWniFeg0Is5wvan1Iv7AxccIqt2wQGgETFaZ8p4+jjhg5/4uPON1a+iu3+4ggyoe9VpSKxRPlYM87RT7cRBv1wcW10caFBTOij001VvQPEMpAcFV9iFKmWBvIqzVINK3/M3hHgV27BVVbtguRtMptFVvEw29Vonl2RNh6L9jc2ON+obDOW/hOcAZ806402hDWJ6YJl6Ip+aB1BrS3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=H6QT5H4F; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=H6QT5H4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGs62FpCz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:50:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FubpIgBPHeQy/8AZae/G300VtjrcK/orX3BIxWWgy9CFLainftS9JSMwSkE2h30nQo01t2Y/00GX/9no9hVmRMTlAyuhmyt68/V7ptd0N+B5V8bpdQFPN7IrXzHgbXxvzMkGbYfw5pr9ahtAXxkgGlDYtNAIIczlDo6xxMlx8oU+JaYsrAmySD7/qTwWiEAVopM4gTs63g1dwZykjxKSBgZLVM0iVKiRsV8p7v20hK4PO+aj2XG8ESZBqe/7pvY+PlwE6DaPoMxry28DsU4FFmB8mhtvEi086ww648FAmk4OJQVnlMm5yO9aR1sqaIvB22oBvZ12wHzXWdsBjLRH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/FCN4zK7QOhJvUp4xtQGkDwseM6Wk3ZqmWzwsmuA5Q=;
 b=L1R+2kDLugipv1pl1RUs8W1yiF8d45mcEGKgghTkLqeqXduOmk19b1C1fCKIZfitAGvwFMs82qBCL4b68eoCqT1JH+HDaXiHqHDjHAJ0gJk82iRUob17Pe6n4JzF+5eLF/T4VbYgK9po2/SRs+VRRX6SU9ylP4hCxBA7HAbPB20r3GHMF1yNBEse3q4iOuBnziSaC5TA0quRTFXv8FpO9VLIY2LS8s/w2Js3Rc76mnz993DBS+i7CTA8VEg6+V1xPslvfu2S7aty9J1nokg5V6inBtkH1ShYBWLEkHSvaGyIfVvTa/CUFyA/sCFIAgZywBE/m2BrAPQYYktMRfIP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/FCN4zK7QOhJvUp4xtQGkDwseM6Wk3ZqmWzwsmuA5Q=;
 b=H6QT5H4FckSI7pRUZlPLNLR2FHFlsEQaijGCmLlDOIT0MyOY6MvacyaO8i4ZeVecrGEs3lydZEgocikiABr4t9I6dlYjc0c5Y4ZtY/WXzpTvlok9aKJbkmNfXBKzByCmeV4nOJgYw2QPh7jLCUjuO1t01C03cFLe0Xqh1pFB9eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4454.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:49:58 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:49:58 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	Frank.Li@nxp.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v8 4/5] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Thu, 15 Jan 2026 17:49:27 +0900
Message-ID: <20260115084928.55701-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115084928.55701-1-den@valinux.co.jp>
References: <20260115084928.55701-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af0a932-6056-4ce8-fb98-08de54131040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R13nlCFQdzv14YiDy0VSdcfnt8H9AtfGy2yC9zFxFtnwDBT3e28qXoLT8bKj?=
 =?us-ascii?Q?CPwgd+hKFYR3/rE6LVO5468Yd+d+noO+FBSNb8R/OZWYu5668GQMCP04PUAW?=
 =?us-ascii?Q?QEBW9QBe/Q2A2ZND8upqEinaod+p2ZEAvc9L6YcL2AomnhJ3zSE7ehtlYi6r?=
 =?us-ascii?Q?EhYxpa+e6rbPtD7XzXCt3QNTHfKJKUcgZwBwACqthGe3RJDnOX0bYfHA1Opi?=
 =?us-ascii?Q?c62MRMJOZ7SryOKwlxTO1k3oLrKhTjbCmaXO5OyjgC7x19EenqIlm4AafTJN?=
 =?us-ascii?Q?w98SNKg2YYGC8PsQAdL760pyc7zpPoldcT3t4G6fra/S2fOjLxzvj4Gjcj0d?=
 =?us-ascii?Q?Ui7eP7TexaumgFmykE/vm23Jt6ISLXA1iFp48NRWMZ55BZVDMORnkFzmKInF?=
 =?us-ascii?Q?w3oo4z7R+7ujJNgwYq3CwAWtlFNg7FXNFdIkyk5Oh19+zT+d3zmO8Faqrk4L?=
 =?us-ascii?Q?TdEw5DfVowGbi5m1dngfLBLUF/P0GBc2MKRIkq6vBZOwBFvyYV7mx3dSfTlZ?=
 =?us-ascii?Q?ez5VfMiBkRMSri34sYNi6HyInwzcmrBVX5jYX5Lx67l/xVNzPrmw2eBVuYk5?=
 =?us-ascii?Q?G2HgdZvgcUXUcxhDd4kCvmuyBUVjl+dn3lq7hGg7Kbnu2eEOwwcgeKugUwQe?=
 =?us-ascii?Q?io6f2dnswkTYymn1USVpSdW0Df7sHl6IwUhuQ7J8H7gt37Rig4akwt2WlVQC?=
 =?us-ascii?Q?yp8BngRpy9BpsSDBapIfD1BbPZMUN9eAC1kWzlreUgdvsw383u0EJEufR6iW?=
 =?us-ascii?Q?dDVCuk2pOR79ezS5PPkNuu/vTtrfiHTYNCdvXD74i/nbQzBtIwWYJHPKhzUE?=
 =?us-ascii?Q?alPxtAjAgV0v9pEsiiaQQs+SDL8RH4S0lJx5NwaFe+b9Q6bbBxTrfH3u67j0?=
 =?us-ascii?Q?oMtmDg9A8JHIcAi2EKsFczrWAunf3xMrpHEBlAvgTePJxE4OuUkTshsrU9za?=
 =?us-ascii?Q?PT1RGQsUkmq6XtVi2rD0PzN9yB0z3HzBjMiqucHtxzc+OVCCiIRQdmybPUwc?=
 =?us-ascii?Q?k2y1vgGh2BSVhAESkn+5wqJkK1WCqVF7LTLH0Ux8RDx16gC9OkoZ2B6gY5/2?=
 =?us-ascii?Q?UcqcQbkWzhJssJbrG5Mse9hqJzBGDxYc6cw9XczZ7kavG6dSBQeQ48zqTHf9?=
 =?us-ascii?Q?PeP6tbXLuYXKZSpuToXVCl0WPWXGGMXHRpKcgdifMNZ8Us4ZuOJlirWGurra?=
 =?us-ascii?Q?9nnLBKU1U91seIfbfzbxaKw1qnbmvLe72vkcyle19kKkHAPCD+qj+hNzLZqp?=
 =?us-ascii?Q?EoQARc7hfM0pSa0lv0fKEeMB7yFZJGhCPKblSM0TE9mCQ5YoNBEEIfNsVqt9?=
 =?us-ascii?Q?3yBFbWE/Chx0QUTt6u+2fLv6zlCJ9nnJrCEBb0XNKr3E7qNA0RegNfxEm/Sr?=
 =?us-ascii?Q?w4CnV92o5KyfBjFhfIuu6oz2L7WYbtNif4Saqrhl57uN6lvScB2SyKGynZOL?=
 =?us-ascii?Q?bXzNf97qhlrSF5TxPfp4MkKlr5BxMrA6397kLusTrRlZvb4VYC6oaNMI74Xj?=
 =?us-ascii?Q?hWlPk2v2bWgb4LwuTGcNSbf4GCoARogUDWDpQ+up4cvw147oA/uDQ1HqnA/p?=
 =?us-ascii?Q?UXn9MuLBwuLaKlDknnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yKDaCHXdYD2/NJRsrp8iYX0BEmMbI6LQ97d2b9wFDXq+pYxx498BT5khBe8/?=
 =?us-ascii?Q?Z4c/9W5maeIb66CDI9TWzCO3RErNUPEdcvoAeOgtE8WXOZ4Q6fBPOyV6qsG6?=
 =?us-ascii?Q?32LTz4Eh85lwnD+jn7+MELyf10QadTseUVoaBhZepnu/tzvmHDvKgC9705bl?=
 =?us-ascii?Q?+8xGq8+IGkLKXk80dph/dgX7jSOAqEh29aC5bxW76p5mwYZzsDY6xeLrVAN2?=
 =?us-ascii?Q?k2MCrm4v1yGyu6RkoGQ5yP9rppPx0MmB74a14PVXez0wP3f/tLliktAS+oVX?=
 =?us-ascii?Q?/HfdkP6kYMPOveGQnyPvGtRTlOYHTjxIXnSVXCJScHSn15lvHdgKYrYP1q4G?=
 =?us-ascii?Q?kX4pCZRiC7n7dKPjR3/8h5AaRDcNlwVE58t64WYiVuBzTYO+TF5UGUfz5o3Z?=
 =?us-ascii?Q?snQgu011c0P1+Eo2R99YWZcq27EaKaqM/lwyEdZUjjW2tFzYKTRciZ7MdgBE?=
 =?us-ascii?Q?9RbipZpP80IvbA0iuxzZOQci5IjVA20ehhp+6eTCkAtOW4exWGA27HQMF6HZ?=
 =?us-ascii?Q?4WNcyxN64FFalWjBRnXh1rrKohLwseczIAMotCrmpB6VoUL7DgwRFDvbzmtL?=
 =?us-ascii?Q?M1nuD+uvfuWLCILnpHS8cxaWrj45t7ImiVRVNmgHKLWf1gdhdAOKPf/VRXBH?=
 =?us-ascii?Q?ZUjRcwDJHgZTeqdEM7Nu2IJB0vmjhQrsDQwzwbG4VDs+/HiVgT+BA6Y64AGP?=
 =?us-ascii?Q?Wh+8I5gy0e6pWFnPlf9IRVQofFTOI/6H+8A/bUQkl7CuRC6mxX3C1jgNNGS4?=
 =?us-ascii?Q?1wIMnIJe3WBu0yl2I5NanI3D3nF1gC4RtBg8KoWjN5nvXnKVJvCjoPZUCygC?=
 =?us-ascii?Q?QD7iERf0kCAvuAI4InNyX+thEjGWKOIu5uzaWcFnYkH7zbaY+bHzrk8AYVT0?=
 =?us-ascii?Q?/seDYA8LT1t94R0KZuYGxqFlRVCG7fGtNKiqBXfEsunmpn6neGikF+gKetsE?=
 =?us-ascii?Q?u9+PjmCyh0ajmDN61p3R+F44D2hUhgjx/a9HmIWuMuZeJBrSFdgTbXhR2Pa8?=
 =?us-ascii?Q?AJqp30PC6k8leJUBF06SO6Qi4mPNuju+Vx7XEo2fx+Kda7gEqK2fLFYCeNlp?=
 =?us-ascii?Q?TU624tKlql/dI8yfWk6RuXCHSARR0n9T/+JiWQMqd+Fo39Y+4NPulWkeaOuj?=
 =?us-ascii?Q?U1F8itE1XxpeJqdGiUXI1xZglpxZ9PCo+coTvQL6E/pABqsqzkBTcQ7dgkup?=
 =?us-ascii?Q?/+GYMrpu1Sl8tiapzLCtXOAMBbm46YSlc3d27utQrVHhYhAOrX/spJbJEtQ3?=
 =?us-ascii?Q?AVcLAFbfXQtZijC7J/VdfUqv6k30X+EDn2f6PGQ6wLqJ3Lm5bfF16UXdtZU1?=
 =?us-ascii?Q?qlcgxLRn6trKERTgiYqlB87Wxn3Kcx4kQS6tlAC1AcmmE/ENmSmnEzpI2a5s?=
 =?us-ascii?Q?v00UugOeUX2JrVbh+mc9V7OEhIzeFBgGyseogN/nm8QcxQPbPt5kSD5+wpNv?=
 =?us-ascii?Q?su6twrVy2se2JnWA7UNSOXAPzURWJUzbzrfW2h2i7nk6FmZHAUCR8qmVfQl1?=
 =?us-ascii?Q?S6G3L8jcHRn3687aJBnG8CwliiSEvF0JCM3ubDQUGcGWOqtVbd3QqKpqOLMX?=
 =?us-ascii?Q?LsHQ9m8inp7fZLkLBxfbkXR9uIAybVAAN/dj178ZkrDgQKi3qBNtlXgOCP8Z?=
 =?us-ascii?Q?AWdXmaNO0H3AvLYyTDRyACEvwXa33GRnOju6jFwqCchTvSc+hgZiuWL5kr7E?=
 =?us-ascii?Q?6IHNqCsqtlo/RxnJkaGSevc0t/iqNfQXgrLuk94T+J53WNK1VRRkz7JJMrC5?=
 =?us-ascii?Q?8FBEBAI8ZOF7B5CQlCYlCyS16TaN3EsT7npdkWpv72Ut5En6Ccna?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af0a932-6056-4ce8-fb98-08de54131040
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:49:58.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP0bv5QCRo6Nm8UB4HakkgmexXPLtXYUDgzZCoH6UUl1i4ak0Umqqk7Jql6XIC7aVp1gjk2BJbL+6zgWiQli+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4454
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
is non-zero.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
num_submap is non-zero, read the assigned BAR base address and program
one inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)
- subranges are sorted in ascending order by offset

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by extending the common feature bit
initializer macro (DWC_EPC_COMMON_FEATURES).

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   7 +-
 2 files changed, 199 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1195d401df19..904c90f16a0b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
-				  dma_addr_t parent_bus_addr, enum pci_barno bar,
-				  size_t size)
+/* BAR Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
+				 dma_addr_t parent_bus_addr, enum pci_barno bar,
+				 size_t size)
 {
 	int ret;
 	u32 free_win;
@@ -174,6 +175,179 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+	unsigned int i, num;
+	u32 atu_index;
+	u32 *indexes;
+
+	/* Tear down the BAR Match Mode mapping, if any. */
+	if (ep->bar_to_atu[bar]) {
+		atu_index = ep->bar_to_atu[bar] - 1;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
+		clear_bit(atu_index, ep->ib_window_map);
+		ep->bar_to_atu[bar] = 0;
+	}
+
+	/* Tear down all Address Match Mode mappings, if any. */
+	indexes = ep->ib_atu_indexes[bar];
+	num = ep->num_ib_atu_indexes[bar];
+	ep->ib_atu_indexes[bar] = NULL;
+	ep->num_ib_atu_indexes[bar] = 0;
+	if (!indexes)
+		return;
+	for (i = 0; i < num; i++) {
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, indexes[i]);
+		clear_bit(indexes[i], ep->ib_window_map);
+	}
+	devm_kfree(dev, indexes);
+}
+
+static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
+					enum pci_barno bar, int flags)
+{
+	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 lo, hi;
+	u64 addr;
+
+	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+
+	if (flags & PCI_BASE_ADDRESS_SPACE)
+		return lo & PCI_BASE_ADDRESS_IO_MASK;
+
+	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
+	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
+		return addr;
+
+	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
+	return addr | ((u64)hi << 32);
+}
+
+static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
+				      const struct pci_epf_bar_submap *submap,
+				      unsigned int num_submap, size_t bar_size)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 align = pci->region_align;
+	size_t off = 0;
+	unsigned int i;
+	size_t size;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The submap array order defines the BAR layout (submap[0] starts
+	 * at offset 0 and each entry immediately follows the previous
+	 * one). Here, validate that it forms a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - sizes, implicit offsets and phys_addr are aligned to
+	 *    pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for the
+	 * PCI address and the target phys_addr, but validating up-front
+	 * avoids partially programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
+		size = submap[i].size;
+
+		if (!size)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
+			return -EINVAL;
+
+		if (!IS_ALIGNED(submap[i].phys_addr, align))
+			return -EINVAL;
+
+		if (off > bar_size || size > bar_size - off)
+			return -EINVAL;
+
+		off += size;
+	}
+	if (off != bar_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Address Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
+				  const struct pci_epf_bar *epf_bar)
+{
+	const struct pci_epf_bar_submap *submap = epf_bar->submap;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_barno bar = epf_bar->barno;
+	struct device *dev = pci->dev;
+	u64 pci_addr, parent_bus_addr;
+	u64 size, base, off = 0;
+	int free_win, ret;
+	unsigned int i;
+	u32 *indexes;
+
+	if (!epf_bar->num_submap || !submap || !epf_bar->size)
+		return -EINVAL;
+
+	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
+					 epf_bar->size);
+	if (ret)
+		return ret;
+
+	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
+	if (!base) {
+		dev_err(dev,
+			"BAR%u not assigned, cannot set up sub-range mappings\n",
+			bar);
+		return -EINVAL;
+	}
+
+	indexes = devm_kcalloc(dev, epf_bar->num_submap, sizeof(*indexes),
+			       GFP_KERNEL);
+	if (!indexes)
+		return -ENOMEM;
+
+	ep->ib_atu_indexes[bar] = indexes;
+	ep->num_ib_atu_indexes[bar] = 0;
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+		off += size;
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			ret = -ENOSPC;
+			goto err;
+		}
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret)
+			goto err;
+
+		set_bit(free_win, ep->ib_window_map);
+		indexes[i] = free_win;
+		ep->num_ib_atu_indexes[bar] = i + 1;
+	}
+	return 0;
+err:
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+	return ret;
+}
+
 static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
 				   struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -204,17 +378,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar = epf_bar->barno;
-	u32 atu_index = ep->bar_to_atu[bar] - 1;
 
-	if (!ep->bar_to_atu[bar])
+	if (!ep->epf_bar[bar])
 		return;
 
 	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
-	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
-	clear_bit(atu_index, ep->ib_window_map);
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
 	ep->epf_bar[bar] = NULL;
-	ep->bar_to_atu[bar] = 0;
 }
 
 static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
@@ -370,6 +542,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 		    ep->epf_bar[bar]->flags != flags)
 			return -EINVAL;
 
+		/*
+		 * When dynamically changing a BAR, tear down any existing
+		 * mappings before re-programming.
+		 */
+		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+			dw_pcie_ep_clear_ib_maps(ep, bar);
+
 		/*
 		 * When dynamically changing a BAR, skip writing the BAR reg, as
 		 * that would clear the BAR's PCI address assigned by the host.
@@ -408,8 +587,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
+	if (epf_bar->num_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 4df0cc44faab..b74f5014faf6 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -306,7 +306,8 @@
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
 /* Common struct pci_epc_feature bits among DWC EP glue drivers */
-#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true, \
+					.subrange_mapping = true
 
 struct dw_pcie;
 struct dw_pcie_rp;
@@ -486,6 +487,10 @@ struct dw_pcie_ep {
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
 
+	/* Only for Address Match Mode inbound iATU */
+	u32			*ib_atu_indexes[PCI_STD_NUM_BARS];
+	unsigned int		num_ib_atu_indexes[PCI_STD_NUM_BARS];
+
 	/* MSI outbound iATU state */
 	bool			msi_iatu_mapped;
 	u64			msi_msg_addr;
-- 
2.51.0


