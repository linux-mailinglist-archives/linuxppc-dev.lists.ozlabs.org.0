Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DA51CD2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 01:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvVzY15Dtz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:59:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6vOm0+T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K6vOm0+T; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVz02Z4wz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:58:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795132; x=1683331132;
 h=from:to:cc:subject:date:message-id;
 bh=soIVEyz4ojmtua+pu1aPxNtiC16PkqYVN1dD4v1+Mno=;
 b=K6vOm0+TBehJ2CQeS0FAu3nPvMtLiLZF74ugExgRBFc3P7q+lzRRyIEI
 xQgcLZkGCIINz9twUowe2n8YP1vI5lucgHKTY/q9kodBveuCCfmMUgX5y
 8JHo2PzKtq927wCFaTqJvu3jfgN0/QKcXF8pzckNevd+Oi4Xfbz5S0SyX
 /03IIDisKNnLpbEHk+ULXEYwsWafGyHPkrO3Uc2le/qch8R+a66j4Qiw4
 ivUiFqd0wMICV8J/2o5D+duk8nT77jHb3JerF4LFb59vPUqzV6GMFyzWa
 faeYOvscMsHQtAv3KS8yWmsDVrI+Um8LnDHNb+OF/jG88UWj+nwBlEL/l g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437279"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914315"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:43 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 00/29] x86: Implement an HPET-based hardlockup detector
Date: Thu,  5 May 2022 16:59:39 -0700
Message-Id: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is the sixth version of this patchset. It again took me a while to
post this version as I have been working on other projects and implemented
major reworks in the series.

This work has gone through several versions. I have incorporated feedback
from Thomas Gleixner and others. Many of the patches have review tags (the
patches for arch/x86 have review tags from the trusted x86 reviewers).
I believe it is ready for review by the x86 maintainers. Thus, I have
dropped the RFC qualifier.

I would especially appreciate review from the IOMMU experts on the patches
for the AMD IOMMU (patches 11-13) and from the powerpc experts on the
refactoring of the generic hardlockup detector (patches 18-20, 24, 28).

Also, I observed the error in the expected TSC value has its largest value
when the system just booted. Afterwards, the error becomes very small. In
this version allows a larger than necessary error. I also would appreciate
feedback on this particular. Perhaps the system can switch to this detector
after boot and free up the PMU counters. Please see the Testing section for
details.

Previous version of the patches can be found in [1], [2], [3], [4], and
[5]. Also, thanks to Thomas' feedback, this version handles the changes to
the interrupt subsystem more cleanly and therefore it is not necessary to
handle interrupt remapping separately [6] as in the last version.

For easier review, please refer to the changelog below for a list of
unchanged, updated, and new patches.

== Problem statement

In CPU architectures that do not have an non-maskable (NMI) watchdog, one
can be constructed using any resource capable of issuing NMIs. In x86,
this is done using a counter (one per CPU) of the Performance Monitoring
Unit (PMU). PMU counters, however, are scarce and used mainly to profile
workloads. Using them for the NMI watchdog is an overkill.

Moreover, since the counter that the NMI watchdog uses cannot be shared
with any other perf users, the current perf-event subsystem may return a
false positive when validating certain metric groups. Certain metric groups
may never get a chance to be scheduled [7], [8].

== Description of the detector

Unlike the perf-based hardlockup detector, this implementation is driven by
a single source of NMIs: an HPET channel. One of the CPUs that the
hardlockup detector monitors handles the HPET NMI. Upon reception, it
issues a shorthand IPI to the rest of the CPUs. All CPUs will get the NMI,
but only those online and being monitored will look for hardlockups.

The time-stamp counter (TSC) is used to determine whether the HPET caused
the NMI. When the HPET channel fires, we compute the value the TSC is
expected to have the next time it fires. Once it does, we read the actual
TSC value. If it falls within a small error window, we determine that the
HPET channel issued the NMI. I have found experimentally that the expected
TSC value consistently has an error of less than 0.2% (see further details
in the Testing section).

