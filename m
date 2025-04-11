Return-Path: <linuxppc-dev+bounces-7604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D1A8594F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0N5Y2bz2xxr;
	Fri, 11 Apr 2025 20:17:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366644;
	cv=pass; b=iLMqC1PCJxZugBmh7FohcbViY6xumA+fqsCogTzPxJp++2mKJMpyayxUjwDMlAurm/ztojWddmeHSIrgSuXG57gAj3wLy3q/4wZS+agdoevzJnO5l924jOHkE4zScc0HYqsLjuYe4DN9v/TafrRtDACD9QHZncbh+eSZxUV4vakK+K+VpXjlFAWLHgNWD1KWCGXtejk3+3MptMz0riHqNm+61nTCLLlW+zKMUhIxRdm/VWoZn3DFnV+pjUEyUGhyWhnTPrNeqqpOVQ8qe5hs3BCtFZLWw1bYHI8DYBiA97PchlGD7lDAiBpWqWisMk1xlGiWW/pdk+Lyxh/bhUh9Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366644; c=relaxed/relaxed;
	bh=d9WL0+AV2BogW3yxQPNXOraeFYikHLIuBh4yYBScqho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZMouiK9FqQVKGhuf1gGeSG94iTiExIV+yIjIkiHlP0t8y1g1YzfgRyTz8CTy3jq+gkbz0PCz4tlPUzQ8OAgr1LPM1UAiPmxGh2H6wQdAVU6Ilp5NOCLigEaBsLHEbmY7Jvp260PuWCUmgk3jQK2Io7KwyyFWcVeFuyE/l3AtstC0cmk4WYAjai7MlmJPeEIUHsHfgeki5idQEmMr8czITfr99P/nYYWXR7HLH24YgM8rgV0B9vRk0eTSyMv1mQswLVJ3o2PLAsq58M2Nhz3TuSNDwtng1ACEDgWzUWvMPB3GEnFFl7YNqV6cfQFTWZ93L9p1mKBc+KEEulf/r/DNsQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=O6A8fbGR; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=O6A8fbGR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0L50q0z3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpFgSP5+qts7pOWc4uSt80XIgewy+Mbr9Q4jATBGofC6YPp9KZXxDXPLGz7RQpilXByaT9Jm5g7iSmdoiLcDeqMiD/fTUGtpywG0ArYZCQZcpT4B/0AAZ2tcw/lGEEszXEmkdsnxs3m1odnHQqF6AnAEl8ZdRxrAXYKMrKWTcVipxpeEQZeodKgrdDjctWoRPVDBtWk4q1OS13tHyfexQR6WCYV0XZMZ6NzUdtrWmmKaqwGvxSyZ/DJKo5FIp+9ZOKzN4uq774VtvI5SSfh2potEFlqDM/hQCU5VSZjVrt7KooOG3plpANwgqa9zzLS64pKuzwEQKxgtPbRKkpV5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9WL0+AV2BogW3yxQPNXOraeFYikHLIuBh4yYBScqho=;
 b=gcjEOXM4hE4jqqV6MIfRubDpqD9uOGzHFo7kLLuBxSLv65nSeKDHWGJVoLZr1AHC5NZrL8uUxPe5iWQCaGXk+lBEwFcALrXd65KSGU2wdHiEJkeGbnwz7UhQU7lWJahuzW6A/n/s7M1dJnwIgntQ9AJXJwUHlCzNYoL/eMXeixdrMKLewz0Qiieznd8KXUpYpmhnbv86NvUx6YEIiOJig0G9zYx3OOVin/s8bYhLu/8Nc1jaPMZYAtdIKH858otPw6udrqjGeQWPYIQBArV9ppA7Es59RM2y7pJd3AWPKgTbbXSeJNy8yVGRG5CtZlrxsfOxbyJb0xzGbt9N4s51Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9WL0+AV2BogW3yxQPNXOraeFYikHLIuBh4yYBScqho=;
 b=O6A8fbGRQShMrWWdsgENmdLFnKc/KEvU4o0zR7CoJy4m86s4/O5jugNlqqqDu2ql2LAXHWPOcSF4IHNBgLT39PIyFBKu1AuhWc8xHrMDK+mUdr/FegV9a3XHCOWT5CG9G1Eyjv5Hq1WeuOt2vQwvAFaInYZRMNKZyr+0aNBbyCxjCZa57GHfxZQxZ86p4yqOm3aNOBncRKdlA03p0HBbljdIgh6h7CPdh9a7KK+/Vi0MJFvQ4YE53EEY/u2AXuoUFWug0wQJxbGqG5osKk0gJuO1yY4B2lWqZCA+vx5LZJbPKCRnhAkxe6FQcSRdKAOlgcXOEnZvzCN0t8fCE2fB7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:03 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:03 +0000
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
Subject: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib driver to support NTMP
Date: Fri, 11 Apr 2025 17:57:39 +0800
Message-Id: <20250411095752.3072696-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AM9PR04MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 30317cbc-03ad-4e2a-0c11-08dd78e200a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ONTZBLQrDKK833C+rn6IlohXH2H2ZXu7ZVrWdeiR0xAXrgxJqUMaKDOovk32?=
 =?us-ascii?Q?JcOQkJPXcJ8/kzoDyMWbpBEI4LPOB69j+aTuHDFaYtXvLp6v8mqAC6AALy21?=
 =?us-ascii?Q?YtKowrMLvdUuWINWYinzy784c+SN3uvXuU4MvugrzLZx21u48TaAQ+oIuQyZ?=
 =?us-ascii?Q?24/Mkse34FZiv+SUwBE0CIwlM4FRKGJDwLrzWkqb9LDjPYUESzvnhiLbNH2X?=
 =?us-ascii?Q?kHh310WrQxuol/VEK14mOvtYr9WrtwWK8c42HIsWgSzEfPQ526ALqwaRsZIm?=
 =?us-ascii?Q?oTMxeIE+80+FNSIgphCbEnNU+xRtc1scJ2eKvfDKFE6evTXHz0thKG/fgf5s?=
 =?us-ascii?Q?4k9LNIi9vG99fOHlU0UCpOckI8H2ALqhWWvCMZMoGCnGcjLA0sYiKzML5XmL?=
 =?us-ascii?Q?bpX3Au3DU7DWnXgQYSMJvSplNxqlw58HBhF+TGbTKaBL6Te9BwiWUq4OhLEJ?=
 =?us-ascii?Q?qY0ybgm0qOiuRqP5IP0bOzHjbOc1L46Uxliu5Ijm/VlvI4+6YykFH9v4E21c?=
 =?us-ascii?Q?HcKm0wIANorj1OJI68iTe5GM08TfL+NeCeeXkJ1JX7REMQvpH5b46TAFTw3F?=
 =?us-ascii?Q?OY7KhgOSg9yN9K6aEiVW1i37ldUrpo6cFssphyaYwJu6DPZYgftRoPAbvdmN?=
 =?us-ascii?Q?fIgCF9Sj4A1vrNjUCtfwM+DB/xFSQIKTecW6dkJ6gdDC/rgiBWOepdS++NWM?=
 =?us-ascii?Q?YyJHM9zY3e1TrZbnHGL7WNIJXsZXcUt5LgPpx1SwuRBjazB332UoO6zQX0ik?=
 =?us-ascii?Q?dpPWFA2qBqFrkOpJV4ky6TanhBhfNn7C2ntp/o/m/8/aK8MvtGYEt+yBf9d7?=
 =?us-ascii?Q?mfFfQxMckczr5Rhum1xCmNgAus7L/w6wZnm1aqHPO4d2k2GdSwlf1ykcklkd?=
 =?us-ascii?Q?85kJEH/7wqyPPHyjJXfpqeL42OKP55CVZhCqaTdrw4ipBsj8sBSQUoVnVp+T?=
 =?us-ascii?Q?ZTqmCMZOwzDTB7tfLhR8QiEZtCvM+BKqY6UWAudb+ItBiORnEfNGV1mhcXTx?=
 =?us-ascii?Q?zN4isE9KOgN7Yjpwxdszgd95i24YvoEqhsoJmQg3z4SDi3GdJbv9ghKGzsq4?=
 =?us-ascii?Q?l8A0LIwBBiPVDM766i55I7B2MPhOOZSRdU2ncSB9LPf+mfHVuY144qoFw8y3?=
 =?us-ascii?Q?Yv/DQG0xFLUU3F6DzcUyKTj9mWiOVAqeyj+/pmQiSH/3wsUYjfKVffSfxOje?=
 =?us-ascii?Q?Io+shI492pi+T4G3w41Z5KOfjWVA9MvYvF70NZ4PKBkhAhFm+996LEZA11m0?=
 =?us-ascii?Q?axmItUoUYlo3Iuu8auU9PNC7FQjBUh9exfgeSHzNtCiZHOmTAuPNj6ivzEZO?=
 =?us-ascii?Q?llwg2j/OFb5I+n4oLyPff8iI6EXkV1JqzTjp5G2VXd8SehCXG9ljB6EXUGh2?=
 =?us-ascii?Q?vNAUh+r1PFrPW3nJtGer5Pw75yvXfyPZLg/Xy1yEpylhwZmOiYOg4Uw56IcW?=
 =?us-ascii?Q?XPFJDFlzq8EGyNfryCUg4nk+eF+p2sSrOc7E07uXvd1c6gBHjdylHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcOZR0wgwoTuP1lt3V8S5CXZPNryrr+2hfffJ/1tOK67AOZPBqwU3ieQDC5q?=
 =?us-ascii?Q?1LdjGSekcHC5C1ULT33xW6S4PS/qCFOX4OjqPm6hetTEveRo8jwPkLHwINKT?=
 =?us-ascii?Q?SgGGEVZrU/zROEE88WYBnS7OSA3NkImLW6JJ1ImXuqKHTxfsqKXKP2ttWoMF?=
 =?us-ascii?Q?irqUJZeIixn5GER11xmIeMgnqhBLAptS1llDxV24XkR5IwwnvV6FYNckbf1M?=
 =?us-ascii?Q?E6fe7fk6CYAN8SrexazWfnhbvdOjy9TjAiMS4kynrLokroMc5Uaxj7ry2oIF?=
 =?us-ascii?Q?k8lx/lg8Ao3MvQxgyrIZQINApUBIHj/1FTBgCIfgFgq+TAPjFcO8Xz5yn+Fn?=
 =?us-ascii?Q?OdB6RTx7/0+yj257mMbe2t0bDqogBoV6bPFwaqcozyVPSi0uYAAiRgg75U9m?=
 =?us-ascii?Q?c5npR2v4nYRncdbC3iw2Uc3NMGkzwyRV4rqbhBATwozO/EFyhJ71U9UwRYQP?=
 =?us-ascii?Q?PQ5TMieHM0qOPV5mliGCEoKSxOWY2YjiSGWam2c63yeEGQsqCMIrz29iL67g?=
 =?us-ascii?Q?Mq7zXMRo4BSq0oGoNVq70es/NxwYe7z3R96K5riDvPtoNETTtRw8fDNAe/5/?=
 =?us-ascii?Q?1lWHFyTjj79a02usyXeuSlZkBRGMiKb0KUSJB9XDI+4ZNmEiVuCKhw+6JQcR?=
 =?us-ascii?Q?lK1A2MHhKYmI2yHZTYuuqGRd2KerTGxsXuTXGipSCmaZ9d8OGzN7397jDaYI?=
 =?us-ascii?Q?1Ls/H3GuHrs6/7Y8V51tEcpjckuCaFxlP/kLqKiYH6Xf9wYWTMzWInmSots/?=
 =?us-ascii?Q?vuVZbJD7TUz34DoYpcsDJHqwg1zfN1iagD6NyU6govc9GNTjnYrfOgu1mBG3?=
 =?us-ascii?Q?t/VGB/fjpqNVCeuFRkCZOnqBJjBh52DgpghfjoIqElUijwMNOO6WVhkY2A2u?=
 =?us-ascii?Q?XddLgO+Svi3hIFaca4BRhDLZDVXbOcUfq/CW/xnSR3XXZ3ULeRq3qUFcdUEK?=
 =?us-ascii?Q?vHV7GtE9rblZapNKW69HaSjUr5XH6tWx/psfo4uHXmYltlYQv7iRTNe0WLWd?=
 =?us-ascii?Q?cj2V3+gOYR8Ec50XMkddgzlmOJ0BUsZNBQIyiZDEPwI+HozPVhkHB43DZzMt?=
 =?us-ascii?Q?iVHYxiHIojTClHwz1dkI2/oc7nZ6uOV/eYYfdGUHVgz67b9Uk9XF/uGbO4aU?=
 =?us-ascii?Q?hHjXILn9ARovsu3YvKi+2PiNpQFyX3bhxoyk90/fNL0W//vns1kTiN3N037L?=
 =?us-ascii?Q?HkDxoOZ67ZwWB57filq9QBv9tM3ahv6Kr8E9Z4eNdOMaavKYxweLfzI+xA+8?=
 =?us-ascii?Q?deMoJiaJ5Rkq16Ejsvl9yqwmOJKR3t73CLl01hZi2fWNeWd+gF28YV6zLNSi?=
 =?us-ascii?Q?bTn1Hqgm3Zab5xsYKBMVaG72EMrJ69+cNOb33U5rHzpSx89im7mRJWGawImF?=
 =?us-ascii?Q?7gfoIsBC8Ik9CQePqOfDsjvHD+vLHHNopO2fFdGb42mKBX9iAqu4L2cwr76+?=
 =?us-ascii?Q?MMk//xyeSiNCwiezIclYThFLPPDoK6oS5nEOx3GKSZMT1b6m2+HlEgwqu+SA?=
 =?us-ascii?Q?CB3wQAEYxNAgM20hzlyhRQR3iB6szQvBcYYZi5/R7I4CVRqusw7fQHyo6Y5h?=
 =?us-ascii?Q?pozgsOtqSoq3Toh6l/4SkMIWw/v9DCIHXUUr8/jm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30317cbc-03ad-4e2a-0c11-08dd78e200a4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:03.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRVPfpVNRCkJuy5aqb+f3UkloRb2FUgkwRIG9rSyXhcHmRrl5LenCzOHUO5bOHRt3bPbYOyBpDRoe+lOCBau2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some NETC functionality is controlled using control messages sent to the
