Return-Path: <linuxppc-dev+bounces-5125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D8A0B15C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0s6Zrsz3cTf;
	Mon, 13 Jan 2025 19:40:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757613;
	cv=pass; b=WDcXk937vyeFJrZhXfJPT8PstAJCVURdDaYln/kj2fJxUn7rev8RVFu35xoebdr2a68PvPof4s2bx1xFbf2TdZ7tosdnRgt1nhVWe6z0gN2kKxeZ+CY58bdhZky6j0PAZLYWVY8R3Qd0fHQOywvva8B8rle9OsGbFLSl9EpIdagS2GATy9ZHwAGkBk9kFlrHxqzf15RVmgRyMtUvkQmXNauoNebKPyYAm/PbqFuqNEbYbGPn/zAZHGT89BNn5NxezjrPw/REIpHjTr1oU+XcHwI8xVmU0VmhnJjQZqoKFDcOFNm+2OoOSrnTw7zWabEQoOz9opxojJntVAKDkLX87g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757613; c=relaxed/relaxed;
	bh=gufufgmfMDI/EnXpi/q9kUrmVXBBbXjiDBPWdPt7l+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6dud7AIttam6kFd2RQn7gkW6QKJIEgI8fs6tNm5/XEzeVchiH1Uwlf/z6ckFRXGHArLyLyIlgg9cmXR/AM+AkDjyHrbAqIOOyVUEY2GTNCpq5dEIVo2aaaVmmTAQ84+xMNRMF9X+24ety6BKuISIC67ibaFPGbfUZU9XwwIe176dxMad82tBkm4dx2laH8Msj7Bc/eJ4AsnEIfzuy07yh2C2lmg1Sa5eXOhef8XMm5KVsJ9NcmrpxLXdM/eDrxnK5seGS6Cmu1fDhmFFpn1M9WYbOKIotYLaW2mpTFyW4LGw8XENrZ4gPLjDNKw9kQMQeKsVN5FhYsz0Z9qh/rC5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=neXCroFx; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=neXCroFx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0r72PZz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnGJWVrsjvgRVgtAP2riC0sKUdHgbvfd+UI/BMkfn8NGo8gASPMdcr8mi/SLpRfPuvIoRqR5zHd7NcM7Mo5nNVNnBP7yg8pvFa0L1wHm8pRQ3GPSLfznB8Dkdt7aoiugbE65v0+5x2t2QlgHrBAfrtQih7zlvwpXvG5mYlBSz91+ZVw0/e+nWLQiGYfL/8i+UMVSplMVUPP4loNeibNVYH8cUtSCpWIwyge1adKHLIzZ5xkj/KQVN96AYCSqio8WR7Kra1V625rqQkzjPO2V+3DZucxhBAeVXoNG6J/kcET27CRjTOUgp8eeErqzsrmP9eZMbk1mb6g5f3LHsOtImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gufufgmfMDI/EnXpi/q9kUrmVXBBbXjiDBPWdPt7l+k=;
 b=buMsK9veshSUICrVPlOHH8v8/dQYvvbdkgCWWpLIJEm0AH1SHVEcPyxfa7d4brvTLSO5zho/BydZul8CY1/sbxrfIltWIbFIx2EEsrdGcPrXqXHemFxHBfTXQ5f/eLXIwOEe/5S9/uMUk7uwWDFLIlTYKxyczZ/I7+0XwwOKdPphwssL4T05ZSh0gF38XsKG0IsXyDbLekpQeblcCfjq/Vq6+CPCEHVr3XOyqyNlKGlMcqRCFciOZS1g5cTVJ7RtD7IyKXxR/Js43QeUDJYKfN+vPQ+GqzJUVE6RfV0fjb536mcVrdTeaJmKIpYcTgayu0pW6Vcfrntpth8tlWMhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gufufgmfMDI/EnXpi/q9kUrmVXBBbXjiDBPWdPt7l+k=;
 b=neXCroFxO2UVeYPn5FriVTEJ4DUdpy0Nc0TWnZgolJ/m2wBx9DYprKgtyTzdIseVtIRMKNcJzy1aE9gYmUvVp+ZD5aKKiLm065mxQ/2mJEchexwFm+DW9OmxVQSMPk0klUH1ceaOB88TPu18cvbnl5c6WZz6Fj7NsSC73QBAfrg8DQI3dcZErIdn9eqK2p0969MvQByIf58OPk7CLIJj4CFH3xoVRQD4oAj4zxoKWsXUzChLP40n/EH4Dnhuyp3Y1cyzRjN3oCTkd8BOYRxLYyww27GYCgBcqKeutFY5dB1IyuS5ZY5C/h6T8dvX2SraL275FThaYT4v/hNADBJPFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:08 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:08 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 05/13] net: enetc: add debugfs interface to dump MAC filter
