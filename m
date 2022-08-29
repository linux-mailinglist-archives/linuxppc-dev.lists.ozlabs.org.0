Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3585A4BAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:26:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGV6q51vDz3f5d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QD/JrDFg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.212.76; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QD/JrDFg;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2076.outbound.protection.outlook.com [40.107.212.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGSyh6t1kz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 21:34:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkrYJdDbW8YfT1ZeFtROsa8NJKH/lGAI1tX4dELmslgbMbR+4nVcCnXlnzwG+fDRIlorfQf+EgbkATKFLP2Q7QFTRztB6mv81ZXRYcSzMy4KcJ7SnOBryrLIFSYKEIAwLNvvYMpUhSHw6WlWyUBf0HxRp9h+/ZeNI40Cn9jryOGCG2UAdr20LuVg3Vssv5G/29esFqtEHzhXuNye7+RtBQyu3tmcvgfS38yTOUJxyCETDALVbchNsyaMfqstl7qK+5W6nPkw/H5vhtnUBL/e1IGfxnJ8RUo5wPQH79dSbpL/RESYcFzZXLgwRO3N2qIht6h044kysU/xZX3C34l9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfEmVq0cCFyBVcSXKr3p/vOTcvBUgbePeHCHoFV/6jM=;
 b=YF9HLEsVf9Barisv8Hp+Q5L6rqE3lFElEnGTAr2rtexcVEaZ4kv1l245JgX1mRGvb85jEUp97DBst+RSVZa9sMQ3fJUTHFVY1fb9N/KJpxTAPL4pZe/9A+ePvqKji5cZenVm3KRIIPEK261tTnrCDIPimStmW3jVx5XE14Oh4sG+maqXJdIhkbF7AV8jrMk+7z/yDGZLqAebEnA4zOFY5Bi8QRHR6uXRILf82KL2Q/B1Mzjn7PxVSPwkQ5ZimBYtLLdrSWkp5KVcg3yQQCwZz5xB7nGt2xVmfdtbU5T9IjXYPmkeUxfpvDIJWhlKkciEVV/l/y92Qxtf7TDONZUCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfEmVq0cCFyBVcSXKr3p/vOTcvBUgbePeHCHoFV/6jM=;
 b=QD/JrDFgMZThbdpn56Vy6Cqpe0ZcIecsw28A+ZljdBzl/nkuZZEocrkov2f7bOTZ4GGafylirHfe9RPBvCcxLjtOawG7fn/WgaBKDxWH7AvK/nn8U+RI9OJcNp6i3Do1IHz+9OlZrP9dzl+LcrgSZraNRoQ3YbmnhA7HfYZhDHc=
Received: from BN9PR03CA0871.namprd03.prod.outlook.com (2603:10b6:408:13c::6)
 by MN2PR12MB3712.namprd12.prod.outlook.com (2603:10b6:208:164::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Mon, 29 Aug
 2022 11:34:11 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::92) by BN9PR03CA0871.outlook.office365.com
 (2603:10b6:408:13c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Mon, 29 Aug 2022 11:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 11:34:11 +0000
Received: from BLR-5CG113396H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 29 Aug
 2022 06:33:59 -0500
From: Ravi Bangoria <ravi.bangoria@amd.com>
To: <peterz@infradead.org>
Subject: [PATCH] perf: Rewrite core context handling
Date: Mon, 29 Aug 2022 17:03:47 +0530
Message-ID: <20220829113347.295-1-ravi.bangoria@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78affe86-e3bf-4247-25ee-08da89b2649b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3712:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4oMXmgN7CyL53k/OmwV2oF2MVQ/KDJArnLsESd4ZLMaBr3cyjAPVxbkcZ363JUFtVJWwEXiCZne2KvswzEsVDe2CLDhRz0CW1iEeQD8YhWw82qmLaZOr4iPDRqmUFvjiXgV4Mke06ie3MwgjAZxeZDNSK+UpK3fOisbcAFmjksYjpE/nFqqnql5CJh0PqXh3LerQ/wTHeupz8PmDNAniQPfv2b8Nd8TmfoGoGE6oWbsA2Bx60HikkpKcXL8/OKxzNwE+NuD8YBQ/8ICuI/vGD0nwgRPXEt2giMvc6FUUQ2/upnt1KRUmy134hQwzns4fkosJLYU6lrekrOWTwQCrjIhL/IZleZK47MOLFg3i+1OOAj5TAvUEzq3pCJxJjUocRNvBG7LDzLeFJ8v4f7muweqHO+8Y11gyYR/D3q/jjo12LBxIMnUPmsslofRz6DqhfYhZz8LjbXUg6VhjO03wyLQ/szrWjbtc3ZCfWko6ZYsx1qISC+HnTYZ2KwPfDNgR2J/tTMcTQRuT+ZfjictHCUKyGGHKJ9QqSbaU3zESKcInfZ0G7UsB3lWN6sM1xA1uSy3AcYFjpUdAO37oeTfvoXf7L3E3FPEUNghKXyQymss/IC+mq1v3eKRiXokb1AGe/TPRbPBhbsXBaqd6Lq7JBQDr634e08JFUm0HPVs0k0Oe7mO/0d+wQ8HWFO0JFv0m5Ony7C7GfhfaIWGWawNcTSyL0M7t5rY/AqVEcKbOAUEXAkhJ5lK95R+pRGZGZ9XzB3pz1Z75mlIkddde1t7YONft5/wSAffX/7ZdSXmHwJdvlhfBCUOXnNoZrEVbuFGI1+x0/E9yvoch3+Xv7c28CarPQayrWxJF4uGAX+mO3C9Dtu5JkU7gwsphWMCCBN+FvHCvH0He+W6oaleTOefrWAF4yjp7CF72QvqUjL1cYvs=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(40470700004)(46966006)(40480700001)(36860700001)(82310400005)(356005)(86362001)(40460700003)(82740400003)(81166007)(54906003)(8676002)(4326008)(70206006)(70586007)(7416002)(8936002)(41300700001)(5660300002)(966005)(478600001)(47076005)(316002)(6916009)(186003)(16526019)(336012)(2616005)(1076003)(7696005)(83380400001)(26005)(2906002)(44832011)(6666004)(426003)(30864003)(36756003)(21314003)(36900700001)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 11:34:11.0638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78affe86-e3bf-4247-25ee-08da89b2649b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Approved-At: Mon, 29 Aug 2022 22:21:55 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, ravi.bangoria@amd.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

There have been various issues and limitations with the way perf uses
(task) contexts to track events. Most notable is the single hardware
PMU task context, which has resulted in a number of yucky things (both
proposed and merged).

Notably:
 - HW breakpoint PMU
 - ARM big.little PMU / Intel ADL PMU
 - Intel Branch Monitoring PMU
 - AMD IBS PMU
 - S390 cpum_cf PMU
 - PowerPC trace_imc PMU

*Current design:*
Currently we have a per task and per cpu perf_event_contexts:

  task_struct::perf_events_ctxp[] <-> perf_event_context <-> perf_cpu_context
       ^                                 |    ^     |           ^
       `---------------------------------'    |     `--> pmu ---'
                                              v           ^
                                         perf_event ------'

Each task has an array of pointers to a perf_event_context. Each
perf_event_context has a direct relation to a PMU and a group of
events for that PMU. The task related perf_event_context's have a
pointer back to that task.

Each PMU has a per-cpu pointer to a per-cpu perf_cpu_context, which
includes a perf_event_context, which again has a direct relation to
that PMU, and a group of events for that PMU.

The perf_cpu_context also tracks which task context is currently
associated with that CPU and includes a few other things like the
hrtimer for rotation etc.

Each perf_event is then associated with its PMU and one
perf_event_context.

*Proposed design:*
New design proposed by this patch reduce to a single task context and
a single CPU context but adds some intermediate data-structures:

  task_struct::perf_event_ctxp -> perf_event_context <- perf_cpu_context
       ^                           |   ^ ^
       `---------------------------'   | |
                                       | |    perf_cpu_pmu_context <--.
                                       | `----.    ^                  |
                                       |      |    |                  |
                                       |      v    v                  |
                                       | ,--> perf_event_pmu_context  |
                                       | |                            |
                                       | |                            |
                                       v v                            |
                                  perf_event ---> pmu ----------------'

With new design, perf_event_context will hold all pmu events in the
respective(pinned/flexible) rbtrees. This can be achieved by adding
pmu to rbtree key:

  {cpu, pmu, cgroup, group_index}

Each perf_event_context carry a list of perf_event_pmu_context which
is used to hold per-pmu-per-context state. For ex, it keeps track of
currently active events for that pmu, a pmu specific task_ctx_data,
a flag to tell whether rotation is required or not etc.

Similarly, perf_cpu_pmu_context is used to hold per-pmu-per-cpu state
like hrtimer details to drive the event rotation, a pointer to
perf_event_pmu_context of currently running task and some other
ancillary information.

Each perf_event is associated to it's pmu, perf_event_context and
perf_event_pmu_context.

*Tests:*
With this, perf test and perf_event_test runs fine without any issues
on Intel and AMD machines. However, one WARN_ON() was reported on Intel
machine[1] with perf fuzzer. Note that, so far I've run these tests to
verify stability of the change only, not functional correctness. Also,
some of the known issues marked with XXX needs to be resolved.

Further optimizations to current implementation are possible. For ex,
ctx_resched() can be optimized to reschedule only single pmu events.
ctx_sched_in() can be optimized to use pmu=NULL while scheduling entire
context. However, this will lead to significant changes to rbtree and
minheap layouts.

[1]: https://lore.kernel.org/r/8d91528b-e830-6ad0-8a92-621ce9f944ca%40amd.com

Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
---

This is a 3rd version of perf event context rework and it's quite
stable now, so I thought to remove RFC tag. Previous versions:

RFC v2: https://lore.kernel.org/lkml/20220113134743.1292-1-ravi.bangoria@amd.com
RFC v1: https://lore.kernel.org/lkml/20181010104559.GO5728@hirez.programming.kicks-ass.net

RFC v2 -> PATCH:
 - Rebased to v6.0-rc2
 - Fixed locking issues reported by lockdep
 - Fixed kernel crash caused by stale cpc->task_epc
 - Resolved few bugs and warnings reported while running perf test,
   perf_event_test and perf fuzzer
 - Removed cgrp_cpuctx_list. No need to maintain list as we have
   single perf_event_context for each cpu
 - Removed x86_pmu_update_cpu_context() quirk
 - Modify pmu->filter callback (including s/filter_match/filter/).


 arch/arm64/kernel/perf_event.c     |   24 +-
 arch/powerpc/perf/core-book3s.c    |    8 +-
 arch/s390/kernel/perf_pai_crypto.c |    2 +-
 arch/x86/events/amd/brs.c          |    2 +-
 arch/x86/events/amd/core.c         |    4 +-
 arch/x86/events/core.c             |   44 +-
 arch/x86/events/intel/core.c       |   23 +-
 arch/x86/events/intel/ds.c         |    4 +-
 arch/x86/events/intel/lbr.c        |   30 +-
 arch/x86/events/perf_event.h       |   28 +-
 drivers/perf/arm_pmu.c             |   11 +-
 include/linux/perf/arm_pmu.h       |    2 +-
 include/linux/perf_event.h         |  113 +-
 include/linux/sched.h              |    2 +-
 kernel/events/core.c               | 1805 ++++++++++++++--------------
 15 files changed, 1061 insertions(+), 1041 deletions(-)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index cb69ff1e6138..c2ced70f66f5 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -806,10 +806,20 @@ static void armv8pmu_disable_event(struct perf_event *event)
 
 static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 {
-	struct perf_event_context *task_ctx =
-		this_cpu_ptr(cpu_pmu->pmu.pmu_cpu_context)->task_ctx;
+	/* XXX: Get this verified by Arm folks */
+	struct perf_event_context *ctx;
+	int nr_user = 0;
+
+	rcu_read_lock();
+	ctx = rcu_dereference(current->perf_event_ctxp);
+	if (ctx) {
+		raw_spin_lock(&ctx->lock);
+		nr_user = ctx->nr_user;
+		raw_spin_unlock(&ctx->lock);
+	}
+	rcu_read_unlock();
 
-	if (sysctl_perf_user_access && task_ctx && task_ctx->nr_user)
+	if (sysctl_perf_user_access && nr_user)
 		armv8pmu_enable_user_access(cpu_pmu);
 	else
 		armv8pmu_disable_user_access();
@@ -1019,10 +1029,10 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int armv8pmu_filter_match(struct perf_event *event)
+static bool armv8pmu_filter(struct pmu *pmu, int cpu)
 {
-	unsigned long evtype = event->hw.config_base & ARMV8_PMU_EVTYPE_EVENT;
-	return evtype != ARMV8_PMUV3_PERFCTR_CHAIN;
+	struct arm_pmu *armpmu = to_arm_pmu(pmu);
+	return !cpumask_test_cpu(smp_processor_id(), &armpmu->supported_cpus);
 }
 
 static void armv8pmu_reset(void *info)
@@ -1253,7 +1263,7 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu, char *name,
 	cpu_pmu->stop			= armv8pmu_stop;
 	cpu_pmu->reset			= armv8pmu_reset;
 	cpu_pmu->set_event_filter	= armv8pmu_set_event_filter;
-	cpu_pmu->filter_match		= armv8pmu_filter_match;
+	cpu_pmu->filter			= armv8pmu_filter;
 
 	cpu_pmu->pmu.event_idx		= armv8pmu_user_event_idx;
 
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 13919eb96931..f8459fd9ad77 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -132,7 +132,7 @@ static unsigned long ebb_switch_in(bool ebb, struct cpu_hw_events *cpuhw)
 
 static inline void power_pmu_bhrb_enable(struct perf_event *event) {}
 static inline void power_pmu_bhrb_disable(struct perf_event *event) {}
-static void power_pmu_sched_task(struct perf_event_context *ctx, bool sched_in) {}
+static void power_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in) {}
 static inline void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *cpuhw) {}
 static void pmao_restore_workaround(bool ebb) { }
 #endif /* CONFIG_PPC32 */
@@ -424,7 +424,7 @@ static void power_pmu_bhrb_enable(struct perf_event *event)
 		cpuhw->bhrb_context = event->ctx;
 	}
 	cpuhw->bhrb_users++;
-	perf_sched_cb_inc(event->ctx->pmu);
+	perf_sched_cb_inc(event->pmu);
 }
 
 static void power_pmu_bhrb_disable(struct perf_event *event)
@@ -436,7 +436,7 @@ static void power_pmu_bhrb_disable(struct perf_event *event)
 
 	WARN_ON_ONCE(!cpuhw->bhrb_users);
 	cpuhw->bhrb_users--;
-	perf_sched_cb_dec(event->ctx->pmu);
+	perf_sched_cb_dec(event->pmu);
 
 	if (!cpuhw->disabled && !cpuhw->bhrb_users) {
 		/* BHRB cannot be turned off when other
@@ -451,7 +451,7 @@ static void power_pmu_bhrb_disable(struct perf_event *event)
 /* Called from ctxsw to prevent one process's branch entries to
  * mingle with the other process's entries during context switch.
  */
-static void power_pmu_sched_task(struct perf_event_context *ctx, bool sched_in)
+static void power_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 	if (!ppmu->bhrb_nr)
 		return;
diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
index b38b4ae01589..457c754c3365 100644
--- a/arch/s390/kernel/perf_pai_crypto.c
+++ b/arch/s390/kernel/perf_pai_crypto.c
@@ -378,7 +378,7 @@ static int paicrypt_push_sample(void)
 /* Called on schedule-in and schedule-out. No access to event structure,
  * but for sampling only event CRYPTO_ALL is allowed.
  */
-static void paicrypt_sched_task(struct perf_event_context *ctx, bool sched_in)
+static void paicrypt_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 	/* We started with a clean page on event installation. So read out
 	 * results on schedule_out and if page was dirty, clear values.
diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index bee8765a1e9b..4df59bb3a4d7 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -317,7 +317,7 @@ static void amd_brs_poison_buffer(void)
  * On ctxswin, sched_in = true, called after the PMU has started
  * On ctxswout, sched_in = false, called before the PMU is stopped
  */
-void amd_pmu_brs_sched_task(struct perf_event_context *ctx, bool sched_in)
+void amd_pmu_brs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 9ac3718410ce..b4d313189c1c 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1248,11 +1248,11 @@ static ssize_t amd_event_sysfs_show(char *page, u64 config)
 	return x86_event_sysfs_show(page, config, event);
 }
 
-static void amd_pmu_sched_task(struct perf_event_context *ctx,
+static void amd_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 				 bool sched_in)
 {
 	if (sched_in && x86_pmu.lbr_nr)
-		amd_pmu_brs_sched_task(ctx, sched_in);
+		amd_pmu_brs_sched_task(pmu_ctx, sched_in);
 }
 
 static u64 amd_pmu_limit_period(struct perf_event *event, u64 left)
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index f969410d0c90..a8f1e38c66a7 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -86,6 +86,8 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_swap_task_ctx, *x86_pmu.swap_task_ctx);
 DEFINE_STATIC_CALL_NULL(x86_pmu_drain_pebs,   *x86_pmu.drain_pebs);
 DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
 
+DEFINE_STATIC_CALL_NULL(x86_pmu_filter, *x86_pmu.filter);
+
 /*
  * This one is magic, it will get called even when PMU init fails (because
  * there is no PMU), in which case it should simply return NULL.
@@ -2038,6 +2040,7 @@ static void x86_pmu_static_call_update(void)
 	static_call_update(x86_pmu_pebs_aliases, x86_pmu.pebs_aliases);
 
 	static_call_update(x86_pmu_guest_get_msrs, x86_pmu.guest_get_msrs);
+	static_call_update(x86_pmu_filter, x86_pmu.filter);
 }
 
 static void _x86_pmu_read(struct perf_event *event)
@@ -2059,23 +2062,6 @@ void x86_pmu_show_pmu_cap(int num_counters, int num_counters_fixed,
 	pr_info("... event mask:             %016Lx\n", intel_ctrl);
 }
 
-/*
- * The generic code is not hybrid friendly. The hybrid_pmu->pmu
- * of the first registered PMU is unconditionally assigned to
- * each possible cpuctx->ctx.pmu.
- * Update the correct hybrid PMU to the cpuctx->ctx.pmu.
- */
-void x86_pmu_update_cpu_context(struct pmu *pmu, int cpu)
-{
-	struct perf_cpu_context *cpuctx;
-
-	if (!pmu->pmu_cpu_context)
-		return;
-
-	cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
-	cpuctx->ctx.pmu = pmu;
-}
-
 static int __init init_hw_perf_events(void)
 {
 	struct x86_pmu_quirk *quirk;
@@ -2196,9 +2182,6 @@ static int __init init_hw_perf_events(void)
 						(hybrid_pmu->cpu_type == hybrid_big) ? PERF_TYPE_RAW : -1);
 			if (err)
 				break;
-
-			if (cpu_type == hybrid_pmu->cpu_type)
-				x86_pmu_update_cpu_context(&hybrid_pmu->pmu, raw_smp_processor_id());
 		}
 
 		if (i < x86_pmu.num_hybrid_pmus) {
@@ -2647,15 +2630,15 @@ static const struct attribute_group *x86_pmu_attr_groups[] = {
 	NULL,
 };
 
-static void x86_pmu_sched_task(struct perf_event_context *ctx, bool sched_in)
+static void x86_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
-	static_call_cond(x86_pmu_sched_task)(ctx, sched_in);
+	static_call_cond(x86_pmu_sched_task)(pmu_ctx, sched_in);
 }
 
-static void x86_pmu_swap_task_ctx(struct perf_event_context *prev,
-				  struct perf_event_context *next)
+static void x86_pmu_swap_task_ctx(struct perf_event_pmu_context *prev_epc,
+				  struct perf_event_pmu_context *next_epc)
 {
-	static_call_cond(x86_pmu_swap_task_ctx)(prev, next);
+	static_call_cond(x86_pmu_swap_task_ctx)(prev_epc, next_epc);
 }
 
 void perf_check_microcode(void)
@@ -2688,12 +2671,13 @@ static int x86_pmu_aux_output_match(struct perf_event *event)
 	return 0;
 }
 
-static int x86_pmu_filter_match(struct perf_event *event)
+static bool x86_pmu_filter(struct pmu *pmu, int cpu)
 {
-	if (x86_pmu.filter_match)
-		return x86_pmu.filter_match(event);
+	bool ret = false;
 
-	return 1;
+	static_call_cond(x86_pmu_filter)(pmu, cpu, &ret);
+
+	return ret;
 }
 
 static struct pmu pmu = {
@@ -2724,7 +2708,7 @@ static struct pmu pmu = {
 
 	.aux_output_match	= x86_pmu_aux_output_match,
 
-	.filter_match		= x86_pmu_filter_match,
+	.filter			= x86_pmu_filter,
 };
 
 void arch_perf_update_userpage(struct perf_event *event,
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 2db93498ff71..40cebd9b90a1 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4508,8 +4508,6 @@ static bool init_hybrid_pmu(int cpu)
 	cpumask_set_cpu(cpu, &pmu->supported_cpus);
 	cpuc->pmu = &pmu->pmu;
 
-	x86_pmu_update_cpu_context(&pmu->pmu, cpu);
-
 	return true;
 }
 
@@ -4643,17 +4641,17 @@ static void intel_pmu_cpu_dead(int cpu)
 		cpumask_clear_cpu(cpu, &hybrid_pmu(cpuc->pmu)->supported_cpus);
 }
 
