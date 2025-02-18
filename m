Return-Path: <linuxppc-dev+bounces-6294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F362A39194
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 04:57:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxm1B6bFNz2yJL;
	Tue, 18 Feb 2025 14:56:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739851006;
	cv=pass; b=L5u8el7lUpe7WwQO56fp+pN01xkNfduIDFS3R0005UzbPdzNtPq5JyZ1i8mMFLlLZkjM7Fayje70JfaneS/qGIsnbCbOAp1RUKITLcEXsAvhrrFKi4DtCpzhz4c1TsAw+WUHq6h70YHPCaxMU/bQYuj1/ggdFVlXIyFc5qZ2CUJHpcHLRhx9OiDpLJ3XE5kVSrUaPiWj2nrMsk9itAR8Icmwri4d0UXZrPYHauSW5Shsy2cH9BFoF1PG3SCbyfNrC5U5WoDPfHKs9uw1QQ00NVSSRWgrj3LlUiaSyLZnzaUlPj0zUpZVaH1MvwI3oYuekaDPabBwEF6p+z11LICoLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739851006; c=relaxed/relaxed;
	bh=6feSz4PxPdf/fn8934Sb6xeZDwz13w4MaVyMgVEG/Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0OI15zAVU88td+s0tiFu09d3Ukh3B2oQHAtD1xLgFXSiS6pCQCDa+6ml+fZVKTspbZCAcSQ45YfqHXTqRGQuKWHD7CTHqMGRkJguDQvz7ZaIqr9JmfzuwOgSotgMCcb1I4xHmaggo/KKBPDaNYFhI+BteVlWj/CgoY/lXOeClpdYHPPfJ4qr7mEp/mOh/v/FkSltsazG0gfylObGxtgcEs7Qj9pcR1r9ovGJ33i9JtOiYkonuZjnt3icycLeSaFLQd0NM3g031+GAVD+WRqTC3nVLUseKlTMMek2nabWlTPhA2ZnUCgHiDysUUkKWoTl90MyPNwVPUoCGcWmnvynQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ehiw4r8I; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::60e; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ehiw4r8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::60e; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxm1B30fKz305m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 14:56:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RitzNXshhfCEVhaA5stjGX7BCizRCsTtOtHQzGMB90eKsNsmPLUB5QXeH59lVWkxFHYsAOYKxIZb6d8ZDS/lJQ+on7OUvJWiVXOHgvIn5A43A40c69HXRuRRH+Z+eSRDWObLxVqEoNaXYLU/zSJFTmDjXKUDEIKmc403qstd9mvASHGMZVpcAaTBeayNBN0ZLiDN2QFIii4WvQCpS1+jylVai2Ae6z6Nr/RyxDxhqZrLt71esYL57PLRztbdHA5ZGJgU2sYApkkjOG7jNRReQxFQOp6T0r/YfBCTKN08Paq/w9us4McjJ4xdqczOClorNs0w/C8gF20U1Fy00e2E4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6feSz4PxPdf/fn8934Sb6xeZDwz13w4MaVyMgVEG/Hg=;
 b=uJ47Bh1YZJnnQsBqZmR/oSUj2LvqfH8cspDv2hzF72Ju6q8PEgHqqfPAu7s/WmLhGVCreldSELrOMOlsU0KCt2gGaLwYkvPph8WBnGf6+B8xM0/xmT04uoRP7n5z8izjT2cO7GrGiXTtwSh/hwjLYGAiWt9D5I462IoPJQXkrvzIRRKWgC6oB/btgaiYBmFV5C/+b6MTSQysupJmfAE5c3Iwrkc3Sx0TGxSHMCIqNIkY/QRWLdS0qVwmOogliovwo4CKfMvmtiuGHNtgGlmylw9wwzP36K6gy6pPB1qsQ+hJRD1xdoJ/wL46Lam5ad8NFvycirDijTaXkwGxoEkB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6feSz4PxPdf/fn8934Sb6xeZDwz13w4MaVyMgVEG/Hg=;
 b=Ehiw4r8IzLen//p6FXEmB0q/NcCgQ6JQpEArS45pZx+PjlwSYqUOMUOB+nnZe3nn5/pCltliKEV9Rc7RAnzDOQ94yxaIKVuVfqVPd34nObeNicHUjfjAWaDQVSXAT53m1KzExyXAQYeDqDwUVi1rNvFEnjJBYo1czcRG1bM1/qKvXR/wU+3tXB9PqIB7JnFDljRjaqtbzO4CtT864jjU53t4ck6FiT8H7YJFLKoonzwXF18amfYMI/btBiNvnjql+T+oGlmAPdlJSBainxnULMH5CNrTOSaDRQdN80BZ3wX4oClDZrrgJgHDbWg8+UKu/W0XfIieH8ONb0uPlYU8zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 03:56:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 03:56:31 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v8 08/20] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping flag
