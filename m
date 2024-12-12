Return-Path: <linuxppc-dev+bounces-4029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E822A9EE07A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 08:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y84KP4PxLz2yP8;
	Thu, 12 Dec 2024 18:46:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733989577;
	cv=pass; b=Lmfpjy8xH880XUzfgz5uPzSh76aJjubkBrhEHmWIM0G2r63v8fOyOqzEJcmYVTpAZ/UUjLb2Y1RDWnXHWThpKpj347ozE3vNKHhQiEk6gAEu5vKHidcxGszVJtKZ1piyM/gEUCss4tc8iZ9fGJ0Fw/TNB3lWU/OBQix/Y5AzNtu5ncL0K91JgVjToUC15qgNXG4IibVxjGI5PNYpJrQWlqflxNWZVJ1w7CbTyKP0CiI7IL0bpOas5HEetng0IBMJLCWxPqft+zl5E00O7khuLSb1N6HXY1Nn24JmiFC6vewFNGw1FAmmCE9TJH87Fp72a/j5lJb+YYO75/vmOqUMwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733989577; c=relaxed/relaxed;
	bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ynzyvc0mfeUsejfrUCAI4+r9LPhBq7uvoIAyZvPVwOizWq/dePvJiRkNTxr1tteKV6/OVQzey/cYNQNtPXQbvzX744IMUUs7SmLUodzPTjv9wlyUDlTnSwNoDqDRPNe8qajBHMiPiOH4PE/GOM12qw2+c06SwvqUtufFzFUbwj9gB8xckE4CVSpZoEr1NW+kjKzgG2pnfIWC4jSbCnYO2wZrmqeEarl3K24nBdFcQ1SEAmVcp51Gwz/rXam3nDekotta/Po0bVRuYUwghMgq9uqYrGemVg40qKgk39qZW9mKniUWusc7KeBOR3LSuhHEXmIFWkEHiqJ5qu2Bb/1zxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RxfEFCCH; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RxfEFCCH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y84KN4x1Yz30Tw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 18:46:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/AYmZm+3S6qkDFY1E5d8N3Nk4NZ+X5AKHdCX01qNMmuw1ncFvnztl1NKVvNFhth9uShTsKU4vQ7YB3mg6UsXS6pIUsfkIxBuW76CuyBVdwJYs6ro0PiwB/7tkktGRq5EPDC9OHEoxMliNiYRC0Rv1J5pwvoVySxxYA0f8760QAqkh0YiU/yFXWi844EeU76a+1QqFiLfQ9rF7c6FW/aXiFf1VkRIlag5ZlDmyXCHGCx8TiEjfy1H2bSPgRvtpctLRPxWCEaa/qlZqcRE17BoRP/nBGEuZzOl2QYxs+cZj7hNVlnCfeMz68Y9X8UJBLz4Tss5Z3R+edkaIgfSr90ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=P8hI3iUyiJo/tYUAFVskPAVYCfZgCYkDeVs+U8NSH6gyGn1aIBFCqOC6BQGDCo3GsB+B6HDkhEXL4I6M+o84GmjlWa1q/J3BA3+bk5SQ20M86JYGh5kFBwAiBDLmP/RII20KbKNG0APPSuzCdITrUZCG52pPT4J38jeRsdajQufy97NeiatCoQNY+GmpTOaalxuqw2fuMe4l6cI5nQumisnvA08ixkcEozGSuiK24DJhtRNPMvPwwcOx2Z80h1GWqnVWe6MkQPfNxKjjSm86chtVKp23gdBwmhNW2hCBDhfyLD8gCpcQ7HWOk1QDq2q0rvGhyBYVNTsgNgN+18NECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=RxfEFCCHnGeK+KJp1yLkNcuxlKvMOrHKe3fg6z49BJxvfJtNdc121TLxOv49L1oiVKEd3kzz5EkR9tPzm25ugojZZKhU39UTavtPx/YzWOyS7ZDDxm579CkE0kvZ1LlkBpU40TENqfn47uo/KpK3Kl89pza1Hu7D4z/+kYH3LurIAsYWhYTFfipEndIlNsOD126//wvOv1SgTFqgQCcaFYLTYIybzN3gv6/q1mucW4/UkMs7YT2WPxylHZeqILn2OMdE7YU9TRYU6PofdzGubKKNbdmHr7eOb3xVxKqCZRy9d2Nrf2D15pqyFYODnoADo35uAuMegB0QTTHM/p+ysQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:46:00 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:46:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 3/6] ASoC: fsl_easrc: define functions for memory to memory usage
