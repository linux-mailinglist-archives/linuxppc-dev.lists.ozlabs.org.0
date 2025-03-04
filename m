Return-Path: <linuxppc-dev+bounces-6668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 030BCA4D4FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJ90Kr1z3bmJ;
	Tue,  4 Mar 2025 18:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741073992;
	cv=pass; b=N8VMAX95NxC4M6kBGe3Ep668BnTNLOL654JlLB0QJhB9Ly3KqQdyPk011KmOlqrSqgOr7XSzpHw5/kSB2ZnCqcSw55TIhN532q1xjAPVjpWCikoYpRsf4v68XytmYkT2SSlThfTLQudM9vS42yyHLphsioOOCPv6CiUC/r4W/mPIDOVsqLohIz7chlyiU84NZHMVEp9KlS5Aq+jNyipNXYWj3t50mWg/owDzhLzfMoLbJ8+FsAPFZp7UKJI097jlig6m6loSIeK+bgdu9inWIj9pyt4gh1H4rqRsMVxRFSMseOkhL66Qn8LHmOflGRB2bUZtogCf2luH6lhc4/wGIw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741073992; c=relaxed/relaxed;
	bh=PnemyJ7KWf35aRNaj0RkOMuzMFubZpbJcQIDrPEgHl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZaBeZnRSo1vsOoCphQ+7Iac7t3M7ZGPAbvNf4u9OOECvdYBa4zGr2or4XnCDm4d6C098S+3QEI4s7ah7sBkmFWNq6NhR0l9MzAxdF1g6AgZGdym6n+5unuYgZWtQma6529+/N10ggVD+USQmbuTl+N0wbSsuOuHfJK7MRSaAFEa4E8WUn+w1zVR927uoOyeVrEOUtK9roPcducvlPZXzIF3VaFovBvOBrD/oq66m4ffDTTJWT+Xj4+EvVkCF/NwD/32cZCJfuxVviMSF/2JrzdMRGemwNwDJwX/wmSqLL1m/iHH2XMokqEpjvqWWIS1B4AbWjacFHvg642KQaR6/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nEKoaJPu; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nEKoaJPu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJ817wzz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:39:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H72EYRPEunH0Ff8n/IWKkEHpXqW5TvCNVC5DBlpBsw/n93oIoDZcF82Kn45/lyeo7OCAKp1br7pjKKF0LGE+5wu+ddi1Kmjn2IU/EnziY0aFI85ZGEDLJGkG49mUjVV7kANzS4KHsfqovcUvaX8er/B1vTFdKs3juzJhrNP6Dy9R07g+pQ2/e1leKK4gqQ20NqJAontUHS3hBCrE9xW8o+6/gbb8BWNnVbrG6Q5hAPSo9f4x79l81DmcPpu/EwXti/1S/2mz+M9sJlBvMCg8A03Z5fWMgkjaqqbLlGNRnsbkyMvxqkdjsWUZ0omIKTqOzao2Jt3BhBjyS2AMZl56kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnemyJ7KWf35aRNaj0RkOMuzMFubZpbJcQIDrPEgHl0=;
 b=Mm7uFYlRaDENOmr9UfUL6u6L3jrV6ahsxanWa7XSrs5SIokQhe3u5BHBL3Ak+myMqz4W1jPQCodfeq53BGCASmWxfh1j+/8ysD+XNnZ8E176rUJHJJlLBe9nG6WJgZioQ5olr8luJN90Howkpzp04ZuB9KdhlFn8/1s1h3csukeomd2mQebXzASIcJ5O2mPDT3ynVpFjmHeUbY9+Rilo92ASs27CPYPrZPNR9oEvbSloDV95r5jXUBdDnS7VVcgtdqvZXyKqM4s27X+tIfxm37PuHStYPPOuL+2p4UKeo4BeSqG8QvDoub8pQwvZ2vH+o6y8JVPYbboGeaxcnJVqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnemyJ7KWf35aRNaj0RkOMuzMFubZpbJcQIDrPEgHl0=;
 b=nEKoaJPuxXNsKctg5iVbVvzBLUUl6Yf7XNmKS28TmY+X9JAtqfuZTl7wMN5Qh7i7pEFKbwwM9Vg01SCm8jE/cjXOc8IjdYwLZ425cZQsMYcvaEa18ptnicSGaZ1SWIdwFQOklRJfswVY/SHuF3BYPNqg59kTm/6zuDQ+vVMSrNvUmCKMfRSV4nsM/3R7KbMf1z7o4/jawFvFsiJXpMcRHBIGmESVePNee9+TjY/U8fL9/qJtJqCava2xafXdViwsStN9HtynchSqFbhoSYLattgqM6rBUD1fGgD6Y3xtRGOsz+94Jg2HNZPD7YA/nCU5OVK9wqxB4Q6cEKTPVWGoKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:39:45 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:39:45 +0000
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
Subject: [PATCH v3 net-next 06/13] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Tue,  4 Mar 2025 15:21:54 +0800
Message-Id: <20250304072201.1332603-7-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 95eb27b5-c7b9-49a7-b06c-08dd5aefbbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gO8m32JRqzvKKLBg5GAHgBQMS82XPHoM4t07ZUYMgsseRnOm7yx/QwisPR6y?=
 =?us-ascii?Q?dQgvaUVgKW0iIaHc8zHYfJ29mrsZ96Zmew3wn7zowBeEksPaCu4J+yqG695X?=
 =?us-ascii?Q?GNIf+JDDz+CYjPBDjyannl2L7nooHS0OVrXkrsKBlJjPjTXPxJSq3yG+tBvz?=
 =?us-ascii?Q?kqX35TOj4FEL3jpcxpx+MpkrOAzTmBGKuQk831ukXKJHQwTHTF8iDS+H/D5G?=
 =?us-ascii?Q?qpSFNtVfXABAJ3/ZJ3w/nrQ8b7ru0IccDICjiKLOUdoln14kafRkyHpq138j?=
 =?us-ascii?Q?cKri7MrlLXZWA/0UJOoGqzBvOOIXLdfGCGM/AUzdwS3EDYo9S8VXuNqjgEXG?=
 =?us-ascii?Q?IQVNkh47Bc1PdIEmlnIEkC4mfdwgvw7xyLexhmds2Py8gDvHJ9vjTKEve+hY?=
 =?us-ascii?Q?3um54eJM6AoG7kq7BKQ547pIFwRR3AGGZjKfs5ZL5uMWITBcbk2KS9QboJ+C?=
 =?us-ascii?Q?gSTvU4EKkv/uPXd2b5Bwsd8iySVehldhR+TcxuOL7nVSZ/0/lUajNIvDEYPO?=
 =?us-ascii?Q?syH/sSZ4MnzugXTvwZFJUtDl4k8gjcPheZgUmazRoNfU4mtjnXkfcAKcWrjn?=
 =?us-ascii?Q?yywsHRCeTBIoEg5YVAFwNt3N6GLYNPC1EW1n684rRuYjdRRBQxwO/anFaBUB?=
 =?us-ascii?Q?DJhCFdTjum2x3jrkSunHGMfrqnI1mKSR8aO+D1IRqrO1LO1Rk8W76s1jhrD9?=
 =?us-ascii?Q?mLJTsTa9RFJ2Eh1nLY+seZf7d7/Wr6M1/0hXIyLLSyU/iyRIH+bbX/vFCqYn?=
 =?us-ascii?Q?DIUJMKiPm8iZ/WhhFCCzJiBNpNG8UYCD5zF19u+UHAJ6bqPJoEEzvebyvGy2?=
 =?us-ascii?Q?nGLfQrSU31J9JyVJc9OVGy/NPRVhVmmQjI27CuMUdgxvp/3p7NacM/e+lQUn?=
 =?us-ascii?Q?2OCJ09S3Lsm2Dk3l/g8xU2abX3b2BRwRAg3GWEMMsjfQBUftW8dqFZ5fmjhB?=
 =?us-ascii?Q?vkHypvIxjE+3s8Uj8jfUEwOabBDRW55dpDayGCq4w8H+5FxtPqGML2Y96ffo?=
 =?us-ascii?Q?IZ1FlhED66yVOVbuEHpC6Qg7ye4+6loIHBuQ6BfX/TlF/FKw4O/NEGyGq8St?=
 =?us-ascii?Q?mCoFf5jqW0GmkKXHtngnZotgpkhJCCeqRebsuwV6OsT6QiliwTsq+maB+KYX?=
 =?us-ascii?Q?K/88b7wvYi4tepdfECukEjIDL/2ZTj0rbyeJQ3iEMtQ7xv4W5YzTom2+3gM2?=
 =?us-ascii?Q?OsdxkIvUwxRwkEmitOiSbwijB1za6OsAuZ8nS7yJTIpuuE5Qq+LI9L4ki+0D?=
 =?us-ascii?Q?HDmb9i24zK2T69rkeLbOcpIdh8VBnb7z0up7uP6moBqFJlJDYIUU9uSma8ll?=
 =?us-ascii?Q?lVx5wmKB+a2KSU8GdotqhxkOYLuvNys2ZMDBiFWDC+azkmK/oAYk6KYZtnIx?=
 =?us-ascii?Q?MGScoNFuxPMtcg6uDFx14kBBTT6d5tp56ciadI85nfbF4TEp8fR5i5+8ZXWF?=
 =?us-ascii?Q?UDFPVFBrQE2r9tT/Dv4UxUqlPjrn3mFv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtdb1l+mYAqUHeSfnATcEqW7qZLze6vfyn1Rg0LGojaGu7KbGnu4rogGtKhF?=
 =?us-ascii?Q?OC624BzjChvq05ry4vbQY8fbj/TwVlhKGYV6PWuQmKJjRx3XjCvx5Gy+SNBA?=
 =?us-ascii?Q?Sa1O+zbDXx48KFV+PSNSQbfJy3AvrQZcVSxC6a/64V0zlSXhFcqIUHQrUgvO?=
 =?us-ascii?Q?34byqgN69xW15JEFzy77aOLDRy4LSU1Sff8ZTqENeh5I09VhyxYtKv5MuSTj?=
 =?us-ascii?Q?h3NfPv/KWopN7xOyGszavpzOO+Xtq7CHFQC/K4kc9NUY2OQLbB2/Akf3r1yb?=
 =?us-ascii?Q?qyS1C0zxxnlyLYDTu5cZRemXFi3Io5/Wqv7vjZlUvav+r0dXh/rBsljS3qM4?=
 =?us-ascii?Q?VqSnehTB0nSydTIIS4Uz/butoUqNL1QwaxuNPPtiutYTqDHyY5SdR0vHc9xf?=
 =?us-ascii?Q?4EQnK8oO87HNgwRi1QoyJ+7KifiuV6ITsU9n8ssumVCTdOh/c39iZeRtjolO?=
 =?us-ascii?Q?Bu7xdwt2yR8BoA+mUsDsKfM3J/IOpEPgyc8kB4ZdLanNkynjVHEvvngr7R6x?=
 =?us-ascii?Q?AseU382omPb6FOWP7jbckZ7T/i0eJSs84SzfCFQRQ/aj+xDrQt5Z3bULd/Bf?=
 =?us-ascii?Q?8i8I2hbNHWWG3td+RuLuXYCAnbQEVvYOQ6c9rEANf3WawDYoHfdf9kPGwFmn?=
 =?us-ascii?Q?qzUI4TkgJoWa6B+OvP7J241Gq7hoVHfF6K674Egg69rtI5NLFzU08IPef7Rw?=
 =?us-ascii?Q?umv5mYyPFpXwPkkIx8P5vxzoyvbZcsQRr496ToKU81EKncmgdfn56fQiCsYH?=
 =?us-ascii?Q?ViL6mTJKq18zpZbxJuNDM498EwclnYxmnDy37ANcRNKOBCbmVa0j8D5gplPg?=
 =?us-ascii?Q?qPwJakrx57UPGy/gRenevWVD2DkQryQ8aGG5P/Q0O/5yHVbVTD6l4Glx08SR?=
 =?us-ascii?Q?tPy9lcPbI6r+Fee3a57w7MPuS/VRV2q8wxIyVJ9T5uil9WHdT+Y2718LSbz1?=
 =?us-ascii?Q?mU0ErifuZOPZylgP9hYJZQgxQekbRQp35kyJaKr276OTP+4mRL84OhCwCFQl?=
 =?us-ascii?Q?qtj9GGOdANPsuGkHRYSg5f6PIhe22AiUIKcYHst34OcDimk+o1/fM8Y+6sCC?=
 =?us-ascii?Q?XD/T+8wfI6GwMCETXAGNHEAi1dnY1IXWkhia/b6l4WfsiqXgRDz9xIygpjIb?=
 =?us-ascii?Q?LeE9IwU9jUmBYoggjx/tGFecaa3v5RYEL8v7faWP3knQXh0qmHr8tQ3dV620?=
 =?us-ascii?Q?EMHHylK9L7OfJ55q1/Pphy7v53LDLkhDxgcrYYWTNCaJBI6Mkx2QHqgGz3cu?=
 =?us-ascii?Q?Gpcm1hKgnKRXHugfpWkIiI8FoLaEmia6q/fXunwIuY90bf/a/CBZQ0SYaHZQ?=
 =?us-ascii?Q?ACcYIasQFXOQ2Jn3ElGHHYlp1OVoWt3Weu4/kxaC9nHNSLsd+TdJ/yCTo1s2?=
 =?us-ascii?Q?qBHn4e74Rz6jEdUr5Bh8KR96E2k5T7lA/7fFuSsYwE2gzwDaahXvzlX8cNEu?=
 =?us-ascii?Q?xfvrn+QWVmMhf4+iDnsF6JueS2XWL9DFO9kIsHALwuH1Itc3clkoy5fPLsy7?=
 =?us-ascii?Q?F8qy+K5oPZZL2kGEkJsBGUxr38cUVzdX6FBkQPs87Pf7hKR8uJIT5LmQWHwI?=
 =?us-ascii?Q?FSjV2jVFVCmmYinXQdi53ujH0TqvBR8em9cRobX/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95eb27b5-c7b9-49a7-b06c-08dd5aefbbc5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:39:45.3826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puJhJRoSq6BYU8OXeSKzGCW27XLeDTHERQE32aeXxpvDyz5UTJbOQFvuCGuYUmdWwoBrqpLJEjuFq2k1yGt9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve
