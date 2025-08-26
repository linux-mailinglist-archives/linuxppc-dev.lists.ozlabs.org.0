Return-Path: <linuxppc-dev+bounces-11277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3CAB352A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vSz44ZXz3dBZ;
	Tue, 26 Aug 2025 14:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::61d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181699;
	cv=pass; b=Ug71KPGw/vJrcBCTA5JgJqn1ppUiOiigXBNob7rhdYS3G7q1NSza5nskl7x0Drt7FvwJldvP/0yOqbtqgTQkpo0q+JGqf1AuJqNt2C8lc8bvNi0sPR0MLh7+kAmf7+9jkbM4CR8wFvNxtC8+0yepftmYS0oO2n4ox9j6e4OJOjpxCEueVRvUXCW2vcsZfmk8AdyQlBVZWkvf0lSlYcdDOKJXNMw31gWZk7MU/73AGEASB+73O0PpLUSvKASL5zjdxMGUaegL+t2rqS1i9ZC210TN4rSRpS4nhuAlPFDYEY+uSM49dJFLEBaiHaPfMCHuvaGPgqIVK+P6jfnSFD6adA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181699; c=relaxed/relaxed;
	bh=wXS8hBE21YSUyENkKZmF6OaDotX7yQR55AvFTIUEvOY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cydL261VbeTNj1K4h3YQn0Z15Mou8fzAYFrVnfbl0l+A/qfwkyvcu2zdyB56Xn9xMhpPS3i34cNUio+xqw1tJxahUIjUKaijWTGQvVEL3jOsYRTgs9Mvn9gvGubPp7A2uB4yU7I3RlXZbLVMuaz/DN4S3J9iLde1eIka3Losq4B2aQ0ELeQklvAhMTFdlEBprbwlIguztnLrQJ8VGw/b9OtlYPPvWewya3EyVYArx9wDBWuwd/RUQtMHirZJt6mg/f3qWESK1HURDmK5iumvipWUW0CeCjFF/wa25+qZvbo30i5Qm1M3XsuywfiKi04jKth7u4yULSDrcV8smR136w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EpXg6T+y; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::61d; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EpXg6T+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2406::61d; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vSy56h9z3dBX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:14:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1akbWaBMDm+f3Df7wxTkjTaKyv7Vp2AELArHIoJ7SOAPg2bJKq+5GuMc27jBlagSaVwdJvdtCYj1HGXdUAEOhaSQUFDoDLZZSLsQer3axsTStPlgL9l1X00CfTDO6iJuFrlZcLqZkMREZw2Iv8kqZr22tb6FBjWKo6mz3ZEtl+vlAayN0OvMxGoERoaJhmhOyxCPB803mewEIb32SbTZO3HYATjUFwWb1BeDh9WHQvJS1crPJxwFgVvFh+ZTeQF12hb111adB2s7WKPzkSCBBW7BIEix892j29wUtpYPIg+d2tEXt4/AMj81OwtNmgJO+dRT47I+A7rTUexdj+Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXS8hBE21YSUyENkKZmF6OaDotX7yQR55AvFTIUEvOY=;
 b=brp9mKQ5Jxl/fxfeSIUku/7Z8jP4WTsC1O8JuUW0d3Jx/s1IZu+9GdCiuZqS6jl5QLgVCy7CewShCerzIsFVd1CGZrGaDY0UytvwbkIi2lH+4WsbFFgRlNuX2ktZ+YDY7uJ1rvNLIDxkEjBMWFFchNlIwEjM2JNJtMQ2xVn0SiKAUF5GCZEIH7M1MwQSRjPn0WCx0GGG36SI0T/9GE2pWDnxgMYI1zR3Ddn9xEARTYbgmiT1gZzQt/7JfNOFIQP3cVgDCG4NmTpJm7/yUsqLVpA8Mc8eYC5Yho1Y5ARdg/4qnUycUveT6yjfkpp0IEi/aB7ZuR2F/w1sXnQEcMzihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXS8hBE21YSUyENkKZmF6OaDotX7yQR55AvFTIUEvOY=;
 b=EpXg6T+ysN0Ncg8KtaydeE288R1uvHOKUR6lXvZztJuRI+IhIsS5vTIBC6jAHvgWWCGNeAa/9nu2W44T0Q2rTlvGkdB9eba0FbB/Mv6dLbpD85h1FzK0OaHVGshBoWZMExx7EOa9ot2gWKIU9z59voj2VKDS1xChjX94fd66Yi4=
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:14:35 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::28) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 04:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:14:35 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:14:18 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, <thomas.weissschuh@linutronix.de>, Li Chen
	<chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>, Mete Durlu
	<meted@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, "Easwar
 Hariharan" <easwar.hariharan@linux.microsoft.com>, Guo Weikang
	<guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
	<patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: [PATCH v7 1/8] sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
