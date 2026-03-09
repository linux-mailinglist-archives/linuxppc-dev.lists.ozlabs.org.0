Return-Path: <linuxppc-dev+bounces-17883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAIoLjaGrmnKFgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:35:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6823587A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:35:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTr0j2Mflz3cDh;
	Mon, 09 Mar 2026 19:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773045285;
	cv=pass; b=e6MQx8K43DCnhG0FcG/Ov93GndyIIB2FXWmG28Ln8fL7WNfN3L6134WrSqi14pjGoZpFT/hWaueg9+nMBSLSB0AAsb+5leOWcDaX7Dzx1IKnF7KmtgQae8d4148iQkbHcViQcIu7w6vjiDMWBlvX8YJ0d/NhJ/l5GGceEFTMdyFAErMcVLJngBb6B7bPnyJ/urGJjmG/6Zy6f2X1znns8dp/JycCgkKF+wNuPrSPxsV0qK5K5PKRSDh5JK9HF1h4SOdCdPlNlty0sUshHZgqpjcwse/L/G6XOhjYmiFsA1TwnDYs37tyCUwEcVS8gIi+E2ULTOW7AeBwfJFGxheXig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773045285; c=relaxed/relaxed;
	bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dPL2K4NlprcQMkf+8bqtNzM+6ZBRPaz+tYAaLLg9jS+RuLMwARP/Xxe+MTJtZsNvJVabXeE63oGQwRH6buIlleLxG7rlKQsmcXosEBkASEJevdGFgdTifwU2lWHSdxNYxcQIV6wdaeRRgFsYuhs5GfY3JrO3rcYr9MMJ56uulo8jfBdbDJ5Q7PLuwWtStmYi2V+g0oJbWurPYPEobz6PQNuIQfb6tDkny8cFPGbEAZDPytTMYJSDlbrb9CaO2U6cXUwaHwt5D9WGvhaowu5Vnh21hP6gH4gtNiJ8fyUbX3Bmngk50wAg9WH8KpZnDSURKsRcp+gvBskOTslncTJdPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eygA/bi2; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eygA/bi2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTr0h33ngz3cCK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 19:34:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLuF7OM5pecij8yRx29wUNrmrbBleP5sOMqigsB4+5PIod3myHFmFvbhI0lIZAvlQ1zCQzDVsiq3MqYBfpSaIV5qVptlEM6HkVfiIz9XSbpVmm9qOxGkuKRsSnkSd/nMUpJ1SWOgykB7dV/Mp+1AzTVs4wjAreylfgNsIsVX3Zt8WAYCcudMN6CbGWytPSbyKSYZImOf0omF/C3xTnYUjaIDQydEZzwQOSLk+NxpD+kUrDyNy0hua4cO70bhJKa1IxI4o2a+lygTb6UYCHolnrisOHZ52qtYfrghJX5XiiMC1FDDMbRv2NbiNhnq8YvURgHtyJk6PZi5t9kas4Rd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=PspSwXRrGUJDQO8Sy3QMQSM92M59zwPp5C3GiL0umSeHKvvwr18hgdV1IuBWyk+EKSlDM8OspkdR3qblH4os2r2G6XaMwJx5c27BVrhz9cZdFLtvVtyLu0H/cjHLxPuPDroesdYTlsSP8noOsiXtvudev3T0W9NLE5ZiSLf5dui5oj0enzfOLYH2Twg76RRXwkk6pZU3NwpYLuVAoOwtItYfAxG39PgSOo7MuHwVpedKl4HNKEq7TDKvnybbTyQomG/iK2NnV9gxMFwW/aGAh5HDGJKkFwpD1I8U4FiTzLQn4qfZHL04buS8nWWo0JFU5D/LjOG1OIt/hqPj0/Q+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=eygA/bi24tq51tvuVWTKkbLH28qDxgtH70LsOyLq51SaytqeSWYXrN81eW1APPfPybD7r3kKvYBWBI88joDLWt86dMimwIfmU3fIN+WYHPLM37kGWGVePsjssEEdiRtS2fzzG5+Jkwl4+hUttS7b6EoHhi4XuQR85NxxGwRK0MyTDyuEE4tn4ywfoYj/TUR0uXDX6zuRsAp8v3ld64AuGxUba3u9gxY0xjorTcTU7zy94bZ90QlT+fk2Rr1gGhoZtNN6Z817PHPJLtfoJhbG1IMMlc6BxDe1R/XtCmzgQJHg2RAXhcb4Ro61iN6UCkkuSY7Z8GspZi7e9YO/CAgGZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB12235.eurprd04.prod.outlook.com (2603:10a6:800:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 08:34:22 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 08:34:22 +0000
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
Subject: [PATCH v5 2/3] ASoC: fsl_sai: add bitcount and timestamp controls
Date: Mon,  9 Mar 2026 16:35:29 +0800
Message-Id: <20260309083530.2977163-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB12235:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b9d863-c5ee-4488-d8a3-08de7db6aa29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Y8PC5f4VcwkquN3EImks0iNDOeE9B5wPKjZ3M9UGUCLeU55bvKb4NRhHJT4C+1U8EUrZgOngDaVaQZPFiqCe6x32j6aHdEjtSW8lx9iUzAMIX9FncZJ6xSv0vXbkSEEMekyuQ5D72xyBkqQMwQi5r/E0xbj14n2MoSZET4m4Pn4vtG0Tilw7NoPqrbaB12zE8cXesGlmK5a55ghvATJI2aqVMnMw51tkQ9N0wz2ecKuWAFYhQozAdHuThElGyHCjPdKdcvGXxxKXadTmP3RMrWGrhIdD7ljDuMUy1DTMODP4uCyrqtkqTSMZoO3oGR64YqnG2P9XdSgLyFgx6sWKxFMymkuAWIZZNcEbQEwVhN/hCAy50bGrIgqmUrdDwBWxxu7IGlrL4XHnZZbeojEehJgXEHTbob4OSFekaL356i/SU8nH4Lf49hYlLo1OcfSA0k+a8GkrzugyT5BHASHtUJz1v8SuI9hRXdEIf5zIVHG8oMNC9SSFSpoRLeWFkMWbyKdTalFDhQ84/RxydQlGMFDXhFY96eQLSDFbqDIYPwlv+NBQ8Mgow7ymwfkEA3ybolBzYDxWEhePskHS6k4d0DsITRoBlQ9iwNHRfa/8E6LfitgSQm5bT8hbFg5J1PJu03FjUFfWPAMdmNKtkPpWeh7i0nLbC24DNa7wHk+VnRMmqSCcPS0F6RLFj7byu8WOZU2tYydVGQ5lFeOPcp91nXiLrNdTMYjLidFwQ12yFVLve4xIri/Xba42WKFmE6ll/y2pLJVoqMQtnR4EthxrDanYnd9N3+5B91UFqYdUXl5mIM0/kbKisRV6nbCp0XDB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xxDvhBnUFxsG3Zu/vUGsH0sGP12qWZJ2UxM4424KalGRI7eMuKfwdKrFc0rs?=
 =?us-ascii?Q?51IF8bEhh8BhudMD4EhUlioDVpd9UDdSxzD2nvpmb7HeibvpFS/YPcn9ZzWE?=
 =?us-ascii?Q?ktLqc10/NgxqP1VZMK6PV2vuq4gJmqlx8ID0zFcKOq7F37trMAEipYQEydr9?=
 =?us-ascii?Q?HkW1rM/ZQoBZRNvs8TRR7WhUV17e6DjaQZ+Rqgp/tzxMGr25WQNxY1ngbnKx?=
 =?us-ascii?Q?lPB8IQPFtOvIayWj1agy2qNP8aSjggBecxzJRCoojScoYOpsv8d6ivv5sw/k?=
 =?us-ascii?Q?4An3Yvvin0c5OlgNGZq79N9/gmIIQSG8ZUQbCVZOz0WO+J/B8xNu0dzaxnG8?=
 =?us-ascii?Q?1wiLUDThJlKe95r3GBQeW5Q2hZUv5XCbGc27Oy7pcmlZmbevVltYBRmFy766?=
 =?us-ascii?Q?x72YBF6BEKmA7ofri7v3xIWGHEFIIGIiFuBk+eoBTrWEmJXbj7aFSXmMRpNo?=
 =?us-ascii?Q?azxGecBvYfL7TEkB7Pu9kiSvgInfhQqNwj0d75HCD4ZBN86U/jutsTL1Wse0?=
 =?us-ascii?Q?27lRKLcGDYAz0YhHcgcDlQhIOvsLmq8M+FpMd3CIUoB+Ii/Zp6HlT0lxBPyD?=
 =?us-ascii?Q?Ls0R6N9Rvbh1ZDSllcx8XqNBVVNhTrT9894FIQsSHdLb5a6bcG5cYhfF75fG?=
 =?us-ascii?Q?A1IiawSp/XWpP4vLVScECVTCDjBA3wuRihuMglomb1c0Q966a4iSPne4oGmh?=
 =?us-ascii?Q?795euobeFS4Q+3QeupnoXtDGKiPejrpa9XZdVLUa+e+Pa/FLcK614XoLZGKS?=
 =?us-ascii?Q?l9pZLfrqe/SDz3BaXnp7VR4sOr/sxN+4mZ/Pw1Bf7qSJCVlxhurLFK+g+PP4?=
 =?us-ascii?Q?93HK/O3cSGToRnXep1EX1ATcbUxj8l1V1Z10M5iKpsxNLEcixFhOlesZBR9A?=
 =?us-ascii?Q?buPoK0paHLxEYtt8E+CwNmWGdfZSdt08rXdpl64Uu8VogirSiJ7PV6NddiZF?=
 =?us-ascii?Q?A7B04zoSKhaO8QrC1/th7flelzBZ1XtuZd53PbJeyGXu4+AALbeHSk17ctj4?=
 =?us-ascii?Q?/4pm/UzLFm7E+d68B6YmXwtrCVQoUC5DeRTr5GwlHyzeGsubXM3F+FNvZeYl?=
 =?us-ascii?Q?jFnKKUpedE/Del5sIYK/PzsZ8uDRLAK4utZwWy9o4gba8PdamPglvZ+qwFMc?=
 =?us-ascii?Q?GdCT5UOJIfP9KykhttAQhQ8RT81l3zgLGH1zbEZn0kSpH/5us72gPN3jiD4n?=
 =?us-ascii?Q?kZ3HC/Uh4JpSq9ZtKtswHwXv7tNX+CwAjAHjLHFXXxaJMrqAePH2FyrDoHPP?=
 =?us-ascii?Q?CPCq9IXEu1a3e6MbXaSyf5MmOqhbRv+CgDYJ9UADmdgJnMTBMibUEgdieuQJ?=
 =?us-ascii?Q?I4xX/HLn4ya+rvLx6GX/m17wlTzSt5ZgrjfAN14WLqtxGWZQQ6kpZ5Qvp790?=
 =?us-ascii?Q?t8KKb5dRuSpGRxjgmjFpeLd33KFPFUc7P3lDnZHyKz3QnYgpuiExGHbmUcZi?=
 =?us-ascii?Q?ybj+motuqf5v5uh879PitrlcFjbBz/qzeDsza2jnb3I5Y40KMnkNYLY6jZLx?=
 =?us-ascii?Q?Z5XsagH120IELv4nBIz92WRAfjOzAO0NcMysNuk+TZjVIGkEL/5ezO4SYiF9?=
 =?us-ascii?Q?xlcDYyPR1jqLWnJrJmwBOAzDBSLr5w6Tsu+RvBS+s/dfRudB9sBFhgEaPQF+?=
 =?us-ascii?Q?sKmqSF53J+0ox7ldaxKGYVuFNlEpEHENLx5ZkDhYoFYH2JLA6jEio/WgfZT/?=
 =?us-ascii?Q?pP6tM/WdRRxuPIIxMXg0HGSGTbF4R2Zyz+AMUJz4h+WYqJ3BGQESVDLoe4d1?=
 =?us-ascii?Q?JqYq8o4qmQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b9d863-c5ee-4488-d8a3-08de7db6aa29
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:34:22.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkU5dG0R+axPX0uqu9RlK3ojF9q6cUFzZMz9/ZDskgqpJTVSx/QasACN86ZYsFm2pNrxVz8s1yXgwL6ZqzBF1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12235
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C5C6823587A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17883-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
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

These bitcount and timestamp registers are volatile, and supported when
the module has timestamp features.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 62 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  4 +++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 148e09e58dfa..aebb5278cea7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -41,6 +41,48 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_SAI_TTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_SAI_RTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_SAI_TTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_SAI_TTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_SAI_TBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_SAI_TTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_SAI_RTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_SAI_RTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_SAI_RBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_SAI_RTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 /**
  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
  *
@@ -1010,6 +1052,17 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int fsl_sai_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
+
+	if (sai->verid.feature & FSL_SAI_VERID_TSTMP_EN)
+		snd_soc_add_component_controls(component, fsl_sai_timestamp_ctrls,
+					       ARRAY_SIZE(fsl_sai_timestamp_ctrls));
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx-rx",
@@ -1063,6 +1116,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-sai",
+	.probe			= fsl_sai_component_probe,
 	.resume			= fsl_sai_dai_resume,
 	.legacy_dai_naming	= 1,
 };
@@ -1211,6 +1265,14 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RDR5:
 	case FSL_SAI_RDR6:
 	case FSL_SAI_RDR7:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7605cbaca3d8..af967833b6ed 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -196,9 +196,13 @@
 #define FSL_SAI_MDIV_MASK	    0xFFFFF
 
 /* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN_SHIFT   0
 #define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC_SHIFT  1
 #define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC_SHIFT   8
 #define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC_SHIFT    9
 #define FSL_SAI_xTCTL_RBC          BIT(9)
 
 /* SAI type */
-- 
2.34.1