Date: Thu, 12 Dec 2024 15:45:06 +0800
Message-Id: <20241212074509.3445859-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 331b3f87-6369-475d-78a1-08dd1a810483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?djoddrgYefiquiSA7vyb4Hl7meHLyyW8lS/CZJ0tzDeJ8vwiQEj4Nj3YXFmc?=
 =?us-ascii?Q?X8cL5FVVgdT0BAo/9N8AAiYov2n7zYWBCjMu+tOElyzU6Wkni5RGreNdhxP+?=
 =?us-ascii?Q?VQxq4jPpwVglKenzdQ8m/ws8y6OwZc5o+A+kZS4BsIvqjdMeuXNzelK0PjG8?=
 =?us-ascii?Q?0K6dimVUkdry6S9PRBlIbIuDY2rtJ3K5HjJJ9QAxDBnWUrRkp4UxtyGoBjB4?=
 =?us-ascii?Q?6nMcj7OcKZv+T50OcAwx6Ze475egH2TQNZ+IJIW1NF+m4JDcKpAbJsnLJVVW?=
 =?us-ascii?Q?q+wnRn4kCnAHNdWfZT4PYBOGSkfBSW/3VFSYlXupR3s7HUnRoaEpSsP3cC+7?=
 =?us-ascii?Q?0UbX1HAkaXmqOUK7Xgyvyk3Mb9RvceRe9UDupRf7Zm+gj63D8A8bFN0Iv4kd?=
 =?us-ascii?Q?e0dXtM5QTPMNCep1AX9GbE71s6UP7GYrM8YRpJsk+owrIgXWJZopQRu3amAt?=
 =?us-ascii?Q?H77y5NBebo1IA+GC8vO9/t4idDGxt23DCsgMGuJHF0dqIMt6I+D4iEY7wn+8?=
 =?us-ascii?Q?0zp9d5jhXGuKqGcYk//hCuM48yBSKPNx2GmvUR4n6x4o1mXPaeJN5YNhzZxK?=
 =?us-ascii?Q?kv7eAjgOaF8ea/R9DaO8rms5rDR+pkvrm858ZBXQ1G4ISYezs6AXG+rRWgZv?=
 =?us-ascii?Q?g+/zjIRAHsCrbZs77asSNYQRZZnVInbC+TCqxL7690DFlPgbEwCjXd+z9iN+?=
 =?us-ascii?Q?g1HdY9Xrr3QciGb+5FFoGnv87dDJCZs1Fc/O6FB7SVK8jvn0yPBUX2tfZ+Wh?=
 =?us-ascii?Q?As+d64huDtWZw0LOOUS1fACnm4OQfVuR4rFwaSxkXq+uTYoaphZT0fG5axNX?=
 =?us-ascii?Q?CqdIIhdNAczF4ZzWJQdli2/hpHt3NnDnCp9C/kWS9Z8Y0SjnQu0TFJYV+pCx?=
 =?us-ascii?Q?YKPaFI6aOKutF0s0c2CpMjjusYP20carnUCkcaItrVjA/Wzv5cpca1g2DQKG?=
 =?us-ascii?Q?HRH7sA8odpKPRq2GKM5pCot6o3SFjMFc2mjIlyLMzXF8xn7IR6Wh5nZp1zPJ?=
 =?us-ascii?Q?9PZg3e8+7VvTWbCvx7QNR0nNzY9gJfGyGMeMmILWeOYwubhhMDJQUsimfq4P?=
 =?us-ascii?Q?vfuIibTpLaGH74J9lp4AOsR4UO/VU+GFCh/znuaDbiXFB1nIfAXxMPwvA7Pw?=
 =?us-ascii?Q?WzVax2swa1nLXqzcoMa6xJnK4gLDCsQXBPdWvszCyzfPXoKMoerQFssnBEOD?=
 =?us-ascii?Q?sScTv/HZwovwODXTETFm3yIpFShE6AkwUBDmQUS7/B0kQ+Uj/Wmt53k2Jd/B?=
 =?us-ascii?Q?l9B39rFlIdVmnhTQycstw7+cO7bnd004x6VbqQSusH/73AwerXdBd6VhZ4Pa?=
 =?us-ascii?Q?f3UgyDwzRb8Omi+pTA3yZhFMaWCcZ+VkNeqHMBB5bU0D/T/hANq6S1u/ZPxC?=
 =?us-ascii?Q?+4n91A+EZWsGMBDvHy3Sogrr+imiEG3ba/w7WTTBY4+nyKbSjWD8Ecpn4EHr?=
 =?us-ascii?Q?NPXjt93Mra4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Atsoz5C5jIwIYjH/uVcXP5LOeEobLHzaLjdgTFFMT+3f3YH6NQIQQRUQEzr?=
 =?us-ascii?Q?fS4HgLIg1Rpa192TXZLAjNkDTEdMTJAp8dokv9R/yrxbG6q7fPwa+rH6C8tg?=
 =?us-ascii?Q?p7ga7A1U70LRsy80tkJrC2nOoDGtvB57Qm6Fgs7hn7rlVdvThCcRA0TKK4Gn?=
 =?us-ascii?Q?4kNQ2tU+pcmp0DlRQKJ1cGtoEQjWq5qHpmKpDU+ysGFzRBTckhF0Hleb2PW6?=
 =?us-ascii?Q?vtOwory9ujqf5hsFTfeIvDo9R6s/ro8DNyRgVE+ZjcfbcbHeKiQFYX+72i55?=
 =?us-ascii?Q?MB+5cDAUyex0EX98nfYJl+Xx+qsqP2I2VD4fT6ZD/kBKwkDySMem0XQxwSJI?=
 =?us-ascii?Q?0VstU9VJqWn6JMFdjhwOm0ctf6aF/UVLzj221Sl4U0C5uFOS6P4WyGHrAmfx?=
 =?us-ascii?Q?Xhhff8ETsHYU4FmEBpm88Xa/aoojVPxde9YUB7N+w9oTSCFpwtxmiK9XVOhu?=
 =?us-ascii?Q?sI82FtMsQe3lpaAesP/Znl4ofRGrlrUXDmmjmqWi2lvbPAbC3andmMSF4SKK?=
 =?us-ascii?Q?7H+jl/p8VDF72Oi/P3vS5AaSzT6W5Ii1nTfRQJ5DEpk/xVUCv+vt8kPBG5Aq?=
 =?us-ascii?Q?1wjKhfPZAp7rha2RnRlwa3iwXoMQyTOYWVJMGds5xm/9US5oqc25/2+m5P/R?=
 =?us-ascii?Q?necxQuiFHC66PlP+c5QUxPmn82YjBtDXyurS37Uearvbtu19+AoqRX5XQnGa?=
 =?us-ascii?Q?Nt980jZ5QzvdhjEjwpK5AnACV95i7KSjQJanyUGmvnDYuVl2ABRalrn8t0qf?=
 =?us-ascii?Q?ybUuPgAKVznpo+MPUpA49J3nUcppG/n0d9RPYHfnEe5muwUwqfIvk7kS7VSd?=
 =?us-ascii?Q?uCvDU3xf+ubQsOoUCSF87qGiros8ulJMmlaIaAfmjjuzu9AmK1bTMI40Fem3?=
 =?us-ascii?Q?SiYkyEJK3ZgnMGrVROsvZmkOr1G6I78/jI/amp15Zllv+gLELnxxTjcXSqki?=
 =?us-ascii?Q?11sVyZg9DSumus15OEra/tWowWmVzDN9SAx5O/CUDaLaKi+dfErsvYDasZen?=
 =?us-ascii?Q?a3s0P93CK00/fr/5yph4/i/p6Xm/5dW9eadMCQjNWtkFap6oQnDT83P/QrqP?=
 =?us-ascii?Q?IgHBUT84Qaji6/W+GqOKGwK+Bzs/xrmHUCr1f26FKrfr1FKWiLw2YE3tUCA+?=
 =?us-ascii?Q?GMCR6mHNeUUtMG61RH8w1yBjtbW8SphO2voqu8htQ7JNL1+IVL3DkJlrwwwA?=
 =?us-ascii?Q?4IX24FG7+1QuMliOZ1Z3AVTDcVFrSRmQM40SBpC5tmbYMPsXx49a1RTYF1YB?=
 =?us-ascii?Q?MfkcwrfsxtuwSij2pgJJw+QSBktKPDw45cLguAneRxISIYNu4CUKt2T+gGSR?=
 =?us-ascii?Q?Z9l4IvGiZoQQpycfhwBPNFJs+C02rfTHzkVawqN35hsVJL499gOGpd+caTcj?=
 =?us-ascii?Q?ZjjvquAMYPNY3GAlHD+A7+Jq6fAaS2zu1eX5RZy4OfNngD0oi/8bkhG3zY0a?=
 =?us-ascii?Q?tNRYxKPFI64cxYNLvtIESNHwKAcJDxDWC9Bn7lzhad6u0xbEvMGuNmQb/HP5?=
 =?us-ascii?Q?AJa2MX9f7r1HqUHiw3cy19mik9bPBFe5NOn8PqWQQZfNdpTDdExbzxqwy9+n?=
 =?us-ascii?Q?seYyfg+NptJ4OaD0s/zsYrCdCm5HIpxFdnDw7VYx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331b3f87-6369-475d-78a1-08dd1a810483
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:46:00.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAgRywn/W+cuFp236G5kOVI67qpZHzt8QNfROd2prdAaYtabmk5ku8qsl+f6T5y8eETmhYStvGusmCdRv5g38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage and export them as function pointer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 228 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h |   4 +
 2 files changed, 232 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index d22f0621c465..f17a185a1910 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1861,6 +1861,224 @@ static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_EASRC_FIFO(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_easrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_EASRC_SFS(index), &val);
