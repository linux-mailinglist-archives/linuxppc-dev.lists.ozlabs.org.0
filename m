Return-Path: <linuxppc-dev+bounces-15372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C19CFCD05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:20:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtM1Y8yz2yrX;
	Wed, 07 Jan 2026 20:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777563;
	cv=pass; b=d/iGffm+WspE+Fh8KVx1fPEhcIluOeBFyecwMwUKMmzUMpH45MpKR6wPKs22lyHU4emuiNsDt6l1XjlPjeoWcu1E1bC0ARKkx93aVPDjZlztiWDqNkpx+Ez/hyObfyWGKSMyFdDSJxTm92JkeR4v5TXVE1vmpp3zg5RuLGL+5VaXkCB7sLnkYZDQkfCLBn/s7s7AEG0urPsKY7qeALN6JYtv6TFRsHT/qCUkr/Bio5B/JiDD6oBakPNR/25t/uqSEQePb8VTX90SUcWg7i8JW2Pi1jx7sZvgkRA09yo/8rkMd5hK9g5egWvEIqz7tXtJ3NtYpFH72tvqBjR+NNTo4g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777563; c=relaxed/relaxed;
	bh=LXlf4tCqAJa8yGxE4UzLHrPybH0ghXSvneYVCU8VoD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R0bxywJFc4JLOapc+VL8lxAp+g0kufIr0V3JAapC9mOBR3kJjTh8AZdE6vZwu1tdhl5EUz60UogG5I00L1rUtJaZAbQFDZreM4WUZbZkBpO9qB/fuM5FvA7YF/DDpD1aLojS1TiJFVnm4fpqiY79q2x485GKz0XQTEkoQTvhXhbw5/WHnCw9yz68I8nxXFtKiFkAjdKhe5suJawR9a+zZ3R5d8hBXiknlGxH2px0J41Qt7qKXwDH0IOibv9PTjG3WxySWLOATEorpW18/4LGIRcmBvda5Zg/5uCi4tMPeh0OloUi6/zpLHCvZRVIs4P47zCNxdPnTM+1iX2e+6MYMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Wnrfl7zU; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Wnrfl7zU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtL4rxhz2yqt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWAXa6f/KAQ1b4Tonky5JRaRkXjcol3BPtCA4QvJJ1VSLOAE+5uY7iM+9p/CG3vaIZFGwcP0wjlmTHPkMgrDuI2v8UPPQhCeVXE5VRJdp/xqsJY3YuszVYSS9pDMYLLmPtR3bCHTC2iQBsSuBaDk49+PcceQ//C9y7p5IJSeUZCbAYViErLetC4ccMuQnI68WiSyi7AosKqoU9hMOR7kq2X9fIucC1ZAVWj3Pt8GUn/sqQdU9o/5gd5ST8MGJHoeQxF1RIIO3L5tNByM9wAAwumF9Wh6jrzmJZhSivXLWL+LeajOEOt0JvjQCT6p3mwHS0zh1QRdrKtZR+phn/OP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXlf4tCqAJa8yGxE4UzLHrPybH0ghXSvneYVCU8VoD4=;
 b=hgPv0IIQfNMnR1iiioxYQ+2UNzWZZtkVjUm9Boc1qXB26oYVsDguMOaVQQO0MuiFonWeUDiXeXMJmOEW++ZagsDcfPLfaVtx1yKcEposfSf+b9jzJ9CByU2s57K3hpCumhHaonwaBI6yr7ByACrxiQn3JqqI1HGeAujenloMz6dA7AQqo9CxOONqHBa2YT2b81lLxntwRJUA/Na6M8UjztJHw6WauhyGJR+k+SF3iJYB3EJqPh98DoavbFJiQlGQwxugwT3PZG9T8ZKg8odT0Kpgo924nuVspEitGb7OuanZCUoack0f/Ejkm0Gu89RKYIYh4cXf2AEUKRWSIB8Zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXlf4tCqAJa8yGxE4UzLHrPybH0ghXSvneYVCU8VoD4=;
 b=Wnrfl7zU5E9x1uE2ZL1XQRD1UaWJfstpw2QNKDRwPIWF+NaDH/r62BkWC2g9DpU496pimu2TwHSQsb66NOVIGVFm6NAUPS94LpdNSnYGowHuqx27bpEUv4I08DgN52mJ6aMA4mz8M1FSM0B+72G7nuAin/AG4JJ+C2SlunKpFyvr0Va2oCnk/FZvB9bpkWefMsSf95BhdHKDBE9XgeGW1wYusBR+x1xNHst+RCnu39DdGzzsmrNlQ3y9QgRArQS3MpJsLCAxmEA7nrBVAp9iYsVrZF11ZK8oNcUS0WGk1YWWmshDTZEF1m6oZVZZRHvbfvVNFC6uiyoyXxgSKDZraw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:19:06 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:19:06 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com
