Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8E926668
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:51:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=djUMs2VI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDm5P5Cfkz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=djUMs2VI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDm3z23j7z3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:50:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsDd10l03GEJmy3ToiOfCEMQONFewzKp2uM5q8SKacNdilADSNKVKg/zg5EwGTLrUijMMAYU+LCzTuKeywkMF8Ow37kXpOCy9YEONm66PQ+u9hufI19QyR7IwXa0lTytoUuycJa8B7iMH9vz8fiTZRtoDbrTDjrmFwbv20gqy9daeAOh+On/WedzeNoC3GT4OdPZxl3FkeXpZHExTNw1Xe+obbW2iwZnvEb7f3A+cYMAs6LtxReHGztmThL2U7dqnz1T1laa7j8xZq+PNE7d3JKFWrEgEMJ5iYnAxlV8wsnc0HqPhA/t/2cndcCTf/5yWdcsimUArxlSLIG7ckDavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qpj1mjy4rcLRR9nihAqAxbDHcUQzuw0q1X+ib63Xr6M=;
 b=MVDuhglRUMa8riUlI5uuoH0S0OeuN3IBJbzAOvfZbr8huU3mnzbyRBfNapncrAJEwWmk+YLJ4iWS4hwvxvzoPoPCyQvZIA2oV40MiMM/wy9NH2o0zL50S7fL6r02Wjk2sq/AF46QDSDtzraxRN8mh4y5AlHbGpZWbLOiaCYM82eGULKfNse3q7Xu3rUhzUXoEDPYxy/6vxs1ZyVS2iceEp793L308KqTgUMmpOkQhHyJRi2RWRnq8/r4AHsbMuvb0WCu1W/jTQBWlYPl2BekBrLi2RpLCRXvtVztTAabkg0h94TfFbXTPinQt0YH8gz9ZQh5foQumttLZ2D7HuJ0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpj1mjy4rcLRR9nihAqAxbDHcUQzuw0q1X+ib63Xr6M=;
 b=djUMs2VIgYsP4F0glUOL0RMz/uhDwayn1yllrQXA1gu/kbqvhZyPHNIqkzvU5waT2NN8Y5NgkKM/t0B3GDs5KyxtL4f4Zn8G67Rp0cbyhJXtdvpcbOroKJB4yqog5nW4XgLkoAnWCWYHEY4BsTYr1Ycca5bGBR7wB7wb/5zOo2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10628.eurprd04.prod.outlook.com (2603:10a6:102:490::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 16:49:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 16:49:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 03 Jul 2024 12:49:39 -0400
Subject: [PATCH 1/2] dt-bindings: soc: fsl: cpm_qe: convert to yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-ls_qe_warning-v1-1-7fe4af5b0bb0@nxp.com>
References: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
In-Reply-To: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720025393; l=20039;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9o7LrG3vFDsB62dKj0c6GGLuTwt20y29eBBOrzQLYyI=;
 b=zOOqtv/c8jB+sb1DPVFX4LHyPX2oc9T9NE6GuWXzpPO8y9X6uV/b7tvCvKra2tGh75it94dsK
 SZSd975h7j0BRdMDt1xVBtJ2+Wj9DLCZWc1xqSBWCMVNxMQ1sV0ZQ71
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10628:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a2a2d1-9894-4d7b-2ed0-08dc9b802ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Z3dmbVZObHNYZVFIdkdlRmFsRWlXYU9jamduM042Ui80U0tidmx3U2xTNHEr?=
 =?utf-8?B?TUgrcUFFU0syVXREc2dvSk54d1hWUnZCeGI2VldmdkVUM1o0czJBMnBPdVVv?=
 =?utf-8?B?VUxkYlJWYjA0WDBHMDlsYWoyNE1GN1pPbngzdXlKNzJtaUNzRW9sN1hQcHJx?=
 =?utf-8?B?UjYrVHBreDNuUUR5bUtLbHdzQ0oza1pCUXQzcTg0NzBiNWF6MzFLdkFhc3hz?=
 =?utf-8?B?QzNIREYvQXJqMGZrSGRTUDc4TlREYno0dEExRjgzdGFPYisxS3JnUFdSNlhS?=
 =?utf-8?B?K201QW11NkZjYi9VeUI2NUErZTh6clhEQStQdnJiYXhMUWxDSnUxNHI5eDlG?=
 =?utf-8?B?d29SV04vTEN4dkRLcEFiVGlJc0pvSWFHY05kS09lYW1BbUtNMm0xVnlkQ3N6?=
 =?utf-8?B?bTUwVjZyaEtJd3MyQnpPU0FGL25vRlNzaUtHbkJBdUxYcWM5WTlVOVlqU0xn?=
 =?utf-8?B?MmR6WHVlUUZOR3paM0E3ZEFlTFNMV3VaNjRlSUZRMHJnWFgzMnhKTzdEMEwx?=
 =?utf-8?B?a2ZHV0Z5U0ZRUzJRQWNWUTQySm1nbU9zTlR0V3lVRXNNR1hvZHIzaTVOWlo1?=
 =?utf-8?B?b2M0RFRVdHFMUzZjdEQ2M1VhZjNvYW12K1F4R253SG5tQkhKSmx5a3M0Wmcr?=
 =?utf-8?B?SVd4ZG14MDBWbUlTY2VXcGJjSytwQk1LRXY3b0Yyd0RVbDZmSjFERW5uZFZT?=
 =?utf-8?B?NEdEb050cFRxa0lTTnpSN3hWNjQyc2RDVDBjQmpBTUYxK1MxdFZzUXh2L0dK?=
 =?utf-8?B?UW40SlNzWHUzT05nRHg1UUFMMzI5WUl2aThaRmJaQTQvYlNGaXM1cFp5b0ZH?=
 =?utf-8?B?TC9YZlErcGJMZU1lUHJUbG52WUU0K1dHdFJPcHU5SkVvdjZDSkV1Ym1VUGg5?=
 =?utf-8?B?OWFQaDg2OGRQVStOTWhQdWZYNlEwa05wUTZPczdJNFNWZVU4MXJyTVpjc0oz?=
 =?utf-8?B?a3dpdEcvNkk3NkF5VWhudEM4bjVEdWo5bnFEQ1kwZVZCcXF6QWFHZUlRQkFG?=
 =?utf-8?B?a3Y3dUd0QVVWYkNvR2hMSUtZcTJEcWlxaU5UZVhPRnNyMjVDWmJYTjlRMkc3?=
 =?utf-8?B?UVhqZEo1TWdRS1l4b1BXTFZBYUYybGlrc2M1ajYydTV3ZlVVSWhFVkRPVjFm?=
 =?utf-8?B?ZUpyZmhRSEpDeEREbFl6NWZJZzl3aUt0ZUJ5Yy9kUmJqUm0yNzBPNXhpcWo3?=
 =?utf-8?B?b2FtcEFqN1dydTF0U29TdzIrZE0yaS9lem1GbnR6VGw4QWMwOUt4MldCdWxL?=
 =?utf-8?B?MGFiaTN6UXEzS0xlRDlRbzZiOVowZWJRQWg2S0tKRktXUmdqRFZRN2JKMkts?=
 =?utf-8?B?cE1BNkViU3NSdFNNMzRtWk5zeG1HNDhOZEt6R1hkNUhBN092Ni9GbTJGZEhv?=
 =?utf-8?B?SnNMUWNGTjF0MjA4UFRCOHhoTjd2MngxbXZsQWtKOW9MVVlFWWU1cHFRRUJF?=
 =?utf-8?B?N0NEVjBLV1F3ZVRJN2ZLRFAzVUJhTU9TRmd3L01DUHljYU9MY2lZOXFDVFdE?=
 =?utf-8?B?RG5KTFRBVFJoWkF4RDdJQW0rcUF0T0Q1REhyRllUUlRVWVRWd0pySFROWFFP?=
 =?utf-8?B?bHI0amJ3MVl3SzFINUk5aDdRVUtYRTUxQ0RZbnhXTDh5dWdqVTRpTVdLbzVl?=
 =?utf-8?B?Y0F3UFZsQWJpaW5DaXhvczEzVU5Mb2UwMFFBT1VkL1NpMEF0M0dYT2hreTBV?=
 =?utf-8?B?NEtRbzN1K2cxWm04eDEya3lkd2doNnhLdHppSUFmYlNqNHBmK2U2NkM2TWN1?=
 =?utf-8?B?dmFocEdhQ2ZhR0RQMXRyc0tPTThMSUZLRWdNTUN6UFdSVWMvTzc5OVBScWE4?=
 =?utf-8?B?MXY2eVhibEt5VDV3WVh6Zz09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WDU0MXEvUUQwU3E5ZG85aDAwRUd4Ry9OcjQ4WmlCTEY3bjJZQ1FwRGhLVTVy?=
 =?utf-8?B?SkMvUW95M3M1NGp6MzB2Tzc2QjF0KzY2WnNyZzRPNXMxMWRwcGI2SnN1NzhV?=
 =?utf-8?B?Y3hRd0NTV2JQQlE4Mlgzdll4eVdRejR4d2ZMbENwc2s2UW40cTZhYjJDbWpq?=
 =?utf-8?B?cG95OGtESkt1RnQvd3FXTEI5NEJlRVlvYXhJNmZQRnEwTXh0TmR1bVJwQzZM?=
 =?utf-8?B?SVNZWTd5ZDFFUWhaRERBa0d5c012eXMrWmZYajdubFRSaE5ra2RhaUlva2Qw?=
 =?utf-8?B?L3psZnlFVU1peUdRcU9OSlFMdGVtRVNOclB2SUhWNS9OVTJweXRlWDlBM3pF?=
 =?utf-8?B?NHBYeG16dlVDeDU0TGtZT250WHZoakJGbU85MVQvRzZnMno0TEg2dDdOL2tU?=
 =?utf-8?B?UUhraEZpcjY4N01NTlNpcnZSTXlpYS81Wk1BcUJ5b1pzdWlTbDlQb0dLZ1lV?=
 =?utf-8?B?anQydEtmdzJaT1NBTEw4V0szcDg5Ykc5VUdUeWZaMUlETWM5TEVyWk5POHdO?=
 =?utf-8?B?Y25XQlNZeEYyZVVrYnlqYng4YXBiR1VQUjUxaC8zQXdzeVZKbUg4a3VXeS93?=
 =?utf-8?B?VExhVm5Ydy9WdENzRkhmZVZ1VmVUaTQ1L3FoMlJhUUtBTCsreWptVE5leUZM?=
 =?utf-8?B?Vk43amF6YitPSnRZaXB4QU13Rk00WDVWaG1aR2VXcUc2c1FiREtxVWxrQjlK?=
 =?utf-8?B?WnhnczdsWDFyRkNuNFRLYWtNUGUvV2lZYW5lNXZ1K0hsb0hKN1dmQStsWmNG?=
 =?utf-8?B?anlGVGpPK1JhRXZwZS8yYjA1aE5nN0tTMlJHUXdWSGZpQ0E2N3hMeVk2N2dP?=
 =?utf-8?B?bWVGc1ErUVpxc253UDBycHkvdXFuMENNd283RTEzM1VMeHQ4VUNsZDlNWGZG?=
 =?utf-8?B?NE1qUFd0ckNXTUdCZGMxZ01Oa0YyTkJIbVB4Uk0xZVh5cm1SMHdZUzJZTWlQ?=
 =?utf-8?B?dHJZK3orZ0poZldJSkRXUnhDR24rWm1Tcnp5VTFFZU1EbTdpZkVyRTU5czFO?=
 =?utf-8?B?QkFDRGxNOW95TXltdVBIRXVFMHVvM0JyVnQ1ZTk2QTg2b05wVnFVeDJpNGZK?=
 =?utf-8?B?bVlmZGhXbmxsQVhCQ1F1OStRM0RrSW5XZUQrcGs1bjI2dVI1UHE1UFFSQklw?=
 =?utf-8?B?d2c2eDluVFB2dXZNKzY1WGdrY0I2aGhLM25HR21kWkxmYlY1Z0k4cnlEVVVY?=
 =?utf-8?B?aElFemhLMlhNUVhHMGJzSkNseVRlbVZadlBPajV1blNSWTQ3RUJnTmFadHdl?=
 =?utf-8?B?V0RqdEhoTlJaTEJBdGhtR1YrVFhVMGVya1loclQ1amx6YkJsR0FJSUdYN2NS?=
 =?utf-8?B?bmx6YW5Zc1lSKzhmb0xWY3Ixb3d3Kyt0ODNjdTFxbks3cDludFF1ZUNpZjFr?=
 =?utf-8?B?Sjl2L2RqU2R3MmJ0YURWYkFZN0NaRXl1Q1lRWVEwYk5QZGxqVnZabGcyTUlp?=
 =?utf-8?B?YTk2Q2oyOHFBNGhVOEFzaGV1RHZEc0JCdUxtemxJTFdhNHJyQURjM1A5M216?=
 =?utf-8?B?eXVUclQ0NG1OTUEyNzFIakwzVVJJaUFvQk1RZjduOEcyVEpvcXdobjB0dGxR?=
 =?utf-8?B?NndTNWthK2ZPbmI2K1ZGL2pDbElDT2tNVmZBalBTYlp2U3pyL1pJWnhUbzd3?=
 =?utf-8?B?b3laSktlbWFTUHR3VTNZTjBFeFhIUXhNRnZRR0Z6L2dMSHJhK0dOUGYvb1Jo?=
 =?utf-8?B?bjE5QngzU21pOVU1NXhyalhOcDZwbUJHSU4xa2c1N1pGNE12VUJldVE4aS9H?=
 =?utf-8?B?U0sraUVhUFZCWks2bkFwbFkybHcyV2IvL0F3R0tqUDBWclNMWWh5aGh0cmww?=
 =?utf-8?B?YXk4V3BNTzFIbEU2TGFudG41UGtXbFZkK3FtR3pDRm1xNzBMTXFHbnNDc09N?=
 =?utf-8?B?VGdOZFhNMUlISHFwYk9CbnlBQ21wMFp3OVkzckxRalJFNWJiOXorSk5yM00w?=
 =?utf-8?B?V0xVTGUvUE5udUt1blQ5WDAzSDRWSkptaWs1aXVEK0QrZ0hTTXpWTkRRYjVT?=
 =?utf-8?B?cTNrUDVlZytkekY0bEFwaHFRR3cxWitkbWhyV0FYaXc4eDY0cTZYQzRYbWxV?=
 =?utf-8?B?WlNQTXUxamtCYzJLRDZxSXlzS2lFaDh2V2s2WnJhRmFkWm1yNlArb2U1a25O?=
 =?utf-8?Q?p4z+31Uev3sb7AziKAWIAIAIg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a2a2d1-9894-4d7b-2ed0-08dc9b802ccf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 16:49:59.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQeRiy3shgB6UDnnpC6aC8gIsbWthbt/VxLDP8y9irEAJhbmNOMPXyeI4RUSlhi5o+7kWppy9wl5JPsZg95GhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10628
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

Convert binding doc qe.txt to yaml format. Split it to
fsl,qe-firmware.yaml, fsl,qe-ic.yaml, fsl,qe-muram.yaml, fsl,qe-si.yaml
fsl,qe-siram.yaml, fsl,qe.yaml.

Additional Changes:
- Fix error in example.
- Change to low case for hex value.
- Remove fsl,qe-num-riscs and fsl,qe-snums from required list.
- Add #address-cell and #size-cell.
- Add interrupts description for qe-ic.
- Add compatible string fsl,ls1043-qe-si for fsl,qe-si.yaml
- Add compatible string fsl,ls1043-qe-siram for fsl,qe-siram.yaml
- Add child node for fsl,qe.yaml

Fix below warning:
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000: failed to match any schema with compatible: ['fsl,qe', 'simple-bus']
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/qeic@80: failed to match any schema with compatible: ['fsl,qe-ic']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml   |  48 ++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml         |  47 ++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml      |  71 ++++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml         |  40 +++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml      |  39 +++++
 .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml | 148 +++++++++++++++++
 .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt      | 178 ---------------------
 7 files changed, 393 insertions(+), 178 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml
new file mode 100644
index 0000000000000..53b07d4edc773
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-firmware.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine module Firmware Node
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This node defines a firmware binary that is embedded in the device tree, for
+  the purpose of passing the firmware from bootloader to the kernel, or from
+  the hypervisor to the guest.
+
+  The firmware node itself contains the firmware binary contents, a compatible
+  property, and any firmware-specific properties.  The node should be placed
+  inside a QE node that needs it.  Doing so eliminates the need for a
+  fsl,firmware-phandle property.  Other QE nodes that need the same firmware
+  should define an fsl,firmware-phandle property that points to the firmware node
+  in the first QE node.
+
+  The fsl,firmware property can be specified in the DTS (possibly using incbin)
+  or can be inserted by the boot loader at boot time.
+
+properties:
+  compatible:
+    enum:
+      - fsl,qe-firmware
+
+  fsl,firmware:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      A standard property.  This property contains the firmware binary "blob".
+
+required:
+  - compatible
+  - fsl,firmware
+
+additionalProperties: false
+
+examples:
+  - |
+    qe-firmware {
+        compatible = "fsl,qe-firmware";
+        fsl,firmware = <0x70 0xcd 0x00 0x00 0x01 0x46 0x45>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml
new file mode 100644
index 0000000000000..8267ad00727b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine module Interrupt Controller (IC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,qe-ic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: QE interrupt
+      - description: QE critical
+      - description: QE error
+    minItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@80 {
+        compatible = "fsl,qe-ic";
+        reg = <0x80 0x80>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupts = <95 2 0 0  94 2 0 0>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
new file mode 100644
index 0000000000000..cf0f38dbbe0da
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine Multi-User RAM (MURAM)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: Multi-User RAM (MURAM)
+
+properties:
+  compatible:
+    items:
+      - const: fsl,qe-muram
+      - const: fsl,cpm-muram
+
+  ranges:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, slave]
+
+
+patternProperties:
+  '^data\-only@[a-f0-9]+$':
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: fsl,qe-muram-data
+          - const: fsl,cpm-muram-data
+
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    muram@10000 {
+        compatible = "fsl,qe-muram", "fsl,cpm-muram";
+        ranges = <0 0x00010000 0x0000c000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        data-only@0{
+            compatible = "fsl,qe-muram-data",
+                         "fsl,cpm-muram-data";
+            reg = <0 0xc000>;
+        };
+     };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml
new file mode 100644
index 0000000000000..8e58ab58c0633
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-si.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine module Serial Interface Block (SI)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The SI manages the routing of eight TDM lines to the QE block serial drivers,
+  the MCC and the UCCs, for receive and transmit.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,ls1043-qe-si
+          - const: fsl,t1040-qe-si
+      - enum:
+          - fsl,t1040-qe-si
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    si@700 {
+        compatible = "fsl,t1040-qe-si";
+        reg = <0x700 0x80>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml
new file mode 100644
index 0000000000000..cc4ed48d786c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-siram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine module Serial Interface Block RAM(SIRAM)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  store the routing entries of SI
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,ls1043-qe-siram
+          - const: fsl,t1040-qe-siram
+      - const: fsl,t1040-qe-siram
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    siram@1000 {
+        compatible = "fsl,t1040-qe-siram";
+        reg = <0x1000 0x800>;
+    };
+
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
new file mode 100644
index 0000000000000..89cdf5e1d0a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine module (QE)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This represents qe module that is installed on PowerQUICC II Pro.
+
+  NOTE:  This is an interim binding; it should be updated to fit
+  in with the CPM binding later in this document.
+
+  Basically, it is a bus of devices, that could act more or less
+  as a complete entity (UCC, USB etc ). All of them should be siblings on
+  the "root" qe node, using the common properties from there.
+  The description below applies to the qe of MPC8360 and
+  more nodes and properties would be extended in the future.
+
+properties:
+  compatible:
+    items:
+      - const: fsl,qe
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    maxItems: 1
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [QE, CPM, CPM2]
+
+  bus-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the clock frequency for QUICC Engine.
+
+  fsl,qe-num-riscs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: define how many RISC engines the QE has.
+
+  fsl,qe-snums:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 28
+    description:
+      defining the array of serial number (SNUM) values for the virtual
+      threads.
+
+  fsl,firmware-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      required only if there is no fsl,qe-firmware child node
+
+      Points to a firmware node (see "QE Firmware Node" below)
+      that contains the firmware that should be uploaded for this QE.
+      The compatible property for the firmware node should say,
+      "fsl,qe-firmware".
+
+  brg-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      the internal clock source frequency for baud-rate
+      generators in Hz.
+
+  fsl,qe-num-snums:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+    description: |
+      define how many serial number(SNUM) the QE can use
+      for the threads. Use fsl,qe-snums instead to not only specify the
+      number of snums, but also their values.
+
+patternProperties:
+  '^muram@[a-f0-9]+$':
+    $ref: fsl,qe-muram.yaml
+
+  '^interrupt-controller@[a-f0-9]+$':
+    $ref: fsl,qe-ic.yaml
+
+  '^si@[a-f0-9]+$':
+    $ref: fsl,qe-si.yaml
+
+  '^siram@[a-f0-9]+$':
+    $ref: fsl,qe-siram.yaml
+
+required:
+  - compatible
+  - reg
+  - bus-frequency
+
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    qe-bus@e0100000 {
+        compatible = "fsl,qe", "simple-bus";
+        reg = <0xe0100000 0x480>;
+        ranges = <0 0xe0100000 0x00100000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        brg-frequency = <0>;
+        bus-frequency = <0x179a7b00>;
+        fsl,qe-snums = /bits/ 8 <
+            0x04 0x05 0x0c 0x0d 0x14 0x15 0x1c 0x1d
+            0x24 0x25 0x2c 0x2d 0x34 0x35 0x88 0x89
+            0x98 0x99 0xa8 0xa9 0xb8 0xb9 0xc8 0xc9
+            0xd8 0xd9 0xe8 0xe9>;
+
+        interrupt-controller@80 {
+            compatible = "fsl,qe-ic";
+            reg = <0x80 0x80>;
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            interrupts = <95 2 0 0  94 2 0 0>;
+        };
+
+        si@700 {
+            compatible = "fsl,t1040-qe-si";
+            reg = <0x700 0x80>;
+        };
+
+        siram@1000 {
+          compatible = "fsl,t1040-qe-siram";
+          reg = <0x1000 0x800>;
+        };
+
+        muram@10000 {
+            compatible = "fsl,qe-muram", "fsl,cpm-muram";
+            ranges = <0 0x00010000 0x0000c000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+              data-only@0{
+                  compatible = "fsl,qe-muram-data",
+                              "fsl,cpm-muram-data";
+                  reg = <0 0xc000>;
+              };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
deleted file mode 100644
index 05ec2a838c54b..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
+++ /dev/null
@@ -1,178 +0,0 @@
-* Freescale QUICC Engine module (QE)
-This represents qe module that is installed on PowerQUICC II Pro.
-
-NOTE:  This is an interim binding; it should be updated to fit
-in with the CPM binding later in this document.
-
-Basically, it is a bus of devices, that could act more or less
-as a complete entity (UCC, USB etc ). All of them should be siblings on
-the "root" qe node, using the common properties from there.
-The description below applies to the qe of MPC8360 and
-more nodes and properties would be extended in the future.
-
-i) Root QE device
-
-Required properties:
-- compatible : should be "fsl,qe";
-- model : precise model of the QE, Can be "QE", "CPM", or "CPM2"
-- reg : offset and length of the device registers.
-- bus-frequency : the clock frequency for QUICC Engine.
-- fsl,qe-num-riscs: define how many RISC engines the QE has.
-- fsl,qe-snums: This property has to be specified as '/bits/ 8' value,
-  defining the array of serial number (SNUM) values for the virtual
-  threads.
-
-Optional properties:
-- fsl,firmware-phandle:
-    Usage: required only if there is no fsl,qe-firmware child node
-    Value type: <phandle>
-    Definition: Points to a firmware node (see "QE Firmware Node" below)
-        that contains the firmware that should be uploaded for this QE.
-        The compatible property for the firmware node should say,
-        "fsl,qe-firmware".
-
-Recommended properties
-- brg-frequency : the internal clock source frequency for baud-rate
-  generators in Hz.
-
-Deprecated properties
-- fsl,qe-num-snums: define how many serial number(SNUM) the QE can use
-  for the threads. Use fsl,qe-snums instead to not only specify the
-  number of snums, but also their values.
-
-Example:
-     qe@e0100000 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#interrupt-cells = <2>;
-	compatible = "fsl,qe";
-	ranges = <0 e0100000 00100000>;
-	reg = <e0100000 480>;
-	brg-frequency = <0>;
-	bus-frequency = <179A7B00>;
-	fsl,qe-snums = /bits/ 8 <
-		0x04 0x05 0x0C 0x0D 0x14 0x15 0x1C 0x1D
-		0x24 0x25 0x2C 0x2D 0x34 0x35 0x88 0x89
-		0x98 0x99 0xA8 0xA9 0xB8 0xB9 0xC8 0xC9
-		0xD8 0xD9 0xE8 0xE9>;
-     }
-
-* Multi-User RAM (MURAM)
-
-Required properties:
-- compatible : should be "fsl,qe-muram", "fsl,cpm-muram".
-- mode : the could be "host" or "slave".
-- ranges : Should be defined as specified in 1) to describe the
-   translation of MURAM addresses.
-- data-only : sub-node which defines the address area under MURAM
-   bus that can be allocated as data/parameter
-
-Example:
-
-     muram@10000 {
-	compatible = "fsl,qe-muram", "fsl,cpm-muram";
-	ranges = <0 00010000 0000c000>;
-
-	data-only@0{
-		compatible = "fsl,qe-muram-data",
-			     "fsl,cpm-muram-data";
-		reg = <0 c000>;
-	};
-     };
-
-* Interrupt Controller (IC)
-
-Required properties:
-- compatible : should be "fsl,qe-ic".
-- reg : Address range of IC register set.
-- interrupts : interrupts generated by the device.
-- interrupt-controller : this device is a interrupt controller.
-
-Example:
-
-	qeic: interrupt-controller@80 {
-		interrupt-controller;
-		compatible = "fsl,qe-ic";
-		#address-cells = <0>;
-		#interrupt-cells = <1>;
-		reg = <0x80 0x80>;
-		interrupts = <95 2 0 0  94 2 0 0>;
-	};
-
-* Serial Interface Block (SI)
-
-The SI manages the routing of eight TDM lines to the QE block serial drivers
-, the MCC and the UCCs, for receive and transmit.
-
-Required properties:
-- compatible : must be "fsl,<chip>-qe-si". For t1040, must contain
-  "fsl,t1040-qe-si".
-- reg : Address range of SI register set.
-
-Example:
-
-	si1: si@700 {
-		compatible = "fsl,t1040-qe-si";
-		reg = <0x700 0x80>;
-	};
-
-* Serial Interface Block RAM(SIRAM)
-
-store the routing entries of SI
-
-Required properties:
-- compatible : should be "fsl,<chip>-qe-siram". For t1040, must contain
-  "fsl,t1040-qe-siram".
-- reg : Address range of SI RAM.
-
-Example:
-
-	siram1: siram@1000 {
-		compatible = "fsl,t1040-qe-siram";
-		reg = <0x1000 0x800>;
-	};
-
-* QE Firmware Node
-
-This node defines a firmware binary that is embedded in the device tree, for
-the purpose of passing the firmware from bootloader to the kernel, or from
-the hypervisor to the guest.
-
-The firmware node itself contains the firmware binary contents, a compatible
-property, and any firmware-specific properties.  The node should be placed
-inside a QE node that needs it.  Doing so eliminates the need for a
-fsl,firmware-phandle property.  Other QE nodes that need the same firmware
-should define an fsl,firmware-phandle property that points to the firmware node
-in the first QE node.
-
-The fsl,firmware property can be specified in the DTS (possibly using incbin)
-or can be inserted by the boot loader at boot time.
-
-Required properties:
-  - compatible
-      Usage: required
-      Value type: <string>
-      Definition: A standard property.  Specify a string that indicates what
-          kind of firmware it is.  For QE, this should be "fsl,qe-firmware".
-
-   - fsl,firmware
-      Usage: required
-      Value type: <prop-encoded-array>, encoded as an array of bytes
-      Definition: A standard property.  This property contains the firmware
-          binary "blob".
-
-Example:
-	qe1@e0080000 {
-		compatible = "fsl,qe";
-		qe_firmware:qe-firmware {
-			compatible = "fsl,qe-firmware";
-			fsl,firmware = [0x70 0xcd 0x00 0x00 0x01 0x46 0x45 ...];
-		};
-		...
-	};
-
-	qe2@e0090000 {
-		compatible = "fsl,qe";
-		fsl,firmware-phandle = <&qe_firmware>;
-		...
-	};

-- 
2.34.1

