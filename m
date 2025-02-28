Return-Path: <linuxppc-dev+bounces-6553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8CA48F47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 04:33:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3v0J24Zpz3btc;
	Fri, 28 Feb 2025 14:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740713536;
	cv=pass; b=Qnv1ESnWf011uJ4wUVEsjrebSIb8T3qCGxGvXt6Vdrvho83DiWdX0HmS1YcOpHuDjH7ecxgypOv0AV7OWCQLNgeUpgCMqIm2OtTza7+mHRJKEO08ZPx+T1sXaB4nO+vwJ7MVprd3oXNgkYZcNtd8uESONcVo4Azp/oh1iizpbf8tMUB1IZJyTZWPOEicAgMli2zi/TJxv4TE2mW/zsM2muvdvkU1LXwihSnuEp1Jn8BTsjuSskn3fk0FV9xSPbp297/OXtkjqBejkJjanUXAKg5O3SLDRLrp8cOdKCZp3oTmrvjBytEWE+MGpLoQUl1WTjvg+YfYe3IY/7WhbAwyIw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740713536; c=relaxed/relaxed;
	bh=Vz0xPUgxEv2VmYCP8Dm5xz29OCp4yeM8XyN0+NmpTis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jQkYs+gc1XzHrOPvJA2RdDUqXnr1Xv1OyB6uxvL6oM+D7LITATsPFCtCOpUygnyrgRw65dPE6G1mm8egTx2HAbtagU43rGdpQmB6HWtgPixg+3KUYQgqRj1gov0XRiec8zYnXRSwq6CykrRA8OSPJNfurmKEIoNo7KyGx3bFoOFEj2WF9i7F7RZxtOwf6qyXBjA25UhCQ3Jb4uDa/xYH1XFG0IlcEmqnw2rJWeqEa8bK7Yy6NEo/XrYQM4IQDhxoDJSArJoIz520PcGsS6IrtddkQje2fy1NmztXf3GUMSPcjGKJnDzHu6lyOeTpzLVUPfV7J75f1Evz8GFaAxysUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fedegiGZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::607; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fedegiGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::607; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3v0H5YJNz3btp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 14:32:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nqn48H1nwZbYSj71N+VJ32l2Mx6/s10QC7xP4aCvNTs1O5DeYLUKFRYNxBVyH2HxpHvIm96ohpxFBjD3xT4DGnRuMDkakDsh8Q3IEfrAdT8mwrl3Wg9aVimFvdVBc9oIv+zmfEaHL/lUTv+gsyLBS+gpLuzzP64xzxnaTGEMDsjgxM6TaWtZF3WuUq31dGj+ImfU/WOJ4euLLOeDB9rBxZZgqI6rgj74PXMnrFQ4bw+kG6RXbtQuGAdt38rVIllQbffCDUL9R53AfhRAbF4qm/zbdE5Iu/x0HAUA6D6SR36eWnlKn6bHlpb1yWjxDT4QvZcm+HRV0yChjqQtD6LsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz0xPUgxEv2VmYCP8Dm5xz29OCp4yeM8XyN0+NmpTis=;
 b=MoN2ygR74C7rZqggF8BNZIxfRyQs9wsW6dSsvX1ggDSD9i3+CiH2fJ9CljFEyS+/zZR8DkQd6/zbzzNvi9taiun1TSY1KC4QPZGFtRqxNwSSWypYLm0gDk7lxHhmLnEqXVfEcUoe3t3u3KJjzD913y4wzr6X1BkmiO+CbSLiPZBeOhLx6leRnrqAkYqlSGRc8/FlK7daETVUEfxSA+QPH9bF+D+mB/ySlsuIScNHXqf9krigFt+MTTckihzscj8CtXIAt3f+Wczf88a90O1McWYF4ISZGxhHtY0Ki4tYXR+Zn2aaw2+sGmvjZGqzakBxjPj8M8YK6u8LPKDxCaRejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz0xPUgxEv2VmYCP8Dm5xz29OCp4yeM8XyN0+NmpTis=;
 b=fedegiGZOad+UK6hWLjarIM3lk4RZ+HkEqTu73JZrdHDtKdNEvablalJGVHdJLxShz33QJXrCKLhgCJq91k5RshHXRY8iw+j6eUF9KfsMNDTTGqqPb+csIu9302/huQnpBaI8l20VB9Le5rAalPD1EsMLNbv27FPq01NrGi+o6gOd7EC1V/LHij8LXW0xzi0LQlou06XCjJQaBiM3FQC/e2sscAF43DWbHRd0fWIamJSlGMm3SvoKoCZT9l3wJPF0jUVd/CSVzvQKQg6pYB98IwTTSEEbLvj8SetX5mXD22lYTdniqsDYT4pQ1+MZhkaCe10CLMue14HJsTgpdF6yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:32:11 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:32:11 +0000
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
Subject: [PATCH v9 10/20] mm/mm_init: Move p2pdma page refcount initialisation to p2pdma
Date: Fri, 28 Feb 2025 14:31:05 +1100
Message-ID: <6aedb0ac2886dcc4503cb705273db5b3863a0b66.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0020.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::18) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: aa179763-44e5-48df-9aa4-08dd57a87c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2PaHrVU7ZGUgVnpFO0LXflvelPa931IPI0PzT44sNY9abZy5WyOQxHld9KzO?=
 =?us-ascii?Q?RoAQJIb2LB6HV1Yh2tpG3drqBwu+2s9El9qvqUP0pXi0ayiG+FixMXWz5Rx6?=
 =?us-ascii?Q?V5EodJsT0F9gpMSgVC8Y8hZVGbeUDdCqzw6HUBqWv/cd/842mEMgyOacZAjB?=
 =?us-ascii?Q?Y0ItlT+RXB8x+SVJ+LDBBcbv/nU/4eVMfLfRpkLpBrVdwn6SPLNLskgG9XVO?=
 =?us-ascii?Q?x0N+RYBx1raY00xTemKJv6iEMtIFEunjEbGc7z0xnm8Gon1oeJqsVQ7hUTbw?=
 =?us-ascii?Q?Sy7y5emoaXttEpVyarJTxPc6PekjXJNxxptiIgAWRSzq8xgqUXV2RhNx+QkZ?=
 =?us-ascii?Q?Z/iT30pLKJsJRLP7LAl4ebvv7UqQkyboCQPW8LM6xZapZ5n7TFy3TJglCgjo?=
 =?us-ascii?Q?CEV1kWXlUlSckDVQfg8WYpI2nuA10iLF6kxuntA3YSk8EFbMXI+TBDwU4hze?=
 =?us-ascii?Q?woIN0QzP8TW/7ObopuG2qNXV9zdgSwGR70Ns8wU2blxJdgWo+djxH/LVZXai?=
 =?us-ascii?Q?G1mDqBwdHJ65tAbAqXeFF2YHnS6e8oSWf0zxEASzpvFIMm2TRjbpkspQarYX?=
 =?us-ascii?Q?Ut0Dg3DemlDCXgiBAm+suIzRpdy2MEj8a4T32XOzVJVzDE+4VY2M4WHyw+4g?=
 =?us-ascii?Q?UFFjyc7d/BaX4Rg1RLhSwvQ54gOQKmPBNKmsEXo5w38Iw7soulVf+j8go1Os?=
 =?us-ascii?Q?hOhxc1Qsr/tehfrHi7PTuuPFQ3vDWI4WIecCG/NbVre3wvbMOAB1oZxhoie9?=
 =?us-ascii?Q?C9iLhyBbHImWabo9lpN87F1qMAl/A3XyxQYsmY+hx5a0oK8JuY/NDTwkEIH8?=
 =?us-ascii?Q?2rS59qrhT7zl149ntJ2EWAokBHP0DEK/rIy6rLoBSFX8Cnm1u66jB6K3G2Jd?=
 =?us-ascii?Q?bkNRJdj3qKjb5ksmG4AVDPOa22psi42O/9LVsCzc9jVV3P/btZVOgZZftmC6?=
 =?us-ascii?Q?TO2P1Om0TDmo4sYA5GZwtJJCgBUPc0Yi8USapYzTzOjKaSXg46/Ld2DjOaS0?=
 =?us-ascii?Q?2z9D4pgnPeDRCNsBwR4o8LeBGFEASQ0SYxx7DpXl9Or9XfjBeesz0oVNsluD?=
 =?us-ascii?Q?8kBzFIBwwIEpJfVt5cxfkULE3RRSDmbei5GDpjuQKpbWhUMtLZK16VKhU6PQ?=
 =?us-ascii?Q?2STMB7dEZ8bX7Bx1dKd8u+2kpgP5oc5NqBAQp4o77EQngYcMso/LNyqkEqju?=
 =?us-ascii?Q?wBbBYmmw+88J1ooAHmNhoAR69EW2noTF6x0DKavwn1+f9IRKNbnwAaZTO9hg?=
 =?us-ascii?Q?EIKI+WwdMK7/fpWkWO0RGOK35SrS8SKLxIz3LKdrx/xqs9y7hMD4DdDN0z5o?=
 =?us-ascii?Q?Ql8GFXPqUdoxa9fQQ6nzvargfmzCg5S8QgPsE+bs8UE7EZFuhIUghZnZsXYt?=
 =?us-ascii?Q?Pfeq2LioF+KQGbUZHxApHWQtbqzz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3P2qb5aEmhhe1WiXfXHFIx6LN+vFHZElkP2MWZefb9STEtABcxNKeeTf0RUc?=
 =?us-ascii?Q?kW+E6xIsGOyjtjzKES5a48HdeROFlrWrqoCxpwEPPUIc5DjV+7NJ9VKFDl+z?=
 =?us-ascii?Q?j4tXPEx/UetW4UXfi3ggVTeZdmp2eIWJ2+tpRFzTJzTh2OEs6aaAuSi1gLS4?=
 =?us-ascii?Q?uMsTr+SZ2GWizQML66wdqeIxSIUDiaObicOj2pcqWBrQottIUmqWJ2Ds7Edl?=
 =?us-ascii?Q?sO+ctHpYxFoH36LTqrY3VJ3IQj/ag+ef2Yi/QqMEkHSWoIn6IhCAa8VZ40V5?=
 =?us-ascii?Q?16NbgX3PVe9yKg7L7NKeQDCAR0Wqj+gxoPrKi5ypjMsT/TfTvCMm8eUUrdyT?=
 =?us-ascii?Q?H0GFPvPMB2clr+ucAXBBsJ7oZuTvILzMp29TQnCGkNRXixEt/yhIxkVyEpE8?=
 =?us-ascii?Q?sEOUWdL8efiSmC/LmZogSiQIn1MAKDEEs9SCtKo7pzOo6TnHWBTtVmIWo7D5?=
 =?us-ascii?Q?q7pxt0DPAoEb0S6nE4r9ogerhiLJR9GNzr3cC7tjRJglCRPPIQ6bsGuc4nEx?=
 =?us-ascii?Q?0xz6gBWHhCvtM1CeCbdc/neTHZoij/ZXut1FuUZ0F8rZJd8aV4uhL7ZEqzLB?=
 =?us-ascii?Q?zE0hFWE3vHeWERUHWG4YQ+21JzGcLjql7S6P87xalmYlf6Ci15pMO/p45F5N?=
 =?us-ascii?Q?PNMBCb4MGtCaTbQVXG1TSGLAggyi65woYEZMysuSCsC28SsXLZmwf9f50UJ+?=
 =?us-ascii?Q?hDLQ8K0gSoEstwqsCyqFPyuyc+i7tVcPRz9jobROKhyEegHKfuGGTsQp1wT1?=
 =?us-ascii?Q?yx/ueegz8YfocdY6eMux9Izbk+PDwqdNPqkNU0fI6pblFnC9zN1JG+CF3u/P?=
 =?us-ascii?Q?dOPburEGzSmt3JpqDnvVjZQjggOlrfUOdd0XIZAxHQ0kXmmgnfkrxnwcRHFe?=
 =?us-ascii?Q?I0OxvoNuBN3OCJ6t2HAIgPM7c1197Yj/S6ne9VFsZL7k9yQBFiJLA/m5CFOp?=
 =?us-ascii?Q?6a5ED0ZoVizfYXfLPMQDMUdPjdCg/0ignGg2GG7AjFTDQKuzkzYsY0zr77T/?=
 =?us-ascii?Q?6gUS6nakVKCKOQ22TZGxDryQCkkxmfKhcAK8loroDDNpWmhqokHgG9Z39IPr?=
 =?us-ascii?Q?IKAdQihzfKVAMGcTryhO+JReDLsO5QT6+Ect3mKEOJ+BgQtg7pOXCkN8Cw+s?=
 =?us-ascii?Q?A1cfbEqZmFRONZ4H/J+AezjSbT5pSXw62HsBZrIp/2YnQsn1FCk9pibRfl6q?=
 =?us-ascii?Q?4FgMRZAIrZvZKh5ZGCmC2zpHyy97QC2qFiOPE7L7HFLFFrZp+3rZRRD4TkQi?=
 =?us-ascii?Q?yS4HU7AA4zIu2pdC5qBpL7qS+TZSd6V3VHzxwUZIuHLTiMY/OrG9ioMUeM8O?=
 =?us-ascii?Q?/WTGpu/A1jsply8fAr9gcfIwZ8HxeqoGJLl6av6qiKjWPcQphUzNYymJsgjP?=
 =?us-ascii?Q?2kf3TLLfLe7qyNnRHU2BWdoYToqmM4/+ae9R8jGIgBOxN/Q/a+i/aSDRgDPl?=
 =?us-ascii?Q?93EhMvUeiC8BXyUaSNDTW9Nh40CDPQUivPd3S+kZZ+p5jRw53OVx4SEI3NA4?=
 =?us-ascii?Q?xaDK8iJ0r3Nchxk/XaDHeQ/h7v9Kp6tAap6VNeJf9Zdtsucvqd2OG8gdX8Qq?=
 =?us-ascii?Q?wVINvirD9A/bxm2dhn4sGA1voEOi0sKE0+6bpujM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa179763-44e5-48df-9aa4-08dd57a87c22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:32:11.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rBgEosXjI87aHKmpk9XebnF/BLjdYPf3y3kC1v7vQJY228rwd2lo6fY0sc9/e/Vnfw6+bJbUbYTp2JspuV/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-Spam-Status: No, score=-0.4 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently ZONE_DEVICE page reference counts are initialised by core
