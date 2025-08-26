Return-Path: <linuxppc-dev+bounces-11281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9BB352B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vWK6fdmz3dBG;
	Tue, 26 Aug 2025 14:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181821;
	cv=pass; b=euMwMz1GNKjdi5pdqYczFn2mKDyiV/x0+v2xgAfPMgJYa2qiu7cccJmoidYLWDv0pQc1e/k7hdXT043hh4LutEALgGqC4/Gqx+nzJIdqOCmSpCuisIYAszPndxfJjSK4eYNQsv6BbQ2Y5sTeCUVYx9sJBnll8HUrzkpjZhTl06n7eSkqRqbVItTjo+Q6jYA4hyZQRxdER/+rbmXME/LV8QA8HGyHOO324Ao4o337nicOuayPp7sFfeKlz4cCX/HiFJ+BWAGXEiImzDI06wN5CBkka//Qv+zi1dZoNQFbJHAUCBlCLdv/T0dlejLGV9kKRrhJ+Gc1UYtMLoQT1cV9WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181821; c=relaxed/relaxed;
	bh=D/GVxErGUpcsj4DX7OrISrfati2/H37lebj90va+WHY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVbPVih9FYoguRL3dh/ResDEfokR8toVMkkueq4eDY73lo4oUZSz6SwC2qWH0eVBOX2rkJv/q4dSxCJFq7YDWweOXF2jcObxpYJnRH+hi8HRJqeYyCwGk6macvRa4ejQSIXgY6DT7Y/Bd3UJaMxDsEYWoLUhzCFeuZX+xg0bPFKWUWZ6ec/VP1ySbm3h/VqBl8ctK0flkB1HnlDTv4KPoIQtigKgBm5Wjw1vI6cJ5lS7J95DhEdl1X+H3ImPAuUctqtHoFk4GxT8/q+qB6XsW+EqztLpZZ783dN/2/0Ia5iC2Bq+3epKkz1CE6LG8xFUU7hQ3yXixmHGPyC8ofmu0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ix2Lnlvt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ix2Lnlvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vWK0cppz3bcj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:17:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqpA44FbwygIGYXgjKyzqlVsoGXp2LyntPf0vNxSInDMjq+7DpwnogGK0r+Fmu6UOHqUCBJS/87UhKF9Vb1zxMGX2nMzU4fhUNRSd+4pHvUNs6Ms+S+pGSt4I5tgzT6nP5XmZuAAB0LUVkBWo2E982cOmsZYwGmIcJjSnKTArcON3nnAssHULf+EbifBvJrPVrxcn1ztf4rTBK29m/N4YprEvWsJDUZ43yhVqKd0SunJwmN6YrHUjwB2SuFA+VKqnz9RkOchtGmePsSs76V9+J2lZHfSaf6Z9R2InKv0cyr95awb6D9MGzyw5T2W/TfljubAZx3sJRcqMSJ16Funxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/GVxErGUpcsj4DX7OrISrfati2/H37lebj90va+WHY=;
 b=jA29pGaEpOg5JyMp6ef9wpav/GsTLXOGX+l16/T0DtYQbGenm3PT9hTbd4SrBYbEvwQjS9jB45/w92p5adfQaGUTjYfiYdnC6O/7x9m1wWFqnO2u0n9SysFr1ldgaOrK6F+QLm0ubSMNRhl//Cs5fh6FNTAdiO8ItVU7bcLyL5LsqQvE0lLbal8acD5NFW96CgF/wLid9V1uVCG8vtV4BTzJ7tqKa0LR7t3SeFWdCK46BTYJPjyvlN8GSsnORf+EdRda/BtG5PBuP+JFJV7VM5i6kr7Jnjr2tqAIgUgqrCSfJHtpMwUp4hDuA6biiq89/+0r2H4cWMvMT9JrDSzXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/GVxErGUpcsj4DX7OrISrfati2/H37lebj90va+WHY=;
 b=ix2Lnlvt3manxbfBZJg6NtjzTgmrZY6iq8x7OCNkz5GqT0gXoa/I7FD/8TZ59ywx71pkJrxAIKYJnjRjTd0mBCOUb3iZH2FeusDWSJrt61RAu5OFGe9slllY+vZkIf4Ymwq3t2qwhe1CKSobe4/mH47klQqU0S0w62t+cG6jo4k=
