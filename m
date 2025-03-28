Return-Path: <linuxppc-dev+bounces-7365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B3A745DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 10:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPDxC6Zhlz2yjV;
	Fri, 28 Mar 2025 19:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743152383;
	cv=pass; b=kwYPMoMRqN5DuT2L7QwmZxMm7jGm/wrIbOy1pjnstWXZZteE+zCaONZoM7IJ2yLUOwflvMvKgbew022SGjfvSciBwFg933wBTDlJnSB5VMKxMYCBBBniuc6Nwu+zf6Hb05Sr84kRmxMjjl0GExYxTRzUXkKi/3kNeFqRtan20Sr0y6UqIKvSDB8SBUkwjW0LWlCLzms6QipMTWa5AiDbQeZYs+MsKDMMCWYqsCZtPYFzZmXr35QP9JpJLMwc/NPkeaktQBwuY2p6m7CeeL1gW9E72icHWnE7nSGj7mawABHSISTJnWeN01LnG2vV+/rwZ9OS0fJhOAzlreC6sxO6Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743152383; c=relaxed/relaxed;
	bh=yUtvq+OX3ZLxhYKy3ssDYKXPCxqIFU8MZ+ndbeqjLg0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0MU1Xb3vTBufXE05PJBm2QwbR7Zinrv1BaE7uNQ+NswO4Ro63YSGxj4z6sAIyx+ed4KPwdAJ41AKgGrUn1xJeMNPfcSqRbKi9o9vScWi6LNP5EQiptlq2IR0tD38b45v9m6XjOgnJQU7IbfI7HPt2u4pv5XEmkWSe9AWUO05XCyU9zrV5Th4pISwVKQuYpcDTVsvdakGT79TQ376+AMnbEidI3wGt8iAN0NCYUuW8QCEcVXijmgQe0UC191hr0c5B/tTjx6/9nGLW0nNse4T8U52yWDu7Aohp55r03zY33SvdKOyofhyekqiZpo/qj7bjZ55k6aUe7rUdShmAn2Kg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=i9e6DYAz; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=i9e6DYAz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPDxC0mC8z2yrf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 19:59:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=affSZWaEf8DnJk3/20qBg0zASAzHVGApqOPWY1Sn/yhOD9XVuhKojqwxBij3giU0SxHy4oicYFU+KeEkEw1yMtP8c5JaWWeF/YyabFiM3rQYxPdmeCtadfRmyEm9KOHU39oNN82q10aJCNierkNxzNWrCOwd7vdWeJKMwTlr1y5uqbl5lN/IH2KcdMn51jtn0GxU7fCJ6EuiIvP042DyQbSkNLfEMcI54HK2C2RE/eDA584XmyYjXr1qnUPBUb7V3xWGrdsybyF7AfFhymv9SiQOJY1vsU5uCIBJ71RLjeGIeJkqSb8fHn+pkyBO8GMz3st+s3d0GllXqS+fzL1eVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUtvq+OX3ZLxhYKy3ssDYKXPCxqIFU8MZ+ndbeqjLg0=;
 b=ilSm60LQxzYwK7ru/e3uqs0/jF3/bpNpo2iIJXLMRLa65DHgFzOCFwAbCWiABVeN3MZP3gYNfzNsVymvZs4J90whQFdUAwbzD4R7QdnQBoYJuJP3AQfXeKhK6CwH8uZ3pzP8+zBXdky3u0BaA7LlunJCKRO9ANs5NZ7B7Y8XwGbC2CPRX2egwBm9sDE0nhVUMFKYbz/hgHEJtiicR65HB+aD95Bx0jtjZIuUCgYvmmB0D7r6wCe+FGBIyaY1lqLHKF/8fS9sTushvhLuTY1zsJPEWNfHJR4XoPQlkVMeDGg4mZjP2OF0Mgtsj0l1mD8uWMMUBRQFxbOVZJ8TwydiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUtvq+OX3ZLxhYKy3ssDYKXPCxqIFU8MZ+ndbeqjLg0=;
 b=i9e6DYAzOucEImojMHJaGiztYFU1Fo/z/tNLItW1iNdZxjHk15DBbW8SC4Kc6DJbx6i4GP98q4N9PHorhJergx6C8uZqKOJ/y8KbWTAP49rlniLi6DcErQVu4sFkQdN4VCqzELq3ts4/l1EUjJ7S7u9A8gH4pooaZMW5OBWSdSDOOIGOMfw4s9S/YNKC0oYyTNH8jHk2ikTEwHL0+ZFw58RbMp5XhVSSYnpCACAr5VF8z9kMcVFtROgQ1uz+q4Ww1PLlKWdu4TCDhv9YY9MWK2n6HCLy9TZpXAMu0sb56Lbe624RWBu/t3/rqSxEzT06JS6dbS9Hj95KbySueHMqwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:59:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:59:27 +0000
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
Subject: [PATCH 2/4] ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
Date: Fri, 28 Mar 2025 16:57:42 +0800
Message-Id: <20250328085744.1893434-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
References: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ed9c6f-5c34-440d-aa24-08dd6dd6d7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6473Rbi004G1YKrIUftC7v7maYHy4GUox4MbJvVu4FEmVBI/DbSsztvgBOI?=
 =?us-ascii?Q?4P58BR7trf4zpYCCxV8PHTci5BTo1m/r+DvdUCv7VOkBpzGGAcLqdl2fSAVP?=
 =?us-ascii?Q?nCNU/kCZR3ELmenY09uo5l8LmrIT8z4EgHcliApcuETi2jw6P5m1pB90DyhE?=
 =?us-ascii?Q?P3P4l8rP9hmkCm+6wbNtYIar7JYqMy2bh71QVHUjTkV5GxGn1RvX+bqEuiE3?=
 =?us-ascii?Q?p5ZWw8qKbIcF3Y5E9dKgoujTggbvpCk06ZuLsDwFTSy/NS8OVpfiAU1zVezN?=
 =?us-ascii?Q?9Ej+APFv/8GRBmbRJHfDHfh9vTJ+PUF76ulvK3Ci2/2uty3Aip0epnIij7pA?=
 =?us-ascii?Q?iEwKWOautukQ9prj52ILSoieIarO4qCcmYJR3lDOMw3g1RpodBOM9X/QfrY9?=
 =?us-ascii?Q?aa5Fqroiq7umZa0qBrHp5/v0gZtRrQbMFzMEqbZ36ztF4Rd9qFUDD6DptrYT?=
 =?us-ascii?Q?DfjOXAArmkvmc+7Nc59SLA+5+NNB50fzHoV9aK3TtvWgnSn5Wwq4mgkK4QNo?=
 =?us-ascii?Q?13axNTM5sec6Hxs75lntfw14rTPpOI38rQsSe5lM8leV0fPDfYmy4EKVDGvf?=
 =?us-ascii?Q?sGAq1+5ZY/6aElvpwuywBtbMejxUsbxL3b/4bI9vbqpChSVZrA7ZCd4rgEXN?=
 =?us-ascii?Q?9F6l9ZdnpIZFcmKYX+BdYAFV26hHJ2zyOaYWQ3SxLM6PRu7SaSM4gEmmZEBS?=
 =?us-ascii?Q?6hseVCA9uhDNzroNtCrg0/0w7C/flI3BlZk7GF/bAblb4uiYKdS3CH7D2aTK?=
 =?us-ascii?Q?TqcQA51SVb/sUv+GKmC9RW5f3V7dhxxMZ8/7hhfIBiGXhkhzs8uj9uzj5CqL?=
 =?us-ascii?Q?iEVLgNrUXn/V0XpYK80xWcff649bI3PgQwNDO+BnjLFJzOJN/d7E7hAOIEJq?=
 =?us-ascii?Q?pYfulywkfZ9lwpA3WXRZBAIAPy8XzBWCMzhfiJcYhkaI08dHkpWE/egR/Lhw?=
 =?us-ascii?Q?7Q7NPGfkR8m1JQmFqOHz1ZjQg7PFPGcW73PP/ncrQtCPk31eSIdsNFOcbljo?=
 =?us-ascii?Q?OVXOPD056SwMQEIjQ8Yz4GC6N9ROLcH4cxU17/Ds6g4nDKXgZ1yoyxN1+xxt?=
 =?us-ascii?Q?MkzXdexeDkx3y9S4mQSTg0TNLLvKIrhr2VoGryZWCl0uwlN94vVWwZ/Gvkxl?=
 =?us-ascii?Q?ylrHbtCEE+kaCVruQRe71um4yqdyjSf1gcdmBFgP3LsQy+xd2+WoEv74t+JW?=
 =?us-ascii?Q?YqAM48WTTLMVpGfhdHscQmN2SxGKjAofmQRdKWhkKgBcPbbTJDJyYl3LR48j?=
 =?us-ascii?Q?iCnepFYlu48VL54sNdxiDND/9BQ2X+y8/AxV+1iNJ3wGXz1FWh2v/dl5Wl+w?=
 =?us-ascii?Q?bIng602uLoZNAocV+gOlh4I7ces2GCzyD3WXjm0wOUrWuuISDbNcS1+MfxrS?=
 =?us-ascii?Q?llKhDvh7V2IlNRvAP5oSDFUHnI7G/p+YJuJybUOGM+942v30Kyvgdq0XLoEZ?=
 =?us-ascii?Q?Ea+dFFByXgEh0kNyiq3g4MRw77vxxuLQx55Dqc1uY7TRb7objsvRbQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6sEBq6qZUyv12Exl9IRjPAgMiu0NgUFUXnEHatDiBc6XMuQ+paXlhZsXuI9S?=
 =?us-ascii?Q?RDgTTLJDf4ZCGye7fwqm67odedeHtyhQUorc8wi52bfn24pcBMDZwr++LBDp?=
 =?us-ascii?Q?NTGXMjqqdD3URnRYwdbW2D+6KYmXl3fh10pPff60aJCQdCSN7kV14SBXT/gK?=
 =?us-ascii?Q?bnADW/yCUgsMLtaxFEC1m8GcJf58/7djqudTOuTdP7Aj2hHpo43n7k6Xxp9H?=
 =?us-ascii?Q?qgdru95W8L+kspjC58RaifpyPMNPSoj77PXsgbb/FLKoCDi7exa6Kv5GnOHj?=
 =?us-ascii?Q?nVI5EtaZ0nEtIlnvTdT1mM/s2L4Klr9kNM+Y2JaxhVrquhbPcJQUX/ZbLZ36?=
 =?us-ascii?Q?zDHjfwl3LwPjdZ527R2tw0koR4vuv/r/y2/Ah5qgZ2Ur/dOUZ6CGsdXDdyvz?=
 =?us-ascii?Q?SnN3EcpyeZkyd49G2CcdLK5fk88Xd5LEU2zS4V7U9Wf+7zkQVPl0onyE9S4E?=
 =?us-ascii?Q?9dnX3EsZsI7urA84PnGyo+Za0AbnZOZL7gtSlH89Wo2lskQ/BhGC4y3DNtM+?=
 =?us-ascii?Q?4mwFiVL1HffKg7i0GxcHbfL4jzhQY3/LzT4DUJ3V9+laX6MYo1uTsfhzocnX?=
 =?us-ascii?Q?cyvIbGimW+YiIAsYYa8jj/OpjsLdrhUrBLfgXeVGdcAf3W3kU3NquSUTTgT1?=
 =?us-ascii?Q?z9uaCq1zpAqHDqKVaMgN7awVrz125xGn99gsFm/dzQsP8e0ePipJ+QPRwG/B?=
 =?us-ascii?Q?z6AXM1htt9SX51K3bHesvTGdSMTzBpgbbsqwNR414z2m8oI8PJlfdYwDElz3?=
 =?us-ascii?Q?eB/Ym4IH/zM+mwsoYzhRZh7hFBfno9uExo5QovIdGI/x3VDI2OVCO9p7Lyiz?=
 =?us-ascii?Q?98LsyS4rRh+rnIMdoyeWXXKfzJxv9JXsxEJjuCFop25lAGL0LJt6g/t8Zs+H?=
 =?us-ascii?Q?kV+UmmNB251khCMnQecxkgtcHjE4ZF9CMuo4qMYKI8J9S6teRgBmmSq2ngkJ?=
 =?us-ascii?Q?uWEPt86fCcJOxAa04cmUSr4lt3Sw6YNQHvndB8FGYhzRWxSXAtRNP3e3CYbL?=
 =?us-ascii?Q?/8gudnodk9AahyG+VrpgbO46CfRHzBiW/4EH15QyH2gogyPORHHG5v5ApKmV?=
 =?us-ascii?Q?5psRirxenMdI89z5XmBvqOv2FYf2ydb1hO2DcIGxqZBW1v/AAeODZPY+uK2K?=
 =?us-ascii?Q?tIShCVVPxzmMIM2lGCiIbIZhqJZ5f8yHC3TXCW9wJwvtcPL18AK/JHkQuv5h?=
 =?us-ascii?Q?BHJ5Y8tL25NPZP+zQpa9kbNsk1KiVk0HCyE7fNz8ZhueJzrsVFXt4FN6/sJC?=
 =?us-ascii?Q?CkyxsBXhDWB4td/rYYs9DKPh6xAKmbfWXwkvmz/Kutng1RaHCQRa5Dd0hcns?=
 =?us-ascii?Q?pz6kkzCChfLviKZ0uqB9Fp1P8j//8cb01a0ZmKyayhj8RjQGD+DTwCBaAVd2?=
 =?us-ascii?Q?ZVUPMv3v/sITvjnPQf9e5gwhfZ2OK04lo3GUgnoFmmkZy6NrS4FzM6ct0lUa?=
 =?us-ascii?Q?A3mROdg9vQkxWeBBWAHwW48ZaBD462+zpG6HlQnbrssLQC44PgbA86n1Pmkn?=
 =?us-ascii?Q?jvBNT/JWCrcBwuCFLT9cv5bljmXiyiD6VexdX9kqT6CwbaKEid3dM8DBBd1R?=
 =?us-ascii?Q?77Qp1fk7dwxSSDWMcxGgSYqpfPKLFCyFojh5Rdaq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ed9c6f-5c34-440d-aa24-08dd6dd6d7fd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:59:27.2546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uNCbexIsvUr4N3to8yrQkkN5IyrlIW/OcPP60FdT3JSkFK4b3w+eCe8BhvaKy3PyGMamauTFzMKBp6nzxERbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With DPCM case, for example ASRC->SAI->AMIX, the SAI can be codec dai
