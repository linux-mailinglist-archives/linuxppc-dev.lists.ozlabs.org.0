Return-Path: <linuxppc-dev+bounces-3573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B99D96C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 12:56:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyLcb5YJJz2ynr;
	Tue, 26 Nov 2024 22:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732622143;
	cv=pass; b=gQYFpaj6g2mpUtx3GpH1j2XPelx+lXF6rVf9V4sd4zm1KpoLyQSP5XJwNawudARjlLxYGNwxmwQH89r7MgvLz2hXCrCHPLxJTM0UzLo3qVMtAfv9Q+ZI5Zc7ARO1skFbDyNNAUQuM1yAnGjYaMCCcocKCpiGOEOZW5SedPTcjxG+wj+rodiFwZ9fCsxGh693ZzLvx2l1A2mkdHEbca+l5tSxj9zCfBl5yZ4sgK7qavTkp8gB8HLDIwWtrMUZI3b8eCay3i6xJFplLBLvtMhAvgN8Z5c8YvnFua3gdKfc5Md/cXnJsxGw988M/O6NeI6wPy3iHYHLygb0gjWydG8tqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732622143; c=relaxed/relaxed;
	bh=PRF7Wg8B6y7Y1fqLOG/QTuzs8XBxESemNeQV7BuQdsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=czbNju2H7oSC3Z2dEYrNOFs4yZtrV8bWmA/YROxciO4F/c37MfYdzFVqcL39ie7rLeUo7sxvNOSiTn61DaBuSkbJ29p4XVt7qF+DMirQ9mxMQS/xrF7Q3BrfwpM31cat5TsfzM8zfPw6+KCTAfijvVgPPno+RJBdecn/ATVQUaeCA4hCuZl5a31MOElhzUvl09JPOfKOSiKG2opm06kMRdoQG+1I+rsOflxfWbMn4p7gxbqPju0hQ39cD4f4yXP6nnTjLPbbxEQWVvnwvlNloYpMhth2d+hjp+JU7pEe7FXB/omv8JjMTk1OWln54HKIshCmX2V6g+8MudotqzIyJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mQKT2C5x; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mQKT2C5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyLcb0zfmz2ytl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 22:55:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey/fPVqwPhADELWoctPrbE+TfZM8zm6gJevih9YCcWUDATs2ysGS4MpCMzavdGnOsfZYV4JQwSVlzOtlx2TtAn+u3pFcorudLku0X4e6H/Zxqtnz6jOcBamX9jo8bi40vjcacaE/xsraZy7ytAeolg2Dmlap42wSb/ZLgx7FINWdPgd9A6MI/R7eZz6juaI0qmtYD9VLA6n5GYxErVxJHamNISqlkB7uszuOFOmGboCefZSXty3m3u+3yxOwRBovb1fTd0A20cawF2im1pUKXCqtMfWFtY/dw+2t0Ch8f6br8a9XjOtXVWqIszI+AGw3pHeKRVOlsWIgvTTP+Q5qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRF7Wg8B6y7Y1fqLOG/QTuzs8XBxESemNeQV7BuQdsQ=;
 b=KkHkSaz+hO33vp0X+6GrFDO0xUbeDGzUf6xQBx4lvC9V+G+nORqfJIDN8jtKLwfyS5NhZrA3N7ch1xJuVhWn7bvHRdjHcYpFPfS6Em7Z/ssWgxBLFD8Yu2NDngvaq+JcKImzLEE0tKxjhV1WqPkN35fMSogKBn4p9c9UhyLPF8IhjZa4ueZJvpT3Mv6ruXfm9jpFdJwA2ga9vEakq8k2JoKCn7syaZN1rYlB4M9jsCqfNCOBiZj/8tRTthyaR1nvAV8kgPQMeEhRnUjdRkkzc5Wdtgyxhp7OUahcfm1XrUaWbAhopLgm6SsV0B+N9RYizgCJgBr3MPICvhaX4SopfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRF7Wg8B6y7Y1fqLOG/QTuzs8XBxESemNeQV7BuQdsQ=;
 b=mQKT2C5xQh4mHh7J7uxwN1rpAxWV1jt9BqOfLdxxvzm1jZVHCRcSMKOahf9WS0DbuDYUo0yHh5chanL8K37ijKEq5yu1vM7H7IYdXu/CpSN2+e73PH8Tn6zMOwuw1JEiOw9JOz9OCj/l7YsML7bP2gMyCbJnnul6Ev1LC1fARL2WNWh+lPUSnUdn82AyNy9BNfUP60UkluBvpz63DuLqdoiUfv4LWIQxay991/PCl3AKilDSVyiR94vs5hUqQ90e8cVlGd/uot/e8bi3GskEuak3m4CA/NpRDI1IDEcCbjL/2oxuKkqrGdqrmChE7cAbtXB6tMZklspjZ6fO1T+yrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8504.eurprd04.prod.outlook.com (2603:10a6:10:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:55:28 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:55:28 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 4/4] ASoC: fsl_sai: Add sample rate constraint
