Return-Path: <linuxppc-dev+bounces-10494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787EB17A18
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 01:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btQV66p1Cz30FR;
	Fri,  1 Aug 2025 09:37:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754005038;
	cv=pass; b=cmBFdBwg8SaLRsIytsm5Kb5vowXQCE0l9/yO24CsECzqjHc6QdBAxQGlPRiWRoC14Ryt3R8b81HJ0gXfc02zIyexIEyAzJy8VJSFNKGihyHfsx2eNMWpCSLEVOH9s2jhFlfyIyyVmpcpiqsnvmDahDOqngAwIjQpg+wxoQ62KpjIekeDtTQ2QOzzxRgWumnd3WoXY6pBudEE3kvwaO5gyUgciZIrMGE5JGboyPtrtfyEyM62ldDZNTjues1nE0zmLsMotIpbn2tNsbtyCsDGi4XCKotVv9S0HRe2apKqMM6/E8amIHclHX6yzi0gMjbRu/2g/kU3ZtGXNRuzWL9xQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754005038; c=relaxed/relaxed;
	bh=z5BdhBe9W1RjfOiX9l0KG+hYHkU4qJjy2RJm80wJTWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ngS5jwM3QAexkXkJIb0vWlayPX4SldtTayyPmUG6NRCL7LtO7T3ccZUsjSqsHxJuaEF5HzgpvBrPhxdNGQ8tb7+LoapdP1pshyC7TIPcBl5yXkuyYN97dF26maEXm7j4wZ0Nt0EcX0pK/rcqFFxkxF5Vz8PsGL7JFdwMLBwdONJm8rR2Lr89bq2Jv+RnSroBpfY5qZm1kcDtfr3AwXmmjbJP1xUAe9GASGdGI5LfQCZQpx3afyvYXjsRZNgm0wCOCU46E8FnYxX3SjjUVLkBcGlhsQtFsM0Spr9FH+TEjEt/bkxA3u6XsSBxXZQPJhC6hAzi62lWe1Akz426jfsrvg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Kg2NDonR; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Kg2NDonR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btQV26f2cz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 09:37:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpnrUsqDFtOrNenh06haNA+5VX3p+FkNVvE9pNlh9XmEUJaDju7mLjUNUF8dCJWXfv0GMlm6D0nsn41qjpYgYTFHP2xUWmYdTR8VCYStg23u8WI7t6XWoITAPR6jGCcct+obTxdLEXjiTzVPyapfKAG3JteB1f4rzeO/XzYVkYULTgQBDKTzfTxPRLiqWr0/W2bV4KW4mR1BxAK0jXv3fckrgWSwvhBQytoOyyowd0kMhHxwYEp+qZVjuahAvtacVPKFeQdY04aUAWFMFPenDlj0fmgrSg7Hl2s2d4WHT0jE9U0NIL23C1OdzTAEDGRTn8kFUsaCCwc32WWDVvrBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5BdhBe9W1RjfOiX9l0KG+hYHkU4qJjy2RJm80wJTWI=;
 b=SJ4pklHhsXZCnQtYRr0VjWRT8avmK5w9apnLyYNRjvNSBWuFwbOfEfUEEcWDi3k3ISLZAVMvXR5u/R66oPrY1FDiqImKcOY5dA3NCMmfBdkOJUmrTVsHLSpUk/B9J032+o6ehZlbqTixgTSn8RVuVlYZTMCPsd6k7y9He3/7G0w0gVrwWAAbdcs/GwWYEpZDiGaaSrFQU4xvaJWo7RJQ0q+HJxAde6R4/hrVYCNLwljo0DeuZSfvPliRTIaXXZ1AuntJMh5+FWfHnvia70hjVn4gwoe9L/Z7WNNdFeDZyXjDSxTRvgkQZmzXcBVWPcaMmyJXGApIHUCehjiXXWxg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5BdhBe9W1RjfOiX9l0KG+hYHkU4qJjy2RJm80wJTWI=;
 b=Kg2NDonRyK6jKEYcG7SsbyzEqOusocToCEwVryFyw9HWxGPk8wugNYb2mLk05sa+GD7wb1bf+TSKaJU1idIOPjWuwrrErSoa+AazgQQlZ6D3Njb48Zia1lXuk4c4yJ7QtA0x0EX1n4Ma5NmkZZuXqbuav/9eL74yy6a1LlmQACrlWX40gIpY8dEtqfivwp6Y42r+qW6axjEy3k01amzThYwEEKCrbZM1MJRuovo9QHoreDjsOWt+Y6sc8dZvJE+2l/P3Jtw1wFfMcww/yjerxz+yMFi5r5gSaVbHHGONYD6Rx3JUzHjCa0F2tkxFnYJ6AcceBecbEIU9f0o36xRcHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Thu, 31 Jul
 2025 23:36:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 23:36:49 +0000
