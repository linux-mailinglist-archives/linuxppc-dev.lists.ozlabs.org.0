Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5040745F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 03:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5w0k3vJrz3059
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 11:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5w0F0ZwBz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 11:20:11 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="221271938"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="221271938"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 18:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="695261605"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2021 18:19:06 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v5 0/6] sched/fair: Fix load balancing of SMT siblings with
 ASYM_PACKING
Date: Fri, 10 Sep 2021 18:18:13 -0700
Message-Id: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Len Brown <len.brown@intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Aubrey Li <aubrey.li@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ricardo Neri <ricardo.neri@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 Quentin Perret <qperret@google.com>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v5 the series. v1, v2, v3, and v4 patches and test results can be
found in [1], [2], [3], and [4], respectively.

=== Problem statement ===
++ Load balancing ++

When using asymmetric packing, there exists CPU topologies with three
priority levels in which only a subset of the physical cores support SMT.
An instance of such topology is Intel Alderlake, a hybrid processor with
a mixture of Intel Core (with support for SMT) and Intel Atom CPUs.

On Alderlake, it is almost always beneficial to spread work by picking
first the Core CPUs, then the Atoms and at last the SMT siblings.

The current load balancer, however, does not behave as described when using
ASYM_PACKING. Instead, the load balancer will choose higher-priority CPUs 
(an Intel Core) over medium-priority CPUs (an Intel Atom), and subsequently
overflow the load to a low priority SMT sibling CPU. This leaves medium-
priority CPUs idle while low-priority CPUs are busy.

This patchset fixes this behavior by also checking the idle state of the
SMT siblings of both the CPU doing the load balance and the busiest
candidate group when deciding whether the destination CPUs can pull tasks
from the busiest CPU.

++ Rework ASYM_PACKING priorities with ITMT ++
We also reworked the priority computation of the SMT siblings to ensure
that higher-numbered SMT siblings are always low priority. The current
computation may lead to situations in which in some processors those
higher-numbered SMT siblings have the same priority as the Intel Atom
CPUs.

=== Testing ===
I ran a few benchmarks with and without this version of the patchset on
an Intel Alderlake system with 8 Intel Core (with SMT) and 8 Intel
Atom CPUs.

The baseline for the results is an unmodified v5.14 kernel. Results
show a comparative percentage of improvement (positive) or degradation
(negative). Each test case is repeated eight times, and the standard
deviation among repetitions is also documented.

Table 1 shows the results when using hardware-controlled performance
performance states (HWP), a common use case. The impact of the patches
is overall positive with a few test cases showing slight degradation.
hackbench is especially difficult to assess it shows a high degree of
variability.

Thanks and BR,
Ricardo

ITMT: Intel Turbo Boost Max Technology 3.0

========
Changes since v4:
  * Use sg_lb_stats::sum_nr_running the idle state of a scheduling group.
    (patch 6, Vincent, Peter)
  * Do not even idle CPUs in asym_smt_can_pull_tasks(). (patch 6, Vincent)
  * Unchanged patches: 1, 2, 3, 4, 5.

Changes since v3:
  * Reworked the ITMT priority computation to further reduce the priority
    of SMT siblings (patch 1).
  * Clear scheduling group flags when a child scheduling level
    degenerates (patch 2).
  * Removed arch-specific hooks (patch 6, PeterZ)
  * Removed redundant checks for the local group. (patch 5, Dietmar)
  * Removed redundant check for local idle CPUs and local group
    utilization. (patch 6, Joel)
  * Reworded commit messages of patches 2, 3, 5, and 6 for clarity.
    (Len, PeterZ)
  * Added Joel's Reviewed-by tag.
  * Unchanged patches: 4

Changes since v2:
  * Removed arch_sched_asym_prefer_early() and re-evaluation of the
    candidate busiest group in update_sd_pick_busiest(). (PeterZ)
  * Introduced sched_group::flags to reflect the properties of CPUs
    in the scheduling group. This helps to identify scheduling groups
    whose CPUs are SMT siblings. (PeterZ)
  * Modified update_sg_lb_stats() to get statistics of the scheduling
    domain as an argument. This provides it with the statistics of the
    local domain. (PeterZ)
  * Introduced sched_asym() to decide if a busiest candidate group can
    be marked for asymmetric packing.
  * Reworded patch 1 for clarity. (PeterZ)