hardware using BD ring interface with 32B descriptor similar to transmit
BD ring used on ENETC. This BD ring interface is referred to as command
BD ring. It is used to configure functionality where the underlying
resources may be shared between different entities or being too large to
configure using direct registers. Therefore, a messaging protocol called
NETC Table Management Protocol (NTMP) is provided for exchanging
configuration and management information between the software and the
hardware using the command BD ring interface.

For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
with LS1028A, because the message formats have been changed. Therefore,
add the netc-lib driver to support NTMP 2.0 to operate various tables.
Note that, only MAC address filter table and RSS table are supported at
the moment. More tables will be supported in subsequent patches.

It is worth mentioning that the purpose of the netc-lib driver is to
provide some NTMP-based generic interfaces for ENETC and NETC Switch
drivers. Currently, it only supports the configurations of some tables.
Interfaces such as tc flower and debugfs will be added in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Add the change of MAINTAINERS to this patch
2. Rename ntmp_fill_request_headr() to ntmp_fill_request_hdr()
3. Split ntmp_rsst_query_or_update_entry() into
ntmp_rsst_query_or_update_entry() and ntmp_rsst_query_entry()
4. Add "ntmp_" prefix to struct cmn_resp_query and cmn_req_data.
5. Remove struct common_resp_nq and netc_dev_type
6. Correct the definition of NTMP_TBL_VER
7. Remove struct netc_cbdrs and rename ntmp_priv to ntmp_user
8. Improve the error log
9. Remove NTMP_NULL_ENTRY_ID check from ntmp_delete_entry_by_id()
10. Remove netc_select_cbdr()
11. Move union netc_cbd from ntmp.h to ntmp_private.h
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 442 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   | 106 +++++
 include/linux/fsl/ntmp.h                      | 126 +++++
 6 files changed, 686 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c5c2e2c1278..2ae3fb3a0297 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9374,6 +9374,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 6c2779047dcd..c8efbb6f2055 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -15,6 +15,13 @@ config NXP_ENETC_PF_COMMON
 
 	  If compiled as module (M), the module name is nxp-enetc-pf-common.
 
