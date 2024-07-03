Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17279267D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:10:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=MDJyJiQw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDnrr0whmz3dH2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 04:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=MDJyJiQw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDnpV6H0fz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 04:08:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0Ub2PlLljHFRHxAn+UVDDvgHXivS63a/UzDpDvbq7/HYknrGo3BxVkyW2yrcNr9PILssq1mej7oWiA7tQcLBH84FEcLdVfX/StWmC296ce2ioOLInZCpPg6HQ6PcC+r5WsjeVDx0j9/yZaXChByM2fRW+uaPac7yJSog4YFG68j4fWW0jBu4jx82ZKrmNJCOcXb9vjRkxtziiAcqM7nb56p/p3MCGC3e/XC18nd3do4rE+FOFEzMzMdMas9EmxzqMW3n7B2kbTAOMYyAGPy/HOzKdp526AA+KwsC6Skgn15NtMdmujnqgbzU8ohPWmKAgh3KJCSnoDeUffuLuoqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/PHyqOp4/jCXg2GQPjThI6/mregTh0w+9dczcUuaiE=;
 b=K184L+BnwjeNHtrjJhZhYx3g8Ocu8o7H7McuSTUcFn60vYXaQGQfitqZnSEBs3gIZ1AUWa+9t+FMq16VuiwRC9VbY1qwy6whtqm9W9Wl/dw20fnB23WGUwAqGQtm+Qdqig4SYBihfAApYv6CL1/kr7Xad+RKIcZ9okQ52BS5Vgals1mI07Jl9W3/A1Ycna0EXvpHr7LhjfOGnEAQ6FG+8tYxvA+oaAennGnsprzcyI1nb3cQCW0mhSjusGE7nxg2vdeQzp2BKGNODISMOCqsVuQfsrxIQWCQHFACMnguFNNJpmRG4rhNpcD9/HAfUK3lLu/rqudG8uA/sPEqcuAQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/PHyqOp4/jCXg2GQPjThI6/mregTh0w+9dczcUuaiE=;
 b=MDJyJiQwN5zuMuXVxpF+Bs6p4QQMjk7jukYDtM36FHhSGKXWop5qUGuNGPuZ26evqF8wcTaDH4/AUsqzgUJu4NUa4/UEZEWbrP5bAI3v2rBn5goeyhI8X0iaVdHrob8c62ZEjzz42Cs2O9/GNwDbiNCz8DQS79PFV7Yvi/CrRWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10111.eurprd04.prod.outlook.com (2603:10a6:150:1b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 18:08:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 18:08:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 03 Jul 2024 14:08:12 -0400
Subject: [PATCH 2/2] arm64: dts: fsl-ls1028a.dtsi: add fsl,ls1028-reset for
 syscon
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-ls_reset_syscon-v1-2-338f41b3902d@nxp.com>
References: <20240703-ls_reset_syscon-v1-0-338f41b3902d@nxp.com>
In-Reply-To: <20240703-ls_reset_syscon-v1-0-338f41b3902d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720030099; l=1448;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Jrd6CvNcDalKKMpsmTUI/VowSv41yeks+OCXy5rG5/k=;
 b=+QFkpspeSeSnyHo/T1MYnNI+FnhvjJFUp1yzL4XzIIf1f8gq+BAFhwMlfGvei5gtBpAMSYvgj
 v5MlSosiOjZCy6jwNV3FRQwjPr6VidOQt+/qNrpnOUCjlIasBDvxpOB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: bed38237-139d-49a7-8b3e-08dc9b8b2353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?THkwZHdlQVNxWEk0eDVLYitnZ3Qzblp1NjN2S1dCOXpvNFRTbkxOV1VzY25S?=
 =?utf-8?B?KzhOQkRTMExuTGZzOU5NVUJLSXgwQk5yVnYzRzN5S2xHaFF6dUx2NUhxbExq?=
 =?utf-8?B?cGJvRFYzaE5oZUxHbHVoNm8rY0Iwck80WXUxeXo5NTZ4WUdOK1VLOTRSVmVX?=
 =?utf-8?B?NmxhcWx4V0Rhd1dEYWlaaDZuYzdEZ0g2TjdDMjJxaXFTMEo0bE4vTEovSlNJ?=
 =?utf-8?B?TjViTlAzcUpXUzR2alE2bHJtODlnSzVOdTJPRkZLVCttdjk5bkhXTU93MHFG?=
 =?utf-8?B?WVZRL1oySHQzTjdncXgyNEF4a2Y0MW03WXFCcHY0ODYzOUprMW5lTytPNmRo?=
 =?utf-8?B?bVZUSTFBVG4ydE8rYmllbmVnNHQ2MW43aW4xT29vdFd3MnRvNGE5NUhOMEUz?=
 =?utf-8?B?MHNqRGFueGZaYVYxZHBCT3hnUHBhdGVTa0JjcGR0NWduQzlicGdkL0ZrVE9t?=
 =?utf-8?B?Q05FMFFSUmhYSWpFYWQ3ZXMzVEJhODRQYm9xOFY2emkrTjBsT01lVGlFQVNS?=
 =?utf-8?B?UjFmaUp6bEgrSzI2UUVnMGYvRllpQS90NkNRZDNja2JZcUgvMmxNMEpha0Zr?=
 =?utf-8?B?Zis3cEtEMXp5RXRZQW5KbDUyczVEc1kwdSttSTVSR2tWeFdLQU1SYkNyTnBC?=
 =?utf-8?B?ajlxbGoxcm5FMk52clRVSEpaTTBkeUpmMDhpSEdMajNYdFJpTkNBcURxZFJM?=
 =?utf-8?B?dTYxeFFtV3YwbXNMQkVmbDBIdTdGWnBVbFlhRTNaSEloczZJR21BWnpPRUEy?=
 =?utf-8?B?RGZQV25CVExIazIreTJlWlQyaDl3bkgra1NIdXhCcFlsVGVsS0hic3MwSFN1?=
 =?utf-8?B?MW9HakIraEZveUFFTG9zSE5HRU1UNk9CbmtITGN4TVlxbE9EVGp1elJNZEl6?=
 =?utf-8?B?a3FCZWcybEM5ZjRabFFVSUFsbndTYjVaSDFFYWNVRHYzYzRXaWg5NWFrM0dK?=
 =?utf-8?B?M2NzeWpyM3c5QnV6VVVpc3hpZ0hpOVQwTm9KWmJqdlUxbGJIdE95bUMwT1lE?=
 =?utf-8?B?UkwxaEE0UUIzTVorUGRBZXNQZGs2YnVLK2l4bjQyczlVVnExNjVxZFI3Q2FX?=
 =?utf-8?B?OGpTNk9rc0pnNEtML1hDVkxhdmg1K3VXbC9yem5kZjZiczd3czBVMDk3a1R6?=
 =?utf-8?B?a0U5N3VYS3pwNE12MGgxRUxKR2o4SjZqQU92NHo2emt3TGF4YjNZdEg3cDBz?=
 =?utf-8?B?aDVXWmJFZzFucEo4QjN4bVBFczE2a1h1ZU9lQlg5b1NMRzlISitPUXZSbDBD?=
 =?utf-8?B?bnVHYVBUM1Z3ZFJ5RnNIV2t5Zy8rTlgzeGlLWlRlSUdoaGM1OFQ1SmV1SzNG?=
 =?utf-8?B?Y3hiK0draEhyM2ZrTDF5Nkl6dENaTEN6cHVoaHVmNElxWGtESEVsTTNMRm1x?=
 =?utf-8?B?a3YxNTlpK21MY01za0MrMkVaWUg3Q2VLWGZzMy9xeHJvZjE2clJIRkd2Mlcz?=
 =?utf-8?B?OXVLUjdZWHphaXFYSTFkclBBdTFkeS9FZWFwR1RMbU5XWGZrZkI2NTZhU0VQ?=
 =?utf-8?B?Z1NkME90QVl0b256WGhYaXFsUjFPNUtneWpLOVBlYWdxRm1wUm5xK1g2dXZu?=
 =?utf-8?B?N3VKMmpGS2VQekxOVllJVFZVbmxKMEFyMjQvSCtnOUttYmViSjNjamRmNm5l?=
 =?utf-8?B?bGdrdC9LNFlnQkExcDM2RkJIdUluNkprY1NUY1BIbUI0OStCeVNTeUFJTitI?=
 =?utf-8?B?ZVRYZGtnUGJhMTVHaWpyM25va21kc1c5RUlXVTBLNHR2a0NyWTVBTHJQcVE0?=
 =?utf-8?B?aEkweWxnMC85akJaTFV3WFZmaXBpdCtJVThCOGxCdDdXWU83NWppNUJOODQy?=
 =?utf-8?B?MmVtbHZvZ0xBdytvTjdCS2hjd05FTEo0eitEQjcyMXlMdXhJSEdjbkI5bUhw?=
 =?utf-8?B?dGVLZDJEZTM5NWhwSkFKc05sL1dsN0lva1dUR0JqNnVTSVE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?K1dESG1PemNEQUtwT2dCSU96MG05TG9pR3hBY3F2TWd3U1k3WmZPOFFad1Bi?=
 =?utf-8?B?WTdaVy8zRnRsakE5SEE4cnpPTG1jcjlYL1ZJZk44VGRReXIyUmd6LzBRYkQ5?=
 =?utf-8?B?S2ZnUkthM2l6cW9IKzIyQ3RDWXVCYUYzS2RiaHRsUlVPWmlqdDZ0RHNvZitU?=
 =?utf-8?B?aG9HWUwvUTdEa05rT3p4OExNTEFBTUMrM24rWlZPNHR2cUJzdEhHNVRDR3g3?=
 =?utf-8?B?cUJURkxmSGxxdWtsN3Q0UDliUGN3WWdENkw1eWlHRXA0RE4vOWhMVW1VTzBK?=
 =?utf-8?B?TXhxSzVLcDlabGw2TnRwWGRWQXNtcU5XcWdnakdqY1ZKZm9SQUQ1dGs5STF3?=
 =?utf-8?B?aDJETVRjZ09UNVBpKzZmR1hrRE5YWStSTjFlcHBxczJDa29yeGxxZFVpTUx2?=
 =?utf-8?B?S05LR1VpYnRQeFFzUnhUVXQ2ODlxenJ0NmtsaHFkUDh4dVUxZ25qK1JKOWlZ?=
 =?utf-8?B?OGYzWFoxUW04NHJ3NGJMaG1xaGhWRnVkRnRzdnd0eW8rLzNUcU4wcW9TTlhX?=
 =?utf-8?B?Ry9WZ3EzaGw3dXh1VkEwbjVFUEdRNGxHMzBOaWpITHcvcjRDYzIyNmJBT0RW?=
 =?utf-8?B?OUZkUkkvT3M4SlJDek1YRzR1TXI3bEo3MWZvUkxjTFJZTEdPakdrZkpidU5K?=
 =?utf-8?B?YXJ1aEhTWWVxeWNjb2djVDlnMG0xRjN1d0NYT0YwRmtZaitqaWJjUmF4UU1s?=
 =?utf-8?B?Y1FWaUV0dnpVS3JrZFlNUEIvS3V1R3F4NC9NNzlxbW1ZVWs3b3NmczRrUGlm?=
 =?utf-8?B?N2hmTU1hOWRwM2J3Q2szckRTY1phajZrOXNZeWozZWsxY1ltL09yMFF1YXlG?=
 =?utf-8?B?NWhmUmRQcUlQdWtFNzdpOWw1QVVHN2VXSzR3OE1XK1lwWUpsVDAzWjE2ajBk?=
 =?utf-8?B?RlFlaXVXNnZhQXRnN0cvOEI2aEdteC9VYTY5Z05DL3FFZFNTOHk2VW1VV2pL?=
 =?utf-8?B?bThzRzdEUkxqL2FlWTFiblVHYnRHcFd5OGdXMDBwZEl3bEhxbDV4YURGTnFM?=
 =?utf-8?B?U3ViZWk5RkJWNlF1VnlaN09CRWd4STdrUjd0cHp6eTcxdnd4V2poOEFLVXVB?=
 =?utf-8?B?bG1zVUVjSmxXT0pqbnhndUsxY3N0MW9kcWwyTldQdnp0TFFzSXBxQVRhVmRt?=
 =?utf-8?B?bW4vcklWRkVnSDJjSE5SUXF2U3JMQXFZSVRWQXIvaExseXM4TzBoZlROT1VL?=
 =?utf-8?B?R0VWN0hJeUo4Q1hjbnVFb3pqKytjdm1abDZzRjduSERtcDJvOVNyQUpDbTlp?=
 =?utf-8?B?eW9LdkRoVFNiQjFkVlllbUwyb294K1Rrb0lVTnFCMnluTmVkUWhMMmQ3b1VP?=
 =?utf-8?B?aXU4V044Z0FQUEN5Tk1CSy9CVUZHQlptcURQUUV3cng0RTl2VnVaS1U4N3lj?=
 =?utf-8?B?eWhWTmNRclRML1FucmpsdEpieXp5U05OeFJLaXlYQjNzMllRWkZGcFFpS1lI?=
 =?utf-8?B?YU5rVzRSL0NYNVpqN0I2VnMwZkM3V2ZJaWFxd1cwaEJjMmpyajhvRVl4elhw?=
 =?utf-8?B?MjVRc2V6anE5THVnRnBTSTNNTmVLQ25NL1BLdnFyVDZvdkZRTmRyeHVSQlo0?=
 =?utf-8?B?M1FlZGh0YUFxMXoxL0RrMXdXeGJIeUFuR0t2SU94QmVhTHB2R2Z3R2laSDhQ?=
 =?utf-8?B?clVGQ3hjVjBEbk12SDlzSjQ2emlUclhrc2dhYUlyM3dlL2pnRGp6ZkNwZk52?=
 =?utf-8?B?TzE2clI1K1QxMFg2NGIzVDRUZHBHRFNHNzlUdUg4MUZ3ZUZDU0crSXFXZFcx?=
 =?utf-8?B?SHRKQTNEUjM5KzBMdXd1RmxURUZnWXhWQW1Yd2hxNTluMjF2UzFuTEtNOG80?=
 =?utf-8?B?UDJQQTQ4bkhPYm9NSFBaRG1NaXZkQTFxaXZWNlFyZlZQNmkzYXdweXlnSjFQ?=
 =?utf-8?B?QXNvNm5obDdIQ3lCQWtWQnVtVDVtT1NUWjFLb2dWYmNGM3FCM0dvTWU2WkR3?=
 =?utf-8?B?b0RobTBNQ2k1OUN3SVRiNzN6ak1YcVp2QW9LYWRIc1Y2L1BPelhIOXFxK0xv?=
 =?utf-8?B?MUJWRWtsOXI0QTNrNHN4VzNaTEJaeWNtMmxIQm1lSXRzbUFQb3BzYjNyOVRB?=
 =?utf-8?B?ZlBDWXdzMnhxVDZDZStwTFFHRXdSbzhML3huSHdSV2lxeG5qK2Zja0RISFdN?=
 =?utf-8?Q?IQed9n3Nxyuozcqpl+PtjFLKJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed38237-139d-49a7-8b3e-08dc9b8b2353
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 18:08:27.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4vUyqD7ZGnqU+IIkmocXOU1nB6RYJE6iWTSZpI0xnASRVRTEpOBLt2ozcVFV34dN8E3qUJqPthzhc3r6cDCYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10111
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add platform specific compatiable string 'fsl,ls1028-reset' for syscon and
move reboot node under reset syscon node to fix below warning.

syscon@1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
        ['syscon'] is too short
        'syscon' is not one of ['al,alpine-sysfabric-service', ...

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 6b6e3ee950e53..fd93e66c071e1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -112,13 +112,6 @@ optee: optee  {
 		};
 	};
 
-	reboot {
-		compatible = "syscon-reboot";
-		regmap = <&rst>;
-		offset = <0>;
-		mask = <0x02>;
-	};
-
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
@@ -235,10 +228,16 @@ fspi_clk: clock-controller@900 {
 			};
 		};
 
-		rst: syscon@1e60000 {
-			compatible = "syscon";
+		syscon@1e60000 {
+			compatible = "fsl,ls1028a-reset", "syscon", "simple-mfd";
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 			little-endian;
+
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0>;
+				mask = <0x02>;
+			};
 		};
 
 		sfp: efuse@1e80000 {

-- 
2.34.1