Date: Tue, 26 Nov 2024 20:54:40 +0900
Message-ID: <20241126115440.3929061-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241126115440.3929061-1-chancel.liu@nxp.com>
References: <20241126115440.3929061-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bed7ee7-7a3d-4d9d-85c0-08dd0e113840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uES1/8jusCq1upHDstIBQpUj4t5EgPTPBUnY1zBPwEurD/Laswiv/vvCX0uj?=
 =?us-ascii?Q?0ZhOVB7k9lTcYRORx5vltOCNCkqu1U3/tpsY+Ye1HByHA9HrbfpalQrSu4wZ?=
 =?us-ascii?Q?GeBMY5iah3VB3jVfeKSjHjndXVLqzSjesF7qiJ7enCCbGhXr37ZOniryj5lY?=
 =?us-ascii?Q?wCCL5+ryK5DXhUDu91Pz6mDXwV+GobQKMQQqqs2G+G0T9ROQMwUi1nnY1Nws?=
 =?us-ascii?Q?cRatmC4nP/J0i+hY3iE6M4qQE1xThcfxvfro8e6v88SDOW7fWj3vE28C1OxM?=
 =?us-ascii?Q?WNJk3bYAzBlRGLuZXchfcm2N7dHqLvv97pLZCQcJHaWj/8KvlTivm+ZdHxdk?=
 =?us-ascii?Q?hoBC6MJyP6WEJOuNtV9cNtedWBoMe5g1MC8/UOzYktjSwGWtxm57dLVm0AML?=
 =?us-ascii?Q?Z2DIrpccFE5AbQrOR+DtHZkbXBvdJZkSl8OKbqcjDCq0eAM+LaRPI5CxlYnE?=
 =?us-ascii?Q?hVTSinATsKc38Bzh8CWqwMj4CrLypDO17gf6Urf294Jl7XsQrgpa3OhPepOe?=
 =?us-ascii?Q?Q0VpecMDA9Jv5b8xcO0n75/d7WTc8ZOq/P7ddIv1gcJ3SR2wBGfkSW2SKide?=
 =?us-ascii?Q?GkDn+c5My0hucAISDyMHVZjeCHAdxGEYJejYzc+Gcv07sHm67LfdEJqjYgMd?=
 =?us-ascii?Q?OdXA+zNKD6Gb/MdtvhbhdPt6geNo/QPdkRKZ8JlBgf5W7DeGKGxF8ynA8129?=
 =?us-ascii?Q?7yygtbZ3L4pUzr5OgTCOluz5WUeR2MpOGpx5VuVVNEFlCh4PXr4v9xbNepKr?=
 =?us-ascii?Q?sgGAsmE9tr6x0l8hxH1Sx1LszhJ9Tm/2BlTYbyCYpEF31KzNtmsHQYacLFm6?=
 =?us-ascii?Q?wwQzQEwSqpaEgAtE7lwVMxGd+ndObCYICd5edG+3ArQt4zlsvLQFbNrysWfN?=
 =?us-ascii?Q?/MG04v55EVpRa3YqxyFi6z4/qwW959w3mIlFvxiv/RFqiHyvZdKvesXlTJwY?=
 =?us-ascii?Q?Opl3Nr4XP+Q8vmk2ByRrGDs8srm/VmODSPV0kh5CFn3BiNIcPALCFzuIyLh7?=
 =?us-ascii?Q?q5SASqVqsECENWNQ2jths3tfU4cZxWwf7MRJhkBu88qPztihQ2OlpwxswY0f?=
 =?us-ascii?Q?1fcL/Xmb3myGV+XfwUQ1J3mOFJ4kYbcPNYocf/UaDBqnJ20aG/9EPKtSNHy9?=
 =?us-ascii?Q?AScVnG4skvmKHsf6g0+enoolR1ysfWgrxAITnA1/h4ZIKChhXeqXmYRoXkLY?=
 =?us-ascii?Q?Ldw4WhBkY794ieqPvyyRCTX+l1KsHvr82n5ka22apVjkrszwmLR+Br0aSj6Y?=
 =?us-ascii?Q?PbwOqRahUfU6qA/6kvlQGrydrPlb/TQLHyYjVTy7cwMDkM/TFUxVmSH18MsC?=
 =?us-ascii?Q?uhXBsCl2Kfg2OMpKOoqTjsr7xtqrQ8I50sZDryUKtymamif7eFeCJn+crtBo?=
 =?us-ascii?Q?/3cL82hWnMC3UBzf0fmB2qyrCcxKbOLJxjjx48nX65oH+EIiODl3J3seNVNs?=
 =?us-ascii?Q?j6a9IfFLsfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Cv9tovx8YZC/961u/vMPc2mebWdhMbBVSKH9EMqPJt70Kj271N0W0Xb2SA5?=
 =?us-ascii?Q?9okrP2c951VnJQY+/FHurOshPyMn3/u2Ebq3xiR+pk9qmsvu6upZ4qZIRWpQ?=
 =?us-ascii?Q?iZEw00iW/yD2jxYA22rK4jgC0wCoCrl09SMHJoNqNH5Zt4Dc0GNbD2IkqIiZ?=
 =?us-ascii?Q?GyDz3B4vwgDJSL48zapfm15cBYEclajKFV6MxH4Auo5C0OT/dOo4+5AOlvnT?=
 =?us-ascii?Q?OCNiGl6NyaAaa8hgsKXmV0hAY3UC5x03tuysmuC5vYsnDqZutGTI4v/8OWj0?=
 =?us-ascii?Q?O7SH0llS+a+C3G1k3BPbJLcFKqKurHGkRAOqQDsyBZKKIJIQMGX1fLjKmwcN?=
 =?us-ascii?Q?HnmpHpai6rbzmHTLAVLkXF1NBtRwwWpmN6CmAKCTxR+D8CQcdUKRWQZIgnvA?=
 =?us-ascii?Q?lveSuxaV1aXFZCGkdW8okfJg4WbId4WHbLfJy0WyaV6Sy2rGbAMZzXTo+2jI?=
 =?us-ascii?Q?6UryOdVYFmf7neESNdk4tUDDR/Y/wEHiJif1naKh0jmzqOWs/S2akcX1fu7V?=
 =?us-ascii?Q?UUCT4TEEPk0+U18/EvxlXmif/CMUay0U10+edYlYzS//a6JBfjzD4wcaNhhr?=
 =?us-ascii?Q?2wLa99Lgp8WYqJ/xuQnJ5DM3eFjZrm1KQbk0yoGG5rhPxURLpnmX1qX3EDTF?=
 =?us-ascii?Q?8YW+UsAj6Z/HBc2HWG1a2rR5NxeUtpESlTuHCSUU+JTjbPX3GHkGsNkmrOWF?=
 =?us-ascii?Q?NalQJ8PZeqSuqEx4RiYPEX9+bS29diUxyPBMizYtBkBpnWizv4Vpei5vXEz0?=
 =?us-ascii?Q?l9H0Pdk3XKmdqUuKvoq7ajwIT+7iIJBhVRHRE7prDZW5H2Tic6Yqdi1cH8gR?=
 =?us-ascii?Q?5TPDZiHXnoRhkatathk2P9cGppl1xmAE7djq6zYUxeBNVwpRmgbKKZQbWstL?=
 =?us-ascii?Q?cfVBcZ/sXY0X3ceSbCEeKanMnHbBJ1Mlpar29UbPjZKMcKNhSgPIDMb6xEYY?=
 =?us-ascii?Q?tvk3Izm8ZU03FF3OK2uZrIiBQwu29MqdTNAzZiUc8UoOZgZ00aQaJFLOMesP?=
 =?us-ascii?Q?XIQlXi2/9G1RgPthUBZTIrTusZxXSKlf0IweW4S+pw4KjbQflo+AEMow66C3?=
 =?us-ascii?Q?Dty9VzKCMDofRx+MO1t+KDmXb16QLzpsfNcvZBnhSyTJAfvjmLDZbvjHA8Z5?=
 =?us-ascii?Q?VnJ5jjCQE9n6JaSbKvag1p91XbftfI3kwUXgOSS5n3kPGejIBTcQYM7A2Qz8?=
 =?us-ascii?Q?JLRH8yCSyxlOaFgZ6TbUC7aUnoJwk5f8mgHet2qVn/Up/+DLzeQrulPZtEw0?=
 =?us-ascii?Q?9sme1QZLhwb/ZyhnqZMPnlK93ZXAgrqBWaBaz7OFyR1S0gIbS1ZHiz1PLG8A?=
 =?us-ascii?Q?/RETvdJ34ma2YiQXN79fe+hSeP4S+XSriJeCdMP6U/lalOWMADvcbFTQp8wA?=
 =?us-ascii?Q?Oig+DV0EDMUukuSXVJUphdip3L8fE3iKWiv+7BA7vGYt9JjtpNtd41Gh7Zpi?=
 =?us-ascii?Q?5eMm5L+oRRTQOS6t+Gn/bBvJ8yRfnlACxBRlqVNrDkv06YWZ3HuZcEvPltAB?=
 =?us-ascii?Q?s0SQ0WpDqkTeSd+RaqvRR0m5pDQvZkseqJJ3iuf1+XRfgUAVpYJR7cjE34Tg?=
 =?us-ascii?Q?CVwM1i4592aBkAHFYWMPJpkwlI8/xElAjqGlJyjQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bed7ee7-7a3d-4d9d-85c0-08dd0e113840
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:55:27.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uqdsGTBm/Ydc90hADJfxagnQXqNDws8oJIPmWsyqKHEas94/D0ThDfCXySb3rCZ3MvKyPnKqGzCwcYzEXiSqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
not supported. If the PLL source is used for 8kHz series rates, then
11kHz series rates can't be supported. Use fsl_asoc_constrain_rates()
to constrain rates according to PLL sources.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 7 ++++++-
 sound/soc/fsl/fsl_sai.h | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 634168d2bb6e..c4eb87c5d39e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -885,7 +885,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 					   sai->dma_params_rx.maxburst);
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
+					 SNDRV_PCM_HW_PARAM_RATE, &sai->constraint_rates);
 
 	return ret;
 }
@@ -1442,6 +1442,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	fsl_asoc_get_pll_clocks(&pdev->dev, &sai->pll8k_clk,
 				&sai->pll11k_clk);
 
+	fsl_asoc_constrain_rates(&sai->constraint_rates,
+				 &fsl_sai_rate_constraints,
+				 sai->pll8k_clk, sai->pll11k_clk, NULL,
+				 sai->constraint_rates_list);
+
 	/* Use Multi FIFO mode depending on the support from SDMA script */
 	ret = of_property_read_u32_array(np, "dmas", dmas, 4);
 	if (!sai->soc_data->use_edma && !ret && dmas[2] == IMX_DMATYPE_MULTI_SAI)
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 9c4d19fe22c6..0e25e2fc7ce0 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -9,6 +9,7 @@
 #include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 
+#define FAL_SAI_NUM_RATES  20
 #define FSL_SAI_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
@@ -309,6 +310,8 @@ struct fsl_sai {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_state;
 	struct sdma_peripheral_config audio_config[2];
+	struct snd_pcm_hw_constraint_list constraint_rates;
+	unsigned int constraint_rates_list[FAL_SAI_NUM_RATES];
 };
 
 #define TX 1
-- 
2.46.2