Date: Tue, 26 Aug 2025 04:13:12 +0000
Message-ID: <20250826041319.1284-2-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826041319.1284-1-kprateek.nayak@amd.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: b72068d9-00d1-45f7-766e-08dde45710e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQu69FlEnjRyGp1FXz6UdNT2brBwSFeKUdn7Y/YXjgCLVamKan86h8rrsqGJ?=
 =?us-ascii?Q?Rt3ATwUmBcKrtvxhoOfxSULsmhqKYXZtalLKKvQYQdAfpdVnOB6kPLDWY44P?=
 =?us-ascii?Q?3Qky7q+bHqkV07eKglEzNF85oM6g7H4AkN/dyhPahhFCOHElPrkmRvo2z06m?=
 =?us-ascii?Q?2WcafHoTEBro8Nx1RNgQFOrTMTqLn6k6wn5c+Hu1jP9nNPUCXOPAmiKqT0Wn?=
 =?us-ascii?Q?ShQids+TZF52p3MLsg9vooWya72ZoYsqSEJPm+zuL23/LLmnQcTP9GIWSa4S?=
 =?us-ascii?Q?LYlS6i7NBlojj8qJK/3h54oiJhtF52OjggNf7wKpjV4cnel0EcMqtLH00mbB?=
 =?us-ascii?Q?WAw96Mz8mWtJPzTz4sFbYgzNVxfcs0fYf0D75HUreDwMJ/BH2JxFiaJt5PqG?=
 =?us-ascii?Q?xX6p12gUkelbrw0OayPReQfEtz0/zEy0bKNhuoVGL4/Bx1MytnBKc1LSLcF1?=
 =?us-ascii?Q?e3tWfNWALXwG5fFD3aIkWFjlW93UF4hqSAYnRJVGsJWX/zx+I1g58IhqnHrM?=
 =?us-ascii?Q?qXJuEn2jjnNfDdttPhrcxfSTKd9xdSk+UC3FNXbsKu1vXqUxYkEpeJfF4Qys?=
 =?us-ascii?Q?4ZQWzksrh6RKz2odGUsT08RnCGDD6p91QbpwOznhoW6czmX6rMgduNTf5DDH?=
 =?us-ascii?Q?1xT6oKlXvhMMHKcgU06dg7M88fI5thzEw5HLeoBHZ+TTHSFrlvDRopoXBBw8?=
 =?us-ascii?Q?wO33zQhis4hAKBmYX3Hjl4wElJ970pRTlpb7Jore3gTCZZW8qCwMNLrH1Nmg?=
 =?us-ascii?Q?jZ2xf81aobNLr7o8e7tNFt8nCoYm2TF6Xzkm9GGo8KCLq0TBfkKxeRj7k06+?=
 =?us-ascii?Q?IiY+CxFOdZ0nSoF//j+Dw98q00rlk/kXuHBfQOnD6uxV+ltA0M3qA5OqqPMv?=
 =?us-ascii?Q?XrKy5lJZtuiivLrYP6rZEU4XU7VIrchGXJ2Ee9scD5KUDdSKzV4sTzsVFw4A?=
 =?us-ascii?Q?yEACTsGur8Pil1tS/ad5FyJU+cWtj+7bqzjya2es7LXBvvukg/qlWlHKa4n/?=
 =?us-ascii?Q?d7Vb/ZM1Y8IpriTLlzfBf40T+4x3/AhO17/YKDn11CYgNf2PNsXqZanUODVZ?=
 =?us-ascii?Q?6YzjfZkh7CVaoxh0Cd2bFnkllFqWct+O4iVdisXyLhmBZvm9YCkkFUgyEvYM?=
 =?us-ascii?Q?sdrP42yol1BdzPZNnAVdjkWPoqku5kznq4rKOWFxBM/eS99YAtqRlXOUlqoT?=
 =?us-ascii?Q?v+FY6Sdq7Cq8jcd71W1R+zBsrZWfWJ8tzueHiDTYxFm9hvb8KwqvimD3X/OC?=
 =?us-ascii?Q?HaKRtOBno/u9xEtPFLInyv1Z+qQsH+ZnsmutYRyd7k5Z/ZN2qfpL2X3YKTxy?=
 =?us-ascii?Q?THpE1S9MDkGlEAWqXExVVmcu/X1XABinkd7jM/h1tU1pqAlMuh6GUNQAivWt?=
 =?us-ascii?Q?J/CqWWZ2VqxWbRR6M/EhW1aQD3hW1rpi14sa1M10Uhz9snjv/y6aUJzfWI59?=
 =?us-ascii?Q?9Bl7VUWrmmxs0SIkrtt437owkGNFHLkTEJgCS1Leht1AZkyl5/AGZCnfQhrf?=
 =?us-ascii?Q?h2CDV2ZDVCxffadw85ORTJN+OV1vIQvuc2yZdHsMTYY9vSi6R+6G875KleWV?=
 =?us-ascii?Q?gl62j5D69T3QTxcECy8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:14:35.2491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72068d9-00d1-45f7-766e-08dde45710e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Peter Zijlstra <peterz@infradead.org>