+config NXP_NETC_LIB
+	tristate
+	help
+	  This module provides common functionalities for both ENETC and NETC
+	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
+	  flower and debugfs interfaces and so on.
+
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
@@ -40,6 +47,7 @@ config NXP_ENETC4
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
+	select NXP_NETC_LIB
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 6fd27ee4fcd1..707a68e26971 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -6,6 +6,9 @@ fsl-enetc-core-y := enetc.o enetc_cbdr.o enetc_ethtool.o
 obj-$(CONFIG_NXP_ENETC_PF_COMMON) += nxp-enetc-pf-common.o
 nxp-enetc-pf-common-y := enetc_pf_common.o
 
+obj-$(CONFIG_NXP_NETC_LIB) += nxp-netc-lib.o
+nxp-netc-lib-y := ntmp.o
+
 obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
 fsl-enetc-y := enetc_pf.o
 fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
new file mode 100644
index 000000000000..07cf88968d5e
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NETC NTMP (NETC Table Management Protocol) 2.0 Library
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/fsl/netc_global.h>
+#include <linux/iopoll.h>
+
+#include "ntmp_private.h"
+
+#define NETC_CBDR_TIMEOUT		1000 /* us */
+#define NETC_CBDR_MR_EN			BIT(31)
+
+#define NTMP_BASE_ADDR_ALIGN		128
+#define NTMP_DATA_ADDR_ALIGN		32
+
+/* Define NTMP Table ID */
+#define NTMP_MAFT_ID			1
+#define NTMP_RSST_ID			3
+
+/* Generic Update Actions for most tables */
+#define NTMP_GEN_UA_CFGEU		BIT(0)
+#define NTMP_GEN_UA_STSEU		BIT(1)
+
+#define NTMP_ENTRY_ID_SIZE		4
+#define RSST_ENTRY_NUM			64
+#define RSST_STSE_DATA_SIZE(n)		((n) * 8)
+#define RSST_CFGE_DATA_SIZE(n)		(n)
+
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr)
+{
+	size_t size;
+
+	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
+	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
+					     GFP_KERNEL);
+	if (!cbdr->addr_base)
+		return -ENOMEM;
+
+	cbdr->dma_size = size;
+	cbdr->bd_num = cbd_num;
+	cbdr->regs = *regs;
+
+	/* The base address of the Control BD Ring must be 128 bytes aligned */
+	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
+	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
+					  NTMP_BASE_ADDR_ALIGN);
+
+	cbdr->next_to_clean = 0;
+	cbdr->next_to_use = 0;
+	spin_lock_init(&cbdr->ring_lock);
+
+	/* Step 1: Configure the base address of the Control BD Ring */
+	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
+	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
+
+	/* Step 2: Configure the producer index register */
+	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
+
+	/* Step 3: Configure the consumer index register */
+	netc_write(cbdr->regs.cir, cbdr->next_to_use);
+
+	/* Step4: Configure the number of BDs of the Control BD Ring */
+	netc_write(cbdr->regs.lenr, cbdr->bd_num);
+
+	/* Step 5: Enable the Control BD Ring */
+	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(netc_setup_cbdr);
+
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr)
+{
+	/* Disable the Control BD Ring */
+	netc_write(cbdr->regs.mr, 0);
+	dma_free_coherent(dev, cbdr->dma_size, cbdr->addr_base,
+			  cbdr->dma_base);
+	memset(cbdr, 0, sizeof(*cbdr));
+}
+EXPORT_SYMBOL_GPL(netc_teardown_cbdr);
+
+static int netc_get_free_cbd_num(struct netc_cbdr *cbdr)
+{
+	return (cbdr->next_to_clean - cbdr->next_to_use - 1 +
+		cbdr->bd_num) % cbdr->bd_num;
+}
+
+static union netc_cbd *netc_get_cbd(struct netc_cbdr *cbdr, int index)
+{
+	return &((union netc_cbd *)(cbdr->addr_base_align))[index];
+}
+
+static void netc_clean_cbdr(struct netc_cbdr *cbdr)
+{
+	union netc_cbd *cbd;
+	int i;
+
+	i = cbdr->next_to_clean;
+	while (netc_read(cbdr->regs.cir) != i) {
+		cbd = netc_get_cbd(cbdr, i);
+		memset(cbd, 0, sizeof(*cbd));
+		i = (i + 1) % cbdr->bd_num;
+	}
+
+	cbdr->next_to_clean = i;
+}
+
+static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	/* Currently only i.MX95 ENETC is supported, and it only has one
+	 * command BD ring
+	 */
+	cbdr = &user->ring[0];
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!netc_get_free_cbd_num(cbdr)))
+		netc_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = netc_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+	dma_wmb();
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	netc_write(cbdr->regs.pir, i);
+
+	err = read_poll_timeout_atomic(netc_read, val, val == i,
+				       10, NETC_CBDR_TIMEOUT, true,
+				       cbdr->regs.cir);
+	if (unlikely(err))
+		goto cbdr_unlock;
+
+	dma_rmb();
+	/* Get the writeback command BD, because the caller may need
+	 * to check some other fields of the response header.
+	 */
+	*cbd = *cur_cbd;
+
+	/* Check the writeback error status */
+	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
+	if (unlikely(status)) {
+		err = -EIO;
+		dev_err(user->dev, "Command BD error: 0x%04x\n", status);
+	}
+
+	netc_clean_cbdr(cbdr);
+	dma_wmb();
+
+cbdr_unlock:
+	spin_unlock_bh(&cbdr->ring_lock);
+
+	return err;
+}
+
+static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
+{
+	void *buf;
+
+	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+				 &data->dma, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	data->buf = buf;
+	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
+
+	return 0;
+}
+
+static void ntmp_free_data_mem(struct ntmp_dma_buf *data)
+{
+	dma_free_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+			  data->buf, data->dma);
+}
+
+static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
+				  int len, int table_id, int cmd,
+				  int access_method)
+{
+	dma_addr_t dma_align;
+
+	memset(cbd, 0, sizeof(*cbd));
+	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
+	cbd->req_hdr.addr = cpu_to_le64(dma_align);
+	cbd->req_hdr.len = cpu_to_le32(len);
+	cbd->req_hdr.cmd = cmd;
+	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
+						access_method);
+	cbd->req_hdr.table_id = table_id;
+	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
+					     NTMP_HDR_VER2);
+	/* For NTMP version 2.0 or later version */
+	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
+}
+
+static void ntmp_fill_crd(struct ntmp_cmn_req_data *crd, u8 tblv,
+			  u8 qa, u16 ua)
+{
+	crd->update_act = cpu_to_le16(ua);
+	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
+}
+
+static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
+			      u8 qa, u16 ua, u32 entry_id)
+{
+	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
+	rbe->entry_id = cpu_to_le32(entry_id);
+}
+
+static int ntmp_delete_entry_by_id(struct ntmp_user *user, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len;
+	int err;
+
+	data.size = req_len >= resp_len ? req_len : resp_len;
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
+	len = NTMP_LEN(req_len, resp_len);
+	ntmp_fill_request_hdr(&cbd, data.dma, len, tbl_id,
+			      NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Delete table (id: %d) entry failed: %pe",
+			tbl_id, ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct ntmp_user *user, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t dma, bool compare_eid)
+{
+	struct device *dev = user->dev;
+	struct ntmp_cmn_resp_query *resp;
+	int cmd = NTMP_CMD_QUERY;
+	union netc_cbd cbd;
+	u32 entry_id;
+	int err;
+
+	entry_id = le32_to_cpu(req->entry_id);
+	if (le16_to_cpu(req->crd.update_act))
+		cmd = NTMP_CMD_QU;
+
+	/* Request header */
+	ntmp_fill_request_hdr(&cbd, dma, len, tbl_id, cmd, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(dev, "Query table (id: %d) entry failed: %pe\n",
+			tbl_id, ERR_PTR(err));
+		return err;
+	}
+
+	/* For a few tables, the first field of their response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct ntmp_cmn_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(dev, "Table (id: %d) query EID: 0x%x, response EID: 0x%x\n",
+			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct maft_req_add *req;
+	union netc_cbd cbd;
+	int err;
+
+	data.size = sizeof(*req);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set mac address filter table request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = maft->keye;
+	req->cfge = maft->cfge;
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_MAFT_ID, NTMP_CMD_ADD, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Add MAFT entry failed (%pe)\n",
+			ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct maft_resp_query *resp;
+	struct ntmp_req_by_eid *req;
+	int err;
+
+	data.size = sizeof(*resp);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, user->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(user, NTMP_MAFT_ID,
+				     NTMP_LEN(sizeof(*req), data.size),
+				     req, data.dma, true);
+	if (err)
+		goto end;
+
+	resp = (struct maft_resp_query *)req;
+	maft->keye = resp->keye;
+	maft->cfge = resp->cfge;
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
+
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(user, NTMP_MAFT_ID, user->tbl.maft_ver,
+				       entry_id, NTMP_EID_REQ_LEN, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct rsst_req_update *req;
+	union netc_cbd cbd;
+	int err, i;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = struct_size(req, groups, count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.rsst_ver, 0,
+			  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+	for (i = 0; i < count; i++)
+		req->groups[i] = (u8)(table[i]);
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_RSST_ID, NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev,
+			"Update RSS table entry failed (%pe)\n", ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_update_entry);
+
+int ntmp_rsst_query_entry(struct ntmp_user *user, u32 *table, int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err, i;
+	u8 *group;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+		    RSST_CFGE_DATA_SIZE(count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(req, user->tbl.rsst_ver, 0, 0, 0);
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(sizeof(*req), data.size),
+			      NTMP_RSST_ID, NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(user->dev,
+			"Query RSS table entry failed (%pe)\n", ERR_PTR(err));
+		goto end;
+	}
+
+	group = (u8 *)req;
+	group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+	for (i = 0; i < count; i++)
+		table[i] = group[i];
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
new file mode 100644
index 000000000000..039ab9c8fdda
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * NTMP table request and response data buffer formats
+ * Copyright 2025 NXP
+ */
+
+#ifndef __NTMP_PRIVATE_H
+#define __NTMP_PRIVATE_H
+
+#include <linux/fsl/ntmp.h>
+
+#define NTMP_EID_REQ_LEN	8
+
+union netc_cbd {
+	struct {
+		__le64 addr;
+		__le32 len;
+#define NTMP_RESP_LEN		GENMASK(19, 0)
+#define NTMP_REQ_LEN		GENMASK(31, 20)
+#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
+				((resp) & NTMP_RESP_LEN))
+		u8 cmd;
+#define NTMP_CMD_DELETE		BIT(0)
+#define NTMP_CMD_UPDATE		BIT(1)
+#define NTMP_CMD_QUERY		BIT(2)
+#define NTMP_CMD_ADD		BIT(3)
+#define NTMP_CMD_QD		(NTMP_CMD_QUERY | NTMP_CMD_DELETE)
+#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AU		(NTMP_CMD_ADD | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AQ		(NTMP_CMD_ADD | NTMP_CMD_QUERY)
+#define NTMP_CMD_AQU		(NTMP_CMD_AQ | NTMP_CMD_UPDATE)
+		u8 access_method;
+#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
+#define NTMP_AM_ENTRY_ID	0
+#define NTMP_AM_EXACT_KEY	1
+#define NTMP_AM_SEARCH		2
+#define NTMP_AM_TERNARY_KEY	3
+		u8 table_id;
+		u8 ver_cci_rr;
+#define NTMP_HDR_VERSION	GENMASK(5, 0)
+#define NTMP_HDR_VER2		2
+#define NTMP_CCI		BIT(6)
+#define NTMP_RR			BIT(7)
+		__le32 resv[3];
+		__le32 npf;
+#define NTMP_NPF		BIT(15)
+	} req_hdr;	/* NTMP Request Message Header Format */
+
+	struct {
+		__le32 resv0[3];
+		__le16 num_matched;
+		__le16 error_rr;
+#define NTMP_RESP_ERROR		GENMASK(11, 0)
+#define NTMP_RESP_RR		BIT(15)
+		__le32 resv1[4];
+	} resp_hdr; /* NTMP Response Message Header Format */
+};
+
+struct ntmp_dma_buf {
+	struct device *dev;
+	size_t size;
+	void *buf;
+	dma_addr_t dma;
+};
+
+struct ntmp_cmn_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 4)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct ntmp_cmn_resp_query {
+	__le32 entry_id;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct ntmp_cmn_req_data crd;
+	__le32 entry_id;
+};
+
+/* MAC Address Filter Table Request Data Buffer Format of Add action */
+struct maft_req_add {
+	struct ntmp_req_by_eid rbe;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* MAC Address Filter Table Response Data Buffer Format of Query action */
+struct maft_resp_query {
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* RSS Table Request Data Buffer Format of Update action */
+struct rsst_req_update {
+	struct ntmp_req_by_eid rbe;
+	u8 groups[];
+};
+
+#endif
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
new file mode 100644
index 000000000000..c64da8364c39
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+#define NETC_CBDR_BD_NUM		256
+
+struct maft_keye_data {
+	u8 mac_addr[ETH_ALEN];
+	__le16 resv;
+};
+
+struct maft_cfge_data {
+	__le16 si_bitmap;
+	__le16 resv;
+};
+
+struct netc_cbdr_regs {
+	void __iomem *pir;
+	void __iomem *cir;
+	void __iomem *mr;
+
+	void __iomem *bar0;
+	void __iomem *bar1;
+	void __iomem *lenr;
+};
+
+struct netc_tbl_vers {
+	u8 maft_ver;
+	u8 rsst_ver;
+};
+
+struct netc_cbdr {
+	struct netc_cbdr_regs regs;
+
+	int bd_num;
+	int next_to_use;
+	int next_to_clean;
+
+	int dma_size;
+	void *addr_base;
+	void *addr_base_align;
+	dma_addr_t dma_base;
+	dma_addr_t dma_base_align;
+
+	/* Serialize the order of command BD ring */
+	spinlock_t ring_lock;
+};
+
+struct ntmp_user {
+	int cbdr_num;	/* number of control BD ring */
+	int cbdr_size;	/* number of BDs per control BD ring */
+	struct device *dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+struct maft_entry_data {
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr);
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr);
+
+/* NTMP APIs */
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft);
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft);
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id);
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count);
+int ntmp_rsst_query_entry(struct ntmp_user *user,
+			  u32 *table, int count);
+#else
+static inline int netc_setup_cbdr(struct device *dev, int cbd_num,
+				  struct netc_cbdr_regs *regs,
+				  struct netc_cbdr *cbdr)
+{
+	return 0;
+}
+
+static inline void netc_teardown_cbdr(struct device *dev,
+				      struct netc_cbdr *cbdr)
+{
+}
+
+static inline int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+				      struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+					struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_update_entry(struct ntmp_user *user,
+					 const u32 *table, int count)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_entry(struct ntmp_user *user,
+					u32 *table, int count)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


