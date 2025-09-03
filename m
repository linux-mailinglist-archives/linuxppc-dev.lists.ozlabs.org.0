Return-Path: <linuxppc-dev+bounces-11654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3FB41973
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 10:59:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGxPV4XYMz306d;
	Wed,  3 Sep 2025 18:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756889966;
	cv=pass; b=Hh/mK07T7tl3b77kbbZjFfoKKviwqkNb2cfxazUh0xuTMywAVcrcDsqXgQbw7cogmkxZHpJYUJKRFfoH1TZ+NnuJQ3hZnAaWtgKsk/a892c/+odwQEbaLFboSMJkU6gPc8aNO//QhF2gYF+iAkx2gIjyy9YNniuEsy0C6AibJFcvRt5JOlg/yWB8CeSB/XZitVky9NgXknFR94RhN7SoPDeW/DahnmP1hSveFY9mnFU9cOxpCyIRfJyjy8K/6z5LWkPkass1jJz7OiD29ehGxUwqDYq7PWaP8GDGhOzBoQbRMZ9yAWVnonQOZU3DVtoYLKLkXzNg2AGf6JVeeYNcmA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756889966; c=relaxed/relaxed;
	bh=LR0K2Q9gkkva1zn61BcTxtjb8u8eh+jt7CAk8nwP3ko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONQtgMOn0mhwM2c2lCQ5cAOSIvEwHux6kFSsEwuRBiV74rvaTHqx/RQzbGQf5YcY17h72lse8K3pXz/Dj0GvzDZiPGitjDN1dpHtAaylLzsjjdlwTai2X/8ijJ87dAmK4Ez5AJ7v3eSh0kkATB6wFXYIOzKQg4wQp7mnnA+odPWyNksEwIwKdBc3un7KPvwLkhMJJ02aI6ZGGlYvSSSJuckg04/+HcSZio7k9Y3UkHJGIDI71u6fYmhLLbUSdVJ8Ed4y9QBIguBoTKp4aePXS1YijsEkWwq7FaR+Kte0Q/QK69WTt1vvUeum2ohdAwQuOlht6y2BCYU1dL0GxtqXkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h/tS/zQ/; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h/tS/zQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGxPT5k3cz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 18:59:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhAf2zLO3+BkM20ncAVotpobB1t0en73EVt5r7aUF0WtHSKT0POZxac08vcVzVG+yNQXjoFY1hq1zDrrBFxlFXt9LAGCdejPIuCAYjl0g4jYCtIuy3hOlQHToYaJIhDDVFUbEQHfINEFCPeHmz1ER8XNcEioCGlVugFn2Of61nhO+xSt1OBjQJ9oX9lbBhiNcC3Y3ypG70+IupM2yDs/II5NM7eM+WhD6BRrZF8q2UO9WUFINI36cvnPlRbYOST+ju1yrcjtth4IUS/riXtEMn4pcOYsgH1zUF6f1UZ9n5RrUGIz+zCv+dwcvrDchW6pzmGfQ8m9pLw1XAikr1vBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR0K2Q9gkkva1zn61BcTxtjb8u8eh+jt7CAk8nwP3ko=;
 b=XyVHsF3yEnPTX6051W8BgeoIWp47CYGcLUo9hg0PtmOQFP6nnjt96jRmvlMt9GsUTHh6171TnlNGxBPhZSQjgX2Ssa3jUpGp3m7JvRJPRHCHXeu5FPa0roS4CCvWTrbw7OAWI71d7p3FhxGyjl38OuejIo69U37R68uIH/pz3mYpZYHnoG8Fxa/dIl7HOjqXtMzc2TEpd0ERyOebSlTO5qb2ylc+ZZ4xY/oh2fJeGF/5nAnLb09dliQE/GBWMlxqMYMFWNuytXrpjU5/CL+uqZYt0hBaSr09bdwkWC788y6JK0hWD7Yeoh+5hUkpzr5K2Meg/BR5j5W/PuFxgt9b6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR0K2Q9gkkva1zn61BcTxtjb8u8eh+jt7CAk8nwP3ko=;
 b=h/tS/zQ/0WpskPGoGBv/DI3aB1L839/iS5JeFQuQISLqOUJyFdT2BDSC0CEpL87liR1ST22pSp04+T1JKUpPVIHWa/qKIuKnf71N0Xvv+5CqIQfO2jNbWab6Nk1LpVrATDR6MmuKvyEsMGgARW6iKGZq9joQfp1EYE538yQEMyXVHu6kk8kDwWUv89mwwkKhIjKYr2yNML9I7Lqs6e68wRYrlHuwdmTZoy6VyNaaSH9cX/zgIcIXbJABie1q6hfU98Lf4rt6S6HmKtTgOJBlCX9BYg7Yp/pJMFZVh9RNLL2IKCli/IjyxiUufizM2dkxLZGRPhst1E6xcXpLZVj41g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Wed, 3 Sep
 2025 08:58:59 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 08:58:59 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 1/3] ptp: add debugfs interfaces to loop back the periodic output signal