device in backend, but __soc_pcm_hw_params() will get the tdm_mask
for channel constraint, tdm_mask is set by snd_soc_dai_set_tdm_slot()
from slot number, but SAI supports flexible channel number with fixed slot
number, so add an empty xlate_tdm_slot_mask() callback to avoid the
channel constraint in __soc_pcm_hw_params().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index bcb46a0b5e68..9a450fc86dba 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -174,6 +174,13 @@ static int fsl_sai_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 	return 0;
 }
 
+static int fsl_sai_xlate_tdm_slot_mask(unsigned int slots,
+				       unsigned int *tx_mask, unsigned int *rx_mask)
+{
+	/* Leave it empty, don't change the value of tx_mask and rx_mask */
+	return 0;
+}
+
 static int fsl_sai_set_dai_bclk_ratio(struct snd_soc_dai *dai,
 				      unsigned int ratio)
 {
@@ -933,6 +940,7 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
 	.set_fmt	= fsl_sai_set_dai_fmt_tx,
 	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.xlate_tdm_slot_mask = fsl_sai_xlate_tdm_slot_mask,
 	.hw_params	= fsl_sai_hw_params,
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
@@ -945,6 +953,7 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
 	.set_fmt	= fsl_sai_set_dai_fmt_rx,
 	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
+	.xlate_tdm_slot_mask = fsl_sai_xlate_tdm_slot_mask,
 	.hw_params	= fsl_sai_hw_params,
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
-- 
2.34.1


