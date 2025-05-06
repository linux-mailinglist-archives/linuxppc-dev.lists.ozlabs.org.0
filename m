Return-Path: <linuxppc-dev+bounces-8330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B185AABD18
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:27:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBMy0xKbz2ySN;
	Tue,  6 May 2025 18:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520046;
	cv=pass; b=ZLn35+osnFRmnUGv1oEBvj3ElaK05jIHGh7cZCg8fuXXCZ3q6eNtUwQOwQ08uv8t0yQh7F4OEAy6fkzNVJIgDiWzuvrlznlDbgaGjxPc30i/Vq3RcBZKAcm2vkiYyx46x2nYCgaxpiKMf0FQlIH7dwULiM3aC/HNFSZOkZdzgBswwck6OiNPIGnLy1TuKVgtpbaFLlNYVfPwwg4aEizXJf0uA3ZAkoWbq9nS/VjNKg1HQo0sUwd66eUeURJy4pR8M8VVxyudQGudmyEDAmeri+ZulCk9IXt5urUCf4GjgnTjapes5JFqCj/NyfdqvejT3mt0kxPiBtpQ60V37BZzXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520046; c=relaxed/relaxed;
	bh=+gBpKIDF8s3gTyFTU3/+VGNDxvzFVDmBbWS4ZMEcRc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQ/7HsHXHl6zUBdOwdtQMp1rrPdF5hwD/Z1txSpnXighlPG+SyCE8AUT90/ON1Pepqr98IheszTKlV/sKKQV9ADRaLp2RY0CEsqkLOjNQKfA5mBEkiZSkNIr89EIkceWCJ3pRVfNi0g+aHOAArA4PtZTF8m8QnZhJ28RZ0pav0Z5bzhRJg+5gRQ6FOQsNL37A/JsR9Q/Ivv/K5Fc5rPJq4pNus/D82WBpOkc0yGzgdRiUjpnpd07TTEO8yLAfzlvq11WXWSM32F93LyeoS0Urcgl0jyX3zwM86NaRfKqyaIbhHYdaLwlsiyxxInbm+Fo5/xci7c7QRJJ/sSJB59HKg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lYmEVOtp; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lYmEVOtp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBMx1HnBz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASFAmMNuhrnZWboLrLCfhHXeuBSN/U8yWsTQQLS+AbWpW5Vm0Eg1IyoFV1Eui98MxpMUNkXJzLfHA3r8O6k+iPLXwUlfEmxhOiaSf0Q75Zt/hehT1aE0nv8t+JTrTjU5VxkZtrZ5EwMx+VWtTRMruOz2TAyB4cWSGzNiHjQDRxR+2o8oGTbZGu8f0v4Yyc9veiX+c+6L2Z+cQCRr/jrBujUZ8zxwWCL77DfcQlUeudiiUCxXOs/Og2IQ+TvqxeEsPkE/bJL8LhliHlOjXDPlBFo1rAdDQccXM3t7XP391Wy1kCR4aeSz7/kCpOxhZwYpfeste0LvabG0Bs4QuNoXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gBpKIDF8s3gTyFTU3/+VGNDxvzFVDmBbWS4ZMEcRc0=;
 b=qH59x9Uu+OeiZd288q4di6lqysIXq8eLF9GtjmkUuLsj0Tiq+VL6adMlLGiz3aNk+3mSTAyDLTgK8WD4fytJ/EMaUWGCvpn78RFedLbSZOjPpwc087xeKaef1F/qJMqox4Ksv7x3u7TO2C38yFb7ORjvVtHmry7+BWF6CtTktxKMwsIN/IGNSVRwS8E2a8aSJtPR8OBHTQpdk5kcksFwwjKhLVJL8L0BxWc/C3B7FqLF4QRr4qhOCfm3rhwyL9suIBoqEvoP55Ab0569bUP229+CM3Tuwvr4+jynwl9vd0IBLJVjBiyKV996wm+3gN9Gn44SCp1vimrGgD74bb+Tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gBpKIDF8s3gTyFTU3/+VGNDxvzFVDmBbWS4ZMEcRc0=;
 b=lYmEVOtpQL1kjzsbKjIaEkIKeV/3T/IAAKA2C2EkTkgHYu71LTi1bnvg8NaPtK0CcapeOspeWNMxbE4bS6ei+ZxtEtXX2BbRwXIDcoUZOUWDPWes/pe8B9zMT0gmb546bPLdf8XFUSfHCjmdXcwZ6Eq+zhvDhNWKW1NryHduCTGkAK6iB5Oni4QPHOzztRUjAX8/E7/eCAOBq2MvvEPrpTFHL9/G2yddocTWTFgHKqrvSNFowoIfT5PVx5R5QVqV9yZbZvhKkm3mWydA0DjEr+67owE2RqHnxNmKZDfZ4AeKjYVghQcEq3JN+Mw3KBcLdfBUPM4ls2wZHiN6yg6mKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.31; Tue, 6 May
 2025 08:27:01 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:00 +0000
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
Subject: [PATCH v7 net-next 03/14] net: enetc: move generic MAC filtering interfaces to enetc-core
Date: Tue,  6 May 2025 16:07:24 +0800
Message-Id: <20250506080735.3444381-4-wei.fang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|AM8PR04MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 1320252c-a7f6-405f-817d-08dd8c77c58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rAtEM39oEhSWm0WkAkuddBZcUw3JoDoKOfJR24JcGrcjUmtGulFhrjuJkzgm?=
 =?us-ascii?Q?CL/KZ5ExTFgrr0ysWm9hSqNiM4/00TwAuX5cCF5nGuuG9cgnPiStA4CecSzI?=
 =?us-ascii?Q?oVVr50VDsiFCgWMeei79yQYJsf+3Td5Tj4K48P+khK0nRQcVytytLM2cIcu7?=
 =?us-ascii?Q?mi0CSOwyAXTHuJ5JDiHk8YjnZz0onPAez6qw6FFe7fx76dPWWJsvdRQxZlAw?=
 =?us-ascii?Q?/1NWU4lk3ma0WvM641vZLmdsd8J5d70RWGF8HnV0oho2rXW5mnrMJhR3UEeF?=
 =?us-ascii?Q?7clMbbmoXZPgbGCMNTAbHEkmkTBXF8znYMFHvRt7fsaa3NvAhZZhLMP2roEG?=
 =?us-ascii?Q?/v5hCS2G42UGSEcr87KdEcOrlTcaaJSSxV00P5kj0PvedSUuLj0CqajQRHhn?=
 =?us-ascii?Q?9FlF+jKQLKWb80N4R4x9jovNcTvDA2Jya1UVaRkxyHJRGhDofhjAvy2LXlNA?=
 =?us-ascii?Q?DuwapVwHJj6ZsaVCXXBjHcZNrPXoAsLEGhj/0ZG7UVFGEdSn1L6V3E8GtuFi?=
 =?us-ascii?Q?lx9hl6fqwUmhK0KSezrCN/BrIBHMXupN2pRSa8hXhU2faM5sncNA1j6CFkMG?=
 =?us-ascii?Q?vNGE5chx25iz3FbZWVytI5DNLWWV87W0KEVtBGFJDCAXMwFruBkID0KF9SfC?=
 =?us-ascii?Q?24cCBXcgWX/iR6a3/HMaEm6t0findF3UQ3YR2JinzbQ0ouQ1uVeyw3XEIzDl?=
 =?us-ascii?Q?6Guam6x+ql5izLZdZMqAIK1WG9MM/nvtgqHp7AaQlYctmu8m0TjdH8wZEDUG?=
 =?us-ascii?Q?TtjDsmJiOuTkMqK4VuBKm6HtcheWyBZsDk0fgRv1xnQxel6dPh8u8pw3Sp0O?=
 =?us-ascii?Q?y6ozAI5rbeZlaJoiVZ7kr5YaLJ5zYoACMIt8iyynCBMC8piXn5F9eM+mQuU9?=
 =?us-ascii?Q?nAdiQ3k47e4W5ooxCNB1YhU1KIef6z1GiC8jpdVs91FOu8Kflzc5IIsXUmlY?=
 =?us-ascii?Q?Ewb6adeDJfctHcGQnFfNHsvTVqeLYEWRAi5BLT/AMEuG2CxeQVGDlw09uCCj?=
 =?us-ascii?Q?iv3O2z1FvhCO406jlbRteV4VZy7nzdmTVEwV2XmXJK1drbxH4wzjbhWMt60g?=
 =?us-ascii?Q?4AnP5j4cx4g+EZj2JsSmQlCCIdXiPZftgkCgqVzd3hSnfr+Gr7lrmVCmSEkJ?=
 =?us-ascii?Q?XBRb9UGeLUQ40mbkYZEmr1lW9Yj6xcyYgs/5vZ3/l/jIQSwbrzsGmEVgF6t2?=
 =?us-ascii?Q?fikKy71XrtgtgCxs3kBz6wC4J186J3EdgJ9TH/E+EZh0gTJuhgPDiV7AQkHj?=
 =?us-ascii?Q?OyOkcm2WQ/gaJlIyxbFT2aKL7dhSm1wRcLVZHOqT8nMm8mUi4Y5jS15DvHRh?=
 =?us-ascii?Q?WINXpJ4MlvCF8VU2ZBGw1f0PYNwp7FB2q0IhRS0H9nfxo6v1poTfWAXHy9AU?=
 =?us-ascii?Q?bG1PcLCBxuQYtwXB++EIHxlk1B6B8296RgYFVMKXCQfyim0Qn5qrUEqWlSJd?=
 =?us-ascii?Q?DooR/nLGpf7LhtVNLRvRoqTRyF1Kx+K9BlVrP2z3STFlI1yWcsHLBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3+2a8+gknKvpvgIV6J2naW1Ald4M2H0GBlgY6F0BxEJcG6ZGth1gehMsreLS?=
 =?us-ascii?Q?HCQjEU46ID2vpXBOP/XOOP3jMs3zNrPz7+29FbKDen/tEFbfZjyQlRWHvoZw?=
 =?us-ascii?Q?wM73I+Tb0mUif69zfKHY/uyIfg0jsVyrsDFD8LMzL9qzVem65LFw9Z5amb4+?=
 =?us-ascii?Q?CpvvO8IWtnf58kG0ljJ5sRpAMNXuLPAJ6FG5YBCTT9Ctd9Vp2p+WdXc9dKZT?=
 =?us-ascii?Q?i6rBxVUWocZQPJdXJeA5TCGIJIIkSvBt55GzqE9rP7SGmXnO7zIjaqXRZabA?=
 =?us-ascii?Q?72JHSKeO2IWrMOjxhb2vy90a9iCQwcIj2J644ANAKFxo9RUEXpXLfGsNcNVC?=
 =?us-ascii?Q?InwqsAbEzd4GKAZXQ0ihko6Sk/8BdZ2XLRJvFFfCXWPMXvFBS3yPkkHH967e?=
 =?us-ascii?Q?/JGcnP3VlHiIn6oXHUzg1NumJUkIKY/2IB5AuahFPl59bLAU2PXeHOmHc1mb?=
 =?us-ascii?Q?97xwxmkrfYXwPDTDsMstWfHd4pjA1T5xDC7k6mdkZRPS8cVzKJX7XqqhBlY+?=
 =?us-ascii?Q?vB5RnrS57Lm0t8ldt2pzumtqthfVTqSUy6k+ZTmzSoRbpahdrP+yQhFoMStI?=
 =?us-ascii?Q?lO4NRwZc3+UbJ7wCQuUHK/50xvcqI0bApOP+qo60p5bfLq31JdbBrTLU/Wzj?=
 =?us-ascii?Q?ii6QH/MKfSkT6ZReZEsAoYeGJIfbhN1OVxaY0dNlCN5EQB6VOnlvHWy66VAK?=
 =?us-ascii?Q?dFRegO/Xqvw72gAYyzfJ+nJdhi7OqBhXSl4AjVfYexR1Y5f/JCrRAOvAI8dZ?=
 =?us-ascii?Q?EO7GXcLOkn/WDCUGmfhbcoG/gvdTJF9Qn5HUtAwDGLdptdsTphZgwbpbOmSw?=
 =?us-ascii?Q?ak9s6QyijyH8wgApl/9p0ydc6hXfoua4zO7EImu0rptfEwkkc0qG6YQR7UWH?=
 =?us-ascii?Q?VfwYaSEYAvL0OwLt2bQfqfWZoNkGLQWwbyWg41LAnVhiLewLhZhkdKQhUHuY?=
 =?us-ascii?Q?EyrAhjiWILhjeF6PTLbEoX+UCmHJS25bg3OtL0RiEcgAnxZozpNy6Jw7wGuj?=
 =?us-ascii?Q?I0wOCp+No85o8KOVgsjKMT3SS4dubNypxljTyAVAV9iTTeM65b6otUjAYCc5?=
 =?us-ascii?Q?7jOJWkZ1DjamHdHqDEGrQSFqCdvPxr9PKZASsQ6gAjkSMWUjXcYodCgQEdal?=
 =?us-ascii?Q?Al96OkygsyBDhiqOiovG5kiaMbPhNH3sVLg2f3OoNAnamMmXczy11CZfQUuJ?=
 =?us-ascii?Q?4dYqsl+/cOexYn3gPepmGz6+wfKjMX0Iv2KVKjZZfzRirx9rIl+ei9waz1tc?=
 =?us-ascii?Q?PDqUzokV3yUUSChg7Zrg1bQf/PC2CaqJ3NrZCj9MJYv5MNDu5kqBxJTKH1F+?=
 =?us-ascii?Q?Gdj9KclqYXa7iqVehMr6wPsovV3y8lifK2fNa5IgFqDWkrHBPZ/v8uUY3iBw?=
 =?us-ascii?Q?qAV1lbSSYZSvEFhOxM8rn5HpqVEv5bfNwIHV7UNPmsMjUVILtxpSHkE7PVYa?=
 =?us-ascii?Q?2VN0PDtlEpAR7qh12PP714qcjHIprzh+oyUf9vy9ejRfG3oKhyFVDJu4jMWY?=
 =?us-ascii?Q?AzdyYORgsfvMv9RA/Ma4n53JcVU28GpCdT1C3lGRyZKgPYZhg5BQq1r3YoGF?=
 =?us-ascii?Q?hHp5sksm2/hVze8/hmqeNYT/5AD9athE7RTVqJij?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1320252c-a7f6-405f-817d-08dd8c77c58f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:00.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMmNnzEqh0vaZ4E5JduD3ahM6JtfkmyzXcsYliaFJI+1uhdS8zmM+GpiLsn1H9k5xE5hJLoRj0OARcQV+uN4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
support MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 +++++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 15 ++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ------------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 11 ------
 4 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 3ee52f4b1166..5a7af44e4594 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 384e0bded87f..c3ebb32ce50c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -471,6 +483,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..f76403f7aee8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..a8b3c8d14254 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -5,19 +5,8 @@
 #include <linux/phylink.h>
 
 #define ENETC_PF_NUM_RINGS	8
-
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
 #define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
 
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
-- 
2.34.1


