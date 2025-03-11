Return-Path: <linuxppc-dev+bounces-6861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C16A5B8B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:56:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgW481Hz3041;
	Tue, 11 Mar 2025 16:56:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672583;
	cv=pass; b=JKw8r8pcQlwpB2p0/q+ckEar0oHCKMoc1fUAqoD7pJVgWRR0WefpZSC1z+VexeQWl9dxLn+/SMvWRhT5tnlxQ3UGRgqeRu0Xqef2lUfJb7G1SoXcAtgBbCayEWfcBtunpunBXP3LehgRKcxJNUfDZhZsTu7S9nn094urcXZTt9TUyI3elriA2c7BvW+McE/WmEhOJgnagqDtS8IlPIgfKcziZFg8h+qTpm7ogfvpM0HnHYa2zD5jHAeq1MqNHT5/S/F0gvCtxzvBOR0re6/Mske27LHRCUBbtwkIHQKbfuX0U26V6yELkjSMBSouHXPQqb6YGJYbNkykYpo7Pi8KSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672583; c=relaxed/relaxed;
	bh=Ne9GhrWITawFbAd5TlUj9Nv9T64HFosRkWXJrNmVVng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IaQzdZ6R/eTR+ush3lYB3DShJ/cs2ZWPYbQgPO28I4eoAlLsbAWASxGTYanmjZWalZegsm36uIkikxMdtXTEf9QX2RVVz47SBH9ZC3iLR0ywJmqbWi/7OfIw/WOLb/bu8eW4JMdYsg5sRzRbL4ysaoLeleucVgVW135YmWms3mrA76fhYW7DgQ+Aex0sRmORI39ciIsbp2u3rr1XKw1zu0CfVZiiKOby9lpPLIuklD+CEb0vo1TxRRJLeptIxraKkcGSzDKDTMG73cfAEp5pA6lZ7KDv+T+7f/SFe0Ketil4FynYSagLXXlUjEexZoY4LN23NUcWQ2q8YhOr4yRUCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hxnKuHdm; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hxnKuHdm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgT1RXtz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rswBpnVGXt1TrtS/t/ZSfE0HWJ1uqK3YLaJkM9EsVxPjStVaKzSsMrf+3nZKyrZWE4qu4bvg2fgiH9UOGXfn8ybxJ4h1cqYPSGvfp/tr2kWIxjFShUCH/+oM8KFQQDJNXmrMLnhjsurUSPtN64riWCvDNwDFBJBofBWsmjuP/2SLyuQ0kRlwLXUO720DdQW1C8D2J/sp2PltgChmIXXps8yQ2jz8z5Fe5+2Mjai2f6Tmqjaxwi9H6MBW3t/DzXEUd9VkovtegbgBNnllucFD00Wnuwm0ILp49L1K1mm/RM/L7vzksLZJznvG1FPyWoVmmW5nOBvR5TYpPOSPDwyR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne9GhrWITawFbAd5TlUj9Nv9T64HFosRkWXJrNmVVng=;
 b=BQYHlA/WwjCW+pCvT00USW+Jv8rAMiN3dxULLJLX0mOjj9pfP/H3IE/CEOFBlDbIoexix+/7C/u5eMV2wT7gSUr/M2g7iQF9Falt+n8CKWKFqgH8wLdbcox0tXPQTt9Tluh8+VLlGYLhNpF3SIlLEEwjYmIvSSFfmTt/DPxCbufMe+6mV2u8LUgpbWp3zqznvtlU/ctB5f/johYn0vzn9JGh7F9Bf5Opau2Hv6MxVbcGOjBbFQwGjjkJ31XggU3nD0j6WIHYhhkuiGjOtHcD37abSZw91uQ35LB2qAL2EV+vnyDp5ZgymO9bFI5Le7Tarz/SlIQEJu5Gz+VGpz94VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne9GhrWITawFbAd5TlUj9Nv9T64HFosRkWXJrNmVVng=;
 b=hxnKuHdmUKBFgWn7lt4JRLgJKwHP0KrbUmT7rqmQct+t4FaBSmqHKKTysAKLWAcZ6DQOJEfsaA2FFIBvxYHZQSQPjpWC1blfVjtvfI9t3vrR0NiI1/F6fhVxbY3RjnNCsOeZGEXcrSDjG5qEqtAf9JBIKGBtsoBfmzaD8seaYtQnUzUYIhS+h8P7vdH7iIGyZCV7qkY5IimmoL2gGVd/l1ByxmNDG1wCzl0q2zGS6qB7753T3Xqdv1Yi1y41+CSGbHZJMLom8x5dRtXsbdzoPjTuRt//xgUBmlv6WppQ1BLRP9xringIEGaMSTRcuVG7h/QSfng4crQuDs2X0JL66A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:09 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:09 +0000
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
Subject: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib driver to support NTMP
Date: Tue, 11 Mar 2025 13:38:17 +0800
Message-Id: <20250311053830.1516523-2-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c142e8d4-edfa-4dfc-d62f-08dd60616b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SymWSzMZx9LT24lQh9zalVMEi0/28TDcufV2CF88eAy/xcQpQCVAPrcyvGdm?=
 =?us-ascii?Q?kVskUZsxvsCojIcNSaf9fqYUp2xdQUg9CrVAa7jEMmVX7RdU9453MHks6IOS?=
 =?us-ascii?Q?qufK6zMRDQjypieTvHXEQQPC9pfJaXk4VNV8k9Hzf1Mi8SBgYxW8ZtuaRnRr?=
 =?us-ascii?Q?VPL82AT4+ZOuxA36LCBtWFTg8iPi6O6pdskgS0smYsCdWQ20ki2I1O2TnRSS?=
 =?us-ascii?Q?8punHJOkOGxHAIyXv2mFAiXnKwlKuugIU3TK1LrZne1sSc5cp0PnoiXMRB6w?=
 =?us-ascii?Q?lNaTvqShXg7Nai4BfC8ZxfB2XnLEOBkfMm/1t5yOMbusciWvuRRVPoZ3+Bqe?=
 =?us-ascii?Q?K9gjVJ+NYlIxguVpHMuOcSnY5lbg/WaBEs4BOsSdLX4fGEz/umhsS1Tjx8Kw?=
 =?us-ascii?Q?0uFJaP8F3cG2etb6s5xssV32MqA4r4htkRv6WhvRcGpVEQN6YnqQYeJO5m27?=
 =?us-ascii?Q?YpM+M4ymXSYLxF/At9TgnUPjoXpKokxzJpQ0kJWTJwhxyQZfBWehwfNbMggb?=
 =?us-ascii?Q?pAUFwyS8Z6IMOwYcYI0bkM/hGCZ0gegee/O2Kd/v+GxpUh/Tfm6Mgl9QJVUO?=
 =?us-ascii?Q?kuv/IYAZK2d7790gl+ioxpKVP9eZviD8jSnDRnwqZ5s7ChBNQswiPbATsHcv?=
 =?us-ascii?Q?Jx4JBMhHa62Fyn1S99tA/9veP28KgqB6m7RjhthrXVpsu0O32kWooYT+zKc2?=
 =?us-ascii?Q?c2SGqFytW5pkzgE64ZulOR4mNBep7vvNxgR1Mog7zfMY/G/rMUAWtiWqrx5G?=
 =?us-ascii?Q?dvhB9i29F8vhoKkXKevY+OKtv7m7uOZlq7hAvJke/nHtcPsugCkak2zJXl+1?=
 =?us-ascii?Q?8yPEMVD7W/b1ICtczM36ZtjCf5974gI1u1a4gDFZs6jTJnRnXbdYqbtFZT3J?=
 =?us-ascii?Q?h709Jp3ls/kX278eCLgiHSxYmBQphnYQhpcJFY4glMYpIxv2MTSb3wLPTnFr?=
 =?us-ascii?Q?tEEFrhtACE6WWfxZ4eJor8VzoVLsKnCCwNO3Bxi6V5XYYJOdEZUicNJ/NBQY?=
 =?us-ascii?Q?nP6menQifeQYQ1Y+UEsNM4v0zk5Cix6hub/HPc0QXTiAM+0g9Do/5KnwOnd9?=
 =?us-ascii?Q?407Fc9gNPjpPYcqRDcjMChG+92MxABN4t++e+bdl7JYrjNquZfacVzZDBQX1?=
 =?us-ascii?Q?ahLpIX3sH06JpT9RL3vIBVhcRHRAj1y10k7cYokgYIC+eTuOJIhA21cs/xRJ?=
 =?us-ascii?Q?kN2QMJxE0Nx/3MUFWShEoUYTjbXhCTP6bu/erE8DB6WnDZkmIct1xH3Ogirx?=
 =?us-ascii?Q?Iyfec+jyGbrezVqHNAHMlCkRjg6lm6NoG9+ITJ6fscj57xfXzRRbxZvj/aoF?=
 =?us-ascii?Q?lJQaOKLYs+bgdOhoLNWQtElGXlbEnE+bYyEuy5dvkE1o9Gu0tV8HibQesFGL?=
 =?us-ascii?Q?4bKxVZo3vN0rD8VJIO6+bD6LO44VdLrRkWhivpFngMRe0zPFdGK9QSY+5JiI?=
 =?us-ascii?Q?qdY6f9yHC12Y+CX8eUHEztx40Ax19sRr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cioax01AJNt6dIgVvZ8XQxIjUcQ82jTZ0Ub4YjbUJjBUXFheBwDNwzm+I1hm?=
 =?us-ascii?Q?XqWbWYlbY6l1Gk1mflguY6rALQM1kRcbGoPSk6eWmOc6C/dwT7zsbJaRwixS?=
 =?us-ascii?Q?gzkK+xGumCVwu0LSczTi9MEMxUOwocJtOTjvfO/In5QtmFBqbj7JaGASmU5+?=
 =?us-ascii?Q?Bn+Htu9Mf418xOH2Z43Wdg6FdUgf/3So4mBFrS1qnqlWI7X0I1N1lHVBJdBj?=
 =?us-ascii?Q?5K68efcdkdculqfZGjyHBBJ5XIoYNrRKFgo4NmhDlaBJv99t2Bzpcwmzir2Z?=
 =?us-ascii?Q?AEQaVA9xqamlH0vwEoeZA4PEzT1wiM5nsFdrI7GcuNbAkN/MjG6ojcJXNwEZ?=
 =?us-ascii?Q?cJLjHxxF9hwY3Ini2o9ISPRoQOtv4c0AEfDurOP4ppp/ZuZ+X6lpxgKuOEHT?=
 =?us-ascii?Q?SVToVIbLvbYQyscB9zSCHy9mCyGxOHSk0ab2+u6movPoKmOnu09DoHheCZIl?=
 =?us-ascii?Q?z8/vGwcpfmLGt6UiAj5V2Gzkt5IYluoCzpdKNpsV3IZbHWDkPrEBG8VHSe8X?=
 =?us-ascii?Q?Ty1y9n4R3As5dvlItUWX3FOHH/SrTQRrLGJ3XpwxISlzx+Y2LJro13jXc2fK?=
 =?us-ascii?Q?bT9HL7i9t8Be+EBLUQL4Mu4XaQHPxNFvWXuyShhejdOdJy3isW9A36PTA94j?=
 =?us-ascii?Q?zPk1pVKa8bQX6vyFIhnBkJwNZXObJLT2L16V47AY5kbTYdvHW5ova1O3iIrx?=
 =?us-ascii?Q?JJ/X6dxxPWBkWyW6IX9RgtP8cQB2znvznd7HSuuXpVtp6ZKU3/71uoWZx6/F?=
 =?us-ascii?Q?UpuTKGU6nKfNaR212vnOYxaoDs0w/kpmWu5aDTkpA4679KN4ronCeUeomiCc?=
 =?us-ascii?Q?LZjmm5i2dRB1H2QlrqsB/NBGyR4hhX9KD0ACSa5964WhdtEvuwQ8QACPIpyT?=
 =?us-ascii?Q?PYKNgdm45Ih5WewkFwT7jtJ7oi/VjSYatsi1dS9Snpsu21tVsdUFbfWBIkMV?=
 =?us-ascii?Q?MA91/gbAVdpipgfjbYtkBONDC4HKCmBei+Z0DAbA9X35gyNPxlwuj24AgPOW?=
 =?us-ascii?Q?Gca44uwGDLfN+MBQKQWyjxvih8H7h0baKMzHvGYDYw4zKsJHZyG3SX5V/wlX?=
 =?us-ascii?Q?AVWfLuGT2wCq8V7aPFJt8iBtsEWQ6K+oS9b3y2jOVDHVdMoai1iwpjlSXI0W?=
 =?us-ascii?Q?PsEyqiYZ3veoy6yiHyCSqkIjnjT/q9bp671dnlhDMUlq5l1BDjR29zIh77xz?=
 =?us-ascii?Q?F0FNu6JJP9HmXcz49/mMraDMMOnmEE4g2O7EPhGP7eQJOCKyK/kQQhVc8kce?=
 =?us-ascii?Q?P3eSiY+jMJtBfx5Mn+MiPrr1hyBRcCP36IjOcT2Hpv+OQKeIV7wSE03gYEmV?=
 =?us-ascii?Q?6pLFx8oRhbqKLl6bxu4AibxKkwQV+ZEg3Jsa6IWQbz6qhR8TQv9eGa/qpsmX?=
 =?us-ascii?Q?MhUJsfDoqobajNwW7dIweZL/6I5BpYnN8UYkQhYsDta1wQYbITKwGXoPoyFF?=
 =?us-ascii?Q?L1OkzdDS6oBwN7VOIARUmJpLI/Sn4oIo70Ujev8MgX0WzAHV0jTstl6Paq7o?=
 =?us-ascii?Q?ovBY6sqZk0l5R5mp6mdbjJySiLN4vX6c89/tkHSdmJwKx9sfuDR2/7dbnCuQ?=
 =?us-ascii?Q?U6xFhiZqRXKz87UuUV99G7SpB0XB3s87rqpJkeaH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c142e8d4-edfa-4dfc-d62f-08dd60616b19
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:09.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rqDWYtaj85dXNtV3EdUh3Gu4cxVOdIdjCRYGUCLm3DqVjDD1uq6ar+ngMQOsBiaaRxY+eHommc+mnehR8R19w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 458 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   |  63 +++
 include/linux/fsl/ntmp.h                      | 174 +++++++
 5 files changed, 706 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

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
index 000000000000..df10f2f310c1
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,458 @@
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
+static struct netc_cbdr *netc_select_cbdr(struct netc_cbdrs *cbdrs)
+{
+	int i;
+
+	for (i = 0; i < cbdrs->cbdr_num; i++) {
+		if (spin_is_locked(&cbdrs->ring[i].ring_lock))
+			continue;
+
+		return &cbdrs->ring[i];
+	}
+
+	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
+}
+
+static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	if (cbdrs->cbdr_num == 1)
+		cbdr = &cbdrs->ring[0];
+	else
+		cbdr = netc_select_cbdr(cbdrs);
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!netc_get_free_cbd_num(cbdr)))
+		netc_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = netc_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	dma_wmb();
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
+		dev_err(cbdrs->dma_dev, "Command BD error: 0x%04x\n", status);
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
+				 &data->dma, GFP_ATOMIC);
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
+static void ntmp_fill_request_headr(union netc_cbd *cbd, dma_addr_t dma,
+				    int len, int table_id, int cmd,
+				    int access_method)
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
+static void ntmp_fill_crd(struct common_req_data *crd,
+			  u8 tblv, u8 qa, u16 ua)
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
+static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len;
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return 0;
+
+	/* If the req_len is 0, indicates the requested length is the
+	 * standard length.
+	 */
+	if (!req_len)
+		req_len = sizeof(*req);
+
+	data.size = req_len >= resp_len ? req_len : resp_len;
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
+	len = NTMP_LEN(req_len, resp_len);
+	ntmp_fill_request_headr(&cbd, data.dma, len, tbl_id,
+				NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(cbdrs->dma_dev, "Delete table (id: %d) entry failed: %d",
+			tbl_id, err);
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t dma, bool compare_eid)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct common_resp_query *resp;
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
+	ntmp_fill_request_headr(&cbd, dma, len, tbl_id,
+				cmd, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(dev, "Query table (id: %d) entry failed: %d\n",
+			tbl_id, err);
+		return err;
+	}
+
+	/* For a few tables, the first field of its response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct common_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(dev, "Table (id: %d) query EID:0x%0x, response EID:0x%x\n",
+			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
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
+	ntmp_fill_crd_eid(&req->rbe, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = maft->keye;
+	req->cfge = maft->cfge;
+
+	ntmp_fill_request_headr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+				NTMP_MAFT_ID, NTMP_CMD_ADD,
+				NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(cbdrs->dma_dev, "Add MAFT entry failed (%d)", err);
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
+	struct maft_resp_query *resp;
+	struct ntmp_req_by_eid *req;
+	u32 req_len = sizeof(*req);
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return -EINVAL;
+
+	data.size = sizeof(*resp);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				     NTMP_LEN(req_len, data.size),
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
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				       cbdrs->tbl.maft_ver,
+				       entry_id, 0, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs, u32 *table,
+				    int count, bool query)
+{
+	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
+	struct rsst_req_update *requ;
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err, i;
+	u32 len;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	if (query)
+		data.size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+			    RSST_CFGE_DATA_SIZE(count);
+	else
+		data.size = struct_size(requ, groups, count);
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	if (query) {
+		ntmp_fill_crd_eid(req, cbdrs->tbl.rsst_ver, 0, 0, 0);
+		len = NTMP_LEN(sizeof(*req), data.size);
+		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
+					NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	} else {
+		requ = (struct rsst_req_update *)req;
+		ntmp_fill_crd_eid(&requ->rbe, cbdrs->tbl.rsst_ver, 0,
+				  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+		for (i = 0; i < count; i++)
+			requ->groups[i] = (u8)(table[i]);
+
+		len = NTMP_LEN(data.size, 0);
+		ntmp_fill_request_headr(&cbd, data.dma, len, NTMP_RSST_ID,
+					NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+	}
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(cbdrs->dma_dev, "%s RSS table entry failed (%d)",
+			query ? "Query" : "Update", err);
+		goto end;
+	}
+
+	if (query) {
+		u8 *group = (u8 *)req;
+
+		group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+		for (i = 0; i < count; i++)
+			table[i] = group[i];
+	}
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_or_update_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
new file mode 100644
index 000000000000..45e4d083ab0a
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -0,0 +1,63 @@
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
+struct ntmp_dma_buf {
+	struct device *dev;
+	size_t size;
+	void *buf;
+	dma_addr_t dma;
+};
+
+struct common_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 0)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct common_resp_query {
+	__le32 entry_id;
+};
+
+struct common_resp_nq {
+	__le32 status;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct common_req_data crd;
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
index 000000000000..fe15e394c4a4
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+#define NTMP_NULL_ENTRY_ID		0xffffffffU
+#define NETC_CBDR_BD_NUM		256
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
+	spinlock_t ring_lock; /* Avoid race condition */
+};
+
+struct netc_cbdrs {
+	int cbdr_num;	/* number of control BD ring */
+	int cbdr_size;	/* number of BDs per control BD ring */
+	struct device *dma_dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+enum netc_dev_type {
+	NETC_DEV_ENETC,
+	NETC_DEV_SWITCH
+};
+
+struct ntmp_priv {
+	enum netc_dev_type dev_type;
+	struct netc_cbdrs cbdrs;
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
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *maft);
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *maft);
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id);
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+				    u32 *table, int count, bool query);
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
+static inline int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+				      struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+					struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+						  u32 *table, int count,
+						  bool query)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


