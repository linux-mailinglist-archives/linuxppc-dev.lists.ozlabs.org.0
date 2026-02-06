Return-Path: <linuxppc-dev+bounces-16692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDisNZsahmlNJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:45:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F36621007D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f70Lw4Vx3z30BR;
	Sat, 07 Feb 2026 03:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770396312;
	cv=pass; b=LfQ9VmVHMum/mnNItN07QO9GymhOzYwHPtYQO3aBhM+KKAVYJCiyVv0ISWiQUeJUzdbluZQB3GraiXobbosaU+sADrGV3i63Q3KP2i019Lzqh4tcA0GmmeOYKf/nMw4sgNEy9MmIxiY5AzVyNHMjKZL/E5IpDH6pE0AlN7ZK/+DD1lnTiqRgoBZkp7AX/0AdrUEI9PlogE9oXfVqSN7XdAHXghOF1KPnhcSsokdOMZMs1UuMpvaKoa+e0tWaOqLXz0Vwdf4tAHy3+ZUiDFSUTeR1KIcoWsXLnre8VjBV4M0nhHEmipJ8Sn26PMPNKLSvZgl6+6IhcwCEv+gwGKYQYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770396312; c=relaxed/relaxed;
	bh=foHg2tQ0zSb1FzrQf/Ka3CjCtl5RmuUnpNQFED2rINk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e9OdcK3gTpuE/aKeo2TOTDUY+dsG+/4x6Gcg6IiLF1j/7gWmnvjTIHu/xnZvZJ6NfjvMxQ7qmXKp+Nfz4i/MaKG1i9Yj1TVLc20u+9Evuz/k4gwi3gt52YrvvNg+CVgzCcJBe2RNUY1WXNvfv9rTTOoVxtweFD13jtNenJJr3cnMcedcGZo6UJeDAnRQwnEETLc4FoP81IGhZWEooVinOt1b/gRxIANqP2kpLpO9LkWLqcojPnozWHFRc0O2+J73DyY7z1bvM4DRXpTKRWn5vEW/HhEeB+Bf2ykIemFs3r+l2Ne4lwtlYCchplhVOBYcaPi6kkl7plcB+8vJOqAk8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hgmOkYre; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hgmOkYre;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f70Lv4szSz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 03:45:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKp51l0aNon+AeZVdNkRUmCbUtU5fWVr6c0WRbylItvpefqcFOXSe9vgkZPQHnQY6qO7nKV0mKiN8W/hewtIszG2Hf4u57qIQIonNy8KMTuRJCUw3bt9e00YVUBouNYXV5otxapX0CXCnJuHafAilQBovMdAHKXv1M5gA5tL06mnqCHU6iJo6cM7DB8gP1Ml5miq9dqW2orIx2f3PWGsVDLOy6XEBVYliu3QapHBZOftLaSKjvyyfwdOd8QXsSTujaKFLhkOZDZEHFqTL2d8BHfRVnbKWBeI/nfSJQ4O5tgxCVhvylWHLDss1yCYM6TPlQXxN6RE0HN06d/jgB9j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foHg2tQ0zSb1FzrQf/Ka3CjCtl5RmuUnpNQFED2rINk=;
 b=BtTwX+KfI5PyjWLFY65Lzzuu77m20HORVx1AdtBaINbb4FvSyOufnMgZgAdOfyD8XH9NNyeaAQuNuoEjYYNeK5T/ZKFcgw4J1qG4JhWuLbBQ7uyrNCsGWHlbePk0JxuEkc0/WgZ7Cy0RPLzlmHcTIn0V0EH6/ERkTofgpLRTYlv3RYIRI/6VZ2sk1lqD/fTv6dAFgcsJ+l5zDXc/xDiPWK91i3w9VW6G7W9OxFaTzd95gLfuDeVFOe7g0Q42/GnU8ldRDDPX0qtwFYIhfeMut0WmV2DSfgb0pNZF6QEMXzx8kogb0vV1HxeqYDmr1Xu9ZIHd0gY/m+7fQ7BkhVir8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foHg2tQ0zSb1FzrQf/Ka3CjCtl5RmuUnpNQFED2rINk=;
 b=hgmOkYreGiiLtbzua4oK/+do/HxDLk/pJfS7kUd6tUDLQE50d+voR5GWtFY90ugG+VF7xMcG3SyXRtWSBFSmqb9eko5ruFNmmwJRDc3B+9UKLWp3Ks1tnFFNfIh6hz3Xca0dhuNUmgDBHlu1F3OBsBv24/CmkWOJGWT/PE5mxPO6fTwlcMU3RGWH33p4yrqaGyeT7TeZQPAtB+q0g/IvCNImR9/kwaGUsKmnbywsjKHUWr4InTJ9IIlhOu7MRLA7EKRsBCgEl6fXK/ezu3iLMaW1u2hatsGOjHNTxE+hjEWflDXiLqVLKA31FCz3Eu1HCxhsAWfVkPWyqGAjJNSH8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:44:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:44:48 +0000