Changes since v1:
  * Don't bailout in update_sd_pick_busiest() if dst_cpu cannot pull
    tasks. Instead, reclassify the candidate busiest group, as it
    may still be selected. (PeterZ)
  * Avoid an expensive and unnecessary call to cpumask_weight() when
    determining if a sched_group is comprised of SMT siblings.
    (PeterZ).
  * Updated test results using the v2 patches.


========      Table 1. Test results of patches with HWP        ========
=======================================================================

hackbench
=========
case                    load            baseline(std%)  compare%( std%)
process-pipe            group-1          1.00 ( 18.21)   +4.95 ( 11.79)
process-pipe            group-2          1.00 ( 10.09)   -2.41 ( 14.12)
process-pipe            group-4          1.00 ( 29.09)   -4.04 ( 22.58)
process-pipe            group-8          1.00 (  6.76)   -1.61 (  8.13)
process-pipe            group-12         1.00 ( 12.39)   +3.90 (  7.59)
process-pipe            group-16         1.00 (  5.78)   -3.65 (  7.90)
process-pipe            group-20         1.00 (  4.71)   -2.70 (  5.17)
process-pipe            group-24         1.00 (  9.44)  -11.20 ( 10.22)
process-pipe            group-32         1.00 (  9.29)   -0.84 (  7.04)
process-pipe            group-48         1.00 (  7.47)   +0.66 (  5.90)
process-sockets         group-1          1.00 ( 13.53)   -9.60 (  7.91)
process-sockets         group-2          1.00 ( 21.92)   +7.48 (  9.23)
process-sockets         group-4          1.00 ( 14.59)   +9.43 ( 11.85)
process-sockets         group-8          1.00 (  9.43)   +4.67 (  6.23)
process-sockets         group-12         1.00 ( 12.80)   +7.44 ( 12.62)
process-sockets         group-16         1.00 (  8.47)   +2.12 (  9.45)
process-sockets         group-20         1.00 (  5.86)   +2.41 (  3.20)
process-sockets         group-24         1.00 (  4.47)   +4.56 (  3.14)
process-sockets         group-32         1.00 (  4.40)   +5.41 (  3.11)
process-sockets         group-48         1.00 ( 16.60)  +14.69 (  3.08)
threads-pipe            group-1          1.00 (  3.49)   -0.91 (  3.37)
threads-pipe            group-2          1.00 ( 17.48)   +7.36 (  8.81)
threads-pipe            group-4          1.00 ( 17.58)   -2.36 ( 18.80)
threads-pipe            group-8          1.00 (  9.58)   -1.26 (  6.24)
threads-pipe            group-12         1.00 (  6.49)   +2.34 (  4.37)
threads-pipe            group-16         1.00 ( 15.49)   -6.13 ( 14.84)
threads-pipe            group-20         1.00 (  2.76)   -7.87 (  7.93)
threads-pipe            group-24         1.00 ( 13.80)   +3.46 ( 11.91)
threads-pipe            group-32         1.00 (  8.12)   -2.91 (  8.20)
threads-pipe            group-48         1.00 (  5.79)   -3.95 (  5.44)
threads-sockets         group-1          1.00 ( 11.24)   -4.56 ( 10.01)
threads-sockets         group-2          1.00 (  6.81)   +0.60 (  4.95)
threads-sockets         group-4          1.00 (  8.78)   -0.79 (  7.86)
threads-sockets         group-8          1.00 (  6.51)  -15.64 ( 15.33)
threads-sockets         group-12         1.00 ( 12.30)   -7.09 ( 12.45)
threads-sockets         group-16         1.00 (  8.65)   +3.77 (  8.25)
threads-sockets         group-20         1.00 (  5.52)   +4.40 (  3.48)
threads-sockets         group-24         1.00 (  2.89)   +2.54 (  2.68)
threads-sockets         group-32         1.00 (  3.49)   +1.17 (  3.02)
threads-sockets         group-48         1.00 (  3.15)   -3.95 ( 10.64)

