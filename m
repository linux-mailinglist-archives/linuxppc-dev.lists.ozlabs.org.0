Return-Path: <linuxppc-dev+bounces-6865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A9A5B8C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgc0BnXz3bpG;
	Tue, 11 Mar 2025 16:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672587;
	cv=pass; b=SMmMjRahX6p+vTbKILHXVrALOPtwsukERN1e+gDRlsESmi7iRDQ2LyxwYVpZY/0ll7XmsNNCtQOIXKcL63e8wb5dez2b5LUZkIQxGuyOJwfP38gv0Laf5Q6Ppr5QJxnKo4ByGJDNRjsXaSsG/8NMp3rOHUGkN62ACcmOtpBNbiEa+4bNoIL64I2shCeGGxdrzL8vdK4LjjJXf0b3ki78upJf6YhGJJ7j0eIYJVkfJhx7gJBftg+Ff4w7tewUbJRw7CQj9CIq9/Km4JXJWhwQs4ptUZfD4mYcfn3n2Ge44WEutU8jBff5XBAM1TN5HLVVs9FGL+D+iOTO65CjmWmIJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672587; c=relaxed/relaxed;
	bh=D7PYgf6ZWcE2ErCiztiF7r49Adye4DKrFahGdFYqWv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EHJyZRSbH3iL9n6Hl+tghvwQXVDMj6J5hDDLUGSLgoFScivak5YuspdtYEoSl/RVYXYK2INMiHQLwoCD/SO1mEdlWTIYpjhYwUthOSNJmG9dpSyIiLy6lhRrd6Bd0rnTRh6TGefQRiQtC8UOUPA6N5MswD/7wcUM+exLB3NxKPDgaTBUwU7z+CKkfhRwOdkWrH3tR1YLjlThxjaU4gArtSGHT5z7WCQWjemjOmRQqK6bsX1ae1bkAkbibEaER1mcfoimzdGEDBrAWlZA1hdm/1eFcIhB0PPLYbQLsQ7ABmkgXYZ9K0TPluF0SY9/5vHy+lb8gLD8GKGUyRK/ckNqCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gG5N2IQ7; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gG5N2IQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgb0L33z3bnq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTakFq5a5O0DPyGpdOktke2G+hELSLWV0pVMYrFy2xKuAoCpN6KqfscvNsHS/mI9GQ5ACPOaSQUp7+n5z4bMcdnZh+0Ei2MtxeqstEgrxHGGYLZ6/BCmjILz0i70Qrd0ulRqTyJikcIKiINLK2IVuK4SeunsIDcUYNbrlqqy5Z2K8NekN5VTqSj+4mzl6anSqFXSGIf9kpRG9vpPSforc74wjAvBEA2QCXH+j5xLwon8ordGFQm2gemu+kTkgCPGyQTCnCA2f0zhYYp0M5QBJbr+1PKBxRNHkZmf1JrJTgq38TfFAONV6mUjiUlzDi4g1zvEZ1MY4Mk8wF4qrquw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7PYgf6ZWcE2ErCiztiF7r49Adye4DKrFahGdFYqWv0=;
 b=JacH7lrb7sG6Losg+dSZs6Iuk32MCHGMp7AYg+mnWMus9WPSqHuSLHVNugOQA70y7mLE94WsgpDQa7n3HrcLUDWBJXpQiMht4uoi+vmze7DMKHgBq4IEF2QcO/bubd6YJdZ0kCOEowcJpCaPSDls2J2wVjq9H1jOMyyr2vcTboyERWfTl7PnmxRfdx1CBman9wDfqg8OUKDIOstjMiC5dOgZJvL6vhcUDcR5jtzEJAPwDes2ae0mfuR5aTg83EwwlHWWIdzPMG70Lsu7yJDl0e9rfoSkYQNBz/jhReSsw9ES+pzrF4Qd2DIsIjbifbUVuOjPhKPDJJpPB3hp4A+EKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7PYgf6ZWcE2ErCiztiF7r49Adye4DKrFahGdFYqWv0=;
 b=gG5N2IQ7djs/N/8zWr4RNj9r7BEv9ACmNQnBIUQnXCoCBhTbv/y2oXOnsClwmC9O62YCWhqEx7eYAhM9OAlrE0CbesKOply/WOrCV+392Jm7K8eJxPDu38qeu/UGUXFDKo9bnwpdT4My1cw0Lu5RxM0erYMc6tVVoGqLf9CYIfizJm5ay0hcUxzcoRlI+L8KHTFWoiNx8j63qc27QGQgoiMFJQerAfcysBY8GewNotXmOBSuVreIwvVpfVCMMaU8yVCA6hiMCFT7Prttc79xRIu4Yk0Jicji2hK5RO13IeJ4hDEtM6b13RjtdEk2py4DZ08D7wz+o8TfkBC9YcyXwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:22 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:22 +0000
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
Subject: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95 ENETC PF
Date: Tue, 11 Mar 2025 13:38:20 +0800
Message-Id: <20250311053830.1516523-5-wei.fang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8f00b7-5301-44ac-1df3-08dd60617391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KEVNsHwwOnufajjXCE2yEUkuhqWzfiqEEN73neBE7ZkRBNlGecyH/oP0wet1?=
 =?us-ascii?Q?2IL3LO4BwcfvvQvf9ocWzC/aFzZYKAwsjPDLhvaH0W9JEfMWpzlQByfhHYRN?=
 =?us-ascii?Q?MUpYAiNZFdR37+MS3ovvmB2K5ZQMvYt3eCRxm9Mb4gm8lCu7+fxOxD2v3S2J?=
 =?us-ascii?Q?zd7t8zf9gPiiugorFFWlQM92iy54JR7+AlEsXbABOlPQTRt8VeGWSSAD+VdZ?=
 =?us-ascii?Q?5WHSuOEdc85HbvwL47LC1hs3gJGW05uzfVMJ3hwlkGwR51j6bwYhvIemAuvM?=
 =?us-ascii?Q?b40ouxuASpK380a6P2XtylCmTUjv3fK6FZYQNVd4YlEmc09Fyt2t0ZktNbQW?=
 =?us-ascii?Q?SSkT/tOCZtvhv1hAzq7Eec6Mwr8wKnU+ai3/uEs1Bs0ecaT4yeBq0ip7NyVs?=
 =?us-ascii?Q?8GK9VFwxbuJWEBPLWzZkcoXXjCE3Y45o1r1zZWtntS2KCpT+0qp8p715tyYj?=
 =?us-ascii?Q?Xcz3bjRkA1IrfIhoVBZ2+iFp+9YFmzWjM427H+tw/dRlyMIPD1tKr4zlX7WM?=
 =?us-ascii?Q?ZSpZambE2DX3rZvoF1pNPnMULh+nDOVMtisUJx02blx81zVgOP6n7vBYa8Nh?=
 =?us-ascii?Q?ZZbu4L2WvON6psqkUylP0NjZoNOLWFkKFZz7JtxTmj+3JulZetcrbVjXFHaa?=
 =?us-ascii?Q?4H13Cqfwi2zBF7Gb5wuG++FBRvJefkjnetiVsWt5kDm+8+CCjzMZrlKX6dKN?=
 =?us-ascii?Q?TZDzQiByg5EsaFPZMludaIZvB4SCniOoa89xhwW8liwgw7bVPzLAfnWjecP6?=
 =?us-ascii?Q?jXei6soSUGjKBME7dXtQWk0eYA3cv8LARA32qVOc/P7HHgQigl6uDJqfrWNA?=
 =?us-ascii?Q?9r4xUpHjWcfxadrUBDUHOyRj8gZpElvmRKXCw0+IwD3/whvnWS/8I1HW19C/?=
 =?us-ascii?Q?A+HUA0PzxhIwBeImfWvLQjbTfGLkakFL95x9dUmWVMcjF+vt5CLAgu03Ttg6?=
 =?us-ascii?Q?dLnvcWdkdzP0wQI5IAL6NZONtF9Xw0MJaYTQnXONDsF1t+2wiTI4wjPMp1vf?=
 =?us-ascii?Q?wrp2bOEsEf7dDlKWnKG9NuLC8RhxWgVJR8QB3NELgXHiaMO+BDysvvZNQAtT?=
 =?us-ascii?Q?SE54ryaDXHivDWTrggNVfuCMSA0cYLow0v0FZGLUoOlgC7UwZr1LMQbM/O9H?=
 =?us-ascii?Q?DY/W+J2LMWzvDLtwcRk1vGAXHEV7Hgb/VZwfMsAbxnEYhua0zXCeoYzuWNpa?=
 =?us-ascii?Q?MZTuwiilfOtJGqIulE0FYUjE7nBjvqf8u0mf+A0gLjsgLwHkX8JNgQZ4L3dR?=
 =?us-ascii?Q?sQkrHjXwCteiwggEsXv6ZvfwlkhnVX2vhKR0pAi4WF8iDjsAM0ckETJYK4Zi?=
 =?us-ascii?Q?bOhiPrH60ADmNPQRp289MQ+4ePFvLKO3jsR/47xoUareA9CgCaTAelaerJAi?=
 =?us-ascii?Q?3bJz226Nwjt3H1WnoZDUmn/7zCNjrIQ3mv2VfWLrjrP4De36aA49nT8WKQ+O?=
 =?us-ascii?Q?A3VOmjpPw6Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tlo5nXZ7F0VB5MPijrro2fBkS+UKjt6mxKqGcC+jex5ZpFXFsivbXt6aBqRd?=
 =?us-ascii?Q?kuG5ifPpiDr7GRTe+c359bLzLI9Snn/HAjY4PBqxo1j7AKo4kysK/yK8LJTw?=
 =?us-ascii?Q?IDtdU44fuQRNPcaH0KU9+RzQyzTgNJuYU9gajuiPsHulDSIUF1tZ8639lkCt?=
 =?us-ascii?Q?dpdrwgjnCNpvRkJk4iSEnDO5fHb1ne5NBAR4DsxT/B4Vr+CrWY40luqpBTQA?=
 =?us-ascii?Q?jzcxdlAfbt7cyKbf9zvzB1yCfZg7n9bV1TdvYgWbcTsSlgGkIab1DlqoEXYs?=
 =?us-ascii?Q?0DMemOjs5YI7KZ24gRqcGNf+tnV1v9AXUeboUkOVzYH7dxLQjZdE3j+mMa3e?=
 =?us-ascii?Q?P79KNFxdAsR1mkNWqDON4HMvhSx0D1DAF901raCjCCA9tLj6kuMyOQ/V/9Rj?=
 =?us-ascii?Q?h9CHyhXp9n8pGx/a7lbNKxqp3wKGwo6R/qHfMsmThzCyh4FflAa4izTvOa2Z?=
 =?us-ascii?Q?WYw2ksKAR25+wt3IcKERmoDPJEf+kIJn7FWz0ANpVxBxmB+Lj2KiXMOOIGW+?=
 =?us-ascii?Q?v/1df/3zSD6Cfe5DZtI/6b/Voj0Uzxuc3JpLNs26j08fFUAg0NRb6cUVgY4X?=
 =?us-ascii?Q?c+ZY2uzH3b0wJc33upnhBPbRXfsM4qzV6/GCoF7BDj/KA/4vCSHqChyGoM/2?=
 =?us-ascii?Q?L9r9loGtjFG/WPc4mNhBJ0RsxVoKrVqVUPwB0bVlPdKM5NxgMGRVlerZj/l/?=
 =?us-ascii?Q?zEMwkTljMVVFDLENURdMPQqgxwG7Nl8VG1GU64B7ZyoEs8kDgo3wJNaS4zK5?=
 =?us-ascii?Q?iW/rkNc7sI/hlaTtmmTwrZFmbPFW2Vs3TkpTfxWJ1jH1YErB6jUM0UpelfEi?=
 =?us-ascii?Q?HEiCTXSOkRF2NmbSk/qh2EfYrlU2ZUAhNLf9OEK/Mns0CFXJ0LLNEafUFSGn?=
 =?us-ascii?Q?B9OLiCKmOlgFhc0Nav53OnSfU6AnCIDoejfNUBIRNQTh4mOiCgNliIvhFjGu?=
 =?us-ascii?Q?1RelD4ItCvGNYoY8bO3fHj8bueUqbqS8bj+FVqf6WbChHNypdOP3GHKeI+ke?=
 =?us-ascii?Q?3G3l5xu/oN4LzSucOPOqTuViv1ssRoVguoLxdTJo80nlzbq5OkBi3erDkd11?=
 =?us-ascii?Q?QD608O7TVk5RXs5a8jj2PmqHL1LOCD5sMU63fdgvdfTyLEsLZT+ygBmfdVCm?=
 =?us-ascii?Q?1AbzcibIfFj+sZyyZM0YCq7vqwP6XGmFmr6soz9WftEOhnDvyuQqO9QpeIER?=
 =?us-ascii?Q?ou8rrJ/EZn5dncnYCaISRaT/Fd9ws8Bojemfwb2s5yfya4d1DQTZAUioc/2i?=
 =?us-ascii?Q?DMmDryHtsKkUcRHb45S9/rg3vNEDiS6YsNkd5oaur7tm81mtTkcWvWxMxqVx?=
 =?us-ascii?Q?PX6lttzI2n8Yd2kQx9R48ezUbUeoEt+d53psb8IK3MG0lemnRf42pcHKVq60?=
 =?us-ascii?Q?DdVFEQ9c/Swif4SdvXwYptoWc3mUUIrIvrKa/YBo/xdS6VcysmZVXJ7jyQuH?=
 =?us-ascii?Q?QVNTA2wHn3B9xIRdUfJg9BOOLPWrLuuhwLQJUuAJ0JTqj2NgCl6jTE8ii9iP?=
 =?us-ascii?Q?AaNKkYFiEM9ALrIDfoIj6/zBD4sX2b2EP9UvhJHgtE8nhPTsoyAavJFqTlnZ?=
 =?us-ascii?Q?orBBQNNzOvOLnLIRi9wmKEeFk+4HjQWjdQ21YQlb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8f00b7-5301-44ac-1df3-08dd60617391
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:22.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPitOm9Civb1E7nHNwrjUdKgSO9EkUQ4UoGyS9EdB+xDSk+Ab8b7iEcBTp75f4FJwL0eLAcU0gdbBWkaRu+Z3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
hash filter is implenented through a 64-bits hash table to match against
the hashed addresses, PF and VFs each have two MAC hash tables, one is
for unicast and the other one is for multicast. But MAC exact filter is
shared between SIs (PF and VFs), each table entry contains a MAC address
that may be unicast or multicast and the entry also contains an SI bitmap
field that indicates for which SIs the entry is valid.

