Return-Path: <linuxppc-dev+bounces-8337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9BAABD26
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBNB6yPKz3055;
	Tue,  6 May 2025 18:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520058;
	cv=pass; b=bU9TWdrJvH5CkuRaFNZct7ou54pnjLX/JXwo0P/YBcJi7k+Vslm5cZ9X8O+ZF2/ODZiktpp2qDxhy5xNTWlvbwG+zpglyR2NlQnz5y0a707G201ncD2dzScvF9txSj5eVWZDKp+YnvmuPaZmeW9sF68UPEu8sQFnu4R/h0YEH1EBM+/WSgQ3BFCg3D8cJU4GCAODR0BSoFXvjN4ZqMcQyC8IZintJHDv/hZlg1uKxyo32xLOhXX/ZOg4QFH99B63LMv0g67a/Yf+jRR4pumVQloUtrUJfDCtl3eUqN2u9I3K/wjv/8YYHR15xdOTrsUvWWSies7f+AQAgq0LS0r86A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520058; c=relaxed/relaxed;
	bh=V3aiV1M5jrbl1LGPgkDh/GWvhww1wD0aegl1XN7PM4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OhG2rqtzPkVd2oWPENqUIMuCNtAieTFPbu5nuLrPqr4KrsHwviAPinFXbC5Sj7ISlq+QI3B8/L90N8BiNfEZsPy3ag+Y3mpyQ3F/u/YO93xY76VqKLAkzSPBkKh1it6VdnkpYOrkq0uEg3sbDNZ3tnnZ75gZyorzaD3/DhGKi9vZDbpV0yaPAZ4tZDUcvdpnSs66MHehdqemylr6PyE4Zh6a1V9KXLleAASmPWx0MvK6NsYFSgc7eHC161EYGcrFQttDY/jVBleY8dOrXvQ3UmQ2duKSmU/Q94zPWCFnvzangPYt5secfRJk9WoUIrA8Sh9Ji8zBl9fCsgNUi5JiAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DFOrIm3Y; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DFOrIm3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBNB1PClz305v
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtTl+WA1v+kwHlz/Yr6mTlQbU/80fMtidvjGw2nM0kSHZ+FWuy06roz8hywGKTGwOOjXRuX/Qjp4qZaZPA78/AWVKl/7ZR7w2hO8hZ5XfUmXiu8UIvdIp+/qGy2NsugV3PB77pv08t/2KkN4mLhOPKAv9fyEjBKz5gkNYJIxmQK9xKoO6+/N5aNb32/jx+Trb8wLJkCsv20KFEVGkhR84KMy6lZ0HQCrGhmirfk6Vesx52Pzdwk9vIVqyHyA8fE7lPhb6OxGxmHRD+uf5J6YGgkTk8TX5QtnVXmNW5yDKsr/VbOOWkticaGEU9V8SIU0LpJP9h6nbgj0p79Z950WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3aiV1M5jrbl1LGPgkDh/GWvhww1wD0aegl1XN7PM4I=;
 b=AcoJ4hfymmdSlYcuV3axNOu8STHIEr8iEwOhC3smB++ihx0WL9RHLyJ7vW93C/nlJ6HgTo/gunyKDFQQAaUFMw5CAzzgAMnM0BxEkSJFaXkw44r9WTBFGJelZZbG0N2hDZQYgc+QDqp+lnm2F1PmMrhb1stvHxUb45xb1ppeNpt7aheH0HE37txdBoUFIXz1W194+lHEFvj3Qof4ol6O8s0p6zY/wMgdm64sW/+q0oCYgnnBengXKNhG/EkBLPqP3cZAyDuTCNV+lVuF7H1L6UaycUcBiDZVUv5v8brMEneRpDn9WzDGLRCe0d1sd/Bva6yUEYc64h3UtiPTFn0IdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3aiV1M5jrbl1LGPgkDh/GWvhww1wD0aegl1XN7PM4I=;
 b=DFOrIm3YqJPTsSuErRUBzuAl7nbGxTStSwA/G1JF7PMZPhkA/Uk3w4+3Z1CraKskv6IAq4FhQTJNb+QYN/dZkYHVaR30nSyOvdnmVToSkUE2AsXSUUa27M2qOU9OJHXr4DlEQRMB7sgQIUng0NuDz490Ao4G5JYA6326f5AUkAV4wbz5qpV3/nrbIKmrW70TgzGHcagobYdN9phPf3AUnEUx7Y+LJdK0NRlx+eL1h9dj5W6nWDdWbrpJy3Fm6CVsLK8UeXvSJIcEsaXYOz78v1gdhCXIQ/zELc6jfIhzybosMdRqIoIjCUvR4tHS3NNtzr9R9XuD8ttR73hyY6f/VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:36 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:36 +0000
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
Subject: [PATCH v7 net-next 10/14] net: enetc: enable RSS feature by default
Date: Tue,  6 May 2025 16:07:31 +0800
Message-Id: <20250506080735.3444381-11-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d1cb48a9-ebac-4256-a90e-08dd8c77dae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?icQ0GrNOZytuKkYOgRL3Um+E5vAfRazcnssF4Gg8SO45wsWvJDdBK49k5/y3?=
 =?us-ascii?Q?lNsLOoHpygTzNBvGi7OZLV8mhl9WFLuOrLUc4jXBVS3FKkDkWR6Vxd0WAzF6?=
 =?us-ascii?Q?3mRNWkTKFYrHRJ0i48JXLNt8L6KkF5sCodGysHqSCjPrfwQUDNXXwjeXTmVM?=
 =?us-ascii?Q?SbfqCqkKQtXAUgNsPSu1asj1x2Ay+8lWUFVLYHbd3aHaNFP0jiB4VUtUhKnA?=
 =?us-ascii?Q?WViSqsrjhSHSymHsIyFe8vfX/PrS5UXbPbBPZm9Bz/XVYf7ExVgkg9jNr73p?=
 =?us-ascii?Q?RUlrdVEtuKycDFQGwD2nmyER+d++3yrAQ+U8ibw1Y8z66GyG7YFjl9waZRKl?=
 =?us-ascii?Q?4UHTW1jJn6gZACCh9e3Ra1tVUZixdZfnUA/bcDHgRqO425mc1pSQMehBcoIb?=
 =?us-ascii?Q?4Xr77kpMujEyrflYWvG1EFhVGw96EYpvzExi6apGjOZREuTBa0Sdlzqe4Ixq?=
 =?us-ascii?Q?Y9txmjG0TobzXHqmXCQwM9TuPw/hwYHB6wALB/UTY9PeHKCDKVuav5nXt0yn?=
 =?us-ascii?Q?4Y1gWJpdEXWJ3tQncdD1WE4AtzdObf7d7ExRM2ET+5ajUc1Emxw53sqqlHFw?=
 =?us-ascii?Q?u0I8GHIDFklO2N5dL2UrSti9+IoDNOZIxkCtGzU+kHFs/s9x0nyK05jjrvF7?=
 =?us-ascii?Q?XM4K7z9rfmXfKDG8pgUzbhyFiS8xTxF99MdL+QLyccx/BDrBvuzHs2vZiHJx?=
 =?us-ascii?Q?0j0Wb1QgLHY8uS1vrpvWu/7C9163k9egqz9iaGtL3aT7FXOKldAqGGttXj3h?=
 =?us-ascii?Q?HRIOgJQ6mn4FO7t3v6Oe6j+5PTw8ZslwRvejJmSNAmbW1WRYaD6OPHhMk0jW?=
 =?us-ascii?Q?+Bc0EZCns4cS8sKi6bDZneYAypso0q/LaVDfuoqGT+X5wdchDKPcu81th3wE?=
 =?us-ascii?Q?ZAZbAujq+Bbw/qEUP/dmkms8YX+gl2i+s9flORvZ0Y5fBOVJkTmC69RGLKnr?=
 =?us-ascii?Q?rzWGNKn5uoXqgQfJ/azuodDRHMecHKuHkudehu05Fv/i1j7t0yUkCA1ZfkRZ?=
 =?us-ascii?Q?J6rpItu3JxVEs5jJsIz1Hr6KkiQ/hLnj4HXmvRXB+yz+GrBgJqBI7BQ/dmeU?=
 =?us-ascii?Q?w+zbFyoEoo/VI6BGo94rlHUo+r6tglaYzbJN3+1MrJu/Mm6L4XAqBncQwGg0?=
 =?us-ascii?Q?JG4cwR4t2E8baf4xk7F4oxADpssZ5+XRlJB0tUcHEYMkK4jBjSG0X49CEExS?=
 =?us-ascii?Q?jBzDUBS/I+oXYGENVB19SZGjiVu5QrN8orFEMzJg/7oicydzhuqFs362A2vb?=
 =?us-ascii?Q?FUzIBLyDfHr5ZgxmWEsoQ/yvg9RQX2F57xuvSrZrW7AeuYBDCgMixsWt29OM?=
 =?us-ascii?Q?risW+vY0ahvac8aQP3PrKPhVUoy46XQM2xOUjZJC3xc/0Tr61enlT9tPTGfu?=
 =?us-ascii?Q?j2gPkE9NZv6C/dR+I6WaRbygEUaCq/5Wje+6cDWifDrP4k+bmU4r9zCroIcM?=
 =?us-ascii?Q?xJTgB1oTZtSS95jh9ofW+xgwcj4PtNqMt+Lnkx2R+DJYp9l3RQR7wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JUHcSeyr6NvLEO4UWLpj0zZaSo3TFoGs9ahecjAPIVte9wPh9HuhiKfSDh/1?=
 =?us-ascii?Q?2Vb0LLKRj8dLr75fYquTKj8TKPshvsvGQy15ybgYRKaFxvTk9o/itZx58aro?=
 =?us-ascii?Q?78xpWW2UG86r7nQz6Y6mw0K8eyGbI8U3nFojU4nYsd+BlXNRBdJrFAyq497M?=
 =?us-ascii?Q?c4PwYrJsmm8ih3s+k8GNv9U8/UsN2+9BUG42CgrDCsJwhwil9mq0KBeWZmYY?=
 =?us-ascii?Q?O1xdd6ZEks+3Nq0u6y50I/piwnKQFo3tvrJNbp3WN+mIDNnPMbvNhfJbh5Js?=
 =?us-ascii?Q?l8fcZXGJ07gLK+TBk1P6RhqK9HrNyVYtjiE2A9pv80S31Q0T4QolJcc65r1+?=
 =?us-ascii?Q?EcSlOHOzkt2eSZE2sSBhe4bVQx2bvRUcUEVaPdHylk96w4HnwfZzUl7xOG0p?=
 =?us-ascii?Q?eeOvPRnzZNvRV+OJJHYgysH0QFSVdbdpssQa6n6BeUMTnOxZQDGyDWYWI6dh?=
 =?us-ascii?Q?7v5PfM4EwvG4Vr8ytY78NDfA+0FJXrzNn2QES78ddy7Qd/X+RlFRO8poHKkk?=
 =?us-ascii?Q?DQY4GpBVYp59BVPUX8wuYAAeZMZ9QXBbNN7vvVVgHEEHt7JBC2aPgOepHOcj?=
 =?us-ascii?Q?DAhSM0MTIYf7MflfRWLc7wUCgUw1C930U9h1j04S9fOcBdyPnG5Cdrz+eK8r?=
 =?us-ascii?Q?ZeTmOUIlnk+I4bFzemavgO7wnVxlIPpYTIurTenXSDi1Dx9EPVz6xTKwhQCz?=
 =?us-ascii?Q?f8XHLh3AzP5SLS+9p4S4SsoGnnXBSamV4kupWom4rJWpzvpt39HqynZX0LjN?=
 =?us-ascii?Q?qdmD10ALCrU9mz1HmpSFat6KLFIODWV3RyGmKcsIrzOthERiIsPaTCMbR01E?=
 =?us-ascii?Q?B9smhx7yFCztMxbKX2T2gi0iLApw4PZNeidD0Fhcr130Z5ec8rmFE8Nono7+?=
 =?us-ascii?Q?6MzrPzQiza8N1Zk4KNXtcQz9GWLuOqh161vbglHwLoJSsciVg1hEK23K3SKk?=
 =?us-ascii?Q?10bY0m8xZUFcXxnwNq11QZYv6OGpePpxy5+LlkZ1tNgpcFyKEtxMhnIP8akO?=
 =?us-ascii?Q?DY9PMeVsa/meygY/M5CVTrJyFGeDDhvhC9oVVQPtm4cf6Sp0BEUdzhan2PiO?=
 =?us-ascii?Q?p69SIpUc/HXjpS6XdJ6sguHuXfU+k4UaT4B1Mzjly4UjRnK52VjtfXwJE5//?=
 =?us-ascii?Q?vBLUY1bcLbd4UuuHNnRwqYlZ7h5JssmrWAIImv1iE+d71pwk6p10ow4FAtga?=
 =?us-ascii?Q?o+qj1yaMLK9nW6ip1ADT+FDGpPpynuhKwzeTNy4spLQsgTAPSfG51ObP2U/J?=
 =?us-ascii?Q?ATi0kK8Jji1S/dR/kMJUO1aESbG4QXJMCnUig1tcPhI/qZF32Ek3YkoMMXrv?=
 =?us-ascii?Q?8tV4f08usXigXHT9CXRFXIiG+psy4KPtQyxlW/eHjDHkSljRFgRALbdUCqtV?=
 =?us-ascii?Q?+14yBf7fGNG7WWHFN1yNvkJmMJ3KrhjTCR3KlPry27b7S6F1/5rnC3073i0W?=
 =?us-ascii?Q?p/cEbup8y5dBw9L0iT78tfMorotCns5SZ8tTNRYSxj1CsxtMoJbgM827mIDF?=
 =?us-ascii?Q?uAZ5DyYuuf58/mIxh3ivVAEOb4OFOwVJax7uE8UGLp+bp7/sdqY6B065ENcR?=
 =?us-ascii?Q?kQUXaZyE4FQr6Y9hb0rYMj1WZzucSDldX2XDU9as?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cb48a9-ebac-4256-a90e-08dd8c77dae3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:36.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcOdY+TWNIeWbs4d6wuYf2JwRWUk6i+z3ATsknbxhKs40iTbJWW/hZvEyhYt50dVlqmSm6rPODdrFAl1BKQQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Receive side scaling (RSS) is a network driver technology that enables
