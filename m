Return-Path: <linuxppc-dev+bounces-6867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD49A5B8CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjh25fzDz3bqh;
	Tue, 11 Mar 2025 16:56:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::61c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672610;
	cv=pass; b=ahfGE8TXMcxFKIpFQTIdgugay90Lgnn2t2vYM3uYeSPNyNCC2xSaIFeKQpTZuSmHgh56YcWle0RVZZGcsUsi4981RUSouYZYk9xY+GreNN+hYYxOoE7hiAjSdPZLtHUYJ2+dmUQ8T0VKgVg9YM6q6BLF0WmMCZN7emCrR//uwu9LKHSVR7R0YB21zmDLyoCagj5gXjyhMug/c/EszTrZ8QwUZy72KgkI2NItV9L0kK9rme4MkHuS6mNFgjETEwcWuMaw9O1DkANxcH7KBDFnJc1dUlWXrrWzKBcPzv5M/yr5uzxbyBfvCnmR67dkJz+VC3toKYV1T5jpDiN6vvxxbw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672610; c=relaxed/relaxed;
	bh=AylrTYO2MR4KNm8bzxSw2x5eAbwNfA0J4XCmjStMIGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQE63ifVWJboSSZVevfrkX3DnUCY2Xu7zX8K5DjqUzbRCsPZlAuy3qzukp3nuLc0NVn9uHdhDIGTpPL08aVYoQ43FIovJV1AH29buwLk8J0SkVy2rVdyITtaKM53+btmoffLY4eiBbJxXTjtKruDKjrVfnPKoNeZn21RJ+UOKV4y6vtINsDIMHiFRfgSSsG2LjgARk1uKHiOldvY4q6QNoL4Dlz27w7nsZdi8V4+Lu6k7lrrAZEXtdzm5T2y70jcRszYdPX4EA9xLCuwjdpI2VqeAdPGrFJYNZO6+1wjfHnfhil6WXz/f8QOdVdYUFhETpn6F3OdUp+ozGS1V9hpqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WJ1CT9Ui; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::61c; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WJ1CT9Ui;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::61c; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::61c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjh15V8Hz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2asjsz2EcVKtRRJma0I08/7BoVOhnqWHHyHXe/NpFfMrtY3xqOLyk6hEjhojGpC2Xqp4hHIOdGDWuXQ2KsHag0HhsbNBhWudFE94CYIxw16nf0QmYCozeSd6ToFQvCfkC6aa/JgzUGmZXXvfJ2QNyqwNnefjsc0b1llU0pkDeh8PAi9s6tB2b+unyEjIpZgArXow7fSrkxIBelV09QvZn8bzN7U9/noD0qeeNGzc1C/SNhlj5eKR+nhqxULPUz8FW4aR49tuTbfcBLrh5aEVvYEAGzWCCAnOdtwOjBenSGhHwUGE/y6k1+alLASF6bbiyKgOAzpc2rxklfz/paRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AylrTYO2MR4KNm8bzxSw2x5eAbwNfA0J4XCmjStMIGQ=;
 b=GkmbH1w4x6/I3WLnIQVLU5PpbbEXVedRuL4QgltF1vvv+npfbNO87X06AEbemvYmtf5Foj0Fcjwl/8GV3+Wja3NIZDcJEvprUHi3T/GFkwh0ufSEZoUyyjICJQtunfRS8P98DPtSUuHxW6yYM+jyX8yeH1T3BgHUQMNHlIwqhU6XJ6JacohgTB2M9isxRqJBH2YS9zJ+0QYtNktuFTKCaYLSyBQsxHbVJOwKSFEGylZTyeWhD7IxZEZ/cqZAALAXX/mU4tNub+dUNPbHtIPy7tpq7vgxF7doyOkxDclsMLGT7834Z8abZJstZc0lZ9JWFaT3gZbS/WlMD1V8H3uTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AylrTYO2MR4KNm8bzxSw2x5eAbwNfA0J4XCmjStMIGQ=;
 b=WJ1CT9UipYjvUzFw9fjtdu79YvJLxz2Qs6x1QG75nrf9CpbbcCLattQKVn4gxaVvXg7TDv74DaRCYKJnw6B6D8Sg+dqN5Vyl6zrRpttRthAf+7JvvUaTds1uc33ZqutUffWb4qkHJTS7dT83VTZFlgcIvUyJApeWQjKZr1Zzmn6n0Anh2Le8t1vPSvDbZEtzfOmbztcW+N1fVPXzoBCtKkuPl5lJ69HcXMpG68YEr7Ir5GOITfAImiIdbrxGbil2rMyuCagJ/D++Ua/s4P/snG9lRwjicWDVnXF+fd5Jh+Z0A0dIywzA0ZBB7M9Bf5ibobPMXJtSQUI3Y/sdRapWDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:31 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:31 +0000
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
Subject: [PATCH v4 net-next 06/14] net: enetc: add set/get_rss_table() to enetc_si_ops
Date: Tue, 11 Mar 2025 13:38:22 +0800
Message-Id: <20250311053830.1516523-7-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 05f02f98-45bb-41a1-82cc-08dd606178da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j92cAYZHJpsOHPSEqAMWl1Ao9R3pXuVkShLOBt1C5/C19fVhwgoxlpEBk286?=
 =?us-ascii?Q?ZllS4r7+WYubEmb1S8DlWe8uSDV1cGYtZ2P4lK8G4ghsG4+vIB+NOth3ZARP?=
 =?us-ascii?Q?fhZgRoFBlQB5DvjJXedGZRMOL+jVld2QH0zemY98KtBX2y4lIxb3eM9OPVAE?=
 =?us-ascii?Q?i3J1/7DGPYJBDAGsdDcjdqcsic3IIRziJiYfLOZxZCv4Uwx1abhlrZssxvtm?=
 =?us-ascii?Q?jJhmikDI9KBWMxE556wAUJ4xJHm5oBXutPiKEaH+2R7SK6bQcAdyZQPy+0LQ?=
 =?us-ascii?Q?+yhe19f8NFQAtlJBG77AnOr3pgmZUHNgxi6iQlgwMjEHsxG5NZ47gwVICtw4?=
 =?us-ascii?Q?NjD7Vr2t+JQdh5TgqXLisNWiyOhgQbkEVvFvvwcML0K5ahkyhN+i3bjCSio5?=
 =?us-ascii?Q?CNjxRKkCdIMOl91L999rqOIknFXReCzLdiO+I01LyVQg1FdqjIn/BMINQeEh?=
 =?us-ascii?Q?p3PB3WvmogyV+nom3I1gXkbRYlBXxkZcCDnt8xvM1Nal4Lxz6kCX0PqBU1+3?=
 =?us-ascii?Q?5wl/6Q14KXNC85hE+7EY6xexiwQz17j/EIrTARyLfxABDXeS+HfE/p3/AAG5?=
 =?us-ascii?Q?l4OooSH35mo3RgvG3JQ9wg/uEiHo4qhNcDJFRxAW2NLWmzMEjgnxUnEvgLmx?=
 =?us-ascii?Q?LYvrVRSxpkOkWUcDaXA6t/EnXqHRB74dlu/ENHDqr7gw1ouJ5Zw68ZBXWVww?=
 =?us-ascii?Q?Ry+UhGHNHY69mjOetzLimQ4qS9AiGZu4MPUCp9dAS/k6P9d/N1vjAUbwiw0Q?=
 =?us-ascii?Q?JSI95GFme2Hs8vOD/WUBerBDQHizSi5CSz6ndCsX3g1ej/jbFWIfJbpPK2PA?=
 =?us-ascii?Q?+V1Pv10/YJfJ+ap1A+ab5PplcdiTkGqaDx9/toyZcAICl1EwdCVBKikqafQJ?=
 =?us-ascii?Q?DcDcCuy/JwLAu3elc1xHJetCKABmlfr8fUh+RYg0RAa5WC0aOtWlQEBeQr0Q?=
 =?us-ascii?Q?osOxmrtxTu6S4xKoJgfi5si/YP4t8NMhvGe4/JgjM2ccXxO4nYePFU7bOM13?=
 =?us-ascii?Q?JhYST5PWQd6JF34RZfNtiDFd6eUVemkl4Uy9Jp58e7oVrI4MhK/wbPKvStzC?=
 =?us-ascii?Q?hIKsRSfnxkI5wptWsfvoadME2HRTivjWKF2u2dOBUfeJr5pWuoBvIMKyIOz3?=
 =?us-ascii?Q?RddI5g6A71qh6V1FXYObOKVuwkSHKPmiwO38qDcCCvaHtkEmZL6rkR+AbHPx?=
 =?us-ascii?Q?l8pCV8GHClqy2604M9JBs80wGAoai+CL8VDlAkxfzXlJu6vAYncRS5NKzZ32?=
 =?us-ascii?Q?lLVosqtXadL2j0OsoKW462v280ThkUrQc44xeFP0kRv0J0KyGmfb2Jkngnin?=
 =?us-ascii?Q?QfpA8sNfJksWwZUvNmgCX0P9Jvkd2GeEppFmFXP2DDsOW5QS/i12idDXKOIr?=
 =?us-ascii?Q?RGLSQxe/WwxLDat6d40pdGa6GSqf4EGk0cPNHjnoq4559keFRP8NRG72jq0H?=
 =?us-ascii?Q?fV5isL9xOzTCLcQ6pU26pCmiWHZHh2s7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ba8n5jc2a8D2WUHWjTpHZqHUKeGa/XpGDFIswGWNoHZcxvKzUzBVK+CadcM3?=
 =?us-ascii?Q?cXNoZVMKrtqKHwiDajMLjvP+RDLVY3q7e0edwO3M40ijWsldYDRSXdySgcbw?=
 =?us-ascii?Q?KhYp6jENKmp+gVuKJmIcsLyw6SwWKsekB59SGM89//KplWRueq/HqQIbwUib?=
 =?us-ascii?Q?i0z1JCj7a5ocEojEpNFGOE6QOg5PSmr47YFXEt5dC+oGVGR9XLI7QzaSJtoi?=
 =?us-ascii?Q?rXwf9QyR0VlCnhzt/Bds0MdlaKcCA6qcybvdfbFEYLcu66synTO3dlaEh6tx?=
 =?us-ascii?Q?xTykZQ2rLT3a2UNr1d0J2dD/EKHse/LKuAz6V8Z8LuuM1Hkfj1OcpxOKjSzz?=
 =?us-ascii?Q?6Oi5n/OhXD0dmXRVxuFb/PqH/DO75UAJh+mXel4/WOM3hG9WM8PWdy0TfVIf?=
 =?us-ascii?Q?tbgBsf73AsrKavbUZmOxE+jU59NbCLTvOkwUo1vRmWkWADPstNq+53zSGbyi?=
 =?us-ascii?Q?dLx94tBZ4mhUwZ9c4RLHEGXyicKRkgbKrisHazFIlfbBXi/eT0pCd2tCM048?=
 =?us-ascii?Q?4gOZRtkHMWL7XYyCytAcds0tGu5ZskHvWkUsrTJskc+CQFUqTLWpYhNnUTk5?=
 =?us-ascii?Q?6MBaYz8L8Y/ysKshbLGEQ1ZAFB6rqRnZ53BVdGGR6ruE0oSxtv+M1beMC772?=
 =?us-ascii?Q?MriMXU0vGwATVdXgl/soiT0j8F+j0qF0PBlVgZtluvorvIemKn/0CfTMlEsH?=
 =?us-ascii?Q?+YLXOibRQqLEqiY21qxZkSXmfrxtOEdIdvwajHjlFKS3RloRCnMa+piRAEX1?=
 =?us-ascii?Q?MSfWX+s2krt4F5/P3B6WJycv/s7TvQZVY+6KdZ6ihmKXdQ12BH0BqMGDNVp4?=
 =?us-ascii?Q?yaO3p57SDnNZDoH/VUV9k3BUVAhKul7nhsQV2PR4kbTpSY1Rc+kXlLXskMpl?=
 =?us-ascii?Q?MeuvDk7wW1ws/qbg0BrJxjaGMk1rq+R39zJdp3QupYDnUKS/p/MmDsKH8X8+?=
 =?us-ascii?Q?UtYVrSba2Tv62P/3SGxEBf7VhZ4nE+DFswnRXCApNGpvSI794a9h9TIm1piv?=
 =?us-ascii?Q?odOuBUgELl2tBBGni/r2J4292Nt6V++IxZIAD9LoFnVU2wd9WqbsbF+WkUQK?=
 =?us-ascii?Q?3gPB82kf53mTgEL4z1J9roUpEgjKoLTiJi/gbq69QKYU76gUL+8+ISbX1oG3?=
 =?us-ascii?Q?0jPaIq6PKO/22KQk7ClGsuBlqPIegjrZSSxH60iv2W4Ay0RkZNue+RLu1b2c?=
 =?us-ascii?Q?AnQ5s/ftJSLdXrBy0IxYKzQXCJnjTrCZj0NI/UlHaekM1P5fjrK0SGp5Bprf?=
 =?us-ascii?Q?UwoYtdi6TnGjWMWaxR+6qKwNfSxVICcyY105fwrVz4WBYU446/ZDl7oIAuw+?=
 =?us-ascii?Q?eWlSBU0Cx1rRRlecaoVWIWcrQDgFsu7sJdxUdMcgqLAyA8VStj6kLijtgydC?=
 =?us-ascii?Q?it18XeZBDBGcSllbWsr7fUBl8iSK3ObxNnKTEFcl/UC50fDy1nokWiyLLqpe?=
 =?us-ascii?Q?DNuRwSLDQKqDGBNRCXWMkrTD+l7XQ3lJt8Q8PbdTBYmilKrzVp9g/PX/OSwx?=
 =?us-ascii?Q?jC43yDJLH0c/2HTrWI+qbxp0IOrZPQjX45UAmIGYQkOcnqgsqQLWI9hm6V5F?=
 =?us-ascii?Q?z56p86fjlS1cowm/I0psLWuj7Irc2J50ZSVisj+k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f02f98-45bb-41a1-82cc-08dd606178da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:31.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0NuiOsO7tFIaFGKjvP3/hQl2kBVpmIdUb1esqjvN2HUuMZY9cytVVVDzBSMAim2izuaWMxeOv7Q9JDsRtLQCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