Date: Mon, 13 Jan 2025 16:22:37 +0800
Message-Id: <20250113082245.2332775-6-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: c15f828d-5862-4e9f-6ccd-08dd33ade293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MTGzW3h4zi+vypM/83rXRZ2FH+vnUZhWj42x7m6+R0TChFlr3zQ/V/le+v3G?=
 =?us-ascii?Q?ZbEByMBWEnLMGZ5FiIu7+ubWcnplPNwn6n17htwR7Z9nIwG5mfehIT2k9duh?=
 =?us-ascii?Q?DteEiIbe2WpGQEsNlMBcp4ft6i9Sz2BAgXqXO9s4zxfAKaD2laWJXa0uDGSS?=
 =?us-ascii?Q?oVHg7JMKF3l8qsmLKjZDjLAMKstV8yECGJJQ2+6oQXYEW5ITwf2ZCginlX1w?=
 =?us-ascii?Q?i9c4lzfNNvsmPfTER+OqAzZsf71JfRGd7PO2Gks3GfWzSlxf1bZejMdmZwLC?=
 =?us-ascii?Q?Q6gRgee+kR/VRp0UwQI2tVQl1MzyVIrO5hT2b8wyCzJoEAcski1gxPi+SxGd?=
 =?us-ascii?Q?9KeJb3vfrrztWxx+6g+RDG59UH1TfnjQbIWjxVRnVCtLUiZJiEZhV9MLzm0u?=
 =?us-ascii?Q?fRAkyowlZRHkIJN1mWPwp4NEpZDFMLYduLAvZT1C/MfkfzJRdPQk6mXf8BBL?=
 =?us-ascii?Q?rBxspGXvFtiVH4GGkpvEcRw6UrvMQH6+mNvMS0IioKlF9G/mBLpBxS3tVHb7?=
 =?us-ascii?Q?jmdNn4r5mU9KH1k0xZ2Bi/N3jU4v8SdqLzAUjDgQ9XhCmdSWz+XYQnwdgjKg?=
 =?us-ascii?Q?0ifptM154uv8SkzcgYF3AhhIgYKKv8CqqYKcYDXbLIODYBjcyesEW3XiscZC?=
 =?us-ascii?Q?3grEZEfLrzGADAZDxIL1qYYusiqY0bdURm2w2ElpUCsBN2Njt0V8zXfqU/Yi?=
 =?us-ascii?Q?SxcuPKmmAjGg/YDcSZqDT8h/+VUkoiPblZO048KMXy68r5tAdqYYZ4Me2Mao?=
 =?us-ascii?Q?sUk0SPWC+KPrOF+vM6D/Abrt9/wHp0apuALZpsgJw/zxNFw/QCHmeFEzzSj9?=
 =?us-ascii?Q?knoPWOli/e4T95EpwCzZK6cb7QfFMYKWBA1NjwWFDTbJZ+IRDxt6FKaw6bDQ?=
 =?us-ascii?Q?sVPakPehlrhnp5JVE/s7iOMOKy3QWfNBmGaSQVYT7/chq2WsHUGXWzaLuHjg?=
 =?us-ascii?Q?Mcnj2pMvong95mRoOXBmn9IJdir3iMTzDZpwPJeHcltivhJzf3HPjzL9lkN4?=
 =?us-ascii?Q?XQgRfYD95bfhzzJGdeU5BgN8IAjjUksIfhAAp75RPYid9FmSE7Bf43PM/f9I?=
 =?us-ascii?Q?4b6THkAbwgxU8Wro6WI+b8jZ0aWhUyMcBxg8E4Uvr4b8k8BP95ur8k1H7CDJ?=
 =?us-ascii?Q?Qv/c44/SftRECvPuNV9nFBc3+MqBAO4gp2H+Nlmkk8iO52NTP6NoijKKaux+?=
 =?us-ascii?Q?Y7RzE+uv/KIPh4MYkoYY3oqPjaLdqKWH6tCkh6X4jRu9YI9+CSPWYw45tZ6c?=
 =?us-ascii?Q?X6WA29UgQhCOUfv1YPZG3NnDjRGJy0OlqI12X/g0U7jracIqd+pqSCvGE59X?=
 =?us-ascii?Q?RMtHHy+DtLnhTEEWBbnOn5HycPeFGVEXgaRb/4faJEDN8xrM7SuPNzRgs0pq?=
 =?us-ascii?Q?GbcpOblnrQETTg29UjI89D7/areYybbjdLsg3hw7+6sgJd/4AAAF7CwnLkQs?=
 =?us-ascii?Q?iA+5/sqeTeCxuBuucsfMaxj2e0o8fpmC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5uAEbXP1M8Va6oxMB7qca9visRqrTMSOcCI6rzOu3oTjib6BF6QE96kI4dM8?=
 =?us-ascii?Q?DMdGtiCnXKnMC7y3KxgjxlmMxcG/6XCkXaHD0zVN471QcJBmhPoYp9wjYoKH?=
 =?us-ascii?Q?IM2eFHtV1mAon1DcJ/8t3NVXYedl3MKsmlkJRZ26jq0R/SHZN1KhIjkPReJx?=
 =?us-ascii?Q?QAeyFW/FGqKBNFWiG0ctyKiw6+WWUQ8oiaffn2/l8xdpsu44hDuphj8hekiV?=
 =?us-ascii?Q?/rFJNUAYE5IHQu6hSMT6nyS0Vr+DR2vwx9TV7+ps4NY3EyTN7a1WWrw9L6g1?=
 =?us-ascii?Q?q3O6k2T4KaxyQQ5R+i5Le5wvKul/Rn7NzW8jeyNzEQf8sUQu9fOgyMR4iqMk?=
 =?us-ascii?Q?I2OoaJ08vkmHaQyt1hB9zyHkgUhYbVl/cPHTqzE4YhzE7q9M8qso1YBNvg4l?=
 =?us-ascii?Q?wTcAHelsmEVC/Sm8AO23npVdx30Zw6gZ1mncDseK9GhQFkixIBHVqOdC5Biv?=
 =?us-ascii?Q?Tu13tvQRhf7FwyBGzUfsFbPCURUTUR9XdZkUtFngs2vUrzlbz5AFwgkmod1v?=
 =?us-ascii?Q?6u4CBxChl8qendYoLXoHVKQGXfIbcZE8i3MuOk903zexKLozpnV/YaMzCOGW?=
 =?us-ascii?Q?feY6PbpV0TaaAQXu2G1mUp/8oSfu9lm6ZEPrc1URutJ/iB5z8eljK6Jb45RL?=
 =?us-ascii?Q?TDxq5mGPZ61r+8zmOulz31HAVqmOY5F2QeXMuW2Tt06g5hkv5vHnQ/p+Cgsf?=
 =?us-ascii?Q?uKOs78cewc7B2BRQ7qNf9GZmd/4PSeRt+za350bFZSqoKLK3YdozKZvXNz8Z?=
 =?us-ascii?Q?L5YpxOg0lTIMPSIpkUkW1mZSo7Pdc9i1FUpubAii+aeHp6gnBhk83jxVjJ5M?=
 =?us-ascii?Q?lIX1BMFTGo5Qbwqe5LzMKl5eZh9WvEaQGMuoLsBkc+CqlABpKJ5E/c4sKa8w?=
 =?us-ascii?Q?x/i+4ioKO4J0/0UW3veSbsDy55fSGXzFyIYpqSND91GB2WrNo1o+tIAHSqGP?=
 =?us-ascii?Q?fj0oLyEPUs9JgAcEQJZ/75Nk5qeyyLKHcH2sLZic3aMXXZlxetr6jlYoxDeg?=
 =?us-ascii?Q?OUbn30FGm0SnvfYVJKzl/hwJa44DMFbxNtniyJG0VuBqtzEKRgOVLIecx6YL?=
 =?us-ascii?Q?WUjVn//OCzw7MQ7C18OLtSoabZNgCtScjlmUwR8mhLMmadv/Q3Y3O7pr1cZh?=
 =?us-ascii?Q?M6qGCuh0f7vaRGHmxNcY2xNAI+XDvzVDMbyeMv+qMEwjnpgS3ToZfK5Gw0QT?=
 =?us-ascii?Q?F/ROQNkV6DvRVcVUTHmUw4cpfVABq7D6qT4MQwX9cN+pKDr89NKjW3Rra2Sv?=
 =?us-ascii?Q?PVxLwIwTJHu5KJYak1Xpff5sgDoRVa7QeR7WCLxaeDmpDmKqEeFDvWXqBAam?=
 =?us-ascii?Q?JaKu1qPjU5VlW8I95muzx1d+5ni8ngcwSuEsNAcyyrwksn8PGPy5n0Qbudx4?=
 =?us-ascii?Q?zoFFko5ftLkL8utpcj+IxF4iMZVdKXVw51R/HoD1p8icmWSImOeis9SkSEUg?=
 =?us-ascii?Q?+ZXZmLlrnnwmMCO9xVQMHE1GiWgZHUpJ6i8UO/HFC7a2q/uVPllU6Gp5/cy/?=
 =?us-ascii?Q?GCYj6LxwmirUVJkRFAxtfrFnzGQgLKqIxxXpSyszE/2gH3LHFhOyazR/Wgm2?=
 =?us-ascii?Q?kIzyst+dRQrOXkGb1XRiEIgAonBktJxajwkotKKB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15f828d-5862-4e9f-6ccd-08dd33ade293
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:08.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw/al412JLBQ5eYGzwIjDxI74vAKjnC6NyhXZNwhcWZxJYJex0h1cWTT3II8zdg4KmI7Tb08EE0AzRqJs3DAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ENETC's MAC filter consists of hash MAC filter and exact MAC filter. Hash
MAC filter is a 64-entry hash table consisting of two 32-bit registers.
Exact MAC filter is implemented by configuring MAC address filter table
through command BD ring. The table is stored in ENETC's internal memory
and needs to be read through command BD ring. In order to facilitate
debugging, added a debugfs interface to get the relevant information
about MAC filter.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/Makefile |  1 +
 drivers/net/ethernet/freescale/enetc/enetc.h  |  1 +
 .../ethernet/freescale/enetc/enetc4_debugfs.c | 93 +++++++++++++++++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h | 20 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  4 +
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h

diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 707a68e26971..f1c5ad45fd76 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -16,6 +16,7 @@ fsl-enetc-$(CONFIG_FSL_ENETC_QOS) += enetc_qos.o
 
 obj-$(CONFIG_NXP_ENETC4) += nxp-enetc4.o
 nxp-enetc4-y := enetc4_pf.o
+nxp-enetc4-$(CONFIG_DEBUG_FS) += enetc4_debugfs.o
 
 obj-$(CONFIG_FSL_ENETC_VF) += fsl-enetc-vf.o
 fsl-enetc-vf-y := enetc_vf.o
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4dba91408e3d..ca1bc85c0ac9 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -318,6 +318,7 @@ struct enetc_si {
 	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
+	struct dentry *debugfs_root;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
new file mode 100644
index 000000000000..3a660c80344a
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+
+#include "enetc_pf.h"
+#include "enetc4_debugfs.h"
+
+#define is_en(x)	(x) ? "Enabled" : "Disabled"
+
+static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	u32 hash_h, hash_l;
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
+	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
+	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+}
+
+static int enetc_mac_filter_show(struct seq_file *s, void *data)
+{
+	struct maft_entry_data maft_data;
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	struct maft_keye_data *keye;
+	struct enetc_pf *pf;
+	int i, err, num_si;
+	u32 val;
+
+	pf = enetc_si_priv(si);
+	num_si = pf->caps.num_vsi + 1;
+
+	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+	for (i = 0; i < num_si; i++) {
+		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n",
+			   i, is_en(PSIPMMR_SI_MAC_UP(i) & val));
+		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n",
+			   i, is_en(PSIPMMR_SI_MAC_MP(i) & val));
+	}
+
+	/* MAC hash filter table */
+	for (i = 0; i < num_si; i++)
+		enetc_show_si_mac_hash_filter(s, i);
+
+	if (!pf->num_mfe)
+		return 0;
+
+	/* MAC address filter table */
+	seq_puts(s, "Show MAC address filter table\n");
+	for (i = 0; i < pf->num_mfe; i++) {
+		memset(&maft_data, 0, sizeof(maft_data));
+		err = ntmp_maft_query_entry(&si->ntmp.cbdrs, i, &maft_data);
+		if (err)
+			return err;
+
+		keye = &maft_data.keye;
+		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
+			   keye->mac_addr, le16_to_cpu(maft_data.cfge.si_bitmap));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
+
+void enetc_create_debugfs(struct enetc_si *si)
+{
+	struct net_device *ndev = si->ndev;
+	struct dentry *root;
+
+	root = debugfs_create_dir(netdev_name(ndev), NULL);
+	if (IS_ERR(root))
+		return;
+
+	si->debugfs_root = root;
+
+	debugfs_create_file("mac_filter", 0444, root, si, &enetc_mac_filter_fops);
+}
+
+void enetc_remove_debugfs(struct enetc_si *si)
+{
+	debugfs_remove_recursive(si->debugfs_root);
+	si->debugfs_root = NULL;
+}
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
new file mode 100644
index 000000000000..96caca35f79d
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+
+#ifndef __ENETC4_DEBUGFS_H
+#define __ENETC4_DEBUGFS_H
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void enetc_create_debugfs(struct enetc_si *si);
+void enetc_remove_debugfs(struct enetc_si *si);
+#else
+static inline void enetc_create_debugfs(struct enetc_si *si)
+{
+}
+
+static inline void enetc_remove_debugfs(struct enetc_si *si)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 7e69c9be36a8..798c69e83c8f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -8,6 +8,7 @@
 #include <linux/unaligned.h>
 
 #include "enetc_pf_common.h"
+#include "enetc4_debugfs.h"
 
 #define ENETC_SI_MAX_RING_NUM	8
 
@@ -1169,6 +1170,8 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 	if (err)
 		goto err_netdev_create;
 
+	enetc_create_debugfs(si);
+
 	return 0;
 
 err_netdev_create:
@@ -1186,6 +1189,7 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 	struct enetc_si *si = pci_get_drvdata(pdev);
 	struct enetc_pf *pf = enetc_si_priv(si);
 
+	enetc_remove_debugfs(si);
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
 	destroy_workqueue(si->workqueue);
-- 
2.34.1


