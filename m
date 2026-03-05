Return-Path: <linuxppc-dev+bounces-17764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDiBCyj0qGmfzgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8978920A714
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRF003xDDz3cCr;
	Thu, 05 Mar 2026 14:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772680208;
	cv=pass; b=VRlevWOZI33+f5pOoC80OZ8Je7Dar6tZ6HdotsAAGWIj++cSATOHbxz3TLMRy7uGZLXbfEhbfjFI4Ck3Uli7TFJiCUlMOgRiEdGK1bhUgqoaVpvBlcQxhVlY9SiPmIL1k8wYYRhxJ8ms1yc0u51L7ZEQ/zx2+bPNX4cVwAvoOViJWk352y+qNEBS2JsVmzHLCIB7sYVSpwLk21+t/JsZ2WCyumfMaLbNeSsUKmzbLx5g/7G+zznFcOktTrGchVQaUawhbeq7Ct0yYo1KKwn/X3GcMZbUZXx+9nUqbxEt6YBg5HU3CXKo7V1VlzAedLe+n9bguYOsLqQdwYK54p3Hug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772680208; c=relaxed/relaxed;
	bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oASPLSd/ZeDk5gCfKuJQPRd7mUg9JmbV6Qvwi3BkbeCm99E1AHg/iNqg5LfdQaDCg/ASCmxScunq/tJX7Dtkw6nQmbcfsbrUOEDr/eG6hEMsqXD3M5CP5bi6M10qzyz3ICnWJzu6WMPaY7E+Dnd+UsXQgJ85vkG2s4Od+su58UocwaEKbAd2NePpSLfy6wuObxZrDHoOMaNCw2B5qTlXTT626mtDPQu6AfLimYQ8NYQTOudvYhwvzi6rlnwhrLPEMPSj5bW3a9Qo/XAR03WsJZFYNy0fVp5zGkdrdCdeWMdQ05oU24V2gZDDVM0JUlTcdiK8+T0u27wNvCx6vrgC6A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V9xvWO4l; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V9xvWO4l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRDzz47rPz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 14:10:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZNt5kOurnguEHwg0WTMhJc4EX+dIrOlVA6ZPUzWjKACcJ1Iy45wqHJGMYQZsHCWAwhbhzA+xPvSr6e/6+9aBCrz04zfmuj417HOsDB3EFpLvYL9bqod6ri3X55ij4GMwmR4oCpgWROy0BdjahDRmiXUZyfVKX7jT5lv0wZQFPbKQsafNFrRV+eEIuZelz2IJ/jrlSueA5aikRYWbELErNdnry7a/W2mvvICZLRfUtKI2OblvR0KgFencQRmt6DQLTNLwhtL0IEXGpqrfawalgg+tVCH6NY2DGj0UvrDsQKzIPaoHpLRKS1x37DmgDJZUBpU0jZjgqgKuNqkc7i6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=F8E9d66lYrq9x1qDDqSbr8EUMfTO9wZ2OtU33Fkv2VyzX2VPQtkSdgLKqdSwXkLkwxAFPI4ixq/lSMwkvnc/xuYrzOdPYVuG9lKR91SLkHC69SeOSIIaTWoYp8YuEIB1R80eO7NqzjskknzsTwpsU5MbMQ1WF2xbUsiNKlgpnhb7lpK1R7YeV0W16No/vTcGL1dA+Gp6lioJYAtSGdCJeVxyuhMhI+lW35X5+wicHlg3Vd72tXfD660/CJZej1zMZ7kbiD6eSEqS78TsrjhoG4XhhqeNkgorc4W0nR/ZsnEyoLY3CPJ31fzjpTfcvElo6MvBfzmrB3Ii1N0l0wMxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=V9xvWO4lmINh7N0gfgyHb/yJqsP/BzOzxV+NFCS/wEVyRSmynAiFEb9ryWvpRi5tpDp2dqjR0c3JScPg4rIs83mAia2Hn+50tVijUlTRUjaCnPfR9sjg2dBFsw2ycWFfZGUQHxi6nn1cdhVOAvZpV36Y84PD9N0K4FBtTZ6QF43TvLr6fb2WoKd0+hcK8l1N3Fwr+pp48jlsQMsDRmNEpNM0cd8ZXXbxqK2YzIb8+J1Vh2BxScot+nTx2v/QqLLekheZ8mZ0Sn/LH/FqTtBQtj1ddk7RtonIQOSZd+LzuMSwxtpcY3GS4wq9aVcDLHmmhfa3XkalIvcwcbeWzjHr9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 03:09:55 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 03:09:54 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Thu,  5 Mar 2026 11:10:31 +0800