Date: Tue, 18 Feb 2025 14:55:24 +1100
Message-ID: <c22f699202db0acee2f7039eb026e68261ce42d6.1739850794.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
References: <cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0029.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1ff::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: b27e0df2-fbbd-45ee-1d2c-08dd4fd03a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oozJY6UjbChj8GyUl/gGKrV1lEitBwhl1nK0GfHQ7w93KNVig6bS5EpFd3UB?=
 =?us-ascii?Q?xqraHHvT1n9dzIiU8duuTawyCdYU1D+vvOmgVYIhsW4eRd6XGZwFIeyOLBeL?=
 =?us-ascii?Q?JHBM2l20LS9fUqimZlNhANqe732nA/KbhGzrb1SZij4Xru3FDXjsKWUhMh+w?=
 =?us-ascii?Q?UsPHKnc8b+3KaQD5tBpdE/rASJoGK9DJABmaRZjtfOZqjYeYXulsBWAfM4ig?=
 =?us-ascii?Q?BinQHsAF7RagmfBRIK2r9o3RcRpfVIksS1TtY8/QnHfDQ6skofuR+BfLkL22?=
 =?us-ascii?Q?2TOlecEHWN91dT3RIf0SKRV9r5VQ2TfVkNw/PLCx0kSE6jS0o/iFMdyGyA2a?=
 =?us-ascii?Q?w7lvVyzjlWLIKs1ZUHfjoeJFAIpzSZolpuLmSkuB2tmPK5vAaqq/K9dHWhDr?=
 =?us-ascii?Q?x+ZXWwSxUMReYDMzEq9rzaP40JQQkpwrkKofRkPDmnVMMuln+PbbIL0sf6vS?=
 =?us-ascii?Q?rV9YtmWkllyqzXumQqG543p291KeRbJpkWBcymSn9RHRCCE42eO24JeWW/kL?=
 =?us-ascii?Q?9Zn/BTXAR3sboxXCBAPRp8QKhRnNHNW0PZbJmh0l0CoU/0EH2jVk55wTWNHY?=
 =?us-ascii?Q?Ao0J0CKS16EYdYvdlk8wuiiPt888b/hiVGFdrJzz9WsigAKkZvg3THQ3R+Ca?=
 =?us-ascii?Q?ySXB1YoxVDWWeq9rLnN2kFfHIfpJyb8AtJMxfN9C3Bv51RJF16Chse1JSoRC?=
 =?us-ascii?Q?/GODKf9DJialELnyemwUgxLuXACx0n4ECePvc6bQGD0G5UO+FvFQTHSvD+JH?=
 =?us-ascii?Q?sBnH1WIhD2MTrHVCeI44LgaOtpMSyT3G8ptDNZ8zDG0wagmaJsu1oVWqJdiY?=
 =?us-ascii?Q?QJGQV6M4CmGXFUZQT937drS9xbbNLD8GWIGEc2RpnfSquJj9RLKdkc713w+l?=
 =?us-ascii?Q?yLyTRxo4piWOs+401JEmrtMLFzUTujLvXG3mVN9baWbOPDYkkb0qMShqNjJl?=
 =?us-ascii?Q?i17L6okGzzyeLto09mFZ0/yBu0qUHlh3vPKBLEaDluaFJQRcTDK/DL5/tnTN?=
 =?us-ascii?Q?HtEUevYAl9LoYuS+mZnBn2cXuM3mGw52WSxoC2qzCuzLH0v7b9sYrnwyLocT?=
 =?us-ascii?Q?XO3gRBNS/48maM8F1XxoW45LhroiL9cs/SKoGTY+7ScmHFWyaW81rk1lV/5E?=
 =?us-ascii?Q?2iJKYBUGmEOr28K/Xs7Yu42MayHBjz4xvYxRiSYLAts0xpiOPZCUgRxOoy89?=
 =?us-ascii?Q?l96fCtY6iPMShVMg9UyYHuxRQsloWgMvbjUIPt8BjOHIo8NTenlblt9a8PAv?=
 =?us-ascii?Q?ozXtUjkvRDFSpIfFmyDyvkyUMyIV4PCdxQwyXk9bdtdrTZisSUex0Jbnsv+r?=
 =?us-ascii?Q?eps4JyuLkMuz0cv3TjANT6ZhjygfhXSroRBFb10NNktphOf679k3lFc9TSLE?=
 =?us-ascii?Q?Yibd3bvFNnIaanRmUC7yOJIOea56?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oicZviru2uvVg5GfRYgqHhbaVR6/ndrY3fN0m9TLUyvO9jGf5CEWmIoc+shJ?=
 =?us-ascii?Q?p9N7TEVmg1f4P03CfC5b4JbnFJNY98dpkte9g0kordvnBSMIaetX+AydR28/?=
 =?us-ascii?Q?kUMznGsmUJ/4d8eEl0yisXwt/B6aUR3TeZwPOEVRLWCr8Xw+0YVkddn5HAbD?=
 =?us-ascii?Q?GOLguLmgmFpWIsAqmbiWQFvCD08AoREGtwtdCbW/7j3jFAq0C53vEExuTlKH?=
 =?us-ascii?Q?M7Rql3XAuiag8qRL5tO/sCrv81nAJjykYX3UMIn8TFpEGLzvS5ZchuYTIhwD?=
 =?us-ascii?Q?qT+pqwiUt9fwyDmwW++OGtwHWEWGLL/LjC5vLw6M+GCrdvt+oiSvpf+HamoV?=
 =?us-ascii?Q?u8b4q5b1iJJ8O6oJn5H9F2mMYnq+KwCyJ/fHLVI+sMiQWdLnfq/gPV6Lnl7I?=
 =?us-ascii?Q?LbBoMAVAS+oF3hB0ArZyLBcu8tpKE+QWvdz6pllOWGhWSu/LbNmLQS9hfxOF?=
 =?us-ascii?Q?ixXy0vqAtut/z3ngysc7zRsFjJhYDXnMM4MVg4Mh25Q2pX1jukTuFZWfD5S8?=
 =?us-ascii?Q?ImjciOhP+5R5HK3yKNQYcjo37PKyXfA641IaLKkrQfIypMU50Cc7jj/UBGpe?=
 =?us-ascii?Q?IjPxitHs5sztF7438Z56zm4U7r7aLafq9WOXvqALAY25Rw0WDLQyncdTD2QG?=
 =?us-ascii?Q?zJ4xwsh0oHmO/lhu1kPBvuVw7Xc7itvlcy/NT9SJ8UCZ5zJtlrCSPp3GeTmm?=
 =?us-ascii?Q?hyK+ilYeeBTiC04jJ0WDRdvqTyorcQD32B3dtLUYhM6rPstHmyLRb4Z04YOM?=
 =?us-ascii?Q?Njnnfh/4VBjJRnVXCUMJc3WbS+dVgEtdNcN8E2uyC56mN0yBbfyWry50ZikQ?=
 =?us-ascii?Q?3lVR2uyyv7iwLKCMCnVKGCQcNLdzp1fQ4q7c580swP49+7KDzQfuYGq3VvmN?=
 =?us-ascii?Q?BY7R5/E0Zvi5bbE8DfRdtQMathiDk/0shiL25bGNoWSya/eJLmyn+ADWY7WY?=
 =?us-ascii?Q?OFjpykSljolQF8k1cgBK4ez0XNRcRPMCUjmf/DptznFRsuLYc0BjMAKvserU?=
 =?us-ascii?Q?YKYYXWmBeINpQgHzTVqGYgFrXC1+vvCgpdLBs7+qQbx51s5r+YSPzrDtk4Zh?=
 =?us-ascii?Q?1y90umCvF5mg2tXRWVBs4HS8Rxo8ug3SWSCLfP6hhcvqrco6CF+p5sbeWWyX?=
 =?us-ascii?Q?QNO4WveWrJhu9keQ1em+EuUhGGJm/b0ebfYwDHCJbCyl3S6OVJPns9RGwCxv?=
 =?us-ascii?Q?SjxNAWKBdpWSWulQ+cZ8dguOtUgM/e+ZdeSr0w7NvVb4jcKE2w+X6Mdag3BJ?=
 =?us-ascii?Q?DQ8L5RxWy2x5Tf860g6MiKzLSLrbY14IZgm+0HG+R4bUc4bFZUHIkm8vwQpV?=
 =?us-ascii?Q?ooBQ0ty14GmY4Pan25LQOPaMTGmywJc9lpQ1tWxdqGkxIcu+mJnGy4KZUpTJ?=
 =?us-ascii?Q?08cDBtJ0vGlz5x3cYwVJveCEccRIy5uHpoU9acqsYkZ1Q+BN4Srnlb1Gxvn+?=
 =?us-ascii?Q?xuxlFgmJhfiUZmwTe5m1J544Wx30gg3qRPLwtRBUWtulRq8LYt9fmE/01f0M?=
 =?us-ascii?Q?OS2V5OQF44Kp2SzNoSHuskdh2RvLKeUS5NMrl8NriahTbIdXu6qYHvZuUbJT?=
 =?us-ascii?Q?gT9VOVSqS9JODr3iC5geeQpnNETeDWYBwSJ2vl5W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27e0df2-fbbd-45ee-1d2c-08dd4fd03a7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 03:56:31.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhT4kX/WSDf9aLdHpDQP6OMvehmk6pO5s00XNAgMWoQM6g3yf8sbhCXbgLq75Q7SEGuselEhSFm+ju88xRrNfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The page ->mapping pointer can have magic values like
