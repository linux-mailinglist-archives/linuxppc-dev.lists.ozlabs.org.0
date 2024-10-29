Return-Path: <linuxppc-dev+bounces-2664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD89B4031
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 03:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctzJ4wTmz2yR9;
	Tue, 29 Oct 2024 13:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167884;
	cv=pass; b=VTg505UD5oBvaY8dL8HTTpxulxqYZZRfuMs9NKyb+qZYp+NnJHx4dY58xOQoIKLcWg6OEFn32C+Lx05AAfMYm0gr2uup4m0SfgPbXychf/2a+NXGUSfxSxRQ7/pjF5UVQ8Qo2I+uR7YTZmpcTuWxIG+a0N04w7NpzO7mmozgWEdLDGCFx/4U2GKkVmDPHZuIdMGY7ahSDwS4tpjg0iOEmok6oLl/Bv6osbelO+DOFd3v25T9bWSaiBU9K4alXrGXQF9ISVSDcKu6gquAX87YJLbykufAOGJIRLUC4BpEA/Zxo+1eRKNitME3G8Z/55ZheWTLAdGKjI2xP+GzmSfGww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167884; c=relaxed/relaxed;
	bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K8QcZoyNxqGxBpgllLER5mqxwa8vNtUxzxTuq/RUJ6WTcpoxvrhOqFJ3uEwNMhdh2h4WZcYZ1NXLLqhNBuH/xWqRfakL7+FRwwhS8yVBGpcYvuIzyNiuua6EGTPtcy8PxFNN/YKmpFmBAjR9//ILmPFx2xfFh0AbMwF/7uM36eri23sNHjzoYpiRk5i4TbqatTV0lcYIHHtbC+AafsAnyh+bra6veDXYFxRiEMX6CN4N5MfFZ5MUla0F3AlEl2s5gNO20TPPljQZ5LuAB1U0HvFH16RSE3bXQHMTCJslvXAR4Wo5D3etbwgdNC8ZMxnO1D54ekbkStEpw2NQgP7sxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JFiukXWY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JFiukXWY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctzH63FVz2yRZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 13:11:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUdOqpL0fv1pkeEDN1askesJEqFIZtCTuWzVp1R60cIYKISk9KOQgQOmPSHMEYjfHscTyc2Lc9Z/8CBDAHiwpioR1QvtyMMMSRF3eKy6/6Vo3gp63EIyFuKwiY+7KSTueA80xrHLlM5J2qPGA2S+ry04u1jNyIoRv0kFjNQe82Rng0gtGpx11PhLuGSdhaUkSJ5c4Wo9UOm1IecLsi4lU4+5nqrOPljotHGTkvfAPY7Y666oS5tGlzMAQkEaBcD7yrYBGox+8Cl9oLzNZSuNjtzXSpi2I6fzQPa38x7p5O5w4Yy2omz150yf8egVN5QOfNB0X+gy1lD85BNZHa/5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=QPzgZ93zOEbK4T558b+w7l/D9urpZ2iBORw72h3tHD8LMD0o0T6sYB9GnRd8GZ+PLUG0lUhAheMeT+HlhJXHdj1S//1AlcH9I/r5Fer6BthCezPQbirhaDuaAug0aufnvmUSyjsM79UiY8CO0RwZ7C6fAWLyudghu6rEfcZUMl9zolSzJVenvHnkAm/XIOy4BDVsdk2qru2rg06pbXNH1CunC/Ab2XB9ORBq0M0PMo+XqO4Rw4tDse/nW4JBXlro5VAT15PvpFxfuTcA8x3BmfoUvhxxr03rEORBbV8OvLj8OHG2dc7sBQhX8FYpzCeZOXL7MtNQer4mwOjvEtcWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=JFiukXWYatUzHxvq9J3jY8VpT6E2B3yuG7tu6Oe2ZRBgCp9sjoRIM2slmFO941hgtSRxt4KK+xD4kZaFxfwlPA+XNFHjd+XI+vzkrG+pMG7ANQvamAfvuSS57ly/ODA6eVOPR7KB6L6w9eKeSlZL1Q6gm3wA6tCCDTOqfc/mYuLkbscxBWuHRLisNYVZmBY69OYQwwzOoC71Qs7nhcX0eqDXJcPAq+z6aU3Uhd/zEn/m51lhvnWNilEdQwidK0kjBi4JOYzooKpYZ3uWob09l80XWb6p7clEVLfDitRokohUhG599pnqGf18urlRnF9fcnI+ucUwwIvQbo9Xzf6fGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:11:04 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:11:04 +0000
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
Subject: [PATCH v5 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Tue, 29 Oct 2024 10:20:53 +0800
Message-Id: <20241029022057.816402-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241029022057.816402-1-shengjiu.wang@nxp.com>
References: <20241029022057.816402-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: a048be78-b605-4614-6e86-08dcf7bef12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/1y+fV/OQfbn33QlD0y+/ATGlh+ThzIOoHZK5hjdnh1aqHYJJEnXHvJWQdW7?=
 =?us-ascii?Q?CZy++VAdFPavgviJ9ND11/MAwyYR6H0w3U+fR7LKS84Cv/2mtd7UgiYkXp7w?=
 =?us-ascii?Q?eJ6SxtG6u8XbXxjEdvPodlv5e87y1rizhsLd+Txe+Xa/ACQ7IXMvTI4nRqR7?=
 =?us-ascii?Q?O9pMDb5VHZMKo/TyU8qcYG74+cd/Bg9wqfoKieflW9MYt4h7DjKZeu12DwqM?=
 =?us-ascii?Q?xdUM6zLYU1gB0PDUlfvI9Lwhz7Q3ykEr+U7lmpmua6IV6hL1rWaL4R+Wutfc?=
 =?us-ascii?Q?+ilAAi3aGJMPz9eip0Ic5YZDA8E3dJuh5/2X831uK+v4cpWo6j3myT+38KTY?=
 =?us-ascii?Q?a8LixnxId7uwTOJu6kpTpDyIY3gcRS7gRMv/K5IXpmpboDwuAojJ3Isg+km2?=
 =?us-ascii?Q?Zuxm4n/MRDM9YHME4Bjw7UmbQEJhRFW51Yw/CO54Dnmk/SVx3+8/m8xkZSrJ?=
 =?us-ascii?Q?YoSY93v/Y9G2u89/h0qRD9OW/OVF4Q5ahMf8tY9teTMgVZKKSkYl721HSJVA?=
 =?us-ascii?Q?UnvOezKEuU1bHmvzkF1Ak8Vv21+20avO7Ob4mE3k9xjoR5v57Nhc0pNeGLgX?=
 =?us-ascii?Q?ilRTCnILOgl1vNZdD/RTswKZM0xNn3M663bYdGQVifNdKKuRuAAjiDms2l78?=
 =?us-ascii?Q?4R/hV/4ze0Vi6gMbzmXQ3TmqKWflQY/2Vb7r33Tw0X9gTOHGUgmaA6wNKtwv?=
 =?us-ascii?Q?1UDovd9llOPTyjBk8XM8R97grsF/kcQ7RyoJQjwKaMUK9LyXMsXRyvwk0Ghh?=
 =?us-ascii?Q?wUAkE+O3S8G/apm5+zn8fU+U42WaCPQANc/lxeRTjZmFzU9uS2b6/qtj0szH?=
 =?us-ascii?Q?2SdkP2nGqQVAASPT+2j8rTvtu4VU0yB698xkc32O9ZjfV4RAHwp0CM6B+Adq?=
 =?us-ascii?Q?oaYgNuzZDt3HDGR8rNdeRJZjUPWt8nSMfeKzrofVRxjgFy+owg36kVhDNtH2?=
 =?us-ascii?Q?YI+eWKWYOJU45Zc2d75ZxXHor5Bqirs+JJbXOW36MgI93fTHpOSkv+DSpLJ7?=
 =?us-ascii?Q?yVEOcyHK/2qDI2MKBHnm1/4UL50dZ4/5ZmLqWhQ5VuZSFz6/VV/jHN4u6VDs?=
 =?us-ascii?Q?r+hHD/skpbB3REMMmAALIHtD5h3i8NCuh5V+tRNblaUC27SITMPOG3zQAl2b?=
 =?us-ascii?Q?S//oZ8qo7ZnyW7/AUY09FhNoD6fhQpBE3HdL8CqRKcdBpwIXPtdsNwhu3RIM?=
 =?us-ascii?Q?SEOEqAS/VNWPykyZQBYbitnUtSSO7I4VPSC2B3RbhFT4XjvNQh86PxSCG/Hz?=
 =?us-ascii?Q?VS3XhjzI/9vnxJUA+PbZNXir0ycd8ejG1JYGrVDsr0cp1tHpDGeFJam1qZ1r?=
 =?us-ascii?Q?Vx1ymzTJoHBvMsK/r+fj3mZ8B9doKpNq8hW/KL1VLqemyCgk96oOA4ZpbfCq?=
 =?us-ascii?Q?OeP3iCtKuM8mWZdkghSCK+HxYG3G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?isG3eBmsSDebdBRXMqXf6ITQbDgwyYtSyQx55RAsQRfzv/nq70KlE+Lac2oN?=
 =?us-ascii?Q?dsm4aElaFgn6sAyXxRWu7zDVnF75OjNZ1aLck0mlWgxkj1NgYyS/VhkcSGWA?=
 =?us-ascii?Q?uG/mrp/kpc8rssgEh5W26HZY0YRMbfwU4jlictsCi47FHzLS/rz8dlvGWK+R?=
 =?us-ascii?Q?/+dzDb/BPh7Yj3nU7moIT/GN+AmrXnGp+y/qH1nuSEWAyDsWyvBbG9TeErfT?=
 =?us-ascii?Q?22iRv1dq2FD0UVsB/Jz+1Mgph8ROM2z2MmwUyzgimKjh9QIvsYec/U+QlFp5?=
 =?us-ascii?Q?p5nhyr4xBJOWBISedY2m6KkD8UOswELXeFFjnFgyWEdXsp2NRTR8fiEmVJaF?=
 =?us-ascii?Q?EXTqAAcBpXq24dmNvPbq+gjrWbn9vXsNvDOvXGluG6GSGbe2ZHDFD8NG1cn4?=
 =?us-ascii?Q?r2rndOTfOOga1uqZ0+OlHc6fZnL2+1QtYAoTEEzl7bLWaiYHAGOFBSz6G23I?=
 =?us-ascii?Q?XCpM2BdP0kcJfxxhegXwmsNvztV7Mbl6EHnL8eq3Y+cCHvpAG4NUfD7SrC1/?=
 =?us-ascii?Q?71yyTI0qIBTNRsHAqTMaT+xn31sdABWGNPdIYx3z8NmKM6S7An/jm/Zrw8Uf?=
 =?us-ascii?Q?Ntr+U3qipKgjPyzLdGRQDgG1hUOVi52QkOQI6NkcoLI6gaXeYzr2dcVLwqR6?=
 =?us-ascii?Q?QnQJIjCsAaO58V6kQSE3bzDlEwa2c4cXJHwLG9Yz8vjb2IGnmDzX7t3Hhu0N?=
 =?us-ascii?Q?12Io8mcjkeh37G5hA24ks5CBwARWxJ6i1MoZ/NfoabJkzxAg+qNIydU13H78?=
 =?us-ascii?Q?7rnF5tKhvwUCT30+4xgJPTpDLlEmvSF5JjMmU+6yVl8+hVbrPjQ58BSAZVcU?=
 =?us-ascii?Q?KSkyzp7Xd/EgfHCaPomyZxlMASdpuGXKdLnkHkESNCIfUWUR2eFHA6dHMn7L?=
 =?us-ascii?Q?AkIEc5J//rgFgzju0wVaD6tMFZIgAemfOe/5bC97KNwFi8zyfS0ztxxO3mwp?=
 =?us-ascii?Q?eGdYdt6ZRdO3RNpxoKhIpr/8E8kcKZZ5vU6/ARfkmEvp/UGRWajvrvFc7rtQ?=
 =?us-ascii?Q?yZHO8KlsqBNTYFbkANnmiZvRYIcuMlRMPOZ/8+x7MrpEoa2peVdF1g9DajrT?=
 =?us-ascii?Q?ADS5IP+rmWW8rynjnZEwbXXhtRVGzbia/9Zbw6VWe9TG8++Jrg4dHdlptR2r?=
 =?us-ascii?Q?NGwNmpZHMA+aGwf08Sc23NrV1XWgx+12IhaA3bdm/+zkpnHjuHEymsGO3YOE?=
 =?us-ascii?Q?YPlN+fX1OPnPxQV2NLu3T4aR+vK/I3JKF94LgknFqrIganBGykwqcD7Sp+eD?=
 =?us-ascii?Q?KZ7egNZwfz92pHvsqiGsbElxIrGKYo0sJRU6zyiTexxA1cnT/AYZ1Xb/WH8/?=
 =?us-ascii?Q?W4XS+Is2bYjk1NE1CBX5+lYEVAx2POlp6pM7K4ffN/ftjZeTh5/Fx1H3Tfyu?=
 =?us-ascii?Q?vWkR0bIrprL8wB/3FVtK45mjeU/YGW6x88MNg1t1khzL8gOsBv35JWIAMd6I?=
 =?us-ascii?Q?espTYfjYEYJtX/4b6Oh8lgWKsqCYz3NNu4YHZjrMbPuQUzYdl8b2H2s8lQYw?=
 =?us-ascii?Q?dgI93r2a5AsUsAMmdQEOPcHq3OAw7MAB6yU36hp7EzEb63vowcO7B0PL+19P?=
 =?us-ascii?Q?F8CGLUS5GaQkcvocbLJZFgi9oWsF6yl2q1ll26Id?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a048be78-b605-4614-6e86-08dcf7bef12e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:11:04.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21XftQy0JUf/YBg3qXSxhJG6BvLmLud6/+hsxA5hsp2PQDTc0rAaF9j/pUAxrs06AOBar+ng4VJoNepbr8+wjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c        | 142 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  61 ++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bd5c46d763c0..471753276209 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,139 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+
+	cap->rate_in = supported_asrc_rate;
+	cap->rate_in_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->rate_out = supported_asrc_rate;
+	cap->rate_out_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1280,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..3bdd6ea07c09 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,26 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	const unsigned int *rate_in;
+	int rate_in_count;
+	const unsigned int *rate_out;
+	int rate_out_count;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +54,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +76,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +108,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +144,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1