Received: from DM6PR13CA0027.namprd13.prod.outlook.com (2603:10b6:5:bc::40) by
 PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 04:16:40 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::53) by DM6PR13CA0027.outlook.office365.com
 (2603:10b6:5:bc::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via Frontend Transport; Tue,
 26 Aug 2025 04:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:16:39 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:16:23 -0500
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
Subject: [PATCH v7 5/8] sched/topology: Unify tl_smt_mask() across core and all arch
Date: Tue, 26 Aug 2025 04:13:16 +0000
Message-ID: <20250826041319.1284-6-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c66e1ad-c8a5-4472-a1e1-08dde4575ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8xDJvHhHJ9gOpMH8pGF8SrEoH4a9uAtbrO5Lw6MReoOiEumNqLrk6L9N8P4k?=
 =?us-ascii?Q?ypbFHBUfHq/2lZz3U3tEdpsnezxdYB3BEZNUxi+XPmp1amozH3UvpyOx8ZA+?=
 =?us-ascii?Q?ptaTEJ4uK5GQC/6WVa93rkU7BzX3hHTq5pZaDj5Ynw25j76DSPI6fq/nTtxt?=
 =?us-ascii?Q?pcLem80Q7K58qzjyKmG6mzkARHYgYyJjB05fIinUFThgUlWQxn5aL8NjUlG5?=
 =?us-ascii?Q?XRhBVmisavi1SvqQESH6cyNLNC5n97A32SnW/OuJnvO/diA8daWrAFTf2wNX?=
 =?us-ascii?Q?MUu0+nHB1GKaXs69+GKiwmrjTDKrsIalrr0qtk0Sv/yXnXwyhVOtiSJB7Wf5?=
 =?us-ascii?Q?yhnz7C5mCD4GdfzDqvCwppVcrccWwHd4fcyLrBDKztUG+7FYsOvD7gSULJB+?=
 =?us-ascii?Q?rkyvY2jTJYbAm9bf9QUB9pF6XEJVY7kzxKobK3hJVu+ndx0CAzWVe7Iogxqb?=
 =?us-ascii?Q?fc+KRNf735HYBDf6ErB+GYBhneZeDwXzJV9kBPWW4/bq675MbKYrnAJSMp8+?=
 =?us-ascii?Q?CgfCip2npuLt+SF6zJ8kClJMlm3qJZuZ3wfA3KMVLSA4n39BMjOMHElIIx1Q?=
 =?us-ascii?Q?k03zPsH155jb6aYh6IVOV0gkZEC6k4FLbxpMGnk4SskxE/q6TZUWRJNE1+ai?=
 =?us-ascii?Q?9QgBhtcLeN/ivo+RGPqrtNP1wF4yPXSjHUAXcL2YwVjVlFN8KhUH+IluCwsY?=
 =?us-ascii?Q?oxhzOhZCI+eMIjDtMKITrfM4ETfmVcEmfNtIJar/h0QPW1pWbOPKIBWuYT5H?=
 =?us-ascii?Q?6sadCuzB4Dp/IlRAxPFTvLxFm9aFdWRoM53MGCDzGZdxtJGw+IJa+x2asDXH?=
 =?us-ascii?Q?qh1B3SeJSghsm5OYRjvDHtCT/GyzaGiqwEavjdZKrfCT1zl1hC+n6YkOjiu1?=
 =?us-ascii?Q?kwNHK3D2UX/+AMcD6w583thI29rNUtVH4Cx/zoGlvDZQ5SSDeP7upRuNQF9B?=
 =?us-ascii?Q?KI/lZ3joQBMZGf4L4kpWwgoAeeJy+ft7aOwh7bXvROmjqFoztAcNvKD5GLA+?=
 =?us-ascii?Q?Hy4yWy5henOuQtvYa76aGO/GkJSBcOW4809ISH8cSh4mXlNskFH1Ee7Y6kLY?=
 =?us-ascii?Q?xO82mHbuBtEJcxNNwl2UiIG+geo6RMVrZ66MDglboC0Dcx0QeoPxtoIlwSUF?=
 =?us-ascii?Q?griOiJWUD+Q7N1oapAmXF0mfJ4FItXuMwM8xC5eQZTCNIB9eDvLYhTgB7wTn?=
 =?us-ascii?Q?UXGPKFUDe3vFGeXZrqPuL9uySGjitQZmiewOXnsGP3ldHL2/8QcVu8fkY6tJ?=
 =?us-ascii?Q?CNlGgesdyFFSbt1HvIfCj7hlkBX/7l7IVQ+WvP9EKWqv7q8xNfGd011KTztS?=
 =?us-ascii?Q?98DgVjwArj/7Kq1v0NR49sMywrLjuxVsKeXYIDRfRdpaVO0cAB7hztEtBbcQ?=
 =?us-ascii?Q?iWAsfbUEr68Z69N9CdFPp6+M6LvxhH9juCUnOliweiYRl1YFml8t0UnXsAIc?=
 =?us-ascii?Q?YcmO0FwrnILFgPoRm0pgTvfRmRszdu/VJnkl2a5bfAOXIS6zbYEMIehJTxuc?=
 =?us-ascii?Q?CbDKFHvHZarOJRK4TVgisJvE1NMGrWv0ZEvX9bXOxkipuGocdCjIEUXjKw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:16:39.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c66e1ad-c8a5-4472-a1e1-08dde4575ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unify the tl_smt_mask() wrapper around cpu_smt_mask() across core, x86,
ppc, and s390.

On s390, include/linux/topology.c defines an explicit cpu_smt_mask()
wrapper around topology_sibling_cpumask() when cpu_smt_mask() is not
defined by the arch/ bits and topology_sibling_cpumask() on s390 returns
&cpu_topology[cpu].thread_mask.

No functional changes intended.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c      | 5 -----
 arch/s390/kernel/topology.c    | 8 +-------
 arch/x86/kernel/smpboot.c      | 5 -----
 include/linux/sched/topology.h | 8 +++++++-
 kernel/sched/topology.c        | 7 -------
 5 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7f79b853b221..c58ddf84fe63 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1038,11 +1038,6 @@ static const struct cpumask *smallcore_smt_mask(struct sched_domain_topology_lev
 {
 	return cpu_smallcore_mask(cpu);
 }
-
-static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_smt_mask(cpu);
-}
 #endif
 
 static struct cpumask *cpu_corgrp_mask(int cpu)
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 5129e3ffa7f5..c88eda847309 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -509,12 +509,6 @@ int topology_cpu_init(struct cpu *cpu)
 	return rc;
 }
 
