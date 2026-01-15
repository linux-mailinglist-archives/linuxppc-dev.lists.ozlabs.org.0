Return-Path: <linuxppc-dev+bounces-15773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78870D23436
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGs46hwwz309H;
	Thu, 15 Jan 2026 19:50:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768467016;
	cv=pass; b=mnprEtiip+0ULTCFZcXRRrOvyC+mTOQWgm+yBiz70ePAyqeM1kDeuekU72xAwbq146KuBp5KIzB/ynqd7R5MzSGHxnfKDlsI/eQFDfMQ0bkaFmEUj7zZwYma4KVrXfquVG7wB8DQfUQG7P/qiEoZEQsHgX1TfaooR7URfKExTXRN+CmwsWf8NkNGIo47vuIzeyoLIWVVHTwZ14ri4cDnn6wN1C7iB5CBID/RmpHPLpOqqKDtGMco427Ofsa6bjbj/4SEk8Agcz+zydYmPMvQyIRhx1w6vNs1VPVcLeQNrAD97BMtsDAtW8M+ePM/8p3XzarLZDMvnXusZ3C3vnZfQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768467016; c=relaxed/relaxed;
	bh=pWif8tvgR0jIXTaNInXKj+mtusXeRdBu96IsP/3SxVc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PdyYqK7KOMWBccL/f5bCT5+27UmdK1DHdWzevVoTjvkosvqrB+7+FwfM2mWCHaircfrsD4z1fuVDe7a0S7eyuHsXZKuUcejI+F9JSpWauxH7oeBm9/hi53NYZH/N1MWle2pRnKtcXzG6A3r0aSX0zH89A69qs5LcDhPUzZp5ODk+TOI6HnWfwaOGe7OcuSAsXszNn+ccjC6mT8gSA/7l/lxW2chOJ5FDHvEPhcdw6IVKBmIIsdyY0eaB85caCoxOl1bLzW6VB3hhLMCLtXwSNXBO8bSXIiefRjMZuhFBd/8o3dN1HnxcqY09BXKqCmNN671UoMT6C75oH6H1CYfMlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=uP2S1HLr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=uP2S1HLr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c405::; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGs35tHzz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:50:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arCO1DddGImQYnRyNwbaJHBp0s5EEMXRm3xR4ivdp3dKGSb0p3vqJZ2vwPvG35dG6afHNFzGDARpQ6GMRIcTLOyC7tKcvg+y6ybYOO0Q7kpBdnqeZOaa3pgUZvqbjYyXt4mXA1EEPqpTmyjzz5PVSS/McL3xognLEkO+7Kva5pM6eQ6DU8kpCzLK7wi7qXIvnpNreHvnhgjo56pvDSVG3O4B0voGAr71sgCpdTDO+UXhVjxmIdp89iFXaHDFksCyGqRDhdfvw7X0w7OIr3GJZt/7nJWEEjA8Qj3H9IzafTxob4U+jIHFY1ERAojqjY4JopMk7iBsbdqKX7SwDsDpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWif8tvgR0jIXTaNInXKj+mtusXeRdBu96IsP/3SxVc=;
 b=CRxpwwNiDvLST7xh8FjqSLNYZzNrGq895xzunT8FiqVoxHTNffxO5i8XzrWSdq7azTbGtpjPN1yWyOguyU/h6qLMGplfjTHPTqt9IFr/k6bznlK1unx9x955U3MjMceRnqWIr9Dv9A8NVVUg0yG2PytXrlR6PTiHVrazZacIhQC2Z5uKg75n1FDSl2Ciqzcuul6GKA9ulF09BTTKcDbocftyX8HzEcsvtEc5+srLWNgkdxhWsZVY66qj8fQCKzYQ+cNtqFL7S08IKPZWyVKiFfsSFIeOzktAs0efczbRAWy8I1/MlrdxWemsYvIKnSnEsyZCZtn+8doouUU7fh7Qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWif8tvgR0jIXTaNInXKj+mtusXeRdBu96IsP/3SxVc=;
 b=uP2S1HLr4Nu5KsMXHG3MfSw1dTZ0Cz+HRcp1huXTT7vpWJBRy4PI2vS8fKWcICzd1AVhVdvpnm/2dkLCUEwHvaxRCmmusW3Ul83eO8Zg1Hv1+YMLIkvPkwD2WLtxt1ds8Ie51Zjcpd67MgIeMgCfuaapcA6a1gPQrEdBZpiWjXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4454.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:49:55 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 08:49:55 +0000
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
Subject: [PATCH v8 0/5] PCI: endpoint: BAR subrange mapping support
Date: Thu, 15 Jan 2026 17:49:23 +0900
Message-ID: <20260115084928.55701-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 0c5ccb72-0c1d-469f-d825-08de54130e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VYFScFXlGvAwD5kJxew1TpyYCi9Me56HWbTtlpnnIlZM+cXMEj7ZlFlexMNv?=
 =?us-ascii?Q?wb0aTCRrlns1t9zW2wmrk+qRg2B5e86ZA/6RH0VdmJZf0JDL/h3SaBWknNSN?=
 =?us-ascii?Q?ZSA/uWscK0thsZmH7xoDVDeQ43UcC1ZxKD++G4SIFSb8NunLy/GfPhDKasiO?=
 =?us-ascii?Q?+NQE+f8rkSk2CwqNJ4bhHiTC7vJVtZGLLucbuKaCnzwQUeQgDDtG0jHEny4o?=
 =?us-ascii?Q?sqygH12oh+pY0gdTXkOwy80ymc327AVAlQ6lJoOhUb2BBmqkXib8HDlop2O8?=
 =?us-ascii?Q?1ItYDxVfCdjU7W7ZzDNK+KEkMpul1sAWW/ewmnwfKeiIatDvIHZEEpCo+gKp?=
 =?us-ascii?Q?cuhxgdelniqS5+cLP5y6zGzl1j2w1oH1SdkWhiHtwnnzYsEsXzdHg//zf7Ys?=
 =?us-ascii?Q?n5GSEYQF8J7RC9qFR/Itb4BiLVTkU4pp/eEgScAQStZSYOpJjit1eY4LUdDX?=
 =?us-ascii?Q?/mQGkCWQAA59tw8mwcgPLxhrPBeBC8q83Hg9IUdxQ9Q9XVTC5faxR4B6/AQS?=
 =?us-ascii?Q?oyC4xXcH7YDrOwvzr4jE2e/j3M2VV/yWs0UJ3Ud7bsygkp3MGMq1fzLuSkM1?=
 =?us-ascii?Q?ADOg4ozoO802XHPZdj2qULyqGx7JG4/OOuY1QXE/nU5sWQ7SeJqrqj+5zVRx?=
 =?us-ascii?Q?sweahqhN1g7BPzsHEk9ULUemm1sVQLu3PvBqPHfAdJLPY3pQKFmrHq3qlaXJ?=
 =?us-ascii?Q?X249jNrRIbYqovo8mJji4oDzi5LCWh0MB93A9DOI10Vo125x4Jr2l2E4tFFz?=
 =?us-ascii?Q?KAyz8u+/rAaJPg38KhXbtl7n1N6eb5AMwGlUJi04xP2rJ29z6E6sZNrKCTk6?=
 =?us-ascii?Q?0xdI6MLpBAohirLjohge5lqU656BngUlr8uw5x77Zrd/OKUD2hLUx9H26t/M?=
 =?us-ascii?Q?RPRtMPx0/Oj4Ui0ueeDGfWEi8gnn0jyTo+W+JqL3YXfh/XqEknVpcOv1ELC7?=
 =?us-ascii?Q?pNdzYnFrsKDkTYp5D68y3csR9aPfm4z+3NjYWvcKzJoiKuTo8v4Ev1wvgiWI?=
 =?us-ascii?Q?VxRmNRfaRf0CVg9cEWTg0a72nYMuXvX04gFSuLwjwompf1g7ivpJd50l53bX?=
 =?us-ascii?Q?z3UBSw4KjZj4lZ+kRdEv2j+2ZLdwfuS1NxaVWehe/Oh+HwiS3iqDIrq8WrE7?=
 =?us-ascii?Q?NBlRq2t2q2EWwRILpFPOLT0xm8b25kQS3TXoszEyBH0Rwl/9b3sbwfK3eMKl?=
 =?us-ascii?Q?anNXYm5czAjEwoIodY+DK+PbnZ+b9GJSJci1lg/deRKN5fBq8bf4flBLGl/H?=
 =?us-ascii?Q?OwQg8SxVQUOdrhFdzHSy+BTOPki6Gkjjy+AsZCIUpXFj/72HK7QIovTio4vh?=
 =?us-ascii?Q?TaRZYoSGfQ4bBYkWfRYcpWPkosGzm3cm6NfS5iRpbYI1hYbX3/aZVURXTW6+?=
 =?us-ascii?Q?QA9T/jTJd6Yzbp5uESsbtXaKJIqbEqHHqTuJUgVB0P/xs7f1HMrCUqd4lPBj?=
 =?us-ascii?Q?X+tdrWPGXLHVMaImtf04eQQQGJi/30B7Ysrg75R9hiYILz9oeg54m/SGYInU?=
 =?us-ascii?Q?2SZvRQpFENeNeXKTYm1UNPsIrcim5xtdNe+xb4Xa5pJBn2D41WSFz5iA3aZn?=
 =?us-ascii?Q?ytmhjB/CianBVCJzkuM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8cA5wd1lhXD/LtslCw9spRFfxG/ZNLhcsqx/3Ok5CHbegKDbchvIEIxnIgC?=
 =?us-ascii?Q?9E/9nzHqEWSyEO1CgHC+0Wd1zS6n5FOECFspKgWkSHyAwX3GZpv1DPyKTARx?=
 =?us-ascii?Q?08vONNg6ErQFDBgyMhNxNh7rUFvSJjucEkbgp8Zpd5KCsjnkS2U865COCSnp?=
 =?us-ascii?Q?cAdPvQnHvsk3gXX1W/mm5ezM0O+4UYq3bV1gFJ5W4lJF+f3y1ucB2QHio0eN?=
 =?us-ascii?Q?Aa3F0MlsRQ4G885Jcv3oGgRzUwvENWehQ2T9itTMuLH+XzjBVsg6cFx6R+UU?=
 =?us-ascii?Q?7HBbwEXtyfyWiE4D1FO9jcTEwNWUpwrmwqaoDjnhAzj9PX32FsLRDn0KjHR9?=
 =?us-ascii?Q?smnLNCdLZ63aDY7b5sc00/v0DZgk22BB4T8HKruqzLE6mc3LeQgTLg2pRlmw?=
 =?us-ascii?Q?2Rm7LDio2IWw7xrGOVX6MLlxKAofVDVw8EFi8Tvf+KoPfI1Qq1Q4njXCPNCB?=
 =?us-ascii?Q?CHZv3e13UeUZasO6Hrq/xVyEMob5IJ3D0J1Z3Q5kkBZ7TL3tuCN4RQU+wBnt?=
 =?us-ascii?Q?zefB5VaqO5LtJ5qqjx8QBTvTPyxbUYXIoboJVvc1QBTHbj06KEef96u2v3/F?=
 =?us-ascii?Q?qmfTaEMC0WrZ1P9gkZQsAYUs4A9ZAW91KQDcw7v2VtV0iILwuajZPMf4BflO?=
 =?us-ascii?Q?n3NP7yVKqShaYCITERHj8BwPSe4aGAzIWZ2fnkJgZx0c882HE8UQhbFdHrC1?=
 =?us-ascii?Q?8kzouc73Qjvt8mT59vmSnOXlKVCpaUU4fqBmMMgoR5Befp5k6pkvA11HF2n0?=
 =?us-ascii?Q?Amdd7EuKDFB6xT7+Pu8dJ5TAkJRSRhKSceEnjVCDgUvZ/GGpEIB3N+SH8sOp?=
 =?us-ascii?Q?at/cVWt5uv8ldkh7HJcMAC7FtyxyEAFQrb5ACGrQvgLcZZVF3gcQBtTZzj5U?=
 =?us-ascii?Q?KgdvqN9EBiFNrkzOAr1gVeA8w7qW5wvNd1zSKD5usnkpQO0/vJeeso90Peah?=
 =?us-ascii?Q?eKSD7BbsKlb7Gmge6yLb5/DYnOXg75pnQhgUr1d1ejrFEze6s8YAWPA7whnW?=
 =?us-ascii?Q?KULQaBWuEVDSQSpL5xlmb/D9c3EEF4NzPZTcYb5j56b1uo479f7MKy4XKdJJ?=
 =?us-ascii?Q?IuvuZmg17+v0BMlJSjEB04TubwVWu4adojgBjIymrZIXsj2RaS1VlgOyNkh7?=
 =?us-ascii?Q?QjNhEcgVcbzQVFGAqC7q8RmmHPtG6HmF/HuADpMeQjOyiqtMZj8MfN9W0g9T?=
 =?us-ascii?Q?/IeoJRbCooBQe1KDOq3CuOm5kkZlJtcan3rPaVqdIXy9DMW/frX2Rrj9newW?=
 =?us-ascii?Q?ZaZ/TVTrF2ysCz9wDZEYhpeBzEYw22UgvLcNNvLkvuJWsPgOWB7ogZG6tgGG?=
 =?us-ascii?Q?28MqRChzyEn6jQDIZsOwKIh05jIc1dfM1h+6cqC9bfKvFD2uPeYMa81M2ziq?=
 =?us-ascii?Q?9XZCrunyO4nswaInKEEtItO/N/VXpp87c2Ny4djXq6AabSLM6BCPbFaukoUH?=
 =?us-ascii?Q?OzU8I6YfmBAqQSizp+S3vfetiLC12OIRh6BYucpUXvUnfeI53ImUdIScknhB?=
 =?us-ascii?Q?kMTgENrKU36egGqE3iz05C5YmGouyVTryJcRHI3AxKGz/3ypLFJYj24CqwtP?=
 =?us-ascii?Q?E2VjHTfIykG+akCjU3zudzPYxJke27YrituH8crEsYYFBOTDfJEL8nnKhqAG?=
 =?us-ascii?Q?OIoDffXRhrB4qdiarJEKnb/BZRjG9PkeHTHohgDZka5nutm5WSk8wxTZczpY?=
 =?us-ascii?Q?WMnYB+XDqJQCER3pg7Mn845wMp5D5J07zQzzQZdW1CNCWYZZ17OMEjrXxbkN?=
 =?us-ascii?Q?a3VFpZ4WnTQk3LjpQk043aSYaAsm0ne9x607JQnND/mUIMtBfQhT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ccb72-0c1d-469f-d825-08de54130e59
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:49:55.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4R3BHvd+NUsw0D49GN1FRkV+VjLAuF+QUxjBN0iadtC0lwSR23GM89CjNdEs5rGBO8oXSqV0Rel/COoulsnNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4454
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