Leon [1] and Vinicius [2] noted a topology_span_sane() warning during
their testing starting from v6.16-rc1. Debug that followed pointed to
the tl->mask() for the NODE domain being incorrectly resolved to that of
the highest NUMA domain.

tl->mask() for NODE is set to the sd_numa_mask() which depends on the
global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
set to the "tl->numa_level" during tl traversal in build_sched_domains()
calling sd_init() but was not reset before topology_span_sane().

Since "tl->numa_level" still reflected the old value from
build_sched_domains(), topology_span_sane() for the NODE domain trips
when the span of the last NUMA domain overlaps.

Instead of replicating the "sched_domains_curr_level" hack, get rid of
it entirely and instead, pass the entire "sched_domain_topology_level"
object to tl->cpumask() function to prevent such mishap in the future.

sd_numa_mask() now directly references "tl->numa_level" instead of
relying on the global "sched_domains_curr_level" hack to index into
sched_domains_numa_masks[].

The original warning was reproducible on the following NUMA topology
reported by Leon:

    $ sudo numactl -H
    available: 5 nodes (0-4)
    node 0 cpus: 0 1
    node 0 size: 2927 MB
    node 0 free: 1603 MB
    node 1 cpus: 2 3
    node 1 size: 3023 MB
    node 1 free: 3008 MB
    node 2 cpus: 4 5
    node 2 size: 3023 MB
    node 2 free: 3007 MB
    node 3 cpus: 6 7
    node 3 size: 3023 MB
    node 3 free: 3002 MB
    node 4 cpus: 8 9
    node 4 size: 3022 MB
    node 4 free: 2718 MB
    node distances:
    node   0   1   2   3   4
      0:  10  39  38  37  36
      1:  39  10  38  37  36
      2:  38  38  10  37  36
      3:  37  37  37  10  36
      4:  36  36  36  36  10

