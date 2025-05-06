Return-Path: <linuxppc-dev+bounces-8336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C2AABD23
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBN96jN0z303d;
	Tue,  6 May 2025 18:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520057;
	cv=pass; b=S/Gb0OJVqinH6oMFMn2IB6UcnyuDsfsGE1grkDvrpZk1EqQl2hmnlDO9J8X1IQ80VzoSAx2TnRhZrY7QBUn/nXxV7RxwJsaE8Q1L8PFZajh8K175zFWqW0+ewt9IF6Qn4L/PWSdPCGmY0MSjDk/mV36VEm/BGuDWloz9H8nYgONIF49bCzFJYQ4tkOvLKLcK/VZkwPRmI0cIxEWHsnzRr8pNg55Z7e7gAARZ8ao89IUxdRQlotjjeauLSFdGc5SLdUyUiiN1Ogl7xu5fgGIYWjS5976tZLmiqVcf59OsiBYgEsQAnJzkcrc06B9gdYK7M5WVLE50tVcB6PuN6zPnpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520057; c=relaxed/relaxed;
	bh=p7IjmlpTssl1IvA+g8ZnPlg0gQ3t0Zlz0+Wge9Tozpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KInXHZdiWkK3HYA9/egA49+7SA7PBEdQgxTH7Xq4qfUelNqZgMsbk6xmWOrzazee1DEZZ+ZfeyH7s1kI9UuCkCqmLU/c/6SJuJYsbAcv5aKbysgFIqkxCvMs0+OCbtydzXg0dC+y5VFOAnuGn8FODk/CjXhp9xDaXgZfDwYw34r6H9yN9mhxMF5NbUNc/L+4EnQRPl4hv+QVd+6E97AQ2+BXnc0eMq56HdmPT/4zuMxgr6SR0c//zW+4eIIBZZkjAHAc16XQER7wLeKZC9qvCpxIPfkWXKgUHKY4w0e34g4HHJQ5AyHdaW7TlGVIIQhX3b/JURKgA6ZVIz96P2kcyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=j1ySVOSd; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=j1ySVOSd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBN92Clkz3055
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWm7eI3YU190aErsW0injkA7UijG3cMRbZPn1FXQub5/u97Vr0uGMaxTV/d59RfCpInaC38P8JBPsr7akRcioKXDgB1ot115p9aJnak7xM8FbF5naEU/6y77Ee76A5OpL9Mvxjsxx2s1GiKZtPTNFt3gQ6QdEKLi9nbC9SLe7SKJ1b13znVQFk2PpIyiPEfgIURSXmaedEyH/q9GkQ03MQYUlhoz9Al+m073PLQRKtB0FIrhpy0msAzDLQfyRWL0GpmVGDGpSEzQVfu5sUwYmXS2DBBSUbSSC3HyhhJQJ5PXnOyS1+ZecvBmPzZCjAEhlRnlEGasct025M9L8138cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7IjmlpTssl1IvA+g8ZnPlg0gQ3t0Zlz0+Wge9Tozpk=;
 b=yDs45BVISZt0QIV2vx8QdGUv62WyWVM9jPAL+VuDjW1e67dpGw/qrdHrd1JlZK2bftXJdlwCP6CJ1i24YYXIshEAEFJfOZJY2AWGuWsORjX0NcIWdsZ2auDd0I2/KHsEtXkSAMbsn1dAvvYbciUDda2hTQ5NXewAxXkEFa8SkkBSvwpixZUOphYGvOsBqCSaCaOyaz5N3RqWeA3nQ0S+pwgWk8sAqZj1W6MeH4Bd/hsE7WKXnNOSfAl0Z3TiByvInQ1jo8x2QkFVyUHz8sVxIe72p4NHDb3QNCf6ROlEQgqxRiOhddp9ipC61j7XVvmyS+SxyPblEwIrHPJNQ7rqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7IjmlpTssl1IvA+g8ZnPlg0gQ3t0Zlz0+Wge9Tozpk=;
 b=j1ySVOSdhYiDyHkZ4qezyBwe2RbNEzauRWBrnKHp/iCfVDpmvEPNkK5U/UVJfs2zqC7R1C1QDpUPJBVfpp2bGnjH28FMYhrfwuT2YsZLmT+GPN3gU1W8vpxQDEdwW3xZdAEjCg6Xfl7bkiEmU9zPWzolpqKTMbFS8YLvTlIHpa1tJfjgM6p4nkCagewxBr3s9SBg/VZ/+KsCq8b1gHkZLDvMgnGsEcQ0Xro1jJzEClqlQmgPAiZZ2u1gLgOdUyUMTUYFsUZeRvYkJclG04yxoGIOx59k9WDkqxP9x58pQj9H7wSIzI6tvIfxoGXs2dtZlsM3lkztBN4bs9WcXf9x2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:31 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:31 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 09/14] net: enetc: change enetc_set_rss() to void type
