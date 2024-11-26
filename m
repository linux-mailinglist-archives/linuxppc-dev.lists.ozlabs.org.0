Return-Path: <linuxppc-dev+bounces-3569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33A9D96BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 12:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyLcW55ZHz2xgp;
	Tue, 26 Nov 2024 22:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732622139;
	cv=pass; b=RZRPXlflNdsJSbrQZw/fAv8nTzDAEDhjbTNj/Fe4hPRLyW5mGSJ/HhwqSOoTxiSizjgr6Rq5O6DmV/uZ0qBEO3hiUXequNmmJtfkK6J4pHGeAqfiXz6sBz62KDeIw9ZRhKwgJ+SRqq9LdDRVOJxQfINdHafrsBRO9opdFzpnMvtEHmw0t90xhMo/HrTG/vNjqok+e3P80Q3IsfhMfovxjKc5ZRmNcg2HfIUk+tdSpfEY5abaFFJKrRNiigIVzrhuysVrEFMU2biSopxsbhHYWGK31l8prLk+Sek8kYpucxaCQ8uwAvXdIE8peK00iL819OVlbs/b0SZZZK6oi8k2UA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732622139; c=relaxed/relaxed;
	bh=cA3iiFuck9njuehzcbwLC24MKtMs0Ec5b9ZKlQYY8fA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U2qv6FMbmtMy3RPMrIJH3N6i6PhPOASB6bdnX3EC0QRFqhcDrIK3EGhOlFR1NGUs1HZPJnLOo+i02FvDB9O3VictapTHW+VpQO0t6E6mEUadmBDZ9oDcwyWccViWpJBIMYlGaNztELBTrclQ3fheO6f0e3sy8fD/0Da/m5gwpi+mBffYAP76HNwnhlaMaR5F0JQKbFpE6WFOcvuLF66qEmcY7qxek3H37jyBFdZg0B/dBHQLLehgC1icRDR14LMQE9TiZ2OcyzyFoUthvLl2P2Y/R4nzky9/jf7s1+nq4+IxOfpR/o0wybXU87GKJyTAPcBo8HHWEVKXPw6rTvgIFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WLGW5jjv; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WLGW5jjv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyLcV1Rkpz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 22:55:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDIAlEtY8bM5YEcDYKkaZT0W5kKtwSt9EUwbVC4xjolzxWepVMLJWPozAP74Ol5x8S9AcsWS007sOU15jypzsKZ/Y0eJ0lIj7sEhS4O1H+L1prxocOpnmJ7ZJyfffZc6jr83YG4Bix8kvBe2mAJCsl3K4pApFSD5iT8vZGkkRH/IeD3iHOqpbu7BJn2VM2e4J8Q8OypLHOdel5gq3N2/UO99mGmXUUoAI3oGIn8nqv9DwiFrLjw4u0CpFJblUO8UBvXlTMhikPWa2l6BuKrRVTW8TPfat5yW/PUM3pIl/lQ8udCTEFDL53WG7IxJFQH41bSAH2PgqrflLPYrLWPF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA3iiFuck9njuehzcbwLC24MKtMs0Ec5b9ZKlQYY8fA=;
 b=YMXjokwQH4UYvG8iUX0D5im+DL3psgvPeOWfY9kpBe1kWLkV+17nUs4yD5Kck70RU2T0bU13OFBAmkt8k5vjkLinZabwXTMwTkghOM1m1w9AN98QbbPlb43QLSooTQCbJ7Sms4OEyaBIFjzQVeH7OchrWZwFh/HEvsDbcC/Gfm7PmPkcanPF+0ElqJbI1G0fnXi03yjNkLcztmNeUQWUN8aHHv55D700XiVAIBtwkvdtSKz3izgqFT3YS7Z05tTq2ri46rtgUiCLaJF5jQgEaMMinzckzYz45dJiljTiAhFl6vh5SykQVcmxYGuQODyPd/54oEa7ju31jMWyyIVA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA3iiFuck9njuehzcbwLC24MKtMs0Ec5b9ZKlQYY8fA=;
 b=WLGW5jjv9V67ZM0IlmjLkGdWq6XH5wfrEQ6ogIyCDiGTKfO9piAfKkVMo4Qj7ip+/ls5oa1/Xu0UAZ2pDdBqhYLHyrZ6WGEu8hj8hOBy96vawZ3Y4k1pXxVOmMaYKaKDMk7Ek8nlcCaOBpLKSyzfr/MpI/hAHac6fEXUBbMpMD2ar1hlGzj1QiL0JkXeUjeFjAnTMv5jrYTiR3Vzfy5mcRRc1FqHnliXyjkBFSTFTmumXASwabB80WVKZK9ajXlHqJ+FKbu8DARE9N6tBg41LZO2r0Tonp0jgyhO1uBTBFLECdM6/1G0yaWD2/IdO2mMmw02D0uhFUDNeB5x+1PlaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8504.eurprd04.prod.outlook.com (2603:10a6:10:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:55:13 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:55:13 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 0/4] Add function to constrain rates