For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
observation of the system default network configuration, the MAC filter
will be configured with multiple multicast addresses, so MAC exact filter
does not have enough entries to implement multicast filtering. Therefore,
the current MAC exact filter is only used for unicast filtering. If the
number of unicast addresses exceeds 4, then MAC hash filter is used.

Note that both MAC hash filter and MAC exact filter can only be accessed
by PF, VFs can notify PF to set its corresponding MAC filter through the
mailbox mechanism of ENETC. But currently MAC filter is only added for
i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
subsequent patches.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |   2 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 422 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  11 +
 5 files changed, 448 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 9380d3e8ca01..4dba91408e3d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -316,6 +316,8 @@ struct enetc_si {
 	const struct enetc_si_ops *ops;
 
 	struct enetc_mac_filter mac_filter[MADDR_TYPE];
+	struct workqueue_struct *workqueue;
+	struct work_struct rx_mode_task;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 695cb07c74bc..826359004850 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -99,6 +99,14 @@
 #define ENETC4_PSICFGR2(a)		((a) * 0x80 + 0x2018)
 #define  PSICFGR2_NUM_MSIX		GENMASK(5, 0)
 
+/* Port station interface a unicast MAC hash filter register 0/1 */
+#define ENETC4_PSIUMHFR0(a)		((a) * 0x80 + 0x2050)
+#define ENETC4_PSIUMHFR1(a)		((a) * 0x80 + 0x2054)
+
+/* Port station interface a multicast MAC hash filter register 0/1 */
+#define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
+#define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 63001379f0a0..7d1c545f3f56 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -11,6 +11,15 @@
 
 #define ENETC_SI_MAX_RING_NUM	8
 
+#define ENETC_MAC_FILTER_TYPE_UC	BIT(0)
+#define ENETC_MAC_FILTER_TYPE_MC	BIT(1)
+#define ENETC_MAC_FILTER_TYPE_ALL	(ENETC_MAC_FILTER_TYPE_UC | \
+					 ENETC_MAC_FILTER_TYPE_MC)
+
+struct enetc_mac_addr {
+	u8 addr[ETH_ALEN];
+};
+
 static void enetc4_get_port_caps(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -26,6 +35,9 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
 
 	val = enetc_port_rd(hw, ENETC4_PMCAPR);
 	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
+
+	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
+	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
 }
 
 static void enetc4_pf_set_si_primary_mac(struct enetc_hw *hw, int si,
@@ -56,6 +68,341 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
+					 int type, bool en)
+{
+	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+
+	if (type == UC) {
+		if (en)
+			val |= PSIPMMR_SI_MAC_UP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_UP(si);
+	} else { /* Multicast promiscuous mode. */
+		if (en)
+			val |= PSIPMMR_SI_MAC_MP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_MP(si);
+	}
+
+	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
+}
+
+static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
+					     int type, u64 hash)
+{
+	if (type == UC) {
+		enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
+	} else { /* MC */
+		enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
+	}
+}
+
+static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
+{
+	struct enetc_mac_list_entry *entry;
+	struct hlist_node *tmp;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+		hlist_del(&entry->node);
+		kfree(entry);
+	}
+
+	pf->num_mfe = 0;
+
+	mutex_unlock(&pf->mac_list_lock);
+}
+
+static bool enetc_mac_filter_type_check(int type, const u8 *addr)
+{
+	if (type == ENETC_MAC_FILTER_TYPE_UC)
+		return !is_multicast_ether_addr(addr);
+	else if (type == ENETC_MAC_FILTER_TYPE_MC)
+		return is_multicast_ether_addr(addr);
+	else
+		return true;
+}
+
+static struct enetc_mac_list_entry *
+enetc_mac_list_lookup_entry(struct enetc_pf *pf, const unsigned char *addr)
+{
+	struct enetc_mac_list_entry *entry;
+
+	hlist_for_each_entry(entry, &pf->mac_list, node)
+		if (ether_addr_equal(entry->mac, addr))
+			return entry;
+
+	return NULL;
+}
+
+static void enetc_mac_list_add_entry(struct enetc_pf *pf,
+				     struct enetc_mac_list_entry *entry)
+{
+	hlist_add_head(&entry->node, &pf->mac_list);
+}
+
+static void enetc_mac_list_del_entry(struct enetc_mac_list_entry *entry)
+{
+	hlist_del(&entry->node);
+	kfree(entry);
+}
+
+static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
+					       struct enetc_mac_addr *mac,
+					       int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	int i;
+
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (!entry)
+			continue;
+
+		entry->si_bitmap &= ~si_bit;
+		if (entry->si_bitmap)
+			continue;
+
+		enetc_mac_list_del_entry(entry);
+		pf->num_mfe--;
+	}
+}
+
+static bool enetc_mac_list_is_available(struct enetc_pf *pf,
+					struct enetc_mac_addr *mac,
+					int mac_cnt)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct enetc_mac_list_entry *entry;
+	int cur_num_mfe = pf->num_mfe;
+	int i, new_mac_cnt = 0;
+
+	if (mac_cnt > max_num_mfe)
+		return false;
+
+	/* Check MAC filter table whether has enough available entries */
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		for (i = 0; i < mac_cnt; i++) {
+			if (ether_addr_equal(entry->mac, mac[i].addr))
+				break;
+		}
+
+		if (i == mac_cnt)
+			new_mac_cnt++;
+
+		if ((cur_num_mfe + new_mac_cnt) > max_num_mfe)
+			return false;
+	}
+
+	return true;
+}
+
+static int enetc4_pf_add_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
+					     struct enetc_mac_addr *mac,
+					     int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	int i, num_mfe, err = 0;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	if (!enetc_mac_list_is_available(pf, mac, mac_cnt)) {
+		err = -ENOSPC;
+		goto mac_list_unlock;
+	}
+
+	num_mfe = pf->num_mfe;
+	/* Update mac_list */
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (entry) {
+			entry->si_bitmap |= si_bit;
+			continue;
+		}
+
+		entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+		if (unlikely(!entry)) {
+			/* Restore MAC list to the state before the update
+			 * if an error occurs.
+			 */
+			enetc_mac_list_del_matched_entries(pf, si_bit,
+							   mac, i + 1);
+			err = -ENOMEM;
+			goto mac_list_unlock;
+		}
+
+		ether_addr_copy(entry->mac, mac[i].addr);
+		entry->si_bitmap = si_bit;
+		enetc_mac_list_add_entry(pf, entry);
+		pf->num_mfe++;
+	}
+
+	/* Clear MAC filter table */
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+mac_list_unlock:
+	mutex_unlock(&pf->mac_list_lock);
+
+	return err;
+}
+
+static void enetc4_pf_flush_si_mac_exact_filter(struct enetc_pf *pf, int si_id,
+						int mac_type)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	struct hlist_node *tmp;
+	int i, num_mfe;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	num_mfe = pf->num_mfe;
+	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+		if (enetc_mac_filter_type_check(mac_type, entry->mac) &&
+		    entry->si_bitmap & si_bit) {
+			entry->si_bitmap ^= si_bit;
+			if (entry->si_bitmap)
+				continue;
+
+			enetc_mac_list_del_entry(entry);
+			pf->num_mfe--;
+		}
+	}
+
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+	mutex_unlock(&pf->mac_list_lock);
+}
+
+static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int type)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_addr *mac_tbl;
+	struct netdev_hw_addr *ha;
+	u8 si_mac[ETH_ALEN];
+	int mac_cnt = 0;
+	int err;
+
+	mac_tbl = kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
+	if (!mac_tbl)
+		return -ENOMEM;
+
+	enetc_get_primary_mac_addr(&pf->si->hw, si_mac);
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		netdev_for_each_uc_addr(ha, ndev) {
+			if (!is_valid_ether_addr(ha->addr) ||
+			    ether_addr_equal(ha->addr, si_mac))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		netdev_for_each_mc_addr(ha, ndev) {
+			if (!is_multicast_ether_addr(ha->addr))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+	netif_addr_unlock_bh(ndev);
+
+	err = enetc4_pf_add_si_mac_exact_filter(pf, 0, mac_tbl, mac_cnt);
+	kfree(mac_tbl);
+
+	return err;
+
+err_nospace_out:
+	netif_addr_unlock_bh(ndev);
+	kfree(mac_tbl);
+
+	return -ENOSPC;
+}
+
+static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
+{
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_filter *mac_filter;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct enetc_si *si = pf->si;
+	struct netdev_hw_addr *ha;
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		mac_filter = &si->mac_filter[UC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_uc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, UC,
+						 *mac_filter->mac_hash_table);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		mac_filter = &si->mac_filter[MC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_mc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, MC,
+						 *mac_filter->mac_hash_table);
+	}
+	netif_addr_unlock_bh(ndev);
+}
+
+static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
+{
+	/* Currently, the MAC address filter table only has 4 entries, and the
+	 * table is shared by PF and VFs. In the default network configuration,
+	 * the MAC filter will be configured with multiple multicast addresses,
+	 * so it is only suitable for unicast filtering. If the number of unicast
+	 * addresses exceeds the table capacity, the MAC hash filter will be used.
+	 */
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		if (enetc4_pf_set_mac_exact_filter(pf, ENETC_MAC_FILTER_TYPE_UC))
+			/* Fall back to the MAC hash filter */
+			enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC)
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
@@ -71,9 +418,18 @@ static int enetc4_pf_struct_init(struct enetc_si *si)
 
 	enetc4_get_port_caps(pf);
 
