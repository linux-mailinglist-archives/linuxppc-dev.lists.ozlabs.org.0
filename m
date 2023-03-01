Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F16A77D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrNT0dJ7z3cMY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:41:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cGH9LbMY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cGH9LbMY;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJW6Q8Zz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713884; x=1709249884;
  h=from:to:cc:subject:date:message-id;
  bh=li2YE6VfOGmFg8dqYA0YMZcBhG7kuOX3MhTWXATc9FI=;
  b=cGH9LbMY9VIkkho60T1DbsibjXCJSskdqTXa16fXPnrj6/GCn1Mjofr9
   xOD5Z3QUJVUVHphvV8/18LKufB/UxpR0FEYCy7mCOZaeZdOfORsruMsln
   wpjmle8UgQY09y31Qqky3PLmvGqMyoUBH6lDj5bvmk99gV6Vb6heMJHjV
   tOGduOqK3D49pLlKQQThF4dO7mOhbnTiO+b1Kt8iPx7IQuSrhk1jVFYwj
   oIfPbRfC2l5Lj4stPRDvh7DPUMbh3FLuQl3VuvgZBJe5oASAC4AYJ2nfT
   asQ6cC1nybw84415p42SdIV75M7YJAHO686MJkFrb9Tw+boZQ40zUe2PN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818671"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826781"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826781"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:55 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 00/24] x86: Implement an HPET-based hardlockup detector
Date: Wed,  1 Mar 2023 15:47:29 -0800
Message-Id: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi x86 trusted reviewers,

This is the seventh version of this patchset. I acknowledge that it took me
a long time to post a new version. Sorry! I will commit time to continue
working on this series with high priority and I will post a new series soon
after receiving your new feedback.

Although this series touches several subsystems, I plan to send it to the
x86 maintainers because a) the series does not make much sense if split
into subsystems, b) Thomas Gleixner has reviewed previous versions, and c)
he has contributed to all the subsystems I modify.

Tony Luck has kindly reviewed previous versions of the series and I carried
his Reviewed-by tags. This version, however, has new patches that also need
review.

I seek to collect the Reviewed-by tags from the x86 trusted reviewers for
the following patches:
   + arch/x86: 4, 5
   + Intel IOMMU: 6,
   + AMD IOMMU: 9, 10, 11,
   + NMI watchdog: 23 and 24.

Previous version of the patches can be found in [1], [2], [3], [4], [5],
and [6].

Thanks and BR,
Ricardo

== Problem statement

In x86, the NMI watchdog is driven using a counter (one per CPU) of the
Performance Monitoring Unit (PMU). PMU counters, however, are scarce and
it would be better to keep them available to profile performance.

Moreover, since the counter that the NMI watchdog uses cannot be shared
with any other perf users, the current perf-event subsystem may return a
false positive when validating certain metric groups. Certain metric groups
may never get a chance to be scheduled [7], [8].

== Solution

Find a different source of NMIs to drive the watchdog. The HPET timer can
also generate NMIs at regular intervals.

== Operation of the watchdog

One HPET channel is reserved for the NMI watchdog. One of the CPUs that the
watchdog monitors is designated to handle the NMI from the HPET channel.
In addition to checking itself for hardlockups, it sends an inter-processor
NMI to the rest of the CPUs in the system. They, in turn, check for
hardlockups if required: all CPUs will get the NMI (including offline
CPUs), but only those being monitored will look for hardlockups.

The time-stamp counter (TSC) is used to determine whether the HPET caused
the NMI. The detector computes the value the TSC is expected to have the
next time the HPET channel generates an NMI. Once it does, we read the
actual TSC value. If the difference between the expected and the actual
values is less than a certain value, assume that the source of the NMI is
the HPET channel. I have found experimentally that difference is of less
than 0.2% of the watchdog period (expressed in TSC counts, see patch 20 for
details).

== Limitations

Since all CPUs get the HPET NMI, any isolated CPUs would be disrupted. If
isolated CPUs are specified in the kernel command line, this detector is
not enabled.