Subject: [PATCH v2 09/11] mm/util: Add flag to track device private pages in page snapshots
Date: Wed,  7 Jan 2026 20:18:21 +1100
Message-Id: <20260107091823.68974-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: f236f506-a5df-403a-ebd1-08de4dcdcecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZTQJESdiy4jj44xcSojXZJoi5arAP0HbfwsLS83wdabYJfZyU5wUWvssgviW?=
 =?us-ascii?Q?qh9RAqfIBF8qO2l7wqzWVqw3x4YyyAfX51hGzPM+F1i8eoJWt4gmmkLPO9o3?=
 =?us-ascii?Q?Au4+NlKSCw8BcPgDV2JL/usSgPuxsZzcXROCaXNni9kKHIbRMQH2NYyTLuQh?=
 =?us-ascii?Q?PPvoJghW4zqCHQTu7ZTUUMrzJhTaTIg+79B46ln7ThM3Y4mqvzPnCpvp0F50?=
 =?us-ascii?Q?I2wWZk+YLUup1q6wdouco43k1tSsZ8yyXDT0dyy7sROEeiRaKaEzc2M39oNy?=
 =?us-ascii?Q?ZXRYPtQN2f6rCg+EoGpw8fVQa6s4V6RyuZ/hc414Bl/3ku+NyQP0OvpLPYYk?=
 =?us-ascii?Q?nbYfA8WKn92LOvZERHeJIHfUZGuPBlZD4uLNL0rORCZCVu0PN6PTjNRwa6c+?=
 =?us-ascii?Q?K56DrFdf4FosxpdvGgbx1U8Vb+3jc7aixMIMU++kJXE5kqxHAdSDsepPTI6e?=
 =?us-ascii?Q?rb6PZVi/u2HgKBfsrnYwKMzVAYCRa4O8H+KRQAzcdLpKoM32FXp2e+PF6v7O?=
 =?us-ascii?Q?Wthay8hPLiJquetU+FGcYklLNiRMIRo1aI+AaidxBBSMlUHWmSN3q2g0veAL?=
 =?us-ascii?Q?LPPUOPEIceh0BCHBDFFqEHOIUe4tKwHQ1d0KjoVx1xK57wGWuDBsl3yTvhOK?=
 =?us-ascii?Q?Z1RRxOdNbA6BrLNlWD1l+MVrS3Ctc1wd5m3mrpjTRovQPH3yONhVE+gtmAGJ?=
 =?us-ascii?Q?4CTzQp6pomKEBj+QywlMW6EMeyFYMzaKJktefZKAAkxYD9o7XAMju8V9p4V6?=
 =?us-ascii?Q?KS92Xo9f0FpHjs7zo+r7i5YG55tP94Gn7eusgxunSKS2Slwejc0HawWQHUC5?=
 =?us-ascii?Q?K8bW5JQdBdkvuSomRNztRMEAoX+G9jz9N49suahl3BnaJTTB/dk+ODG4m3Ls?=
 =?us-ascii?Q?pzT6726pvUzD3GiQFwMkinKr1sxGdJbjaxWej0YSMZMw1Ucrrpg2+azzwbVB?=
 =?us-ascii?Q?pG1Jl+hWYgqOsZfOCBGLhqJc/zT9N7ChB1JzNkeZnmH+8GLdnF99D9/QHOkk?=
 =?us-ascii?Q?DFdWUW+OEMRe8JquP9X1F+iTqaqjmz4UvT5VlSPE4OMGfaHeWlX5M8Wr0gIm?=
 =?us-ascii?Q?8X04TUZcRMSUMHYl6YxBS6RpydtX73NvuKpOb223dvNtJG5r5gouwkL35GaJ?=
 =?us-ascii?Q?MRRlqfmCtfaziUCYsCtMX3iSkoaqGmnn5bk9/dkJjtuoSvJHfTW0YSRwFoLv?=
 =?us-ascii?Q?1rS70XqXz+jYglZbbSN8H3YlejXvBVljn6PjUAb9b5uRL/wtW26kH7J/7fWw?=
 =?us-ascii?Q?V+6sAzEZ4eSCrZfrt1wUTtctMDVXXqxDp4hnRvCV8jAhXjox25OMIE+y1H0x?=
 =?us-ascii?Q?6UTXGgATRZxBtCGtLZ8INAwTUDXyArApbM0NMC2kh7wPNYLuhP0c9RF+k9ck?=
 =?us-ascii?Q?pi0Dah9gkFt9jNl1vpOsiOGKbUFnshG5U3wXaiVBsMKFamtK+drvXqXQYuqH?=
 =?us-ascii?Q?xKfp9/mVkylcI7/JXQaIqSlNaxyZm17L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4j7eQiyRbbmd+GlL1fDHDbBR7aZ69S+eocg0CKmaJryGxd7+XxjotOlgsLsy?=
 =?us-ascii?Q?ja3b9IgY4IGUXzaL3omH+dBvWTCCnfhuSz+jrmNCk3U0wQTuys4HETCLmg8r?=
 =?us-ascii?Q?IBmyGHPfAcBG1w06UW6FZF6dlqrlUk1TqUP382xEH6+++qOvz+V2ycqHD2f0?=
 =?us-ascii?Q?8Xfelunv8oWf7FcQiwoMBHVSxx3ybOWTCYxr65EI3vhCQyNoAM55QWDf5JoQ?=
 =?us-ascii?Q?5za0V3RVCaPUy/FXCC/0r6kanCxgslJdwZ+/1DvmVnSYB+7eLxwrx/MwXr8i?=
 =?us-ascii?Q?2OHSHvcwoDqtXjRRNSnpDMJrs9nra6v8sQKdcpxFSRx0AiH+JyUxLKs+wQ44?=
 =?us-ascii?Q?BSs1sZ1zf9uG7DDKwLC6Gp37peLwhopS4EriCCdjp6Rt++iPMaEc57lJoggG?=
 =?us-ascii?Q?857ZUkWbBKF9a/qT6XByAwOQL7xZ5urvg0+KUfn45/4uXmQk8WqTqgwuFpT0?=
 =?us-ascii?Q?fv09u2/lG5Ki2Pa+MkEXbObJgpDbwKic5fg0OMi+NcAoN0k706TPY3oscQGm?=
 =?us-ascii?Q?NY+bOFFKjNX5lZ8LbgZ21Lw9raHWOqrGo1ZzV5odsK1LEzA30URgm5c4yEFY?=
 =?us-ascii?Q?eXGEBBpjroqmF3C6pFV/ESec5m7PtheGvpjK0Msevikov4Nog1YhDKq4a6wc?=
 =?us-ascii?Q?maaCqsYbjQUxlCgmjiOSn1mSF3Sr7cSmbA/JSbHZFhgKGKFcQbME1BJMc6Ye?=
 =?us-ascii?Q?nYCaY1lZesxofOS9ghzmloOuK331FWRHY41IcLVEoorDYHOHkMasdzVhgeso?=
 =?us-ascii?Q?rr4dFhlerZlraUJPulZJJzid5erhQcfNnqA04JJ22b0J1x5acBtSplRFEFb7?=
 =?us-ascii?Q?t9QHoSJ8abgp6swCeKRhOQiOdOuprfx0KEwDFZunpM1HCN8fCEug08QtcQWc?=
 =?us-ascii?Q?VunX28KSzbeHL3xiL0CUrHHfttvKXjWy8GeM/Kd5nUb0DRiRnKViimH9CRq2?=
 =?us-ascii?Q?aEg3bCQ5l00x5VT1fnrWTc8z4Q+R6PsxpqgXVPR/XtK7AFOWUnZgOZK0Koch?=
 =?us-ascii?Q?CuulB0qebdRZkAobLL29lx4BQmancZqsk34HjMnfEc3U9087vbbFSCUm02Y2?=
 =?us-ascii?Q?Rfrm5HS4gLsAsD8HNiaNX6BRhSrcKasLYwofkG0EJcEmUTt9F/P8AIuKeazR?=
 =?us-ascii?Q?M25uYP1FGz1bhp8kr24CUXfQ59tu6V7ZARwswVJOwShjlNwX+tlwYso86RSo?=
 =?us-ascii?Q?EnL4XjzS4o0pq1yz87nNGMAoeNHBCATGCfRnGVwIl7NVaSCNnhUR4pPC5xic?=
 =?us-ascii?Q?d9fjComIH17yD1VER5gB5kt93eAG3QSIpIIr2po9ZdaMIhYfl7NDfkSm/DV2?=
 =?us-ascii?Q?D5v+ejka3dxdzg/OLjP+4XQGCm4e1c+nx+At4CHdi4DbR9erkdxiT6L3P2kc?=
 =?us-ascii?Q?h/1miETlcd8uKLjafiX8PPExJaFfhqeoW6rIus10i4HcBxC0puFovHXDNTTK?=
 =?us-ascii?Q?f/6k3ghgsNULuBMBVQPE9PLUaXnO5Xb4COZVkOTvtUybMynnzXuid4sqU5kG?=
 =?us-ascii?Q?zTMatRx421lizLGOXbYaiDCGmG753xqG1Et+wLbaGvT62B4eIez0l2YLCftY?=
 =?us-ascii?Q?JLsxatHPNzCDw9/N/VeCSMJZg0SOH3hfSCkg/35amj8SkQ5dgUjKkDuNtkmu?=
 =?us-ascii?Q?wAnJTuhlt2SRhO5I+anx9dyM+0/3Nsw0v3F4tIIb96ADhBuxBTrqr9L0xsPg?=
 =?us-ascii?Q?apAqjYNFHCYdadtGA2psWD9ZKTbEzlyWFTmV0uzJFWRCHq3oFkU2x/DqyTO6?=
 =?us-ascii?Q?RBXZ1vjlEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f236f506-a5df-403a-ebd1-08de4dcdcecf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:19:06.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTBAHCxJ8boXTe5WGwETefU0xPa1QESdzbHNj9evtMTUXAyvYPU13QxOpmdX2Fcbde2GvhLGB5W1O8Cn8jyOSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - No change
v2:
  - No change
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index f9b2c2c906cd..adca0e681442 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 15076261d0c2..e65329e1969f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4623,9 +4623,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..65e3f1a97d76 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1


