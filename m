Return-Path: <linuxppc-dev+bounces-3579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12C9DA101
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 04:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xykjr5K4mz2xl6;
	Wed, 27 Nov 2024 14:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732676496;
	cv=pass; b=Pgbe7+H7daSfmhOckwt1xQkE8NcOo6yOKbloiNZWPxX25OXBciOLeVauDOwK1LF/GEjpXg/0ekLH1SSmWyZHV2GMqH/sprFGyzngFmfj5zQ3YHJ/QwHy6gxo0rpkcse6+i4N8G1NVXu3fHJy/UCd/CJI4Nd9NDH0BTDo8Iz8oQYuTL69Qc1VMTZr6/gJ7BCh2whZREvbJbCeUMSIzHCPU8u+7jhPO9LEdG1owVUmn3TLsaICZwIclz04h5iktZ0Xf5B5lckJyUAjNXAsBH302YRuN4xBL2hJFnDQcsgM2KHrEYzeYbTxMNHyq3uI/wkI6e/HQM24DExnbqOKHjlRGA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732676496; c=relaxed/relaxed;
	bh=KPJQSL8hlxZ3bXXls9T5Rwu1cuQ4BGhFWlnH7UolnYU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jXwV5HkbT+kF6cREE94jRC+kFOHNszoeTGph5VkoSYagqVqIdyL4rRhbb/DIjrXvHTbPzg6SI3Q2G+psGsziAgYgKZM/2XJgGPWn13H9vtVL8CCW+El0oTeHpQV8zGIH0BNWk5gRolSKTiW6vNHyqiTI03OFjUvtqAtAlQbY0FJwz0E02yy6h35sA5xcUtTawY9PERiJ9WDBdLTQ9K0PdfrmHAgbABC5NlixM+tDO1q0b9IeA5sfe8l6tjFxuWdTH6B3C/DUTPWVEuFYazQU2ZSEShdL30v2ulq6/M9BKtCtGd1oLJNEl5XJIKJuXHtk7hBsmMibfkBH1HtuSq31HA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=evSwU4e1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=evSwU4e1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xykjp4y87z2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 14:01:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+mzDQEEUc5cStvCUAx0JppftkQSuR1PijvsXO/9MHmMlkg02XRtwOGy8VC9ib9KU34raNCNbPR6vrinj2XbF0I2F8p9wUKCnt2CHpw38YJIpzuX4UokdZmiX+h3vdCjgmOM686aHfCHzC1QsXRmqFJ+NTUrPztymB5WlX+Eg8QgOhmyF9wgduKmHJhAmMwnuxw4IPaD7W2uiZvqQPyqc3Nq7nUG5mvlaXOIxxcmGNolqczDhgqLMCxtpbA7Kf7ca4QcSiu0TO5HDPsXgPT9TnfrFsPgASpPxZ6grQMsvZHJyPdbMhEaG+qIh2VpZbxyo14NIjMWgjlCF7dIMifb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPJQSL8hlxZ3bXXls9T5Rwu1cuQ4BGhFWlnH7UolnYU=;
 b=WE0cdw8u8f1rE7r2hY5Oxsq9L9ha2yg6Tf55d3Rx0NlRxbXc+dcobo4abLF+L4BzVmFH/wHPWdK3LvFKpwzLToN3PiMOCvo1RzwQI2LIJEfikGJbCi8ydLAu/SHcPswTYFr3rtsGWHFrt1ax54UWhDLWaa2xSEZGGNJwSPGuRwDncjnLGQ1pW5HmKmBhi+PE2qJVIK3z63Ta28Ks53S375OD4KQiLBXA+ENgvWcSo50rvDwZhHsElnu8lhelVtPEK+HU+be2Ka0wgerRquci8RskbLQpgjwmJJpRZAKisOxwevFZqFCptSkOh5F/aAYR4b9mVQ4QfozeOm4MWOXRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPJQSL8hlxZ3bXXls9T5Rwu1cuQ4BGhFWlnH7UolnYU=;
 b=evSwU4e1G6/Lf8YVYImgeDczrBeIerfeAWkhffqFxbccpGeWP3/UZWOW5ilsvZUJXwhzCsxfKRDXZm6wPgoTkvIZP97Gvi6+46XbyWCvXDqbGcATUsNNSvjxHvf9UHnaXqcVHgxiCYjN9d+8Nd2LOoxcJu5gcCeGbsE6cNvTdBWhKWn7i4NQivXTKvCPpl8Th+MY14zrCyaVwemsmOlMaVoiuf9axEBWptJzzVATGjuJPGxptN/NSs31c4MsVpxvw5Wu4LqFnmn22+7Dbigmzt11WvW3C3I5yOjZWnXttjCV0EoqLQayQtloOtOp0Y213bXgmyHvjfp8qfCR6gzPdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 03:01:12 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 03:01:11 +0000
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
Subject: [PATCH 0/2] ASoC: fsl_xcvr: Add suspend and resume support
Date: Wed, 27 Nov 2024 11:00:33 +0800
Message-Id: <20241127030035.649219-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c0d1ea-6671-4bc8-47ec-08dd0e8fbfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jJ3R3uMwkRf0ZglqNiYEfGaSob67m3s71a7iPK7CYDuY9+wRdvED3bHYFEyp?=
 =?us-ascii?Q?51VL8QFCvIPh7VO4QwuBcN2wesRUOsyq4jnup6LzEG3XKpj6h3bXYWM7AiNF?=
 =?us-ascii?Q?xoBmvgNTWAJHi+z3iHdB+KiCWSYR1JXjQvekHCLktEmjvYiMKMQD8ONB67TH?=
 =?us-ascii?Q?KyT2cw/3wBmBsFXtPDY/4GwS+8SDNDE28+ynRbBhScf5EI4vJVKrFf76hK/P?=
 =?us-ascii?Q?weSWd9AaQBhj+GtSkqPu3cprQpDLaExEF1MvOLNkw4Zka6651N8mrUuWbCrE?=
 =?us-ascii?Q?NMBVGlND9mJLTi9h6X9Aspvr29ThXzxkfY0Kk8gca1idIylkZ/jsvFCfCNsb?=
 =?us-ascii?Q?vsxynjqOI/u65RBv7tMd7SEqhwseukLxRZt0K3elyA9bLjh8swkyS2gHoyDK?=
 =?us-ascii?Q?Le/LSITNnAVoR5vIfYXzJm9I/himVxiyUmhF8+qT1e+3d5Ml8RESQxTLO2Vm?=
 =?us-ascii?Q?NyZfrUFHOb3IzI9yLX2E9wyAoaS0ifg22tfSgLYV2l+E3+TyTA1GuZlWaAif?=
 =?us-ascii?Q?KsLnpHFkhAD6PzQf6JqZOR4Klv7Al4SxH0fizZjnKUYaO4AC6xzdXc7/2trV?=
 =?us-ascii?Q?JxD+A5aKq1v5S63GTisrA7P0wF8amTzf4rQ+UBSULNn0twEs1zgQu0d6ZxaB?=
 =?us-ascii?Q?/Azl2F3R2S6x5KjocXb40M/JHMbxZLacnnBvHG2pb1s9gvhjyciLaMJ2jmxI?=
 =?us-ascii?Q?H3lA62GruM00/lF1+V++XoZYCQORAoyKfffXZnWKDUV1UJDxqwkAhUY1hoD5?=
 =?us-ascii?Q?I/cCXF3/RLqGl3w5/VfLH11RuBmt0ole7tbqojqNU+PiWeFL25P2bzR3mBLx?=
 =?us-ascii?Q?+s+cGSzLDbmiF+KAUJCXjnOZHAfeFlaMDfSvlXbRVlGaW1G+Wg/zb1TOAiwn?=
 =?us-ascii?Q?U7pJqwuWrI8a3QjcrBnCpDzxiAKDzlmRx00LpGwnabO/wYlVvfo9b+Gw/RDs?=
 =?us-ascii?Q?LC59MJ4/1NidDly9r29ERKYgwCN1qhmCuCVHF1aHlb9YoWZlfyHGAKH2KS8X?=
 =?us-ascii?Q?SXmpK+rgrvXGf9mYJcv7/VIrzqBaYn3NhN96+R1ypfTstgMpekoWnaVmxnfL?=
 =?us-ascii?Q?nuhagMLaGtvbZxJQ+ZKyNYgaLyMv7r32NZugOh2xM/XLZxnRl6w8w1g1xJoT?=
 =?us-ascii?Q?8Cs5MAPbm2mpovdDXYuIvuDaJwt2XRqQ6vUf0O6kLN+1Dyi9dZJmAINo2/6C?=
 =?us-ascii?Q?fBLqOWhslENaqvtwxY2qI9GVqcpM/p8C+/IS1lZlThrnQUefd0PhT0vv+4hW?=
 =?us-ascii?Q?b5F/QWout0aVie7VEDB9FvXKpbQMjL6bqOSeAGaEwWKwcsrinaocwdy8kV2i?=
 =?us-ascii?Q?6a8r9vEB9fZqfpKvDej43ddUfQipwY49PDhq5ykBKGGeo3GHAr5qGruN1Rdh?=
 =?us-ascii?Q?RLpHJnMEEpZLZYfeErDdjl6M9+ufYb3x0YHbayGKg+Q31zDEybAXewYLy2ED?=
 =?us-ascii?Q?XdtSY/Y8E+M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S2iTHPR5LvBEI9vHm5i+disGgdBvW6li9ddQF2szRY8JU8QXYG2W0lhSBGn1?=
 =?us-ascii?Q?9UTzVnDZ93lpRh01JtEbXGfkgL7GWBLGOSxTakshN4RqszSjvEZTI6paf3PI?=
 =?us-ascii?Q?9d0b6uGor0dLB0WrYsXeaJcsWn7DI0bdEEa9BkgbdraL2YIiaoS+s36NLweU?=
 =?us-ascii?Q?HtMZU1MmzC/r5d40vl6dKsAmLrxsmXDddNRd+ZXKFMEakERhKMd9L5lrUWdi?=
 =?us-ascii?Q?UGua4k+5MpQw5SAHUk7uo6fkjy+DdAcex9eG2mi6IdRK2qxhDpO27GLbIlTK?=
 =?us-ascii?Q?Z+Q4ROBoUhTGdZLBHj+QI2pXagDzuO3PGWzGITT8d+JPFsQPg1uiZmk5MVw6?=
 =?us-ascii?Q?hM3Mfn3mhoAxx4o8A67ERhYm3spMaiEQxUYaV46r2LBi011kBAbKwkIssfpV?=
 =?us-ascii?Q?ddtSogAu9NPxqNvjhVZj5g9xt5V5RvWgFlyn1asA5vyle+HaBfQnzQAcm0YV?=
 =?us-ascii?Q?uWy0k7kctu8ORWZaEjzXKBRJcpWo5Brj4KA/z+Qmtq3+9SEneXmLUMJi46Fd?=
 =?us-ascii?Q?4grp86AJZqkKEwL93PZF59HwLVC2lQUO0sEWPzL0+dryoA9ouBqBFHFd5kGo?=
 =?us-ascii?Q?aT74QVzeIzKGEPcJMLrzIaCksr4YxZR/lty2tpE2eKbI7nZyVoJzObsOuprU?=
 =?us-ascii?Q?C8bniGFCnliLbWdxC/NgyKBZRLvSjf/hA4RWk4jSQvLZaJ6ITA7ToM38S37n?=
 =?us-ascii?Q?BCwGSbra2MW5iC6f6iQuCD5kXQlssDqBXACPLncz/ojitlyr2H9hBJlpA7Sz?=
 =?us-ascii?Q?v2VX9jKz7mbs5idzPLGdK4p1X7iYuo4QqblDxf7fPuNjFF5iJqYmWxSSbcuC?=
 =?us-ascii?Q?pE1l9Lg6D/QtqXOn8zXjbGQw1X0CY592IRESLcqI8f4eHVvg2rYxp3JQUkSk?=
 =?us-ascii?Q?xBvShBardAy0NCyXLmr63D5+wOeEDP+RC8H9wjgsTWHxxFF/AISZNt9+T3N/?=
 =?us-ascii?Q?9ksdHDltsGh2mRfTDvPMoA6ZiV17MbywYjVpkvLg3jt7IKxPO0wGMIbcfsbb?=
 =?us-ascii?Q?06YG4NN44PtIWSvhQsjQyHWi9ELaDSlbH4ZWQz7qPHyvyFmJW8v3qRpVXH54?=
 =?us-ascii?Q?lYQE7bsHaGn2iz9IWdFXq9LhpqtaoI7vOfiYy9G0djtFpUkUN20W2bl2mqQJ?=
 =?us-ascii?Q?PZe4YyI1UicOXHgIgvczQPv15q/vzikyWEmmo6h+dWXv1q1m9LCspwtZaVm9?=
 =?us-ascii?Q?JDa9NtKjl/vReVesA9EPPgcMqf7G+6y7Rgw0ImXxeoXvQ03h9LL4xZnWQn+n?=
 =?us-ascii?Q?7lA01Iz95bFn7RUeIAuJX7P1oj97nv4C0n5WJkELmgzXAKn0uu249mMGsA2t?=
 =?us-ascii?Q?+R9pdNQb1RHf3PEO02NerAOnxdfcShgxgNL0xeWwlG2Czl/jS55HDuWDUluX?=
 =?us-ascii?Q?UN9+uwxkpWJcxmO+9OUXWmT84UNUJkvnuuL8ZPyEFlx+AIYyuYbohJKpWeN8?=
 =?us-ascii?Q?xy9iWH6H9eOT4dZ+ZOhzYhonCfnNSsJSBep49SHn049gW1qJOLuB31VrfY6S?=
 =?us-ascii?Q?CcXJ2srKblDxAbDrFKbnnkDmNcG/pAE6yypEhlWaxG1iVJGPOfvFXpNh4y3O?=
 =?us-ascii?Q?MNeZ1I3mKl5vqazOeEA6jjGFHHsmjrCJE4C2Jl26?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c0d1ea-6671-4bc8-47ec-08dd0e8fbfb5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 03:01:11.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jslXWkiZXSdd3JjRUMeHneBh9FtJKcgFni6kUwI06ASfByJwfK0sIYH2Pg8sBq09CmRLboyO5EbxItm6zHX/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Define regmap for PHY and PLL registers, the PHY and PLL
registers are accessed by AI interface in controller.
Then  driver can use regcache to recover registers
after suspend and resume.

Shengjiu Wang (2):
  ASoC: fsl_xcvr: Use regmap for PHY and PLL registers
  ASoC: fsl_xcvr: Add suspend and resume support

 sound/soc/fsl/fsl_xcvr.c | 384 ++++++++++++++++++++++++++++++---------
 sound/soc/fsl/fsl_xcvr.h |  13 ++
 2 files changed, 309 insertions(+), 88 deletions(-)

-- 
2.34.1