The detector may not be available because the HPET is not enabled in all
systems (see commit 6e3cd95234dc ("x86/hpet: Use another crystalballto
evaluate HPET usability")).

The detector depends on having IPI shorthands enabled.

On AMD systems with interrupt remapping enabled, the detector can only be
used in APIC physical mode (see patch 10).

Unlike the perf-based implementation, all monitored CPUs will look for
hardlockups every watchdog_thresh seconds, regardless of their idle
state.

Thus, I envision this detector an opt-in feature for those interested in
claiming the PMU counters.

== Parts of this series ==

For clarity, patches are grouped as follows:

 1) IRQ updates: patches 1-11 refactor parts of the interrupt subsystem
    to support per-interrupt delivery mode and configure the delivery mode
    as NMI.

 2) HPET updates: patches 12-15 are prework in the HPET code to reserve a
    timer that can deliver NMIs.

 3) NMI watchdog: patches 16-18 update the existing hardlockup detector
    to uncouple it from perf.

 4) New HPET-based hardlockup detector: patches 19-21

 5) Hardlockup detector management: patches 22-24 are a collection of
    miscellaneous patches to determine when to use the HPET hardlockup
    detector and stop it if necessary. It also includes an x86-specific
    shim hardlockup detector that selects between the perf- and HPET-based
    implementations.

== Testing ==

Tests were conducted on the master branch of the tip tree. I have put my
patches here here:

https://github.com/ricardon/tip.git rneri/hpet-wdt-v7

+++ Tests for functional correctness

I tested this series in a variety of server parts: Intel's Sapphire Rapids,
Cooperlake, Icelake, Cascadelake, Snowridge, Skylake, Haswell, Broadwell,
and IvyTown as well as AMD's Rome.

I also tested the series in desktop parts such as Alderlake and Haswell,
but had to use hpet=force in the command line.

On these systems, the detector works with and without interrupt remapping,
in both APIC physical and logical destination modes.

I used the test_lockup kernel module to ensure that the hardlockups were
detected:

$ echo 10 > /proc/sys/kernel/watchdog_thresh
$ modprobe test_lockup time_secs=20 iterations=1 state=R disable_irq

Warnings in dmesg indicate that the hardlockup was detected.

I verified that the detector can be stopped, started, and reconfigured.
CPUs can also be added and removed from monitoring. All these using the
interfaces from /proc/sys/kernel.

Also, please see patch 20 for further details on the difference between
the expected and actual TSC values.

== Changelog ==

Changes since v6:
 + Unchanged patches: 3, 6, 7-9, 12, 14, 16-18, 22, 
 + Updated patches: 1, 2, 10, 11, 13, 15, 19,-21, 24
 + New patches: 4, 5, 23
 
 * Dropped patch to expose irq_matrix_find_best_cpu(). (Thomas)
 * Implemented a separate local APIC NMI controller. (Thomas)
 * Removed superfluous checks for X86_IRQ_ALLOC_AS_NMI && nr_irqs in the
   interrupt remapping drivers. (Thomas)
 * Skip vector cleanup for NMI.
 * Dropped patch that created a new NMI_WATCHDOG NMI category.
 * Do not use the HPET NMI watchdog with isolated CPUs.
 * Added a new `hpet_nmi_watchdog` kernel parameter. Do not reuse
   the existing nmi_watchdog. (Nicholas)
 * Fixed a bug in which I incorrectly used an error window of 0.2% of
   tsc_delta.
 * If the TSC becomes unstable, simply stop the HPET NMI watchdog, do not
   start the perf NMI watchdog. (Thomas, Nicholas)