PAGE_MAPPING_DAX_SHARED and PAGE_MAPPING_ANON for page owner specific
usage. Currently PAGE_MAPPING_DAX_SHARED and PAGE_MAPPING_ANON alias to the
same value. This isn't a problem because FS DAX pages are never seen by the
anonymous mapping code and vice versa.

However a future change will make FS DAX pages more like normal pages, so
folio_test_anon() must not return true for a FS DAX page.

We could explicitly test for a FS DAX page in folio_test_anon(),
etc. however the PAGE_MAPPING_DAX_SHARED flag isn't actually
needed. Instead we can use the page->mapping field to implicitly track the
first mapping of a page. If page->mapping is non-NULL it implies the page
is associated with a single mapping at page->index. If the page is
associated with a second mapping clear page->mapping and set page->share to
1.

This is possible because a shared mapping implies the file-system
implements dax_holder_operations which makes the ->mapping and ->index,
which is a union with ->share, unused.

The page is considered shared when page->mapping == NULL and
page->share > 0 or page->mapping != NULL, implying it is present in at
least one address space. This also makes it easier for a future change to
detect when a page is first mapped into an address space which requires
special handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v8:

 - Rebased on mm-unstable which includes Matthew Wilcox's "dax: use
   folios more widely within DAX"

Changes for v7:

 - Fix for checking when creating a shared mapping in dax_associate_entry.
 - Remove dax_page_share_get().
 - Add dax_page_make_shared().