Date: Wed,  3 Sep 2025 16:37:47 +0800
Message-Id: <20250903083749.1388583-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903083749.1388583-1-wei.fang@nxp.com>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c11181-5cfd-4691-bad4-08ddeac81ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CFR8vcn51BNGjYUA5/YfKj5SgWvNwjw9VqdoGLqU4031wueVPVPSBZhFjEke?=
 =?us-ascii?Q?H3fqbz4HRusRjesQqpZi/HhAWUYAkpHKLOMNERFdiBMjaG6/j+eiLFa4c7Lx?=
 =?us-ascii?Q?9Rb0UPBu7J4LZcKncV2aeDZZoAC5sgD0k7qoyNHvJDYZf/FAHfXvZs+Q0pBB?=
 =?us-ascii?Q?mNfBGUPOMB96V+FUGIaO/LVZJQsOFNRWqt13l4vhlcqlc7cT2803WeszrdAG?=
 =?us-ascii?Q?UOGAoZOhve2/in9nbhzSdRMuDRAskINqWtthlWJVuZShbb7Va0CUyjHjjuRS?=
 =?us-ascii?Q?E4pnCLBAEZQhvdqOBkONhtaomMp8XQ6HJFTzblXaAbrjkNvczhAboKgvki5J?=
 =?us-ascii?Q?hFE1b43EY+HjrHG36ZpzBLAajQ71moQGKp0VQpb+uVWnHUDPSjSrNMvXPMiU?=
 =?us-ascii?Q?okXOPZXaN41f6ZCE2D9w9p3+XvWCAkDQ3gc/Pwg/9c9LsjvEVKmb2SJvha9+?=
 =?us-ascii?Q?ic5pfQW478kAvPF/yYA0sxZJhiVFJAIjAr2Rufr9Yv6vComzsVowCRmen2Qc?=
 =?us-ascii?Q?5SjCNWMvnk82J8cOBMQXQ/n/mizExWw0ysrK7Px6MIa+6o8ab5zTQO54mb6J?=
 =?us-ascii?Q?RFgXM1UFOlRI2asMkcdPQRvcnKlSnqKugAUnBRIM0hNvmDtgyHdhdDP8EZ4J?=
 =?us-ascii?Q?Af/ctTQ5KHVCl/ZImJbGdeLq+NTHcnM0hVLcw/7bIX8H18kFD2cTI+QiGRpX?=
 =?us-ascii?Q?CaNl2K1Pxi4m/NYcVip6UOGFdhxIdRyBnV8L3C6FniorhxObw/MtoebqO1QJ?=
 =?us-ascii?Q?506prOBho74GIvqOnK8XUjVwpYz7qh4hT3JcuKB7rDFIfbdB2dtakAMQst3p?=
 =?us-ascii?Q?FrRUjWMEBpI/rVIkSAd+ZNVhes1L822UxHE2aUkilMt8rUoyI7MieR52crNK?=
 =?us-ascii?Q?T/XQNHKT51V7OtcPALippdxbzIvjKl1O00t2nBV3i1BURtbxoUz8MdY6Qnu3?=
 =?us-ascii?Q?S4sDdedAPjOdhPieVfmyxpNdhTG7Ug1sQpWRk13TjWrFoh/Cbh0U/evhw1FE?=
 =?us-ascii?Q?z30avnEtBXs9lwIrRn1669frBn6WN7XyH86OLndzBwWi6vy0LgfBBkKFfAEJ?=
 =?us-ascii?Q?U+vn2QqbZCFwGBR2KiTtnEAuWPQYfd5mZiwPA9JOcRFP1o+DlAZRIcOskKZP?=
 =?us-ascii?Q?KT3bdA8caJ561fr5DsvN/gvcdwkreCVVLxoiV6JF2Jvdyd2eHzM0kp4RiEnN?=
 =?us-ascii?Q?lRbnBUCAj+Ho06SzTIShc6m4Nj+SXVGBqduMPcOO9xAIbikiYpm0Bx14kQV0?=
 =?us-ascii?Q?CNDa1H5KgnNylIZed39f4vabYZ4cxzIrjjX1bAF7vIoiRIDy3Y5iMEbarQj4?=
 =?us-ascii?Q?VTpPRTMN7rOJRNW6lqsH1Lkhf3g6hSOWdYdNLNXgxo82QlLlh+AKVAwp+gMY?=
 =?us-ascii?Q?uaKMCDiIRqPQFa304dy3P6PIyM8woIdQk+IwCx/nMVhEfs0r2s2NI5ED71Pv?=
 =?us-ascii?Q?jr+WJIs78+nY7TkFGAwMECUvBF5LR3QkRIIeZQG6IhY9PbiXdEj7qz7rS9lm?=
 =?us-ascii?Q?gsN/FoYsjR6lM+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rTDQn5EXhaDY4jHoLEkP49Ux3U2Rfkskan2gQ4mVulVr1Zy+cIvcvuJtNWmS?=
 =?us-ascii?Q?bjRZ0MsRmoCfxWu8Mxu92YHTetSC+1tOJzu9WBOrzRY21isnWWqSVSxcxW3r?=
 =?us-ascii?Q?o/qr9QLqMqCprs1qr0AuvRh5FihMBpRuYkQBfgdVTOEb3ld0e59n4jxQ/sU3?=
 =?us-ascii?Q?4KU2tPI1u8k3gTdsstCEY/jy7g7bv9nqxAfIa4vhsqkVaiMvYRRkrqqFzR9c?=
 =?us-ascii?Q?HPegtrkcmwFa78t0bHzDtEYuLj0CoVLYG9DUqVxFhsC6P6KCMsjq/Rk/E1kj?=
 =?us-ascii?Q?EuiLdInCJr8w1HhjP/BnZH4dhANibI7thRdq+j+Qck6BB8FBq0P4AfmRsL/3?=
 =?us-ascii?Q?bWRLgUELA5Ds0p79UWJGEKf2H2QWaahJ9yfhffAdbxcJYgMalxYsiY3cB3Y6?=
 =?us-ascii?Q?JRPbwUar4olLH0+xE3LPOcv7jmi+qCh/NTrgNKkz01j3u86CGlAAWNT7cdMk?=
 =?us-ascii?Q?A6HJR/TP1ZIC9/9MLavw/9f5azmrias8FsNcTqZEPscHpPJaXtQhGfn9MFWw?=
 =?us-ascii?Q?yNSVD+fWmK5H6u3rnBUluFDqrkiGapbHqRz9kOrIr9YYS/aWIjh5MQf1aGsV?=
 =?us-ascii?Q?5k6IL9Vmz074gAgOoYf62G3ELd3V1gJQmoHEYA4mo4c2bzBQce4WcYmFlQb9?=
 =?us-ascii?Q?AYCzi1pJDHhfvze9jjdvreGpervwHNHU/4K20SHkz7jxhykphWuCvfArZLho?=
 =?us-ascii?Q?F6LUvnpCX1bpYsq5ZKeh/bnz+oqZ8NTyTBEIvaHfj+bdahPgcWSbqGbb6JLZ?=
 =?us-ascii?Q?7a0k1x1Hq0KttgSF9tVMh+nItwJPWLmuqsOwVeZTEr66V0jyn0DicLr1jYPi?=
 =?us-ascii?Q?06cfWzDU5O/r5H8w9wonoSVQR6Dm/18eT9Gcwc1gXn5pDkGOLsOm79wpRMCf?=
 =?us-ascii?Q?T48WEN2Nwgd6nwjUoZjzNARLbeKRE2VpjPTEDFVbOJKywZHEJTgwLIR48BsR?=
 =?us-ascii?Q?z4ZVgskW7D1SCqTLVn1W2UUY07QYcbsrk9wBrQHiemyVC1eqiy2yG5biQ2p2?=
 =?us-ascii?Q?UVOefZf9X5OGB/5ilA5JJOAdPKU2pjshrDSXA2nScaO+vTsEdfTe6Od54mks?=
 =?us-ascii?Q?6NqGYOHv0usPENy0+6WD0T2qWdiMWX1PXnvxxwvvMIn6wvM49bF7E30+CG9X?=
 =?us-ascii?Q?L2mOEhaE6r8j3vjPY5niE/FVR4SKEKW8AZ1WIwZGka45xQq5IudyFQftaVJc?=
 =?us-ascii?Q?DM8Jor+5Te+zc2rHiQzWZfi6AtGbFJyEG/8G4+tCtheAOFBIWYy04Q7YzZwB?=
 =?us-ascii?Q?mB/c9sJzXGLtQxcTK9LH0MRcZ5plUQ3aMgn8V2EBDCjR9h6Bduvj9l5lFsCX?=
 =?us-ascii?Q?1qqySNcvpibcA7OlgkvAViMdXSD5DY5FyMVOVp13FuG/37FdVX91oaAgUKwf?=
 =?us-ascii?Q?DqDSdOKD42jMCOL7MECxHLlv9XC1MXQ+E0CoivGvvIeqBGOD4XYbeAgiL9K4?=
 =?us-ascii?Q?lSxdIwHQWcaXJKn4UUqQMhnrVb2vC4iePw73yUU9D0aWkyarC35VSmlHzS3Y?=
 =?us-ascii?Q?xH5QiVhzF9k9qKki98KW6XbHqtunDFVH+91sOVv//eo/mSt8YayJ1At2OaqZ?=
 =?us-ascii?Q?lLm23pGCc76uKFs7SgfeRFfSmamvgx6RRS2Zkmhc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c11181-5cfd-4691-bad4-08ddeac81ebc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:58:58.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtTbAYIj0Sxz7ejPKNJgAVx7xp8B1guJuqoZPmyXyG4nEK1T7rHpPgbzrJ+WpgZeg3K9iJT0eDMarwFc8XDpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For some PTP devices, they have the capability to loop back the periodic