different from LS1028A ENETC (v1). In order to reuse some functions
related to the RSS table, so add .get_rss_table() and .set_rss_table()
hooks to enetc_si_ops.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c         |  2 +-
 drivers/net/ethernet/freescale/enetc/enetc.h         |  2 ++
 drivers/net/ethernet/freescale/enetc/enetc_ethtool.c | 12 ++++++------
 drivers/net/ethernet/freescale/enetc/enetc_pf.c      |  2 ++
 drivers/net/ethernet/freescale/enetc/enetc_vf.c      |  2 ++
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 3832d2cd91ba..2a8fa455e96b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2405,7 +2405,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index ca1bc85c0ac9..deda386b20a0 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -290,6 +290,8 @@ struct enetc_si;
 struct enetc_si_ops {
 	int (*setup_cbdr)(struct enetc_si *si);
 	void (*teardown_cbdr)(struct enetc_si *si);
+	int (*get_rss_table)(struct enetc_si *si, u32 *table, int count);
+	int (*set_rss_table)(struct enetc_si *si, const u32 *table, int count);
 };
 
 /* PCI IEP device data */
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index ece3ae28ba82..d14182401d81 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -681,7 +681,8 @@ static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0, i;
 
 	/* return hash function */
@@ -695,8 +696,7 @@ static int enetc_get_rxfh(struct net_device *ndev,
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -715,7 +715,8 @@ static int enetc_set_rxfh(struct net_device *ndev,
 			  struct netlink_ext_ack *extack)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
@@ -724,8 +725,7 @@ static int enetc_set_rxfh(struct net_device *ndev,
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index cc3e52bd3096..097a5b50e448 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -907,6 +907,8 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 static const struct enetc_si_ops enetc_psi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index d7d9a720069b..072e5b40a199 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -165,6 +165,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 static const struct enetc_si_ops enetc_vsi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static int enetc_vf_probe(struct pci_dev *pdev,
-- 
2.34.1