---
 fs/dax.c                   | 55 +++++++++++++++++++++++----------------
 include/linux/page-flags.h |  6 +----
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index bc538ba..6674540 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -351,27 +351,40 @@ static unsigned long dax_end_pfn(void *entry)
 	for (pfn = dax_to_pfn(entry); \
 			pfn < dax_end_pfn(entry); pfn++)
 
+/*
+ * A DAX folio is considered shared if it has no mapping set and ->share (which
+ * shares the ->index field) is non-zero. Note this may return false even if the
+ * page is shared between multiple files but has not yet actually been mapped
+ * into multiple address spaces.
+ */
 static inline bool dax_folio_is_shared(struct folio *folio)
 {
-	return folio->mapping == PAGE_MAPPING_DAX_SHARED;
+	return !folio->mapping && folio->page.share;
 }
 
 /*
- * Set the folio->mapping with PAGE_MAPPING_DAX_SHARED flag, increase the
- * refcount.
+ * When it is called by dax_insert_entry(), the shared flag will indicate
+ * whether this entry is shared by multiple files. If the page has not
+ * previously been associated with any mappings the ->mapping and ->index
+ * fields will be set. If it has already been associated with a mapping
+ * the mapping will be cleared and the share count set. It's then up to
+ * reverse map users like memory_failure() to call back into the filesystem to
+ * recover ->mapping and ->index information. For example by implementing
+ * dax_holder_operations.
  */