output signal for debugging, such as the ptp_qoriq device. So add the
generic interfaces to set the periodic output signal loopback, rather
than each vendor having a different implementation.

Show how many channels support the periodic output signal loopback:
$ cat /sys/kernel/debug/ptp<N>/n_perout_loopback

Enable the loopback of the periodic output signal of channel X:
$ echo <X> 1 > /sys/kernel/debug/ptp<N>/perout_loopback

Disable the loopback of the periodic output signal of channel X:
$ echo <X> 0 > /sys/kernel/debug/ptp<N>/perout_loopback

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_clock.c          | 66 ++++++++++++++++++++++++++++++++
 include/linux/ptp_clock_kernel.h | 10 +++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 5739a57958c7..e4a5658e82b3 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -248,6 +248,66 @@ static void ptp_aux_kworker(struct kthread_work *work)
 		kthread_queue_delayed_work(ptp->kworker, &ptp->aux_work, delay);
 }
 
+static ssize_t ptp_n_perout_loopback_read(struct file *filep,
+					  char __user *buffer,
+					  size_t count, loff_t *pos)
+{
+	struct ptp_clock *ptp = filep->private_data;
+	char buf[12] = {};
+
+	snprintf(buf, sizeof(buf), "%d\n", ptp->info->n_per_lp);
+
+	return simple_read_from_buffer(buffer, count, pos, buf, strlen(buf));
+}
+
+static const struct file_operations ptp_n_perout_loopback_fops = {
+	.owner	= THIS_MODULE,
+	.open	= simple_open,
+	.read	= ptp_n_perout_loopback_read,
+};
+
+static ssize_t ptp_perout_loopback_write(struct file *filep,
+					 const char __user *buffer,
+					 size_t count, loff_t *ppos)
+{
+	struct ptp_clock *ptp = filep->private_data;
+	struct ptp_clock_info *ops = ptp->info;
+	int len, cnt, enable, err;
+	unsigned int index;
+	char buf[32] = {};
+
+	if (*ppos || !count)
+		return -EINVAL;
+
+	if (count >= sizeof(buf))
+		return -ENOSPC;
+
+	len = simple_write_to_buffer(buf, sizeof(buf) - 1,
+				     ppos, buffer, count);
+	if (len < 0)
+		return len;
+
+	buf[len] = '\0';
+	cnt = sscanf(buf, "%u %d", &index, &enable);
+	if (cnt != 2)
+		return -EINVAL;
+
+	if (index >= ops->n_per_lp)
+		return -EINVAL;
+
+	err = ops->perout_loopback(ops, index, enable ? 1 : 0);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static const struct file_operations ptp_perout_loopback_ops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.write	 = ptp_perout_loopback_write,
+};
+
 /* public interface */
 
 struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