-static void intel_pmu_sched_task(struct perf_event_context *ctx,
+static void intel_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
 				 bool sched_in)
 {
-	intel_pmu_pebs_sched_task(ctx, sched_in);
-	intel_pmu_lbr_sched_task(ctx, sched_in);
+	intel_pmu_pebs_sched_task(pmu_ctx, sched_in);
+	intel_pmu_lbr_sched_task(pmu_ctx, sched_in);
 }
 
-static void intel_pmu_swap_task_ctx(struct perf_event_context *prev,
-				    struct perf_event_context *next)
+static void intel_pmu_swap_task_ctx(struct perf_event_pmu_context *prev_epc,
+				    struct perf_event_pmu_context *next_epc)
 {
-	intel_pmu_lbr_swap_task_ctx(prev, next);
+	intel_pmu_lbr_swap_task_ctx(prev_epc, next_epc);
 }
 
 static int intel_pmu_check_period(struct perf_event *event, u64 value)
@@ -4677,12 +4675,11 @@ static int intel_pmu_aux_output_match(struct perf_event *event)
 	return is_intel_pt_event(event);
 }
 
-static int intel_pmu_filter_match(struct perf_event *event)
+static void intel_pmu_filter(struct pmu *pmu, int cpu, bool *ret)
 {
-	struct x86_hybrid_pmu *pmu = hybrid_pmu(event->pmu);
-	unsigned int cpu = smp_processor_id();
+	struct x86_hybrid_pmu *hpmu = hybrid_pmu(pmu);
 
-	return cpumask_test_cpu(cpu, &pmu->supported_cpus);
+	*ret = !cpumask_test_cpu(cpu, &hpmu->supported_cpus);
 }
 
 PMU_FORMAT_ATTR(offcore_rsp, "config1:0-63");
@@ -6350,7 +6347,7 @@ __init int intel_pmu_init(void)
 		x86_pmu.update_topdown_event = adl_update_topdown_event;
 		x86_pmu.set_topdown_event_period = adl_set_topdown_event_period;
 
-		x86_pmu.filter_match = intel_pmu_filter_match;
+		x86_pmu.filter = intel_pmu_filter;
 		x86_pmu.get_event_constraints = adl_get_event_constraints;
 		x86_pmu.hw_config = adl_hw_config;
 		x86_pmu.limit_period = spr_limit_period;
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index ba60427caa6d..bdd082d261a9 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1046,7 +1046,7 @@ static inline bool pebs_needs_sched_cb(struct cpu_hw_events *cpuc)
 	return cpuc->n_pebs && (cpuc->n_pebs == cpuc->n_large_pebs);
 }
 
-void intel_pmu_pebs_sched_task(struct perf_event_context *ctx, bool sched_in)
+void intel_pmu_pebs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 
@@ -1154,7 +1154,7 @@ static void
 pebs_update_state(bool needed_cb, struct cpu_hw_events *cpuc,
 		  struct perf_event *event, bool add)
 {
-	struct pmu *pmu = event->ctx->pmu;
+	struct pmu *pmu = event->pmu;
 	/*
 	 * Make sure we get updated with the first PEBS
 	 * event. It will trigger also during removal, but
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 4f70fb6c2c1e..3304d3bb67c5 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -575,21 +575,21 @@ static void __intel_pmu_lbr_save(void *ctx)
 	cpuc->last_log_id = ++task_context_opt(ctx)->log_id;
 }
 
-void intel_pmu_lbr_swap_task_ctx(struct perf_event_context *prev,
-				 struct perf_event_context *next)
+void intel_pmu_lbr_swap_task_ctx(struct perf_event_pmu_context *prev_epc,
+				 struct perf_event_pmu_context *next_epc)
 {
 	void *prev_ctx_data, *next_ctx_data;
 
-	swap(prev->task_ctx_data, next->task_ctx_data);
+	swap(prev_epc->task_ctx_data, next_epc->task_ctx_data);
 
 	/*
-	 * Architecture specific synchronization makes sense in
-	 * case both prev->task_ctx_data and next->task_ctx_data
+	 * Architecture specific synchronization makes sense in case
+	 * both prev_epc->task_ctx_data and next_epc->task_ctx_data
 	 * pointers are allocated.
 	 */
 
-	prev_ctx_data = next->task_ctx_data;
-	next_ctx_data = prev->task_ctx_data;
+	prev_ctx_data = next_epc->task_ctx_data;
+	next_ctx_data = prev_epc->task_ctx_data;
 
 	if (!prev_ctx_data || !next_ctx_data)
 		return;
@@ -598,7 +598,7 @@ void intel_pmu_lbr_swap_task_ctx(struct perf_event_context *prev,
 	     task_context_opt(next_ctx_data)->lbr_callstack_users);
 }
 
-void intel_pmu_lbr_sched_task(struct perf_event_context *ctx, bool sched_in)
+void intel_pmu_lbr_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	void *task_ctx;
@@ -611,7 +611,7 @@ void intel_pmu_lbr_sched_task(struct perf_event_context *ctx, bool sched_in)
 	 * the task was scheduled out, restore the stack. Otherwise flush
 	 * the LBR stack.
 	 */
-	task_ctx = ctx ? ctx->task_ctx_data : NULL;
+	task_ctx = pmu_ctx ? pmu_ctx->task_ctx_data : NULL;
 	if (task_ctx) {
 		if (sched_in)
 			__intel_pmu_lbr_restore(task_ctx);
@@ -647,8 +647,8 @@ void intel_pmu_lbr_add(struct perf_event *event)
 
 	cpuc->br_sel = event->hw.branch_reg.reg;
 
-	if (branch_user_callstack(cpuc->br_sel) && event->ctx->task_ctx_data)
-		task_context_opt(event->ctx->task_ctx_data)->lbr_callstack_users++;
+	if (branch_user_callstack(cpuc->br_sel) && event->pmu_ctx->task_ctx_data)
+		task_context_opt(event->pmu_ctx->task_ctx_data)->lbr_callstack_users++;
 
 	/*
 	 * Request pmu::sched_task() callback, which will fire inside the
@@ -671,7 +671,7 @@ void intel_pmu_lbr_add(struct perf_event *event)
 	 */
 	if (x86_pmu.intel_cap.pebs_baseline && event->attr.precise_ip > 0)
 		cpuc->lbr_pebs_users++;
-	perf_sched_cb_inc(event->ctx->pmu);
+	perf_sched_cb_inc(event->pmu);
 	if (!cpuc->lbr_users++ && !event->total_time_running)
 		intel_pmu_lbr_reset();
 }
@@ -724,8 +724,8 @@ void intel_pmu_lbr_del(struct perf_event *event)
 		return;
 
 	if (branch_user_callstack(cpuc->br_sel) &&
-	    event->ctx->task_ctx_data)
-		task_context_opt(event->ctx->task_ctx_data)->lbr_callstack_users--;
+	    event->pmu_ctx->task_ctx_data)
+		task_context_opt(event->pmu_ctx->task_ctx_data)->lbr_callstack_users--;
 
 	if (event->hw.flags & PERF_X86_EVENT_LBR_SELECT)
 		cpuc->lbr_select = 0;
@@ -735,7 +735,7 @@ void intel_pmu_lbr_del(struct perf_event *event)
 	cpuc->lbr_users--;
 	WARN_ON_ONCE(cpuc->lbr_users < 0);
 	WARN_ON_ONCE(cpuc->lbr_pebs_users < 0);
