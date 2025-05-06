Return-Path: <linuxppc-dev+bounces-8334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF65AABD1F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBN8113Fz2xrJ;
	Tue,  6 May 2025 18:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520056;
	cv=pass; b=bWFNjIgGN9DvMg50+hUVSiz0iMyE/fAFkOnEDYDp/q/5ODtoyltk2t+WMrO5IWgtnQgBJgPGtzlQP4LbhvxvVA7tBULQSMtlzJ6MMLiaz+yP7Swn416B725aOjeRUZ6pjmfsr/0qJycUHsMozXIHa3zEFmwqWiOpKjf9v3Oyys5WFNi4RCNXpVIFWcOyKkqQtFo55VXA2+H/BS/YsJlwFIqhyWwqX6yK2WG/q2Kl/rGPg9f0pFFlBDlTapSEn1eNokdo7OrZnP3XzF652PcWZQmDIonzJKRMyDKtKBLWa5MeqlS9F30E3BWUEJDvCSTXtA3OWTObDzPXwQI7qvsfIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520056; c=relaxed/relaxed;
	bh=+QM1n0I6SmRcTOMBnUm+JauomtMmdiCzgxtJNlM/mYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KmC15Xze1eieYtWYbbxypFMeCE5CRl0dKOWAJYW83UPzROjnQtl4P6rhsUX3qrhWnvZB17enfM2DpLsxCBbRomrI7rknvCDrdEXMK9t0QKvytxfxLECpBFTqF6zjYB6mxLHNwYmu6nWO7ehboFGcrlq9cxPq//qARFIGDJdTFEokh2eL739qub74DPCdPDAxM2pFvsC/1SXZ+Uy1veTcUmra5bacISl50EHUi7CTPfPn3utlmt//EojTAmjGc4qJxct9uCzr5WOqncNPREG76euBMa555XeNPy4qrWeTMz8vX0Uy+NXntlky6+mg1dgdr3xNK95XJKscfL3KbLj5dw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hUxlEKgU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hUxlEKgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBN73gdJz301G
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSddQPHAKc6b5IP3j56AyMsiRqVTpL4k03rIdv4tw0PmpojfVhZbeJOcLo/MY4L2jEd9mWKLPVncK3RZZKmqD5cgy4R3+jrW+lD1WjjrcRRZxcwOEmbmsWvYTmtNjNG5tAjxWSZVnN3aKS4608fiAvtytAVFR6AZa+ulZi/0YTYVhUKHtyOnTb1em960FhPlgxmHzVtFekAcHJhSom8BtmqVqnh0H2JyRrBdigHnL56G3M1wUB3z+GhU5+H9LouLf99K8w4RhepOH/QYTbdOgDKD1TJKP7Yba8YEtRbz5lYs1ng7OWQ+ZnMxJp/ofb5iKO+JtRDmvT4fOAeXJvdkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QM1n0I6SmRcTOMBnUm+JauomtMmdiCzgxtJNlM/mYM=;
 b=TMhEpNoskguGwYMYl4xAPpS0xe+U0AMMvub9LpsaHhHD9iRuY2y+MlrzEdhD8GFg6eR9Gg/wzX12z927+iNQgVowjdJwXMuhq9SEvLbq7LmlmI+zJ1SIZQypeVCuTjdCdS5CXt+BI8r7t8a/vR9qY8ZVsRWWav5IJECs8wy6GSlt+dY8phl0xr4lvjwX2rZfEKlX8AGSqUGesPeE2wHtJ3Kig9y3wQe6y9JRyHORZznCqVzFDeE+MfqnRKWyXwy7UdVK7BDwPUoImjUvPPAMJA98JG1EDPxWwfWifEgyOXodnQDqWfwyCUr2WngLmWQZ6aSQcpQy8ZASqbjbSlkK3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QM1n0I6SmRcTOMBnUm+JauomtMmdiCzgxtJNlM/mYM=;
 b=hUxlEKgUed3b4Zz3tsO/K1H4DRD2t450Q6KC74pBMvY7nAkMUh0B7O+0zrcq4Xkua7JLdfXvkKi9AK3ZNIut5R/kUTD9RVa0Ui1OglSrouHHQsBHvkOhJSDnEXarEN5V2tRePXqFJ2iAw8GkmTeq//zv4d9WTRgMRYr/CpHZPZgS1El9hqP1WC688s1gQeD3GGQV+46CPdNFSscklPNpgTiV+Jv5R6zxGq2aYTS1/smDDSVTdD/Oa3h0CfuuRt/VgFdeVGF9GJqKWHGB1MUg4d2xKG7lq9Zahi1xZnhVDJLrEGBgKHFs3jeCNYASu3sBmtCt5t4/mJLhXiaMpfDriA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:21 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:21 +0000
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
Subject: [PATCH v7 net-next 07/14] net: enetc: make enetc_set_rss_key() reusable
Date: Tue,  6 May 2025 16:07:28 +0800
Message-Id: <20250506080735.3444381-8-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6f5862c5-2ba1-4f8a-6cb2-08dd8c77d1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SaPmruTnXFH/jYUNv0W4u1RCNAVtf6ZvzCWlHfj5Y0szEcJiJ5cWzOd2kbXz?=
 =?us-ascii?Q?h8w+/+jmcmrr5HNWHOG3sv/cNnkBP2jkFn36jiehfuB5wj3llKtCYYtWxNap?=
 =?us-ascii?Q?rkBI7fzIpfSVgoXOSFfdSnuSYhkK2kZ/kG3GFpaNU+2rrH4RAjy4tmPJOhRQ?=
 =?us-ascii?Q?U9/9vaJaCmx4ddmrO/aU7GlVRfYsRBIGT3io9fiIYdLTf/uvUbYa/Ts1RIns?=
 =?us-ascii?Q?4Ve+wQwM/2A5pi4qfwp2CYmSq4mgXfTxo5jlGyT+Lg7hlSZNyUZu9SE3j9+J?=
 =?us-ascii?Q?LMmJw7Pu1m3A1XB+LLsQXhksGYu/MvWvSU9i0/jMbxxp3qFN7rZeKINxsu/O?=
 =?us-ascii?Q?RwdiIRBZ78+wusQJKLPb02xOji1Fc2fjLrmxZIT3J10c4DWiTmeQXin0+E4o?=
 =?us-ascii?Q?vDPGUG4qW6zebYcuQYPAs00FImfI+0ckLaYe7yP3dJnzApWcqVmcMNpr8vgM?=
 =?us-ascii?Q?dd8Qz2UcYGH2eW/MTyQUxkPBX51UYXDx1Qffc/VGeK+dP4n1BvCPaJJHDbEi?=
 =?us-ascii?Q?bZV31O5jldNLFJsWHPNgmPbbb9roZ4wmteHYROmdguzwk2TqsugQbqDLAvED?=
 =?us-ascii?Q?eAYyDRmVeoGVWw/5dJXP9dgxwxTNmhiMkFSNkY6F+4BZo39CdDRcxpWb6jA2?=
 =?us-ascii?Q?3LhSjDjqiYBCj7J1vWnq1x0k7voGUikOYQQ+L4kQyzw7MRT/ex1oTAhyzHHw?=
 =?us-ascii?Q?mrI9YUr1yswVO0TbLbLrCvhBPBFFSQuW4sP2dxOdQ5WUFcIrexnn7XzreJj/?=
 =?us-ascii?Q?jm+vNoYQCD57fi9sa3wNzkbSg/bmxaRo+7DULzjxhkaZz2oCTz5hduITRJx7?=
 =?us-ascii?Q?5qYRXbxK1vGoaiyowoW81mYqh3GTHp6Q+egZM44E88e+VQsqw6ZYyRcJmY3B?=
 =?us-ascii?Q?cg5oTZ+c0fo6UofDJkJ1z60mrFWyhIro3TrIHl2FlZBh29HkL7O/j4g7FgTV?=
 =?us-ascii?Q?8HGmv1UPBgbe1iEIBIZbhE8Et65JQdlL+sceO92/reQJRezSbXNaXlw7izQK?=
 =?us-ascii?Q?7FZCT8erMa0+V9Wo3jNv4SIGBrg2ABqYzmC9JMljYavxWXL34kmFXAZL7x2h?=
 =?us-ascii?Q?TKvds3iI0kuOZH49+9YcMNJyFe2Apb1nJloQdOg5EFcWUgjEOGZ4P/yTeJYG?=
 =?us-ascii?Q?//UHaCSdkoPedC0eQhd/TcieEFY958KoGw6K66lbhTw8q6uAzI1gPdR+eq2j?=
 =?us-ascii?Q?m0wgKRdaC+mUrTwNcUJfn5LCyUaynJEIupCfMe3NfWgxVgDZ8PGubbVKW1Hb?=
 =?us-ascii?Q?zoFDdtIKfOxWCC10PMSiSfbRoU0Wa2igYWA0YKvtW91FJcgQV1G9FBwLopO5?=
 =?us-ascii?Q?qbGhX5desZjyo1LS2VGj2HcBRPF8wzOpBxC3M1P/Ww3hDmtgrrrCxLdZ2naK?=
 =?us-ascii?Q?qaug6J/ZO4mDZBV7wgFkD8yQilkvmCsUibigCA6VBdkPRyHC3OopLrOgswND?=
 =?us-ascii?Q?3iPwPztubUupdsW+x18QEnMv2mMtETxz/8vC5OVgqibqqYDSaRHnCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?idP7D4KifrivWgJA+GwJ3xfPg/oxF5pHLMvPuamfz+JdPBb3M8DrHNlGm+BU?=
 =?us-ascii?Q?Sd0PhWHx+asiqShMRiIXqcnyCN6Jzw5XkvPGYTnpXaGmE+/co+YXlMNmIhWu?=
 =?us-ascii?Q?6M6lx14FZeyIDxxMncFXIDEZsRPs+ffjvnzdTepregLliJFEkv/La3iWtAA0?=
 =?us-ascii?Q?kCC+onLFrrJYcNngpRhIzNjYGzpB4Kl0YV14XFG2+dLXQy5emHfH2zaWfx99?=
 =?us-ascii?Q?iqzqYWv7Ozy5PJ9/Yr4CbxUcvou7KvHqaoD+3UuofL11uuOEFRwW/rI3Sgip?=
 =?us-ascii?Q?LFG7Ijeg9GxfMwrqXC+t1cy/YDeg7uD9+misf5PCNGaJJUrSopbqGMYM0Dt4?=
 =?us-ascii?Q?xDK3gukJTrtyqbN1vQQ1ZtjxsjKjlqzaOrxr9isV2T5lP2IKM6Yid/o/CXsR?=
 =?us-ascii?Q?Dobu9LnHDFAQmgkxvmqqyGdwXOAgxgrFiR/ipmoq/PeH1JepCOHLPrdZ3fHP?=
 =?us-ascii?Q?+DfNhjcMk7MgfPG3h2KxGYicBCo5AkDuHDVeeq197OWsCqYyi9NQPsN14jwT?=
 =?us-ascii?Q?ZQ/CgxsArkRNSj1d6b6tie77vhQMd3BpwHRdoOTGFHL1v2Wz4JW5Cy+XPx/H?=
 =?us-ascii?Q?r83Ce7mtJDhUlLqoHW140fF4mmISaa+NlOAWSbQcDfnDz8bM2DFeIEfUiWmL?=
 =?us-ascii?Q?6iEO6o3kPHfs4WUwZXFfg92LPrbB+/EVaDZdJuRzW5Au6AkvU1swzfPLLmhU?=
 =?us-ascii?Q?fq2TE151pyvhHrbFAqEMLQkl3yuE/umsRxSNVbXFy+mj3WBpu5kAwc6vLFI8?=
 =?us-ascii?Q?9EtFVPX5f3Z+SlYoLbmpwuy8FClrzfIC6H1Vtt2VBquz7wFJR9Qj63eMsC2Z?=
 =?us-ascii?Q?BbsmO72n9ZI6ZBscBKBS+h4yRCHdXlmXnpxsi6pC804QJ63m/JyLSzlw03b6?=
 =?us-ascii?Q?DmWZfar+Qcuf1MsNhNH+BNBjs6zpHz6BGhosAV4yc3aFtpaQBRNrY48RDaT9?=
 =?us-ascii?Q?cB/eJTceER2uI1rZGhTdfqcPIBOEEzkySJY5JpPoMeyu0wC2/0zn8RNvO1iB?=
 =?us-ascii?Q?0JuanmmkAlQiXj2wv4u4hTq9Zr+5N+mo6jYYr8s+dyRAXMCH8yhwxK5yy1xy?=
 =?us-ascii?Q?HWkgW5n3t1BF23RcufgWjcjpvySI0xeFa8JCuqNXli2fR188aGPq0TdSx8jM?=
 =?us-ascii?Q?Q5dv9yF07/uG9F3ueQ8g8kOd3gNERuvLjJYUtGOdIsGtx3VeZ5VKNIuK/toH?=
 =?us-ascii?Q?crLcXXvdCygbtZ3vh8JEz9/8sSXP8qx1owqKxXdAiaDmYCsa1VxlOQSYDebu?=
 =?us-ascii?Q?mAGkt6gEUmhvIdTKw8gR9Nto+SLXyOlz0szFxn4rYKTRt4O6CdH4apZQ1g7m?=
 =?us-ascii?Q?1R0HQ1lrKr4JwaJBpkVJtX0kToxUAcD2cU4D8LtRoJFNsBzp5Cw2C8WE1qKa?=
 =?us-ascii?Q?xW1j38ZN3ixvDehNEyYtlxvaT6JMWpgWj7zPprBC1y01PM4HQtn44ctW+Nbe?=
 =?us-ascii?Q?tw5Ra8M/OoyOUxH102QRteJJDdTCbjkIaDBlozeG8YRVsXS7P4swIjpwPdRU?=
 =?us-ascii?Q?qIzrw9E7oOhs349nleVf+8wXoh9wKr5advvGezytk78yLAfxejgv45I8yFaU?=
 =?us-ascii?Q?gwrkRee0cgWPbjrgY2l1d0txTynW4atekD4imHez?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5862c5-2ba1-4f8a-6cb2-08dd8c77d1a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:20.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CW6/b1Oq9RlYXWnWO0ri/17hdhu7DYnzP8CivsRm9w+emWWSwb+G8vt0tPQg0iZAG0WRvWpbT0YcAfAzBJzcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the offset of the RSS key registers of i.MX95 ENETC is different