- Patch 1/5 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 2/5 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 3/5 advertises dynamic inbound mapping support via
  DWC_EPC_COMMON_FEATURES for all DWC-based glue drivers.

- Patch 4/5 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support via DWC_EPC_COMMON_FEATURES.

- Patch 5/5 updates a documentation for pci_epc_set_bar().

This series is originally a spin-off from a larger RFC series posted
earlier:
https://lore.kernel.org/all/20251217151609.3162665-4-den@valinux.co.jp/
The first user will likely be Remote eDMA-backed NTB transport,
demonstrated in that RFC series.

Kernel base:
  - repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  - branch: controller/dwc
  - commit: 68ac85fb42cf ("PCI: dwc: Use cfg0_base as iMSI-RX target address
                           to support 32-bit MSI devices")

Changelog:
* v7->v8 changes:
  - Drop the explicit submap offset and use_submap fields. The submap
    array order now defines BAR offsets (gapless decomposition). Commit
    messages and source code documentations are adjusted accordingly.
  - Drop the no-longer-needed dw_pcie_ib_map and add ib_atu_indexes field
    to track iatu indexes used for teardown.
  - Move inbound mapping teardown into dw_pcie_ep_set_bar() to cover all
    BAR transition cases.
  - Centralize feature bit advertisement via DWC_EPC_COMMON_FEATURES.
  - Added a (epf_bar->num_submap && !epf_bar->submap) check in
    pci_epc_set_bar().
  - Note that some Reviewed-by tags are dropped, as the changes need to be
    re-reviewed.

* v6->v7 changes:
  - Added missing check of dynamic_inbound_mapping feature bit in
    pci_epc_set_bar() when use_submap is set true.
  - Addressed the remaining review comments from Niklas (patch reordering,
    splitting, and source code comment/documentation refinements).

* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v7: https://lore.kernel.org/all/20260113162719.3710268-1-den@valinux.co.jp/
v6: https://lore.kernel.org/all/20260113023715.3463724-1-den@valinux.co.jp/
v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (5):
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Advertise dynamic inbound mapping support
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage

 Documentation/PCI/endpoint/pci-endpoint.rst   |  24 +++
 drivers/pci/controller/dwc/pci-dra7xx.c       |   1 +
 drivers/pci/controller/dwc/pci-imx6.c         |   3 +
 drivers/pci/controller/dwc/pci-keystone.c     |   1 +
 drivers/pci/controller/dwc/pcie-artpec6.c     |   1 +
 .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   2 +
 drivers/pci/controller/dwc/pcie-keembay.c     |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |   1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |   2 +
 drivers/pci/endpoint/pci-epc-core.c           |   8 +
 include/linux/pci-epc.h                       |   9 +
 include/linux/pci-epf.h                       |  27 +++
 18 files changed, 285 insertions(+), 10 deletions(-)

-- 
2.51.0


