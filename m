Return-Path: <linuxppc-dev+bounces-10166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ECCAFF750
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 05:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd09j3rZ6z30MY;
	Thu, 10 Jul 2025 13:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752116793;
	cv=pass; b=mgygB6L4mfHK9o4U2aQ+SJS2uVIzAE/C83sgqgMOeB/qZyW2E3OCjA5NEZlG5RnuoGN94CksgbXwrHOLyyn0YISeYEY4xUT3mbf8bmW0/XR2QRwb65njAbbvjRCw6FAKWNiYOpCYdPDcZjHOuK53gWh33rt9irJvEQNlkdwdQoRkEeEnQL6VFJ/pzDnmDMPaUXtxrTfBLZOzM7nfoVEn1UQ0o4zY63QBbuzKvC359WTR5+jCVtGIVJacsOlE+tL/BAGLXS+s1MqBVya6ZB9DBlKYCAXli3BZqfdyWGUSZ6VNVkX7Ckrx0YUmBDkhExXvRRvtc57AJ6iVX6IoAuOsAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752116793; c=relaxed/relaxed;
	bh=SFCGFh5OssziJ5mNUSH0thPYwgNQhSkNJZRfY7yRSvU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gX4vIZMVnDaJdVFbdkcVzdjgdEJz6hVlVPpzKoN1NNo7p49HOEq6lhCHVIft7kxQzuZjDzMptc0ABqx277z3QFbfRRI3BRsLjzJgC2+3CFlDHLDOcpEdAJD7/n5TiHc3+HrerpfadoGosXJvpEDO7mJ1ssav0MYeWurXptJ4cNVPU9cenmkDtRsZgdhCCT5DcO0EVK49sLpsukcuXmjhb1mCn26PnXppIkMJZWkbVhTL+B9DO3Pn2FeEXPs5WbD5TdgfTFDmcYNyNdT20yeh7fqN3dIi343Dn+hYHGxhNcOZOeImnBJjyxQAuBzxiJuqkY3/mWoTl+F3a9T/dATg1g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eL+w5Dx0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eL+w5Dx0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd09g6sRsz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 13:06:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYBp2j3EuVzHto2UPs5/D8/nTMU+OEauM9SFwe9bu1yiCJIPNcl3YyhC5BxlV/nw2wZwNQMSWHZjLx9xs/dGILwq1xWvFGBfg8o7XuJE1yidOEKPvecjiqVZ+5KBqWKNcdDMFVBcYRvBSbRVW0Pod8FTPuGZSc4DMapNtvvhoCV+/J+d9AuvLZchEVfXEfqXvyt5wTfksdhaohz0Tb6dzE0J7EpF3XR0qnIAWjePpELggJndW+MVVulFA59Q62/Y2or7GFfGKSqHd7WfdxZEMmsHXz2WshJ0gJdNMrMQ1Ya9dWym7Uvec4fuLauQ+3FMTxFju3HR3BXEuESse4j/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFCGFh5OssziJ5mNUSH0thPYwgNQhSkNJZRfY7yRSvU=;
 b=n8XtLazO6qcX7mXibwkTu4DdKReVmCb1HXisWvmyMWp4V0hfOoozeUu9xEpN0KwFfC2F0qZO/SyGP2ynTN76yx4s/ty9ZcbMzFV2BBfFcMn95MedeMyXK8tS2pRTjVGAopUkhM6k2hHK9235HcEjlpY6xm71lNYeY3xZFcNIuDkFpIDUnyuJht5xV3NFBy8rMP4oAPAKU6ukXOSoDvk83op0g5fdX+R96KN8qJwl6AcWxjytAauYliMCqIaHBk+fDU6ZYYudi38OrFWV1nq0kr7wE/Gs8dPjs4Wo9E+Kne8P7Qjw+WrQKcgh6o2YyvviIeBuRxf87uvPgJbKun9R/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFCGFh5OssziJ5mNUSH0thPYwgNQhSkNJZRfY7yRSvU=;
 b=eL+w5Dx0PK94d1bWeuwXZpm/DB5VeJuTuLBDD03G9KPSY4tfvAFZpL7j4fbItvMnu+KkP3OeGl+ZouU0MLJ6hWMbnX79p7O3UndxXPXHvJgn9hkSrwRWFU8NY4xVH6/7rJyn44vBJl9KvP7fReCgNua1M/k3JvgWJF2Rj7iMUh1prmpwbfI0wjTtyN143wPe6YxeygnG541w0NtO//hhwNiMQO2ls8kS8cOBM+G9qFOeVkakATIigcPwzTWBc98v3tyh/qixFT/7q5TvSn3zzH5An5OLnOapJVLQdKWpoLDh168JkOI46pMnp6AG3TEEN5WvHji1nNltZo6B9HKkZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11221.eurprd04.prod.outlook.com (2603:10a6:d10:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 03:06:06 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 03:06:06 +0000
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
Subject: [PATCH 0/2] ASoC: fsl_xcvr: get channel status data in two cases
Date: Thu, 10 Jul 2025 11:04:03 +0800
Message-Id: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d597c89-22d4-4f4d-e3da-08ddbf5eb645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3zgEFXbqPBKmTuFEgPZMBgAaCKflIeiZlgdhq4vy5eZx5f2XNZFwwMxpuvmp?=
 =?us-ascii?Q?R22TKGpeXal6pKUdn2Ug9aaNmIt2jdl9OqGUs5QdgIJdYrXMGdXB/TG5MdeT?=
 =?us-ascii?Q?InYh/Ve52YgcnpvKBgyup1jW4H38SPQE53Az9+iT84oo0xZVvcxMFZNUNpih?=
 =?us-ascii?Q?LhUfz08mWUjKf0OGfnzWQ2+3NuBlY8w+60T8brkPtt+fJB6AVjyAxdFOIGjF?=
 =?us-ascii?Q?m7dK4zmCK8rRQUudV+fTLCIwne9LqqJzhak9cvwbzP0nKWWOda8RYDU15Hk2?=
 =?us-ascii?Q?nTSl1a2N+gmXGn7WZoGyV4rYERsu7qKR7p3/QeDRbZd2n4+5vFiDOag+9JWr?=
 =?us-ascii?Q?4mPBbCjlwWgHJxt1gFSiecL4pYKkQKq1zNkjJegA27LkRU4p/iQS3EGjvAik?=
 =?us-ascii?Q?LMeHk8G1B9Lgnpb9GkRMNH4v1wHVOfPV99Dq3Lh36jRSH8SZUYqkahD0e5Yk?=
 =?us-ascii?Q?UPVM6fFhuss3b1ctZG+vPqrr7+EcHrwj7t2+g1zgNlAgBX+ZkxPpiaolVVlQ?=
 =?us-ascii?Q?qTeHtBHsA5TKTfhODZMCGZ+2AHt+6DzaaEeMik3iilz4BMJq0p/y9q5LyXKc?=
 =?us-ascii?Q?wTBCM3mNSYD+G/dbEEfUtGloVb18q6zyYk+DPckEzikzOQUdmcv6R4Bb7tDO?=
 =?us-ascii?Q?2CFtvp5t0gR3gp0v1JpfD6WmzYCGHwJVM5MxWd4E0xNsXBv4x+wn/SDGlsOd?=
 =?us-ascii?Q?7RrlEfbLkT27+JfX0FJ97FH6OTMDlNdGIvHkeT+w6YlmWwbXQ2HLwTUicEQ3?=
 =?us-ascii?Q?R/AHaqRFFRFreKPcampOCmSHdPpSFGsY4T4/VX+PBJo3+QfojhxUD2zznz4X?=
 =?us-ascii?Q?LHls4bfgCwvXMbNWbWKzZRUdjXRjn5Qnl5IPr52+8Z5oF3cIn06kNgB6yKQd?=
 =?us-ascii?Q?4PP9Nf9hrPzThUoKh/VpAgOrvG3K8wBxoEhC7YsmyowGJGt3l/gMVHps6u0w?=
 =?us-ascii?Q?9nnXhFXVrSSmSYwI+OR+8SmeEczDb+MIkraZ7SEYMJ0MRRZl4NHZsKi840tY?=
 =?us-ascii?Q?Q6XPMLHtnwODhKVGqpuH5w5KQE651FN5/n+OTcH0nf66JNlzDVvl23Dq9yoF?=
 =?us-ascii?Q?4lG/ch6u+i4SxzI2URzH0Skb7vGqlXLs6JyAboRdvbfmtYf4DpukOKBSbCLe?=
 =?us-ascii?Q?HckxFWv91n+p62tbE4WJF/jZ9oSiChhktBjVYQ8bpJfcu1b6D8Femv7zmLs1?=
 =?us-ascii?Q?s5ENr3HEcBPbnR6nfYYxyhYQCJxGDSfO2qkWwTeedeJIcNiQUmlly2BFZTFV?=
 =?us-ascii?Q?P2HPtTLSkHofQ1KHcGNBHF9Swph/MgKnFIs7gBnz01bJb6Sl44nAEMhuowgq?=
 =?us-ascii?Q?44lAv1HFOR66M+atrsTVd8DmjbWeADzA4xxCdJh+mur1Vtja5NKf3s+qe4PA?=
 =?us-ascii?Q?iHamEx8l0itp7BsihnEICQOIg8eNU+gr1eBWFUPS/iWTgfrPVBdKvSHGac9v?=
 =?us-ascii?Q?P8W159yOqnauEWlfQeVp93g0RgthNSgSjMx52//6iqsNpsezT4/2ryZq4vnh?=
 =?us-ascii?Q?yG4G/e2HEGAC4xk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FA5n3BdvfnyYivrFPbXJAbs6MjeiCK9sH5ZwsMgA/4qD3EgMrIp/8IvR16z7?=
 =?us-ascii?Q?MpPcyyywyQmSYTnF/At+EZJi9rcND5HAhjK9hm17dTXTNPNW2ws+w5ELjaUq?=
 =?us-ascii?Q?q2v2FzZZV/BRmo31agtPlFtUmGgA9lfCBH5ZAG11pVloKaZIrDfpOyeTwyEw?=
 =?us-ascii?Q?DFJ3hlLB+oYNrBMj+XMIeX4iMszbbJJW6XTVDwWcNQj3imgdUWsY+rkuGYDT?=
 =?us-ascii?Q?WCm8DH/+iXUqjCX/K1uVwTR7dQaJaSraMP7xdyIG87vimgBTP0QtjsqwTCub?=
 =?us-ascii?Q?T3ij10VZNvm/ieUAh9t6eaQ0fhYf2swwrXbraMS8opatIW1h/B7BWWbnhnUJ?=
 =?us-ascii?Q?1CS/z6WExn9x02UjIhtsJ4raQfxiGx5j5QnuTHX08qo/SqlWhhbUngQNR7mw?=
 =?us-ascii?Q?g/EZgaPfkGL2MTCLXBa4QPExgAdDnNxwzflgFHS07DIPUk3O3/xfEzsiZpbd?=
 =?us-ascii?Q?df3t5gAHc2peCUpoykPY6riMZ8UKI7dYsvLTU4TCQSoRUAx0P/OyxPSDphLb?=
 =?us-ascii?Q?xS/S883uofPLFnO/MA29+r9378Qy3prXsnQ5zYNq/0A3wTuN0TCZvLxxAh1y?=
 =?us-ascii?Q?VEVIz6LtZrZ4myv+020ZbKuPuc/5nbUoyQu/Np1MKgd8v6GDjunY92CktszK?=
 =?us-ascii?Q?OcXTFKREUCgv/auD8VEzIsMGuHWWrkoD/u9Q+OGgjCd1/dT+Dqm+Dp06CsES?=
 =?us-ascii?Q?e9MBKwa8Xr9JIV00fyZp69upsi2bVf29xkp3J1TvdQa3695UByQiud5j1EPn?=
 =?us-ascii?Q?k4eQ+JG8hN4hWjJYQ9/X7AXANPKORiXDAaHmpbf4IudB90Wf4o5T3P/upTy8?=
 =?us-ascii?Q?HwhkdfviR73Yt5OBCvQToN1lOQli1jUFSFy02Cdos7DJZOOsXrGxJPsYjvmN?=
 =?us-ascii?Q?hj5uI4+KItgOiHioR/bimvwOfffWSKGvN5aESbAv1Uqq7LFNVsClsY+H+6I9?=
 =?us-ascii?Q?OOL8TlNCe5g/9U2ZH7eInsnjUcDdHQI8Q4/8sj+sUAV1BzQSrV8nqH3zNQeG?=
 =?us-ascii?Q?toR+O2sj8aqGqdr62j/4wmRi5MGgLxz15jZPufcYEJW041gLOJLn+d4kI9Nj?=
 =?us-ascii?Q?glx/2GBbZMlyzSI3PPt760NUfPVu2tMd5W/jL269i5/7vbx2wOcYA0hkby2J?=
 =?us-ascii?Q?QBI/c7YjX86U9f+Ig1YgKT8/8/xi5rl3FBJUG/NkPSwFfA78cWOozbWTTJZ/?=
 =?us-ascii?Q?ZN+/I9ijns7hBzkPkdvNai5vxTXt+ok6DJN32N+5aY2UIUqv0w0IlwH9ujFo?=
 =?us-ascii?Q?7RYp5oEYhD07XSjpGqP+OsQ7glYYihdpkCzj2W4F87QbyQy9jffrUDNZkVZc?=
 =?us-ascii?Q?pA/rOWrCk7cKMGHbENi/mqRSfKF0VwTePZfgOKIuEDfz6NHBmdfwI8fb8u7y?=
 =?us-ascii?Q?LZ9TiAlIyRBrQFTISbt7RePtbnESIRsSEc1FCxpjIhmppPuTkDAcHXfL5HYm?=
 =?us-ascii?Q?Mno5KWNzO3h7+i2Imc5uhKu8Jr+obDDq1Is9uA/V6evUnxFHnb3ErcvSbqWi?=
 =?us-ascii?Q?LJx8rW92vJRirk2MV+dLI5/Sgj2POWkuV66w9mUwQj6w6tEiY13StC/F25ok?=
 =?us-ascii?Q?OCy8qCWA083Lgzr11pjP+QBxJ4E5jFJN5CJ6C+Ql?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d597c89-22d4-4f4d-e3da-08ddbf5eb645
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 03:06:06.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eik9Wldhq0z1ka3hV1OraEJDyEb54dV2SgZVce36tYdaeqbXAuV1xDzpf0bu1rO1dx70ECBO4nGV6BAuMMt21Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11221
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There is two different cases for getting channel status data:
1. With PHY exists, there is firmware running on M core, the firmware
should fill the channel status to RAM space, driver need to read them
from RAM.
2. Without PHY, the channel status need to be obtained from registers.

Shengjiu Wang (2):
  ASoC: fsl_xcvr: get channel status data when PHY is not exists
  ASoC: fsl_xcvr: get channel status data with firmware exists

 sound/soc/fsl/fsl_xcvr.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

-- 
2.34.1