the network performance and balance the CPU loading. The main changes
are as follows.

1. Since i.MX95 ENETC (v4) use NTMP 2.0 to manage the RSS table, which
is different from LS1028A ENETC (v1). In order to reuse some functions
related to the RSS table, so add .get_rss_table() and .set_rss_table()
hooks to enetc_si_ops.

2. Since the offset of the RSS key registers of i.MX95 ENETC is also
different from that of LS1028A, so add enetc_get_rss_key_base() to get
the base offset for the different chips, so that enetc_set_rss_key()
and enetc_get_rss_key() can be reused for this trivial.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  7 +-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  6 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 22 +++---
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 14 ++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 69 +++++++++++++++----
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  4 +-
 .../freescale/enetc/enetc_pf_common.c         |  6 +-
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 +
 8 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 3832d2cd91ba..5b5e65ac8fab 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2405,7 +2405,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
@@ -2436,10 +2436,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index ca1bc85c0ac9..ecf79338cd79 100644
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
@@ -537,10 +539,12 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index c696eb4f0488..adaf28fdf0aa 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -579,22 +579,13 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
 	enetc4_pf_reset_tc_msdu(&si->hw);
 }
 
-static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
-{
-	int i;
-
-	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)bytes)[i]);
-}
-
 static void enetc4_set_default_rss_key(struct enetc_pf *pf)
 {
 	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
-	struct enetc_hw *hw = &pf->si->hw;
 
 	/* set up hash key */
 	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc4_set_rss_key(hw, hash_key);
+	enetc_set_rss_key(pf->si, hash_key);
 }
 
 static void enetc4_enable_trx(struct enetc_pf *pf)