-	perf_sched_cb_dec(event->ctx->pmu);
+	perf_sched_cb_dec(event->pmu);
 }
 
 static inline bool vlbr_exclude_host(void)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index ba3d24a6a4ec..215dbb23b1d6 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -808,7 +808,7 @@ struct x86_pmu {
 	void		(*cpu_dead)(int cpu);
 
 	void		(*check_microcode)(void);
-	void		(*sched_task)(struct perf_event_context *ctx,
+	void		(*sched_task)(struct perf_event_pmu_context *pmu_ctx,
 				      bool sched_in);
 
 	/*
@@ -893,12 +893,12 @@ struct x86_pmu {
 	int		(*set_topdown_event_period)(struct perf_event *event);
 
 	/*
-	 * perf task context (i.e. struct perf_event_context::task_ctx_data)
+	 * perf task context (i.e. struct perf_event_pmu_context::task_ctx_data)
 	 * switch helper to bridge calls from perf/core to perf/x86.
 	 * See struct pmu::swap_task_ctx() usage for examples;
 	 */
-	void		(*swap_task_ctx)(struct perf_event_context *prev,
-					 struct perf_event_context *next);
+	void		(*swap_task_ctx)(struct perf_event_pmu_context *prev_epc,
+					 struct perf_event_pmu_context *next_epc);
 
 	/*
 	 * AMD bits
@@ -924,7 +924,7 @@ struct x86_pmu {
 
 	int (*aux_output_match) (struct perf_event *event);
 
-	int (*filter_match)(struct perf_event *event);
+	void (*filter)(struct pmu *pmu, int cpu, bool *ret);
 	/*
 	 * Hybrid support
 	 *
@@ -1175,8 +1175,6 @@ int x86_pmu_handle_irq(struct pt_regs *regs);
 void x86_pmu_show_pmu_cap(int num_counters, int num_counters_fixed,
 			  u64 intel_ctrl);
 
-void x86_pmu_update_cpu_context(struct pmu *pmu, int cpu);
-
 extern struct event_constraint emptyconstraint;
 
 extern struct event_constraint unconstrained;
@@ -1248,7 +1246,7 @@ static inline void amd_pmu_brs_add(struct perf_event *event)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 
-	perf_sched_cb_inc(event->ctx->pmu);
+	perf_sched_cb_inc(event->pmu);
 	cpuc->lbr_users++;
 	/*
 	 * No need to reset BRS because it is reset
@@ -1263,10 +1261,10 @@ static inline void amd_pmu_brs_del(struct perf_event *event)
 	cpuc->lbr_users--;
 	WARN_ON_ONCE(cpuc->lbr_users < 0);
 
-	perf_sched_cb_dec(event->ctx->pmu);
+	perf_sched_cb_dec(event->pmu);
 }
 
-void amd_pmu_brs_sched_task(struct perf_event_context *ctx, bool sched_in);
+void amd_pmu_brs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in);
 #else
 static inline int amd_brs_init(void)
 {
@@ -1291,7 +1289,7 @@ static inline void amd_pmu_brs_del(struct perf_event *event)
 {
 }
 
-static inline void amd_pmu_brs_sched_task(struct perf_event_context *ctx, bool sched_in)
+static inline void amd_pmu_brs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in)
 {
 }
 
@@ -1451,7 +1449,7 @@ void intel_pmu_pebs_enable_all(void);
 
 void intel_pmu_pebs_disable_all(void);
 
-void intel_pmu_pebs_sched_task(struct perf_event_context *ctx, bool sched_in);
+void intel_pmu_pebs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in);
 
 void intel_pmu_auto_reload_read(struct perf_event *event);
 
@@ -1459,10 +1457,10 @@ void intel_pmu_store_pebs_lbrs(struct lbr_entry *lbr);
 
 void intel_ds_init(void);
 
-void intel_pmu_lbr_swap_task_ctx(struct perf_event_context *prev,
-				 struct perf_event_context *next);
+void intel_pmu_lbr_swap_task_ctx(struct perf_event_pmu_context *prev_epc,
+				 struct perf_event_pmu_context *next_epc);
 
-void intel_pmu_lbr_sched_task(struct perf_event_context *ctx, bool sched_in);
+void intel_pmu_lbr_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in);
 
 u64 lbr_from_signext_quirk_wr(u64 val);
 
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 59d3980b8ca2..ae3f7bbef248 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -550,15 +550,15 @@ static void armpmu_disable(struct pmu *pmu)
  * microarchitecture, and aren't suitable for another. Thus, only match CPUs of
  * the same microarchitecture.
  */
-static int armpmu_filter_match(struct perf_event *event)
+static int armpmu_filter(struct perf_event *event)
 {
 	struct arm_pmu *armpmu = to_arm_pmu(event->pmu);
 	unsigned int cpu = smp_processor_id();
 	int ret;
 
 	ret = cpumask_test_cpu(cpu, &armpmu->supported_cpus);
-	if (ret && armpmu->filter_match)
-		return armpmu->filter_match(event);
+	if (ret && armpmu->filter)
+		return armpmu->filter(event);
 
 	return ret;
 }
@@ -885,14 +885,13 @@ static struct arm_pmu *__armpmu_alloc(gfp_t flags)
 		.start		= armpmu_start,
 		.stop		= armpmu_stop,
 		.read		= armpmu_read,
-		.filter_match	= armpmu_filter_match,
+		.filter		= armpmu_filter,
 		.attr_groups	= pmu->attr_groups,
 		/*
 		 * This is a CPU PMU potentially in a heterogeneous
 		 * configuration (e.g. big.LITTLE). This is not an uncore PMU,
 		 * and we have taken ctx sharing into account (e.g. with our
-		 * pmu::filter_match callback and pmu::event_init group
-		 * validation).
+		 * pmu::filter callback and pmu::event_init group validation).
 		 */
 		.capabilities	= PERF_PMU_CAP_HETEROGENEOUS_CPUS,
 	};
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 0407a38b470a..0f9519874fde 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -99,7 +99,7 @@ struct arm_pmu {
 	void		(*stop)(struct arm_pmu *);
 	void		(*reset)(void *);
 	int		(*map_event)(struct perf_event *event);
-	int		(*filter_match)(struct perf_event *event);
+	bool		(*filter)(struct pmu *pmu, int cpu);
 	int		num_events;
 	bool		secure_access; /* 32-bit ARM only */
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index ee8b9ecdc03b..acc9cf5f1ca4 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -262,6 +262,7 @@ struct hw_perf_event {
 };
 
 struct perf_event;
+struct perf_event_pmu_context;
 
 /*
  * Common implementation detail of pmu::{start,commit,cancel}_txn
@@ -304,7 +305,7 @@ struct pmu {
 	int				capabilities;
 
 	int __percpu			*pmu_disable_count;
-	struct perf_cpu_context __percpu *pmu_cpu_context;
+	struct perf_cpu_pmu_context __percpu *cpu_pmu_context;
 	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
 	int				task_ctx_nr;
 	int				hrtimer_interval_ms;
@@ -439,7 +440,7 @@ struct pmu {
 	/*
 	 * context-switches callback
 	 */
-	void (*sched_task)		(struct perf_event_context *ctx,
+	void (*sched_task)		(struct perf_event_pmu_context *pmu_ctx,
 					bool sched_in);
 
 	/*
@@ -453,8 +454,8 @@ struct pmu {
 	 * implementation and Perf core context switch handling callbacks for usage
 	 * examples.
 	 */
-	void (*swap_task_ctx)		(struct perf_event_context *prev,
-					 struct perf_event_context *next);
+	void (*swap_task_ctx)		(struct perf_event_pmu_context *prev_epc,
+					 struct perf_event_pmu_context *next_epc);
 					/* optional */
 
 	/*
@@ -518,9 +519,10 @@ struct pmu {
 					/* optional */
 
 	/*
-	 * Filter events for PMU-specific reasons.
+	 * Skip programming this PMU on the given CPU. Typically needed for
+	 * big.LITTLE things.
 	 */
-	int (*filter_match)		(struct perf_event *event); /* optional */
+	bool (*filter)			(struct pmu *pmu, int cpu); /* optional */
 
 	/*
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
@@ -675,6 +677,11 @@ struct perf_event {
 	int				group_caps;
 
 	struct perf_event		*group_leader;
+	/*
+	 * event->pmu will always point to pmu in which this event belongs.
+	 * Whereas event->pmu_ctx->pmu may point to other pmu when group of
+	 * different pmu events is created.
+	 */
 	struct pmu			*pmu;
 	void				*pmu_private;
 
@@ -700,6 +707,12 @@ struct perf_event {
 	struct hw_perf_event		hw;
 
 	struct perf_event_context	*ctx;
+	/*
+	 * event->pmu_ctx points to perf_event_pmu_context in which the event
+	 * is added. This pmu_ctx can be of other pmu for sw event when that
+	 * sw event is part of a group which also contains non-sw events.
+	 */
+	struct perf_event_pmu_context	*pmu_ctx;
 	atomic_long_t			refcount;
 
 	/*
@@ -789,19 +802,61 @@ struct perf_event {
 #endif /* CONFIG_PERF_EVENTS */
 };
 
+/*
+ *           ,------------------------[1:n]---------------------.
+ *           V                                                  V
+ * perf_event_context <-[1:n]-> perf_event_pmu_context <--- perf_event
+ *           ^                      ^     |                     |
+ *           `--------[1:n]---------'     `-[n:1]-> pmu <-[1:n]-'
+ *
+ *
+ * XXX destroy epc when empty
+ *   refcount, !rcu
+ *
+ * XXX epc locking
+ *
+ *   event->pmu_ctx            ctx->mutex && inactive
+ *   ctx->pmu_ctx_list         ctx->mutex && ctx->lock
+ *
+ */
+struct perf_event_pmu_context {
+	struct pmu			*pmu;
+	struct perf_event_context       *ctx;
+
+	struct list_head		pmu_ctx_entry;
+
+	struct list_head		pinned_active;
+	struct list_head		flexible_active;
+
+	/* Used to avoid freeing per-cpu perf_event_pmu_context */
+	unsigned int			embedded : 1;
+
+	unsigned int			nr_events;
+
+	atomic_t			refcount; /* event <-> epc */
+
+	void				*task_ctx_data; /* pmu specific data */
+	/*
+	 * Set when one or more (plausibly active) event can't be scheduled
+	 * due to pmu overcommit or pmu constraints, except tolerant to
+	 * events not necessary to be active due to scheduling constraints,
+	 * such as cgroups.
+	 */
+	int				rotate_necessary;
+};
 
 struct perf_event_groups {
 	struct rb_root	tree;
 	u64		index;
 };
 
+
 /**
  * struct perf_event_context - event context structure
  *
  * Used as a container for task events and CPU events as well:
  */
 struct perf_event_context {
-	struct pmu			*pmu;
 	/*
 	 * Protect the states of the events in the list,
 	 * nr_active, and the list:
@@ -814,26 +869,20 @@ struct perf_event_context {
 	 */
 	struct mutex			mutex;
 
-	struct list_head		active_ctx_list;
+	struct list_head		pmu_ctx_list;
 	struct perf_event_groups	pinned_groups;
 	struct perf_event_groups	flexible_groups;
 	struct list_head		event_list;
 
-	struct list_head		pinned_active;
-	struct list_head		flexible_active;
-
 	int				nr_events;
-	int				nr_active;
 	int				nr_user;
 	int				is_active;
+
+	int				nr_task_data;
 	int				nr_stat;
 	int				nr_freq;
 	int				rotate_disable;
-	/*
-	 * Set when nr_events != nr_active, except tolerant to events not
-	 * necessary to be active due to scheduling constraints, such as cgroups.
-	 */
-	int				rotate_necessary;
+
 	refcount_t			refcount;
 	struct task_struct		*task;
 
@@ -855,7 +904,6 @@ struct perf_event_context {
 #ifdef CONFIG_CGROUP_PERF
 	int				nr_cgroups;	 /* cgroup evts */
 #endif
-	void				*task_ctx_data; /* pmu specific data */
 	struct rcu_head			rcu_head;
 };
 
@@ -865,12 +913,13 @@ struct perf_event_context {
  */
 #define PERF_NR_CONTEXTS	4
 
-/**
- * struct perf_cpu_context - per cpu event context structure
- */
-struct perf_cpu_context {
-	struct perf_event_context	ctx;
-	struct perf_event_context	*task_ctx;
+struct perf_cpu_pmu_context {
+	struct perf_event_pmu_context	epc;
+	struct perf_event_pmu_context	*task_epc;
+
+	struct list_head		sched_cb_entry;
+	int				sched_cb_usage;
+
 	int				active_oncpu;
 	int				exclusive;
 
@@ -878,16 +927,20 @@ struct perf_cpu_context {
 	struct hrtimer			hrtimer;
 	ktime_t				hrtimer_interval;
 	unsigned int			hrtimer_active;
+};
+
+/**
+ * struct perf_event_cpu_context - per cpu event context structure
+ */
+struct perf_cpu_context {
+	struct perf_event_context	ctx;
+	struct perf_event_context	*task_ctx;
+	int				online;
 
 #ifdef CONFIG_CGROUP_PERF
 	struct perf_cgroup		*cgrp;
-	struct list_head		cgrp_cpuctx_entry;
 #endif
 
-	struct list_head		sched_cb_entry;
-	int				sched_cb_usage;
-
-	int				online;
 	/*
 	 * Per-CPU storage for iterators used in visit_groups_merge. The default
 	 * storage is of size 2 to hold the CPU and any CPU event iterators.
@@ -1153,7 +1206,7 @@ static inline int is_software_event(struct perf_event *event)
  */
 static inline int in_software_context(struct perf_event *event)
 {
-	return event->ctx->pmu->task_ctx_nr == perf_sw_context;
+	return event->pmu_ctx->pmu->task_ctx_nr == perf_sw_context;
 }
 
 static inline int is_exclusive_pmu(struct pmu *pmu)
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e7b2f8a5c711..21ce9424e27f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1228,7 +1228,7 @@ struct task_struct {
 	unsigned int			futex_state;
 #endif
 #ifdef CONFIG_PERF_EVENTS
-	struct perf_event_context	*perf_event_ctxp[perf_nr_task_contexts];
+	struct perf_event_context	*perf_event_ctxp;
 	struct mutex			perf_event_mutex;
 	struct list_head		perf_event_list;
 #endif
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2621fd24ad26..820c56c66b26 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -154,12 +154,6 @@ static int cpu_function_call(int cpu, remote_function_f func, void *info)
 	return data.ret;
 }
 
-static inline struct perf_cpu_context *
-__get_cpu_context(struct perf_event_context *ctx)
-{
-	return this_cpu_ptr(ctx->pmu->pmu_cpu_context);
-}
-
 static void perf_ctx_lock(struct perf_cpu_context *cpuctx,
 			  struct perf_event_context *ctx)
 {
@@ -183,6 +177,8 @@ static bool is_kernel_event(struct perf_event *event)
 	return READ_ONCE(event->owner) == TASK_TOMBSTONE;
 }
 
+static DEFINE_PER_CPU(struct perf_cpu_context, cpu_context);
+
 /*
  * On task ctx scheduling...
  *
@@ -216,7 +212,7 @@ static int event_function(void *info)
 	struct event_function_struct *efs = info;
 	struct perf_event *event = efs->event;
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct perf_event_context *task_ctx = cpuctx->task_ctx;
 	int ret = 0;
 
@@ -313,7 +309,7 @@ static void event_function_call(struct perf_event *event, event_f func, void *da
 static void event_function_local(struct perf_event *event, event_f func, void *data)
 {
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct task_struct *task = READ_ONCE(ctx->task);
 	struct perf_event_context *task_ctx = NULL;
 
@@ -387,7 +383,6 @@ static DEFINE_MUTEX(perf_sched_mutex);
 static atomic_t perf_sched_count;
 
 static DEFINE_PER_CPU(atomic_t, perf_cgroup_events);
-static DEFINE_PER_CPU(int, perf_sched_cb_usages);
 static DEFINE_PER_CPU(struct pmu_event_list, pmu_sb_events);
 
 static atomic_t nr_mmap_events __read_mostly;
@@ -447,7 +442,7 @@ static void update_perf_cpu_limits(void)
 	WRITE_ONCE(perf_sample_allowed_ns, tmp);
 }
 
-static bool perf_rotate_context(struct perf_cpu_context *cpuctx);
+static bool perf_rotate_context(struct perf_cpu_pmu_context *cpc);
 
 int perf_proc_update_handler(struct ctl_table *table, int write,
 		void *buffer, size_t *lenp, loff_t *ppos)
@@ -570,12 +565,6 @@ void perf_sample_event_took(u64 sample_len_ns)
 
 static atomic64_t perf_event_id;
 
-static void cpu_ctx_sched_out(struct perf_cpu_context *cpuctx,
-			      enum event_type_t event_type);
-
-static void cpu_ctx_sched_in(struct perf_cpu_context *cpuctx,
-			     enum event_type_t event_type);
-
 static void update_context_time(struct perf_event_context *ctx);
 static u64 perf_event_time(struct perf_event *event);
 
@@ -690,13 +679,31 @@ do {									\
 	___p;								\
 })
 
+static void perf_ctx_disable(struct perf_event_context *ctx)
+{
+	struct perf_event_pmu_context *pmu_ctx;
+
+	list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry)
+		perf_pmu_disable(pmu_ctx->pmu);
+}
+
+static void perf_ctx_enable(struct perf_event_context *ctx)
+{
+	struct perf_event_pmu_context *pmu_ctx;
+
+	list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry)
+		perf_pmu_enable(pmu_ctx->pmu);
+}
+
+static void ctx_sched_out(struct perf_event_context *ctx, enum event_type_t event_type);
+static void ctx_sched_in(struct perf_event_context *ctx, enum event_type_t event_type);
+
 #ifdef CONFIG_CGROUP_PERF
 
 static inline bool
 perf_cgroup_match(struct perf_event *event)
 {
-	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 
 	/* @event doesn't care about cgroup */
 	if (!event->cgrp)
@@ -822,54 +829,39 @@ perf_cgroup_set_timestamp(struct perf_cpu_context *cpuctx)
 	}
 }
 
-static DEFINE_PER_CPU(struct list_head, cgrp_cpuctx_list);
-
 /*
  * reschedule events based on the cgroup constraint of task.
  */
 static void perf_cgroup_switch(struct task_struct *task)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct perf_cgroup *cgrp;
-	struct perf_cpu_context *cpuctx, *tmp;
-	struct list_head *list;
-	unsigned long flags;
-
-	/*
-	 * Disable interrupts and preemption to avoid this CPU's
-	 * cgrp_cpuctx_entry to change under us.
-	 */
-	local_irq_save(flags);
 
 	cgrp = perf_cgroup_from_task(task, NULL);
 
-	list = this_cpu_ptr(&cgrp_cpuctx_list);
-	list_for_each_entry_safe(cpuctx, tmp, list, cgrp_cpuctx_entry) {
-		WARN_ON_ONCE(cpuctx->ctx.nr_cgroups == 0);
-		if (READ_ONCE(cpuctx->cgrp) == cgrp)
-			continue;
-
-		perf_ctx_lock(cpuctx, cpuctx->task_ctx);
-		perf_pmu_disable(cpuctx->ctx.pmu);
+	WARN_ON_ONCE(cpuctx->ctx.nr_cgroups == 0);
+	if (READ_ONCE(cpuctx->cgrp) == cgrp)
+		return;
 
-		cpu_ctx_sched_out(cpuctx, EVENT_ALL);
-		/*
-		 * must not be done before ctxswout due
-		 * to update_cgrp_time_from_cpuctx() in
-		 * ctx_sched_out()
-		 */
-		cpuctx->cgrp = cgrp;
-		/*
-		 * set cgrp before ctxsw in to allow
-		 * perf_cgroup_set_timestamp() in ctx_sched_in()
-		 * to not have to pass task around
-		 */
-		cpu_ctx_sched_in(cpuctx, EVENT_ALL);
+	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
+	perf_ctx_disable(&cpuctx->ctx);
 
-		perf_pmu_enable(cpuctx->ctx.pmu);
-		perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
-	}
+	ctx_sched_out(&cpuctx->ctx, EVENT_ALL);
+	/*
+	 * must not be done before ctxswout due
+	 * to update_cgrp_time_from_cpuctx() in
+	 * ctx_sched_out()
+	 */
+	cpuctx->cgrp = cgrp;
+	/*
+	 * set cgrp before ctxsw in to allow
+	 * perf_cgroup_set_timestamp() in ctx_sched_in()
+	 * to not have to pass task around
+	 */
+	ctx_sched_in(&cpuctx->ctx, EVENT_ALL);
 
-	local_irq_restore(flags);
+	perf_ctx_enable(&cpuctx->ctx);
+	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
 }
 
 static int perf_cgroup_ensure_storage(struct perf_event *event,
@@ -887,7 +879,7 @@ static int perf_cgroup_ensure_storage(struct perf_event *event,
 		heap_size++;
 
 	for_each_possible_cpu(cpu) {
-		cpuctx = per_cpu_ptr(event->pmu->pmu_cpu_context, cpu);
+		cpuctx = per_cpu_ptr(&cpu_context, cpu);
 		if (heap_size <= cpuctx->heap_size)
 			continue;
 
@@ -971,8 +963,6 @@ perf_cgroup_event_enable(struct perf_event *event, struct perf_event_context *ct
 		return;
 
 	cpuctx->cgrp = perf_cgroup_from_task(current, ctx);
-	list_add(&cpuctx->cgrp_cpuctx_entry,
-			per_cpu_ptr(&cgrp_cpuctx_list, event->cpu));
 }
 
 static inline void
@@ -993,7 +983,6 @@ perf_cgroup_event_disable(struct perf_event *event, struct perf_event_context *c
 		return;
 
 	cpuctx->cgrp = NULL;
-	list_del(&cpuctx->cgrp_cpuctx_entry);
 }
 
 #else /* !CONFIG_CGROUP_PERF */
@@ -1068,34 +1057,30 @@ static void perf_cgroup_switch(struct task_struct *task)
  */
 static enum hrtimer_restart perf_mux_hrtimer_handler(struct hrtimer *hr)
 {
-	struct perf_cpu_context *cpuctx;
+	struct perf_cpu_pmu_context *cpc;
 	bool rotations;
 
 	lockdep_assert_irqs_disabled();
 
-	cpuctx = container_of(hr, struct perf_cpu_context, hrtimer);
-	rotations = perf_rotate_context(cpuctx);
+	cpc = container_of(hr, struct perf_cpu_pmu_context, hrtimer);
+	rotations = perf_rotate_context(cpc);
 
-	raw_spin_lock(&cpuctx->hrtimer_lock);
+	raw_spin_lock(&cpc->hrtimer_lock);
 	if (rotations)
-		hrtimer_forward_now(hr, cpuctx->hrtimer_interval);
+		hrtimer_forward_now(hr, cpc->hrtimer_interval);
 	else
-		cpuctx->hrtimer_active = 0;
-	raw_spin_unlock(&cpuctx->hrtimer_lock);
+		cpc->hrtimer_active = 0;
+	raw_spin_unlock(&cpc->hrtimer_lock);
 
 	return rotations ? HRTIMER_RESTART : HRTIMER_NORESTART;
 }
 
-static void __perf_mux_hrtimer_init(struct perf_cpu_context *cpuctx, int cpu)
+static void __perf_mux_hrtimer_init(struct perf_cpu_pmu_context *cpc, int cpu)
 {
-	struct hrtimer *timer = &cpuctx->hrtimer;
-	struct pmu *pmu = cpuctx->ctx.pmu;
+	struct hrtimer *timer = &cpc->hrtimer;
+	struct pmu *pmu = cpc->epc.pmu;
 	u64 interval;
 
-	/* no multiplexing needed for SW PMU */
-	if (pmu->task_ctx_nr == perf_sw_context)
-		return;
-
 	/*
 	 * check default is sane, if not set then force to
 	 * default interval (1/tick)
@@ -1104,30 +1089,25 @@ static void __perf_mux_hrtimer_init(struct perf_cpu_context *cpuctx, int cpu)
 	if (interval < 1)
 		interval = pmu->hrtimer_interval_ms = PERF_CPU_HRTIMER;
 
-	cpuctx->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * interval);
+	cpc->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * interval);
 
-	raw_spin_lock_init(&cpuctx->hrtimer_lock);
+	raw_spin_lock_init(&cpc->hrtimer_lock);
 	hrtimer_init(timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINNED_HARD);
 	timer->function = perf_mux_hrtimer_handler;
 }
 
-static int perf_mux_hrtimer_restart(struct perf_cpu_context *cpuctx)
+static int perf_mux_hrtimer_restart(struct perf_cpu_pmu_context *cpc)
 {
-	struct hrtimer *timer = &cpuctx->hrtimer;
-	struct pmu *pmu = cpuctx->ctx.pmu;
+	struct hrtimer *timer = &cpc->hrtimer;
 	unsigned long flags;
 
-	/* not for SW PMU */
-	if (pmu->task_ctx_nr == perf_sw_context)
-		return 0;
-
-	raw_spin_lock_irqsave(&cpuctx->hrtimer_lock, flags);
-	if (!cpuctx->hrtimer_active) {
-		cpuctx->hrtimer_active = 1;
-		hrtimer_forward_now(timer, cpuctx->hrtimer_interval);
+	raw_spin_lock_irqsave(&cpc->hrtimer_lock, flags);
+	if (!cpc->hrtimer_active) {
+		cpc->hrtimer_active = 1;
+		hrtimer_forward_now(timer, cpc->hrtimer_interval);
 		hrtimer_start_expires(timer, HRTIMER_MODE_ABS_PINNED_HARD);
 	}
-	raw_spin_unlock_irqrestore(&cpuctx->hrtimer_lock, flags);
+	raw_spin_unlock_irqrestore(&cpc->hrtimer_lock, flags);
 
 	return 0;
 }
@@ -1146,32 +1126,9 @@ void perf_pmu_enable(struct pmu *pmu)
 		pmu->pmu_enable(pmu);
 }
 
-static DEFINE_PER_CPU(struct list_head, active_ctx_list);
-
-/*
- * perf_event_ctx_activate(), perf_event_ctx_deactivate(), and
- * perf_event_task_tick() are fully serialized because they're strictly cpu
- * affine and perf_event_ctx{activate,deactivate} are called with IRQs
- * disabled, while perf_event_task_tick is called from IRQ context.
- */
-static void perf_event_ctx_activate(struct perf_event_context *ctx)
-{
-	struct list_head *head = this_cpu_ptr(&active_ctx_list);
-
-	lockdep_assert_irqs_disabled();
-
-	WARN_ON(!list_empty(&ctx->active_ctx_list));
-
-	list_add(&ctx->active_ctx_list, head);
-}
-
-static void perf_event_ctx_deactivate(struct perf_event_context *ctx)
+static void perf_assert_pmu_disabled(struct pmu *pmu)
 {
-	lockdep_assert_irqs_disabled();
-
-	WARN_ON(list_empty(&ctx->active_ctx_list));
-
-	list_del_init(&ctx->active_ctx_list);
+	WARN_ON_ONCE(*this_cpu_ptr(pmu->pmu_disable_count) == 0);
 }
 
 static void get_ctx(struct perf_event_context *ctx)
@@ -1198,7 +1155,6 @@ static void free_ctx(struct rcu_head *head)
 	struct perf_event_context *ctx;
 
 	ctx = container_of(head, struct perf_event_context, rcu_head);
-	free_task_ctx_data(ctx->pmu, ctx->task_ctx_data);
 	kfree(ctx);
 }
 
@@ -1383,7 +1339,7 @@ static u64 primary_event_id(struct perf_event *event)
  * the context could get moved to another task.
  */
 static struct perf_event_context *
-perf_lock_task_context(struct task_struct *task, int ctxn, unsigned long *flags)
+perf_lock_task_context(struct task_struct *task, unsigned long *flags)
 {
 	struct perf_event_context *ctx;
 
@@ -1399,7 +1355,7 @@ perf_lock_task_context(struct task_struct *task, int ctxn, unsigned long *flags)
 	 */
 	local_irq_save(*flags);
 	rcu_read_lock();
-	ctx = rcu_dereference(task->perf_event_ctxp[ctxn]);
+	ctx = rcu_dereference(task->perf_event_ctxp);
 	if (ctx) {
 		/*
 		 * If this context is a clone of another, it might
@@ -1412,7 +1368,7 @@ perf_lock_task_context(struct task_struct *task, int ctxn, unsigned long *flags)
 		 * can't get swapped on us any more.
 		 */
 		raw_spin_lock(&ctx->lock);
-		if (ctx != rcu_dereference(task->perf_event_ctxp[ctxn])) {
+		if (ctx != rcu_dereference(task->perf_event_ctxp)) {
 			raw_spin_unlock(&ctx->lock);
 			rcu_read_unlock();
 			local_irq_restore(*flags);
@@ -1439,12 +1395,12 @@ perf_lock_task_context(struct task_struct *task, int ctxn, unsigned long *flags)
  * reference count so that the context can't get freed.
  */
 static struct perf_event_context *
-perf_pin_task_context(struct task_struct *task, int ctxn)
+perf_pin_task_context(struct task_struct *task)
 {
 	struct perf_event_context *ctx;
 	unsigned long flags;
 
-	ctx = perf_lock_task_context(task, ctxn, &flags);
+	ctx = perf_lock_task_context(task, &flags);
 	if (ctx) {
 		++ctx->pin_count;
 		raw_spin_unlock_irqrestore(&ctx->lock, flags);
@@ -1590,14 +1546,22 @@ static inline struct cgroup *event_cgroup(const struct perf_event *event)
  * which provides ordering when rotating groups for the same CPU.
  */
 static __always_inline int
-perf_event_groups_cmp(const int left_cpu, const struct cgroup *left_cgroup,
-		      const u64 left_group_index, const struct perf_event *right)
+perf_event_groups_cmp(const int left_cpu, const struct pmu *left_pmu,
+		      const struct cgroup *left_cgroup, const u64 left_group_index,
+		      const struct perf_event *right)
 {
 	if (left_cpu < right->cpu)
 		return -1;
 	if (left_cpu > right->cpu)
 		return 1;
 
+	if (left_pmu) {
+		if (left_pmu < right->pmu_ctx->pmu)
+			return -1;
+		if (left_pmu > right->pmu_ctx->pmu)
+			return 1;
+	}
+
 #ifdef CONFIG_CGROUP_PERF
 	{
 		const struct cgroup *right_cgroup = event_cgroup(right);
@@ -1640,12 +1604,13 @@ perf_event_groups_cmp(const int left_cpu, const struct cgroup *left_cgroup,
 static inline bool __group_less(struct rb_node *a, const struct rb_node *b)
 {
 	struct perf_event *e = __node_2_pe(a);
-	return perf_event_groups_cmp(e->cpu, event_cgroup(e), e->group_index,
-				     __node_2_pe(b)) < 0;
+	return perf_event_groups_cmp(e->cpu, e->pmu_ctx->pmu, event_cgroup(e),
+				     e->group_index, __node_2_pe(b)) < 0;
 }
 
 struct __group_key {
 	int cpu;
+	struct pmu *pmu;
 	struct cgroup *cgroup;
 };
 
@@ -1654,14 +1619,25 @@ static inline int __group_cmp(const void *key, const struct rb_node *node)
 	const struct __group_key *a = key;
 	const struct perf_event *b = __node_2_pe(node);
 
-	/* partial/subtree match: @cpu, @cgroup; ignore: @group_index */
-	return perf_event_groups_cmp(a->cpu, a->cgroup, b->group_index, b);
+	/* partial/subtree match: @cpu, @pmu, @cgroup; ignore: @group_index */
+	return perf_event_groups_cmp(a->cpu, a->pmu, a->cgroup, b->group_index, b);
+}
+
+static inline int
+__group_cmp_ignore_cgroup(const void *key, const struct rb_node *node)
+{
+	const struct __group_key *a = key;
+	const struct perf_event *b = __node_2_pe(node);
+
+	/* partial/subtree match: @cpu, @pmu, ignore: @cgroup, @group_index */
+	return perf_event_groups_cmp(a->cpu, a->pmu, event_cgroup(b),
+				     b->group_index, b);
 }
 
 /*
- * Insert @event into @groups' tree; using {@event->cpu, ++@groups->index} for
- * key (see perf_event_groups_less). This places it last inside the CPU
- * subtree.
+ * Insert @event into @groups' tree; using
+ *   {@event->cpu, @event->pmu_ctx->pmu, event_cgroup(@event), ++@groups->index}
+ * as key. This places it last inside the {cpu,pmu,cgroup} subtree.
  */
 static void
 perf_event_groups_insert(struct perf_event_groups *groups,
@@ -1711,14 +1687,15 @@ del_event_from_groups(struct perf_event *event, struct perf_event_context *ctx)
 }
 
 /*
- * Get the leftmost event in the cpu/cgroup subtree.
+ * Get the leftmost event in the {cpu,pmu,cgroup} subtree.
  */
 static struct perf_event *
 perf_event_groups_first(struct perf_event_groups *groups, int cpu,
-			struct cgroup *cgrp)
+			struct pmu *pmu, struct cgroup *cgrp)
 {
 	struct __group_key key = {
 		.cpu = cpu,
+		.pmu = pmu,
 		.cgroup = cgrp,
 	};
 	struct rb_node *node;
@@ -1730,14 +1707,12 @@ perf_event_groups_first(struct perf_event_groups *groups, int cpu,
 	return NULL;
 }
 
-/*
- * Like rb_entry_next_safe() for the @cpu subtree.
- */
 static struct perf_event *
-perf_event_groups_next(struct perf_event *event)
+perf_event_groups_next(struct perf_event *event, struct pmu *pmu)
 {
 	struct __group_key key = {
 		.cpu = event->cpu,
+		.pmu = pmu,
 		.cgroup = event_cgroup(event),
 	};
 	struct rb_node *next;
@@ -1793,6 +1768,7 @@ list_add_event(struct perf_event *event, struct perf_event_context *ctx)
 		perf_cgroup_event_enable(event, ctx);
 
 	ctx->generation++;
+	event->pmu_ctx->nr_events++;
 }
 
 /*
@@ -1938,7 +1914,8 @@ static void perf_group_attach(struct perf_event *event)
 	lockdep_assert_held(&event->ctx->lock);
 
 	/*
-	 * We can have double attach due to group movement in perf_event_open.
+	 * We can have double attach due to group movement (move_group) in
+	 * perf_event_open().
 	 */
 	if (event->attach_state & PERF_ATTACH_GROUP)
 		return;
@@ -2003,6 +1980,7 @@ list_del_event(struct perf_event *event, struct perf_event_context *ctx)
 	}
 
 	ctx->generation++;
+	event->pmu_ctx->nr_events--;
 }
 
 static int
@@ -2019,13 +1997,11 @@ perf_aux_output_match(struct perf_event *event, struct perf_event *aux_event)
 
 static void put_event(struct perf_event *event);
 static void event_sched_out(struct perf_event *event,
-			    struct perf_cpu_context *cpuctx,
 			    struct perf_event_context *ctx);
 
 static void perf_put_aux_event(struct perf_event *event)
 {
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
 	struct perf_event *iter;
 
 	/*
@@ -2054,7 +2030,7 @@ static void perf_put_aux_event(struct perf_event *event)
 		 * state so that we don't try to schedule it again. Note
 		 * that perf_event_enable() will clear the ERROR status.
 		 */
-		event_sched_out(iter, cpuctx, ctx);
+		event_sched_out(iter, ctx);
 		perf_event_set_state(event, PERF_EVENT_STATE_ERROR);
 	}
 }
@@ -2105,8 +2081,8 @@ static int perf_get_aux_event(struct perf_event *event,
 
 static inline struct list_head *get_event_list(struct perf_event *event)
 {
-	struct perf_event_context *ctx = event->ctx;
-	return event->attr.pinned ? &ctx->pinned_active : &ctx->flexible_active;
+	return event->attr.pinned ? &event->pmu_ctx->pinned_active :
+				    &event->pmu_ctx->flexible_active;
 }
 
 /*
@@ -2117,10 +2093,7 @@ static inline struct list_head *get_event_list(struct perf_event *event)
  */
 static inline void perf_remove_sibling_event(struct perf_event *event)
 {
-	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
-
-	event_sched_out(event, cpuctx, ctx);
+	event_sched_out(event, event->ctx);
 	perf_event_set_state(event, PERF_EVENT_STATE_ERROR);
 }
 
@@ -2209,47 +2182,22 @@ static bool is_orphaned_event(struct perf_event *event)
 	return event->state == PERF_EVENT_STATE_DEAD;
 }
 
-static inline int __pmu_filter_match(struct perf_event *event)
-{
-	struct pmu *pmu = event->pmu;
-	return pmu->filter_match ? pmu->filter_match(event) : 1;
-}
-
-/*
- * Check whether we should attempt to schedule an event group based on
- * PMU-specific filtering. An event group can consist of HW and SW events,
- * potentially with a SW leader, so we must check all the filters, to
- * determine whether a group is schedulable:
- */
-static inline int pmu_filter_match(struct perf_event *event)
-{
-	struct perf_event *sibling;
-
-	if (!__pmu_filter_match(event))
-		return 0;
-
-	for_each_sibling_event(sibling, event) {
-		if (!__pmu_filter_match(sibling))
-			return 0;
-	}
-
-	return 1;
-}
-
 static inline int
 event_filter_match(struct perf_event *event)
 {
 	return (event->cpu == -1 || event->cpu == smp_processor_id()) &&
-	       perf_cgroup_match(event) && pmu_filter_match(event);
+	       perf_cgroup_match(event);
 }
 
 static void
-event_sched_out(struct perf_event *event,
-		  struct perf_cpu_context *cpuctx,
-		  struct perf_event_context *ctx)
+event_sched_out(struct perf_event *event, struct perf_event_context *ctx)
 {
+	struct perf_event_pmu_context *epc = event->pmu_ctx;
+	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
 	enum perf_event_state state = PERF_EVENT_STATE_INACTIVE;
 
+	// XXX cpc serialization, probably per-cpu IRQ disabled
+
 	WARN_ON_ONCE(event->ctx != ctx);
 	lockdep_assert_held(&ctx->lock);
 
@@ -2276,38 +2224,32 @@ event_sched_out(struct perf_event *event,
 	perf_event_set_state(event, state);
 
 	if (!is_software_event(event))
-		cpuctx->active_oncpu--;
-	if (!--ctx->nr_active)
-		perf_event_ctx_deactivate(ctx);
+		cpc->active_oncpu--;
 	if (event->attr.freq && event->attr.sample_freq)
 		ctx->nr_freq--;
-	if (event->attr.exclusive || !cpuctx->active_oncpu)
-		cpuctx->exclusive = 0;
+	if (event->attr.exclusive || !cpc->active_oncpu)
+		cpc->exclusive = 0;
 
 	perf_pmu_enable(event->pmu);
 }
 
 static void
-group_sched_out(struct perf_event *group_event,
-		struct perf_cpu_context *cpuctx,
-		struct perf_event_context *ctx)
+group_sched_out(struct perf_event *group_event, struct perf_event_context *ctx)
 {
 	struct perf_event *event;
 
 	if (group_event->state != PERF_EVENT_STATE_ACTIVE)
 		return;
 
-	perf_pmu_disable(ctx->pmu);
+	perf_assert_pmu_disabled(group_event->pmu_ctx->pmu);
 
-	event_sched_out(group_event, cpuctx, ctx);
+	event_sched_out(group_event, ctx);
 
 	/*
 	 * Schedule out siblings (if any):
 	 */
 	for_each_sibling_event(event, group_event)
-		event_sched_out(event, cpuctx, ctx);
-
-	perf_pmu_enable(ctx->pmu);
+		event_sched_out(event, ctx);
 }
 
 #define DETACH_GROUP	0x01UL
@@ -2325,6 +2267,7 @@ __perf_remove_from_context(struct perf_event *event,
 			   struct perf_event_context *ctx,
 			   void *info)
 {
+	struct perf_event_pmu_context *pmu_ctx = event->pmu_ctx;
 	unsigned long flags = (unsigned long)info;
 
 	if (ctx->is_active & EVENT_TIME) {
@@ -2332,19 +2275,30 @@ __perf_remove_from_context(struct perf_event *event,
 		update_cgrp_time_from_cpuctx(cpuctx, false);
 	}
 
-	event_sched_out(event, cpuctx, ctx);
+	event_sched_out(event, ctx);
 	if (flags & DETACH_GROUP)
 		perf_group_detach(event);
 	if (flags & DETACH_CHILD)
 		perf_child_detach(event);
 	list_del_event(event, ctx);
 
+	if (!pmu_ctx->nr_events) {
+		pmu_ctx->rotate_necessary = 0;
+
+		if (ctx->task && ctx->is_active) {
+			struct perf_cpu_pmu_context *cpc;
+
+			cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
+			WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
+			cpc->task_epc = NULL;
+		}
+	}
+
 	if (!ctx->nr_events && ctx->is_active) {
 		if (ctx == &cpuctx->ctx)
 			update_cgrp_time_from_cpuctx(cpuctx, true);
 
 		ctx->is_active = 0;
-		ctx->rotate_necessary = 0;
 		if (ctx->task) {
 			WARN_ON_ONCE(cpuctx->task_ctx != ctx);
 			cpuctx->task_ctx = NULL;
@@ -2374,12 +2328,8 @@ static void perf_remove_from_context(struct perf_event *event, unsigned long fla
 	 * event_function_call() user.
 	 */
 	raw_spin_lock_irq(&ctx->lock);
-	/*
-	 * Cgroup events are per-cpu events, and must IPI because of
-	 * cgrp_cpuctx_list.
-	 */
-	if (!ctx->is_active && !is_cgroup_event(event)) {
-		__perf_remove_from_context(event, __get_cpu_context(ctx),
+	if (!ctx->is_active) {
+		__perf_remove_from_context(event, this_cpu_ptr(&cpu_context),
 					   ctx, (void *)flags);
 		raw_spin_unlock_irq(&ctx->lock);
 		return;
@@ -2405,13 +2355,17 @@ static void __perf_event_disable(struct perf_event *event,
 		update_cgrp_time_from_event(event);
 	}
 
+	perf_pmu_disable(event->pmu_ctx->pmu);
+
 	if (event == event->group_leader)
-		group_sched_out(event, cpuctx, ctx);
+		group_sched_out(event, ctx);
 	else
-		event_sched_out(event, cpuctx, ctx);
+		event_sched_out(event, ctx);
 
 	perf_event_set_state(event, PERF_EVENT_STATE_OFF);
 	perf_cgroup_event_disable(event, ctx);
+
+	perf_pmu_enable(event->pmu_ctx->pmu);
 }
 
 /*
@@ -2474,10 +2428,10 @@ static void perf_log_throttle(struct perf_event *event, int enable);
 static void perf_log_itrace_start(struct perf_event *event);
 
 static int
-event_sched_in(struct perf_event *event,
-		 struct perf_cpu_context *cpuctx,
-		 struct perf_event_context *ctx)
+event_sched_in(struct perf_event *event, struct perf_event_context *ctx)
 {
+	struct perf_event_pmu_context *epc = event->pmu_ctx;
+	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
 	int ret = 0;
 
 	WARN_ON_ONCE(event->ctx != ctx);
@@ -2518,14 +2472,12 @@ event_sched_in(struct perf_event *event,
 	}
 
 	if (!is_software_event(event))
-		cpuctx->active_oncpu++;
-	if (!ctx->nr_active++)
-		perf_event_ctx_activate(ctx);
+		cpc->active_oncpu++;
 	if (event->attr.freq && event->attr.sample_freq)
 		ctx->nr_freq++;
 
 	if (event->attr.exclusive)
-		cpuctx->exclusive = 1;
+		cpc->exclusive = 1;
 
 out:
 	perf_pmu_enable(event->pmu);
@@ -2534,26 +2486,24 @@ event_sched_in(struct perf_event *event,
 }
 
 static int
-group_sched_in(struct perf_event *group_event,
-	       struct perf_cpu_context *cpuctx,
-	       struct perf_event_context *ctx)
+group_sched_in(struct perf_event *group_event, struct perf_event_context *ctx)
 {
 	struct perf_event *event, *partial_group = NULL;
-	struct pmu *pmu = ctx->pmu;
+	struct pmu *pmu = group_event->pmu_ctx->pmu;
 
 	if (group_event->state == PERF_EVENT_STATE_OFF)
 		return 0;
 
 	pmu->start_txn(pmu, PERF_PMU_TXN_ADD);
 
-	if (event_sched_in(group_event, cpuctx, ctx))
+	if (event_sched_in(group_event, ctx))
 		goto error;
 
 	/*
 	 * Schedule in siblings as one group (if any):
 	 */
 	for_each_sibling_event(event, group_event) {
-		if (event_sched_in(event, cpuctx, ctx)) {
+		if (event_sched_in(event, ctx)) {
 			partial_group = event;
 			goto group_error;
 		}
@@ -2572,9 +2522,9 @@ group_sched_in(struct perf_event *group_event,
 		if (event == partial_group)
 			break;
 
-		event_sched_out(event, cpuctx, ctx);
+		event_sched_out(event, ctx);
 	}
-	event_sched_out(group_event, cpuctx, ctx);
+	event_sched_out(group_event, ctx);
 
 error:
 	pmu->cancel_txn(pmu);
@@ -2584,10 +2534,11 @@ group_sched_in(struct perf_event *group_event,
 /*
  * Work out whether we can put this event group on the CPU now.
  */
-static int group_can_go_on(struct perf_event *event,
-			   struct perf_cpu_context *cpuctx,
-			   int can_add_hw)
+static int group_can_go_on(struct perf_event *event, int can_add_hw)
 {
+	struct perf_event_pmu_context *epc = event->pmu_ctx;
+	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
+
 	/*
 	 * Groups consisting entirely of software events can always go on.
 	 */
@@ -2597,7 +2548,7 @@ static int group_can_go_on(struct perf_event *event,
 	 * If an exclusive group is already on, no other hardware
 	 * events can go on.
 	 */
-	if (cpuctx->exclusive)
+	if (cpc->exclusive)
 		return 0;
 	/*
 	 * If this group is exclusive and there are already
@@ -2619,36 +2570,29 @@ static void add_event_to_ctx(struct perf_event *event,
 	perf_group_attach(event);
 }
 
-static void ctx_sched_out(struct perf_event_context *ctx,
-			  struct perf_cpu_context *cpuctx,
-			  enum event_type_t event_type);
-static void
-ctx_sched_in(struct perf_event_context *ctx,
-	     struct perf_cpu_context *cpuctx,
-	     enum event_type_t event_type);
-
-static void task_ctx_sched_out(struct perf_cpu_context *cpuctx,
-			       struct perf_event_context *ctx,
-			       enum event_type_t event_type)
+static void task_ctx_sched_out(struct perf_event_context *ctx,
+				enum event_type_t event_type)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+
 	if (!cpuctx->task_ctx)
 		return;
 
 	if (WARN_ON_ONCE(ctx != cpuctx->task_ctx))
 		return;
 
-	ctx_sched_out(ctx, cpuctx, event_type);
+	ctx_sched_out(ctx, event_type);
 }
 
 static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
 				struct perf_event_context *ctx)
 {
-	cpu_ctx_sched_in(cpuctx, EVENT_PINNED);
+	ctx_sched_in(&cpuctx->ctx, EVENT_PINNED);
 	if (ctx)
-		ctx_sched_in(ctx, cpuctx, EVENT_PINNED);
-	cpu_ctx_sched_in(cpuctx, EVENT_FLEXIBLE);
+		 ctx_sched_in(ctx, EVENT_PINNED);
+	ctx_sched_in(&cpuctx->ctx, EVENT_FLEXIBLE);
 	if (ctx)
-		ctx_sched_in(ctx, cpuctx, EVENT_FLEXIBLE);
+		 ctx_sched_in(ctx, EVENT_FLEXIBLE);
 }
 
 /*
@@ -2666,11 +2610,15 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
+/*
+ * XXX: ctx_resched() reschedule entire perf_event_context while adding new
+ * event to the context or enabling existing event in the context. We can
+ * probably optimize it by rescheduling only affected pmu_ctx.
+ */
 static void ctx_resched(struct perf_cpu_context *cpuctx,
 			struct perf_event_context *task_ctx,
 			enum event_type_t event_type)
 {
-	enum event_type_t ctx_event_type;
 	bool cpu_event = !!(event_type & EVENT_CPU);
 
 	/*
@@ -2680,11 +2628,13 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	if (event_type & EVENT_PINNED)
 		event_type |= EVENT_FLEXIBLE;
 
-	ctx_event_type = event_type & EVENT_ALL;
+	event_type &= EVENT_ALL;
 
-	perf_pmu_disable(cpuctx->ctx.pmu);
-	if (task_ctx)
-		task_ctx_sched_out(cpuctx, task_ctx, event_type);
+	perf_ctx_disable(&cpuctx->ctx);
+	if (task_ctx) {
+		perf_ctx_disable(task_ctx);
+		task_ctx_sched_out(task_ctx, event_type);
+	}
 
 	/*
 	 * Decide which cpu ctx groups to schedule out based on the types
@@ -2694,17 +2644,20 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	 *  - otherwise, do nothing more.
 	 */
 	if (cpu_event)
-		cpu_ctx_sched_out(cpuctx, ctx_event_type);
-	else if (ctx_event_type & EVENT_PINNED)
-		cpu_ctx_sched_out(cpuctx, EVENT_FLEXIBLE);
+		ctx_sched_out(&cpuctx->ctx, event_type);
+	else if (event_type & EVENT_PINNED)
+		ctx_sched_out(&cpuctx->ctx, EVENT_FLEXIBLE);
 
 	perf_event_sched_in(cpuctx, task_ctx);
-	perf_pmu_enable(cpuctx->ctx.pmu);
+
+	perf_ctx_enable(&cpuctx->ctx);
+	if (task_ctx)
+		perf_ctx_enable(task_ctx);
 }
 
 void perf_pmu_resched(struct pmu *pmu)
 {
-	struct perf_cpu_context *cpuctx = this_cpu_ptr(pmu->pmu_cpu_context);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct perf_event_context *task_ctx = cpuctx->task_ctx;
 
 	perf_ctx_lock(cpuctx, task_ctx);
@@ -2722,7 +2675,7 @@ static int  __perf_install_in_context(void *info)
 {
 	struct perf_event *event = info;
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct perf_event_context *task_ctx = cpuctx->task_ctx;
 	bool reprogram = true;
 	int ret = 0;
@@ -2764,7 +2717,7 @@ static int  __perf_install_in_context(void *info)
 #endif
 
 	if (reprogram) {
-		ctx_sched_out(ctx, cpuctx, EVENT_TIME);
+		ctx_sched_out(ctx, EVENT_TIME);
 		add_event_to_ctx(event, ctx);
 		ctx_resched(cpuctx, task_ctx, get_event_type(event));
 	} else {
@@ -2809,8 +2762,6 @@ perf_install_in_context(struct perf_event_context *ctx,
 	 * perf_event_attr::disabled events will not run and can be initialized
 	 * without IPI. Except when this is the first event for the context, in
 	 * that case we need the magic of the IPI to set ctx->is_active.
-	 * Similarly, cgroup events for the context also needs the IPI to
-	 * manipulate the cgrp_cpuctx_list.
 	 *
 	 * The IOC_ENABLE that is sure to follow the creation of a disabled
 	 * event will issue the IPI and reprogram the hardware.
@@ -2912,7 +2863,7 @@ static void __perf_event_enable(struct perf_event *event,
 		return;
 
 	if (ctx->is_active)
-		ctx_sched_out(ctx, cpuctx, EVENT_TIME);
+		ctx_sched_out(ctx, EVENT_TIME);
 
 	perf_event_set_state(event, PERF_EVENT_STATE_INACTIVE);
 	perf_cgroup_event_enable(event, ctx);
@@ -2921,7 +2872,7 @@ static void __perf_event_enable(struct perf_event *event,
 		return;
 
 	if (!event_filter_match(event)) {
-		ctx_sched_in(ctx, cpuctx, EVENT_TIME);
+		ctx_sched_in(ctx, EVENT_TIME);
 		return;
 	}
 
@@ -2930,7 +2881,7 @@ static void __perf_event_enable(struct perf_event *event,
 	 * then don't put it on unless the group is on.
 	 */
 	if (leader != event && leader->state != PERF_EVENT_STATE_ACTIVE) {
-		ctx_sched_in(ctx, cpuctx, EVENT_TIME);
+		ctx_sched_in(ctx, EVENT_TIME);
 		return;
 	}
 
@@ -3199,11 +3150,52 @@ static int perf_event_modify_attr(struct perf_event *event,
 	return err;
 }
 
-static void ctx_sched_out(struct perf_event_context *ctx,
-			  struct perf_cpu_context *cpuctx,
-			  enum event_type_t event_type)
+static void __pmu_ctx_sched_out(struct perf_event_pmu_context *pmu_ctx,
+				enum event_type_t event_type)
 {
+	struct perf_event_context *ctx = pmu_ctx->ctx;
 	struct perf_event *event, *tmp;
+	struct pmu *pmu = pmu_ctx->pmu;
+
+	if (ctx->task && !ctx->is_active) {
+		struct perf_cpu_pmu_context *cpc;
+
+		cpc = this_cpu_ptr(pmu->cpu_pmu_context);
+		WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
+		cpc->task_epc = NULL;
+	}
+
+	if (!event_type)
+		return;
+
+	perf_pmu_disable(pmu);
+	if (event_type & EVENT_PINNED) {
+		list_for_each_entry_safe(event, tmp,
+				&pmu_ctx->pinned_active,
+				active_list)
+			group_sched_out(event, ctx);
+	}
+
+	if (event_type & EVENT_FLEXIBLE) {
+		list_for_each_entry_safe(event, tmp,
+				&pmu_ctx->flexible_active,
+				active_list)
+			group_sched_out(event, ctx);
+		/*
+		 * Since we cleared EVENT_FLEXIBLE, also clear
+		 * rotate_necessary, is will be reset by
+		 * ctx_flexible_sched_in() when needed.
+		 */
+		pmu_ctx->rotate_necessary = 0;
+	}
+	perf_pmu_enable(pmu);
+}
+
+static void
+ctx_sched_out(struct perf_event_context *ctx, enum event_type_t event_type)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+	struct perf_event_pmu_context *pmu_ctx;
 	int is_active = ctx->is_active;
 
 	lockdep_assert_held(&ctx->lock);
@@ -3251,27 +3243,8 @@ static void ctx_sched_out(struct perf_event_context *ctx,
 
 	is_active ^= ctx->is_active; /* changed bits */
 
-	if (!ctx->nr_active || !(is_active & EVENT_ALL))
-		return;
-
-	perf_pmu_disable(ctx->pmu);
-	if (is_active & EVENT_PINNED) {
-		list_for_each_entry_safe(event, tmp, &ctx->pinned_active, active_list)
-			group_sched_out(event, cpuctx, ctx);
-	}
-
-	if (is_active & EVENT_FLEXIBLE) {
-		list_for_each_entry_safe(event, tmp, &ctx->flexible_active, active_list)
-			group_sched_out(event, cpuctx, ctx);
-
-		/*
-		 * Since we cleared EVENT_FLEXIBLE, also clear
-		 * rotate_necessary, is will be reset by
-		 * ctx_flexible_sched_in() when needed.
-		 */
-		ctx->rotate_necessary = 0;
-	}
-	perf_pmu_enable(ctx->pmu);
+	list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry)
+		__pmu_ctx_sched_out(pmu_ctx, is_active);
 }
 
 /*
@@ -3376,26 +3349,65 @@ static void perf_event_sync_stat(struct perf_event_context *ctx,
 	}
 }
 
-static void perf_event_context_sched_out(struct task_struct *task, int ctxn,
-					 struct task_struct *next)
+static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
+					  struct perf_event_context *next_ctx)
+{
+	struct perf_event_pmu_context *prev_epc, *next_epc;
+
+	if (!prev_ctx->nr_task_data)
+		return;
+
+	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
+				    struct perf_event_pmu_context,
+				    pmu_ctx_entry);
+	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
+				    struct perf_event_pmu_context,
+				    pmu_ctx_entry);
+
+	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
+	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
+
+		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
+
+		/*
+		 * PMU specific parts of task perf context can require
+		 * additional synchronization. As an example of such
+		 * synchronization see implementation details of Intel
+		 * LBR call stack data profiling;
+		 */
+		if (prev_epc->pmu->swap_task_ctx)
+			prev_epc->pmu->swap_task_ctx(prev_epc, next_epc);
+		else
+			swap(prev_epc->task_ctx_data, next_epc->task_ctx_data);
+	}
+}
+
+static void perf_ctx_sched_task_cb(struct perf_event_context *ctx, bool sched_in)
+{
+	struct perf_event_pmu_context *pmu_ctx;
+	struct perf_cpu_pmu_context *cpc;
+
+	list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
+		cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
+
+		if (cpc->sched_cb_usage && pmu_ctx->pmu->sched_task)
+			pmu_ctx->pmu->sched_task(pmu_ctx, sched_in);
+	}
+}
+
+static void
+perf_event_context_sched_out(struct task_struct *task, struct task_struct *next)
 {
-	struct perf_event_context *ctx = task->perf_event_ctxp[ctxn];
+	struct perf_event_context *ctx = task->perf_event_ctxp;
 	struct perf_event_context *next_ctx;
 	struct perf_event_context *parent, *next_parent;
-	struct perf_cpu_context *cpuctx;
 	int do_switch = 1;
-	struct pmu *pmu;
 
 	if (likely(!ctx))
 		return;
 
-	pmu = ctx->pmu;
-	cpuctx = __get_cpu_context(ctx);
-	if (!cpuctx->task_ctx)
-		return;
-
 	rcu_read_lock();
-	next_ctx = next->perf_event_ctxp[ctxn];
+	next_ctx = rcu_dereference(next->perf_event_ctxp);
 	if (!next_ctx)
 		goto unlock;
 
@@ -3423,23 +3435,12 @@ static void perf_event_context_sched_out(struct task_struct *task, int ctxn,
 			WRITE_ONCE(ctx->task, next);
 			WRITE_ONCE(next_ctx->task, task);
 
-			perf_pmu_disable(pmu);
+			perf_ctx_disable(ctx);
 
-			if (cpuctx->sched_cb_usage && pmu->sched_task)
-				pmu->sched_task(ctx, false);
+			perf_ctx_sched_task_cb(ctx, false);
+			perf_event_swap_task_ctx_data(ctx, next_ctx);
 
-			/*
-			 * PMU specific parts of task perf context can require
-			 * additional synchronization. As an example of such
-			 * synchronization see implementation details of Intel
-			 * LBR call stack data profiling;
-			 */
-			if (pmu->swap_task_ctx)
-				pmu->swap_task_ctx(ctx, next_ctx);
-			else
-				swap(ctx->task_ctx_data, next_ctx->task_ctx_data);
-
-			perf_pmu_enable(pmu);
+			perf_ctx_enable(ctx);
 
 			/*
 			 * RCU_INIT_POINTER here is safe because we've not
@@ -3448,8 +3449,8 @@ static void perf_event_context_sched_out(struct task_struct *task, int ctxn,
 			 * since those values are always verified under
 			 * ctx->lock which we're now holding.
 			 */
-			RCU_INIT_POINTER(task->perf_event_ctxp[ctxn], next_ctx);
-			RCU_INIT_POINTER(next->perf_event_ctxp[ctxn], ctx);
+			RCU_INIT_POINTER(task->perf_event_ctxp, next_ctx);
+			RCU_INIT_POINTER(next->perf_event_ctxp, ctx);
 
 			do_switch = 0;
 
@@ -3463,37 +3464,39 @@ static void perf_event_context_sched_out(struct task_struct *task, int ctxn,
 
 	if (do_switch) {
 		raw_spin_lock(&ctx->lock);
-		perf_pmu_disable(pmu);
+		perf_ctx_disable(ctx);
 
-		if (cpuctx->sched_cb_usage && pmu->sched_task)
-			pmu->sched_task(ctx, false);
-		task_ctx_sched_out(cpuctx, ctx, EVENT_ALL);
+		perf_ctx_sched_task_cb(ctx, false);
+		task_ctx_sched_out(ctx, EVENT_ALL);
 
-		perf_pmu_enable(pmu);
+		perf_ctx_enable(ctx);
 		raw_spin_unlock(&ctx->lock);
 	}
 }
 
 static DEFINE_PER_CPU(struct list_head, sched_cb_list);
+static DEFINE_PER_CPU(int, perf_sched_cb_usages);
 
 void perf_sched_cb_dec(struct pmu *pmu)
 {
-	struct perf_cpu_context *cpuctx = this_cpu_ptr(pmu->pmu_cpu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(pmu->cpu_pmu_context);
 
 	this_cpu_dec(perf_sched_cb_usages);
+	barrier();
 
-	if (!--cpuctx->sched_cb_usage)
-		list_del(&cpuctx->sched_cb_entry);
+	if (!--cpc->sched_cb_usage)
+		list_del(&cpc->sched_cb_entry);
 }
 
 
 void perf_sched_cb_inc(struct pmu *pmu)
 {
-	struct perf_cpu_context *cpuctx = this_cpu_ptr(pmu->pmu_cpu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(pmu->cpu_pmu_context);
 
-	if (!cpuctx->sched_cb_usage++)
-		list_add(&cpuctx->sched_cb_entry, this_cpu_ptr(&sched_cb_list));
+	if (!cpc->sched_cb_usage++)
+		list_add(&cpc->sched_cb_entry, this_cpu_ptr(&sched_cb_list));
 
+	barrier();
 	this_cpu_inc(perf_sched_cb_usages);
 }
 
@@ -3505,19 +3508,21 @@ void perf_sched_cb_inc(struct pmu *pmu)
  * PEBS requires this to provide PID/TID information. This requires we flush
  * all queued PEBS records before we context switch to a new task.
  */
-static void __perf_pmu_sched_task(struct perf_cpu_context *cpuctx, bool sched_in)
+static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc, bool sched_in)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct pmu *pmu;
 
-	pmu = cpuctx->ctx.pmu; /* software PMUs will not have sched_task */
+	pmu = cpc->epc.pmu;
 
+	/* software PMUs will not have sched_task */
 	if (WARN_ON_ONCE(!pmu->sched_task))
 		return;
 
 	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
 	perf_pmu_disable(pmu);
 
-	pmu->sched_task(cpuctx->task_ctx, sched_in);
+	pmu->sched_task(cpc->task_epc, sched_in);
 
 	perf_pmu_enable(pmu);
 	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
@@ -3527,26 +3532,20 @@ static void perf_pmu_sched_task(struct task_struct *prev,
 				struct task_struct *next,
 				bool sched_in)
 {
-	struct perf_cpu_context *cpuctx;
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+	struct perf_cpu_pmu_context *cpc;
 
-	if (prev == next)
+	/* cpuctx->task_ctx will be handled in perf_event_context_sched_in/out */
+	if (prev == next || cpuctx->task_ctx)
 		return;
 
-	list_for_each_entry(cpuctx, this_cpu_ptr(&sched_cb_list), sched_cb_entry) {
-		/* will be handled in perf_event_context_sched_in/out */
-		if (cpuctx->task_ctx)
-			continue;
-
-		__perf_pmu_sched_task(cpuctx, sched_in);
-	}
+	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
+		__perf_pmu_sched_task(cpc, sched_in);
 }
 
 static void perf_event_switch(struct task_struct *task,
 			      struct task_struct *next_prev, bool sched_in);
 
-#define for_each_task_context_nr(ctxn)					\
-	for ((ctxn) = 0; (ctxn) < perf_nr_task_contexts; (ctxn)++)
-
 /*
  * Called from scheduler to remove the events of the current task,
  * with interrupts disabled.
@@ -3561,16 +3560,13 @@ static void perf_event_switch(struct task_struct *task,
 void __perf_event_task_sched_out(struct task_struct *task,
 				 struct task_struct *next)
 {
-	int ctxn;
-
 	if (__this_cpu_read(perf_sched_cb_usages))
 		perf_pmu_sched_task(task, next, false);
 
 	if (atomic_read(&nr_switch_events))
 		perf_event_switch(task, next, false);
 
-	for_each_task_context_nr(ctxn)
-		perf_event_context_sched_out(task, ctxn, next);
+	perf_event_context_sched_out(task, next);
 
 	/*
 	 * if cgroup events exist on this CPU, then we need
@@ -3581,15 +3577,6 @@ void __perf_event_task_sched_out(struct task_struct *task,
 		perf_cgroup_switch(next);
 }
 
-/*
- * Called with IRQs disabled
- */
-static void cpu_ctx_sched_out(struct perf_cpu_context *cpuctx,
-			      enum event_type_t event_type)
-{
-	ctx_sched_out(&cpuctx->ctx, cpuctx, event_type);
-}
-
 static bool perf_less_group_idx(const void *l, const void *r)
 {
 	const struct perf_event *le = *(const struct perf_event **)l;
@@ -3621,21 +3608,39 @@ static void __heap_add(struct min_heap *heap, struct perf_event *event)
 	}
 }
 
-static noinline int visit_groups_merge(struct perf_cpu_context *cpuctx,
+static void __link_epc(struct perf_event_pmu_context *pmu_ctx)
+{
+	struct perf_cpu_pmu_context *cpc;
+
+	if (!pmu_ctx->ctx->task)
+		return;
+
+	cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
+	WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
+	cpc->task_epc = pmu_ctx;
+}
+
+static noinline int visit_groups_merge(struct perf_event_context *ctx,
 				struct perf_event_groups *groups, int cpu,
+				struct pmu *pmu,
 				int (*func)(struct perf_event *, void *),
 				void *data)
 {
 #ifdef CONFIG_CGROUP_PERF
 	struct cgroup_subsys_state *css = NULL;
 #endif
+	struct perf_cpu_context *cpuctx = NULL;
 	/* Space for per CPU and/or any CPU event iterators. */
 	struct perf_event *itrs[2];
 	struct min_heap event_heap;
 	struct perf_event **evt;
 	int ret;
 
-	if (cpuctx) {
+	if (pmu->filter && pmu->filter(pmu, cpu))
+		return 0;
+
+	if (!ctx->task) {
+		cpuctx = this_cpu_ptr(&cpu_context);
 		event_heap = (struct min_heap){
 			.data = cpuctx->heap,
 			.nr = 0,
@@ -3655,17 +3660,23 @@ static noinline int visit_groups_merge(struct perf_cpu_context *cpuctx,
 			.size = ARRAY_SIZE(itrs),
 		};
 		/* Events not within a CPU context may be on any CPU. */
-		__heap_add(&event_heap, perf_event_groups_first(groups, -1, NULL));
+		__heap_add(&event_heap, perf_event_groups_first(groups, -1, pmu, NULL));
 	}
 	evt = event_heap.data;
 
-	__heap_add(&event_heap, perf_event_groups_first(groups, cpu, NULL));
+	__heap_add(&event_heap, perf_event_groups_first(groups, cpu, pmu, NULL));
 
 #ifdef CONFIG_CGROUP_PERF
 	for (; css; css = css->parent)
-		__heap_add(&event_heap, perf_event_groups_first(groups, cpu, css->cgroup));
+		__heap_add(&event_heap, perf_event_groups_first(groups, cpu, pmu, css->cgroup));
 #endif
 
+	if (event_heap.nr) {
+		__link_epc((*evt)->pmu_ctx);
+		perf_assert_pmu_disabled((*evt)->pmu_ctx->pmu);
+	}
+
+
 	min_heapify_all(&event_heap, &perf_min_heap);
 
 	while (event_heap.nr) {
@@ -3673,7 +3684,7 @@ static noinline int visit_groups_merge(struct perf_cpu_context *cpuctx,
 		if (ret)
 			return ret;
 
-		*evt = perf_event_groups_next(*evt);
+		*evt = perf_event_groups_next(*evt, pmu);
 		if (*evt)
 			min_heapify(&event_heap, 0, &perf_min_heap);
 		else
@@ -3715,7 +3726,6 @@ static inline void group_update_userpage(struct perf_event *group_event)
 static int merge_sched_in(struct perf_event *event, void *data)
 {
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
 	int *can_add_hw = data;
 
 	if (event->state <= PERF_EVENT_STATE_OFF)
@@ -3724,8 +3734,8 @@ static int merge_sched_in(struct perf_event *event, void *data)
 	if (!event_filter_match(event))
 		return 0;
 
-	if (group_can_go_on(event, cpuctx, *can_add_hw)) {
-		if (!group_sched_in(event, cpuctx, ctx))
+	if (group_can_go_on(event, *can_add_hw)) {
+		if (!group_sched_in(event, ctx))
 			list_add_tail(&event->active_list, get_event_list(event));
 	}
 
@@ -3735,8 +3745,11 @@ static int merge_sched_in(struct perf_event *event, void *data)
 			perf_cgroup_event_disable(event, ctx);
 			perf_event_set_state(event, PERF_EVENT_STATE_ERROR);
 		} else {
-			ctx->rotate_necessary = 1;
-			perf_mux_hrtimer_restart(cpuctx);
+			struct perf_cpu_pmu_context *cpc;
+
+			event->pmu_ctx->rotate_necessary = 1;
+			cpc = this_cpu_ptr(event->pmu_ctx->pmu->cpu_pmu_context);
+			perf_mux_hrtimer_restart(cpc);
 			group_update_userpage(event);
 		}
 	}
@@ -3744,39 +3757,54 @@ static int merge_sched_in(struct perf_event *event, void *data)
 	return 0;
 }
 
-static void
-ctx_pinned_sched_in(struct perf_event_context *ctx,
-		    struct perf_cpu_context *cpuctx)
+static void ctx_pinned_sched_in(struct perf_event_context *ctx, struct pmu *pmu)
 {
+	struct perf_event_pmu_context *pmu_ctx;
 	int can_add_hw = 1;
 
-	if (ctx != &cpuctx->ctx)
-		cpuctx = NULL;
-
-	visit_groups_merge(cpuctx, &ctx->pinned_groups,
-			   smp_processor_id(),
-			   merge_sched_in, &can_add_hw);
+	if (pmu) {
+		visit_groups_merge(ctx, &ctx->pinned_groups,
+				   smp_processor_id(), pmu,
+				   merge_sched_in, &can_add_hw);
+	} else {
+		list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
+			can_add_hw = 1;
+			visit_groups_merge(ctx, &ctx->pinned_groups,
+					   smp_processor_id(), pmu_ctx->pmu,
+					   merge_sched_in, &can_add_hw);
+		}
+	}
 }
 
-static void
-ctx_flexible_sched_in(struct perf_event_context *ctx,
-		      struct perf_cpu_context *cpuctx)
+/* XXX .busy thingy from Peter's patch */
+static void ctx_flexible_sched_in(struct perf_event_context *ctx, struct pmu *pmu)
 {
+	struct perf_event_pmu_context *pmu_ctx;
 	int can_add_hw = 1;
 
-	if (ctx != &cpuctx->ctx)
-		cpuctx = NULL;
+	if (pmu) {
+		visit_groups_merge(ctx, &ctx->flexible_groups,
+				   smp_processor_id(), pmu,
+				   merge_sched_in, &can_add_hw);
+	} else {
+		list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
+			can_add_hw = 1;
+			visit_groups_merge(ctx, &ctx->flexible_groups,
+					   smp_processor_id(), pmu_ctx->pmu,
+					   merge_sched_in, &can_add_hw);
+		}
+	}
+}
 
-	visit_groups_merge(cpuctx, &ctx->flexible_groups,
-			   smp_processor_id(),
-			   merge_sched_in, &can_add_hw);
+static void __pmu_ctx_sched_in(struct perf_event_context *ctx, struct pmu *pmu)
+{
+	ctx_flexible_sched_in(ctx, pmu);
 }
 
 static void
-ctx_sched_in(struct perf_event_context *ctx,
-	     struct perf_cpu_context *cpuctx,
-	     enum event_type_t event_type)
+ctx_sched_in(struct perf_event_context *ctx, enum event_type_t event_type)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	int is_active = ctx->is_active;
 
 	lockdep_assert_held(&ctx->lock);
@@ -3788,6 +3816,7 @@ ctx_sched_in(struct perf_event_context *ctx,
 		/* start ctx time */
 		__update_context_time(ctx, false);
 		perf_cgroup_set_timestamp(cpuctx);
+		// XXX ctx->task =? task
 		/*
 		 * CPU-release for the below ->is_active store,
 		 * see __load_acquire() in perf_event_time_now()
@@ -3810,39 +3839,32 @@ ctx_sched_in(struct perf_event_context *ctx,
 	 * in order to give them the best chance of going on.
 	 */
 	if (is_active & EVENT_PINNED)
-		ctx_pinned_sched_in(ctx, cpuctx);
+		ctx_pinned_sched_in(ctx, NULL);
 
 	/* Then walk through the lower prio flexible groups */
 	if (is_active & EVENT_FLEXIBLE)
-		ctx_flexible_sched_in(ctx, cpuctx);
+		ctx_flexible_sched_in(ctx, NULL);
 }
 
-static void cpu_ctx_sched_in(struct perf_cpu_context *cpuctx,
-			     enum event_type_t event_type)
+static void perf_event_context_sched_in(struct task_struct *task)
 {
-	struct perf_event_context *ctx = &cpuctx->ctx;
-
-	ctx_sched_in(ctx, cpuctx, event_type);
-}
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+	struct perf_event_context *ctx;
 
-static void perf_event_context_sched_in(struct perf_event_context *ctx,
-					struct task_struct *task)
-{
-	struct perf_cpu_context *cpuctx;
-	struct pmu *pmu;
+	rcu_read_lock();
+	ctx = rcu_dereference(task->perf_event_ctxp);
+	if (!ctx)
+		goto rcu_unlock;
 
-	cpuctx = __get_cpu_context(ctx);
+	if (cpuctx->task_ctx == ctx) {
+		perf_ctx_lock(cpuctx, ctx);
+		perf_ctx_disable(ctx);
 
-	/*
-	 * HACK: for HETEROGENEOUS the task context might have switched to a
-	 * different PMU, force (re)set the context,
-	 */
-	pmu = ctx->pmu = cpuctx->ctx.pmu;
+		perf_ctx_sched_task_cb(ctx, true);
 
-	if (cpuctx->task_ctx == ctx) {
-		if (cpuctx->sched_cb_usage)
-			__perf_pmu_sched_task(cpuctx, true);
-		return;
+		perf_ctx_enable(ctx);
+		perf_ctx_unlock(cpuctx, ctx);
+		goto rcu_unlock;
 	}
 
 	perf_ctx_lock(cpuctx, ctx);
@@ -3853,7 +3875,7 @@ static void perf_event_context_sched_in(struct perf_event_context *ctx,
 	if (!ctx->nr_events)
 		goto unlock;
 
-	perf_pmu_disable(pmu);
+	perf_ctx_disable(ctx);
 	/*
 	 * We want to keep the following priority order:
 	 * cpu pinned (that don't need to move), task pinned,
@@ -3862,17 +3884,24 @@ static void perf_event_context_sched_in(struct perf_event_context *ctx,
 	 * However, if task's ctx is not carrying any pinned
 	 * events, no need to flip the cpuctx's events around.
 	 */
-	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree))
-		cpu_ctx_sched_out(cpuctx, EVENT_FLEXIBLE);
+	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree)) {
+		perf_ctx_disable(&cpuctx->ctx);
+		ctx_sched_out(&cpuctx->ctx, EVENT_FLEXIBLE);
+	}
+
 	perf_event_sched_in(cpuctx, ctx);
 
-	if (cpuctx->sched_cb_usage && pmu->sched_task)
-		pmu->sched_task(cpuctx->task_ctx, true);
+	perf_ctx_sched_task_cb(cpuctx->task_ctx, true);
 
-	perf_pmu_enable(pmu);
+	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree))
+		perf_ctx_enable(&cpuctx->ctx);
+
+	perf_ctx_enable(ctx);
 
 unlock:
 	perf_ctx_unlock(cpuctx, ctx);
+rcu_unlock:
+	rcu_read_unlock();
 }
 
 /*
@@ -3889,16 +3918,7 @@ static void perf_event_context_sched_in(struct perf_event_context *ctx,
 void __perf_event_task_sched_in(struct task_struct *prev,
 				struct task_struct *task)
 {
-	struct perf_event_context *ctx;
-	int ctxn;
-
-	for_each_task_context_nr(ctxn) {
-		ctx = task->perf_event_ctxp[ctxn];
-		if (likely(!ctx))
-			continue;
-
-		perf_event_context_sched_in(ctx, task);
-	}
+	perf_event_context_sched_in(task);
 
 	if (atomic_read(&nr_switch_events))
 		perf_event_switch(task, prev, true);
@@ -4017,8 +4037,8 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
  * events. At the same time, make sure, having freq events does not change
  * the rate of unthrottling as that would introduce bias.
  */
-static void perf_adjust_freq_unthr_context(struct perf_event_context *ctx,
-					   int needs_unthr)
+static void
+perf_adjust_freq_unthr_context(struct perf_event_context *ctx, bool unthrottle)
 {
 	struct perf_event *event;
 	struct hw_perf_event *hwc;
@@ -4030,16 +4050,16 @@ static void perf_adjust_freq_unthr_context(struct perf_event_context *ctx,
 	 * - context have events in frequency mode (needs freq adjust)
 	 * - there are events to unthrottle on this cpu
 	 */
-	if (!(ctx->nr_freq || needs_unthr))
+	if (!(ctx->nr_freq || unthrottle))
 		return;
 
 	raw_spin_lock(&ctx->lock);
-	perf_pmu_disable(ctx->pmu);
 
 	list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
 		if (event->state != PERF_EVENT_STATE_ACTIVE)
 			continue;
 
+		// XXX use visit thingy to avoid the -1,cpu match
 		if (!event_filter_match(event))
 			continue;
 
@@ -4080,7 +4100,6 @@ static void perf_adjust_freq_unthr_context(struct perf_event_context *ctx,
 		perf_pmu_enable(event->pmu);
 	}
 
-	perf_pmu_enable(ctx->pmu);
 	raw_spin_unlock(&ctx->lock);
 }
 
@@ -4102,72 +4121,111 @@ static void rotate_ctx(struct perf_event_context *ctx, struct perf_event *event)
 
 /* pick an event from the flexible_groups to rotate */
 static inline struct perf_event *
-ctx_event_to_rotate(struct perf_event_context *ctx)
+ctx_event_to_rotate(struct perf_event_pmu_context *pmu_ctx)
 {
 	struct perf_event *event;
+	struct rb_node *node;
+	struct rb_root *tree;
+	struct __group_key key = {
+		.pmu = pmu_ctx->pmu,
+	};
 
 	/* pick the first active flexible event */
-	event = list_first_entry_or_null(&ctx->flexible_active,
+	event = list_first_entry_or_null(&pmu_ctx->flexible_active,
 					 struct perf_event, active_list);
+	if (event)
+		goto out;
 
 	/* if no active flexible event, pick the first event */
-	if (!event) {
-		event = rb_entry_safe(rb_first(&ctx->flexible_groups.tree),
-				      typeof(*event), group_node);
+	tree = &pmu_ctx->ctx->flexible_groups.tree;
+
+	if (!pmu_ctx->ctx->task) {
+		key.cpu = smp_processor_id();
+
+		node = rb_find_first(&key, tree, __group_cmp_ignore_cgroup);
+		if (node)
+			event = __node_2_pe(node);
+		goto out;
+	}
+
+	key.cpu = -1;
+	node = rb_find_first(&key, tree, __group_cmp_ignore_cgroup);
+	if (node) {
+		event = __node_2_pe(node);
+		goto out;
 	}
 
+	key.cpu = smp_processor_id();
+	node = rb_find_first(&key, tree, __group_cmp_ignore_cgroup);
+	if (node)
+		event = __node_2_pe(node);
+
+out:
 	/*
 	 * Unconditionally clear rotate_necessary; if ctx_flexible_sched_in()
 	 * finds there are unschedulable events, it will set it again.
 	 */
-	ctx->rotate_necessary = 0;
+	pmu_ctx->rotate_necessary = 0;
 
 	return event;
 }
 
-static bool perf_rotate_context(struct perf_cpu_context *cpuctx)
+static bool perf_rotate_context(struct perf_cpu_pmu_context *cpc)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+	struct perf_event_pmu_context *cpu_epc, *task_epc = NULL;
 	struct perf_event *cpu_event = NULL, *task_event = NULL;
 	struct perf_event_context *task_ctx = NULL;
 	int cpu_rotate, task_rotate;
+	struct pmu *pmu;
 
 	/*
 	 * Since we run this from IRQ context, nobody can install new
 	 * events, thus the event count values are stable.
 	 */
 
-	cpu_rotate = cpuctx->ctx.rotate_necessary;
+	cpu_epc = &cpc->epc;
+	pmu = cpu_epc->pmu;
+	task_epc = cpc->task_epc;
+
+	cpu_rotate = cpu_epc->rotate_necessary;
 	task_ctx = cpuctx->task_ctx;
-	task_rotate = task_ctx ? task_ctx->rotate_necessary : 0;
+	task_rotate = task_epc ? task_epc->rotate_necessary : 0;
 
 	if (!(cpu_rotate || task_rotate))
 		return false;
 
 	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
-	perf_pmu_disable(cpuctx->ctx.pmu);
+	perf_pmu_disable(pmu);
 
 	if (task_rotate)
-		task_event = ctx_event_to_rotate(task_ctx);
+		task_event = ctx_event_to_rotate(task_epc);
 	if (cpu_rotate)
-		cpu_event = ctx_event_to_rotate(&cpuctx->ctx);
+		cpu_event = ctx_event_to_rotate(cpu_epc);
 
 	/*
 	 * As per the order given at ctx_resched() first 'pop' task flexible
 	 * and then, if needed CPU flexible.
 	 */
-	if (task_event || (task_ctx && cpu_event))
-		ctx_sched_out(task_ctx, cpuctx, EVENT_FLEXIBLE);
-	if (cpu_event)
-		cpu_ctx_sched_out(cpuctx, EVENT_FLEXIBLE);
+	if (task_event || (task_epc && cpu_event)) {
+		update_context_time(task_epc->ctx);
+		__pmu_ctx_sched_out(task_epc, EVENT_FLEXIBLE);
+	}
 
-	if (task_event)
-		rotate_ctx(task_ctx, task_event);
-	if (cpu_event)
+	if (cpu_event) {
+		update_context_time(&cpuctx->ctx);
+		__pmu_ctx_sched_out(cpu_epc, EVENT_FLEXIBLE);
 		rotate_ctx(&cpuctx->ctx, cpu_event);
+		__pmu_ctx_sched_in(&cpuctx->ctx, pmu);
+	}
 
-	perf_event_sched_in(cpuctx, task_ctx);
+	if (task_event)
+		rotate_ctx(task_epc->ctx, task_event);
+
+	if (task_event || (task_epc && cpu_event))
+		__pmu_ctx_sched_in(task_epc->ctx, pmu);
 
-	perf_pmu_enable(cpuctx->ctx.pmu);
+	perf_pmu_enable(pmu);
 	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
 
 	return true;
@@ -4175,8 +4233,8 @@ static bool perf_rotate_context(struct perf_cpu_context *cpuctx)
 
 void perf_event_task_tick(void)
 {
-	struct list_head *head = this_cpu_ptr(&active_ctx_list);
-	struct perf_event_context *ctx, *tmp;
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
+	struct perf_event_context *ctx;
 	int throttled;
 
 	lockdep_assert_irqs_disabled();
@@ -4185,8 +4243,13 @@ void perf_event_task_tick(void)
 	throttled = __this_cpu_xchg(perf_throttled_count, 0);
 	tick_dep_clear_cpu(smp_processor_id(), TICK_DEP_BIT_PERF_EVENTS);
 
-	list_for_each_entry_safe(ctx, tmp, head, active_ctx_list)
-		perf_adjust_freq_unthr_context(ctx, throttled);
+	perf_adjust_freq_unthr_context(&cpuctx->ctx, !!throttled);
+
+	rcu_read_lock();
+	ctx = rcu_dereference(current->perf_event_ctxp);
+	if (ctx)
+		perf_adjust_freq_unthr_context(ctx, !!throttled);
+	rcu_read_unlock();
 }
 
 static int event_enable_on_exec(struct perf_event *event,
@@ -4208,9 +4271,9 @@ static int event_enable_on_exec(struct perf_event *event,
  * Enable all of a task's events that have been marked enable-on-exec.
  * This expects task == current.
  */
-static void perf_event_enable_on_exec(int ctxn)
+static void perf_event_enable_on_exec(struct perf_event_context *ctx)
 {
-	struct perf_event_context *ctx, *clone_ctx = NULL;
+	struct perf_event_context *clone_ctx = NULL;
 	enum event_type_t event_type = 0;
 	struct perf_cpu_context *cpuctx;
 	struct perf_event *event;
@@ -4218,13 +4281,16 @@ static void perf_event_enable_on_exec(int ctxn)
 	int enabled = 0;
 
 	local_irq_save(flags);
-	ctx = current->perf_event_ctxp[ctxn];
-	if (!ctx || !ctx->nr_events)
+	if (WARN_ON_ONCE(current->perf_event_ctxp != ctx))
+		goto out;
+
+	if (!ctx->nr_events)
 		goto out;
 
-	cpuctx = __get_cpu_context(ctx);
+	cpuctx = this_cpu_ptr(&cpu_context);
 	perf_ctx_lock(cpuctx, ctx);
-	ctx_sched_out(ctx, cpuctx, EVENT_TIME);
+	ctx_sched_out(ctx, EVENT_TIME);
+
 	list_for_each_entry(event, &ctx->event_list, event_entry) {
 		enabled |= event_enable_on_exec(event, ctx);
 		event_type |= get_event_type(event);
@@ -4237,7 +4303,7 @@ static void perf_event_enable_on_exec(int ctxn)
 		clone_ctx = unclone_ctx(ctx);
 		ctx_resched(cpuctx, ctx, event_type);
 	} else {
-		ctx_sched_in(ctx, cpuctx, EVENT_TIME);
+		ctx_sched_in(ctx, EVENT_TIME);
 	}
 	perf_ctx_unlock(cpuctx, ctx);
 
@@ -4256,17 +4322,13 @@ static void perf_event_exit_event(struct perf_event *event,
  * Removes all events from the current task that have been marked
  * remove-on-exec, and feeds their values back to parent events.
  */
-static void perf_event_remove_on_exec(int ctxn)
+static void perf_event_remove_on_exec(struct perf_event_context *ctx)
 {
-	struct perf_event_context *ctx, *clone_ctx = NULL;
+	struct perf_event_context *clone_ctx = NULL;
 	struct perf_event *event, *next;
 	unsigned long flags;
 	bool modified = false;
 
-	ctx = perf_pin_task_context(current, ctxn);
-	if (!ctx)
-		return;
-
 	mutex_lock(&ctx->mutex);
 
 	if (WARN_ON_ONCE(ctx->task != current))
@@ -4287,13 +4349,11 @@ static void perf_event_remove_on_exec(int ctxn)
 	raw_spin_lock_irqsave(&ctx->lock, flags);
 	if (modified)
 		clone_ctx = unclone_ctx(ctx);
-	--ctx->pin_count;
 	raw_spin_unlock_irqrestore(&ctx->lock, flags);
 
 unlock:
 	mutex_unlock(&ctx->mutex);
 
-	put_ctx(ctx);
 	if (clone_ctx)
 		put_ctx(clone_ctx);
 }
@@ -4329,7 +4389,7 @@ static void __perf_event_read(void *info)
 	struct perf_read_data *data = info;
 	struct perf_event *sub, *event = data->event;
 	struct perf_event_context *ctx = event->ctx;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct pmu *pmu = event->pmu;
 
 	/*
@@ -4555,17 +4615,25 @@ static void __perf_event_init_context(struct perf_event_context *ctx)
 {
 	raw_spin_lock_init(&ctx->lock);
 	mutex_init(&ctx->mutex);
-	INIT_LIST_HEAD(&ctx->active_ctx_list);
+	INIT_LIST_HEAD(&ctx->pmu_ctx_list);
 	perf_event_groups_init(&ctx->pinned_groups);
 	perf_event_groups_init(&ctx->flexible_groups);
 	INIT_LIST_HEAD(&ctx->event_list);
-	INIT_LIST_HEAD(&ctx->pinned_active);
-	INIT_LIST_HEAD(&ctx->flexible_active);
 	refcount_set(&ctx->refcount, 1);
 }
 
+static void
+__perf_init_event_pmu_context(struct perf_event_pmu_context *epc, struct pmu *pmu)
+{
+	epc->pmu = pmu;
+	INIT_LIST_HEAD(&epc->pmu_ctx_entry);
+	INIT_LIST_HEAD(&epc->pinned_active);
+	INIT_LIST_HEAD(&epc->flexible_active);
+	atomic_set(&epc->refcount, 1);
+}
+
 static struct perf_event_context *
-alloc_perf_context(struct pmu *pmu, struct task_struct *task)
+alloc_perf_context(struct task_struct *task)
 {
 	struct perf_event_context *ctx;
 
@@ -4576,7 +4644,6 @@ alloc_perf_context(struct pmu *pmu, struct task_struct *task)
 	__perf_event_init_context(ctx);
 	if (task)
 		ctx->task = get_task_struct(task);
-	ctx->pmu = pmu;
 
 	return ctx;
 }
@@ -4605,15 +4672,12 @@ find_lively_task_by_vpid(pid_t vpid)
  * Returns a matching context with refcount and pincount.
  */
 static struct perf_event_context *
-find_get_context(struct pmu *pmu, struct task_struct *task,
-		struct perf_event *event)
+find_get_context(struct task_struct *task, struct perf_event *event)
 {
 	struct perf_event_context *ctx, *clone_ctx = NULL;
 	struct perf_cpu_context *cpuctx;
-	void *task_ctx_data = NULL;
 	unsigned long flags;
-	int ctxn, err;
-	int cpu = event->cpu;
+	int err;
 
 	if (!task) {
 		/* Must be root to operate on a CPU event: */
@@ -4621,7 +4685,7 @@ find_get_context(struct pmu *pmu, struct task_struct *task,
 		if (err)
 			return ERR_PTR(err);
 
-		cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
+		cpuctx = per_cpu_ptr(&cpu_context, event->cpu);
 		ctx = &cpuctx->ctx;
 		get_ctx(ctx);
 		raw_spin_lock_irqsave(&ctx->lock, flags);
@@ -4632,43 +4696,22 @@ find_get_context(struct pmu *pmu, struct task_struct *task,
 	}
 
 	err = -EINVAL;
-	ctxn = pmu->task_ctx_nr;
-	if (ctxn < 0)
-		goto errout;
-
-	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
-		task_ctx_data = alloc_task_ctx_data(pmu);
-		if (!task_ctx_data) {
-			err = -ENOMEM;
-			goto errout;
-		}
-	}
-
 retry:
-	ctx = perf_lock_task_context(task, ctxn, &flags);
+	ctx = perf_lock_task_context(task, &flags);
 	if (ctx) {
 		clone_ctx = unclone_ctx(ctx);
 		++ctx->pin_count;
 
-		if (task_ctx_data && !ctx->task_ctx_data) {
-			ctx->task_ctx_data = task_ctx_data;
-			task_ctx_data = NULL;
-		}
 		raw_spin_unlock_irqrestore(&ctx->lock, flags);
 
 		if (clone_ctx)
 			put_ctx(clone_ctx);
 	} else {
-		ctx = alloc_perf_context(pmu, task);
+		ctx = alloc_perf_context(task);
 		err = -ENOMEM;
 		if (!ctx)
 			goto errout;
 
-		if (task_ctx_data) {
-			ctx->task_ctx_data = task_ctx_data;
-			task_ctx_data = NULL;
-		}
-
 		err = 0;
 		mutex_lock(&task->perf_event_mutex);
 		/*
@@ -4677,12 +4720,12 @@ find_get_context(struct pmu *pmu, struct task_struct *task,
 		 */
 		if (task->flags & PF_EXITING)
 			err = -ESRCH;
-		else if (task->perf_event_ctxp[ctxn])
+		else if (task->perf_event_ctxp)
 			err = -EAGAIN;
 		else {
 			get_ctx(ctx);
 			++ctx->pin_count;
-			rcu_assign_pointer(task->perf_event_ctxp[ctxn], ctx);
+			rcu_assign_pointer(task->perf_event_ctxp, ctx);
 		}
 		mutex_unlock(&task->perf_event_mutex);
 
@@ -4695,14 +4738,117 @@ find_get_context(struct pmu *pmu, struct task_struct *task,
 		}
 	}
 
-	free_task_ctx_data(pmu, task_ctx_data);
 	return ctx;
 
 errout:
-	free_task_ctx_data(pmu, task_ctx_data);
 	return ERR_PTR(err);
 }
 
+static struct perf_event_pmu_context *
+find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
+		     struct perf_event *event)
+{
+	struct perf_event_pmu_context *new = NULL, *epc;
+	void *task_ctx_data = NULL;
+
+	if (!ctx->task) {
+		struct perf_cpu_pmu_context *cpc;
+
+		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
+		epc = &cpc->epc;
+
+		if (!epc->ctx) {
+			atomic_set(&epc->refcount, 1);
+			epc->embedded = 1;
+			raw_spin_lock_irq(&ctx->lock);
+			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
+			epc->ctx = ctx;
+			raw_spin_unlock_irq(&ctx->lock);
+		} else {
+			WARN_ON_ONCE(epc->ctx != ctx);
+			atomic_inc(&epc->refcount);
+		}
+
+		return epc;
+	}
+
+	new = kzalloc(sizeof(*epc), GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
+		task_ctx_data = alloc_task_ctx_data(pmu);;
+		if (!task_ctx_data) {
+			kfree(new);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	__perf_init_event_pmu_context(new, pmu);
+
+	raw_spin_lock_irq(&ctx->lock);
+	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
+		if (epc->pmu == pmu) {
+			WARN_ON_ONCE(epc->ctx != ctx);
+			atomic_inc(&epc->refcount);
+			goto found_epc;
+		}
+	}
+
+	epc = new;
+	new = NULL;
+
+	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
+	epc->ctx = ctx;
+
+found_epc:
+	if (task_ctx_data && !epc->task_ctx_data) {
+		epc->task_ctx_data = task_ctx_data;
+		task_ctx_data = NULL;
+		ctx->nr_task_data++;
+	}
+	raw_spin_unlock_irq(&ctx->lock);
+
+	free_task_ctx_data(pmu, task_ctx_data);
+	kfree(new);
+
+	return epc;
+}
+
+static void get_pmu_ctx(struct perf_event_pmu_context *epc)
+{
+	WARN_ON_ONCE(!atomic_inc_not_zero(&epc->refcount));
+}
+
+static void put_pmu_ctx(struct perf_event_pmu_context *epc)
+{
+	unsigned long flags;
+
+	if (!atomic_dec_and_test(&epc->refcount))
+		return;
+
+	if (epc->ctx) {
+		struct perf_event_context *ctx = epc->ctx;
+
+		// XXX ctx->mutex
+
+		WARN_ON_ONCE(list_empty(&epc->pmu_ctx_entry));
+		raw_spin_lock_irqsave(&ctx->lock, flags);
+		list_del_init(&epc->pmu_ctx_entry);
+		epc->ctx = NULL;
+		raw_spin_unlock_irqrestore(&ctx->lock, flags);
+	}
+
+	WARN_ON_ONCE(!list_empty(&epc->pinned_active));
+	WARN_ON_ONCE(!list_empty(&epc->flexible_active));
+
+	if (epc->embedded)
+		return;
+
+	kfree(epc->task_ctx_data);
+	kfree(epc);
+}
+
 static void perf_event_free_filter(struct perf_event *event);
 
 static void free_event_rcu(struct rcu_head *head)
@@ -4847,7 +4993,7 @@ static void perf_sched_delayed(struct work_struct *work)
  *
  *  1) cpu-wide events in the presence of per-task events,
  *  2) per-task events in the presence of cpu-wide events,
- *  3) two matching events on the same context.
+ *  3) two matching events on the same perf_event_context.
  *
  * The former two cases are handled in the allocation path (perf_event_alloc(),
  * _free_event()), the latter -- before the first perf_install_in_context().
@@ -4971,6 +5117,9 @@ static void _free_event(struct perf_event *event)
 	if (event->hw.target)
 		put_task_struct(event->hw.target);
 
+	if (event->pmu_ctx)
+		put_pmu_ctx(event->pmu_ctx);
+
 	/*
 	 * perf_event_free_task() relies on put_ctx() being 'last', in particular
 	 * all task references must be cleaned up.
@@ -5071,8 +5220,8 @@ int perf_event_release_kernel(struct perf_event *event)
 	LIST_HEAD(free_list);
 
 	/*
-	 * If we got here through err_file: fput(event_file); we will not have
-	 * attached to a context yet.
+	 * If we got here through err_alloc: free_event(event); we will not
+	 * have attached to a context yet.
 	 */
 	if (!ctx) {
 		WARN_ON_ONCE(event->attach_state &
@@ -5507,7 +5656,7 @@ static void __perf_event_period(struct perf_event *event,
 
 	active = (event->state == PERF_EVENT_STATE_ACTIVE);
 	if (active) {
-		perf_pmu_disable(ctx->pmu);
+		perf_pmu_disable(event->pmu);
 		/*
 		 * We could be throttled; unthrottle now to avoid the tick
 		 * trying to unthrottle while we already re-started the event.
@@ -5523,7 +5672,7 @@ static void __perf_event_period(struct perf_event *event,
 
 	if (active) {
 		event->pmu->start(event, PERF_EF_RELOAD);
-		perf_pmu_enable(ctx->pmu);
+		perf_pmu_enable(event->pmu);
 	}
 }
 
@@ -7621,7 +7770,6 @@ perf_iterate_sb(perf_iterate_f output, void *data,
 	       struct perf_event_context *task_ctx)
 {
 	struct perf_event_context *ctx;
-	int ctxn;
 
 	rcu_read_lock();
 	preempt_disable();
@@ -7638,11 +7786,9 @@ perf_iterate_sb(perf_iterate_f output, void *data,
 
 	perf_iterate_sb_cpu(output, data);
 
-	for_each_task_context_nr(ctxn) {
-		ctx = rcu_dereference(current->perf_event_ctxp[ctxn]);
-		if (ctx)
-			perf_iterate_ctx(ctx, output, data, false);
-	}
+	ctx = rcu_dereference(current->perf_event_ctxp);
+	if (ctx)
+		perf_iterate_ctx(ctx, output, data, false);
 done:
 	preempt_enable();
 	rcu_read_unlock();
@@ -7684,20 +7830,17 @@ static void perf_event_addr_filters_exec(struct perf_event *event, void *data)
 void perf_event_exec(void)
 {
 	struct perf_event_context *ctx;
-	int ctxn;
 
-	for_each_task_context_nr(ctxn) {
-		perf_event_enable_on_exec(ctxn);
-		perf_event_remove_on_exec(ctxn);
+	ctx = perf_pin_task_context(current);
+	if (!ctx)
+		return;
 
-		rcu_read_lock();
-		ctx = rcu_dereference(current->perf_event_ctxp[ctxn]);
-		if (ctx) {
-			perf_iterate_ctx(ctx, perf_event_addr_filters_exec,
-					 NULL, true);
-		}
-		rcu_read_unlock();
-	}
+	perf_event_enable_on_exec(ctx);
+	perf_event_remove_on_exec(ctx);
+	perf_iterate_ctx(ctx, perf_event_addr_filters_exec, NULL, true);
+
+	perf_unpin_context(ctx);
+	put_ctx(ctx);
 }
 
 struct remote_output {
@@ -7737,8 +7880,7 @@ static void __perf_event_output_stop(struct perf_event *event, void *data)
 static int __perf_pmu_output_stop(void *info)
 {
 	struct perf_event *event = info;
-	struct pmu *pmu = event->ctx->pmu;
-	struct perf_cpu_context *cpuctx = this_cpu_ptr(pmu->pmu_cpu_context);
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct remote_output ro = {
 		.rb	= event->rb,
 	};
@@ -8527,7 +8669,6 @@ static void __perf_addr_filters_adjust(struct perf_event *event, void *data)
 static void perf_addr_filters_adjust(struct vm_area_struct *vma)
 {
 	struct perf_event_context *ctx;
-	int ctxn;
 
 	/*
 	 * Data tracing isn't supported yet and as such there is no need
@@ -8537,13 +8678,9 @@ static void perf_addr_filters_adjust(struct vm_area_struct *vma)
 		return;
 
 	rcu_read_lock();
-	for_each_task_context_nr(ctxn) {
-		ctx = rcu_dereference(current->perf_event_ctxp[ctxn]);
-		if (!ctx)
-			continue;
-
+	ctx = rcu_dereference(current->perf_event_ctxp);
+	if (ctx)
 		perf_iterate_ctx(ctx, __perf_addr_filters_adjust, vma, true);
-	}
 	rcu_read_unlock();
 }
 
@@ -9752,10 +9889,13 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
 		struct trace_entry *entry = record;
 
 		rcu_read_lock();
-		ctx = rcu_dereference(task->perf_event_ctxp[perf_sw_context]);
+		ctx = rcu_dereference(task->perf_event_ctxp);
 		if (!ctx)
 			goto unlock;
 
+		// XXX iterate groups instead, we should be able to
+		// find the subtree for the perf_tracepoint pmu and CPU.
+
 		list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
 			if (event->cpu != smp_processor_id())
 				continue;
@@ -10892,36 +11032,9 @@ static int perf_event_idx_default(struct perf_event *event)
 	return 0;
 }
 
-/*
- * Ensures all contexts with the same task_ctx_nr have the same
- * pmu_cpu_context too.
- */
-static struct perf_cpu_context __percpu *find_pmu_context(int ctxn)
-{
-	struct pmu *pmu;
-
-	if (ctxn < 0)
-		return NULL;
-
-	list_for_each_entry(pmu, &pmus, entry) {
-		if (pmu->task_ctx_nr == ctxn)
-			return pmu->pmu_cpu_context;
-	}
-
-	return NULL;
-}
-
 static void free_pmu_context(struct pmu *pmu)
 {
-	/*
-	 * Static contexts such as perf_sw_context have a global lifetime
-	 * and may be shared between different PMUs. Avoid freeing them
-	 * when a single PMU is going away.
-	 */
-	if (pmu->task_ctx_nr > perf_invalid_context)
-		return;
-
-	free_percpu(pmu->pmu_cpu_context);
+	free_percpu(pmu->cpu_pmu_context);
 }
 
 /*
@@ -10985,12 +11098,12 @@ perf_event_mux_interval_ms_store(struct device *dev,
 	/* update all cpuctx for this PMU */
 	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		struct perf_cpu_context *cpuctx;
-		cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
-		cpuctx->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * timer);
+		struct perf_cpu_pmu_context *cpc;
+		cpc = per_cpu_ptr(pmu->cpu_pmu_context, cpu);
+		cpc->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * timer);
 
 		cpu_function_call(cpu,
-			(remote_function_f)perf_mux_hrtimer_restart, cpuctx);
+			(remote_function_f)perf_mux_hrtimer_restart, cpc);
 	}
 	cpus_read_unlock();
 	mutex_unlock(&mux_interval_mutex);
@@ -11101,47 +11214,19 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 	}
 
 skip_type:
-	if (pmu->task_ctx_nr == perf_hw_context) {
-		static int hw_context_taken = 0;
-
-		/*
-		 * Other than systems with heterogeneous CPUs, it never makes
-		 * sense for two PMUs to share perf_hw_context. PMUs which are
-		 * uncore must use perf_invalid_context.
-		 */
-		if (WARN_ON_ONCE(hw_context_taken &&
-		    !(pmu->capabilities & PERF_PMU_CAP_HETEROGENEOUS_CPUS)))
-			pmu->task_ctx_nr = perf_invalid_context;
-
-		hw_context_taken = 1;
-	}
-
-	pmu->pmu_cpu_context = find_pmu_context(pmu->task_ctx_nr);
-	if (pmu->pmu_cpu_context)
-		goto got_cpu_context;
-
 	ret = -ENOMEM;
-	pmu->pmu_cpu_context = alloc_percpu(struct perf_cpu_context);
-	if (!pmu->pmu_cpu_context)
+	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context);
+	if (!pmu->cpu_pmu_context)
 		goto free_dev;
 
 	for_each_possible_cpu(cpu) {
-		struct perf_cpu_context *cpuctx;
-
-		cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
-		__perf_event_init_context(&cpuctx->ctx);
-		lockdep_set_class(&cpuctx->ctx.mutex, &cpuctx_mutex);
-		lockdep_set_class(&cpuctx->ctx.lock, &cpuctx_lock);
-		cpuctx->ctx.pmu = pmu;
-		cpuctx->online = cpumask_test_cpu(cpu, perf_online_mask);
-
-		__perf_mux_hrtimer_init(cpuctx, cpu);
+		struct perf_cpu_pmu_context *cpc;
 
-		cpuctx->heap_size = ARRAY_SIZE(cpuctx->heap_default);
-		cpuctx->heap = cpuctx->heap_default;
+		cpc = per_cpu_ptr(pmu->cpu_pmu_context, cpu);
+		__perf_init_event_pmu_context(&cpc->epc, pmu);
+		__perf_mux_hrtimer_init(cpc, cpu);
 	}
 
-got_cpu_context:
 	if (!pmu->start_txn) {
 		if (pmu->pmu_enable) {
 			/*
@@ -11623,10 +11708,11 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	}
 
 	/*
-	 * Disallow uncore-cgroup events, they don't make sense as the cgroup will
-	 * be different on other CPUs in the uncore mask.
+	 * Disallow uncore-task events. Similarly, disallow uncore-cgroup
+	 * events (they don't make sense as the cgroup will be different
+	 * on other CPUs in the uncore mask).
 	 */
-	if (pmu->task_ctx_nr == perf_invalid_context && cgroup_fd != -1) {
+	if (pmu->task_ctx_nr == perf_invalid_context && (task || cgroup_fd != -1)) {
 		err = -EINVAL;
 		goto err_pmu;
 	}
@@ -11975,37 +12061,6 @@ static int perf_event_set_clock(struct perf_event *event, clockid_t clk_id)
 	return 0;
 }
 
-/*
- * Variation on perf_event_ctx_lock_nested(), except we take two context
- * mutexes.
- */
-static struct perf_event_context *
-__perf_event_ctx_lock_double(struct perf_event *group_leader,
-			     struct perf_event_context *ctx)
-{
-	struct perf_event_context *gctx;
-
-again:
-	rcu_read_lock();
-	gctx = READ_ONCE(group_leader->ctx);
-	if (!refcount_inc_not_zero(&gctx->refcount)) {
-		rcu_read_unlock();
-		goto again;
-	}
-	rcu_read_unlock();
-
-	mutex_lock_double(&gctx->mutex, &ctx->mutex);
-
-	if (group_leader->ctx != gctx) {
-		mutex_unlock(&ctx->mutex);
-		mutex_unlock(&gctx->mutex);
-		put_ctx(gctx);
-		goto again;
-	}
-
-	return gctx;
-}
-
 static bool
 perf_check_permission(struct perf_event_attr *attr, struct task_struct *task)
 {
@@ -12051,9 +12106,10 @@ SYSCALL_DEFINE5(perf_event_open,
 		pid_t, pid, int, cpu, int, group_fd, unsigned long, flags)
 {
 	struct perf_event *group_leader = NULL, *output_event = NULL;
+	struct perf_event_pmu_context *pmu_ctx;
 	struct perf_event *event, *sibling;
 	struct perf_event_attr attr;
-	struct perf_event_context *ctx, *gctx;
+	struct perf_event_context *ctx;
 	struct file *event_file = NULL;
 	struct fd group = {NULL, 0};
 	struct task_struct *task = NULL;
@@ -12183,42 +12239,53 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (pmu->task_ctx_nr == perf_sw_context)
 		event->event_caps |= PERF_EV_CAP_SOFTWARE;
 
-	if (group_leader) {
-		if (is_software_event(event) &&
-		    !in_software_context(group_leader)) {
-			/*
-			 * If the event is a sw event, but the group_leader
-			 * is on hw context.
-			 *
-			 * Allow the addition of software events to hw
-			 * groups, this is safe because software events
-			 * never fail to schedule.
-			 */
-			pmu = group_leader->ctx->pmu;
-		} else if (!is_software_event(event) &&
-			   is_software_event(group_leader) &&
-			   (group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
-			/*
-			 * In case the group is a pure software group, and we
-			 * try to add a hardware event, move the whole group to
-			 * the hardware context.
-			 */
-			move_group = 1;
-		}
+	if (task) {
+		err = down_read_interruptible(&task->signal->exec_update_lock);
+		if (err)
+			goto err_alloc;
+
+		/*
+		 * We must hold exec_update_lock across this and any potential
+		 * perf_install_in_context() call for this new event to
+		 * serialize against exec() altering our credentials (and the
+		 * perf_event_exit_task() that could imply).
+		 */
+		err = -EACCES;
+		if (!perf_check_permission(&attr, task))
+			goto err_cred;
 	}
 
 	/*
 	 * Get the target context (task or percpu):
 	 */
-	ctx = find_get_context(pmu, task, event);
+	ctx = find_get_context(task, event);
 	if (IS_ERR(ctx)) {
 		err = PTR_ERR(ctx);
-		goto err_alloc;
+		goto err_cred;
+	}
+
+	mutex_lock(&ctx->mutex);
+
+	if (ctx->task == TASK_TOMBSTONE) {
+		err = -ESRCH;
+		goto err_locked;
+	}
+
+	if (!task) {
+		/*
+		 * Check if the @cpu we're creating an event for is online.
+		 *
+		 * We use the perf_cpu_context::ctx::mutex to serialize against
+		 * the hotplug notifiers. See perf_event_{init,exit}_cpu().
+		 */
+		struct perf_cpu_context *cpuctx = per_cpu_ptr(&cpu_context, event->cpu);
+
+		if (!cpuctx->online) {
+			err = -ENODEV;
+			goto err_locked;
+		}
 	}
 
-	/*
-	 * Look up the group leader (we will attach this event to it):
-	 */
 	if (group_leader) {
 		err = -EINVAL;
 
@@ -12227,11 +12294,11 @@ SYSCALL_DEFINE5(perf_event_open,
 		 * becoming part of another group-sibling):
 		 */
 		if (group_leader->group_leader != group_leader)
-			goto err_context;
+			goto err_locked;
 
 		/* All events in a group should have the same clock */
 		if (group_leader->clock != event->clock)
-			goto err_context;
+			goto err_locked;
 
 		/*
 		 * Make sure we're both events for the same CPU;
@@ -12239,145 +12306,67 @@ SYSCALL_DEFINE5(perf_event_open,
 		 * you can never concurrently schedule them anyhow.
 		 */
 		if (group_leader->cpu != event->cpu)
-			goto err_context;
-
-		/*
-		 * Make sure we're both on the same task, or both
-		 * per-CPU events.
-		 */
-		if (group_leader->ctx->task != ctx->task)
-			goto err_context;
+			goto err_locked;
 
 		/*
-		 * Do not allow to attach to a group in a different task
-		 * or CPU context. If we're moving SW events, we'll fix
-		 * this up later, so allow that.
-		 *
-		 * Racy, not holding group_leader->ctx->mutex, see comment with
-		 * perf_event_ctx_lock().
+		 * Make sure we're both on the same context; either task or cpu.
 		 */
-		if (!move_group && group_leader->ctx != ctx)
-			goto err_context;
+		if (group_leader->ctx != ctx)
+			goto err_locked;
 
 		/*
 		 * Only a group leader can be exclusive or pinned
 		 */
 		if (attr.exclusive || attr.pinned)
-			goto err_context;
-	}
-
-	if (output_event) {
-		err = perf_event_set_output(event, output_event);
-		if (err)
-			goto err_context;
-	}
-
-	event_file = anon_inode_getfile("[perf_event]", &perf_fops, event,
-					f_flags);
-	if (IS_ERR(event_file)) {
-		err = PTR_ERR(event_file);
-		event_file = NULL;
-		goto err_context;
-	}
-
-	if (task) {
-		err = down_read_interruptible(&task->signal->exec_update_lock);
-		if (err)
-			goto err_file;
-
-		/*
-		 * We must hold exec_update_lock across this and any potential
-		 * perf_install_in_context() call for this new event to
-		 * serialize against exec() altering our credentials (and the
-		 * perf_event_exit_task() that could imply).
-		 */
-		err = -EACCES;
-		if (!perf_check_permission(&attr, task))
-			goto err_cred;
-	}
-
-	if (move_group) {
-		gctx = __perf_event_ctx_lock_double(group_leader, ctx);
-
-		if (gctx->task == TASK_TOMBSTONE) {
-			err = -ESRCH;
 			goto err_locked;
-		}
 
-		/*
-		 * Check if we raced against another sys_perf_event_open() call
-		 * moving the software group underneath us.
-		 */
-		if (!(group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
+		if (is_software_event(event) &&
+		    !in_software_context(group_leader)) {
 			/*
-			 * If someone moved the group out from under us, check
-			 * if this new event wound up on the same ctx, if so
-			 * its the regular !move_group case, otherwise fail.
+			 * If the event is a sw event, but the group_leader
+			 * is on hw context.
+			 *
+			 * Allow the addition of software events to hw
+			 * groups, this is safe because software events
+			 * never fail to schedule.
 			 */
-			if (gctx != ctx) {
-				err = -EINVAL;
-				goto err_locked;
-			} else {
-				perf_event_ctx_unlock(group_leader, gctx);
-				move_group = 0;
-				goto not_move_group;
-			}
-		}
-
-		/*
-		 * Failure to create exclusive events returns -EBUSY.
-		 */
-		err = -EBUSY;
-		if (!exclusive_event_installable(group_leader, ctx))
-			goto err_locked;
-
-		for_each_sibling_event(sibling, group_leader) {
-			if (!exclusive_event_installable(sibling, ctx))
-				goto err_locked;
-		}
-	} else {
-		mutex_lock(&ctx->mutex);
-
-		/*
-		 * Now that we hold ctx->lock, (re)validate group_leader->ctx == ctx,
-		 * see the group_leader && !move_group test earlier.
-		 */
-		if (group_leader && group_leader->ctx != ctx) {
-			err = -EINVAL;
-			goto err_locked;
+			pmu = group_leader->pmu_ctx->pmu;
+		} else if (!is_software_event(event) &&
+			is_software_event(group_leader) &&
+			(group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
+			/*
+			 * In case the group is a pure software group, and we
+			 * try to add a hardware event, move the whole group to
+			 * the hardware context.
+			 */
+			move_group = 1;
 		}
 	}
-not_move_group:
 
-	if (ctx->task == TASK_TOMBSTONE) {
-		err = -ESRCH;
+	/*
+	 * Now that we're certain of the pmu; find the pmu_ctx.
+	 */
+	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
+	if (IS_ERR(pmu_ctx)) {
+		err = PTR_ERR(pmu_ctx);
 		goto err_locked;
 	}
+	event->pmu_ctx = pmu_ctx;
 
-	if (!perf_event_validate_size(event)) {
-		err = -E2BIG;
-		goto err_locked;
+	if (output_event) {
+		err = perf_event_set_output(event, output_event);
+		if (err)
+			goto err_context;
 	}
 
-	if (!task) {
-		/*
-		 * Check if the @cpu we're creating an event for is online.
-		 *
-		 * We use the perf_cpu_context::ctx::mutex to serialize against
-		 * the hotplug notifiers. See perf_event_{init,exit}_cpu().
-		 */
-		struct perf_cpu_context *cpuctx =
-			container_of(ctx, struct perf_cpu_context, ctx);
-
-		if (!cpuctx->online) {
-			err = -ENODEV;
-			goto err_locked;
-		}
+	if (!perf_event_validate_size(event)) {
+		err = -E2BIG;
+		goto err_context;
 	}
 
 	if (perf_need_aux_event(event) && !perf_get_aux_event(event, group_leader)) {
 		err = -EINVAL;
-		goto err_locked;
+		goto err_context;
 	}
 
 	/*
@@ -12386,35 +12375,32 @@ SYSCALL_DEFINE5(perf_event_open,
 	 */
 	if (!exclusive_event_installable(event, ctx)) {
 		err = -EBUSY;
-		goto err_locked;
+		goto err_context;
 	}
 
 	WARN_ON_ONCE(ctx->parent_ctx);
 
+	event_file = anon_inode_getfile("[perf_event]", &perf_fops, event, f_flags);
+	if (IS_ERR(event_file)) {
+		err = PTR_ERR(event_file);
+		event_file = NULL;
+		goto err_context;
+	}
+
 	/*
 	 * This is the point on no return; we cannot fail hereafter. This is
 	 * where we start modifying current state.
 	 */
 
 	if (move_group) {
-		/*
-		 * See perf_event_ctx_lock() for comments on the details
-		 * of swizzling perf_event::ctx.
-		 */
 		perf_remove_from_context(group_leader, 0);
-		put_ctx(gctx);
+		put_pmu_ctx(group_leader->pmu_ctx);
 
 		for_each_sibling_event(sibling, group_leader) {
 			perf_remove_from_context(sibling, 0);
-			put_ctx(gctx);
+			put_pmu_ctx(sibling->pmu_ctx);
 		}
 
-		/*
-		 * Wait for everybody to stop referencing the events through
-		 * the old lists, before installing it on new lists.
-		 */
-		synchronize_rcu();
-
 		/*
 		 * Install the group siblings before the group leader.
 		 *
@@ -12426,9 +12412,10 @@ SYSCALL_DEFINE5(perf_event_open,
 		 * reachable through the group lists.
 		 */
 		for_each_sibling_event(sibling, group_leader) {
+			sibling->pmu_ctx = pmu_ctx;
+			get_pmu_ctx(pmu_ctx);
 			perf_event__state_init(sibling);
 			perf_install_in_context(ctx, sibling, sibling->cpu);
-			get_ctx(ctx);
 		}
 
 		/*
@@ -12436,9 +12423,10 @@ SYSCALL_DEFINE5(perf_event_open,
 		 * event. What we want here is event in the initial
 		 * startup state, ready to be add into new context.
 		 */
+		group_leader->pmu_ctx = pmu_ctx;
+		get_pmu_ctx(pmu_ctx);
 		perf_event__state_init(group_leader);
 		perf_install_in_context(ctx, group_leader, group_leader->cpu);
-		get_ctx(ctx);
 	}
 
 	/*
@@ -12455,8 +12443,6 @@ SYSCALL_DEFINE5(perf_event_open,
 	perf_install_in_context(ctx, event, event->cpu);
 	perf_unpin_context(ctx);
 
-	if (move_group)
-		perf_event_ctx_unlock(group_leader, gctx);
 	mutex_unlock(&ctx->mutex);
 
 	if (task) {
@@ -12478,25 +12464,17 @@ SYSCALL_DEFINE5(perf_event_open,
 	fd_install(event_fd, event_file);
 	return event_fd;
 
+err_context:
+	/* event->pmu_ctx freed by free_event() */
 err_locked:
-	if (move_group)
-		perf_event_ctx_unlock(group_leader, gctx);
 	mutex_unlock(&ctx->mutex);
+	perf_unpin_context(ctx);
+	put_ctx(ctx);
 err_cred:
 	if (task)
 		up_read(&task->signal->exec_update_lock);
-err_file:
-	fput(event_file);
-err_context:
-	perf_unpin_context(ctx);
-	put_ctx(ctx);
 err_alloc:
-	/*
-	 * If event_file is set, the fput() above will have called ->release()
-	 * and that will take care of freeing the event.
-	 */
-	if (!event_file)
-		free_event(event);
+	free_event(event);
 err_task:
 	if (task)
 		put_task_struct(task);
@@ -12522,8 +12500,10 @@ perf_event_create_kernel_counter(struct perf_event_attr *attr, int cpu,
 				 perf_overflow_handler_t overflow_handler,
 				 void *context)
 {
+	struct perf_event_pmu_context *pmu_ctx;
 	struct perf_event_context *ctx;
 	struct perf_event *event;
+	struct pmu *pmu;
 	int err;
 
 	/*
@@ -12542,16 +12522,27 @@ perf_event_create_kernel_counter(struct perf_event_attr *attr, int cpu,
 
 	/* Mark owner so we could distinguish it from user events. */
 	event->owner = TASK_TOMBSTONE;
+	pmu = event->pmu;
+
+	if (pmu->task_ctx_nr == perf_sw_context)
+		event->event_caps |= PERF_EV_CAP_SOFTWARE;
 
 	/*
 	 * Get the target context (task or percpu):
 	 */
-	ctx = find_get_context(event->pmu, task, event);
+	ctx = find_get_context(task, event);
 	if (IS_ERR(ctx)) {
 		err = PTR_ERR(ctx);
-		goto err_free;
+		goto err_alloc;
 	}
 
+	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
+	if (IS_ERR(pmu_ctx)) {
+		err = PTR_ERR(pmu_ctx);
+		goto err_ctx;
+	}
+	event->pmu_ctx = pmu_ctx;
+
 	WARN_ON_ONCE(ctx->parent_ctx);
 	mutex_lock(&ctx->mutex);
 	if (ctx->task == TASK_TOMBSTONE) {
@@ -12587,9 +12578,10 @@ perf_event_create_kernel_counter(struct perf_event_attr *attr, int cpu,
 
 err_unlock:
 	mutex_unlock(&ctx->mutex);
+err_ctx:
 	perf_unpin_context(ctx);
 	put_ctx(ctx);
-err_free:
+err_alloc:
 	free_event(event);
 err:
 	return ERR_PTR(err);
@@ -12598,6 +12590,7 @@ EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
 
 void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
 {
+#if 0 // XXX buggered - cpu hotplug, who cares
 	struct perf_event_context *src_ctx;
 	struct perf_event_context *dst_ctx;
 	struct perf_event *event, *tmp;
@@ -12658,6 +12651,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
 	}
 	mutex_unlock(&dst_ctx->mutex);
 	mutex_unlock(&src_ctx->mutex);
+#endif
 }
 EXPORT_SYMBOL_GPL(perf_pmu_migrate_context);
 
@@ -12735,14 +12729,14 @@ perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
 	perf_event_wakeup(event);
 }
 
-static void perf_event_exit_task_context(struct task_struct *child, int ctxn)
+static void perf_event_exit_task_context(struct task_struct *child)
 {
 	struct perf_event_context *child_ctx, *clone_ctx = NULL;
 	struct perf_event *child_event, *next;
 
 	WARN_ON_ONCE(child != current);
 
-	child_ctx = perf_pin_task_context(child, ctxn);
+	child_ctx = perf_pin_task_context(child);
 	if (!child_ctx)
 		return;
 
@@ -12764,13 +12758,13 @@ static void perf_event_exit_task_context(struct task_struct *child, int ctxn)
 	 * in.
 	 */
 	raw_spin_lock_irq(&child_ctx->lock);
-	task_ctx_sched_out(__get_cpu_context(child_ctx), child_ctx, EVENT_ALL);
+	task_ctx_sched_out(child_ctx, EVENT_ALL);
 
 	/*
 	 * Now that the context is inactive, destroy the task <-> ctx relation
 	 * and mark the context dead.
 	 */
-	RCU_INIT_POINTER(child->perf_event_ctxp[ctxn], NULL);
+	RCU_INIT_POINTER(child->perf_event_ctxp, NULL);
 	put_ctx(child_ctx); /* cannot be last */
 	WRITE_ONCE(child_ctx->task, TASK_TOMBSTONE);
 	put_task_struct(current); /* cannot be last */
@@ -12805,7 +12799,6 @@ static void perf_event_exit_task_context(struct task_struct *child, int ctxn)
 void perf_event_exit_task(struct task_struct *child)
 {
 	struct perf_event *event, *tmp;
-	int ctxn;
 
 	mutex_lock(&child->perf_event_mutex);
 	list_for_each_entry_safe(event, tmp, &child->perf_event_list,
@@ -12821,8 +12814,7 @@ void perf_event_exit_task(struct task_struct *child)
 	}
 	mutex_unlock(&child->perf_event_mutex);
 
-	for_each_task_context_nr(ctxn)
-		perf_event_exit_task_context(child, ctxn);
+	perf_event_exit_task_context(child);
 
 	/*
 	 * The perf_event_exit_task_context calls perf_event_task
@@ -12865,56 +12857,51 @@ void perf_event_free_task(struct task_struct *task)
 {
 	struct perf_event_context *ctx;
 	struct perf_event *event, *tmp;
-	int ctxn;
 
-	for_each_task_context_nr(ctxn) {
-		ctx = task->perf_event_ctxp[ctxn];
-		if (!ctx)
-			continue;
+	ctx = rcu_dereference(task->perf_event_ctxp);
+	if (!ctx)
+		return;
 
-		mutex_lock(&ctx->mutex);
-		raw_spin_lock_irq(&ctx->lock);
-		/*
-		 * Destroy the task <-> ctx relation and mark the context dead.
-		 *
-		 * This is important because even though the task hasn't been
-		 * exposed yet the context has been (through child_list).
-		 */
-		RCU_INIT_POINTER(task->perf_event_ctxp[ctxn], NULL);
-		WRITE_ONCE(ctx->task, TASK_TOMBSTONE);
-		put_task_struct(task); /* cannot be last */
-		raw_spin_unlock_irq(&ctx->lock);
+	mutex_lock(&ctx->mutex);
+	raw_spin_lock_irq(&ctx->lock);
+	/*
+	 * Destroy the task <-> ctx relation and mark the context dead.
+	 *
+	 * This is important because even though the task hasn't been
+	 * exposed yet the context has been (through child_list).
+	 */
+	RCU_INIT_POINTER(task->perf_event_ctxp, NULL);
+	WRITE_ONCE(ctx->task, TASK_TOMBSTONE);
+	put_task_struct(task); /* cannot be last */
+	raw_spin_unlock_irq(&ctx->lock);
 
-		list_for_each_entry_safe(event, tmp, &ctx->event_list, event_entry)
-			perf_free_event(event, ctx);
 
-		mutex_unlock(&ctx->mutex);
+	list_for_each_entry_safe(event, tmp, &ctx->event_list, event_entry)
+		perf_free_event(event, ctx);
 
-		/*
-		 * perf_event_release_kernel() could've stolen some of our
-		 * child events and still have them on its free_list. In that
-		 * case we must wait for these events to have been freed (in
-		 * particular all their references to this task must've been
-		 * dropped).
-		 *
-		 * Without this copy_process() will unconditionally free this
-		 * task (irrespective of its reference count) and
-		 * _free_event()'s put_task_struct(event->hw.target) will be a
-		 * use-after-free.
-		 *
-		 * Wait for all events to drop their context reference.
-		 */
-		wait_var_event(&ctx->refcount, refcount_read(&ctx->refcount) == 1);
-		put_ctx(ctx); /* must be last */
-	}
+	mutex_unlock(&ctx->mutex);
+
+	/*
+	 * perf_event_release_kernel() could've stolen some of our
+	 * child events and still have them on its free_list. In that
+	 * case we must wait for these events to have been freed (in
+	 * particular all their references to this task must've been
+	 * dropped).
+	 *
+	 * Without this copy_process() will unconditionally free this
+	 * task (irrespective of its reference count) and
+	 * _free_event()'s put_task_struct(event->hw.target) will be a
+	 * use-after-free.
+	 *
+	 * Wait for all events to drop their context reference.
+	 */
+	wait_var_event(&ctx->refcount, refcount_read(&ctx->refcount) == 1);
+	put_ctx(ctx); /* must be last */
 }
 
 void perf_event_delayed_put(struct task_struct *task)
 {
-	int ctxn;
-
-	for_each_task_context_nr(ctxn)
-		WARN_ON_ONCE(task->perf_event_ctxp[ctxn]);
+	WARN_ON_ONCE(task->perf_event_ctxp);
 }
 
 struct file *perf_event_get(unsigned int fd)
@@ -12964,6 +12951,7 @@ inherit_event(struct perf_event *parent_event,
 	      struct perf_event_context *child_ctx)
 {
 	enum perf_event_state parent_state = parent_event->state;
+	struct perf_event_pmu_context *pmu_ctx;
 	struct perf_event *child_event;
 	unsigned long flags;
 
@@ -12984,17 +12972,12 @@ inherit_event(struct perf_event *parent_event,
 	if (IS_ERR(child_event))
 		return child_event;
 
-
-	if ((child_event->attach_state & PERF_ATTACH_TASK_DATA) &&
-	    !child_ctx->task_ctx_data) {
-		struct pmu *pmu = child_event->pmu;
-
-		child_ctx->task_ctx_data = alloc_task_ctx_data(pmu);
-		if (!child_ctx->task_ctx_data) {
-			free_event(child_event);
-			return ERR_PTR(-ENOMEM);
-		}
+	pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx, child_event);
+	if (!pmu_ctx) {
+		free_event(child_event);
+		return NULL;
 	}
+	child_event->pmu_ctx = pmu_ctx;
 
 	/*
 	 * is_orphaned_event() and list_add_tail(&parent_event->child_list)
@@ -13117,11 +13100,11 @@ static int inherit_group(struct perf_event *parent_event,
 static int
 inherit_task_group(struct perf_event *event, struct task_struct *parent,
 		   struct perf_event_context *parent_ctx,
-		   struct task_struct *child, int ctxn,
+		   struct task_struct *child,
 		   u64 clone_flags, int *inherited_all)
 {
-	int ret;
 	struct perf_event_context *child_ctx;
+	int ret;
 
 	if (!event->attr.inherit ||
 	    (event->attr.inherit_thread && !(clone_flags & CLONE_THREAD)) ||
@@ -13131,7 +13114,7 @@ inherit_task_group(struct perf_event *event, struct task_struct *parent,
 		return 0;
 	}
 
-	child_ctx = child->perf_event_ctxp[ctxn];
+	child_ctx = child->perf_event_ctxp;
 	if (!child_ctx) {
 		/*
 		 * This is executed from the parent task context, so
@@ -13139,16 +13122,14 @@ inherit_task_group(struct perf_event *event, struct task_struct *parent,
 		 * First allocate and initialize a context for the
 		 * child.
 		 */
-		child_ctx = alloc_perf_context(parent_ctx->pmu, child);
+		child_ctx = alloc_perf_context(child);
 		if (!child_ctx)
 			return -ENOMEM;
 
-		child->perf_event_ctxp[ctxn] = child_ctx;
+		child->perf_event_ctxp = child_ctx;
 	}
 
-	ret = inherit_group(event, parent, parent_ctx,
-			    child, child_ctx);
-
+	ret = inherit_group(event, parent, parent_ctx, child, child_ctx);
 	if (ret)
 		*inherited_all = 0;
 
@@ -13158,8 +13139,7 @@ inherit_task_group(struct perf_event *event, struct task_struct *parent,
 /*
  * Initialize the perf_event context in task_struct
  */
-static int perf_event_init_context(struct task_struct *child, int ctxn,
-				   u64 clone_flags)
+static int perf_event_init_context(struct task_struct *child, u64 clone_flags)
 {
 	struct perf_event_context *child_ctx, *parent_ctx;
 	struct perf_event_context *cloned_ctx;
@@ -13169,14 +13149,14 @@ static int perf_event_init_context(struct task_struct *child, int ctxn,
 	unsigned long flags;
 	int ret = 0;
 
-	if (likely(!parent->perf_event_ctxp[ctxn]))
+	if (likely(!parent->perf_event_ctxp))
 		return 0;
 
 	/*
 	 * If the parent's context is a clone, pin it so it won't get
 	 * swapped under us.
 	 */
-	parent_ctx = perf_pin_task_context(parent, ctxn);
+	parent_ctx = perf_pin_task_context(parent);
 	if (!parent_ctx)
 		return 0;
 
@@ -13199,8 +13179,7 @@ static int perf_event_init_context(struct task_struct *child, int ctxn,
 	 */
 	perf_event_groups_for_each(event, &parent_ctx->pinned_groups) {
 		ret = inherit_task_group(event, parent, parent_ctx,
-					 child, ctxn, clone_flags,
-					 &inherited_all);
+					 child, clone_flags, &inherited_all);
 		if (ret)
 			goto out_unlock;
 	}
@@ -13216,8 +13195,7 @@ static int perf_event_init_context(struct task_struct *child, int ctxn,
 
 	perf_event_groups_for_each(event, &parent_ctx->flexible_groups) {
 		ret = inherit_task_group(event, parent, parent_ctx,
-					 child, ctxn, clone_flags,
-					 &inherited_all);
+					 child, clone_flags, &inherited_all);
 		if (ret)
 			goto out_unlock;
 	}
@@ -13225,7 +13203,7 @@ static int perf_event_init_context(struct task_struct *child, int ctxn,
 	raw_spin_lock_irqsave(&parent_ctx->lock, flags);
 	parent_ctx->rotate_disable = 0;
 
-	child_ctx = child->perf_event_ctxp[ctxn];
+	child_ctx = child->perf_event_ctxp;
 
 	if (child_ctx && inherited_all) {
 		/*
@@ -13261,18 +13239,16 @@ static int perf_event_init_context(struct task_struct *child, int ctxn,
  */
 int perf_event_init_task(struct task_struct *child, u64 clone_flags)
 {
-	int ctxn, ret;
+	int ret;
 
-	memset(child->perf_event_ctxp, 0, sizeof(child->perf_event_ctxp));
+	child->perf_event_ctxp = NULL;
 	mutex_init(&child->perf_event_mutex);
 	INIT_LIST_HEAD(&child->perf_event_list);
 
-	for_each_task_context_nr(ctxn) {
-		ret = perf_event_init_context(child, ctxn, clone_flags);
-		if (ret) {
-			perf_event_free_task(child);
-			return ret;
-		}
+	ret = perf_event_init_context(child, clone_flags);
+	if (ret) {
+		perf_event_free_task(child);
+		return ret;
 	}
 
 	return 0;
@@ -13281,6 +13257,7 @@ int perf_event_init_task(struct task_struct *child, u64 clone_flags)
 static void __init perf_event_init_all_cpus(void)
 {
 	struct swevent_htable *swhash;
+	struct perf_cpu_context *cpuctx;
 	int cpu;
 
 	zalloc_cpumask_var(&perf_online_mask, GFP_KERNEL);
@@ -13288,15 +13265,19 @@ static void __init perf_event_init_all_cpus(void)
 	for_each_possible_cpu(cpu) {
 		swhash = &per_cpu(swevent_htable, cpu);
 		mutex_init(&swhash->hlist_mutex);
-		INIT_LIST_HEAD(&per_cpu(active_ctx_list, cpu));
 
 		INIT_LIST_HEAD(&per_cpu(pmu_sb_events.list, cpu));
 		raw_spin_lock_init(&per_cpu(pmu_sb_events.lock, cpu));
 
-#ifdef CONFIG_CGROUP_PERF
-		INIT_LIST_HEAD(&per_cpu(cgrp_cpuctx_list, cpu));
-#endif
 		INIT_LIST_HEAD(&per_cpu(sched_cb_list, cpu));
+
+		cpuctx = per_cpu_ptr(&cpu_context, cpu);
+		__perf_event_init_context(&cpuctx->ctx);
+		lockdep_set_class(&cpuctx->ctx.mutex, &cpuctx_mutex);
+		lockdep_set_class(&cpuctx->ctx.lock, &cpuctx_lock);
+		cpuctx->online = cpumask_test_cpu(cpu, perf_online_mask);
+		cpuctx->heap_size = ARRAY_SIZE(cpuctx->heap_default);
+		cpuctx->heap = cpuctx->heap_default;
 	}
 }
 
@@ -13318,12 +13299,12 @@ static void perf_swevent_init_cpu(unsigned int cpu)
 #if defined CONFIG_HOTPLUG_CPU || defined CONFIG_KEXEC_CORE
 static void __perf_event_exit_context(void *__info)
 {
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
 	struct perf_event_context *ctx = __info;
-	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
 	struct perf_event *event;
 
 	raw_spin_lock(&ctx->lock);
-	ctx_sched_out(ctx, cpuctx, EVENT_TIME);
+	ctx_sched_out(ctx, EVENT_TIME);
 	list_for_each_entry(event, &ctx->event_list, event_entry)
 		__perf_remove_from_context(event, cpuctx, ctx, (void *)DETACH_GROUP);
 	raw_spin_unlock(&ctx->lock);
@@ -13333,18 +13314,16 @@ static void perf_event_exit_cpu_context(int cpu)
 {
 	struct perf_cpu_context *cpuctx;
 	struct perf_event_context *ctx;
-	struct pmu *pmu;
 
+	// XXX simplify cpuctx->online
 	mutex_lock(&pmus_lock);
-	list_for_each_entry(pmu, &pmus, entry) {
-		cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
-		ctx = &cpuctx->ctx;
+	cpuctx = per_cpu_ptr(&cpu_context, cpu);
+	ctx = &cpuctx->ctx;
 
-		mutex_lock(&ctx->mutex);
-		smp_call_function_single(cpu, __perf_event_exit_context, ctx, 1);
-		cpuctx->online = 0;
-		mutex_unlock(&ctx->mutex);
-	}
+	mutex_lock(&ctx->mutex);
+	smp_call_function_single(cpu, __perf_event_exit_context, ctx, 1);
+	cpuctx->online = 0;
+	mutex_unlock(&ctx->mutex);
 	cpumask_clear_cpu(cpu, perf_online_mask);
 	mutex_unlock(&pmus_lock);
 }
@@ -13358,20 +13337,17 @@ int perf_event_init_cpu(unsigned int cpu)
 {
 	struct perf_cpu_context *cpuctx;
 	struct perf_event_context *ctx;
-	struct pmu *pmu;
 
 	perf_swevent_init_cpu(cpu);
 
 	mutex_lock(&pmus_lock);
 	cpumask_set_cpu(cpu, perf_online_mask);
-	list_for_each_entry(pmu, &pmus, entry) {
-		cpuctx = per_cpu_ptr(pmu->pmu_cpu_context, cpu);
-		ctx = &cpuctx->ctx;
+	cpuctx = per_cpu_ptr(&cpu_context, cpu);
+	ctx = &cpuctx->ctx;
 
-		mutex_lock(&ctx->mutex);
-		cpuctx->online = 1;
-		mutex_unlock(&ctx->mutex);
-	}
+	mutex_lock(&ctx->mutex);
+	cpuctx->online = 1;
+	mutex_unlock(&ctx->mutex);
 	mutex_unlock(&pmus_lock);
 
 	return 0;
@@ -13508,9 +13484,12 @@ static int perf_cgroup_css_online(struct cgroup_subsys_state *css)
 static int __perf_cgroup_move(void *info)
 {
 	struct task_struct *task = info;
-	rcu_read_lock();
-	perf_cgroup_switch(task);
-	rcu_read_unlock();
+
+	preempt_disable();
+	if (atomic_read(this_cpu_ptr(&perf_cgroup_events)))
+		perf_cgroup_switch(task);
+	preempt_enable();
+
 	return 0;
 }
 
-- 
2.31.1