Date: Fri, 6 Feb 2026 11:44:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
Message-ID: <aYYadvQtq5psChBn@lizhi-Precision-Tower-5810>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
 <20260206014805.3897764-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206014805.3897764-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b44382-0a1d-4c39-ec20-08de659f0a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U0vGSLD7ZX4dcXK34OrQMHI8YYb9eBdZYcfdjkGGLqZ3JIoItfVs3RvNQCiO?=
 =?us-ascii?Q?BjwUmhNeHroPjTtr9J9Dmode1ER/f88NVzO8wgYJ5QDfivFlcESuN1f3lUvm?=
 =?us-ascii?Q?s5718p5Yq7P5nH3L5nKtzLkVQpPxzEs2bGSOlgq4tZwSGo3I2pZoet1t1BfV?=
 =?us-ascii?Q?DDj0RfATshIIz1eNtqJjlNj3mtqhEY73L/PSCsVW3rE7ZSJF2q5Gr7oZUY6D?=
 =?us-ascii?Q?ykEXGH2Npe/lTO3h64Q0NfWQkuvNJ+al7uEhzPXm6sAcz1fMOHwYIG92Zkuz?=
 =?us-ascii?Q?fSrkNCEMj1Q6Fjf+zlHnflUDW/qCgwDzULupL8MhkjtjkEkuIr4eoOYhk1v6?=
 =?us-ascii?Q?AFYR0WtC8ymE4VIGp73P0nRv7FHsUyf4SAZMmHUuN1jWyt63yifB5NYH7+tr?=
 =?us-ascii?Q?trVVMrkwTQzQ4pQ5SjMaVYB36fl8Sx4tx/gAPPrpd2ZZRDBtm8wpoNelfowk?=
 =?us-ascii?Q?IlRz5ERaMiA5712EmlQ5AATAIDG/Ljp1WlJuqj5akuNVQku4Dkdx8p26S4Qn?=
 =?us-ascii?Q?mR9ncRglVnO1Mv/iImQzQP5rNK3bw45P59X4uKnZqHY1jROq+KnTJNAXbw6+?=
 =?us-ascii?Q?J+nn3osUW2Fgj7Yd0VDUa3ckNVY25xuvVKpRUMR+a6weG+/0K95aliatN8FK?=
 =?us-ascii?Q?VBr+Lp3+UoO4+RUHGFI9QKaFxc4mANyFNBkytan+JJcbQ6ScHjkADgJiPUrO?=
 =?us-ascii?Q?7YehKGRO1uyZ068m4U3ewn8y68RZ2upIf+Dib1NYTqWj5KX5n8ZSsyTvyzO1?=
 =?us-ascii?Q?bgkKDShuNDsHGNf6Od4DCKMB5micqR1CVUdn8ot74ZchTmZjHUxrFEbyws2O?=
 =?us-ascii?Q?Hp0FvF6bLajDFOq4YaZKMEmo7ciT5fbwYHvBfCyYWXgbmF82sa1x2gpliCz4?=
 =?us-ascii?Q?KwhYLayHoT2iELaHxZnzXDIqkfDs7J0l/sqGMXol7xBQ/0EJ0rLBjRMBdQoP?=
 =?us-ascii?Q?3HrhK1z2GCAC0lR/qAQEjaDGns55h63vx0g3v3fT5hToH7LjqanTvE4vjymU?=
 =?us-ascii?Q?1Xblbc12ACme36EgVhkn5Fj1mz/OMGERTnObjSK2kZrx02VStNsINGyxCnHS?=
 =?us-ascii?Q?6Z4MbB5bqbTa7JnEBy5uwUwavkKPa3iJIcXRIqF1D5Vq/+tCk5be50CnhSBO?=
 =?us-ascii?Q?UXeKlQCgbhdQMWY2nNuARytdzLJg4wq8qKMjd71cYE7HxOJuck1nNOK0SVgM?=
 =?us-ascii?Q?Hao1GxtoBv+xorDSVGRRxG0IFxwZ5ZhMvj17FUbd7QC8Us+fGNleZhFGqnS0?=
 =?us-ascii?Q?Sy4Qfjmdth0XCk/lg0Z2iC9er4k2f4RZKmnW1pZDr6IHZIj6Po7w/a/OsC2b?=
 =?us-ascii?Q?GFHQAcBcud8TcSlnpgcBA0p5Md0V+Lc+jfQvH/qwBI4lVk/kocWHqNO255Ck?=
 =?us-ascii?Q?plCqSJqbNb/7BzknnEDsMeL4rK7n3JHkIqn6J/yx5uORIzW5moMRJFbg7uXh?=
 =?us-ascii?Q?ht9d2dpDDdecryb2PcSFOA8JsODM1EUPpHvkAB0J2ah/QXZi7YSMI6k1vRBg?=
 =?us-ascii?Q?jWCJofrZ1RLmOC8xDWrsIIwTy4/llesD4C3TUWpHp2qwiPMVVds3On1sNak/?=
 =?us-ascii?Q?/CQBBVQwGlz/rmUvrFBkY7sbZAJ7IYag2ppYVGziTZH8zNt/jGuuIp03Jokx?=
 =?us-ascii?Q?/68MDGj8dexmPDZFMN0xaO8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RZTo0cb9SeP1o7Mr17/BCQ60gDLISWBQLpLQ72Tn+ZCj4hQY4LNID94asAKj?=
 =?us-ascii?Q?cYl+n4OA5aiu8UTrzh/F/U8zXcbSdoYvgwIm/sUoiuJXesfoCnDDiqumhqhZ?=
 =?us-ascii?Q?iMTYw4Z46WABaht0egyccAFPPg0nqkK97Ar0pQc0tc6Aixd8M1FoeX1hdKy3?=
 =?us-ascii?Q?EgyNuOHyXEUNk8dXhBZIvV32jrMPpfRrYCuC+7ie5HA1mPa3DC6IjZqRzYmq?=
 =?us-ascii?Q?3NzsytfMyeC3M6WvUdbwlK7eogdg7NNOGrWmeUjuTbwcAM1T7SUFQp5+WfVz?=
 =?us-ascii?Q?ibR/rPzrMxcqcH3K4btxqlA4T5lnFvhLp/BtOdXdhw+/MhMWSZ+LyRKtl9u7?=
 =?us-ascii?Q?1398sVf0erZn34o4vRhq0403z+TDhk2NxaJ2j7UVRulETjnUERUNrQe+zV/a?=
 =?us-ascii?Q?TLlsmqzDpsef2+RS+p1c8zbtlEF/dIMJcWE+aaHjysy6U/Ol8eioZNMdn752?=
 =?us-ascii?Q?uz3JrV0oIInmTTfLSa5H4P+ED8jB7XqFB0Ox2U+pw11QQviQwbQYa25p10Wi?=
 =?us-ascii?Q?cacc3hYc2wnEK9m3k1wVxcciXduI35BqTP1Rl1fGeayqueh5T5c9vXWl/1qk?=
 =?us-ascii?Q?B0O/eckphlKhvMbmK1Pa+uyAslBB9SQekJowO18RD7LwKby7J0K/DF5UD0KE?=
 =?us-ascii?Q?HcdFTQs2YQwqBtTYdIqWmrPciR8LhPTkUg1V1McwGiTD0ye0Y1GVSWcRtw4+?=
 =?us-ascii?Q?pDTGGgrzo5LVf/DLUdXZ+qMERxpg5Fl/tSHa7WvR9Bk5uJh/JcJWRsfMD7Fm?=
 =?us-ascii?Q?hGQeEiHOOOeebXYjKIdfXshrqkN+CLK8zEaWLpNDVJ6/nChCY8Ed7rwMM+9F?=
 =?us-ascii?Q?Y4UyWu3KDl/yrxandNEuAKp3lhUxJrjJbv+s24id38PiVEJbsNmdhU0L2FmQ?=
 =?us-ascii?Q?t/Dwtu0kkCLN/mjVhOMiCVKpAPZuQjYGMlEOxo4s72ckMdAUpr/345LGuu5q?=
 =?us-ascii?Q?vAmd1FYUV255SbJhd0qSsft546M6cmUhbBzp5xoJDRNWaprwQ987aUJBEPAb?=
 =?us-ascii?Q?kv7QAYnbuoHYG52Ar5J5XiyUZPe64GDtXwuRWwbiTqb7rHrNPFF6l4e+UUuM?=
 =?us-ascii?Q?5Gl1mjymdlZocyaI0UvNe5vMLpBJqNWAG4lJq8a2dJd8ACEOVveCunnGLLZd?=
 =?us-ascii?Q?fDXVi/pQ3HkrY6yZSQirYncqvRcJoKd80OTt8EsBEhgMVXZr2RJkqWDfDu6U?=
 =?us-ascii?Q?6K6kv8DsUnEwWQGpgTlVuN1V0pFoiFbHTIVziA1krkCGCyrjwgc8hHCgdFLr?=
 =?us-ascii?Q?2N8ZqaKUt3+jBuT5crlmp3byG1SM+uLlMbzEiCArksuCs9QwRB0TgSh7h54o?=
 =?us-ascii?Q?xIrasOu0JmjoM3qOa1C2y2IYvvzX8wSf+YxP6rlxnzOzYU7Zjzhq+TykGlF+?=
 =?us-ascii?Q?I1yWvfecJ3MfGTQiVTQYuM6C6GN796xOfyrDlDAYbH7QjGQf57pfWgvVw3kO?=
 =?us-ascii?Q?aFbooLsfbNOGJ81giZIjd3y5iSjfmpHVUZV4kpMnd9unVU3g1GbwlkfiMUaB?=
 =?us-ascii?Q?oH8BAHzNv0W47AJOoqqc5/6IgFIxQ/Mjt/kC8a4D/RmBzpPw2WZEqxw3VCtz?=
 =?us-ascii?Q?hCBWWoLGo5ORsdO31weoZHYQyUsxTExDbZiVrR2+460A2K9THSKLRsvg7K4v?=
 =?us-ascii?Q?9fcnjaI0x4b6CSrtggXPfg9UTUG8NQ/QT9PKkq4dIOmEnphb3IN8Xm90wjLM?=
 =?us-ascii?Q?0KpeHKMXA5nGjpzRuSpzdJaPPXnvdJB1TFDMbCxYH8pZtHEU8BwBSG7JwVWO?=
 =?us-ascii?Q?asVbmtqRBw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b44382-0a1d-4c39-ec20-08de659f0a3a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:44:48.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtDlLbgl5kUWUtfn04OYn76LYQIaFMk32d7VhahzRLk0bWa1j6LQ69iXzHaFrg1ZYgLODyxsC4yadl2y05qtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-16692-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F36621007D0
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:48:04AM +0800, Shengjiu Wang wrote:
> Add a compatible string, clock mapping table and enable the option
> 'start_before_dma' to support ASRC on the i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/fsl/fsl_asrc.c | 16 ++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h | 14 ++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 2fe25667c888..5fda9b647c70 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -106,6 +106,12 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
>  	},
>  };
>
> +static unsigned char clk_map_imx952[ASRC_CLK_MAP_LEN] = {
> +	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
> +	0x0, 0x1, 0x2, 0x3, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x4, 0x5, 0x6, 0x8, 0xf, 0xf,
> +	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x9, 0xa, 0xb, 0xc, 0xd, 0xf, 0xf, 0xf, 0xf,
> +};
> +
>  /*
>   * According to RM, the divider range is 1 ~ 8,
>   * prescaler is power of 2 from 1 ~ 128.
> @@ -1337,6 +1343,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
>  			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
>  		}
> +	} else if (of_device_is_compatible(np, "fsl,imx952-asrc")) {
> +		asrc_priv->clk_map[IN] = clk_map_imx952;
> +		asrc_priv->clk_map[OUT] = clk_map_imx952;
>  	}
>
>  	asrc->channel_avail = 10;
> @@ -1575,11 +1584,18 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
>  	.channel_bits = 4,
>  };
>
> +static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
> +	.use_edma = true,
> +	.channel_bits = 4,
> +	.start_before_dma = true,
> +};
> +
>  static const struct of_device_id fsl_asrc_ids[] = {
>  	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
>  	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
>  	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
>  	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
> +	{ .compatible = "fsl,imx952-asrc", .data = &fsl_asrc_imx952_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 60b6865ca952..7a81366a0ee4 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -326,6 +326,13 @@ enum asrc_inclk {
>  	INCLK_SAI6_TX_BCLK     = 0x22,
>  	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
>  	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
> +
> +	INCLK_SAI2_TX_BCLK	= 0x26,
> +	INCLK_SAI3_TX_BCLK	= 0x27,
> +	INCLK_SAI4_RX_BCLK	= 0x28,
> +	INCLK_SAI4_TX_BCLK	= 0x29,
> +	INCLK_SAI5_RX_BCLK	= 0x2a,
> +	INCLK_SAI5_TX_BCLK	= 0x2b,
>  };
>
>  enum asrc_outclk {
> @@ -366,6 +373,13 @@ enum asrc_outclk {
>  	OUTCLK_SAI6_TX_BCLK     = 0x22,
>  	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
>  	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
> +
> +	OUTCLK_SAI2_TX_BCLK	= 0x26,
> +	OUTCLK_SAI3_TX_BCLK	= 0x27,
> +	OUTCLK_SAI4_RX_BCLK	= 0x28,
> +	OUTCLK_SAI4_TX_BCLK	= 0x29,
> +	OUTCLK_SAI5_RX_BCLK	= 0x2a,
> +	OUTCLK_SAI5_TX_BCLK	= 0x2b,
>  };
>
>  #define ASRC_CLK_MAX_NUM	16
> --
> 2.34.1
>