memory management code in __init_zone_device_page() as part of the
memremap() call which driver modules make to obtain ZONE_DEVICE
pages. This initialises page refcounts to 1 before returning them to
the driver.

This was presumably done because it drivers had a reference of sorts
on the page. It also ensured the page could always be mapped with
vm_insert_page() for example and would never get freed (ie. have a
zero refcount), freeing drivers of manipulating page reference counts.

However it complicates figuring out whether or not a page is free from
the mm perspective because it is no longer possible to just look at
the refcount. Instead the page type must be known and if GUP is used a
secondary pgmap reference is also sometimes needed.

To simplify this it is desirable to remove the page reference count
for the driver, so core mm can just use the refcount without having to
account for page type or do other types of tracking. This is possible
because drivers can always assume the page is valid as core kernel
will never offline or remove the struct page.

This means it is now up to drivers to initialise the page refcount as
required. P2PDMA uses vm_insert_page() to map the page, and that
requires a non-zero reference count when initialising the page so set
that when the page is first mapped.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes since v2:

 - Initialise the page refcount for all pages covered by the kaddr
---
 drivers/pci/p2pdma.c | 13 +++++++++++--
 mm/memremap.c        | 17 +++++++++++++----
 mm/mm_init.c         | 22 ++++++++++++++++++----
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 0cb7e0a..04773a8 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -140,13 +140,22 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
 	rcu_read_unlock();
 
 	for (vaddr = vma->vm_start; vaddr < vma->vm_end; vaddr += PAGE_SIZE) {
-		ret = vm_insert_page(vma, vaddr, virt_to_page(kaddr));
+		struct page *page = virt_to_page(kaddr);
+
+		/*
+		 * Initialise the refcount for the freshly allocated page. As
+		 * we have just allocated the page no one else should be
+		 * using it.
+		 */
+		VM_WARN_ON_ONCE_PAGE(!page_ref_count(page), page);
+		set_page_count(page, 1);
+		ret = vm_insert_page(vma, vaddr, page);
 		if (ret) {
 			gen_pool_free(p2pdma->pool, (uintptr_t)kaddr, len);
 			return ret;
 		}
 		percpu_ref_get(ref);
-		put_page(virt_to_page(kaddr));
+		put_page(page);
 		kaddr += PAGE_SIZE;
 		len -= PAGE_SIZE;
 	}