Date: Tue, 26 Nov 2024 20:54:36 +0900
Message-ID: <20241126115440.3929061-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6e38ea-77ed-42bb-f834-08dd0e112f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wQ3vzAGvQm8k1XdH4icwUCfBo7JIcKn3WOlfO8vLHn9RsGv6RJSulsOGk9Mh?=
 =?us-ascii?Q?fO6gGbdaeaxhDzSJ/hzeIpQKA5yz+uHpcfl6uie1jou09RqPP7sGc76Joza2?=
 =?us-ascii?Q?DqQl9ni3o6XQEhlqA+xtRl0rcboQb7hwxoDtTc/Uvn9bGTc54l7YC3bKxNiL?=
 =?us-ascii?Q?fW8OcU76A6RKu/B9NJcn9R+N1+ap2wJijPLAdRmgPi9oDbVO3AKfr3VWMz2W?=
 =?us-ascii?Q?SajSCKhzz3ZGXHC1VWOtk+RWDsLcw5mbEaUe/e4D0YHa25X+y61BMjVJVZP5?=
 =?us-ascii?Q?ql0MEnkhVWIZZdm5gumaF09uXFmu5cCGVa28dmmmTU+ay5xkVHHudwakVTW7?=
 =?us-ascii?Q?6myNgpZt39X9RXtKUaRAV4NAwNg1YB3TP+LNAOGjsmtAwLMBFxmvVFkgTuVZ?=
 =?us-ascii?Q?gB9IkZ7b1yNomGM0fB0IWWiBEVZKUwHonJ+Y2KDbQyaPr4Apff9JLjAI5MLs?=
 =?us-ascii?Q?/LLR9qKMTB64htyI4/fUze6E5zfqN2xKQKLOlok/vWZ1Q5TNfuVu+Z/qggOh?=
 =?us-ascii?Q?XPKbPDfqJlb+TVuE0qq9o544lTm76TpjceA7vW7nFGZjpXayKo1h8i5Vq7YS?=
 =?us-ascii?Q?ASjeRFKGl0LkK/xHCAtdZ1/6b699TxDtZYfM19yoyncwyHMfYRwYTlKw4X8a?=
 =?us-ascii?Q?v5KWdkuHdjUk1tYBa8FbjrLQUCtRRNbWkAx5QBouJxNKEgjHKzj1WCbj4QAX?=
 =?us-ascii?Q?JUHy5RS+VsRjCusHGjaANyM+3oL+K6y4l3X0PPU9sAhnNjjyOCAWDqr+T0qm?=
 =?us-ascii?Q?Shil78zIhCs61SWHCVsIvVgw/BbrLu/HievQBsAi4XBGts2GU9iSWJpUjGs9?=
 =?us-ascii?Q?iOawtOFXV3QufcMWftKYqQ9UpBd7zqIsj/8WAZKICHkK3XGxPRmE0HeBhFis?=
 =?us-ascii?Q?v4EiFkDmvIoqmgPxQrN7o7lEAUpNk+87uSvocf/hvlOkTgxQVRHHGNK8E4S7?=
 =?us-ascii?Q?FTa9/EWn+7mo7+rBVTgAlthXZ2Tze5k3uiF+4bNgGh/6UMpO5KESF8WF3VoZ?=
 =?us-ascii?Q?Go1NyvCJaS57Rrvhv6IY74T+8j/4HUm/QKy2boHE/y+LSs2uFnYJK4rT3wRd?=
 =?us-ascii?Q?dzQsRWHKN++AJbqQDWXmw3u1FFMYoig+VYWkqCI653GpNGNnKGQniQVN0jbG?=
 =?us-ascii?Q?Rqh/yUuVR7lrlh6bD4FWO9xv5o9u7OTMywszJrN2PKgJe206U2abFStExnTg?=
 =?us-ascii?Q?APLKkl5Pu8+NgWWQ2u4S+L/V2md9DMr4tH775qIuIE+nh6nV1056QC7d7JRU?=
 =?us-ascii?Q?tT/QK+Pks6a7YrAOl7+3H7pKo2zVe38+1va9GrrziTshXrEPlC3PZxfv8zHa?=
 =?us-ascii?Q?m4C6XNHWQn9BPxp+O2lHBvRAJLTNJonMZYy6Iq8+XGAQX2bI4XuMqmMmnud4?=
 =?us-ascii?Q?oKZvz70GzpMsBpcwE3+v+5TsMotpYU55tf1zCjU9giobwsiJKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vX0y3jtAeel7V/efau3oWVeOM/Op1Dv1J8Ny8ECC60HlUCLAhHfpRU6g70Eb?=
 =?us-ascii?Q?JZf11SOoxBkPC5LhdJRCQumoY4y+H1a4cpqAB8PWGHsZPaBO09WAbSYLMNo8?=
 =?us-ascii?Q?FalMGpZo24tsJmnhLmSErT/vVWyVDyQI6CefPqWUSbLQTvzFGYgM3X28pVQO?=
 =?us-ascii?Q?yjJha6aZq1zhrnjg0BLahBYnh82d0atZU46wQUsekiXshaqDQxdibcMsE67w?=
 =?us-ascii?Q?soNxLvcfuZC8rQPlLqG4eh8a5LbyBGzEvxEYhwMQhQG4EeZGrw/rqgg9+tGS?=
 =?us-ascii?Q?shYxnkBu9VphWL/ujJXdFnV8SaMKwm6WSp8NsyoSmQwAwohEFfowOVW1vGkm?=
 =?us-ascii?Q?d6BcQ4lFzfLCPkCA9HFvQHFE0V/De1pf6uy56Q6YBgPxZPRs3zV8GAvm327F?=
 =?us-ascii?Q?9LPOHA0GcJvAEghPSha1SJfL16xowNdIR4lovfTthXiIIvgN7jBgVddK/1mk?=
 =?us-ascii?Q?VjoazbzXnVBVUomBFSglk1WA8m5KtMIrISuXL1LSJff+H/++X/Q0Rc19oauK?=
 =?us-ascii?Q?Posk1BsPoK2hOHk1/1QF+ONCF4kqpiuwbEi633I4XSJNAmQIWfoDUgSsCK9/?=
 =?us-ascii?Q?nUI0kP6M/z6Z9FYbTARNzwSt8OLYZ79Kg6QvKDmMCET4IGd/DjHziFFZG+yM?=
 =?us-ascii?Q?km2AnCeyNkOqnz4UEWU1nec1YR/TJa5oC9nfyWaXZAY2BdBVgVFoiAuhxLF0?=
 =?us-ascii?Q?l7Blr1FzWarVXeZ1RG6LRjIkzk0GJua3NtpuoufMOyGeBjByEFTZwKQWuLh4?=
 =?us-ascii?Q?3xxuYSdPjA1p58rvWIfrlPAPeWQ+UGubM6bh7h2EtJ3qrVbS6cadlJUUmwtL?=
 =?us-ascii?Q?evUIYYyhVNjrroQEookWHlG4euirdsbCeDDf34floCiFFj0BN9HHfMII9NLS?=
 =?us-ascii?Q?o8d933yCUQ5ata+NAbx9W/skLg7+PMs91Qjmp/w2DHFxvlhpC0J0inquE5Vo?=
 =?us-ascii?Q?8gldq/qh49t3JQEuilUlU0+yRAfDJbGEZO5CJ8qUsBBGvtxL+LmI5lAmM+Mq?=
 =?us-ascii?Q?OUAU32PHbPXdT07EEJytfWQycw+sV+Hn8sUs9DCyBFWBKBWFQIGjoR3Gmlef?=
 =?us-ascii?Q?oOMet699T6sOrw4BLaVHE4f7oYINkGizY4NQXPYcpCtAJgDCZhEVIXhuifyn?=
 =?us-ascii?Q?jCT0QmXOH6Hlf8P84UA2vk6HGpiXdWapieyGMTEbVyul03WDXbDOWJrkYi2j?=
 =?us-ascii?Q?YAXOQJ5fnVvEPi5gpWyOZQYmseb4M7vy7MdAqpeFf/7o4mAzzKfkG2eOX47O?=
 =?us-ascii?Q?goBoM3cqk8M4xEsVXYe3MM3h5xXPSGQlHvuZAmErmOmS4eqeBFgdtho8sxAw?=
 =?us-ascii?Q?+4JkSbEmkIcDsRjcuW5hq2b1Fq4LCklPVlr16Vymeq5E0tyMRkWwAWRcoCvS?=
 =?us-ascii?Q?x8EpnIASTg/QKLqjRvW5QkUyVPGOhIy+3PDNzp+o2ReUGUzMpm117J+2lZl1?=
 =?us-ascii?Q?Sev/0RmkfFJJtIzpC4S2fzpzHTmdmG3e62Oyt9v0jxLmBjlI2bLafQhbBI5Z?=
 =?us-ascii?Q?Cngyda8gRM5nGmaIXSNbe9FvIzRyNX2CJeALE713+R/WTiaYeTmm7tKExMHf?=
 =?us-ascii?Q?Tz+rc42lVOG0dhRyf1BrP4AXKTl6/WoKTA5davCx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6e38ea-77ed-42bb-f834-08dd0e112f3c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:55:12.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sg/PWaAsrhSR+31gcJGXLT1IMNuQ+m/Z5WgD3MkQkH7FdBsxRRcrI3voVcqcKJyGbKUBBfwIIB1+RY2/OSvEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
not supported. If the PLL source is used for 8kHz series rates, then
11kHz series rates can't be supported. Add common function to constrain
rates according to different clock sources.

In ASoC drivers switch to this new function.

Chancel Liu (4):
  ASoC: fsl_utils: Add function to constrain rates
  ASoC: fsl_micfil: Switch to common sample rate constraint function
  ASoC: fsl_xcvr: Add sample rate constraint
  ASoC: fsl_sai: Add sample rate constraint

 sound/soc/fsl/fsl_micfil.c | 33 ++++++++++++++--------------
 sound/soc/fsl/fsl_sai.c    |  7 +++++-
 sound/soc/fsl/fsl_sai.h    |  3 +++
 sound/soc/fsl/fsl_utils.c  | 45 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h  |  5 +++++
 sound/soc/fsl/fsl_xcvr.c   | 20 +++++++++++++++--
 6 files changed, 93 insertions(+), 20 deletions(-)

--
2.46.2


