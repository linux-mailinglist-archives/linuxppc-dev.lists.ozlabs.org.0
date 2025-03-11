Return-Path: <linuxppc-dev+bounces-6864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEBA5B8BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgZ64lbz3bn8;
	Tue, 11 Mar 2025 16:56:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672586;
	cv=pass; b=ZM+avwi9L8FpjEeVKOfL8VbzzuC826UcSd18WEHObNP613j+4IUj8L44Tv9kPizTq2XqMpfXNrr12wkUlEdVrR5/ngmR2nczQzAfkdE7mZ57CUwJARmCLVBxA5FsiQcLl6oUAmagojU8HERaWY25cU80+w3/vUv6wyhAneV+JQ1H0rSnuTOUwfzKrajaX+WytktBY/cYfXU5/Rai8FYklO+WgM/Huq/WrFPIuuDlu0sJfFTQtB6zUCqFC/kwxLOtNGv/rNWvNobhEhijS0PVgV+o8D0MrO8EqOWlp08YXFwk7DuInzDtKi9+Mn4d1cN/TGr5eBt7YJqAHkZZqfe+MA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672586; c=relaxed/relaxed;
	bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eNPWcUiRmly63FIqjRmTpA6i7SbbFWhT9HhDeCsX4YqRfjogmCw4KG+BF0ve7nQHtDhIimLpXizdQiKt+tcu/7tto8Cdm6k/OjA8OhHhZkouww0uN+O7OAI9QyDxBsC+MA1UpZvxfYALadjBPFwJiT0HmMfZxFmGWXHCl7EtFsEgKLTinq5Nzpwua1ZDRKlIgDUdmVqRgtmITu8HzBl7K2BeHq+qfx3yYjUROhS6qrwDPMO5Zap9TKA/OPTuSaxfc9eo56Hfyv4ypqdbzxmOdOVtGPK4b1k2Ttkf4rn63hSATNzJ21N1u4ntAKL1HBLwnYImgdP736BRsNZrppl94A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JI/zETZM; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JI/zETZM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgY4w7lz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7Uf5gQo34Bxh+m/mPhKhgZDRjl4KnopO2RcVGb2CK0hhDzpaMuiLVirXTdxyLHXO+qsv3ojJG3/+9WHjsdey+E93gZsQtfG/EICMTqwm0sOE29mxSsl93AkByWTJ68rQDmx3qqYQ0z1H+K48wLgnfWG9VGWwr0WDbFM8uC7D2RKrw1TwWitaRgQ/0arDGmecPMcVRD5swSshdpxnl+s6KwxLu+epZEhi6uW1WSrNFy+kaqQl++PJAg0Iff4Z4vvULLXRZKAUK0Ewkr77A5KkJJH4qAxmPj0Uydd8hIeuMg5TxCDJdjDZCPnB7r5RkPyBSrgPwm7BmOd0XD7e853Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
 b=ohCcKjCwBYUuiX4G9gyM/LPb9tHIu4Lqgqb0oVu+D/VuSa6BmmefdRvcfK93DIuIAaZ7n0ZAw00jahQmqLWw7FGfnRQ45GR/DzHO4zyThnrScU9+nfsC1MPSCpHCKhOu39W4qAUTrmS8ETsv3x00n46SdOim1XsqdTnvRo9nyFLavRiWFoWjsR/XQp1w7agELnX/g3vow171gH2yXYZKCusmzbDhyPkD6VHd5Ksi2sgYvF32yIo1d6p2+WX9JI9aiMIL3hKor/wHZprOTOINZ+6vJJQ9paZRxDZtNaqo6ByewlzQKx07IdlWyLBVxUo8dnzILBRCjzNjT7Ody5Hf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6NCk0/fRUssINj2yqGY7VahHSG9G3UMOJV47aDiwfI=;
 b=JI/zETZM8jJf8o5N3WGavFQ8flphuN1+rv+cLDJ+GiAewmqa1tA/tUrepWH1JGcvViZ0aGBoEf0y8khlkjcpB/KnSZSB78xmFMxmwHV3C9MZDj+I3I2bkcPLtF0wuziqK67vaYj1HSQberrfj6peYgUz72Yh1nXXIfXLNbs61YTjJ3yIMtYiD1RK4aOVfXU6JDYHMA2U156W7/zM7pnK+osygGyyKFdul0g43GDOb4Er8kDFnJI1WWWvw0G0XO/6ub6MGpkemlr9xvSJ9KWrZAMRMThpP/bHMRAHGrGsF+Q3tvssww5ePMEbmtabe+tT+DeqJgInNeBZmozhBmn41w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:18 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:18 +0000
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
Subject: [PATCH v4 net-next 03/14] net: enetc: move generic MAC filterng interfaces to enetc-core
Date: Tue, 11 Mar 2025 13:38:19 +0800
Message-Id: <20250311053830.1516523-4-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e612cf46-30e9-4768-d18a-08dd606170fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PdACvZwHaY3cWDrI5CDxUvdWqROUuSoXhNqDdOhZFV12Q+Q1FlO1va9H527j?=
 =?us-ascii?Q?LYOZP3Suz017Oem17WZvK/9VGpPb0uuUEfjDqsWZuQ5U1du/gQbvmfGlY2g8?=
 =?us-ascii?Q?vvRaTen6NgOmdqrRP5aBtiRgBbXFvSrsLn/+XLL+ojd+jtcZN43lBtxOKKsd?=
 =?us-ascii?Q?KBkx9s6HbOQ2FiWtbXNhghLM1fzBrGCr7OdgJtSmjguGachsKFKQRPxllC0Z?=
 =?us-ascii?Q?6V3tUrZtMv54NwBm3B5pXbFKinM6cJR3LguMFStG5XbvQXQV3eolp3DGycAR?=
 =?us-ascii?Q?rntFNLoJWq6TrI6P+S6VgbKuESLob8MpQSegJmq2inkVfj0Y6722Jzvzobdp?=
 =?us-ascii?Q?vytKIcQl3sb+VTKaNgctQ9VYnh99Z5iob8KUW8Sn6Yxs4ASaYFPOYukon67Z?=
 =?us-ascii?Q?nwmHDx5QqleKv7aSCeDzsipnWjPdTcZ4pTDNpWM+7aSka+ff81ISc7ZeRnAf?=
 =?us-ascii?Q?G0vH3UsWzk3RQGk3gDSY+kGe9VPwfhqtcQ93upEacjDDM5BuD48ooMWgQGvR?=
 =?us-ascii?Q?w/8Auh8eMX1UvpbJAWoyzaoCbN+PcZ7J6rwjdejutFYzuPj3t6RwKVnbuBgv?=
 =?us-ascii?Q?Oc2l1G1WqkJ1zlLjRpewAlpVbwf0JeT6wBQ9NdvpQZ7ipBS4basQ3c1tTC6y?=
 =?us-ascii?Q?Ixn6RehrjykL/ouzTOv17i4x4PKO+hX3csho2ph086CvSWHRMqmzMxHgfGf5?=
 =?us-ascii?Q?V/BqzTbbxyQzQm2hGYIhNBhHYIOoahgA5icKqd4mm6ltEoU19/jJm5rkP2fo?=
 =?us-ascii?Q?lPKIMUNTsbTetrvV+xtN3l9DydzizaBg3pigs/14Q7dR0PaI61psguTf2dSc?=
 =?us-ascii?Q?IPfjlUInqwHJqDude83mvTsK38aP5mgHrdG4NejJnZCQs5uLjYxrHdOgqUAt?=
 =?us-ascii?Q?mLJhxj/VsHyDAP9IzEe9dFnay3wIictqEjP4UfL5YeL1bIjiPg/LWzMjzPto?=
 =?us-ascii?Q?VPpE2fCbdtmWlErg66xOVnOsRvOMaXX4jzA1MmnG+vRY/UJZZaaz3Ah03mDd?=
 =?us-ascii?Q?lypzJ/crl1D5vEhtqWdRF3e2HAO/JEmAIbAh6Br8bmAl11ClwZQDI8G5lxty?=
 =?us-ascii?Q?RRPH8UEzkjw59zs5AT1d3JTnWorpRDQu5drL0TLWrCCOx7UriehxRWOn90Cz?=
 =?us-ascii?Q?HEEYyXtU8hP/RP6G3IKwI4NdKP54OAPt/m33CImXYZ+lB+Hayjx+0Hft7su6?=
 =?us-ascii?Q?IiDHKSc6Q6+s+iTZJA7z7qkgbvMCWVRHDQg++z+bFTEPM4jYWu4O48QGxsIf?=
 =?us-ascii?Q?L/4v4N/vxvn1u5K0OnvLxj4Ykaj6KKzVwWnNOicElgE8m1F13jZN7ApArC94?=
 =?us-ascii?Q?4Y2mDeO7TVajM5aukYwLOUQoaOx8Ml6kJQ5iHAuIBhub0lG7hr3aEF95xuGO?=
 =?us-ascii?Q?U6NgsOEOxJxaKqxBI4IDbAf4jXq27R3kT1W/6VXNgkxO5J3SBNiQV+7C+Eqz?=
 =?us-ascii?Q?WIFvONfwZWKLb6xWK+T4gy2vVFNqPHNR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8yqYjcbwF6fmvEMEZechgNb8pfjgT18JlzxmDqhwd1hIsytc5caJ/S1W79sE?=
 =?us-ascii?Q?nx2JvLSuHxM0eHR+v963GjwsMFTkDZZY1O2XOgPzZmgD6Q3pbgwW0M9CVfnI?=
 =?us-ascii?Q?d0o5FdHc7bpM5MoAtGcOS0Wu/j1DkOBIfx4IkADOaD7e6jvu3c7B8+v2dW7Z?=
 =?us-ascii?Q?PEZIVs0MU+HG4L8tmP0qi3sykrEoAU/x3s2RmoKiZytSyn3Y7BlbcPGdLIXt?=
 =?us-ascii?Q?KKGwitnbSN9/j7qRVaUYEzhpWMcGMD8/pjL6edgdPiKiHuAi+SqEMZhZHzqW?=
 =?us-ascii?Q?/rccJjwqZynTCMsQmmovBmv0o7fKKNBNaCfnBIemLvrNjrpcGx4JcvP78VoH?=
 =?us-ascii?Q?XpnmBWjV4BQ3AUgBdM5wCl/i6eCjBMbL109PMzvZic1J8FRJWTxuK8NA9Y+Z?=
 =?us-ascii?Q?EPG1Fi7H7hpBJ7sgvHfezvcSKzTge7u7VDhzXuVGSXhjZYSyQFAsHh3RhZgE?=
 =?us-ascii?Q?bXWhuTPa9q4cKW/xQ1X8qxND6KmZO2JX3rvdeSFlgTlLL3owHrcwNIqG7ja1?=
 =?us-ascii?Q?iZcDGgnSIPB2t+uitCiJqSMFFBzkkHm8D4PApLOikxBz4V3oPpg9Y8itrz7C?=
 =?us-ascii?Q?84cf1YAJSAis/ORp0rwxSVIVJ3r+GDPEkZHvPqcCAA8slVnjCv0OzZmT/dJn?=
 =?us-ascii?Q?bVejkN1AjLSOt0LO6brx2oFswoTCFpe8+8emKtMSTkw/uwBGCs0OYUf3YUIx?=
 =?us-ascii?Q?wbLPQpfW2ZMTfNiwxKiTrmzmV9sFkS1fR+PlaPmi9N7z5fudbXu6ru0KhgcS?=
 =?us-ascii?Q?A/pDetItntyPvgNNZ/acFWmuOmiBdZXcbzLNw83BS1F0Fb0DnHPTSqMtU0ZE?=
 =?us-ascii?Q?RnE36x25MaoGmB+BZf96cIzWiKD/CXnEFwhIKH6ZnH9vaBkckzGVRmFOvN6w?=
 =?us-ascii?Q?TBjaOGW5fNo7gO5OpAiGCqz8HD1+EDnviJoNazYPhWJgp3uuZhB3cIz7lho7?=
 =?us-ascii?Q?HUsxmFBwAE68NXeNioAL7erMad0Zm5TE0GMXEVyiY3rr8TIKqPoqG05QaQnK?=
 =?us-ascii?Q?VSRCSyqS5/vUeRjpFMlBVVV7e5d0hV/vK5F7sTG0HbowYG3sKJwDU1qw+K57?=
 =?us-ascii?Q?hKd4FYRlxeuaW7kI8oMb7JypOiuI9F1a4l4C0f9+Bm3K0ACKHp3W3GXCVs+q?=
 =?us-ascii?Q?H7ZQ9lqWJB/3ENYarErdnsicQEEfQKyxFCywi7Dm1KlQVozV66juUMcdJL1/?=
 =?us-ascii?Q?TBGw+X4F6//vE3fFm/mNwETaHbHhmD2HzpejZ1pOh2UgAx4rO/XmiCDZDSaD?=
 =?us-ascii?Q?w/4L1xA2bI5mPk25n39ITYqks41XODSQWvEuqWRq2YWxcgAFn0wqMFZBjOzt?=
 =?us-ascii?Q?/shDWNCSCD35CEznQXzKPJ0jiDN+sopEfVTcqr3Etez6vGLJRWTmIoVz8M/Y?=
 =?us-ascii?Q?+FlUYZWaiwbGRlIVTA1C7ebjjBVpSlzDJksfYdheqCo96RXXTCpmgM6uqMAn?=
 =?us-ascii?Q?2b5ELcRINzw73f6zGyH3NOC4pCMjp2KZOc247DWMpKFy4cZnpmxwIHuhDZV3?=
 =?us-ascii?Q?wE+6jz1sPo5YPYKs1/HCFAkzXal4taYDAVhc6+XP8A+XqnYOE4hvj6Kekfsy?=
 =?us-ascii?Q?R7xZqMQBee6frgTodioQ0ZOBwMHWrRYtVhOYwmIr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e612cf46-30e9-4768-d18a-08dd606170fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:18.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kl/WX1lvFj6Zrnbg1UsPewbAYqZZPXltP1/93XWL5q5D627rULohwMHO4i43BA5rgJRHPl3P1ULdkoNF3Xvo0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. At the same time, the struct enetc_mac_filter is
moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 ++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 17 +++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 49 +++----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 14 ------
 4 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 2106861463e4..3832d2cd91ba 100644
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
index 4ff0957e69be..9380d3e8ca01 100644
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
@@ -302,6 +314,8 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 };
 
 #define ENETC_SI_ALIGN	32
@@ -484,6 +498,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index a214749a4af6..cc3e52bd3096 100644
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
@@ -145,10 +111,9 @@ static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int type,
 	}
 }
 
-static void enetc_sync_mac_filters(struct enetc_pf *pf)
+static void enetc_sync_mac_filters(struct enetc_si *si)
 {
-	struct enetc_mac_filter *f = pf->mac_filter;
-	struct enetc_si *si = pf->si;
+	struct enetc_mac_filter *f = si->mac_filter;
 	int i, pos;
 
 	pos = EMETC_MAC_ADDR_FILT_RES;
@@ -192,10 +157,10 @@ static void enetc_sync_mac_filters(struct enetc_pf *pf)
 static void enetc_pf_set_rx_mode(struct net_device *ndev)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	struct enetc_hw *hw = &priv->si->hw;
 	bool uprom = false, mprom = false;
 	struct enetc_mac_filter *filter;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	struct netdev_hw_addr *ha;
 	u32 psipmr = 0;
 	bool em;
@@ -214,7 +179,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	/* first 2 filter entries belong to PF */
 	if (!uprom) {
 		/* Update unicast filters */
-		filter = &pf->mac_filter[UC];
+		filter = &si->mac_filter[UC];
 		enetc_reset_mac_addr_filter(filter);
 
 		em = (netdev_uc_count(ndev) == 1);
@@ -230,7 +195,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!mprom) {
 		/* Update multicast filters */
-		filter = &pf->mac_filter[MC];
+		filter = &si->mac_filter[MC];
 		enetc_reset_mac_addr_filter(filter);
 
 		netdev_for_each_mc_addr(ha, ndev) {
@@ -243,7 +208,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!uprom || !mprom)
 		/* update PF entries */
-		enetc_sync_mac_filters(pf);
+		enetc_sync_mac_filters(si);
 
 	psipmr |= enetc_port_rd(hw, ENETC_PSIPMR) &
 		  ~(ENETC_PSIPMR_SET_UP(0) | ENETC_PSIPMR_SET_MP(0));
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..2b9d0f625f01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,18 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
-#define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
-
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
@@ -52,8 +40,6 @@ struct enetc_pf {
 	int total_vfs; /* max number of VFs, set for PF at probe */
 	struct enetc_vf_state *vf_state;
 
-	struct enetc_mac_filter mac_filter[ENETC_MAX_NUM_MAC_FLT];
-
 	struct enetc_msg_swbd rxmsg[ENETC_MAX_NUM_VFS];
 	struct work_struct msg_task;
 	char msg_int_name[ENETC_INT_NAME_MAX];
-- 
2.34.1