diff --git a/mm/memremap.c b/mm/memremap.c
index 40d4547..07bbe0e 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -488,15 +488,24 @@ void free_zone_device_folio(struct folio *folio)
 	folio->mapping = NULL;
 	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
 
-	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
+	switch (folio->page.pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
+		put_dev_pagemap(folio->page.pgmap);
+		break;
+
+	case MEMORY_DEVICE_FS_DAX:
+	case MEMORY_DEVICE_GENERIC:
 		/*
 		 * Reset the refcount to 1 to prepare for handing out the page
 		 * again.
 		 */
 		folio_set_count(folio, 1);
-	else
-		put_dev_pagemap(folio->page.pgmap);
+		break;
+
+	case MEMORY_DEVICE_PCI_P2PDMA:
+		break;
+	}
 }
 
 void zone_device_page_init(struct page *page)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index c767946..6be9796 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1017,12 +1017,26 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	}
 
 	/*
-	 * ZONE_DEVICE pages are released directly to the driver page allocator
-	 * which will set the page count to 1 when allocating the page.
+	 * ZONE_DEVICE pages other than MEMORY_TYPE_GENERIC and
+	 * MEMORY_TYPE_FS_DAX pages are released directly to the driver page
+	 * allocator which will set the page count to 1 when allocating the
+	 * page.
+	 *
+	 * MEMORY_TYPE_GENERIC and MEMORY_TYPE_FS_DAX pages automatically have
+	 * their refcount reset to one whenever they are freed (ie. after
+	 * their refcount drops to 0).
 	 */
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_COHERENT)
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
+	case MEMORY_DEVICE_PCI_P2PDMA:
 		set_page_count(page, 0);
+		break;
+
+	case MEMORY_DEVICE_FS_DAX:
+	case MEMORY_DEVICE_GENERIC:
+		break;
+	}
 }
 
 /*
-- 
git-series 0.9.1