Changes since v5:
 + Unchanged patches: 14, 15, 18, 19, 24, 25, 28
 + Updated patches: 2, 8, 17, 21-23, 26, 29
 + New patches: 1, 3-7, 9-16, 20, 27

 * Added support in the interrupt subsystem to allocate IRQs with NMI mode.
  (patches 1-13)
 * Only enable the detector when IPI shorthands are enabled in the system.
  (patch 22)
 * Delayed the initialization of the hardlockup detector until after
   calling smp_init(). Only then, we know whether IPI shorthands have been
   enabled. (patch 20)
 * Removed code to periodically update the affinity of the HPET NMI to
   rotate among packages or groups of packages.
 * Removed logic to group the monitored CPUs by groups. All CPUs in all
   packages receive IPIs.
 * Removed irq_work to change the affinity of the HPET channel interrupt.
 * Updated the redirection hint in the Intel IOMMU IRTE to match the
   destination mode. (patch 7)
 * Correctly added support for NMI delivery mode in the AMD IOMMU.
   (patches 11-13)
 * Restart the NMI watchdog after refining tsc_khz. (patch 27)
 * Added a check for the allowed maximum frequency of the HPET. (patch 17)
 * Added hpet_hld_free_timer() to properly free the reserved HPET channel
   if the initialization is not completed. (patch 17)
 * Reworked the periodic setting the HPET channel. Rather than changing it
   every time the channel is disabled or enabled, do it only once. While
   at here, wrap the code in an initial setup function. (patch 22)
 * Implemented hardlockup_detector_hpet_start() to be called when tsc_khz is
   is refined. (patch 22)
 * Reduced the error window of the expected TSC value at the time of the
   HPET channel expiration. (patch 23)
 * Described better the heuristics used to determine if the HPET channel
   caused the NMI. (patch 23)
 * Added a table to characterize the error in the expected TSC value when
   the HPET channel fires. (patch 23)
 * Added watchdog_nmi_start() to be used when tsc_khz is recalibrated.
   (patch 26)
 * Always build the x86-specific hardlockup detector shim; not only
   when the HPET-based detector is selected. (patch 26)
 * Relocated the declaration of hardlockup_detector_switch_to_perf() to
   x86/nmi.h It does not depend on HPET.
 * Use time_in_range64() to compare the actual TSC value vs the expected
   value. This makes it more readable. (patch 22)
 * Dropped pointless X86_64 || X86_32 check in Kconfig. (patch 26)

Changes since v4:
 * Added commentary on the tests performed on this feature. (Andi)
 * Added a stub version of hardlockup_detector_switch_to_perf() for
   !CONFIG_HPET_TIMER. (lkp)
 * Use switch to select the type of x86 hardlockup detector. (Andi)
 * Renamed a local variable in update_ticks_per_group(). (Andi)
 * Made this hardlockup detector available to X86_32.
 * Reworked logic to kick the HPET timer to remove a local variable.
   (Andi)
 * Added a comment on what type of timer channel will be assigned to the
   detector. (Andi)
 * Reworded help comment in the X86_HARDLOCKUP_DETECTOR_HPET Kconfig
   option. (Andi)
 * Removed unnecessary switch to level interrupt mode when disabling the
   timer. (Andi)
 * Disabled the HPET timer to avoid a race between an incoming interrupt
   and an update of the MSI destination ID. (Ashok)
 * Renamed hpet_hardlockup_detector_get_timer() as hpet_hld_get_timer()
 * Added commentary on an undocumented udelay() when programming an
   HPET channel in periodic mode. (Ashok)
 * Reworked code to use new enumeration apic_delivery_modes and reworked
   MSI message composition fields [9].
 * Partitioned monitored CPUs into groups. Each CPU in the group is
   inspected for hardlockups using an IPI.
 * Use a round-robin mechanism to update the affinity of the HPET timer.
   Affinity is updated every watchdog_thresh seconds to target the
   handling CPU of the group.
 * Moved update of the HPET interrupt affinity to an irq_work. (Thomas
   Gleixner).
 * Updated expiration of the HPET timer and the expected value of the
   TSC based on the number of groups of monitored CPUs.
 * Renamed hpet_set_comparator() to hpet_set_comparator_periodic() to
   remove decision logic for periodic case. (Thomas Gleixner)
 * Reworked timer reservation to use Thomas' rework on HPET channel
   management [10].
 * Removed hard-coded channel number for the hardlockup detector.
 * Provided more details on the sequence of HPET channel reservation.
   (Thomas Gleixner)
 * Only reserve a channel for the hardlockup detector if enabled via
   kernel command line. The function reserving the channel is called from
   hardlockup detector. (Thomas Gleixner)
 * Dropped hpet_hld_data::enabled_cpus and instead use cpumask_weight().
 * Renamed hpet_hld_data::cpu_monitored_mask to
   hld_data_data.cpu_monitored_mask and converted it to cpumask_var_t.
 * Flushed out any outstanding interrupt before enabling the HPET channel.
 * Removed unnecessary MSI_DATA_LEVEL_ASSERT from the MSI message.
 * Added comments in hardlockup_detector_nmi_handler() to explain how
   CPUs are targeted for an IPI.
 * Updated code to only issue an IPI when needed (i.e., there are CPUs in
   the group other than the handling CPU).
 * Reworked hardlockup_detector_hpet_init() for readability.
 * Now reserve the cpumasks in the hardlockup detector code and not in the
   generic HPET code.
 * Handle the case of watchdog_thresh = 0 when disabling the detector.