Message-Id: <20260305031031.3808182-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 557ad167-a676-497f-21e6-08de7a64ac80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Z58T1AdUGOcH6O4S5ypq2pYXFWiRB6zN6L8G8ZoUMhY2x1P/h0gkQAP0tBhdbauxRTG3xUqbMPOWdGuLUKRamnEfMqRiczXXwVGXgoU8ugCj/BhHQ2Rk5XwRbQlgOK36DlcGy3mzi/9FRKmFw0aLARogmvZqjYCX5to+OGzIwrPpp1URZGykin4Z4mJmWZ6K3hLK+KM6BlymDpq5XAoVoWbe+JsLE8BPa65MOSoMQce8Y2rdTaFqYDKumyACqnPBzg6nXxxevMk+N95VmUnfLoFfyPw1YBC90cHrBI4wB+th+p1T89Eu3cPZWY41KKM7xo0fdrd8rRX5GP+rcx5boio3mIoW+pEkX84Bqi/zoTnLEmf8+mizrShsxA/pxben+CPPCPonmMVMZRHuGMl2Myes/1K1CvF+x73TyGYHQkS13FONezxdBEpl5FtY5YguO0zl6Twzqzk+Fy/6DEdCsWaDsc8Y2Uey84aeqz8zKeGTsA6ibioF5GF/GO5t4PGFgOC+SOJszL+TgbqSti6SsVODbgxFU1fbahJ8yxVsjAVlT7GulryCPXnqVu+CUK45NvsMbS0EEGnWYOflQzfexGmhzSedN81TcioLmD9nQ4INxm5Hd54mFreS1zAI5LByzIoAMG26PdpR8s+pzhNEHMDeOgk5Y+PwPhlSRK6jBPZW9TxPjAK66pTnDNwiIf10xD7iQajQYFvdUKrsqk3SQt78ZUwCKEegdT40m+R6M69Nchf4OtPjFK5N1UNNSBm0//luNFFgd+UGj9F6LBN6hnQL3IQfJxT9HVYVv7tN4BVVR5ctaVKaqemj2T2G+0mn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XU80NtXe6wQKrehu948sgKmdN8Y8JD29KE3SHNPm8g0paaDbuBKnKQ5Ta3/W?=
 =?us-ascii?Q?nThcx0w1YX6R5tf0i22w8b9kb7hGv7H9Uma7zn3zMLXMXh/jyH+/OKQiOhWf?=
 =?us-ascii?Q?9bownIWzlPtgvHLPD1cdKdhSU7IZnaxTOxGzHdwh9BGQnfKG9gpTyvO7Pt/w?=
 =?us-ascii?Q?T4TyAELuOhkWntVqY7daVAKVkvxhy0N7EPELMdfmFUCxK+0nlszfn1bTLHE8?=
 =?us-ascii?Q?mHST+suDUXQp+q5pBfNKfvdXEsH8PvpC1suSr18raCSUTT2s78mVTv7vq+Wn?=
 =?us-ascii?Q?BHt12jKnw1xwqtjh9SoCKBpAaiekE5V+R0Mj28OJVet/SeBGh5+qop1dSmLp?=
 =?us-ascii?Q?SE44Rboe0seJ3MfYytYljMlCXgRdjP9icVYKqfElvZl7Ubkp2nc+eUdkXzBU?=
 =?us-ascii?Q?ra2hOAbmP7Mcv1JVo7uEFpb+2VprkIadgmYlE/anMsu0YQXLT4MMk1dIX9L7?=
 =?us-ascii?Q?x4Vrfc2cR696VGJM7Va3gvg5nHDLL2IubpWHetLVaDKe3Rvp6Z1suttcOdPf?=
 =?us-ascii?Q?IsuFg/uIEpWDKRTq/KPbAl3h5Bs4/H2w1PHirS2qoL/3ugLKXa0HXM9IRpux?=
 =?us-ascii?Q?80jJ7zX11FmfimmsbFStl44k1+Q7efLlqGw41pTv4fe/pec6EJQc69aaU8CX?=
 =?us-ascii?Q?5jQV6cZ+mCB2PHHdufcLSloP3ESHCyqghQi5Dy3WTY+MyVfVT0Qc1MKr7D+H?=
 =?us-ascii?Q?HQODNyJnSpuz/eD4NEdrReUbPxeqD5cvsuRCsgv6jzoAHf4qLP51G5ZY6vj3?=
 =?us-ascii?Q?2PoVlg7Yi16PdzON7VKAWUonJT7uq1twH6X8jZxgXQCRQCuyIrLSxkvoyOzB?=
 =?us-ascii?Q?Cs04wsKZs8TEOgrPnBj6J6fd8NGu2XeHJwMFV9BsRtz3joqUH8bUU96a13sn?=
 =?us-ascii?Q?SoSnDDG+ETcshM/MpjzEp16zpBAhnboa30KHrb2hvzPnITS4CzAoF2rBVVna?=
 =?us-ascii?Q?Kk9DdNDeVD/5dyTzPYZPYyWqW2f/DpKInMAqAQdRBHHqOItURmqsU6bCgPce?=
 =?us-ascii?Q?gzJfVsqZUHmyS+6HgDDp9N0UCB9mhnJbxcR/k2sGh2gdS7gm9vyh60/X6pby?=
 =?us-ascii?Q?3o+aXVaC/Ry9C7VwhBYlL4gJWRab52DUeQJO7PjaXs8MlAz1rfeaUWK+zeZb?=
 =?us-ascii?Q?Oryt7996TplKVbwe1VHLECGDD5URnCWroMT6XtTrILKq/cc9UhArpbuqRw3a?=
 =?us-ascii?Q?hdoyfMdTw4GOhTZ8lI0/TV1zAapTPZbk+4UdbmWA6aROk9g0cUVOYYWyZyIr?=
 =?us-ascii?Q?0HmvFWuoZYS1T+6eLxRgPdZ2FZciI/8d44tsOf8cRIMM8cofv9U99xx5mDye?=
 =?us-ascii?Q?wYtILE7RM8pi1FwhOUIMxF0DaFLNiG51dausp8/162gk7vQqaawz7sCTsEWa?=
 =?us-ascii?Q?c9deeIN6npgOesN8mvbZB2SE4TCZoBD1mYoDSdArZY5/hPQuK9k4UcCLaQDJ?=
 =?us-ascii?Q?aOUmPTVJD7I9uDCDMGdxWng2mN+/RBVJ4MEK63EdkCWz5EuC7+uV+2nk9lnc?=
 =?us-ascii?Q?ASgGyv7fzLsafR/CBDjBzOC1LFy4G7Vlk5DYpvBOZeAFRsL3vIKc5c8xMWt9?=
 =?us-ascii?Q?bwtFS3tC6fBQMUVyusxB7JsdER1V+/ElTsu/Af0YmG9AxzaKmbKAWRn2t2kS?=
 =?us-ascii?Q?yGdQE8m5vwq27pLzkHFXPjXcIVAeyTnUbq9LQyDmw27EBnL247LyvGYxv3x8?=
 =?us-ascii?Q?WJmOgF2tkd9LOFB587YXHgkoneQk941dHL+uLFKP6GTsXvcgFE9Vbl2yCbbi?=
 =?us-ascii?Q?fy5Y1n4L/Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557ad167-a676-497f-21e6-08de7a64ac80
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 03:09:54.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpgIQ4OxhqGeOFtgQ6k6xJIbtFa4iDS4xZ7JrlOGKzMGDz8txuAHmmwZU3xfMFfAQD3E37cmpHOH/rsKdBjEdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 8978920A714
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17764-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

As there are three regmap handlers defined in this driver, explicitly
call the snd_soc_component_init_regmap() to init regmap handler for the
component.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 64 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..a945defa8b3f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,58 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1070,8 +1122,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 	},
 };
 
+static int fsl_xcvr_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_xcvr *xcvr = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, xcvr->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
 	.name			= "fsl-xcvr-dai",
+	.probe			= fsl_xcvr_component_probe,
+	.controls		= fsl_xcvr_timestamp_ctrls,
+	.num_controls		= ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index dade3945cc0c..0cc7945b1d9f 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,24 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1