A side effect of using this detector is that in a kernel configured with
NO_HZ_FULL, the CPUs specified in the nohz_full command-line argument would
also receive the NMI IPI (but they would not look for hardlokcups). Thus,
this hardlockup detector is an opt-in feature.

This detector cannot be used on systems that disable the HPET, unless it is
force-enabled.

On AMD systems with interrupt remapping enabled, the detector can only be
used in APIC physical mode (see patch 12).

== Main updates in this version

Thomas Gleixner pointed out several design issues:

   1) In previous versions, the HPET channel targeted individual CPUs in a
      round-robin manner. This required changing the affinity of the NMI.
      Doing this with interrupt remapping is not feasible since there is
      not an atomic, lock-less way of updating an IRTE in the interrupt
      remapping domain.
        + Solution: In this version, the affinity of the HPET timer never
          changes while it is in operation. When a change in affinity is
          needed (e.g., the handling CPU is going offline or stops being
          monitored), the detector is disabled first.

   2) In previous versions, I issued apic::send_IPI_mask_allbutself() to
      trigger a hardlockup check on the monitored CPUs. This does not work
      as the target cpumask and the contents of the APIC ICR would be
      corrupted [9].
        + Solution: Only use this detector when IPI shorthands [10] are
          enabled in the system.

   3) In previous versions, I added checks in the interrupt remapping
      drivers checks to identify the HPET hardlockup detector IRQ and
      changed its delivery mode. This looked hacky [11].
        + Solution: As per suggestion from Thomas, I added an
          X86_IRQ_ALLOC_AS_NMI to be used when allocating IRQs. Every
          irq_domain in the IRQ hierarchy will configure the delivery mode
          of the IRQ as specified in the IRQ config info.

== Parts of this series ==

For clarity, patches are grouped as follows:

 1) IRQ updates: Patches 1-13 refactor parts of the interrupt subsystem
    and irq_chips to support separate delivery mode of each IRQ.  Thus,
    specific IRQs can now be configured as NMIs as needed.

 2) HPET updates. Patches 14-17 prepare the HPET code to accommodate the
    new detector: rework periodic programming, reserve and configure a
    timer for the detector and expose a few existing functions.

 3) NMI watchdog. Patches 18-21 update the existing hardlockup detector
    to uncouple it from perf, and introduces a new NMI handler category
    intended to run after the NMI_LOCAL handlers.

 4) New HPET-based hardlockup detector. Patches 22-25

 5) Hardlockup detector management. Patches 26-29 are a collection of
    miscellaneous patches to determine when to use the HPET hardlockup
    detector and stop it if necessary. It also includes an x86-specific
    shim hardlockup detector that selects between the perf- and hpet-based
    implementations. It also switches back to the perf implementation if
    the TSC becomes unstable.

== Testing ==

Tests were conducted on the master branch of the tip tree and are
available here:

git@github.com:ricardon/tip.git rneri/hpet-wdt-v6

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

+++ Characterization of the actual TSC value wrt to its expected value

(NOTE: This same data is also presented in patch 23)

Let tsc_delta be the difference between the value the TSC has now and the
value it will have when the next HPET channel interrupt happens. Define the
error window as a percentage of tsc_delta.

Below is a table that characterizes the error in the error in the expected
TSC value when the HPET channel fires in a subset of the systems I tested.
It presents the error as a percentage of tsc_delta and in microseconds.

The table summarizes the error of 4096 interrupts of the HPET channel
collected after the system has been up for 5 minutes as well as since boot.

The maximum observed error on any system is 0.045%. When the error since
boot is considered, the maximum observed error is 0.198%.

To find the most common error value (i.e., the mode), the collected data is
grouped into buckets of 0.000001 percentage points of the error and 10ns,
respectively. The most common error on any system is of 0.01317%

