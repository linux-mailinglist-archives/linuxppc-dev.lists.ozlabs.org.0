Return-Path: <linuxppc-dev+bounces-6862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32028A5B8B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:56:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgY2pfqz3bm3;
	Tue, 11 Mar 2025 16:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672585;
	cv=pass; b=Vv6n7Y6dLA0xUx2sAruj74EdPq4b79VCgvbRMFt/wsR7f+JuoNmiQyWXGZuwGAoC0I4ionZvOp3xQwAGPFwDAke78U1t2VZefs3QOVgsNI9ow9QGP7axA/1da/ujE3VTsCeRDvvNoU2z4tfKGqQHXD82ROe/VL32tvEYnjerL0Jg0JR6j8eFOtDm8XNHuq/22eUXEZ+N3wHc2b0Vc3iLohjyUIzBfX1arEKZ81Pz44Uns5RL46EPrxe9dBfOPYisQd3tTFxfyFaaceOQIYxXlsRdtXoLPZZ8v5IerRMEXMZ1PyYqQMGH7LmYSvB2ljWQKrFQjgJFaNRH/5CGuFBaQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672585; c=relaxed/relaxed;
	bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4G89gIKOKELIWl/2GvYoSQ159yLbur37Mtrb6VBVm0JGZnzZArQR9xwYO6JxmFgSIsPLyLPQZAMbzdRG7vefNSI2zj6Aag/QqA1BeiBRPQJvHzxAA2FkF0H7/EKtQ3BkRLGW4xGtkzTFn8e095t5Y6au5iVNMuOB4dSpLvaVoupkCUOcHlCv83mZ9LPs5dfRdjtgfhqYxwZ3IeAxNRL0IkFp1pWxsRit6QTwemPaHl51S3QknH1p02OT2ckY51Qn8JArSvKEPheSGStQY5UB/zplZ9bgWD2wVm0ASdjIX2yaUYYRxyQ7w/DXPSZu+3hoztFwF/J/niFGyurhi8UwQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=md/aCscd; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=md/aCscd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgW616Jz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umppbLZRsZwNQ6ZB8nzwwxOtyH/JQxUEn9WlyAbiuwOks/6DSM7nMFKMxSz5+1oruTHpvU8zeT1+wY4f1EtHKE3YAcDduZZDZj89Dbia14xGf4bHfLzcZ4oayCRqdx9u6RmaAwcH3H9XDol3QtRIpXHRzx8I7sI8bkvn9w9LKWkdhlaSH+7o61mPbyIyEWqI6ko/gqQgmlT4u0MASckkKGZmnOIeT7CFGylYQAGBOCKJ5IMLVrefV/QxyWvkXqO+1bF7Mg4KlsUQ0fFLcdhOU3tcclWaTxKIog03AXsTl10TQJr+99DPAfrXuiewTm9VTCPubh6yVu9f2ef6iPGp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
 b=J2KiTSZix89J0isdo0cunaJNEDNqq3ecQ7ZdgzbvvWM0asheTlgPRr02McNrUD7YeNmXSv3dpiFM+oOOsfeEPDTVvedGNLxv9Xnrc/b873V9+VisUDhPLyt/Uw4zeTWe6CTbtondrC0eTPGB0Ly1UHu0rMdh0yFcU4eFJRX5yaujvMO6VL5P1nkNxo1o5pTXcrpkDpLXanoCN6SBBdrVgv5dnquEP1MZQOiGvpqIXKLrrMMi7Ei5I7SmOXOAL01NN2yKqezoY+j1aIoJdkDuARlQ9MnRXqKm+ET5l7I4fxNytBR+NktUTA9tHXRpQbsZAr/K1f65XX91XSxwU9mMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
 b=md/aCscdtbdrHApgDyZbAheofH2ydKGpBEryCHpLxO9GiWRB2jwbNbTarGm1VrIk8Alh608016wMGCxOSAkAGFmMPsXmc8ggv4/4lalhnu9hOQf1vGni7voOW1ZDb/GVooo+EGz/QwaJvD28GodyWHRZerDdmnBzko66R/HJcxBShW0HFU/PPJAqspVqnUJyzDAfoS8ZH8HV3a2zZLlupyaAK33aqA510IpY24f7xGVchBfJlvm2yxTBLMnQ9XSPZlhGWxjRbY43b/jJLqJlaYBog0iREiCO97EdMkNhyIt0FHST7I1CsPYux+83j3sOXXsKjv8hH77x+LuWEPGZyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:13 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:13 +0000
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
Subject: [PATCH v4 net-next 02/14] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Tue, 11 Mar 2025 13:38:18 +0800
Message-Id: <20250311053830.1516523-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: d1367b58-4652-43c6-5128-08dd60616e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d1UjrwJ15uCt2nDcZ10VroOBgwaEkagLeyjlkEiBDsLygo1IJcgymPNIQJdI?=
 =?us-ascii?Q?Qn2DHZnr6zMK1vihSpa8zryz1VlKP6Wvqm32Nrmiuy2d9YtownHDHq097p0F?=
 =?us-ascii?Q?n5OWB1YgEuWzbjjxv7sgweHf2t2OYc4D3uz+1ED1VzipKachWutP2TOHMK1Y?=
 =?us-ascii?Q?DyM42Cw3c8nwMZYtXxOD6ryb00QWPTXEcRi0NWMaAhG8Oj7bWs9VuKuAWJFT?=
 =?us-ascii?Q?bFKLb4oybfmF//eIWEVME/cbLdaSxlLTcSp8GomTp//U4Da+dXuh9NNdPLbh?=
 =?us-ascii?Q?R3lNnZ2lBizEMQ2oqmErYX0ew19xkFxXb91JvdLmdlOKz9rSKX/qdSszp3pP?=
 =?us-ascii?Q?NM6zQX23Rh+PmZV+JlJZUxxsLUtZkBVN3xyugKfLlj1R9AG97rnme/Ht61Vp?=
 =?us-ascii?Q?YTWVyvGG+OttYtCM9IJvL7FPQgeYpkd/kXuHfGLcp0V9x0u07Qht7Xt0PshT?=
 =?us-ascii?Q?rYp95lgFwTblAW/MPBO0qcaHAeHFy67t3eCCGn7ujYZkxTg9DQN0gqTKiqm5?=
 =?us-ascii?Q?pUzHHQL5dI+EoGWtR12NuwqnJs55duF8B2nmodqnwzz/+Qe1bM5b4nyPyffL?=
 =?us-ascii?Q?P1qLuV4GzqhdKHUP83RGcFr95I9xKWS0V2cKhBlj2IGpbf3a+sRAOXcLozXa?=
 =?us-ascii?Q?ldOdnxjfCNYlD1sUxXDbI3HiNUa9Bx5EuHilHOw6/8EXd5GGWhc2rU5RAW0p?=
 =?us-ascii?Q?Nlb+f2ZA/oiNzPUy/Hc2bkBcXc9sQVcCM+I5lV3lrO33lMlO0u2M1/c5hwQZ?=
 =?us-ascii?Q?xhwkTYfwPF5JZplRbo2M60ooInWxG5vINFIxkJjCX9SpX4dB8plVWWGjWURN?=
 =?us-ascii?Q?mzn9IVr0eJEX1yRi7EttC8LN4mNz4di6dktHQei5S90CkS48+15vK2EqybLz?=
 =?us-ascii?Q?gtgN/KK7KS5kNkweT6Fwn6lXjlVSXkmcRUiNu5u+DyrR7DK7GbbkCGAVZvlF?=
 =?us-ascii?Q?Xn6rOIskgJW8SQ5dx+oOA2TM9QNjAysLyOuvsrCbqAZPq2MxB7l4L2SJO0PW?=
 =?us-ascii?Q?vCgCtVMjuJZKY0IihyeqbCI5vA80ILI8O/v/M4cZzefv6eCOPeqgDbY8l7Kp?=
 =?us-ascii?Q?yyPirm0cgOqoTU3wdU1b1B2KYiuhnj/5HNvmEAVgZpEobB+fWQa7u1SQoAW/?=
 =?us-ascii?Q?oL9PI9Liz7HnOJta34ZhKhepNdvjE0gCnwvdDMY16GYAmrXyqnLcjteFWpqC?=
 =?us-ascii?Q?3E45i68q7HAMPRwfqIWD+d7wZmEKjEdxyrE3gN16GOPherykWUD5uQi9x+Nn?=
 =?us-ascii?Q?ReQUxlhpNgEpm6AT6tWr2kmoRqxtFqUnQISFV5G6LwlCOIu6KQP9bHWe6bif?=
 =?us-ascii?Q?M7chDx22bMRwhPTjr3s/c0eLEQXwg7vpVpQMVcYeSQ/lljjeublmk28ZXzrI?=
 =?us-ascii?Q?Wup1vA5IXJ4l0iCezinSfCs0dINroUsG5AVs5bU9xNgp1g3CvjcfDd5obois?=
 =?us-ascii?Q?r6FKQ5U/jBfadZ2nGOGqLZz2SxeQObIw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vjneFSht9x08VFS4hufNykgUsCBjrr5zQG5Fok9pTXBUWjPn+pMF+okQgjHm?=
 =?us-ascii?Q?I+1CQ8zNtT/XYt8N/FQiJPvoW5jaOTu901SdKog3M5bQ3Hwvx0ECYR6sr3yq?=
 =?us-ascii?Q?LfCk/aEjDl4l0hcGMlZRgGUXWgVSihaVgS+IIKdSBOFXoyuM7AbBgLsCe67d?=
 =?us-ascii?Q?6M5XbotH9w3z5qfkj0d8CsPN4vNtuZ11omdPH3Gwl2FMa+dHfy1Ug9F+D6CE?=
 =?us-ascii?Q?i/jiVuUpGCOyADY02L17Vg+21euFmNZFILTm5JTDSFvevLufBsREBhPafcfk?=
 =?us-ascii?Q?OlNzp8zFyP36IzxfeNbQkMacIIv9PUm73d0kuXtQe09vyzMppfntitrvGPT/?=
 =?us-ascii?Q?91lJUYGuVqoFpMRsjmQfzzRWwpGV68uYWQpC3HGdXUKTG3eL+SKT1KH7rsrT?=
 =?us-ascii?Q?uiSAiO1sENajq9iT7CehSaULEjr2oDu3zExmH63TsP9u/H4hW5RJgn1ycARk?=
 =?us-ascii?Q?HoXie4r0+fFz1h7mQqHMGhZDBtX8BLvbhzlCcAqIMdW03HTnpIIFKfJDIkoW?=
 =?us-ascii?Q?LD/wWOEKaZQ1TlgMnIYwwRWKlxJPgNpuDSX9g+aWl8vrJ8jf5MJJv8jbbNNa?=
 =?us-ascii?Q?XUMoAMQIEQE7/vnZKr9cq/STBRs9lfQ3xgmcayuP0CuOtwcYUuXQ7mJZTU1o?=
 =?us-ascii?Q?MEGg84t/p1I+6snqTMd+ytqkuhEIYVhkvCL95ccz6Dy/rmPWrSoWvOKYw94/?=
 =?us-ascii?Q?ZTRLaTL9Y4gyhGXtWUMmQNVOYgC4lIntrjR29mHpaSf3sx4euP+4YVXwKJ9/?=
 =?us-ascii?Q?gYO3ewN3zlwW9m41jcosOcb3Fl+D9icqpUN18NzbyTdx4wOrZBPbcP/IMr6i?=
 =?us-ascii?Q?9xlJB2/pjzA7WkW3XiesnD9srAEfp1K7HIJFS/8CgYOhj14KocvFX+YrVz0H?=
 =?us-ascii?Q?sAR/tcojSbnMuGT5pZaPvrTQhA7MVASAAgdtZYP8PwQZpgLkNEqXRngFl9L5?=
 =?us-ascii?Q?mp/cx0t4o2ezd4dFopTFgvI34QktICS89Vby9DNyrRYF2WuesfAK9izEVRk0?=
 =?us-ascii?Q?YlebHr5+Q4e44muzq8FJsqnbrKd7maWo4IK+ESolLd/jIHmWhwlrfcvsYTU6?=
 =?us-ascii?Q?BSnspv5CTD/pUAnH27FSHATMEHgfgSWZCK2iGnLrfK5ZELyx1C7e/m7ySGWg?=
 =?us-ascii?Q?Ldf2TudPS4WvpkJNo8wdl5IJ5eIAUm720GPZIZ6mPGMeLj/Rtl3RCWEjk9+u?=
 =?us-ascii?Q?MVCxuegPQ5q0eyT3NyRtCitDwKCxYiuIEnDy5Itx6Mbxuj/rBLDF3J+Ac3Ws?=
 =?us-ascii?Q?SvlOj2RLnGmUv4MMx9sGnwZd//VAT3bcUdWvp3zGcW8XrfNN0LylfIufJDET?=
 =?us-ascii?Q?SqKiWtkdrwHH5kcj7lB9UXJYgTkay2phE4HfwAFLwmNKpCTHlLwA9UKLfh8D?=
 =?us-ascii?Q?/TsTqlPrWGiR7K7naxiGVriGlI1wt21aXcpX3Mr41UBnuNh7QPm6l4612Jic?=
 =?us-ascii?Q?Dh1Vd+XV0NdcCWrR/EvL2liCNNRBeXR6XAaTW+D0nGHxBvZu3La1Qi4uIram?=
 =?us-ascii?Q?wOAAJPVtotaanXj7qRKw3UbUjIa3feL8UdchJkNpUwuiJ0LoB/f5U6sPUusL?=
 =?us-ascii?Q?nOj0SP7ZFwFSXhUImgqnNjXsIN2JaDscbpPwdmYK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1367b58-4652-43c6-5128-08dd60616e2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:13.7069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/OpnJU7G+XSO6vdfD/CCDQPNLMCt1H261+A7+2yL8y+pej1tt1KVnecYn6WBjmHm8yUt66GG0kvslwMfKNexQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. In order to
