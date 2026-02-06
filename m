Return-Path: <linuxppc-dev+bounces-16642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KR5LkNIhWkN/QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:47:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454BF906E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 02:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6cRK380kz2xqj;
	Fri, 06 Feb 2026 12:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770342461;
	cv=pass; b=RHkOmMk+nmSTW80NkhyRzUjoVf75X7nxIDgxTTaeu5fP0AHbgwf6rfYLUDpPxrDrUz2zCpuhQ1o96xqkhO4SySN0vrdQRWeZf02IgrpauO5dDMnxNpwclZ1L/5LR4JR/mh4dbkJaEz7rgg1NOfaiTksJgLiWoVEcrmmXoRe/XJudXGMSKxVx5jdSD0YHEye3yjpeevrswr2m95r6curafQ3IPIe3jP7Obpl5IO58bBmiu7vYDXUpTq/RoNbUmKGR6wKywFDx/l2+h6OecUDekHqjN4+TcyhKhEDos28mw8tFX1mOOfYDPE35TqLmoCta+8+3pzPT46aaJqf3oddZ6A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770342461; c=relaxed/relaxed;
	bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KreLO6yFJqeaFfcdWtXiJWnnVezymLoOnlFkzN5h8H0bGYNIN1gDlbtKPp2WkEJbW9rGBjMFdSGfCF5+veqsdouDA5lVlF3lv6rKRjWQObO0VpofZzjvs6WQhdaDGmIjspqG6fpNfM4u1qJBR9AZ9ZVLxpH0gtJBYekb5nxdwNPJZ1IiCyHqoQ1GTX4ootuk9UC/c3zXczZMO+AdbYFveSJiIfeu6TJAFyeFmwxuVKRMmdNJdWJMq8QC9GBmuCxJEYnc8Pb83zTfgn9ZhaH/Q9aCQsUzclPeMwFWK93a7xVu+NDTCumGAa6ER61px2Ha8NS89tGuGxf3nUZrKuci+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=l4TB9BiN; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=l4TB9BiN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6cRH5lBzz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 12:47:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWR0pR2rNfCTL7g9sLP6Hzpz/8Xpci68/UhbdqjNBq7sit+9L0VBbf+hCwfX+yCsjfeguFZJxUtcUhRxCrDt1hcL6VSg2+leF+iKUEvRwFqqTXtRCq4x5DjfDO2xWZPFKIeUl5N8cqgAZEqAHVbY1DzH0pYB8uFaFOfiLhNgOoFgjAlg+pAXgB6y+jDgVwgELq9shSmEsRqswlq4/fURyQAgkdltNGwTL3rnVFNGUxXar9klvLmikaJ5jZyWoYPf3OYyuxRKYSfhAr+DpszbwN/dtAegNmnJTEt+t4BWnlhARJBmQ7IS26S8HgjMvUFoWsCoVGHW/LU2fsfHt9GLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=;
 b=J3h5CiSosyxbnyZ8Dx9JDMEB3RPtVMS0ywAhB22IHArrz1+pnxzInb3U6BPARdwdl5mwWZ5CYM5isCsQUCKXZ8IrtBpTTAE1I6FJAe6UJXET7Ya4WaNMCSgpdHj2m8yN4BZNeyPVOgJ3M7HQBxlr4GnBsPA+ZfMw6eWuaF8hPn/9J819w31eRcIx65y+cjCAexE//3T0DzRm2MiP4bnppG16YQkuCwlqC7bjyA5izjotRZmGGsvDppbIJ6eJGKH8A7n0mXLwMHyFfcMuA71t+LjksZ1/OUhrgR82bVpcnjzSw2vphizkLfePN9Cd+4IVY9yTChe7nsZuheCsa/U6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ3woXOlvx8FJrmfeb/nTYyCumv4dKp+OLrCyub2gsQ=;
 b=l4TB9BiNW6bVmGY3Yg4czpNfYinDRxLrTO/5J65TPd26drb6euHdOYCbpFP4gSUm/xGy9SgxOrA4wTyHPPYWX8LIBdYDiCBmjLvJqGgOZZ0TZi78M2JoQH2AnWIR21wx6RvDT60zBq7VrqQRbhEYyu1FOUHwLIVKnsL0Iw5d2GGzSbnksu/aAzyVfHxAE2Hk5XHY0fCg7rMAUpGqVcVJpNm56kXWxsLQx6SDeSkl7sqJKIDgs8kLXAG2JHrbgWbtWR2yHYeb2FnQT23qk5Vz7MgKvebm9aBf2S61fgj4EpN7t2gTSXzi7xFmoy+scoo2HrumnrEVipsTAMY7uSlqEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB12210.eurprd04.prod.outlook.com (2603:10a6:800:335::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:47:09 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 01:47:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Date: Fri,  6 Feb 2026 09:48:01 +0800
Message-Id: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To VI1PR04MB7055.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB12210:EE_
X-MS-Office365-Filtering-Correlation-Id: 30131bfc-0ea5-4838-4581-08de6521a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PGNi5tpYYTsJHvD09jtGFAlYZenzaSDn+vMMxFONsiWLcCi3cijPoEyf6CEr?=
 =?us-ascii?Q?NKK/HcwNcgkvecciYvQDh2ZWFf8tgW5avVt1LQO58mio4OoPeHQJiFbaGVKq?=
 =?us-ascii?Q?BUiobBadZPhspl/jyJTSSWdoffSwIi8VdI2hY8u/sbTklKnmT+WH61Ih6eql?=
 =?us-ascii?Q?MFncCRGazd2ji5QmWcPqBQGzoa6fPo/crD/a9klgWwAqOyD8i+oQi0vJEIZa?=
 =?us-ascii?Q?NxOOnNELTG765lLo8/NkbY3OsKCYc6lgLDVDEaW9aNS7W4TFSg1c711/OQ6j?=
 =?us-ascii?Q?p0tCXseqib4IGZkH+S65GKCwn9RY2Pb60Hbb+/zOVUPRAp6asoo/wyz4fleg?=
 =?us-ascii?Q?uOWv1wBddiE7va3SotKwszdfJMYfT6n8hAUmnCwovVRHlFc77U4XXbpHcH9G?=
 =?us-ascii?Q?Wy1r35Dsd9U7jGojXPOhhh2krq3HOja5YePPQRwg1iI5aA4CA9/cRpVbI3Mn?=
 =?us-ascii?Q?C37atQBydhtfSLHfDWgHiAQIAYTa+s0hG1x9UzajmCHN4lLU9BKMkPE54gEU?=
 =?us-ascii?Q?GGnIaAOjN0+plA/oajHWfb/5EdWY9Qs4reu1MIh/X+si4uCEpKSDzU6TuJbI?=
 =?us-ascii?Q?2xgyFMQUtj6rr5+YasYFMRIBAzL5QESZqaaaGtb6eLF74tOM3Cl4Rb2LYJzg?=
 =?us-ascii?Q?vQ5/0Da5IcEZgi9TOYFmbnshLB7mhmnIYWex5HwAK7T6/uzEphz97Pr+0Jqr?=
 =?us-ascii?Q?Jadc2vJpwpAHScIDl/Nu2f7xsfuk8F4gG5cg/V9uAfLTi0KL3npZPG/hDoQo?=
 =?us-ascii?Q?7aM3sXrq9jK0bH5q+05Vc2umvYbw+kOpDKUP8kMSUupMQFjJfkaguxD5uWFt?=
 =?us-ascii?Q?oQoXSf3MYqvQfiF0mspsWPTrbQcFmnRS9cI2xjCUklozXwtWp4H2qZi3RekG?=
 =?us-ascii?Q?T2dMTiaVC7EOxxFJsdE4Je8BUXGZw/H1SIoBMRjA94pM8x1m6WSsu/+Uq6a8?=
 =?us-ascii?Q?l92LS9TpV/GJHhJpaenRGGs0HPIj5LdwZZrtsdnohcv9SzPnpeWd14CZSaUq?=
 =?us-ascii?Q?6gFfEId3R5w3wE8qtZ4xRfEwioF2l43ZkMBwUKdG0H+W7K4m8cQo5cOEI99h?=
 =?us-ascii?Q?Ou0jiqlk6T9iYSf0cwFw1qUH0hxdQavHaDxfTV3Au1k/o8gGKmv5a0myEOtD?=
 =?us-ascii?Q?k4N2XYDrpKLUV/5GDjX/OYDbiTGttm1j5Y7VzjfMyzFDV2Y8sCj/4dLJmqZu?=
 =?us-ascii?Q?hQsp382LQM89dKJZjUpGELCjaeABG5N2qpF2WGb3KEmU8oiV9idd9owa7KA7?=
 =?us-ascii?Q?nDs2tq0xUxuyhU6nxg2CMyqPPwYiOSCW5LfaiwbqxOaGRrASIQXHk2aGEgE1?=
 =?us-ascii?Q?2c/pLHjzx09BoI6YfwFZWUiwxSt/vOV742D6Qj/OZqXujgdmVLixmrShTDD2?=
 =?us-ascii?Q?kSlzMdGhe40VYnYoUhd9tmufKjsuEXu6sOzxYU27jhiLgGTgRuHTi5BjNYuQ?=
 =?us-ascii?Q?OmJzHvuQrvCL5mmIOy3dYijL45iRQWtJneyTbFfsv5/fuT1HX3T3IKrm7CsO?=
 =?us-ascii?Q?BuSC+caQbf9HsUtx8xFv8P54pRRcMncqFIN8qjZjGstmiEBCBketgl/Qbr8l?=
 =?us-ascii?Q?1ECrgBc9CBsWjBCUOC26z2rBur000Vw4CBObRL3oow3zls2rOY9muZY0gCwP?=
 =?us-ascii?Q?hz5PsqM/ZDvfPYitCe1UbqSVobWZyC/lMPrphFsAnYqg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGVUxICREMamKMNSAyPdG/+DX1XVaCNBO3scFGJD1JvoZYectVGDLJzXNtTI?=
 =?us-ascii?Q?/75ZbkEa331zJrisytXsSaP6vdi2esLFKY5f44xslY1rtgJJaEKIiCKCg4gw?=
 =?us-ascii?Q?cfUJYc9s0TpmHaGBHepfAD1R+X2g/gQBlVpyLll3kE3q9qaI7+uz9shLZX7D?=
 =?us-ascii?Q?cKrI/t2h6oer/m32gIzRNInOjCyJiS8PnbKXpDmU8BnbKzx/rW4SydFRmCGn?=
 =?us-ascii?Q?95kGRq7AkqjF8NjqvpFSv+0jUQvxBkFW8SDJrHaxF0rGRKlaqexkji5xnJqf?=
 =?us-ascii?Q?sZPhglb/+P4PmfoDcRlOQoN09ZQVNqvMywEHqq6DiRJS2KX/rlQkms8Sa/zs?=
 =?us-ascii?Q?uGpj3QqAOoAQbGRafNp6TMM85F3XKeI6ndn+wVHrT5xwIp8rveNF0H99Z6ag?=
 =?us-ascii?Q?/BQBF9pUyHUpFNJI5un29lbcX7q8APr/dfhxp8g9U7Sf7uVtxkcdP7qslgh+?=
 =?us-ascii?Q?4JmQObZ+EoUMeXsstPEEv3I+IgiXcp8Yfqia9llt+LObu5mb52paMDi78U07?=
 =?us-ascii?Q?+kAauRE7oYMtW8GjQrZM00C0jZB81PF2Zk3iw2sPG28NTiH+fBzKaIZql8NM?=
 =?us-ascii?Q?wjPex+83dwhxa4gfuECYsYPdN1/+jwf/Uf2AueNu7H8riE3pfQ3Km8BlJm9J?=
 =?us-ascii?Q?IdXQ980LVbRfLa9tihqKszDeGl6LN370Jdx0aZaSAUawIBUoy3auUCAEqCKd?=
 =?us-ascii?Q?qJHoNVx36K6IA9NLg0yCzNRP4Gdl+wK/S1W4OotS5bzm4Yw0++xWuy8n5Be3?=
 =?us-ascii?Q?OV3aVCEa4bsvp3nxeeOx1lZ+JjRUO/1tBdHshjx5Z290Wn/AIMdNEF+j5sn2?=
 =?us-ascii?Q?D4QZS/TmKq0S+dA11c9hzGflwlfgAggvUpxPRSffMHeO4AvhAMkfNwt2Brfs?=
 =?us-ascii?Q?EKl8YglmlLHRFWqHzqy0NL1CmAwAld0VTr0RgTqOSDHzELDoqI2THNNDEput?=
 =?us-ascii?Q?/at4VEjTxPiJbN6xymN8HKKEC6GN2jYfhiEnHfbLz7H1Lsp3WuuTt+HsH8EK?=
 =?us-ascii?Q?C3SIvSVmOFp6R4HdC3ACnxG3EDtdbBav+5eQB8cdCz1nphOHT9zKoesDvzA3?=
 =?us-ascii?Q?470m9sOuVBbAenjCSejNt9C6RBJK4rCFhDMpOZF2BXIJ0dtufQjjNf1Zyhqe?=
 =?us-ascii?Q?S+lJ0xlp/M22gvw2nbpkODFV/1TY7CeABDnZS+rngLpqi3c90tKqwbo+JuH2?=
 =?us-ascii?Q?88QnHw+E9vdvCL2WO4YzkCqTYytM7ETxSHdIiIJ5IjLnKSD6VjfFdSN2iC/d?=
 =?us-ascii?Q?a4VkXaKhjiJnw08d+toBSBxPjgh3K1sYvI3CL9V09llzTwa5PkE8AcYW3o2U?=
 =?us-ascii?Q?tYdug750tWW22mJ0MDhqV3cyLHDG6Sg+Jd8ibw9WPQ7vmTnK2hsBvg7ZrONx?=
 =?us-ascii?Q?AnQ3tOZrhTxz84FRpqnchNGwQ7mWsRvVIuqzxh97Fjq4oEhuG6+rQPRMNAC7?=
 =?us-ascii?Q?sde4LHhZeaSGM2QKdP2t3hhbnQUbOlZSLvczstSdTKjA6L6lZlxVVQfoQZk5?=
 =?us-ascii?Q?1ZSzUZEZtex9MsDj3V8DTBVD0CDbehyDq5EccH0jhbGMN+lV9OJmQh3x306N?=
 =?us-ascii?Q?SI1tkA4t1duA0r4aweWWtV+3Z+pE7E+LMUJFq3CazNQghiRpVbmnx3gc4LU0?=
 =?us-ascii?Q?T+hd504i+sItFK5c70oXY5l6I5Pe3jUwMcfsPQjlda9aHDj4Op3Jikdm/hFt?=
 =?us-ascii?Q?d7T9LvmmbOlcwfbyvPBM5sTEtkl1KC5hvarUaTz96BaULP8V3yssYPnQtANf?=
 =?us-ascii?Q?3Vde42RsNQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30131bfc-0ea5-4838-4581-08de6521a35a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:08.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+DJ4NoUxp/ykJu0Q8V0jl/iu7+sQNetZQv8kYTEbO/Kaag9pZvKzNUrpwvqXMqrWZElTN1UUs8yERVIY/RJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12210
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16642-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 9454BF906E
X-Rspamd-Action: no action

Update dt binding document and update driver to suppot ASRC on i.MX952.

Changes in v4:
- add Reviewed-by from Daniel in patch 2/4, 3/4
- add Reviewed-by from Frank in patch 4/4
- update the commit message for patch 4/4
- remove 'retry' in patch 2/4, reduce the threshold for timeout.

Changes in v3:
- add Reviewed-by from Daniel in patch 1/4
- swap the patch 2/4 and patch 3/4
- use regmap_read_poll_timeout in the fsl_asrc_m2m_output_ready()
- refine the code in asrc_m2m_device_run()

Changes in v2:
- update commit message for add more infos
- split original patch 2/3 to two patches: patch 2/4 3/4
- use size_add() in patch 4/4

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
  ASoC: fsl_asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_dma: allocate memory from dma device

 .../bindings/sound/fsl,imx-asrc.yaml          |  1 +
 sound/soc/fsl/fsl_asrc.c                      | 38 +++++++++++++++
 sound/soc/fsl/fsl_asrc.h                      | 18 +++++++
 sound/soc/fsl/fsl_asrc_common.h               |  4 ++
 sound/soc/fsl/fsl_asrc_dma.c                  | 48 ++++++++++++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                  |  8 +++-
 6 files changed, 109 insertions(+), 8 deletions(-)

-- 
2.34.1