The above topology can be mimicked using the following QEMU cmd that was
used to reproduce the warning and test the fix:

     sudo qemu-system-x86_64 -enable-kvm -cpu host \
     -m 20G -smp cpus=10,sockets=10 -machine q35 \
     -object memory-backend-ram,size=4G,id=m0 \
     -object memory-backend-ram,size=4G,id=m1 \
     -object memory-backend-ram,size=4G,id=m2 \
     -object memory-backend-ram,size=4G,id=m3 \
     -object memory-backend-ram,size=4G,id=m4 \
     -numa node,cpus=0-1,memdev=m0,nodeid=0 \
     -numa node,cpus=2-3,memdev=m1,nodeid=1 \
     -numa node,cpus=4-5,memdev=m2,nodeid=2 \
     -numa node,cpus=6-7,memdev=m3,nodeid=3 \
     -numa node,cpus=8-9,memdev=m4,nodeid=4 \
     -numa dist,src=0,dst=1,val=39 \
     -numa dist,src=0,dst=2,val=38 \
     -numa dist,src=0,dst=3,val=37 \
     -numa dist,src=0,dst=4,val=36 \
     -numa dist,src=1,dst=0,val=39 \
     -numa dist,src=1,dst=2,val=38 \
     -numa dist,src=1,dst=3,val=37 \
     -numa dist,src=1,dst=4,val=36 \
     -numa dist,src=2,dst=0,val=38 \
     -numa dist,src=2,dst=1,val=38 \
     -numa dist,src=2,dst=3,val=37 \
     -numa dist,src=2,dst=4,val=36 \
     -numa dist,src=3,dst=0,val=37 \
     -numa dist,src=3,dst=1,val=37 \
     -numa dist,src=3,dst=2,val=37 \
     -numa dist,src=3,dst=4,val=36 \
     -numa dist,src=4,dst=0,val=36 \
     -numa dist,src=4,dst=1,val=36 \
     -numa dist,src=4,dst=2,val=36 \
     -numa dist,src=4,dst=3,val=36 \
     ...

  [ prateek: Fixed build issues on s390 and ppc, put everything behind
    the respective CONFIG_SCHED_* ]

Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/ [1]
Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
Link: https://lore.kernel.org/lkml/a3de98387abad28592e6ab591f3ff6107fe01dc1.1755893468.git.tim.c.chen@linux.intel.com/ [2]
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c      | 26 +++++++++++-----
 arch/s390/kernel/topology.c    | 20 +++++++++----
 arch/x86/kernel/smpboot.c      | 30 ++++++++++++++++---
 include/linux/sched/topology.h |  4 ++-
 include/linux/topology.h       |  2 +-
 kernel/sched/topology.c        | 54 ++++++++++++++++++++++------------
 6 files changed, 99 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index f59e4b9cc207..862f50c09539 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1028,16 +1028,21 @@ static int powerpc_shared_proc_flags(void)
  * We can't just pass cpu_l2_cache_mask() directly because
  * returns a non-const pointer and the compiler barfs on that.
  */
-static const struct cpumask *shared_cache_mask(int cpu)
+static const struct cpumask *shared_cache_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return per_cpu(cpu_l2_cache_map, cpu);
 }
 
 #ifdef CONFIG_SCHED_SMT
-static const struct cpumask *smallcore_smt_mask(int cpu)
+static const struct cpumask *smallcore_smt_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_smallcore_mask(cpu);
 }
+
+static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_smt_mask(cpu);
+}
 #endif
 
 static struct cpumask *cpu_coregroup_mask(int cpu)
@@ -1054,11 +1059,16 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
-static const struct cpumask *cpu_mc_mask(int cpu)
+static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_coregroup_mask(cpu);
 }
 
+static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 static int __init init_big_cores(void)
 {
 	int cpu;
@@ -1448,7 +1458,7 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
 		return false;
 	}
 
-	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
+	cpumask_and(*mask, cpu_online_mask, cpu_node_mask(cpu));
 
 	/* Update l2-cache mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
@@ -1538,7 +1548,7 @@ static void update_coregroup_mask(int cpu, cpumask_var_t *mask)
 		return;
 	}
 
-	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
+	cpumask_and(*mask, cpu_online_mask, cpu_node_mask(cpu));
 
 	/* Update coregroup mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
@@ -1601,7 +1611,7 @@ static void add_cpu_to_masks(int cpu)
 
 	/* If chip_id is -1; limit the cpu_core_mask to within PKG */
 	if (chip_id == -1)