watchdog_thresh     1s                10s                 60s
Error wrt
expected
TSC value     %        us         %        us        %        us

AMD EPYC 7742 64-Core Processor
Abs max
since boot 0.04517   451.74    0.00171   171.04   0.00034   201.89
Abs max    0.04517   451.74    0.00171   171.04   0.00034   201.89
Mode       0.00002     0.18    0.00002     2.07  -0.00003   -19.20

Intel(R) Xeon(R) CPU E7-8890 - INTEL_FAM6_HASWELL_X
abs max
since boot 0.00811    81.15    0.00462   462.40   0.00014    81.65
Abs max    0.00811    81.15    0.00084    84.31   0.00014    81.65
Mode      -0.00422   -42.16   -0.00043   -42.50  -0.00007   -40.40

Intel(R) Xeon(R) Platinum 8170M CPU @ 2.10GHz - INTEL_FAM6_SKYLAKE_X
Abs max
since boot 0.10530  1053.04    0.01324  1324.27   0.00407  2443.25
Abs max    0.01166   116.59    0.00114   114.11   0.00024   143.47
Mode      -0.01023  -102.32   -0.00103  -102.44  -0.00022  -132.38

Intel(R) Xeon(R) CPU E5-2699A v4 @ 2.40GHz - INTEL_FAM6_BROADSWELL_X
Abs max
since boot 0.00010    99.34    0.00099    98.83   0.00016    97.50
Abs max    0.00010    99.34    0.00099    98.83   0.00016    97.50
Mode      -0.00007   -74.29   -0.00074   -73.99  -0.00012   -73.12

Intel(R) Xeon(R) Gold 5318H CPU - INTEL_FAM6_COOPERLAKE_X
Abs max
since boot 0.11262  1126.17    0.01109  1109.17   0.00409  2455.73
Abs max    0.01073   107.31    0.00109   109.02   0.00019   115.34
Mode      -0.00953   -95.26   -0.00094   -93.63  -0.00015   -90.42

Intel(R) Xeon(R) Platinum 8360Y CPU @ 2.40GHz - INTEL_FAM6_ICELAKE_X
Abs max
since boot 0.19853  1985.30    0.00784   783.53  -0.00017  -104.77
Abs max    0.01550   155.02    0.00158   157.56   0.00020   117.74
Mode      -0.01317  -131.65   -0.00136  -136.42  -0.00018  -105.06

Thanks and BR,
Ricardo

== Changelog ==

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
   MSI message composition fields [13].
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
   management [13].
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
[6]. https://lore.kernel.org/linux-iommu/87lf8uhzk9.ffs@nanos.tec.linutronix.de/T/
[7]. https://lore.kernel.org/lkml/20200117091341.GX2827@hirez.programming.kicks-ass.net/
[8]. https://lore.kernel.org/lkml/1582581564-184429-1-git-send-email-kan.liang@linux.intel.com/
[9]. https://lore.kernel.org/lkml/20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com/T/#me7de1b4ff4a91166c1610a2883b1f77ffe8b6ddf
[10]. https://lore.kernel.org/all/tip-dea978632e8400b84888bad20df0cd91c18f0aec@git.kernel.org/t/
[11]. https://lore.kernel.org/linux-iommu/87lf8uhzk9.ffs@nanos.tec.linutronix.de/T/#mde9be6aca9119602e90e9293df9995aa056dafce

[12]. https://lore.kernel.org/r/20201024213535.443185-6-dwmw2@infradead.org
https://lore.kernel.org/all/tip-dea978632e8400b84888bad20df0cd91c18f0aec@git.kernel.org/t/
[13]. https://lore.kernel.org/lkml/20190623132340.463097504@linutronix.de/

