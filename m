Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13573E5E33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 16:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkbKz4KdRz3btZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 00:43:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkbK53Jmnz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 00:42:47 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278663285"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="278663285"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 07:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="526170553"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2021 07:41:43 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v4 0/6] sched/fair: Fix load balancing of SMT siblings with
 ASYM_PACKING
Date: Tue, 10 Aug 2021 07:41:39 -0700
Message-Id: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
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
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
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

This is v4 the series. v1, v2, and v3 patches and test results can be found
in [1], [2], and [3], respectively.

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

++ Rework ASYM_PACKING priorities with ITMT
We also reworked the priority computation of the SMT siblings to ensure
that higher-numbered SMT siblings are always low priority. The current
computation may lead to situations in which in some processors those
higher-numbered SMT siblings have the same priority as the Intel Atom
CPUs.

=== Testing ===
I ran a few benchmarks with and without this version of the patchset on
an Intel Alderlake system with 8 Intel Core (with SMT) and 8 Intel
Atom CPUs.

The baseline for the results is an unmodified v5.13-rc4 kernel. Results
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
process-pipe            group-1          1.00 (  1.45)   -2.99 (  4.35)
process-pipe            group-2          1.00 ( 18.32)   +2.14 (  8.33)
process-pipe            group-4          1.00 ( 17.27)  -10.68 ( 15.85)
process-pipe            group-8          1.00 ( 12.33)   +2.26 ( 13.28)
process-pipe            group-12         1.00 (  6.52)   -4.07 (  7.97)
process-pipe            group-16         1.00 (  9.70)   -7.71 (  6.01)
process-pipe            group-20         1.00 (  2.52)   -4.15 (  6.35)
process-pipe            group-24         1.00 (  4.84)   +1.04 (  4.60)
process-pipe            group-32         1.00 (  4.79)   +1.72 (  5.13)
process-pipe            group-48         1.00 (  6.77)   +4.68 (  4.24)
process-sockets         group-1          1.00 (  1.89)   +0.53 (  3.48)
process-sockets         group-2          1.00 (  7.57)   -6.16 (  4.52)
process-sockets         group-4          1.00 ( 14.62)   +4.93 (  7.11)
process-sockets         group-8          1.00 (  7.69)   +3.15 (  7.19)
process-sockets         group-12         1.00 (  4.97)   +2.49 (  2.80)
process-sockets         group-16         1.00 (  3.93)   -1.57 (  3.86)
process-sockets         group-20         1.00 (  2.56)   -3.63 (  2.88)
process-sockets         group-24         1.00 (  3.00)   +0.74 (  3.01)
process-sockets         group-32         1.00 (  7.63)   +1.79 (  3.67)
process-sockets         group-48         1.00 (  4.15)   -0.44 (  3.70)
threads-pipe            group-1          1.00 (  2.34)   -0.55 (  3.78)
threads-pipe            group-2          1.00 ( 12.74)   -2.24 ( 12.96)
threads-pipe            group-4          1.00 ( 10.03)   +5.80 ( 16.02)
threads-pipe            group-8          1.00 (  7.45)  -12.09 ( 22.91)
threads-pipe            group-12         1.00 (  5.00)  -15.25 ( 10.86)
threads-pipe            group-16         1.00 (  7.41)   +1.95 ( 11.73)
threads-pipe            group-20         1.00 (  7.31)   -1.72 (  5.17)
threads-pipe            group-24         1.00 (  4.48)   +0.43 (  6.39)
threads-pipe            group-32         1.00 (  3.75)   -0.62 (  3.87)
threads-pipe            group-48         1.00 (  1.56)   -3.69 (  5.99)
threads-sockets         group-1          1.00 (  2.27)   +3.51 (  3.79)
threads-sockets         group-2          1.00 (  6.86)   -8.42 ( 11.39)
threads-sockets         group-4          1.00 (  5.28)  -14.35 (  8.73)
threads-sockets         group-8          1.00 ( 11.74)   +5.04 (  5.18)
threads-sockets         group-12         1.00 (  3.29)   -6.15 (  7.08)
threads-sockets         group-16         1.00 (  5.07)   -1.40 (  6.49)
threads-sockets         group-20         1.00 (  4.38)   -5.44 (  5.68)
threads-sockets         group-24         1.00 (  7.20)   +3.67 (  3.99)
threads-sockets         group-32         1.00 (  3.30)   +0.10 (  3.08)
threads-sockets         group-48         1.00 (  4.83)   +4.83 (  3.61)