-		cpumask_and(mask, mask, cpu_cpu_mask(cpu));
+		cpumask_and(mask, mask, cpu_node_mask(cpu));
 
 	for_each_cpu(i, mask) {
 		if (chip_id == cpu_to_chip_id(i)) {
@@ -1703,7 +1713,7 @@ static void __init build_sched_topology(void)
 		powerpc_topology[i++] =
 			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
 	} else {
-		powerpc_topology[i++] = SDTL_INIT(cpu_smt_mask, powerpc_smt_flags, SMT);
+		powerpc_topology[i++] = SDTL_INIT(tl_smt_mask, powerpc_smt_flags, SMT);
 	}
 #endif
 	if (shared_caches) {
@@ -1716,7 +1726,7 @@ static void __init build_sched_topology(void)
 			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
 	}
 
-	powerpc_topology[i++] = SDTL_INIT(cpu_cpu_mask, powerpc_shared_proc_flags, PKG);
+	powerpc_topology[i++] = SDTL_INIT(cpu_pkg_mask, powerpc_shared_proc_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 46569b8e47dd..5129e3ffa7f5 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -509,7 +509,7 @@ int topology_cpu_init(struct cpu *cpu)
 	return rc;
 }
 
-static const struct cpumask *cpu_thread_mask(int cpu)
+static const struct cpumask *cpu_thread_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].thread_mask;
 }
@@ -520,22 +520,32 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 	return &cpu_topology[cpu].core_mask;
 }
 
-static const struct cpumask *cpu_book_mask(int cpu)
+static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return &cpu_topology[cpu].core_mask;
+}
+
+static const struct cpumask *cpu_book_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].book_mask;
 }
 
-static const struct cpumask *cpu_drawer_mask(int cpu)
+static const struct cpumask *cpu_drawer_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].drawer_mask;
 }
 
+static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 static struct sched_domain_topology_level s390_topology[] = {
 	SDTL_INIT(cpu_thread_mask, cpu_smt_flags, SMT),
-	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
+	SDTL_INIT(cpu_mc_mask, cpu_core_flags, MC),
 	SDTL_INIT(cpu_book_mask, NULL, BOOK),
 	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
-	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
+	SDTL_INIT(cpu_pkg_mask, NULL, PKG),
 	{ NULL, },
 };
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 33e166f6ab12..4cd3d69741cf 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -463,14 +463,36 @@ static int x86_core_flags(void)
 {
 	return cpu_core_flags() | x86_sched_itmt_flags();
 }
+
+static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_smt_mask(cpu);
+}
 #endif
+
 #ifdef CONFIG_SCHED_CLUSTER
 static int x86_cluster_flags(void)
 {
 	return cpu_cluster_flags() | x86_sched_itmt_flags();
 }
+static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_clustergroup_mask(cpu);
+}
+#endif
+
+#ifdef CONFIG_SCHED_MC
+static const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_coregroup_mask(cpu);
+}
 #endif
 
+static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 /*
  * Set if a package/die has multiple NUMA nodes inside.
  * AMD Magny-Cours, Intel Cluster-on-Die, and Intel
@@ -479,14 +501,14 @@ static int x86_cluster_flags(void)
 static bool x86_has_numa_in_package;
 
 static struct sched_domain_topology_level x86_topology[] = {
-	SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 #ifdef CONFIG_SCHED_CLUSTER
-	SDTL_INIT(cpu_clustergroup_mask, x86_cluster_flags, CLS),
+	SDTL_INIT(tl_cls_mask, x86_cluster_flags, CLS),
 #endif
 #ifdef CONFIG_SCHED_MC
-	SDTL_INIT(cpu_coregroup_mask, x86_core_flags, MC),
+	SDTL_INIT(tl_mc_mask, x86_core_flags, MC),
 #endif
-	SDTL_INIT(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
+	SDTL_INIT(tl_pkg_mask, x86_sched_itmt_flags, PKG),
 	{ NULL },
 };
 
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 5263746b63e8..602508130c8a 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -30,6 +30,8 @@ struct sd_flag_debug {
 };
 extern const struct sd_flag_debug sd_flag_debug[];
 
+struct sched_domain_topology_level;
+
 #ifdef CONFIG_SCHED_SMT
 static inline int cpu_smt_flags(void)
 {
@@ -172,7 +174,7 @@ bool cpus_equal_capacity(int this_cpu, int that_cpu);
 bool cpus_share_cache(int this_cpu, int that_cpu);
 bool cpus_share_resources(int this_cpu, int that_cpu);
 
-typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
+typedef const struct cpumask *(*sched_domain_mask_f)(struct sched_domain_topology_level *tl, int cpu);
 typedef int (*sched_domain_flags_f)(void);
 
 struct sd_data {
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 33b7fda97d39..6575af39fd10 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -260,7 +260,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
 
 #endif
 
-static inline const struct cpumask *cpu_cpu_mask(int cpu)
+static inline const struct cpumask *cpu_node_mask(int cpu)
 {
 	return cpumask_of_node(cpu_to_node(cpu));
 }
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 977e133bb8a4..dfc754e0668c 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1591,7 +1591,6 @@ static void claim_allocations(int cpu, struct sched_domain *sd)
 enum numa_topology_type sched_numa_topology_type;
 
 static int			sched_domains_numa_levels;
-static int			sched_domains_curr_level;
 
 int				sched_max_numa_distance;
 static int			*sched_domains_numa_distance;
@@ -1632,14 +1631,7 @@ sd_init(struct sched_domain_topology_level *tl,
 	int sd_id, sd_weight, sd_flags = 0;
 	struct cpumask *sd_span;
 
-#ifdef CONFIG_NUMA
-	/*
-	 * Ugly hack to pass state to sd_numa_mask()...
-	 */
-	sched_domains_curr_level = tl->numa_level;
-#endif
-
-	sd_weight = cpumask_weight(tl->mask(cpu));
+	sd_weight = cpumask_weight(tl->mask(tl, cpu));
 
 	if (tl->sd_flags)
 		sd_flags = (*tl->sd_flags)();