Date: Tue,  6 May 2025 16:07:30 +0800
Message-Id: <20250506080735.3444381-10-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8dd627-0fa3-4a76-e68a-08dd8c77d7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aCGj/Jh8Leof6gyAZbbbraFr+QMADjrNjIoTGG/5L8QwApusDgdkyZD94Pq5?=
 =?us-ascii?Q?QPopAhibn93qLku0fldhyAfxwP5XtB5ryed9s+x6IgvEkELOaavIdn7IQ3Nh?=
 =?us-ascii?Q?W21nGzkx3GqstlDvnah+gwZqhEmZFF+rcipYl3sXY7K7DBchsLJQoYFGqTat?=
 =?us-ascii?Q?u7ELr3yog1Ohhq0CK0vv1C8MTLLLcocT+LYKloO4gmCJWq9ll2n4SgN7Dfgc?=
 =?us-ascii?Q?xPnPbpB/FPZylEpXhaSsG78Kx7dxR2LeYDfNmYWzBQDT84hWYvOUzmWiTL11?=
 =?us-ascii?Q?iLv+pr9V+KzF7tXJoZ8UcC7u/FbYeUzUyWokntznYZ/VJIqgYaoiJq3OG2fC?=
 =?us-ascii?Q?RLNh+XlrujBvlGWv4ud97Jbq1hv4afyJH8C3xslSwCSTAHesnFVb7GFB/jbr?=
 =?us-ascii?Q?+rtaMKALt71VfVayTGAmGSr+vsZOHsoNePMAAkZHhfNFxwZDXd5WXjY28HUH?=
 =?us-ascii?Q?0av8zK4m0QjRAhsK0fbFX/IMS6fWsXgAfCgnq32TJLvikjJqnm8FtvkkmXA3?=
 =?us-ascii?Q?DHzJ9hGbwIhu2lzIn335y8YEG2gmrewSUO46U5W8tanM2zbVs1PQs6SyoIhr?=
 =?us-ascii?Q?dtkpLF8nQgu1y+C4mse6GvDrk1FACW4KEyaPkO7TgyadmkSV2tz90yFEuxQA?=
 =?us-ascii?Q?UhQXcJ5MlL/dFqB3TB6XUQlL00IIIPPQLOdzCASqdAbAAqflkZrU67yslKk9?=
 =?us-ascii?Q?rmWVOBWlX6TEt11YwxI0FgvuQAc/lf3TUq/2ndfCKHhhAcIFqjLl0hu2QcuM?=
 =?us-ascii?Q?D4qkjsGZoxzRd2TvMGEvlqkBx3zFCfsBJyjPAyQDYIq/z0wK/iYinXnIHpD4?=
 =?us-ascii?Q?YRskqhMXqNPqbHCx1z7IXlv1MOwRZobvZ4nGnrjx4zL7+DfAcHckC9Nv3sWr?=
 =?us-ascii?Q?bC8xYRk5Ah1XJRBJ6RtegsDfIq0tUzR8M+VstCoLWJ2hAK2lxNAvAdZpfmsY?=
 =?us-ascii?Q?VfIS6f6TxoDnNinpZrrsiyd/L2Mb5GFzSUXcp6ECIDzdqKLqA065mnT5GPXH?=
 =?us-ascii?Q?4T6SuG9b/kTm1F3i8SZOZO0ta5DH9Tk8ZH3ZawCUaV6dp+xcmHeGwaEpEO1y?=
 =?us-ascii?Q?0u0g9tXusvdmPciEnzy98Tep4EclMfjMGjbtB56MOoaXbcjOAQmrcVZ51K0d?=
 =?us-ascii?Q?6raq8ryOkt6a/o3ZiYXVmD0cchNCZ5kXn7DKH7YvwmR2jdSp7XnM+OxTxfhU?=
 =?us-ascii?Q?wlEBANUwwsFo3fltYpeDZxlZhgYNa8d5pLhAFb78DKvJFO6rkFBUyjv0iRYY?=
 =?us-ascii?Q?qYn4XW/4cAaaub5AWFkaYaEV/vSeuwk5ooQMJ+cwq7gGm76GjUPUHFeGY9Iv?=
 =?us-ascii?Q?H29lEYGgS21nIrjgSxtojrsNKIdabbDnqLkGHmagkV7cHLI9E93Io3oWJvp1?=
 =?us-ascii?Q?TV2qSnGetbBkqlDTQsn4dNfmSJ9p12r0sAAkkpgCLqyHhvhqwbqdKTRu3FM7?=
 =?us-ascii?Q?GeIaHTGlptAnIvOPatCN9vwrfLaonVvWiKOJWyRM4u9QRVeYABSzzQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kflm923e9jHkGQNyXjAMTjY1d5NBGM3uvno0WFAt9SBwyKLyTLksbsMasohs?=
 =?us-ascii?Q?FSIFVA/L7pCbTGGACj6d46AtSqssCQaZRm/nX9mu6h+scxtOQOpcrjkbRE/k?=
 =?us-ascii?Q?MU+hdo9uES9/yrEKc8EkdsA9NJlum3THE8stGf3UPZ8gR4cqRjB8SrzxwGif?=
 =?us-ascii?Q?k1rRayFp0KJE+oRjusMl31mwT5OCdPxFWuLxOXywykG0OjmpF74QWej9kcFP?=
 =?us-ascii?Q?T8mP+CcuycTfPUSp8p8NHJTAm1539pDXzlDWz5Zy/k5tVz+GkgUZXS88En0R?=
 =?us-ascii?Q?o86rBYHYVfe5Roci0iilCGn0C1G5vA2UvOxZJjYIFq4L3nk9yEYCBToj2rLf?=
 =?us-ascii?Q?7veFGM5UiH5IkdD7ala5DGBmpX9ZQQ6lE2hSQfp/3p8CJQ96+uwJIorO+MkP?=
 =?us-ascii?Q?YOaMF7Wjx66k1TpOPHDYi4+hOndlq2ObWpv8vbhQe1RtBoy7fmctrO/qtEUT?=
 =?us-ascii?Q?ajRdng42I6/AsGEBCMZfdSO3dDh8qPPpD4uxK+1B/AOXYEY/0i1v3E62K1zU?=
 =?us-ascii?Q?LPEKzX6wNCiF/J5vCMTFt4BIEl31JOPr7vyiVg15cbU5yv2LwMc4A7Ooc5OV?=
 =?us-ascii?Q?LaXI0eo4qjZxQ96Dd+y7B9tYjyc3RMUIlbKsgEP/MLmZVXs+iQ6lTfVJmQbk?=
 =?us-ascii?Q?yEPblLtJzRR+a1ngaoVmRjgVpAE1hwErffvLNHUdHI5hsB5bXkDWlSAFeaim?=
 =?us-ascii?Q?jNV1Ueih8YOKv0R2kb6xaDIUk5HGPT4V9aaYvUe1kByzHfdyOpodX3pl5ul4?=
 =?us-ascii?Q?lXP32PLI+obiCo2jrFXaARJTvllNg4ALApuwEeocrcSb5G+itB1ClCgV7rA2?=
 =?us-ascii?Q?V0YiImkJ6PmZTsrTB4q31mbEiO/+tjqnQ/hQ+56T7leJlIn0yenOoGZeSfhp?=
 =?us-ascii?Q?Eo6Va6CqbvkYgiKYM6FLPeCuXPMx0irIyCSGcv2MYqVL3T+0qyUk0v68Wyux?=
 =?us-ascii?Q?q0t6awnQ6egg8Kxp2uAUxwiVxTV6usk3dv94cjIimtmjcemaP39SCetbXY3H?=
 =?us-ascii?Q?EFmE7PbJkZJIdoVd2E0iePDyA/1LYzUZkheIlcBhxzk9YnukVBfhfJh9jU08?=
 =?us-ascii?Q?r9o3jJD9CPRUqUrBivVyOMxrvgQDeaE90s+1R4/Jm5UoRMhv1vki3VmU4RIq?=
 =?us-ascii?Q?+/SGf5N6wJ0GBbIe3O1XkJgU5A+m2JwPWVH8tJQOkRok8EoSPVjYy0gmsfsP?=
 =?us-ascii?Q?7nPPsIOIriprsQ79xa8dzSG9G2/mUD0Rzcg1rNZdlGXld7Psse41sF7lbVwr?=
 =?us-ascii?Q?5L6tY2w/uMmscjFmQc6NCNh/ZRCk4N4+bUTvGkK5i+BpRZLRmJ5gjQd4i+GP?=
 =?us-ascii?Q?QstZ2GhbT6oKLBSBSGD9swN/WsB9BujSRZGAWPxg2GbaXXtvxB14e/YdRxxz?=
 =?us-ascii?Q?N7AO4fos6xdD1joW4eRzCoSdzT/jhnEmtRoX+F7MINOLBJL7Hjm9kNCEXzT+?=
 =?us-ascii?Q?LukMMUsrfytTgCtlwciRgEXJMFrbkN47Ujq1kJAgzg05JSwvxRMXsROYcRwo?=
 =?us-ascii?Q?UhMrxpD0x6/jWd2OuxqMdr/dFcekmDKw2IuvegnxY5ocdtUS1mEk2V6PRnDE?=
 =?us-ascii?Q?C5QHxTS8Iv7JcEyqDTUmoP5X5l9STlC5rj0mIWk5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8dd627-0fa3-4a76-e68a-08dd8c77d7b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:31.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efpEODlzbmWmLUBY/MvAjiqUx8NUoaY/ZVMt0AvRA6AtG4If1O2D0DQkZy1SWd+hyN1PaZLAICSWuT49JY0s+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Actually enetc_set_rss() does not need a return value, so change its
type to void.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 08762772c045..daea85cbf043 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3242,7 +3242,7 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static int enetc_set_rss(struct net_device *ndev, int en)
+static void enetc_set_rss(struct net_device *ndev, int en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_hw *hw = &priv->si->hw;
@@ -3254,8 +3254,6 @@ static int enetc_set_rss(struct net_device *ndev, int en)
 	reg &= ~ENETC_SIMR_RSSE;
 	reg |= (en) ? ENETC_SIMR_RSSE : 0;
 	enetc_wr(hw, ENETC_SIMR, reg);
-
-	return 0;
 }
 
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
-- 
2.34.1


