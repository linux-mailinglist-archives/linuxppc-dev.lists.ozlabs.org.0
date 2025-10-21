Return-Path: <linuxppc-dev+bounces-13085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61432BF56FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 11:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crRNQ75kKz3020;
	Tue, 21 Oct 2025 20:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761037846;
	cv=pass; b=esBTfv+OGKflPwqsTzwTuhs9dCxCUWzj6lZwrgPXqkSJntyJq9W/uKSbXVEmRn7z7tzpGq2nH79jkxhZTWW23i/IRuCy4WAUPM/Y6XyMxIX6ol12xcOlfnbjsZFBXpF2wD4kfKRhAAwbthwIemlezqE1fV7EqhzDf0IK/klZQG4Tj72HPqRH3hWN2nihwWVAYygdYaKo2uMsKMxojptTSofSDK7Ww/pchk/HdYshOv/gdgw+44bkl0d0jCztEF+IF0MusF653RjbtlDK6s4ElvmtRjGIjm49HG8LwQbwYZ6FngGu6a5rZOgSNXAgT/NHsguqQh094GdEJxKVjSYZqw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761037846; c=relaxed/relaxed;
	bh=o97K3ocqKAgrqfZnOX6yUaE6TNef9f1AB8nxNU1ex64=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hEo6lpOdmwPw/QCgOJjo1s3Py/8ODTXKlIlFF2mEMCiWSDDbJZJG4nJLabhkSn1hCk4HVy2XCoK3TnmHH1MfgWR/EU0ZJpfXVlkBQmZYmYVNO4TzA/YDs+eq27xAqaQ2BMT0ArKkCIRjeZma9FhZfSSizRRwCn9t5R1t7pRSDUCN3di/F+lpEDN1pV0bk/iL+VlbteJd0qFe6d91qSDcnumbyICwKNGD4naCP/VnOPNyRL+SlM96ljZIrMawylY2LEAJ3xbzzjtBDjnbnr6iyjsLngFcr/cHMmCnhHDWxY2ax9YOeiS2CJtTJaMfT7Rr9mVEjDFxNui62Sbef5X+vQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YA7J5EnD; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YA7J5EnD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crRNP1gq2z2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 20:10:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYZFPZF6vD9Qa4XX8LtROgNI62CUB8NrahcCfW6rb3i2VziATTtLQyeDDeRJcCdNp4SM/kdNhbW+MlXoTSJV+2ASgMBdkcFpKvvzB3bbl3RbNuRokpu4lla1rNEqDkiHGIoFWBTsLzwc4vUdnDyHtWhQkvLz01R0U9xR9vnAN+8LKsNhQ0AIOi/KPmOC1neZt+Kz8hh1eObI78xjV2xNrcYnpZ2vK4rxOXkMi+ABLoOS26XPXUl8N1qsPRH2oJN3pnZgNfRNPGx5R7nFoAuryEXmbyAw/QMtsGLFV5b8o/2riziYxxrkQlOmvXn6Sag0/CpPUGO6uo7aLWhHPQ0p2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o97K3ocqKAgrqfZnOX6yUaE6TNef9f1AB8nxNU1ex64=;
 b=YS4C0tpM/hMUbRbYsnW/wAhT9x9O9XmEUTRtd29utEUNSAPpBQWPG2vOZHvfoZaE8VZjU749TJoa05VTEE4FNKEcsj2qVL1e1k2B6v+41FpMIMc/Qj9tDeXwCvyXYxIfJyIP8k5WyRIkTVelGxXBALnJRkTbJ6dZ+KZB7+uDOAQo3Ogjw2Lgt54zVaDl8/doEH15A9ncoG85mwMqVRkdFr9wT4Dd4GOy5kZo0j9GTF8y89/bieKR2+lL2208+Q38JBoggdUcV3STbNNl9eUCrUKsezzo6kcgWnzeEWKRdZInXEKtLQcXXWQfU8jFouSGJ+OtaynO76TFixEYjZBtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o97K3ocqKAgrqfZnOX6yUaE6TNef9f1AB8nxNU1ex64=;
 b=YA7J5EnDXT6ziAOwyBkgJcoq4vQiwps5G7PEL2q0A7J3R7fYfTotaOFc6hoUetCAghqHAn5xlUQLr2u46gV0IPMa/ar9Kl0JV9ZsUgPbnWeVuGJ552IrKYEvWjdqxMfH0yRfWJAlq1ZXbuKmHZESqJorecQ1kSdlYtgka07c1uxWUBZgOE2cR1IDCzACjhCPAWreQGoVXX1Y2/6WFBi3uZentQ5IJ94rcoSV0ozeZxnd01t6x1NduwzCTwC1fc7cbtpYQVVMlpr3fPtfzDbENDhVcuRzztkqDCq+B71PCtR+zmvl2yy2zf8BXr2FwdCb+5iTmZbFP64eSFQMtD8fvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AMBPR04MB11812.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 09:10:22 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 09:10:21 +0000
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
Subject: [PATCH] ASoC: fsl_aud2htx: add IEC958_SUBFRAME_LE format in supported list
Date: Tue, 21 Oct 2025 17:09:33 +0800
Message-Id: <20251021090933.3470495-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AMBPR04MB11812:EE_
X-MS-Office365-Filtering-Correlation-Id: f21b4399-93b2-43e7-16cb-08de1081a990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|19092799006|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3eq+bl5LYlRhUeOH9VgCa0K5xdEuhQZ9ye2wlo1ye0BP3bHkRy3lejZwByXk?=
 =?us-ascii?Q?10mUqvmWlnwsMKavlCUZC1dMeNZn7fg4TgziEsak+oaH7rqC6rqdqOANQt2c?=
 =?us-ascii?Q?RaKrG/AjXQFLX1c6wZay7Qw0iZdJMRarUKUXsM1i16WjMxNqqDyIfQp1QjzK?=
 =?us-ascii?Q?3zbKVe92P5MRMaZc2guBrZjWrI749aXqrhgfuGfNF776dJJeczzFXI1nfxaD?=
 =?us-ascii?Q?TPf8Rmrr8W/JAg7XXJJTvsZRadibrcP5iNk+EJpi4+8vnOycAR6nAKc5GTXv?=
 =?us-ascii?Q?9UE7gH+vVDIA3ENaTkIVOk9u/PJH3HIHnTywNvXJpaKwr1LA559fHePBnrxP?=
 =?us-ascii?Q?0HS6EKc3BfIBztRE8cTw4Wj183hwLxLuPrVUvQx/3sWGV4wdmm3vWdoDz1gn?=
 =?us-ascii?Q?zMjhMPFV9CHzkkm50NzVE9r8na4+F7ALH9V5gas7DnyGNx6a9xIQo4XB2a6D?=
 =?us-ascii?Q?xa88qP03QLKpFAkEF+Ho1r9M8IRuGb6FCaVixeCfmvyUv7uRI9VROmvsdNj+?=
 =?us-ascii?Q?INhChmP0FFSJ+Svt3Q1+TSryY2jqJ7dbTvIJTuhf+F4lm+YydzSFQU3BoYGx?=
 =?us-ascii?Q?wF9V0c5qkG9sJTwqNlcRX+YPbCmYo1AQOcPrEkAsGiFnTffnxlbUhHUuenH5?=
 =?us-ascii?Q?OFa1JYYMY0RVkoRVuZXCp1P9oaBUUIVAWYUinwInleemKm6IHe3K2l4LNyLE?=
 =?us-ascii?Q?Cf1kD85FPojyPkMX2Xq8+SLReSyRhPzRPl+COhSwORa1G7m3lInhh9ngTIcu?=
 =?us-ascii?Q?tPTyNBgUAU4E9cX0TfYAk2514EuaEHwbFUP28Ny/EnCwHNIcfowfMty+k/AZ?=
 =?us-ascii?Q?KoTENLsv+GLQQgN2Y3OS3mO0ueTrEcZryZw5aYYtjtlFx4Yw8xPysPe5Uw4V?=
 =?us-ascii?Q?9QTYRQTcAFECKqKN56ZRC8MzB5zaKn2vUL/HEhyf1MQMz1+Jbh/a5Byk8vli?=
 =?us-ascii?Q?vcwYaNtPQ5qrlGIZCafjuQQXzIaF2mtbAi8B0fV0WwlLGuCP9TBb/uSCHSET?=
 =?us-ascii?Q?9U7REHRFw5+fz4QN6GaXceFLckCy8pMN11eIzvi8wkAiFM+j6FGbLWt4ZPqe?=
 =?us-ascii?Q?e0l6wHR1N6iZZHwZl38Mk+0bRY5B7VReWb2RYYRWsxXyRBKQNBAuQQTHyb1v?=
 =?us-ascii?Q?IGs0lx9rNWg3pqaxwHjLu5lNx2Aenoq+Fc/nX3bTNIuYchB3lQgvSr6uwM6A?=
 =?us-ascii?Q?5aun6f3OJGQrOeOBaShm0e7s/+KMo1JZPip4l8D+asfh0AdX97Y6eTaq8yid?=
 =?us-ascii?Q?llz12Juj8p3PEfvGJy6bPz2AroOXhNBTYUOhaiEKwunKr1snFLHrBbzRZz+e?=
 =?us-ascii?Q?k0W/Y0tK7LiMJ5iHULymu4UIEiM3o98FzNoUcgkEiW6TdaU/w7TyHviTzfhG?=
 =?us-ascii?Q?JqzgIcGc/8VmmhVGh+3zZJFnCo8v+qiVhjJC9Dijdg8CxkUGkYffm1hVCkdf?=
 =?us-ascii?Q?+nhWvM8Ikcv1efS1/tDwMOMqlQrs66G1HfaFZE9loqXIATiGpZKr/LSLYGdK?=
 =?us-ascii?Q?/ZKPSlRc3VXuVDqUdz2pre3sTtVVo0qsBDPAfRE2dYKsFGFCJBAKGPHqSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(19092799006)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eOK2uvc3F/afrMByXJySx9u3UjDHHqjmVKWWJtg1Er3o1mpXZbEQfgkfW4Uh?=
 =?us-ascii?Q?N1KSk09rqWWBy0NE44btEwv6T45Eq5mC/8b1wAgMM2MpPs0sjQyWZVPJa+uW?=
 =?us-ascii?Q?MTDBiu+jaCYNOJ6MVjOEU5OfI2NP3b3IMdQxBPvqv5ze746XzRE6i/eV8gwc?=
 =?us-ascii?Q?SIE8Yq8admin0BHStVWPyrGSMbhK7nbpWimdAZMDjJeHFLvbGL9x50PXWMJx?=
 =?us-ascii?Q?2IQalIPCfCPaYhUOw2A2+tEA/3rO3Fe2AjeK9nGs7DuDUf8niMA9RIZ3m+0L?=
 =?us-ascii?Q?aPW4D1x4UJm1QGjwzLSh81nayuUfvEw6AGAlL7myjw01ne9HXhS58b7j5AoS?=
 =?us-ascii?Q?IOmVLFFEm+6qLdIgga4WsdfHK7HGFGLDSCTPIjWeHAh2nSbIoQByp8nrYAEl?=
 =?us-ascii?Q?j+eqaz8eTpBYoOwCKhcWWof27l2iPWbtVWbgvEcLM1APAzkjQGh7D33tWvew?=
 =?us-ascii?Q?LIk5XPffhUBIzrl48+9Ekm8e/ygUWkKVHFudk8B/Ng5EoRQLR6jNfFLkMKiN?=
 =?us-ascii?Q?uaL7445gh2QuIqfcgcZpaeCU7dLYTK2f94f8M3ZtgJq9T8r/xol+F/EuLL7s?=
 =?us-ascii?Q?fbdUun6nyvMmH2EB5S7R6/zTPklr2ev8l1sEMNrIX96m9jBYh/7y1dl0hgM5?=
 =?us-ascii?Q?fS6fd30+VCOOOCS2c71GWakQyrGAC/cDrRY35e/wYa1MVx8WDc0m++wG3EhO?=
 =?us-ascii?Q?615whx9TqazogGlq5Xxn7vRqXuYNDW8XgVJHKfTl3ch1JH6GKvAJwL0ZtNpi?=
 =?us-ascii?Q?vGqrLml1NoJndsoS79nDcDZAyk/95o7SjCDnriT67/y0GsbfFTlrfrkp4rOD?=
 =?us-ascii?Q?nQl5k+8doQeQZnioI00lRE5k1t6MbKj9GT6AxNQ3RYJ98bczLI+ASXZ+dOgQ?=
 =?us-ascii?Q?cZyuIu9UEM+F6B5eVqLp3nJUqiIOsbKn+VPfnz1LKNsIG5yLm8H9RTndcyCJ?=
 =?us-ascii?Q?clZlHSsW4TEr+XZTY0TGxfJD7CF29J1nXC+tznc3krCqz0ECtaxg35mtB8LW?=
 =?us-ascii?Q?BuULwu4JfeCdmVX7BtN9kZFxxk0RIlJTnhzjqdSiwhEF0EzisN5OtqgZYoRb?=
 =?us-ascii?Q?7uMvUfKIktXPO96hUmN6l5tUbOp+L2iQETLRn25TENjmaaTid9qvHKdS4kF5?=
 =?us-ascii?Q?cgTQMtOOcsRvb4iMrz2sZaSO3dnzqyMyu6W0XrZ1DQ/Zqda8cYJG7pH9P3bh?=
 =?us-ascii?Q?yPmed6qgRQlyfhqKrSdEXRsQDwj8CFSM0A/shffBhVhTU9QdXFmb3RdknrnC?=
 =?us-ascii?Q?lILI/o7oe/qv256Mc7CcwCzqgJRxY8hIglCjtzWHjXUzcObeBElyRl0lVgUH?=
 =?us-ascii?Q?lBEnQu9VrUF/mYJkUuKSvvyHE6ibVQwB7oYxNydVy6z6OuELiNK3P+uO/Npo?=
 =?us-ascii?Q?9aluCFJ0dFSiVSOnE918JpUBVxtqHbvBeVfYAcHtRRmXAgSiZ1oiBTiWNmRq?=
 =?us-ascii?Q?DDs2dxRMvJN3q4Vc40JqBdDflHe7Ra4OFbVgVoqAyuk3RX+Vg9dEq7BaFHm6?=
 =?us-ascii?Q?KIQAWqKhiOTHJQf0HrWPUH2qBPHXU6FqJYvHHnRTjpBjq5wB/Dc7PzEpALP4?=
 =?us-ascii?Q?fX0nOi9L399wFAZRDg6B08KWANNfhfnqfDVGEUdS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21b4399-93b2-43e7-16cb-08de1081a990
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 09:10:21.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qG4/g6PymCu44PsHR4O3Fzv3gaEg4R7wpDgnEqKpQ+DigFkKr7cXJmvJ9ZenbnGfI1N5ind2Jki/advB2Nf62A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11812
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Besides S24_LE and S32_LE, the IEC958_SUBFRAME_LE format is also
supported by this HDMI audio interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_aud2htx.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.h b/sound/soc/fsl/fsl_aud2htx.h
index ad70d6a7694c..cf292e3ccc02 100644
--- a/sound/soc/fsl/fsl_aud2htx.h
+++ b/sound/soc/fsl/fsl_aud2htx.h
@@ -7,7 +7,8 @@
 #define _FSL_AUD2HTX_H
 
 #define FSL_AUD2HTX_FORMATS (SNDRV_PCM_FMTBIT_S24_LE | \
-			     SNDRV_PCM_FMTBIT_S32_LE)
+			     SNDRV_PCM_FMTBIT_S32_LE | \
+			     SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 /* AUD2HTX Register Map */
 #define AUD2HTX_CTRL          0x0   /* AUD2HTX Control Register */
-- 
2.34.1