Change since v3:
 * Fixed yet another bug in periodic programming of the HPET timer that
   prevented the system from booting.
 * Fixed computation of HPET frequency to use hpet_readl() only.
 * Added a missing #include in the watchdog_hld_hpet.c
 * Fixed various typos and grammar errors (Randy Dunlap)

Changes since v2:
 * Added functionality to switch to the perf-based hardlockup
   detector if the TSC becomes unstable (Thomas Gleixner).
 * Brought back the round-robin mechanism proposed in v1 (this time not
   using the interrupt subsystem). This also requires computing
   expiration times as in v1 (Andi Kleen, Stephane Eranian).
 * Fixed a bug in which using a periodic timer was not working(thanks
   to Suravee Suthikulpanit!).
 * In this version, I incorporate support for interrupt remapping in the
   last 4 patches so that they can be reviewed separately if needed.
 * Removed redundant documentation of functions (Thomas Gleixner).
 * Added a new category of NMI handler, NMI_WATCHDOG, which executes after
   NMI_LOCAL handlers (Andi Kleen).
 * Updated handling of "nmi_watchdog" to support comma-separated
   arguments.
 * Undid split of the generic hardlockup detector into a separate file
   (Thomas Gleixner).
 * Added a new intermediate symbol CONFIG_HARDLOCKUP_DETECTOR_CORE to
   select generic parts of the detector (Paul E. McKenney,
   Thomas Gleixner).
 * Removed use of struct cpumask in favor of a variable length array in
   conjunction with kzalloc (Peter Zijlstra).
 * Added CPU as argument hardlockup_detector_hpet_enable()/disable()
   (Thomas Gleixner).
 * Remove unnecessary export of function declarations, flags, and bit
   fields (Thomas Gleixner).
 * Removed  unnecessary check for FSB support when reserving timer for the
   detector (Thomas Gleixner).
 * Separated TSC code from HPET code in kick_timer() (Thomas Gleixner).
 * Reworked condition to check if the expected TSC value is within the
   error margin to avoid conditional (Peter Zijlstra).
 * Removed TSC error margin from struct hld_data; use global variable
   instead (Peter Zijlstra).
 * Removed previously introduced watchdog_get_allowed_cpumask*() and
   reworked hardlockup_detector_hpet_enable()/disable() to not need
   access to watchdog_allowed_mask (Thomas Gleixner).

Changes since v1:
 * Removed reads to HPET registers at every NMI. Instead use the time-stamp
   counter to infer the interrupt source (Thomas Gleixner, Andi Kleen).
 * Do not target CPUs in a round-robin manner. Instead, the HPET timer
   always targets the same CPU; other CPUs are monitored via an
   interprocessor interrupt.
 * Removed use of generic irq code to set interrupt affinity and NMI
   delivery. Instead, configure the interrupt directly in HPET registers
   (Thomas Gleixner).
 * Removed the proposed ops structure for NMI watchdogs. Instead, split
   the existing implementation into a generic library and perf-specific
   infrastructure (Thomas Gleixner, Nicholas Piggin).
 * Added an x86-specific shim hardlockup detector that selects between
   HPET and perf infrastructures as needed (Nicholas Piggin).
 * Removed locks taken in NMI and !NMI context. This was wrong and is no
   longer needed (Thomas Gleixner).
 * Fixed unconditional return NMI_HANDLED when the HPET timer is programmed
   for FSB/MSI delivery (Peter Zijlstra).