ensure driver compatibility, struct enetc_si_ops is introduced. This
structure defines some hooks shared by VSI and PSI. Different hardware
driver will register different hooks, For example, setup_cbdr() is used
to initialize the command BD ring, and teardown_cbdr() is used to free
the command BD ring.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  | 27 +++++++--
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 47 +++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 55 +++++++++++++++++--
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 +++--
 .../net/ethernet/freescale/enetc/enetc_vf.c   | 13 +++--
 5 files changed, 136 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..4ff0957e69be 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -266,6 +267,19 @@ struct enetc_platform_info {
 	const struct enetc_drvdata *data;
 };
 
+struct enetc_si;
+
+/*
+ * This structure defines the some common hooks for ENETC PSI and VSI.
+ * In addition, since VSI only uses the struct enetc_si as its private
+ * driver data, so this structure also define some hooks specifically
+ * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
+ */
+struct enetc_si_ops {
+	int (*setup_cbdr)(struct enetc_si *si);
+	void (*teardown_cbdr)(struct enetc_si *si);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
@@ -274,7 +288,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_priv ntmp; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +301,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -490,9 +508,10 @@ void enetc_mm_link_state_update(struct enetc_ndev_priv *priv, bool link);
 void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 
 /* control buffer descriptor ring (CBDR) */
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr);
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc_setup_cbdr(struct enetc_si *si);
+void enetc_teardown_cbdr(struct enetc_si *si);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 73ac8c6afb3a..63001379f0a0 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,23 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_priv(struct enetc_si *si)
+{
+	struct ntmp_priv *ntmp = &si->ntmp;
+
+	ntmp->dev_type = NETC_DEV_ENETC;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&ntmp->cbdrs.tbl, 0, sizeof(ntmp->cbdrs.tbl));
+
+	return si->ops->setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_priv(struct enetc_si *si)
+{
+	si->ops->teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +289,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_priv(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_priv(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -688,6 +716,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.setup_cbdr = enetc4_setup_cbdr,
+	.teardown_cbdr = enetc4_teardown_cbdr,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -712,6 +745,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
@@ -728,14 +762,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..4e5125331d7b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -3,10 +3,12 @@
 
 #include "enetc.h"
 
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr)
+int enetc_setup_cbdr(struct enetc_si *si)
 {
-	int size = bd_count * sizeof(struct enetc_cbd);
+	int size = ENETC_CBDR_DEFAULT_SIZE * sizeof(struct enetc_cbd);
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
 
 	cbdr->bd_base = dma_alloc_coherent(dev, size, &cbdr->bd_dma_base,
 					   GFP_KERNEL);
@@ -23,7 +25,7 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 	cbdr->next_to_clean = 0;
 	cbdr->next_to_use = 0;
 	cbdr->dma_dev = dev;
-	cbdr->bd_count = bd_count;
+	cbdr->bd_count = ENETC_CBDR_DEFAULT_SIZE;
 
 	cbdr->pir = hw->reg + ENETC_SICBDRPIR;
 	cbdr->cir = hw->reg + ENETC_SICBDRCIR;
@@ -46,13 +48,45 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 }
 EXPORT_SYMBOL_GPL(enetc_setup_cbdr);
 
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
+int enetc4_setup_cbdr(struct enetc_si *si)
 {
-	int size = cbdr->bd_count * sizeof(struct enetc_cbd);
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	cbdrs->cbdr_num = 1;
+	cbdrs->cbdr_size = NETC_CBDR_BD_NUM;
+	cbdrs->dma_dev = dev;
+	cbdrs->ring = devm_kcalloc(dev, cbdrs->cbdr_num,
+				   sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!cbdrs->ring)
+		return -ENOMEM;
+
+	/* set CBDR cache attributes */
+	enetc_wr(hw, ENETC_SICAR2,
+		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return netc_setup_cbdr(dev, cbdrs->cbdr_size, &regs, cbdrs->ring);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc_teardown_cbdr(struct enetc_si *si)
+{
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	int size;
 
 	/* disable ring */
 	enetc_wr_reg(cbdr->mr, 0);
 
+	size = cbdr->bd_count * sizeof(struct enetc_cbd);
 	dma_free_coherent(cbdr->dma_dev, size, cbdr->bd_base,
 			  cbdr->bd_dma_base);
 	cbdr->bd_base = NULL;
@@ -60,6 +94,15 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+
+	netc_teardown_cbdr(cbdrs->dma_dev, cbdrs->ring);
+	cbdrs->dma_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..a214749a4af6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -939,6 +939,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -957,6 +962,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
+	si->ops = &enetc_psi_ops;
 	si->revision = enetc_get_ip_revision(&si->hw);
 	err = enetc_get_driver_data(si);
 	if (err) {
@@ -964,8 +970,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
-	err = enetc_setup_cbdr(&pdev->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto out_pci_remove;
 
@@ -984,7 +989,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	return si;
 
 out_teardown_cbdr:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 out_pci_remove:
 	enetc_pci_remove(pdev);
 out:
@@ -995,7 +1000,7 @@ static void enetc_psi_destroy(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
 
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 	enetc_pci_remove(pdev);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..d7d9a720069b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static int enetc_vf_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *ent)
 {
@@ -176,6 +181,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
+	si->ops = &enetc_vsi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err_probe(&pdev->dev, err,
@@ -198,8 +204,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	enetc_init_si_rings_params(priv);
 
-	err = enetc_setup_cbdr(priv->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto err_setup_cbdr;
 
@@ -235,7 +240,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 err_alloc_msix:
 	enetc_free_si_resources(priv);
 err_alloc_si_res:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 err_setup_cbdr:
 	si->ndev = NULL;
 	free_netdev(ndev);
@@ -256,7 +261,7 @@ static void enetc_vf_remove(struct pci_dev *pdev)
 	enetc_free_msix(priv);
 
 	enetc_free_si_resources(priv);
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 
 	free_netdev(si->ndev);
 
-- 
2.34.1