+	INIT_HLIST_HEAD(&pf->mac_list);
+	mutex_init(&pf->mac_list_lock);
+
 	return 0;
 }
 
+static void enetc4_pf_struct_free(struct enetc_pf *pf)
+{
+	enetc4_pf_destroy_mac_list(pf);
+	mutex_destroy(&pf->mac_list_lock);
+}
+
 static u32 enetc4_psicfgr0_val_construct(bool is_vf, u32 num_tx_bdr, u32 num_rx_bdr)
 {
 	u32 val;
@@ -305,12 +661,53 @@ static void enetc4_pf_free(struct enetc_pf *pf)
 	enetc4_free_ntmp_priv(pf->si);
 }
 
+static void enetc4_pf_do_set_rx_mode(struct work_struct *work)
+{
+	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
+	struct enetc_pf *pf = enetc_si_priv(si);
+	struct net_device *ndev = si->ndev;
+	struct enetc_hw *hw = &si->hw;
+	bool uc_promisc = false;
+	bool mc_promisc = false;
+	int type = 0;
+
+	if (ndev->flags & IFF_PROMISC) {
+		uc_promisc = true;
+		mc_promisc = true;
+	} else if (ndev->flags & IFF_ALLMULTI) {
+		mc_promisc = true;
+		type = ENETC_MAC_FILTER_TYPE_UC;
+	} else {
+		type = ENETC_MAC_FILTER_TYPE_ALL;
+	}
+
+	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
+	enetc4_pf_set_si_mac_promisc(hw, 0, MC, mc_promisc);
+
+	/* Clear Old MAC filter */
+	enetc4_pf_flush_si_mac_exact_filter(pf, 0, ENETC_MAC_FILTER_TYPE_ALL);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, UC, 0);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, MC, 0);
+
+	/* Set new MAC filter */
+	enetc4_pf_set_mac_filter(pf, type);
+}
+
+static void enetc4_pf_set_rx_mode(struct net_device *ndev)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+
+	queue_work(si->workqueue, &si->rx_mode_task);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
+	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 };
 
 static struct phylink_pcs *