netperf
=======
case                    load            baseline(std%)  compare%( std%)
TCP_RR                  thread-1         1.00 (  0.55)   -0.12 (  0.47)
TCP_RR                  thread-2         1.00 (  0.77)   -0.44 (  0.65)
TCP_RR                  thread-4         1.00 (  0.73)   +0.26 (  0.61)
TCP_RR                  thread-8         1.00 (  1.21)   -0.18 (  1.18)
TCP_RR                  thread-12        1.00 (  1.91)   -0.29 (  2.25)
TCP_RR                  thread-16        1.00 (  4.18)   -0.45 (  3.78)
TCP_RR                  thread-20        1.00 (  2.09)   -0.83 (  1.75)
TCP_RR                  thread-24        1.00 (  1.23)   -0.42 (  1.35)
TCP_RR                  thread-32        1.00 ( 13.72)   +6.22 ( 16.10)
TCP_RR                  thread-48        1.00 ( 12.91)   -0.38 ( 13.37)
UDP_RR                  thread-1         1.00 (  0.85)   +0.04 (  0.75)
UDP_RR                  thread-2         1.00 (  0.57)   -0.56 (  0.62)
UDP_RR                  thread-4         1.00 (  0.65)   -0.04 (  0.78)
UDP_RR                  thread-8         1.00 (  1.24)   -0.46 (  8.31)
UDP_RR                  thread-12        1.00 (  6.87)   +0.01 (  1.27)
UDP_RR                  thread-16        1.00 (  6.07)   -0.30 (  1.51)
UDP_RR                  thread-20        1.00 (  1.00)   -0.97 (  0.87)
UDP_RR                  thread-24        1.00 (  0.67)   +0.65 (  4.39)
UDP_RR                  thread-32        1.00 ( 15.59)   +3.27 ( 17.34)
UDP_RR                  thread-48        1.00 ( 12.56)   -1.28 ( 13.43)

tbench
======
case                    load            baseline(std%)  compare%( std%)
loopback                thread-1         1.00 (  0.59)   +0.06 (  0.53)
loopback                thread-2         1.00 (  0.44)   -0.69 (  0.66)
loopback                thread-4         1.00 (  0.27)   +0.61 (  0.31)
loopback                thread-8         1.00 (  0.25)   -0.18 (  0.20)
loopback                thread-12        1.00 (  1.12)   -0.23 (  0.85)
loopback                thread-16        1.00 (  0.40)   -0.25 (  1.59)
loopback                thread-20        1.00 (  0.20)   +0.58 (  0.34)
loopback                thread-24        1.00 (  6.93)   +0.73 (  8.46)
loopback                thread-32        1.00 (  4.61)   +0.96 (  1.62)
loopback                thread-48        1.00 (  2.33)   +1.45 (  0.97)

schbench
========
case                    load            baseline(std%)  compare%( std%)
normal                  mthread-1        1.00 (  4.39)   -0.37 (  6.53)
normal                  mthread-2        1.00 (  2.44)   +0.96 (  4.31)
normal                  mthread-4        1.00 (  9.47)  +13.26 ( 19.52)
normal                  mthread-8        1.00 (  0.06)   -1.05 (  2.31)
normal                  mthread-12       1.00 (  2.62)   -0.66 (  2.21)
normal                  mthread-16       1.00 (  1.90)   +0.21 (  1.70)
normal                  mthread-20       1.00 (  2.25)   -0.44 (  2.41)
normal                  mthread-24       1.00 (  1.89)   -0.05 (  1.78)
normal                  mthread-32       1.00 (  2.04)   -0.28 (  1.92)
normal                  mthread-48       1.00 (  4.43)   +1.10 (  3.86)

[1]. https://lore.kernel.org/lkml/20210406041108.7416-1-ricardo.neri-calderon@linux.intel.com/
[2]. https://lore.kernel.org/lkml/20210414020436.12980-1-ricardo.neri-calderon@linux.intel.com/
[3]. https://lore.kernel.org/lkml/20210513154909.6385-1-ricardo.neri-calderon@linux.intel.com/
[4]. https://lore.kernel.org/lkml/20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com/

Ricardo Neri (6):
  x86/sched: Decrease further the priorities of SMT siblings
  sched/topology: Introduce sched_group::flags
  sched/fair: Optimize checking for group_asym_packing
  sched/fair: Provide update_sg_lb_stats() with sched domain statistics
  sched/fair: Carve out logic to mark a group for asymmetric packing
  sched/fair: Consider SMT in ASYM_PACKING load balance

 arch/x86/kernel/itmt.c  |   2 +-
 kernel/sched/fair.c     | 121 ++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h    |   1 +
 kernel/sched/topology.c |  21 ++++++-
 4 files changed, 131 insertions(+), 14 deletions(-)

-- 
2.17.1

