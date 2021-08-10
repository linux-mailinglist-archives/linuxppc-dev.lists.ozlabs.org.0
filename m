Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D02FA3E5E3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 16:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkbMV5Thpz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 00:44:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkbK8542Nz30G9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 00:42:52 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278663297"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="278663297"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 07:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="526170583"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2021 07:41:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v4 3/6] sched/fair: Optimize checking for group_asym_packing
Date: Tue, 10 Aug 2021 07:41:42 -0700
Message-Id: <20210810144145.18776-4-ricardo.neri-calderon@linux.intel.com>
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

sched_asmy_prefer() always returns false when called on the local group. By
checking local_group, we can avoid additional checks and invoking
sched_asmy_prefer() when it is not needed. No functional changes are
introduced.

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
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v3:
  * Further rewording of the commit message. (Len)

Changes since v2:
  * Reworded the commit message for clarity. (Peter Z)

Changes since v1:
  * None
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 44e44c235f1f..3b686e18a39b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8591,7 +8591,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 	}
 
 	/* Check if dst CPU is idle and preferred to this group */
-	if (env->sd->flags & SD_ASYM_PACKING &&
+	if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
 	    env->idle != CPU_NOT_IDLE &&
 	    sgs->sum_h_nr_running &&
 	    sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu)) {
-- 
2.17.1