the efficient distribution of network receive processing across multiple
CPUs in multiprocessor systems. Therefore, it is better to enable RSS by
default so that the CPU load can be balanced and network performance can
be improved when then network is enabled.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Acked-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 31 ++++++++++---------
 .../freescale/enetc/enetc_pf_common.c         |  4 ++-
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  4 ++-
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index daea85cbf043..7e92dc0a9a49 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2430,6 +2430,20 @@ static void enetc_set_lso_flags_mask(struct enetc_hw *hw)
 	enetc_wr(hw, ENETC4_SILSOSFMR1, 0);
 }
 
+static void enetc_set_rss(struct net_device *ndev, int en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+	u32 reg;
+
+	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
+
+	reg = enetc_rd(hw, ENETC_SIMR);
+	reg &= ~ENETC_SIMR_RSSE;
+	reg |= (en) ? ENETC_SIMR_RSSE : 0;
+	enetc_wr(hw, ENETC_SIMR, reg);
+}
+
 int enetc_configure_si(struct enetc_ndev_priv *priv)
 {
 	struct enetc_si *si = priv->si;
@@ -2450,6 +2464,9 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
+
+		if (priv->ndev->features & NETIF_F_RXHASH)
+			enetc_set_rss(priv->ndev, true);
 	}
 
 	return 0;
@@ -3242,20 +3259,6 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static void enetc_set_rss(struct net_device *ndev, int en)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	u32 reg;
-
-	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
-
-	reg = enetc_rd(hw, ENETC_SIMR);
-	reg &= ~ENETC_SIMR_RSSE;
-	reg |= (en) ? ENETC_SIMR_RSSE : 0;
-	enetc_wr(hw, ENETC_SIMR, reg);
-}
-
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a302477c4de4..a751862a70b1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,8 +128,10 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 4fafe4e18a37..f6aed0a1ad1e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -155,8 +155,10 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	ndev->vlan_features = NETIF_F_SG | NETIF_F_HW_CSUM |
 			      NETIF_F_TSO | NETIF_F_TSO6;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* pick up primary MAC address from SI */
 	enetc_load_primary_mac_addr(&si->hw, ndev);
-- 
2.34.1


