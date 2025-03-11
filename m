Return-Path: <linuxppc-dev+bounces-6875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C5A5B8D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:58:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhg0RwSz3bmH;
	Tue, 11 Mar 2025 16:57:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672643;
	cv=pass; b=X50um0iY+fSF+5Wjn9xXvoHEiDqkzF237e4JfgBW3F3dEJpnppYjK6YVW/ivZW+L+buS1cnLWiowUNOL9wE7CV094KmPFaipj3o25eZ6RXSY15ZLwfi4SjzjU48jM2v0jRJwU3kbDXD6lKrxqVjqXc6Y77bWemBtSQ1DnbdgLgIDeFLnbUkzDEpFkjVB+hbEAZ6ztQzpOQdCWMvCGRgsRix2tbTXDBWKMgEtepEiAbubXPZyKBSH6fqmp5dZCOC/lFvX7SiSnEx+CTo7Ys6KlSuv9wz4fPYA8nLN81W7TK5hcpen8bKayVi4fBMM0lDuU4sdkD8osevXrMg8n2yPvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672643; c=relaxed/relaxed;
	bh=RVom9LDIhX23btcpGNSVRM13wz0Urd0TO/BlD5e6M1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GAqfcZbii0Vr5AwfzrTZrZEWnaXFIELVLDTHj7UJ2TA4tamTSCy2d/yLSH8xtxtZIJwL7n2r4WDcHdfo+T6D0N7exiOpzIWY2WyWIAKjcaG0/B9TeIo/gLJNblUGYG0aHutzAGyLfLpW7trUgZJVbCTBR5cAeKUY6DJOajABtav1hQVCg6PKILwQXKygeptd8XwWIDU8+M4WBx6bp/fibshvnD5Azs6gVPD9npDB+V1rh27nimpPIP+jBqBLIRpnsKwBs4v++e+RsMxqdPFhthhvsGCK/id5+quO82n8Tg1zmB0nEyw8Awpy9i//p0chg1DYOY/qkrSeFduYwWj46g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Dkczwoca; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Dkczwoca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhf3s0Jz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX4/opGMD35u9h9TwoOVxsoiqEYGcTsmnvXCgCHhSvewlf6zqKEVzyc/hdm8eLECCmVcZQUJGW1zt3Ohm0yXGHsHXr2UI4eZ+LDO4iORc7iUGsLNb0GWgcFXlBRWXTv8VuEe9LTS1mxg1bOGf/aIMtssWobTU2UvUAUSpNeiFPNJNa5Elj8VLiGZDJdQjNGieMHvR7MHiMxjTOgfdf67WuNUrb/SHOmRC3mnW/nWOZLiW/ALRf4Q9GXkgQtFIAIeGMK7odE/6MaijA7DgxDFiqtWtQMVPDNcgK7qMtXMugdB1kCSdoNs/c+eU7KSFo0UO3uGJL1SUliImHr/aROCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVom9LDIhX23btcpGNSVRM13wz0Urd0TO/BlD5e6M1c=;
 b=SdHuje4ZT0LNfYhfYBaI9y7tjULoDytgkekxN+MegE4sJVnRSozmbjEX1yZjYqTgPuNpiiTEb/hH76q4gL+XpQOjIv43v4WrU5xkPJocoUbpCC0DK8VlOX/+ytXcnmtke9k2J/2O5+byyLPT9uyLy+MrHOkFAsnu484AmKtCFICkgcg2h7hGVlOhUIig5EBe8zajDl8tFObNsS4BCFSuj0538G3EVbOI3EOoWhsMr2rKVZPrPtC5gIkKBVD1PzRXogere01y2H9xedQV0Ne9OtIfGqYtOPAowddArVLVf15k74SXjvkBfFrg0N4xwXQ7GIHAoGS/aiXp9qQQCMNRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVom9LDIhX23btcpGNSVRM13wz0Urd0TO/BlD5e6M1c=;
 b=DkczwocaVZVy+3okRZ1L32lKqGsqYWMs66FUSTpcr3+lsuhPQvD+21F5psAWTLLzkDTlLu5H3X2FyrwViE/SaWgdJq+0WaU0G9euykDycrwszX3wjuVfi0MiEpayILkx7PQ1Ly+QBKJxJWjbUdw99Tjg+NFDiW1E+yDj3ZcJG9yXE2dr+wqG57q0i0lZ+CAzPiPakGO5JfTERuGS0pyXyAwUACPBIyd1XMYtJ10kWK7PWARv/eHwU3s0np0+GNaLmyo54dwkDCzNXLScqs+ny5R+mwsK6Pfwbw2SxTgOa5vfKw8X3ezakFZAiwMt8jLgD7tky9rk071cP/Uk39utKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:57:06 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:57:06 +0000
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
Subject: [PATCH v4 net-next 14/14] MAINTAINERS: add new file ntmp.h to ENETC driver
Date: Tue, 11 Mar 2025 13:38:30 +0800
Message-Id: <20250311053830.1516523-15-wei.fang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f50082b-bd1e-4fc7-d134-08dd60618db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wIXdpyz+LM24KQGFX9kks6/0ehdpN0OJ6deDSgQZUaqnsqjVjzqf4ce/DWRF?=
 =?us-ascii?Q?/cZOfCm9k0sK8VMm9O23i0SrjQxxUN6lHXhVjxfOrEunn6FUI1nasGw/7a/8?=
 =?us-ascii?Q?wkP9n4ufyUUZUxpUwf/nyE+v7QLpMdI/GI4gVV4ZWeCBJf0GOLyqvBs3aO51?=
 =?us-ascii?Q?LXinHiFZfwj2baMAgsKopLfP7rm9gGiDkUjL54eQ6EHphyCUcGi2XPqJUWZQ?=
 =?us-ascii?Q?MvpIktTO8lK0IRQyFBXq6SpFvLYznthBK3Zh7Ghr75ra71PKivwQtUJrlR4E?=
 =?us-ascii?Q?nUzkz/DtmtZ7qAZPoviFaC8mvE3vuUhNHN3wPt5JPGyCGm7BX8pkSy5dPeay?=
 =?us-ascii?Q?6hFq+HMjDlFhx7P2Ha8SyCinyqrjNO2IZ9XN4XmlEgisjSDSQqo8Y0BCtuRk?=
 =?us-ascii?Q?8YlQFEFqbI3HbQPrCwjuZRn9BeNN+9JZSAXwYPj99jAvdgPjgoB+kH+kZBRm?=
 =?us-ascii?Q?A9ZjUHFEbnQmj0379erI+qSjSHGvFFiEAsmwoPRXAt7Wq6XBA6XUoF7JFhLJ?=
 =?us-ascii?Q?8OOkBNwbtpQPTIFElnnszTHfDBXIqImUMizcBGLFCIX15dpZWk29FVmpWe+4?=
 =?us-ascii?Q?50VMgns3JqOQywJPTYIY2NX5/oK8x3aKLMgOvbUyBih73+8cFXxfBHbGyTC9?=
 =?us-ascii?Q?ZMT0wmPuecZ70advr0n9/BkWShM4NMoy5lTxZ9cIMBy5p3s0EiLemdv1OVgq?=
 =?us-ascii?Q?OEMp1hRXcKw+lSkWr4RpuzB+8Q/wrIWkRNjUIPHZTyMqvZb6GadsUbHmEEEm?=
 =?us-ascii?Q?1SVov7VwBmti9+/DIDep2V6wuzS3THF8U6iP6Op9jD5xG6ZuVHgqI4H+eWij?=
 =?us-ascii?Q?3z2C7wfkV8/svUSI5zMmKczmPVYgsRWxMHxVao17KbOOZvB0qLzH6BU4+EcK?=
 =?us-ascii?Q?uK+CDVwKWPq23oxGcIn+gV2Eb7BRe4uPdXknUrSUNrS8yO5m7JO7Fij8YrZR?=
 =?us-ascii?Q?4MaIyHYYChIznJQYbMZ9/MxEXgF381zXiY7LUTmIdbosJNxHEt45+Fcka4Ov?=
 =?us-ascii?Q?JrS82iJVwF/tQK5ef/xhBaBUZNVpzPIqTCsF9eraGtxHAbI6B0QdntAeQ44M?=
 =?us-ascii?Q?vXDJk0mttMD0MHqPygT1lhuWJ6rYuysyGG/vF161hMzdhfaxAySkPykloIll?=
 =?us-ascii?Q?cx4KL22SxWrlsvnqMA0WkTlyx4+LccIIEJn0oNFdpDS1KIEuMYD6bY7KfBpw?=
 =?us-ascii?Q?t2beWpbgTn8+Ql0TVWfFzY3Z5oVIjGcAYfeHOtztUZ5M7G+v7Ex4hrIVnIKI?=
 =?us-ascii?Q?L60xmSXhdqd1tXYRr/5xE7LVyY/ulmOK14iNsAbhRJakCPzgzVx9dqilF91P?=
 =?us-ascii?Q?MLi1TFI0ZQw6Lgyvpp4ER7EY4dfAs3ZIvlnByiCJYgj08oFUJyx3gX1PcOPy?=
 =?us-ascii?Q?VbPYcVQARrb1Q5YWZNt+UQKgXp0kbW2kr3bqmsgj33E10T+tmD+sQ95yxPd2?=
 =?us-ascii?Q?R1cGjuvbTX3pc3lwnh/9gf5jtq6ZQET5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVjfK9YudxEGsSw4Aw09mBU6jr+P0wEaCtNxnKU/Cqn9eFbKhuv0MJdCB6Ra?=
 =?us-ascii?Q?RpRNZPJlPAU+GsuUyR4idmmOfui1GtALJMSt48X3PCiP3B1iU3ZzwvEWlIKH?=
 =?us-ascii?Q?/NA4SuP5ytZxf4Nt8GwARKqbfmjaN9fvd8TW8M8zjiAyLy+alkpsHzv34RpQ?=
 =?us-ascii?Q?1JQ1ChpRyec+9Ae2mJCxG+Qa4HCCUU5SCc95xjlK6Z/2pZZsZ1uqKl1C1xGy?=
 =?us-ascii?Q?oFkeuzCaBoooHGVkpnve0n96+kuyuPE3A4F2MaKb2Jng61ydzCU8GOapKBqA?=
 =?us-ascii?Q?IdUwfNiFMa+OgU9N5tAaFlU8TQOwxwwCYT6ca4zBl8qewUUcMSSeQpM3r1pg?=
 =?us-ascii?Q?dnAruKJdRijAGoU46IMsyfAzH1Dv30CyOqmMGyJTpf2bIXcAyqptrmUQpUVy?=
 =?us-ascii?Q?S6g2DS8tJBfk9fKeVn+VWHYwTS5exgJCCPt/mEwEMARlrJ8agOb8Pt1IHLRj?=
 =?us-ascii?Q?cLi+EeBlTmfQL91prXwpjEQejcgG3KJmFU8fsPG6s4LQAylti5FoiD/jhppT?=
 =?us-ascii?Q?SXVPszeZBGfCs8W0F30iwN31e46ZDpbR1I92oI/594GJYeA//TRMVFIpWFWa?=
 =?us-ascii?Q?zISmRorYXTCYAPCVVNBqoq6eZvXLuNk6+ifmuhMhi/aVMV3vTEOUjVsottXx?=
 =?us-ascii?Q?7yA+aqB8HEjQZ3uu1pkDuy4/HSd99lXxCsGdq6rKe2X2CcRHa9tVPJF47UuY?=
 =?us-ascii?Q?58dgXyuWPxLgMBjXVRWDOORM3YnaKbCTOT5+zKl8Q5pl2NsKPBGFVopGckgj?=
 =?us-ascii?Q?w6gvAPkk5lFCnGvIt7uAe4FxXIIV94A2m/2vGfPi9LxIYUqNtQPnlXAwlzOQ?=
 =?us-ascii?Q?5fHjln6l1UvoZsfPYBAzK7ccWEHmv8oQ3KIG28pUjcYBzVEFNd8rU+578/zV?=
 =?us-ascii?Q?oPAYqa/ugBCYtTfzgxFM9EG83XS8Dt3lROKNayN6xVsWLD0gk9LHYOTss7lN?=
 =?us-ascii?Q?SADvpHIdHA4Oo47+MCXhFON0Yinv8h4rghEmBpDcWr0dwByljnZLWU1u5O8u?=
 =?us-ascii?Q?rLY1GNNflDoX29Xv20ZT4QlJccVtD5Om3kwlbOTD3syXVER5GdW1FI9mst3H?=
 =?us-ascii?Q?mb1G2eEb6CUOujCQbzGf3UmG40kqKhUtnhmW2BF1hU/ewJoEsdIls/vS1OD0?=
 =?us-ascii?Q?8UHz5YR2cpt+CcD8Klo2WZtpvcjzaB0TkfSfANK8mllm55GbOWR8kaJl4sa7?=
 =?us-ascii?Q?y1UqAsInip8eEaluITTL08+siOtsERwU0COooqS6gdn2FhhKqC712E7AizT3?=
 =?us-ascii?Q?TVKY3r2MyB+N6aOZFUKZCIz+4hrIHNAzU8opElS2NbSYW7cfkDOYbe+LIXmY?=
 =?us-ascii?Q?Ia3IUQ7D6TG6Mv0uahRN6Rg5A4QJk0ZY8JFu2nE04WI8nK6PRbV7e7CZXidk?=
 =?us-ascii?Q?iAUuFL+avSV9qisgFNoMtwGLBvTbiNSuRkuu2pWF2qU8Ifo4S/5yKaySkMaf?=
 =?us-ascii?Q?SQIPg0whKUKJBm1ZFMrCK0DHusy7Ay8U3CsiKtgs0RpXEkZPMvK46IkznWF7?=
 =?us-ascii?Q?MHKtXUkJSCkW8zaetKS+lEwc1zz0tQbdsuAb/eko+BI7FGDx+UBjCmTO1/79?=
 =?us-ascii?Q?k0biJNv7VIrc/9mpV8jPgwsjCXAeNRJbc2Dt+XjY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f50082b-bd1e-4fc7-d134-08dd60618db3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:57:06.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSXRkKmOH6F4Op8cnHyiUQoDOUGPYd1YmBFXJqDYCul7Ar5H/4+tPA6WVWKib9pYgeu38rFPkl9lApuv/Sz7Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add new file ntmp.h. to ENETC driver.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7078199fcebf..e259b659eadb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9174,6 +9174,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
-- 
2.34.1