@@ -721,6 +1118,19 @@ static const struct enetc_si_ops enetc4_psi_ops = {
 	.teardown_cbdr = enetc4_teardown_cbdr,
 };
 
+static int enetc4_pf_wq_task_init(struct enetc_si *si)
+{
+	char wq_name[24];
+
+	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
+	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
+	si->workqueue = create_singlethread_workqueue(wq_name);
+	if (!si->workqueue)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -756,9 +1166,13 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 		return err;
 
 	pf = enetc_si_priv(si);
+	err = enetc4_pf_wq_task_init(si);
+	if (err)
+		goto err_wq_task_init;
+
 	err = enetc4_pf_init(pf);
 	if (err)
-		return err;
+		goto err_pf_init;
 
 	enetc_get_si_caps(si);
 
@@ -770,6 +1184,10 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 err_netdev_create:
 	enetc4_pf_free(pf);
+err_pf_init:
+	destroy_workqueue(si->workqueue);
+err_wq_task_init:
+	enetc4_pf_struct_free(pf);
 
 	return err;
 }
@@ -781,6 +1199,8 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
+	destroy_workqueue(si->workqueue);
+	enetc4_pf_struct_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 4098f01479bc..2e676212d230 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -712,6 +712,12 @@ static inline void enetc_load_primary_mac_addr(struct enetc_hw *hw,
 	eth_hw_addr_set(ndev, addr);
 }
 
+static inline void enetc_get_primary_mac_addr(struct enetc_hw *hw, u8 *addr)
+{
+	*(u32 *)addr = __raw_readl(hw->reg + ENETC_SIPMAR0);
+	*(u16 *)(addr + 4) = __raw_readw(hw->reg + ENETC_SIPMAR1);
+}
+
 #define ENETC_SI_INT_IDX	0
 /* base index for Rx/Tx interrupts */
 #define ENETC_BDR_INT_BASE_IDX	1
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 2b9d0f625f01..3b0cb0d8bf48 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -22,6 +22,13 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
+	int mac_filter_num;
+};
+
+struct enetc_mac_list_entry {
+	u8 mac[ETH_ALEN];
+	u16 si_bitmap;
+	struct hlist_node node;
 };
 
 struct enetc_pf;
@@ -57,6 +64,10 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
+
+	struct hlist_head mac_list; /* MAC address filter table */
+	struct mutex mac_list_lock; /* mac_list lock */
+	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
-- 
2.34.1