@@ -698,6 +689,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -705,6 +704,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -1113,6 +1113,8 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 static const struct enetc_si_ops enetc4_psi_ops = {
 	.setup_cbdr = enetc4_setup_cbdr,
 	.teardown_cbdr = enetc4_teardown_cbdr,
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
 };
 
 static int enetc4_pf_wq_task_init(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 4e5125331d7b..1a74b93f1fd3 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -299,3 +299,17 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       table, count, true);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       (u32 *)table, count, false);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index ece3ae28ba82..bc65135925b8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -625,6 +625,24 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -677,36 +695,53 @@ static u32 enetc_get_rxfh_indir_size(struct net_device *ndev)
 	return priv->si->num_rss;
 }
 
+static int enetc_get_rss_key_base(struct enetc_si *si)
+{
+	if (is_enetc_rev1(si))
+		return ENETC_PRSSK(0);
+
+	return ENETC4_PRSSKR(0);
+}
+
+static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
+{
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, base + i * 4);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	int err = 0, i;
+	struct enetc_si *si = priv->si;
+	int err = 0;
 
 	/* return hash function */
 	rxfh->hfunc = ETH_RSS_HASH_TOP;
 
 	/* return hash key */
-	if (rxfh->key && hw->port)
-		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
-							      ENETC_PRSSK(i));
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_get_rss_key(si, rxfh->key);
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
 
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes)
 {
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
 	int i;
 
 	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC_PRSSK(i), ((u32 *)bytes)[i]);
+		enetc_port_wr(hw, base + i * 4, ((u32 *)bytes)[i]);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_key);
 
@@ -715,17 +750,16 @@ static int enetc_set_rxfh(struct net_device *ndev,
 			  struct netlink_ext_ack *extack)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
 	int err = 0;
 
 	/* set hash key, if PF */
-	if (rxfh->key && hw->port)
-		enetc_set_rss_key(hw, rxfh->key);
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_set_rss_key(si, rxfh->key);
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -1240,6 +1274,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index cc3e52bd3096..38ec7657b9aa 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -523,7 +523,7 @@ static void enetc_configure_port(struct enetc_pf *pf)
 
 	/* set up hash key */
 	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc_set_rss_key(hw, hash_key);
+	enetc_set_rss_key(pf->si, hash_key);
 
 	/* split up RFS entries */
 	enetc_port_assign_rfs_entries(pf->si);
@@ -907,6 +907,8 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 static const struct enetc_si_ops enetc_psi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..c346e0e3ad37 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
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