Date: Thu, 31 Jul 2025 19:36:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: fsl,rcpm: Add
 #power-domain-cells
Message-ID: <aIv+CgkePusUoT6Q@lizhi-Precision-Tower-5810>
References: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
 <20250731-funky-crab-of-defense-7cd658@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-funky-crab-of-defense-7cd658@kuoka>
X-ClientProxiedBy: PH8PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 47629765-aaf7-4fed-315b-08ddd08b1f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLDOEoeNgIEsagELzDtd1CGkwYOL3DfWs5SfEEkGF4WPfMfWVA675BJDyuvs?=
 =?us-ascii?Q?roP5eQGDb4sTsMdhWgirOvGS/iqXNwdX3XH/lbfV1VPbkoGCX/f0BS/k7oqr?=
 =?us-ascii?Q?4KhDtyc6Vp51eUWM7/rHb5mFAWNhXV6URwxvzEGQcy6GImgVlCZbMk1sAQxE?=
 =?us-ascii?Q?YVpI1/FS6w5xoCTkd2t2Kw5wRKF8V1zVsehbhSbVX/+umWxd6ywr6b8LaYz5?=
 =?us-ascii?Q?7f+E8XuuH7w2KZqg0QwNsGZrsu0smBply/RdXOgd4dkSjZqREtxAguW+WxbD?=
 =?us-ascii?Q?dRmkNU2YAA3f7Sc7BWrYJzz++F3j0isOtyb67K2XHdYMWHonHBBPkgRInJHA?=
 =?us-ascii?Q?VBxxyTY7lnc69DsncZjtPL3RrYBmtUExeM9yZ9PCXw8Ac11efVDGeZ1sdfnY?=
 =?us-ascii?Q?6t+7MjOSrb5VbaJc7LD0b360zDZwHRSYTK6Y/W8lIaj5mxc4aYc48xETyrD5?=
 =?us-ascii?Q?ewajt3Kqzr+1HMlsx+SUuqKSWMyHXofMhI7XxuFqjbIUnkzwrIrohx593k9u?=
 =?us-ascii?Q?LI5iUnm23n5u6qDExxhZuvcUKONWpn4zSxu6nx/ysT6xxpxWDozLji3M1C3a?=
 =?us-ascii?Q?2jvBNg7w+2tuX1gVWUQ6LusU1xs1NqEM1YKXPs1BqycTBwcD4EcDK0VzIL9R?=
 =?us-ascii?Q?Gjgu43StiN9LNmXsIllRisXvDtpmw0eRbGH3/3viZ+h9BHHwZf1UcxrVGdS5?=
 =?us-ascii?Q?9L/KgY7AVQygfw/9XvKQiXWHsGwxCdJpH1Em3BLbBUoVOezmHCP5QjOqwyIF?=
 =?us-ascii?Q?uRLbVLHTKrfKIYnWxbyuNUv4wpYQ/ZPDVqADK46KT4hZ5hRAq+VqRYoWdIb0?=
 =?us-ascii?Q?jw/Buymekf/cq+tnX/5lYdkk+PssXiINC93ImI52g9hjRmYTJjWKyPvNfDUd?=
 =?us-ascii?Q?gOvt0hSae1tA3ufachyAymS45dw86egsXJ/vMuk/qnmgRpBf98Mz5GRgbkS3?=
 =?us-ascii?Q?yjdJbiidVVlvDf84iUHywydW1a1cQcKb1AIW4HSRzGP5sn/DAx/VoDD8OVTc?=
 =?us-ascii?Q?EdAYBEg8VbadOOT1I4TqBX7a4HjEW+zW9eaKN+LJX6x5Er2Z4K6ZfildZQOM?=
 =?us-ascii?Q?17Ai92hDjFYcMRNeo/nN54A8F7DJCpqQF+x1DFl0GOx/xFScUblDXN/fhbrw?=
 =?us-ascii?Q?Jf6lf4r9voEHe9UP724bwfh0U8D50tBCeU2D5C3msVyCmwDjSbYNqzpzYzF1?=
 =?us-ascii?Q?sk46244SFs/ZCX3iHX8bbghMAFByYaKTERiMiLqSnzG6SFilPwpEmFpV6zRa?=
 =?us-ascii?Q?+oDFAgyj4Hk7CZ3VA8BXicDonzdfPKHFT9HlTbZxtiWFSP3/gorVyXwK9H4+?=
 =?us-ascii?Q?HYQX/iu6Or4My1uGcIJqSKOmW4lfwbDoow+5Epta1nHqOD1HCc5RtOSVDWKs?=
 =?us-ascii?Q?V0aJR10VzxEfdeI0r9z5D50/4sCXtuFp9IJ6JOPt8s8TAkoujZBRik6UNqYn?=
 =?us-ascii?Q?5EWMKQQvoVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yquSXELLHW+s499olu8TTIoBEqFKsquf2cWiv+dyeeMxJqnyyeLQvttCN5JG?=
 =?us-ascii?Q?OmuybaFZGiPt9xm1iRzQNu7660lNwXBPfaDBC8E4p0ZrmRCrjZz+fmdT9MQj?=
 =?us-ascii?Q?UUCa1xUnBGpYaQoEPW30A4sGYtQPcG/2bO6Wg3qzl+0zAlSZlK0w9N0xCcOu?=
 =?us-ascii?Q?7dsfL8uID7ygx9g1/2RF9gxYDQZV+i0S0PSaP08CEVp67BkahklUuMKPogpj?=
 =?us-ascii?Q?F0/qX71DUeenG614peKEaS2e5YpB2yq53ybpbGQjfJ+wFKWl022AVm3zdWrw?=
 =?us-ascii?Q?KClbU5CBRQy0X8x7HHPyde5z4mqBc0AbfH9Cq27kbNiNTvxqoaY/0q2Hice+?=
 =?us-ascii?Q?FdImqKx0x69DiwlLU1CswXX1McLo9cGEuY9CIqEdq194bnNJ1marsIpC5I2H?=
 =?us-ascii?Q?OxuaZdd3BW+NWviDKXTsZGTpsRsheSCR0XGq/5kUqVp3QgcanLEoKFFAsihG?=
 =?us-ascii?Q?KQS9DWSnlm/VVzPC7UiJZGKAWxROX3jeWx91iq+EKdP/IEFSMqUrCXEkIYAO?=
 =?us-ascii?Q?AyiZMQxI709eGl2DpqSBRwJr6nCOm+mQWhqJ8976mIh7iXNwAVa/JUP5KKYJ?=
 =?us-ascii?Q?R09j/Qb2voXr0s8z4ZAGI8jwW/G7vlbc64URtLynGL4Vac8Y2c22WInzScS8?=
 =?us-ascii?Q?Rs5q/XOKrmvuL+vtnUKY2RUKHpzgcbea8USPt1TyrLRBQ4b7mc8hF+Gz0Fma?=
 =?us-ascii?Q?N/8MURW1C0UIZsQ5FtDr9YrzuNhSmI0LbnPgR0bF/724OHALH7SZ1lPo0csZ?=
 =?us-ascii?Q?9PPfpYDjOvUqQC3o4ULqnGOMBTrR6j0t/uQ4u7uEStBi20kOzEzKmQye22ef?=
 =?us-ascii?Q?A3rNQlPxbTh63trKOS5E7bMQuXSbhBu9bYVQfruIvHQTRz7bsbEyGnPwVvb+?=
 =?us-ascii?Q?mLKGCe5Keb7YTHQJVlIkmVHFBwYlMoJT1WzobVH7EoBdTRKuHboW6bbqnB4+?=
 =?us-ascii?Q?JPQydC2tMEdM85Jefyqh5rtej1xLeq3kFX5JAqjU9i9k21uZulXUj5gsSxMW?=
 =?us-ascii?Q?+tsgqG0SX9X30Bdp/bx8EOBZEU4XyTr80gCyaNcnQYVRRn9XX29ZLXWuElRm?=
 =?us-ascii?Q?ZL4codg+0vgGFrvbJQQB0x4XnvDUNfj0OrlslFMBaXB185oYZCV+kxJNuCHn?=
 =?us-ascii?Q?2KdxtpfgvCdo9W152CYEGocJwJbPK3qmot3aBiOsOcARnd3PbC1WGNK/1R0v?=
 =?us-ascii?Q?TXyQ8+fRxUKRoth1hYE/h49pD5gmvvwAYBZv8unGsM4nenyNhwdjl4gEc9gx?=
 =?us-ascii?Q?Hb7ascw3aafZgh3wPviisuHtYsHHMZx2uipkCU+nihkL+4Jq5gMGHpz+NyUb?=
 =?us-ascii?Q?z6y5gm5r1duZHfOlviu3yKzSD24kme2EzgjnJCkKkyWafNKLmPaKCpnmgIY8?=
 =?us-ascii?Q?OTIb7+MH97odb4OcqEONVqGQ84kr6YQViniDqsF2z+v2eImfzyWDLCd3zfCR?=
 =?us-ascii?Q?i9HQUOdO3OV+Pc6FD+xhHtUxXCaq5nAaXd1F0SKDNU/bvjgIj/1OioxDEDwU?=
 =?us-ascii?Q?bYuZ3ogTUZb1ttijB2913MjZtM5utAS0jiW+tk/S1cKEGeUV76ezz/YjkHey?=
 =?us-ascii?Q?Rb6z0dSMw/Xh3cNYqdI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47629765-aaf7-4fed-315b-08ddd08b1f0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:36:49.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoUcugL/w1TAAlwl+mul3bNTcaDSe4XefsGTyisaS65mfOY++Psu7V3NNwVq3ndW2KSHQOtMnc0Sp9Ny6htnxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 31, 2025 at 08:32:57AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 31, 2025 at 07:58:04AM +0200, Alexander Stein wrote:
> > dtbs_check for ls1021.dtsi warns about unsupported property:
> >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> >
> > But if removed the check warns about missing property:
> >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property
>
>
> And if any other warning says something, are you going to do that as
> well?
>
> >
> > Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
> > for power-controller node") explicitly added that property, add it
> > to the expected property list as well.
>
> No, commit does not explain why! It's one of this NXP commits without
> explanation, doing random things.
>
> No, explain why do you think this is a power domain provider - fast
> look told me that it is NOT.

It is not power controller. rcpm controller enable wakeup source.

In arm64, use below patch to fix warning

commit e39f567e1c38c29629962ab327f0ad1a288dcab2
Author: Frank Li <Frank.Li@nxp.com>
Date:   Mon Jul 29 14:59:24 2024 -0400

    arm64: dts: layerscape: rename rcpm as wakeup-control from power-control

    Invoke power-domain.yaml if node name as 'power-control'.

    Rcpm actually are not power domain controller. It just control wakeup
    capability. So rename it as wakeup-control. Fix below CHECK_DTBS warning.

    power-controller@1ee2140: '#power-domain-cells' is a required property
            from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#

    Signed-off-by: Frank Li <Frank.Li@nxp.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>


Frank

>
> Best regards,
> Krzysztof
>

