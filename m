Return-Path: <linuxppc-dev+bounces-17792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DhlK7agqmlLUgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9F21E13C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS1Z4441hz3c9r;
	Fri, 06 Mar 2026 20:38:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772789932;
	cv=pass; b=oXHF1xM0Jw1bIoXjzZZRr3Bot0aNpGkq0Km7meRhZI0rlQZ3Z51EAfj1s6Ce+vyc7XrWDTiGY1+CsX/hnm0daFcfzCxKRVQ8mRSUA7BvFSetdDFxvKhEEubWU9BfKcgy60FzvGi1kBYsAotpBkazpDM0ceCFswmlyi4mGA3z5/KIXM16vpk88Itxyeu6Fy8oBOYLIpP2A2XUlLi1sTz3/lJhQ6lBl6hohqfIICTa5fZ93BVizCKVpgctzcgpB0Ia/8PibuwnA7aQwdcm65OXp5KZqsdNfxs3NhspGGPriOlnAvKR62py1t1HQIowZmuqR5RgINo09Dy5DquqUMKx7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772789932; c=relaxed/relaxed;
	bh=JaRQe8dExSxlWn23rL1Dg46UurArzuDsA/z/KaxQNOw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fMSO6JC6x6hUhW3beCyotCD6K2ylHK9NmlrUycZr1Bn0RmMLoMJiXJGaRZFdEo/eNsDRItWSgPdhnJTwKHKD9WeTIy42YpdZm5/J+pXYwt41tskAST9ml/R1caBQVJqLRTRddJhtyaoZMnnhM66XInqWyHEAmKV+zRt0gkp3nuwRvIqCoX1CtECNXY0Kac6M0hk89ZbzFRo1+RpsWER7RGV0zH5l0Y3wzEwQ1DelGqj628Ydj47taC6ap+teIG0Fh07NHMdY90Zf+onsgqlt1f/R78oVrIL3nQ7XxXvp3NzUp2CGWB52E93jS00/PAw4P/TFrmcSeS0t7g+qcazk7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Af0N3Dhi; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Af0N3Dhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS1Z24PH0z3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 20:38:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWRDTZubBWVFcfliXRQpCYoKfASMbwj+hLndJPNJq9odIjCUtFtsX7N622LPcfDq1eu90NAd6qdVfF5a3721jrYjCbkk4oRNa8pwlfEdNfTVIxjHuTaV0zu0ShB4xK0EmBfmQGEdM+ISQaSBWtzwkk5zovnGoNwe28td7oB8/QAUteGiGx2UhAGJ2s2Ft93+crnYq4LXNHijEulFtDolqWdPr901ChJDUwIzwGLP1FVv67o1mNrX4QHqyIqNWkl6jnRrbI9taaOG27lrRofytjYfx0k06GF4bJ992BRHXYUekE5UnRJq9zens8zL7WR3+J2BgjVsin5nXLUFp3hGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaRQe8dExSxlWn23rL1Dg46UurArzuDsA/z/KaxQNOw=;
 b=jbTlfk5xPxePaKYBt5WpHh5oBra3Tq7UMyRm5li+Ugs2i4Y1m3RUfpYJkvakpwR98KDe5W53gK/mCr8llW/Cl+Yhqzp/MYL3s5q0/eyLfWHogNwJyY4itoo1IhLv65eaPYQyKBfrw756FgCodtr8LHoq0Q7BNDXR+h75shSmqHnEpb3TXWBbCS8VEHnIj4N/zHfUFpt8+ceCSBJgkDAnfG9q/RZIw45WYMrv516bMaIzWBkzfQXI/e4s3pUcnJEA/xJjA9QY5SPHw20v8SKbe6yvyoFF6oNg5VJ86VXPaEqTp1U4gKYgJZ7oFefwLRntnI/C/XptNRQKkuGD2suf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaRQe8dExSxlWn23rL1Dg46UurArzuDsA/z/KaxQNOw=;
 b=Af0N3DhiSomuObEP1JM4RKrywljGO+xSP7/rVlObEAZDKRKgczbJZAKoZFQFyAAAW0AytAU+0NPOAfcUsO3hMo29+vi7iAkgRwU89qavqjd6qd9QffDbaN9ErtWPz/61P26JYtyIt2uZtnNblVEvOZPYL+S8EB8hINZFU7Kw8VGH+B/HRdNNud19Z4WGrl+sQMSydGG9fknSe6ZwomI/w2MDbk9zn4mBQplx1HUtVViK6ThI99Ljf1Oz2avYzxKB6xb0uBDToh1eUFv5GaVCcsK/1xSobkCAzjn37W8ENWGYA5msiEN9t+TWC03tyVjG44duDGnVWjbe/vDbNU874Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:38:26 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:38:26 +0000
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
Subject: [PATCH v4 0/3] ASoC: fsl: add bitcount and timestamp controls
Date: Fri,  6 Mar 2026 17:39:46 +0800
Message-Id: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1848a912-176a-4f2a-469d-08de7b641d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	W0TQ8r8jH43qvI1AIvRnNhwgFVQffxJ09cDn60Eqg5CifSwBUsmRgxN7bjbD18+bkOtn3awfQkEcoQ7dpmsmCOtH9DwAvApE4+ipuSL7p9U5M7W8S5zxleEG3MsBVtwesOFLByLnK3ck8OMqJkl9GnjLSdSk/FRi18q2cgcT8xIrbG+FE+f7D/iWmY0eUrNCWvSRqAVbYPHLZPY2pha7AYTk4XTlriM807QcBanVLSDGp40AjvyNQqSTzs/FwMbU05L2ErsYtgoVdSzLMJ4RAmBUISSvq3gHa7758/htO1WmK8OjrBzFNsBlZ+HAjH5h/OBv03gRK+kmIzxoNOx/3wFMnSYseTNAK9J0r10gE5or/83sXz/E0/7Tx7b392DOrzAhCw/207cE2mfXasxiCDlqQK2kxWVz3rB5xevTclFdTR66epw3GDAPgH7rPkqRCCC9nMK5SgIxUIvUiJAHWJlWV6nZvWN1sxL0h/KJSvyfJmaIqaqhlJqD9yGzQonIAEkBpLdxqh4/F2bzKU2bEm6sQyAJeZDwu0mBfyJkrzrCgPlg/4323bTX80Cg1Nc0tLUe90B6WDdNUGc0h3Hm3/ZIDG2I7dTbW905U0zhke9O6qohEDXOWxw5nWTVcv+OTU0YVvzWn205h3rINCFrtqmz/3VMSM25Wxf72QwFs3gkmfYgx2sD4w15lRPWGDwRikn/gRfU2+Yeq3aKJ6qh6L+ZTXtTYfrxb+JA6uJRZxILlpGhh3qRsMSYke4EyPA7BNM0QjmmU/y1HPFqHPFWV/ISOVtMoCwZQZP9Ay0tOjMmWauDzJiJ5jalXVoV8jXr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qzv1GXLoZxKHbGhOymCxV4WiQDWPsixIcT1/uo04SlFr6aA+7iLkbSBLTJSh?=
 =?us-ascii?Q?cB6iFPKOq2GoMO4CVhjnjJWvu+VWGylIhiXogTdPcnfKyUBGoltsgLqOVKpp?=
 =?us-ascii?Q?mPjppvL4lhIORfFQdTLwfDcb4EDn1PpoqvjnczWTMLxi5+lDixO98a1yV3mV?=
 =?us-ascii?Q?B7CuFadI5AbFbr4ThnlS6wRC3HsGq9MfNi07WFa8TZt2/gPCzPyNSUMTFtKk?=
 =?us-ascii?Q?y7DR2r/NsGHEJBTysdGvRP3jQPC6EwQyYPqxVMLHqTRKrSRSFcySZatWoVhT?=
 =?us-ascii?Q?DWRZRAJlLmo5OhZr2OGEo6SiJiqfgYIpk7qKPAcMhtr+dRvB7JYDMCdXoa+r?=
 =?us-ascii?Q?Icfm4UxG7p6Nhc1HxQkS6rdfnexziGJ6kIut7KX3g7sFclMPYJku4bEI2Q2v?=
 =?us-ascii?Q?dcUkLst0AkCz6eNrPVW4Dg+2t3/ZzZfAUz7BR+e1yS6zkEOYkgPQvo2fpEjm?=
 =?us-ascii?Q?ep7Hj8MPNY7EJbkUkcdgw4ytw1ovuWWWyHXtE4BM+gO1YDc/YsHGyjQ73ka2?=
 =?us-ascii?Q?dg67bCRdGIa+iiIvPfi3ZjC7aWerZkvSbt4Wqs+iale+GxDg1NW9oWdiWOms?=
 =?us-ascii?Q?HjVT3I0ogoBWaWRW7sIIv9u0/BIINp5JLLjuNwGRTVS5HsD80c7fwZ//eIut?=
 =?us-ascii?Q?+j/djt3oPMOPQlnNPjaIBpJQiwIwFku/n2BOD22MHW3P46cBcQdRUFt2H9nT?=
 =?us-ascii?Q?1GCDHS0ImR7IziwLSXqjOTmYb7If2mnGN4xBpJLQuFDfmO3K7FthAiPxWLUq?=
 =?us-ascii?Q?YDLjrkhJy3rmjybNr3mW9qjyWQGps8tTdnmfgOQMb68QNKII/oxwNlNAzS6M?=
 =?us-ascii?Q?tiCoR8ZqK+0nwotXLkwesnJO/78LeunSmDIaJ+tGtJYS2aV2CODP+SpTd0Hn?=
 =?us-ascii?Q?WsZUCrYHHFXrqUJ68nDFpeUnyFm8VmX1OgYMbX1Y8VTIB+bHm8Eu+X6ogBK9?=
 =?us-ascii?Q?9wmTEPJNCL3nRgii4QOHGESH7nhYwMe4L8AUfuW4+rERzWwQdPk7bUeF24VT?=
 =?us-ascii?Q?9SYY9NaDvGFLctSYhQzQHuW3ID1348Z4xU3ZPPaVDcM/8d5loOt8beJZK1iw?=
 =?us-ascii?Q?uQAcAsLrlBJUm4PlnbVOBqh9t9unsja6hvmK8Mw9PoIk+pINnq8n3/BLyprw?=
 =?us-ascii?Q?+7VurYlJKd8swZHo55RUUbztG+T5AMUWfO4RSACWezJINvzGqO/kL5Wwg0TQ?=
 =?us-ascii?Q?jbsOEa0nDyO0uTortM+uS/jJEZqRnm8oV87JMcZnhU7byeK4f8RWVPpFw6WF?=
 =?us-ascii?Q?5YfrvTfk67B2mfpI9eNyboj8XYbhwnEfeA3V7Vo3Y8tB851MMyBIUFSnno8u?=
 =?us-ascii?Q?9tjbp20sUfOnNNEfNfQhtPux0Z6N3HRCR+rMazZASMbvjodTA1vaDfm5RinE?=
 =?us-ascii?Q?A+5lIuUn3NUrwp+LAwhjCCynd7lGpA65fKplvUo6PqErk3+DqfEo/9oNQOZR?=
 =?us-ascii?Q?zx/1DGvxXi1Kv+gcEhry3gi+P93030x4cc/1Chk1tLQdDtLLUoQ8fUYxaleO?=
 =?us-ascii?Q?ch8YgBBV4cY3OMSr87TO1nRsUyf0A454HEfYmkPAw6DslWVgXjChYx7NIXa3?=
 =?us-ascii?Q?Z9hpvbwKB6l8SLXgUe07fqmmIL7ADF/5omz5qRuarxnVP3hTmBN07OrIl3Jy?=
 =?us-ascii?Q?QjtSyIS0wgsJrnZlCLiIqOm+6zx8dMKOVsmSWeinNPDJnFljvKfcWJ9fWG6K?=
 =?us-ascii?Q?iTHQvPTf+nLRdD3U4Lo6WGXdscbMK31dPt3ZZhFw2EPJEBVAzSFPSCQdGi7M?=
 =?us-ascii?Q?ohrSfYQVWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1848a912-176a-4f2a-469d-08de7b641d83
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:38:25.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lWgHB5hM66bPa2doYyMUqe0D2K3nY1BbQ1vkwQvAWhvkRpMW70iiXpPAp6MZt+sRF1aoxeGDsvPRvnHXEZW+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9CC9F21E13C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17792-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

changes in v4:
- use the pm_runtime_resume_and_get to get pm reference before calling
  fuctions and use pm_runtime_put_autosuspend to release the reference
  in patch 1/3 

changes in v3:
- define own functions which check the pm status before accessing the
  registers to avoid -EBUSY error reported by mixer-test.

Changes in v2:
- remove arrays of enums, define transmit_tstmp_enum and receive_tstmp_enum
  separately.
- remove __bf_shf(), define the XXX_SHIFT macros.

Shengjiu Wang (3):
  ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c   |  62 +++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h   |   4 ++
 sound/soc/fsl/fsl_utils.c | 113 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  30 ++++++++++
 sound/soc/fsl/fsl_xcvr.c  |  64 +++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h  |  18 ++++++
 6 files changed, 291 insertions(+)

-- 
2.34.1


