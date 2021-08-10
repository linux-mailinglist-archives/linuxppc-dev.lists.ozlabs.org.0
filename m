Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F13E5E39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 16:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkbM305Ytz3dHZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 00:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkbK74xsjz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 00:42:51 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278663292"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="278663292"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 07:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="526170578"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2021 07:41:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v4 2/6] sched/topology: Introduce sched_group::flags
Date: Tue, 10 Aug 2021 07:41:41 -0700
Message-Id: <20210810144145.18776-3-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: Len Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Aubrey Li <aubrey.li@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ricardo Neri <ricardo.neri@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 Quentin Perret <qperret@google.com>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There exist situations in which the load balance needs to know the
properties of the CPUs in a scheduling group. When using asymmetric
packing, for instance, the load balancer needs to know not only the
state of dst_cpu but also of its SMT siblings, if any.

Use the flags of the child scheduling domains to initialize scheduling
group flags. This will reflect the properties of the CPUs in the
group.

A subsequent changeset will make use of these new flags. No functional
changes are introduced.

Cc: Aubrey Li <aubrey.li@intel.com>
Cc: Ben Segall <bsegall@google.com>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Quentin Perret <qperret@google.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Reviewed-by: Len Brown <len.brown@intel.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v3:
  * Clear the flags of the scheduling groups of a domain if its child is
    destroyed.
  * Minor rewording of the commit message.

Changes since v2:
  * Introduced this patch.

Changes since v1:
  * N/A
---
 kernel/sched/sched.h    |  1 +
 kernel/sched/topology.c | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a2c6f6ae6392..fb716e78974d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1799,6 +1799,7 @@ struct sched_group {
 	unsigned int		group_weight;
 	struct sched_group_capacity *sgc;
 	int			asym_prefer_cpu;	/* CPU of highest priority in group */
+	int			flags;
 
 	/*
 	 * The CPUs this group covers.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b77ad49dc14f..27c959de175d 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -716,8 +716,20 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 		tmp = sd;
 		sd = sd->parent;
 		destroy_sched_domain(tmp);
-		if (sd)
+		if (sd) {
+			struct sched_group *sg = sd->groups;
+
+			/*
+			 * sched groups hold the flags of the child sched
+			 * domain for convenience. Clear such flags since
+			 * the child is being destroyed.
+			 */
+			do {
+				sg->flags = 0;
+			} while (sg != sd->groups);
+
 			sd->child = NULL;
+		}
 	}
 
 	for (tmp = sd; tmp; tmp = tmp->parent)
@@ -916,10 +928,12 @@ build_group_from_child_sched_domain(struct sched_domain *sd, int cpu)
 		return NULL;
 
 	sg_span = sched_group_span(sg);
-	if (sd->child)
+	if (sd->child) {
 		cpumask_copy(sg_span, sched_domain_span(sd->child));
-	else
+		sg->flags = sd->child->flags;
+	} else {
 		cpumask_copy(sg_span, sched_domain_span(sd));
+	}
 
 	atomic_inc(&sg->ref);
 	return sg;
@@ -1169,6 +1183,7 @@ static struct sched_group *get_group(int cpu, struct sd_data *sdd)
 	if (child) {
 		cpumask_copy(sched_group_span(sg), sched_domain_span(child));
 		cpumask_copy(group_balance_mask(sg), sched_group_span(sg));
+		sg->flags = child->flags;
 	} else {
 		cpumask_set_cpu(cpu, sched_group_span(sg));
 		cpumask_set_cpu(cpu, group_balance_mask(sg));
-- 
2.17.1

