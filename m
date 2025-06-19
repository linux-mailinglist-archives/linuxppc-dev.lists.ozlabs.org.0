Return-Path: <linuxppc-dev+bounces-9519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E46ADFDA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 08:25:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN9Zd2lqQz2xS2;
	Thu, 19 Jun 2025 16:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750314313;
	cv=pass; b=jqHMc5itIMmYcf+49CEul2GZlj2CZdRo8cWJONZfN4vPiJf3FU7/3l56Z4iSAnw56gOrThhrt5eRS+h0aXzfV41RSYYVFT7UVAJx9sApqp54HpYVigCjmkVIvMxOKbejIiwMwvyzwFFm/Hq0KPPjGs47V5a4R2+5sEa+bBweXEXAKS5qEmsPl9YLW0HzYu5UiIznWNxg+mLolx5VyUJ64Cq0UiPT5h1Y3nYIt9wSyrIj/ROYVLk4ZzwOoO8hPRoG7BDtDpk8xzg7LvUsUndEUeMX3XhCqOEKQTbDRge2RWRxaIKV2BKfZ2ChIemvAD3dYvjPElgeDobnYveoOQ8Shg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750314313; c=relaxed/relaxed;
	bh=L+iRGzhIrF1EQzJAkfm0JWKtj/wKIEnBRtAuJR1k90Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aN2bkah2q/7J1w/Fk8/HERwVjTH2UoHBYaczjrBfDxnvK2mkZNSVDy8mai4lx9odU8+1JYzBRP5KX4UhvW8au1V4KzPz7CnA6JPhMmjGnmLhRrnGXEAeUKH6poQp3+Nwmb97tBXoVaG8trRqCEc4pa4ojqn8Phe2xpiD3iaVQCNs2Fnzr3+ZYtDjLflHFwVy2MjWoV5HiNlYNUiHjOxwrjhKo+8H8ZGjvlAbwwXL2GocQlPF4A8oQJvcnbbM4kYhXfi1dSIEY+UdnuBKghnI/7yO32TQbRE8g59S7n4zSklAV3ZAUAgJBXwlaxtpH0kljUQOQT8Ow68B1PYDVBRWhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bMbm1nyD; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bMbm1nyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN9ZX2877z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 16:25:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhK8+OvMUTwnX69FJXzdT8Qem/O0NOmJUi/khHHzw+myjNYGNQeO11AMNgUH7YsxltZFi1knUHypPM72pqImYwCyMVeXjlXGPu9h8cMxbJNUhQ3P9AaEL76CLG81HE1b4nU4VZkqz4vrvJ/HSs/e7NoeD+ZWdCJdEUcqD0w9Kr3PKb3MtVH/k9U92KVYNJJSlwIYBgLGdvfZlr38aOPAcLPEzanCPqXw0wquRXWBJEoFWB6h9+aSiDDSv7wrFRNitkqySnWawFUpDq/v51lAqsscYhgeAgsi5zPhQ9wC15aW0RU/dTsvJhcMJy/SbTGsjyrUGe6H/6eijIAzJPvpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+iRGzhIrF1EQzJAkfm0JWKtj/wKIEnBRtAuJR1k90Q=;
 b=bnE2LUlBfSg4rKtJOAO1OGNEYVz1RnsNnlqCVvroR9PMECtzG/Yvt59Thxtco2difyX2BAph9bpI1oZ+El8wHFfKhJuDEhwSOydvo6pvnHee6P5YQxLs8lLE6iCTNQR9bHWzuDBOHd/qqb5Ej2Pe1PN+nefRY0Nd/ACaAwSMWY+XVprGxUdv3Bh41zQDVPOKUXeNHLBnW+CmqtSJjcAkimgTEinybpdB1LTGNZwOW8Wg8vonK4BoWWw4f+0lt8Pi3fAXvrB7M+NVpcscfuvtuMUwiM6VmbIEcymvasyoS1kOChe7Qqym14n2gNPUjHHvZ9ygSqdVZrPc9Mtm5M/R1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+iRGzhIrF1EQzJAkfm0JWKtj/wKIEnBRtAuJR1k90Q=;
 b=bMbm1nyD13MVG/d3n49h0/Dtx+GaJRxsFjFGcNQ0IHuoGbj9a4E0fm2wk8vBFRVR9qR4/YQumm/DjCrOaUlxjI7BAsPutZo19OdwDhbBZLIUutg7JLlUPjvAzqZ5Ljna908tF2Jzsz14yt07Oa15mCB4nNI94Fn5DuYj22kzjZbXw/pvH3pPNMgeUFEP2pfHc0GxU2O0FMzfe0Ksho1oeSdUYhWR1iKbKIJGO0BmRUy6KfgGefdP/sGpFxdwLGCj40KOSjhX0uRKp7r6Ksdb2jtGGFUmF7uz2P9IHBvl1OtUUuiCnC3/7JtRAT9rqLj25Bm4M/X8eB6cVs9LxHOeZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU6PR04MB11183.eurprd04.prod.outlook.com (2603:10a6:10:5c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 19 Jun
 2025 06:24:41 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 06:24:41 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: imx-card: Add WM8524 support
Date: Thu, 19 Jun 2025 15:24:13 +0900
Message-ID: <20250619062413.3946142-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU6PR04MB11183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2251c826-f1f1-4106-1f0e-08ddaef9f92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hO/KSU/Mtvk5v7/wkJ9gXC40AIduCDXYi4UU24jZieZ7S6/KJF8j+ZfdYHDm?=
 =?us-ascii?Q?tsrP0aw9ndON546Iz7P9HKvXC43bfv6Hvm93O72TQmGpivsr9UX/r9E77p2F?=
 =?us-ascii?Q?6/62Iv7VNUBRK9m3k1wCAoR+trgCS9AKIzvCt0dscfcUnqXoeyaO20ODv5/S?=
 =?us-ascii?Q?GDhdkda5CY/vHxCiHbtBxoDLOJq5M7NdV5yapcO2bZYRFppdDGYCm4sbmvgu?=
 =?us-ascii?Q?OnY949XGyQE67X/lScUKtw3H8gc8YGDwrNHmy8M+MlDwNnzHVjB2RVEnwlNz?=
 =?us-ascii?Q?Fd+CCG4XloNR52X1bfWjkpsNpvvg6VR5ZVX2km9m48g6bcTBNihGB2ODj62o?=
 =?us-ascii?Q?jp1Lk425Ras9z6/jZ6grzybul42a4DUGZGik+Y3SlYXibFWUoleKHtkZNhy5?=
 =?us-ascii?Q?Jt1YzUf2Ke/1oWGAkLD+T1WtS+73nwUfjNrfoNlkqDfOZfMP91J2Lmhvm64S?=
 =?us-ascii?Q?maN0qzZPlV3pR+JrFkIm13cSZXrx/wfajt3Ml/2sFgUzSymk+jQzCahr/0XG?=
 =?us-ascii?Q?yQ9oQvWbZs2mIgrA8MBeagU1H7rNq1USDKmaR37Z+jg8S8XHRmW1gUCABJML?=
 =?us-ascii?Q?Ei1hXb+wpKGGgaBPiXSgH4K0CAszorjcp2pcwVTSPT50o7/4GcPtN5zyA61A?=
 =?us-ascii?Q?aqqRJ7Y4m0zl0QKE0i7PgW3U/cINXXj+jsvSNzgeW6UfCe7DIqwe1XGADsA+?=
 =?us-ascii?Q?d3TyvTSYUXte/10pXH7YQlE862zl2Oz4SidM29jpKGDC3MbaKoqxXUbFlzTu?=
 =?us-ascii?Q?K1og8b/+55/Tb17RG/H04AwplxzjcKaQ7bDQG9lgmvR/4vk0LwAwE1JY0SSM?=
 =?us-ascii?Q?1czgCRCIXJPSS3FVTt2K/uhYiti69m0zXNeBIv1bayFLWfTP0RJyrsE86q1U?=
 =?us-ascii?Q?qhpfS2yK3jT1X7crdvAes0DOjPmEtjRyjBTnLhCxF6hFsQuQRbfjVlhI/0F/?=
 =?us-ascii?Q?M8TR0HHkwZhkJbpOVzTO1pllvr6qhz7vg8uGe5YHEhAB/f+02Nh+CKW9KyK0?=
 =?us-ascii?Q?sMvZtU5NOqzV0NgPR8zgPKBOQ/wjBjqQ49kDREaSq5WihJW7o6jPIoy2ydQd?=
 =?us-ascii?Q?+jmL3sjlJJ+a1TNQZkRVwqLguhkEpk1bgUeZ3ihOtHibyf2ZdaRE636ZmQ/E?=
 =?us-ascii?Q?TyuNhurvKzNB4Q8XJrYiomromx/rhUO/TuNVIRqf8mUxF3mpFWF56A0JwzfL?=
 =?us-ascii?Q?XXKF6+S0RJ6On0ibyUSyJ8srk5Rdl4iFoc7vEXb31FKkIwuuV5UNnTr5w8nI?=
 =?us-ascii?Q?aENcMZUyPII7SYrxoKT1T10GMc6ivE51lOfvo6lPrjB8YWiH4DAdx56iAr24?=
 =?us-ascii?Q?mFo6quCyARrVvO67zb/vjQubG8m1B9rwjaum+/vzxO9KbZcp8dXs4Z52s75U?=
 =?us-ascii?Q?/duLliVZ4GqYiR99UtczEWU9ieXCYXzkqwSxT9CZXodIP3c6N9LVpmqDU17O?=
 =?us-ascii?Q?eE9DRgANqcqjJWPgC0G1pXAkXK14APUSrGQD1Pb2AEGSmeMF6Ps1JH/ojhGj?=
 =?us-ascii?Q?l09uLjQpoKSt2n8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lpnWSiBk8pUH8wNbNRHtpQ20eO+e9HXeGizZJdHtN7LLg5yt3sCi4VMnlmug?=
 =?us-ascii?Q?F+mXCyfuuDMKV6diKHioLvtO1z77P7iubVBqdw84+KhqNrgwf99neaWe0y0B?=
 =?us-ascii?Q?yqoO34ytjScquT5p+nqx2dw2iQGl5DEkwGx+gAm0W40Wa+X7iBt1EmabkU+Z?=
 =?us-ascii?Q?LhXOgGmobMCUGf/s8FK6HQgm/+CeqdSObLvBisTxgQwwyylvWqfZq7oqF1bN?=
 =?us-ascii?Q?gIzAzdOyTCQ+lD+EwGn7uSWeoMn3viyh+rHPA39IUazKmGJAGpecn9hr6M87?=
 =?us-ascii?Q?hVzPblW8acSxl1XohUEIPeWBLIdERNwnoIpUqlXPSUliFkS4pBzpkl3Zlyck?=
 =?us-ascii?Q?KB99RShYYERubD3F3pOJyrrI+ydH5tTCNq28cnWyS71HUV8A6UyR2Kr0kAsx?=
 =?us-ascii?Q?6C/gABEmfPL94SgKXNcrPMRXnb+uDOQ/17WvW+Z0fWqvuOTHmAVKm5WDeHjd?=
 =?us-ascii?Q?OXVd3rdtfim1rKhxfJbPNjmcQUadV/CI7VQn7BP5zaAXsaNHnU13S40Kuto+?=
 =?us-ascii?Q?SnqQDcC4b+N07tZnTCOwHmChWQnyMNuvSRLTSLaJFVCOuiT921PFuxTOdDjR?=
 =?us-ascii?Q?EDML9nRJCrD81ijOIgwfok+9Vc7pFo/rAqDTskalVL+amixpeSEU1c2EGHKF?=
 =?us-ascii?Q?gTDWaOEAUJr0QRFvi0/H4yTTaOhtDW2e8GN25B1/uQ/FJTOCKO/miVPsvtrf?=
 =?us-ascii?Q?d/b0KwEZZBQgfy2DQzXImMhtrirlUMyyPCkM4pq1+h6Z6WNriEDou+BhTf15?=
 =?us-ascii?Q?0gL23UZBEtZOIig0qRrFzmo0JqA6iwGXskPX9WbpqDztyl5TNhF9mehvcuEm?=
 =?us-ascii?Q?b59QN9XEQ3adHt2+JN/N/PP/b+l29TEMOdGRbfsGs7s4wmbpMctxj77IM5EP?=
 =?us-ascii?Q?/OhfojI+XMSBUC3RUPS8OZSKZ7RxWSjhtcz2CToorlIj8yuhCQAVV4RcdSSn?=
 =?us-ascii?Q?Yvm1WE9Adde/38Z8cG0oJOYkYImw8lcndJVcnUTb1T9CrSIP462t/2RoAJUJ?=
 =?us-ascii?Q?DhC/g3eoJX1MtxkIpClq5+hKtJEKrXXhKrpmWPoGALQDvL4DhY5MwKzfZRFV?=
 =?us-ascii?Q?LTZOJjCAG3ufJytRrsuPoH2UGZ1OQsQbMesW9/cAzD/MNYKO+GLbrveCn609?=
 =?us-ascii?Q?5wfcP5E5/2cXv2WxcgPkOivExUgz+sx4QM33G1IBQWaxGPbwbaEQV+96tvYY?=
 =?us-ascii?Q?dtxGV4TVb5HdrdSGmOUKCmWuhNPJqHGHwre78jEzpVm3OxsRr/SKAyqzfwRh?=
 =?us-ascii?Q?oV2KPiR42g7Nk0QSDB7OvF04nqx3Fek2tY07TM5RZnJ1bNYBuJupWaYkywtm?=
 =?us-ascii?Q?38THhkYviiykTxEmrwyZ7X/U9j1Qzh7PeMIbPNU9BuvNXwscDskXORYct1HU?=
 =?us-ascii?Q?o9JxybeH7JCmesIQCzkUTaw3OTUd2zCVgrbHJ4aj0/yqivNs3zA6w0R+WyhR?=
 =?us-ascii?Q?nVBOOMAtKNzeSh0WwYPVQakaQywKGt15SPZ2BSEIdO58QexYWG/bnLebrZY0?=
 =?us-ascii?Q?nSq/k3ZI1sEGkKeLw+B38tvSqvTuLVfIFjL0Rx+nYN8qgCOP/HRyh+8N/VPg?=
 =?us-ascii?Q?okA0s+1DTmmGMU852N3BdlAdhbjpX1p3LQuO0Bp0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2251c826-f1f1-4106-1f0e-08ddaef9f92e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:24:41.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzEjpGDi1G+k+TJ8QrTypUYMSOuk0jGvoNnWTbRHUCAs2smQcmSkjqDjFVw11uwfg0yIEkTkCRa76SjB1XowHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11183
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

WM8524 is a stereo DAC. Add support for this codec in imx-card ASoC
machine driver.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-card.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index ea5dbb54b584..c2c22a058c46 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -26,6 +26,7 @@ enum codec_type {
 	CODEC_AK4497,
 	CODEC_AK5552,
 	CODEC_CS42888,
+	CODEC_WM8524,
 };
 
 /*
@@ -196,6 +197,13 @@ static struct imx_akcodec_tdm_fs_mul cs42888_tdm_fs_mul[] = {
 	{ .min = 256,	.max = 256,	.mul = 256 },
 };
 
+static struct imx_akcodec_fs_mul wm8524_fs_mul[] = {
+	{ .rmin = 8000,   .rmax = 32000,  .wmin = 256,  .wmax = 1152, },
+	{ .rmin = 44100,  .rmax = 48000,  .wmin = 256,  .wmax = 768, },
+	{ .rmin = 88200,  .rmax = 96000,  .wmin = 128,  .wmax = 384, },
+	{ .rmin = 176400, .rmax = 192000, .wmin = 128,  .wmax = 192, },
+};
+
 static const u32 akcodec_rates[] = {
 	8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
 	96000, 176400, 192000, 352800, 384000, 705600, 768000,
@@ -229,6 +237,10 @@ static const u32 cs42888_tdm_channels[] = {
 	1, 2, 3, 4, 5, 6, 7, 8,
 };
 
+static const u32 wm8524_channels[] = {
+	2,
+};
+
 static bool format_is_dsd(struct snd_pcm_hw_params *params)
 {
 	snd_pcm_format_t format = params_format(params);
@@ -261,6 +273,7 @@ static bool codec_is_akcodec(unsigned int type)
 	case CODEC_AK5558:
 	case CODEC_AK5552:
 	case CODEC_CS42888:
+	case CODEC_WM8524:
 		return true;
 	default:
 		break;
@@ -632,6 +645,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 			else if (!strcmp(link->codecs->dai_name, "cs42888"))
 				plat_data->type = CODEC_CS42888;
+			else if (!strcmp(link->codecs->dai_name, "wm8524-hifi"))
+				plat_data->type = CODEC_WM8524;
 
 		} else {
 			link->codecs	 = &snd_soc_dummy_dlc;
@@ -805,6 +820,10 @@ static int imx_card_probe(struct platform_device *pdev)
 		data->dapm_routes[1].sink = "CPU-Capture";
 		data->dapm_routes[1].source = "Capture";
 		break;
+	case CODEC_WM8524:
+		data->dapm_routes[0].sink = "Playback";
+		data->dapm_routes[0].source = "CPU-Playback";
+		break;
 	default:
 		break;
 	}
@@ -854,6 +873,11 @@ static int imx_card_probe(struct platform_device *pdev)
 			plat_data->support_tdm_channels = cs42888_tdm_channels;
 			plat_data->num_tdm_channels = ARRAY_SIZE(cs42888_tdm_channels);
 			break;
+		case CODEC_WM8524:
+			plat_data->fs_mul = wm8524_fs_mul;
+			plat_data->num_fs_mul = ARRAY_SIZE(wm8524_fs_mul);
+			plat_data->support_channels = wm8524_channels;
+			plat_data->num_channels = ARRAY_SIZE(wm8524_channels);
 		default:
 			break;
 		}
-- 
2.47.1