@@ -389,6 +449,12 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 	/* Debugfs initialization */
 	snprintf(debugfsname, sizeof(debugfsname), "ptp%d", ptp->index);
 	ptp->debugfs_root = debugfs_create_dir(debugfsname, NULL);
+	if (info->n_per_lp > 0 && info->perout_loopback) {
+		debugfs_create_file("n_perout_loopback", 0400, ptp->debugfs_root,
+				    ptp, &ptp_n_perout_loopback_fops);
+		debugfs_create_file("perout_loopback", 0200, ptp->debugfs_root,
+				    ptp, &ptp_perout_loopback_ops);
+	}
 
 	return ptp;
 
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 7dd7951b23d5..884364596dd3 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -67,6 +67,8 @@ struct ptp_system_timestamp {
  * @n_ext_ts:  The number of external time stamp channels.
  * @n_per_out: The number of programmable periodic signals.
  * @n_pins:    The number of programmable pins.
+ * @n_per_lp:  The number of channels that support loopback the periodic
+ *             output signal.
  * @pps:       Indicates whether the clock supports a PPS callback.
  *
  * @supported_perout_flags:  The set of flags the driver supports for the
@@ -175,6 +177,11 @@ struct ptp_system_timestamp {
  *                scheduling time (>=0) or negative value in case further
  *                scheduling is not required.
  *
+ * @perout_loopback: Request driver to enable or disable the periodic output
+ *                   signal loopback.
+ *                   parameter index: index of the periodic output signal channel.
+ *                   parameter on: caller passes one to enable or zero to disable.
+ *
  * Drivers should embed their ptp_clock_info within a private
  * structure, obtaining a reference to it using container_of().
  *
@@ -189,6 +196,7 @@ struct ptp_clock_info {
 	int n_ext_ts;
 	int n_per_out;
 	int n_pins;
+	int n_per_lp;
 	int pps;
 	unsigned int supported_perout_flags;
 	unsigned int supported_extts_flags;
@@ -213,6 +221,8 @@ struct ptp_clock_info {
 	int (*verify)(struct ptp_clock_info *ptp, unsigned int pin,
 		      enum ptp_pin_function func, unsigned int chan);
 	long (*do_aux_work)(struct ptp_clock_info *ptp);
+	int (*perout_loopback)(struct ptp_clock_info *ptp, unsigned int index,
+			       int on);
 };
 
 struct ptp_clock;
-- 
2.34.1