@@ -1677,7 +1669,7 @@ sd_init(struct sched_domain_topology_level *tl,
 	};
 
 	sd_span = sched_domain_span(sd);
-	cpumask_and(sd_span, cpu_map, tl->mask(cpu));
+	cpumask_and(sd_span, cpu_map, tl->mask(tl, cpu));
 	sd_id = cpumask_first(sd_span);
 
 	sd->flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
@@ -1732,22 +1724,48 @@ sd_init(struct sched_domain_topology_level *tl,
 	return sd;
 }
 
+#ifdef CONFIG_SCHED_SMT
+static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_smt_mask(cpu);
+}
+#endif
+
+#ifdef CONFIG_SCHED_CLUSTER
+static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_clustergroup_mask(cpu);
+}
+#endif
+
+#ifdef CONFIG_SCHED_MC
+static const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_coregroup_mask(cpu);
+}
+#endif
+
+static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 /*
  * Topology list, bottom-up.
  */
 static struct sched_domain_topology_level default_topology[] = {
 #ifdef CONFIG_SCHED_SMT
-	SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-	SDTL_INIT(cpu_clustergroup_mask, cpu_cluster_flags, CLS),
+	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
 #endif
 
 #ifdef CONFIG_SCHED_MC
-	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
 #endif
-	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
 	{ NULL, },
 };
 
@@ -1769,9 +1787,9 @@ void __init set_sched_topology(struct sched_domain_topology_level *tl)
 
 #ifdef CONFIG_NUMA
 
-static const struct cpumask *sd_numa_mask(int cpu)
+static const struct cpumask *sd_numa_mask(struct sched_domain_topology_level *tl, int cpu)
 {
-	return sched_domains_numa_masks[sched_domains_curr_level][cpu_to_node(cpu)];
+	return sched_domains_numa_masks[tl->numa_level][cpu_to_node(cpu)];
 }
 
 static void sched_numa_warn(const char *str)
@@ -2411,7 +2429,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 		 * breaks the linking done for an earlier span.
 		 */
 		for_each_cpu(cpu, cpu_map) {
-			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
+			const struct cpumask *tl_cpu_mask = tl->mask(tl, cpu);
 			int id;
 
 			/* lowest bit set in this mask is used as a unique id */
@@ -2419,7 +2437,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 
 			if (cpumask_test_cpu(id, id_seen)) {
 				/* First CPU has already been seen, ensure identical spans */
-				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
+				if (!cpumask_equal(tl->mask(tl, id), tl_cpu_mask))
 					return false;
 			} else {
 				/* First CPU hasn't been seen before, ensure it's a completely new span */
-- 
2.34.1