netperf
=======
case                    load            baseline(std%)  compare%( std%)
TCP_RR                  thread-1         1.00 (  0.00)   +1.20 (  0.71)
TCP_RR                  thread-2         1.00 (  3.03)   +0.25 (  3.05)
TCP_RR                  thread-4         1.00 (  1.99)   +1.21 (  3.40)
TCP_RR                  thread-8         1.00 (  1.36)   -2.00 (  6.79)
TCP_RR                  thread-12        1.00 (  4.53)   +1.68 (  0.95)
TCP_RR                  thread-16        1.00 (  0.56)   -1.20 (  1.27)
TCP_RR                  thread-20        1.00 (  2.41)   +0.68 (  0.36)
TCP_RR                  thread-24        1.00 (  1.27)   -0.16 (  0.29)
TCP_RR                  thread-32        1.00 ( 11.14)   -0.35 ( 11.10)
TCP_RR                  thread-48        1.00 ( 18.56)   -0.12 ( 19.98)
UDP_RR                  thread-1         1.00 (  0.00)   +1.85 (  1.53)
UDP_RR                  thread-2         1.00 (  2.78)   -2.02 (  3.14)
UDP_RR                  thread-4         1.00 (  2.26)   -0.54 (  2.42)
UDP_RR                  thread-8         1.00 (  1.46)   -1.49 (  5.31)
UDP_RR                  thread-12        1.00 (  0.70)   +0.21 (  1.64)
UDP_RR                  thread-16        1.00 (  1.26)   -1.90 (  2.87)
UDP_RR                  thread-20        1.00 (  0.29)   +0.29 (  0.27)
UDP_RR                  thread-24        1.00 (  2.75)   +2.61 (  0.97)
UDP_RR                  thread-32        1.00 ( 11.16)   -2.90 ( 11.26)
UDP_RR                  thread-48        1.00 ( 19.22)   +3.12 ( 17.32)

tbench
======
case                    load            baseline(std%)  compare%( std%)
loopback                thread-1         1.00 (  1.33)   +1.41 (  0.38)
loopback                thread-2         1.00 (  1.03)   +0.06 (  1.08)
loopback                thread-4         1.00 (  1.05)   -0.74 (  1.65)
loopback                thread-8         1.00 (  5.81)   +6.66 (  0.31)
loopback                thread-12        1.00 (  0.60)   +0.32 (  0.20)
loopback                thread-16        1.00 (  1.38)   +1.67 (  0.34)
loopback                thread-20        1.00 (  2.49)   +0.24 (  2.96)
loopback                thread-24        1.00 (  2.26)   +0.75 (  0.29)
loopback                thread-32        1.00 (  2.54)   +0.07 (  2.83)
loopback                thread-48        1.00 (  2.40)   +1.90 (  2.32)

schbench
========
case                    load            baseline(std%)  compare%( std%)
normal                  mthread-1        1.00 (  3.51)   +1.03 (  2.96)
normal                  mthread-2        1.00 (  2.33)   +6.35 (  6.19)
normal                  mthread-4        1.00 (  9.58)   +0.12 (  8.02)
normal                  mthread-8        1.00 (  1.59)   +0.40 (  0.07)
normal                  mthread-12       1.00 (  3.18)   +1.51 (  4.19)
normal                  mthread-16       1.00 (  1.72)   +0.00 (  1.72)
normal                  mthread-20       1.00 (  1.43)   +0.80 (  3.16)
normal                  mthread-24       1.00 (  1.38)   -1.69 (  1.71)
normal                  mthread-32       1.00 (  1.86)   -0.78 (  2.25)
normal                  mthread-48       1.00 (  3.50)   -2.81 (  2.82)
========

[1]. https://lore.kernel.org/lkml/20210406041108.7416-1-ricardo.neri-calderon@linux.intel.com/
[2]. https://lore.kernel.org/lkml/20210414020436.12980-1-ricardo.neri-calderon@linux.intel.com/
[3]. https://lore.kernel.org/lkml/20210513154909.6385-1-ricardo.neri-calderon@linux.intel.com/

Ricardo Neri (6):
  x86/sched: Decrease further the priorities of SMT siblings
  sched/topology: Introduce sched_group::flags
  sched/fair: Optimize checking for group_asym_packing
  sched/fair: Provide update_sg_lb_stats() with sched domain statistics
  sched/fair: Carve out logic to mark a group for asymmetric packing
  sched/fair: Consider SMT in ASYM_PACKING load balance

 arch/x86/kernel/itmt.c  |   2 +-
 kernel/sched/fair.c     | 122 ++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h    |   1 +
 kernel/sched/topology.c |  21 ++++++-
 4 files changed, 132 insertions(+), 14 deletions(-)

-- 
2.17.1