[1]. https://lore.kernel.org/lkml/1528851463-21140-1-git-send-email-ricardo.neri-calderon@linux.intel.com/
[2]. https://lore.kernel.org/lkml/1551283518-18922-1-git-send-email-ricardo.neri-calderon@linux.intel.com/
[3]. https://lore.kernel.org/lkml/1557842534-4266-1-git-send-email-ricardo.neri-calderon@linux.intel.com/
[4]. https://lore.kernel.org/lkml/1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com/
[5]. https://lore.kernel.org/lkml/20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com/T/
[6]. https://lore.kernel.org/all/20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com/
[7]. https://lore.kernel.org/lkml/20200117091341.GX2827@hirez.programming.kicks-ass.net/
[8]. https://lore.kernel.org/lkml/1582581564-184429-1-git-send-email-kan.liang@linux.intel.com/
[9]. https://lore.kernel.org/all/20201024213535.443185-6-dwmw2@infradead.org/
[10]. https://lore.kernel.org/lkml/20190623132340.463097504@linutronix.de/

Ricardo Neri (24):
  x86/apic: Add irq_cfg::delivery_mode
  x86/apic/msi: Use the delivery mode from irq_cfg for message
    composition
  x86/apic: Add the X86_IRQ_ALLOC_AS_NMI interrupt allocation flag
  x86/apic/vector: Implement a local APIC NMI controller
  x86/apic/vector: Skip cleanup for the NMI vector
  iommu/vt-d: Clear the redirection hint when the destination mode is
    physical
  iommu/vt-d: Rework prepare_irte() to support per-interrupt delivery
    mode
  iommu/vt-d: Set the IRTE delivery mode individually for each interrupt
  iommu/amd: Expose [set|get]_dev_entry_bit()
  iommu/amd: Enable NMIPass when allocating an NMI
  iommu/amd: Compose MSI messages for NMIs in non-IR format
  x86/hpet: Expose hpet_writel() in header
  x86/hpet: Add helper function hpet_set_comparator_periodic()
  x86/hpet: Prepare IRQ assignments to use the X86_ALLOC_AS_NMI flag
  x86/hpet: Reserve an HPET channel for the hardlockup detector
  watchdog/hardlockup: Define a generic function to detect hardlockups
  watchdog/hardlockup: Decouple the hardlockup detector from perf
  init/main: Delay initialization of the lockup detector after
    smp_init()
  x86/watchdog/hardlockup: Add an HPET-based hardlockup detector
  x86/watchdog/hardlockup/hpet: Determine if HPET timer caused NMI
  watchdog/hardlockup/hpet: Only enable the HPET watchdog via a boot
    parameter
  x86/watchdog: Add a shim hardlockup detector
  watchdog: Introduce hardlockup_detector_mark_unavailable()
  x86/tsc: Stop the HPET hardlockup detector if TSC become unstable

 .../admin-guide/kernel-parameters.txt         |   8 +
 arch/x86/Kconfig.debug                        |  11 +
 arch/x86/include/asm/hpet.h                   |  49 ++
 arch/x86/include/asm/hw_irq.h                 |   5 +-
 arch/x86/include/asm/irqdomain.h              |   1 +
 arch/x86/include/asm/nmi.h                    |   6 +
 arch/x86/kernel/Makefile                      |   3 +
 arch/x86/kernel/apic/apic.c                   |   2 +-
 arch/x86/kernel/apic/vector.c                 |  67 +++
 arch/x86/kernel/hpet.c                        | 157 +++++-
 arch/x86/kernel/tsc.c                         |   3 +
 arch/x86/kernel/watchdog_hld.c                |  97 ++++
 arch/x86/kernel/watchdog_hld_hpet.c           | 449 ++++++++++++++++++
 drivers/iommu/amd/amd_iommu.h                 |   3 +
 drivers/iommu/amd/init.c                      |   4 +-
 drivers/iommu/amd/iommu.c                     |  31 +-
 drivers/iommu/intel/irq_remapping.c           |  23 +-
 include/linux/irq.h                           |   5 +
 include/linux/nmi.h                           |   8 +-
 init/main.c                                   |   4 +-
 kernel/Makefile                               |   2 +-
 kernel/watchdog.c                             |  20 +
 kernel/watchdog_hld.c                         |  50 +-
 lib/Kconfig.debug                             |   4 +
 24 files changed, 962 insertions(+), 50 deletions(-)
 create mode 100644 arch/x86/kernel/watchdog_hld.c
 create mode 100644 arch/x86/kernel/watchdog_hld_hpet.c

-- 
2.25.1