-static const struct cpumask *cpu_thread_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return &cpu_topology[cpu].thread_mask;
-}
-
-
 const struct cpumask *cpu_coregroup_mask(int cpu)
 {
 	return &cpu_topology[cpu].core_mask;
@@ -541,7 +535,7 @@ static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl
 }
 
 static struct sched_domain_topology_level s390_topology[] = {
-	SDTL_INIT(cpu_thread_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 	SDTL_INIT(cpu_mc_mask, cpu_core_flags, MC),
 	SDTL_INIT(cpu_book_mask, NULL, BOOK),
 	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 4cd3d69741cf..03ff6270966a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -463,11 +463,6 @@ static int x86_core_flags(void)
 {
 	return cpu_core_flags() | x86_sched_itmt_flags();
 }
-
-static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_smt_mask(cpu);
-}
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 602508130c8a..d75fbb7d9667 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -37,7 +37,13 @@ static inline int cpu_smt_flags(void)
 {
 	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
 }
-#endif
+
+static const __maybe_unused
+struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_smt_mask(cpu);
+}
+#endif /* CONFIG_SCHED_SMT */
 
 #ifdef CONFIG_SCHED_CLUSTER
 static inline int cpu_cluster_flags(void)
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index dfc754e0668c..92165fe56a2d 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1724,13 +1724,6 @@ sd_init(struct sched_domain_topology_level *tl,
 	return sd;
 }
 
-#ifdef CONFIG_SCHED_SMT
-static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_smt_mask(cpu);
-}
-#endif
-
 #ifdef CONFIG_SCHED_CLUSTER
 static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
 {
-- 
2.34.1


