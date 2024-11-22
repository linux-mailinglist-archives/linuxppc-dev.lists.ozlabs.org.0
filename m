Return-Path: <linuxppc-dev+bounces-3492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC189D57AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvdN50nVKz30DL;
	Fri, 22 Nov 2024 12:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732240229;
	cv=pass; b=lsiVYoobsec476nxdOjWBVe1N/JmqLe8++joz+BNz/3f4Nl0Ne4VaOblvSpzp+gvu2zF/ezqMCzRvQtlHpUZV6/TJk/dVhKM11Gd+p3OzvQeJAbnljVacgY3IZSWCzvSoMjI/w2TGgi5TCfnyyDyJHU3rxR4xBslREBFnT5JLzscZvvJ2jMDNpBc/9ARuqMY2zpoX1nNGYpvmDcxtdm56PiufKJ9kCqZuQpXGF1QqhGwTZmkBL4OLqFK+cRfHf/t3dHfVKtseO6BrqGlQ2+zJFGqBR99AfyNeaP3KzoXx6+tt1YX8GhhRHyBFSdHL/cLG/rjovR9ttQ3veRSdkm9vA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732240229; c=relaxed/relaxed;
	bh=ZdsVy4/4AcNncYZKeMPoGXoCE9jPhO1Ja+ul7tVf3Ik=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mjwDPLQNIUhNmhxPivwvcXI6bPIbbqPOJop4Cfpwz3bvgissG9uQ5vtSkZJBkPHwIJDCb8UWQCqamNfvf5hrVbMv+pRlnJzlxkWkzamnQVeOQwVvobavnCDxSVXvJSrkOR3yMThHyTdbfttukbLcndGC3tzARYA5b3QWZU8DL4ENpyGKqYiL6IrnaQDLbT0MB0BGRI69xXmVg0VbOBGF/TPjfG4dpVip3ANl1VtMiEro2+ZfV93NY2G9cnTTYPOPUKuzwJLIEQK/NR0CzWBKybn5SOUgsfdjfARC3oHqCjIf+W5PZPaR3LhsPi8GObbEfGkAAbHfGD6Aj8JlF1rSUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JPeohgHw; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JPeohgHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvdN43FBlz3bZq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:50:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfRiWkEkZA5D0Q/7CNYA9FqxiCLYWh3wcXvjnBPEty5xURy2906w98O0K7GE2em6pCYQDHGynUP13wBD5BjK9fMAnpl9b8yef+wJtVTpVWCp2vsviFnim6twykNb0lJ0aG3zOVaKldAI2yiX+VOE7y/nHxAOH8cd4P1llive8KZQC2BfCmgGX4lNVN4dcG8dK/hiHk7HBP9AR6BBeivEth63JO3ZuctIQxv9QIIl6yT/Z/C9/QvvN5nvXtcNljlim2T7tnHTJ06UqYUsbTn86mFthQq9BT5BwqZRr1rmwCFm6CEvVWXMiDFoC76jAQwWE5YcRy/gaK930iZvPa8sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdsVy4/4AcNncYZKeMPoGXoCE9jPhO1Ja+ul7tVf3Ik=;
 b=GxKxbelE+ToseUnrzeKRQGatjy/mocSivj+YAE1by4UCfjfZNY/RBPID/NGTR3l88HWvgEzbOFk6I3agxufhUGsDrLt1yIpfEmimxSKfZaz28kBfRNVJEnzn2dNPWfUsag65CrBMKLG34Q1yUvrR0ghNcuPVBRLbxevNsIxWBRfAYFXpEtE+v4yvjSzvOCqAMUBmcRaX3syUIRGiqDdTcYDt2tmY+WzZHOtDl3JuCJYZieHJ+As8BX1RYn8PBy3JthBVrXoTngLfKh/d1xf6eBG0OtUrvToTa6ONUAMwQ1ZppzbX44cGqRfquf7Wzv5Cp7PGmDAs3i6tQgk1hwRiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdsVy4/4AcNncYZKeMPoGXoCE9jPhO1Ja+ul7tVf3Ik=;
 b=JPeohgHwxNAUFPBr5dUzOyvj3I5bBWPFCPySCuNCFqEwpgsU+KYgaTNbJsYOK7kp4njYtSzl1TQ+PihaV+JF4Q5vsxjMiTcH4y5lGUj6WZNMGsT0DgKIniCElHrgBPo3Kal7BsjKKAyrY3AOmymUubEKC2rMmnX1j+tPGU+XJueM/qZPzcyeUJpGHvKb7Zy4Gq6UN64/Ub2CJREgNdr3zSgMYR2O/OUKsupA8aFeLYLAlBHShWtRL/PYeooMRss80vz5SY8IzcaHnpdlQlcSKHtFALS6Age1t8VcqiHmFyySRW/8zbt9hvwhTCeZ+xV4WxspnxhnnRISeg+KuRgLiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS8PR04MB8929.eurprd04.prod.outlook.com (2603:10a6:20b:42c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 01:50:13 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8158.013; Fri, 22 Nov 2024
 01:50:13 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_spdif: change IFACE_PCM to IFACE_MIXER
Date: Fri, 22 Nov 2024 09:49:41 +0800
Message-Id: <20241122014941.503789-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241122014941.503789-1-shengjiu.wang@nxp.com>
References: <20241122014941.503789-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS8PR04MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: d8892175-d843-41fc-7e96-08dd0a98013f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?doT4SM7S9NTqVCssiFQrG0JH+SURAtLcSbiFBdjvuSVUAf4Q4f2EuUEtINg1?=
 =?us-ascii?Q?W4oQUbFOzeMoMKKnPcE+k2yPtZvOM/3SivGka+PzGLiaavInqWJ4v7A9VZXM?=
 =?us-ascii?Q?fl2RTgId+WeKsf612u0Pv1JM/cSo7Rpv1nLRDMplUcWj6fAeWMXnRay49aqr?=
 =?us-ascii?Q?KH06GNI8xEe4Y+vYAZc2nGtx1ey3XC7frwiP8ueF+4CnS7syKTZoQIoTPI3M?=
 =?us-ascii?Q?hp/NHVAaz7yVRSHnWl2czWSFVTbYEHXeFGvlG9Xscy01SfbeKp87gHsrCOg5?=
 =?us-ascii?Q?iv0Pj2nIm/hNHEog4L6i1wSq/rK6NpJVFo1digXB40VqHNkttJ0g+5h8VnkQ?=
 =?us-ascii?Q?Ag6ZptTtzbpjQDHpsB4ruKr+ns5GRrc/VMaBpP/EcWXMIfRXyJFLIUsb3XsF?=
 =?us-ascii?Q?DEl1nwYDiDMqimGW2vwIuGhGouO7JkzGiGczWLlC064c/lHsgAPHrY1tmlV7?=
 =?us-ascii?Q?qqXUD5ZDhqqqzTNBOX2TDnOGxVigFFvNd7XsbROZ1BeNVIh52VZEKxXQ3+bs?=
 =?us-ascii?Q?7ndemrtYILO5tAjsR7x4C+UizwiKIQ5eu/eUFi8EDbJ4OoUXAjQSHLnr/MkO?=
 =?us-ascii?Q?nbsB0CR62uUNULIQrmsaqZ9OjKIsN2q7AMbsA5RNLVLgGZk+ffBp/N9iOPxB?=
 =?us-ascii?Q?92j1uf+a3OoBh01YfZBh10MhhgO55J+ZmO6syYW/uYLGthqqsrv0fypeIvDw?=
 =?us-ascii?Q?y03jZh4UfLNUk55i/5VAP3UerblJCxaK9d0t4L/8uA9gmigtOq1un0buywaL?=
 =?us-ascii?Q?qgxEtJ0XkXpdOZ9fOEbRYur044NsGn7xWq0Dszrr5qGW8lwyQfv25HCdAnly?=
 =?us-ascii?Q?sToXxO9I/FcUKpTzYRX+YYCFwLyg+7d1sLDyY9AX/jh2ylYGkWMDczybrd7l?=
 =?us-ascii?Q?EmdMDoKIwXZ+HlQVgna/Pjwc7OmgbYHOPK84QpaGZ06AukBBSSeJ86PE7CdV?=
 =?us-ascii?Q?vuU3eEcbmeqv9Plg/xCTaYGJl4ELIu2Bud3Ymy5f3KLM0lYQ016te+fEqhSm?=
 =?us-ascii?Q?nlkvW24/pfu9qfsLxqi1HffVC8PfskSTdY4s9LUYN5dhIeR/8MT8qXsflh5T?=
 =?us-ascii?Q?BkO0R0b2+QHxcAvKxZ4ni6RFd50kJ2wOpbu0xWLQLnNCvRCeZWeAYilNtAMV?=
 =?us-ascii?Q?9aeeoHMi81i5QB0TO2NrSs9eEuFk9nEiJJS76YxN50oBY0ADbF29DzUsMitC?=
 =?us-ascii?Q?ceogIj5dcXDORhRTbLOx7JGu7mT0LwtKhVeWRuuTwcmNnl0vaarvosGMOH4E?=
 =?us-ascii?Q?jtJwM+ulqiJ7+AN0EI46y/3nVeLrByDfrUYlYCSOsWsoWA947SF4e0CkegCc?=
 =?us-ascii?Q?WpBjn+m6/BNH+Uj79E/XY20MekSdaqmzHvcyLnzKOMBynmI3eZU8LfHmRkm3?=
 =?us-ascii?Q?Ot52GBnk2JN8KfC4qgaBPUCR/j8n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aSShuNhwIEHOKxmHabtmXtTM6BczIrx4gBpcf3IpVqAv9LCA4X7pvJ5f2wl1?=
 =?us-ascii?Q?MBmGm6k/VeDEq7HhKjTPEhyi5VhpYA/EKfAGaQmhHgVJSGmwt4H42Mnq8zeR?=
 =?us-ascii?Q?OUbyBsX8GnNLOz6rFDtog6smeZ+5N6zcNs6GFTU/DI3jgCuBqS1V3j7fdV2H?=
 =?us-ascii?Q?UOcrbiz7p3hsI9L6VpLw0f3+V5rOW2OtE6vxt2DXSUgMR3fSi5JGQudLd/3s?=
 =?us-ascii?Q?N8s5ZB6MbSplSXaM1Zt7RozNwWFWVT3V8NKc0rMFAL+pbUrZiosUEYeWCenv?=
 =?us-ascii?Q?i42ZI5zFyEjn0u/MC6seQIcCv13QeTxOQBTaVTNolqDWpK0T1R1JKzbOK+a1?=
 =?us-ascii?Q?LScNk4cW3HLNkJky9TUmqCarWz4F3JQLcuDzCpYw+OIXMG1p77O7trRpDGaq?=
 =?us-ascii?Q?XJF1FU5i5ElLwECJ5Y7VOl2aFMEYGe98xleX3zF/Nm+CoNWlbLjwVG+4XG0T?=
 =?us-ascii?Q?TtToCZVDy8j8IaFGqfEcID2iuhH+nFsjGVS70XKLM+5IqwblFZ6IYRvbCBAZ?=
 =?us-ascii?Q?1iwKIlGyKRpoL4j6wK/eOwvVPFnfDd9tzPojHvuaA+hHVSsAX4e7ta492FKQ?=
 =?us-ascii?Q?MFB3swj84+AJRO5ny3O1ONqdLbgkVLS6zMKa70hUjCI5rSYJUVftZeeF8XVL?=
 =?us-ascii?Q?wpywNAFsxtY7CC7GH73ENl3k1zy1TlR4dAg6kOF9NsmldUnKOvbTQXmf2Rb3?=
 =?us-ascii?Q?i+lUzUp6qwXpmZzBBZszVDq7cE//dgQP20dEyRGHEAsct3KFXpaCi01ZSL73?=
 =?us-ascii?Q?hbsvTYOYgczzYZN1EC9O9YPJMtt9Uh5OaHlNBOreyTCXeWorGEdTlfzaktZL?=
 =?us-ascii?Q?+EXenyTQ1S8PCMyLG/A6Dv7VUOHMIBhrzvbg9PNsFZHo6lEbT2BBkWp/8QF6?=
 =?us-ascii?Q?1nGL0/dXgpRnEJlFhgd7+SoKrgz8W2Q/VOPK2yAqYardOg1mfjMM/sFiWcMe?=
 =?us-ascii?Q?44+CYMwZ74Qe2eYkKvdTYB6SHdmW0xP1372eeOpWlLNytfwOpmK2D5uLzihf?=
 =?us-ascii?Q?RpUKH/nPBzFUpvLMmemyRnbmwq2MgRqRzqvTT4kbWrp2aIDUPbiUgPJhpM6M?=
 =?us-ascii?Q?K1AgU0VywHjSCeDyHsY04t3nrLrKUAQwZED6E8E+Zoj6WYB8pGtwwaYg0FWm?=
 =?us-ascii?Q?Hcr5SBM6zeUshWyZ2keaCb3PR8apFna5acqDuoPA7+2nei/l0iVS27VATdqM?=
 =?us-ascii?Q?HRatfTFSjEhCoMgc/ZSuA1w50neDLhsafyZ5J61Q9pfj22ZX2+h3JozxAB0S?=
 =?us-ascii?Q?dzuKYDTfBmQiMPUUjIBu33hKNAouwDG23JMSC2hHsUIkCIL+9UQP8avEEIA4?=
 =?us-ascii?Q?02LDXcQgfHGd4MNi3w6oOICr2PTETAVl2du4jpjlyHI+Yfd0jszqd+JjVy+5?=
 =?us-ascii?Q?65coK8PiPomGtlXz67gCX4/WhRWj9zU8REw8nTUPmSbug+U5q6bodBHht+j/?=
 =?us-ascii?Q?gq/IA6R0VAsTMhojjwafAojjxFp8LeJRPui8BEsWLRprhe2L2t3t+gBkSuuV?=
 =?us-ascii?Q?LEsQz9GMr/LqNrR0w3cIVthyKdtkuyBULaF84B4sRXAXBEtVwkuFha1zlD6f?=
 =?us-ascii?Q?Z2Bl5criZ8iYIVF8V36gV7OmSoj0ibTuvWzbtaZp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8892175-d843-41fc-7e96-08dd0a98013f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:50:13.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt2hBwgQjsZ0cN6lN9G2mrr6yJ4Khmeh6LYhlguPNmc7l9aVMoe+GcqWFdSDZLiEUFa6XK4nmQDgg9ikNZ21Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8929
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As the snd_soc_card_get_kcontrol() is updated to use
snd_ctl_find_id_mixer() in
commit 897cc72b0837 ("ASoC: soc-card: Use
snd_ctl_find_id_mixer() instead of open-coding")
which make the iface fix to be IFACE_MIXER.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index b6ff04f7138a..ee946e0d3f49 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1204,7 +1204,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	},
 	/* DPLL lock info get controller */
 	{
-		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = RX_SAMPLE_RATE_KCONTROL,
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-- 
2.34.1