from that of LS1028A, so add enetc_get_rss_key_base() to get the base
offset for the different chips, so that enetc_set_rss_key() can be
reused for this trivial thing.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +------------------
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 19 +++++++++++++-----
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  4 +---
 .../freescale/enetc/enetc_pf_common.c         | 10 ++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  1 +
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 786042029b1e..e49c1626e7e5 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -537,7 +537,7 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index db60354ea8d1..d2a414c28c21 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -418,24 +418,6 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
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
-static void enetc4_set_default_rss_key(struct enetc_pf *pf)
-{
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
-	struct enetc_hw *hw = &pf->si->hw;
-
-	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc4_set_rss_key(hw, hash_key);
-}
-
 static void enetc4_enable_trx(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -448,7 +430,7 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 {
 	enetc4_configure_port_si(pf);
 	enetc4_set_trx_frame_size(pf);
-	enetc4_set_default_rss_key(pf);
+	enetc_set_default_rss_key(pf);
 	enetc4_enable_trx(pf);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 5c51cf7ea439..33a91babb0b2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -677,6 +677,14 @@ static u32 enetc_get_rxfh_indir_size(struct net_device *ndev)
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
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
@@ -701,12 +709,14 @@ static int enetc_get_rxfh(struct net_device *ndev,
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
 
@@ -716,12 +726,11 @@ static int enetc_set_rxfh(struct net_device *ndev,
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
-	if (rxfh->key && hw->port)
-		enetc_set_rss_key(hw, rxfh->key);
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_set_rss_key(si, rxfh->key);
 
 	/* set RSS table */
 	if (rxfh->indir)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8dabb80ec04c..8f2616fd83d2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -515,7 +515,6 @@ static void enetc_mac_enable(struct enetc_si *si, bool en)
 
 static void enetc_configure_port(struct enetc_pf *pf)
 {
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE];
 	struct enetc_hw *hw = &pf->si->hw;
 
 	enetc_configure_port_mac(pf->si);
@@ -523,8 +522,7 @@ static void enetc_configure_port(struct enetc_pf *pf)
 	enetc_port_si_configure(pf->si);
 
 	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc_set_rss_key(hw, hash_key);
+	enetc_set_default_rss_key(pf);
 
 	/* split up RFS entries */
 	enetc_port_assign_rfs_entries(pf->si);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..0a95f2ac781a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -341,5 +341,15 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+void enetc_set_default_rss_key(struct enetc_pf *pf)
+{
+	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
+
+	/* set up hash key */
+	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
+	enetc_set_rss_key(pf->si, hash_key);
+}
+EXPORT_SYMBOL_GPL(enetc_set_default_rss_key);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..e07cf3c35001 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,7 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+void enetc_set_default_rss_key(struct enetc_pf *pf);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