-static inline void dax_folio_share_get(struct folio *folio)
+static void dax_folio_make_shared(struct folio *folio)
 {
-	if (folio->mapping != PAGE_MAPPING_DAX_SHARED) {
-		/*
-		 * Reset the index if the page was already mapped
-		 * regularly before.
-		 */
-		if (folio->mapping)
-			folio->page.share = 1;
-		folio->mapping = PAGE_MAPPING_DAX_SHARED;
-	}
-	folio->page.share++;
+	/*
+	 * folio is not currently shared so mark it as shared by clearing
+	 * folio->mapping.
+	 */
+	folio->mapping = NULL;
+
+	/*
+	 * folio has previously been mapped into one address space so set the
+	 * share count.
+	 */
+	folio->page.share = 1;
 }
 
 static inline unsigned long dax_folio_share_put(struct folio *folio)
@@ -379,12 +392,6 @@ static inline unsigned long dax_folio_share_put(struct folio *folio)
 	return --folio->page.share;
 }
 
-/*
- * When it is called in dax_insert_entry(), the shared flag will indicate
- * that whether this entry is shared by multiple files.  If so, set
- * the folio->mapping PAGE_MAPPING_DAX_SHARED, and use page->share
- * as refcount.
- */
 static void dax_associate_entry(void *entry, struct address_space *mapping,
 		struct vm_area_struct *vma, unsigned long address, bool shared)
 {
@@ -398,8 +405,12 @@ static void dax_associate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct folio *folio = pfn_folio(pfn);
 
-		if (shared) {
-			dax_folio_share_get(folio);
+		if (shared && (folio->mapping || folio->page.share)) {
+			if (folio->mapping)
+				dax_folio_make_shared(folio);
+
+			WARN_ON_ONCE(!folio->page.share);
+			folio->page.share++;
 		} else {
 			WARN_ON_ONCE(folio->mapping);
 			folio->mapping = mapping;
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 3f6a64f..30fe3eb 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -710,12 +710,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 
-/*
- * Different with flags above, this flag is used only for fsdax mode.  It
- * indicates that this page->mapping is now under reflink case.
- */
-#define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
-
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-- 
git-series 0.9.1