+	val &= EASRC_SFS_NSGO_MASK;
+
+	return val >> EASRC_SFS_NSGO_SHIFT;
+}
+
+static int fsl_easrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	ctx_priv->in_params.sample_rate = pair->rate[IN];
+	ctx_priv->in_params.sample_format = pair->sample_format[IN];
+	ctx_priv->out_params.sample_rate = pair->rate[OUT];
+	ctx_priv->out_params.sample_format = pair->sample_format[OUT];
+
+	ctx_priv->in_params.fifo_wtmk = FSL_EASRC_INPUTFIFO_WML;
+	ctx_priv->out_params.fifo_wtmk = FSL_EASRC_OUTPUTFIFO_WML;
+	/* Fill the right half of the re-sampler with zeros */
+	ctx_priv->rs_init_mode = 0x2;
+	/* Zero fill the right half of the prefilter */
+	ctx_priv->pf_init_mode = 0x2;
+
+	ret = fsl_easrc_set_ctx_format(pair,
+				       &ctx_priv->in_params.sample_format,
+				       &ctx_priv->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set context format: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(asrc, pair->index);
+	if (ret) {
+		dev_err(dev, "failed to config context %d\n", ret);
+		return ret;
+	}
+
+	ctx_priv->in_params.iterations = 1;
+	ctx_priv->in_params.group_len = pair->channels;
+	ctx_priv->in_params.access_len = pair->channels;
+	ctx_priv->out_params.iterations = 1;
+	ctx_priv->out_params.group_len = pair->channels;
+	ctx_priv->out_params.access_len = pair->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(pair);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	/* The context start flag */
+	pair->first_convert = 1;
+	return 0;
+}
+
+static int fsl_easrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	/* start context once */
+	if (pair->first_convert) {
+		fsl_easrc_start_context(pair);
+		pair->first_convert = 0;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	/* Stop pair/context */
+	if (!pair->first_convert) {
+		fsl_easrc_stop_context(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	unsigned int in_rate = ctx_priv->in_params.norm_rate;
+	unsigned int out_rate = ctx_priv->out_params.norm_rate;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int in_width, out_width;
+	unsigned int out_length;
+	unsigned int frac_bits;
+	u64 val1, val2;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val1 = (u64)in_rate << frac_bits;
+	do_div(val1, out_rate);
+	val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
+
+	in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
+	out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
+
+	ctx_priv->in_filled_len += input_buffer_length;
+	if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
+		out_length = 0;
+	} else {
+		in_samples = ctx_priv->in_filled_len / (in_width * channels) -
+			     ctx_priv->in_filled_sample;
+
+		/* right shift 12 bit to make ratio in 32bit space */
+		val2 = (u64)in_samples << (frac_bits - 12);
+		val1 = val1 >> 12;
+		do_div(val2, val1);
+		out_samples = val2;
+
+		out_length = out_samples * out_width * channels;
+		ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
+	}
+
+	return out_length;
+}
+
+static int fsl_easrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	if (dir == IN)
+		return ctx_priv->in_params.fifo_wtmk * pair->channels;
+	else
+		return ctx_priv->out_params.fifo_wtmk * pair->channels;
+}
+
+static int fsl_easrc_m2m_pair_suspend(struct fsl_asrc_pair *pair)
+{
+	fsl_easrc_stop_context(pair);
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	pair->first_convert = 1;
+	ctx_priv->in_filled_len = 0;
+
+	return 0;
+}
+
+/* val is Q31 */
+static int fsl_easrc_m2m_set_ratio_mod(struct fsl_asrc_pair *pair, int val)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	unsigned int frac_bits;
+
+	ctx_priv->ratio_mod += val;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= (frac_bits - 31);
+	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_EASRC_FORMATS;
+	cap->fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	cap->rate_in = easrc_rates;
+	cap->rate_in_count = ARRAY_SIZE(easrc_rates);
+	cap->rate_out = easrc_rates;
+	cap->rate_out_count = ARRAY_SIZE(easrc_rates);
+	cap->chan_min = 1;
+	cap->chan_max = 32;
+	return 0;
+}
+
 static const struct of_device_id fsl_easrc_dt_ids[] = {
 	{ .compatible = "fsl,imx8mn-easrc",},
 	{}
@@ -1926,6 +2144,16 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	easrc->release_pair = fsl_easrc_release_context;
 	easrc->get_fifo_addr = fsl_easrc_get_fifo_addr;
 	easrc->pair_priv_size = sizeof(struct fsl_easrc_ctx_priv);
+	easrc->m2m_prepare = fsl_easrc_m2m_prepare;
+	easrc->m2m_start = fsl_easrc_m2m_start;
+	easrc->m2m_stop = fsl_easrc_m2m_stop;
+	easrc->get_output_fifo_size = fsl_easrc_get_output_fifo_size;
+	easrc->m2m_calc_out_len = fsl_easrc_m2m_calc_out_len;
+	easrc->m2m_get_maxburst = fsl_easrc_m2m_get_maxburst;
+	easrc->m2m_pair_suspend = fsl_easrc_m2m_pair_suspend;
+	easrc->m2m_pair_resume = fsl_easrc_m2m_pair_resume;
+	easrc->m2m_set_ratio_mod = fsl_easrc_m2m_set_ratio_mod;
+	easrc->m2m_get_cap = fsl_easrc_m2m_get_cap;
 
 	easrc_priv->rs_num_taps = EASRC_RS_32_TAPS;
 	easrc_priv->const_coeff = 0x3FF0000000000000;
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 7c70dac52713..c9f770862662 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -601,6 +601,8 @@ struct fsl_easrc_slot {
  * @out_missed_sample: sample missed in output
  * @st1_addexp: exponent added for stage1
  * @st2_addexp: exponent added for stage2
+ * @ratio_mod: update ratio
+ * @in_filled_len: input filled length
  */
 struct fsl_easrc_ctx_priv {
 	struct fsl_easrc_io_params in_params;
@@ -618,6 +620,8 @@ struct fsl_easrc_ctx_priv {
 	int out_missed_sample;
 	int st1_addexp;
 	int st2_addexp;
+	int ratio_mod;
+	unsigned int in_filled_len;
 };
 
 /**
-- 
2.34.1