Ricardo Neri (29):
  irq/matrix: Expose functions to allocate the best CPU for new vectors
  x86/apic: Add irq_cfg::delivery_mode
  x86/apic/msi: Set the delivery mode individually for each IRQ
  x86/apic: Add the X86_IRQ_ALLOC_AS_NMI irq allocation flag
  x86/apic/vector: Do not allocate vectors for NMIs
  x86/apic/vector: Implement support for NMI delivery mode
  iommu/vt-d: Clear the redirection hint when the destination mode is
    physical
  iommu/vt-d: Rework prepare_irte() to support per-IRQ delivery mode
  iommu/vt-d: Set the IRTE delivery mode individually for each IRQ
  iommu/vt-d: Implement minor tweaks for NMI irqs
  iommu/amd: Expose [set|get]_dev_entry_bit()
  iommu/amd: Enable NMIPass when allocating an NMI irq
  iommu/amd: Compose MSI messages for NMI irqs in non-IR format
  x86/hpet: Expose hpet_writel() in header
  x86/hpet: Add helper function hpet_set_comparator_periodic()
  x86/hpet: Prepare IRQ assignments to use the X86_ALLOC_AS_NMI flag
  x86/hpet: Reserve an HPET channel for the hardlockup detector
  watchdog/hardlockup: Define a generic function to detect hardlockups
  watchdog/hardlockup: Decouple the hardlockup detector from perf
  init/main: Delay initialization of the lockup detector after
    smp_init()
  x86/nmi: Add an NMI_WATCHDOG NMI handler category
  x86/watchdog/hardlockup: Add an HPET-based hardlockup detector
  x86/watchdog/hardlockup/hpet: Determine if HPET timer caused NMI
  watchdog/hardlockup: Use parse_option_str() to handle "nmi_watchdog"
  watchdog/hardlockup/hpet: Only enable the HPET watchdog via a boot
    parameter
  x86/watchdog: Add a shim hardlockup detector
  watchdog: Expose lockup_detector_reconfigure()
  x86/tsc: Restart NMI watchdog after refining tsc_khz
  x86/tsc: Switch to perf-based hardlockup detector if TSC become
    unstable

 .../admin-guide/kernel-parameters.txt         |   8 +-
 arch/x86/Kconfig.debug                        |  13 +
 arch/x86/include/asm/hpet.h                   |  49 ++
 arch/x86/include/asm/hw_irq.h                 |   5 +-
 arch/x86/include/asm/irqdomain.h              |   1 +
 arch/x86/include/asm/nmi.h                    |   7 +
 arch/x86/kernel/Makefile                      |   3 +
 arch/x86/kernel/apic/apic.c                   |   2 +-
 arch/x86/kernel/apic/vector.c                 |  48 ++
 arch/x86/kernel/hpet.c                        | 162 ++++++-
 arch/x86/kernel/nmi.c                         |  10 +
 arch/x86/kernel/tsc.c                         |   8 +
 arch/x86/kernel/watchdog_hld.c                |  91 ++++
 arch/x86/kernel/watchdog_hld_hpet.c           | 458 ++++++++++++++++++
 drivers/iommu/amd/amd_iommu.h                 |   3 +
 drivers/iommu/amd/init.c                      |   4 +-
 drivers/iommu/amd/iommu.c                     |  41 +-
 drivers/iommu/intel/irq_remapping.c           |  32 +-
 include/linux/irq.h                           |   4 +
 include/linux/nmi.h                           |   8 +-
 init/main.c                                   |   4 +-
 kernel/Makefile                               |   2 +-
 kernel/irq/matrix.c                           |  32 +-
 kernel/watchdog.c                             |  12 +-
 kernel/watchdog_hld.c                         |  50 +-
 lib/Kconfig.debug                             |   4 +
 26 files changed, 994 insertions(+), 67 deletions(-)
 create mode 100644 arch/x86/kernel/watchdog_hld.c
 create mode 100644 arch/x86/kernel/watchdog_hld_hpet.c

-- 
2.17.1

