Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9D6A7821
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrmB6050z3fbv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:58:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fhRVB+Mo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fhRVB+Mo;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJd2CFyz3cNh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713889; x=1709249889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EY5U0PovmXiAtFsslCouXhpNbANtXU/1R9huXKKUbQs=;
  b=fhRVB+Mo7cUNgN+gOO3zgndNLV7yOfhv4ICla6m0IBWB63sOeOSMn/WI
   tp6ckhG77RDYYl456QfHHxj3+j5SR3Eu1LfMDsipVAfgJ3JpeNO/qar84
   rMoBbPZ2iOjJKnRv6mTvgHjhE24sIHqvK+Rh32YQU3cYL7OVdZa/OdIq5
   3SeiXNFdnazMuKZecJR8J7W0xQ0w8ag0NQk3OxGl2bQCgNtMcvExKuSI3
   wW0mwQEJorhD+FOZ/n5/dV6N3Ug5srxdEbYxsTkTjUy0b6TyH7/+Z4AlD
   2zrzAn/m9gxRpCZX6SuHl0TAF5L6EXF6Bb05esWoyxAX4A1rAgdWBxCAd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818786"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818786"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826864"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826864"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:38:00 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 20/24] x86/watchdog/hardlockup/hpet: Determine if HPET timer caused NMI
Date: Wed,  1 Mar 2023 15:47:49 -0800
Message-Id: <20230301234753.28582-21-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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

It is not possible to determine the source of a non-maskable interrupt
(NMI) in x86. When dealing with an HPET channel, the only direct method to
determine whether it caused an NMI would be to read the Interrupt Status
register.

Reading HPET registers is slow and, therefore, not to be done while in NMI
context. Also, the interrupt status bit is not available if the HPET
channel is programmed to deliver an MSI interrupt.

An indirect manner to infer if the HPET channel is the source of an NMI is
is to use the time-stamp counter (TSC). Compute the value that the TSC is
expected to have at the next interrupt of the HPET channel and compare it
with the value it has when the interrupt does happen. Let this error be
tsc_next_error. If tsc_next_error is less than a certain value, assume that
the HPET channel of the detector is the source of the NMI.

Below is a table that characterizes tsc_next_error in a collection of
systems. The error is expressed in microseconds as well as a percentage of
tsc_delta: the computed number of TSC counts between two consecutive
interrupts of the HPET channel.

The table summarizes the error of 4096 interrupts of the HPET channel in
two experiments: a) since the system booted and b) ignoring the first 5
minutes after boot.

The maximum observed error in a) is 0.198%. For b) the maximum error is
0.045%.

Allow a maximum tsc_next_error that is twice as big the maximum error
observed in these experiments: 0.4% of tsc_delta.

watchdog_thresh      1s                  10s                60s
tsc_next_error   %        us         %        us        %        us

AMD EPYC 7742 64-Core Processor
max(abs(a))   0.04517   451.74    0.00171   171.04   0.00034   201.89
max(abs(b))   0.04517   451.74    0.00171   171.04   0.00034   201.89

Intel(R) Xeon(R) CPU E7-8890 - INTEL_FAM6_HASWELL_X
max(abs(a))   0.00811    81.15    0.00462   462.40   0.00014    81.65
max(abs(b))   0.00811    81.15    0.00084    84.31   0.00014    81.65

Intel(R) Xeon(R) Platinum 8170M - INTEL_FAM6_SKYLAKE_X
max(abs(a))   0.10530  1053.04    0.01324  1324.27   0.00407  2443.25
max(abs(b))   0.01166   116.59    0.00114   114.11   0.00024   143.47

Intel(R) Xeon(R) CPU E5-2699A v4 - INTEL_FAM6_BROADSWELL_X
max(abs(a))   0.00010    99.34    0.00099    98.83   0.00016    97.50
max(abs(b))   0.00010    99.34    0.00099    98.83   0.00016    97.50

Intel(R) Xeon(R) Gold 5318H - INTEL_FAM6_COOPERLAKE_X
max(abs(a))   0.11262  1126.17    0.01109  1109.17   0.00409  2455.73
max(abs(b))   0.01073   107.31    0.00109   109.02   0.00019   115.34

Intel(R) Xeon(R) Platinum 8360Y - INTEL_FAM6_ICELAKE_X
max(abs(a))   0.19853  1985.30    0.00784   783.53  -0.00017  -104.77
max(abs(b))   0.01550   155.02    0.00158   157.56   0.00020   117.74

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
NOTE: The error characterization data is repeated here from the cover
letter.
---
Changes since v6:
 * Fixed bug when checking the error window. Now check for an error
   which is +/-4% the actual TSC value, not +/-2%.

Changes since v5:
 * Reworked is_hpet_hld_interrupt() to reduce indentation.
 * Use time_in_range64() to compare the actual TSC value vs the expected
   value. This makes it more readable. (Tony)
 * Reduced the error window of the expected TSC value at the time of the
   HPET channel expiration.
 * Described better the heuristics used to determine if the HPET channel
   caused the NMI. (Tony)
 * Added a table to characterize the error in the expected TSC value when
   the HPET channel fires.
 * Removed references to groups of monitored CPUs. Instead, use tsc_khz
   directly.

Changes since v4:
 * Compute the TSC expected value at the next HPET interrupt based on the
   number of monitored packages and not the number of monitored CPUs.

Changes since v3:
 * None

Changes since v2:
 * Reworked condition to check if the expected TSC value is within the
   error margin to avoid an unnecessary conditional. (Peter Zijlstra)
 * Removed TSC error margin from struct hld_data; use a global variable
   instead. (Peter Zijlstra)

Changes since v1:
 * Introduced this patch.
---
 arch/x86/include/asm/hpet.h         |  3 ++
 arch/x86/kernel/watchdog_hld_hpet.c | 58 +++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index c88901744848..af0a504b5cff 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -113,6 +113,8 @@ static inline int is_hpet_enabled(void) { return 0; }
  * @channel:			HPET channel assigned to the detector
  * @channe_priv:		Private data of the assigned channel
  * @ticks_per_second:		Frequency of the HPET timer
+ * @tsc_next:			Estimated value of the TSC at the next
+ *				HPET timer interrupt
  * @irq:			IRQ number assigned to the HPET channel
  * @handling_cpu:		CPU handling the HPET interrupt
  * @monitored_cpumask:		CPUs monitored by the hardlockup detector
@@ -124,6 +126,7 @@ struct hpet_hld_data {
 	u32			channel;
 	struct hpet_channel	*channel_priv;
 	u64			ticks_per_second;
+	u64			tsc_next;
 	int			irq;
 	u32			handling_cpu;
 	cpumask_var_t		monitored_cpumask;
diff --git a/arch/x86/kernel/watchdog_hld_hpet.c b/arch/x86/kernel/watchdog_hld_hpet.c
index b583d3180ae0..a03126e02eda 100644
--- a/arch/x86/kernel/watchdog_hld_hpet.c
+++ b/arch/x86/kernel/watchdog_hld_hpet.c
@@ -12,6 +12,11 @@
  * (offline CPUs also get the NMI but they "ignore" it). A cpumask is used to
  * specify whether a CPU must check for hardlockups.
  *
+ * It is not possible to determine the source of an NMI. Instead, we calculate
+ * the value that the TSC counter should have when the next HPET NMI occurs. If
+ * it has the calculated value +/- 0.4%, we conclude that the HPET channel is the
+ * source of the NMI.
+ *
  * The NMI also disturbs isolated CPUs. The detector fails to initialize if
  * tick_nohz_full is enabled.
  */
@@ -34,6 +39,7 @@
 #include "apic/local.h"
 
 static struct hpet_hld_data *hld_data;
+static u64 tsc_next_error;
 
 static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
 {
@@ -65,12 +71,39 @@ static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
  * Reprogram the timer to expire in watchdog_thresh seconds in the future.
  * If the timer supports periodic mode, it is not kicked unless @force is
  * true.
+ *
+ * Also, compute the expected value of the time-stamp counter at the time of
+ * expiration as well as a deviation from the expected value.
  */
 static void kick_timer(struct hpet_hld_data *hdata, bool force)
 {
-	u64 new_compare, count, period = 0;
+	u64 tsc_curr, tsc_delta, new_compare, count, period = 0;
+
+	tsc_curr = rdtsc();
+
+	/*
+	 * Compute the delta between the value of the TSC now and the value
+	 * it will have the next time the HPET channel fires.
+	 */
+	tsc_delta = watchdog_thresh * tsc_khz * 1000L;
+	hdata->tsc_next = tsc_curr + tsc_delta;
+
+	/*
+	 * Define an error window between the expected TSC value and the actual
+	 * value it will have the next time the HPET channel fires. Define this
+	 * error as percentage of tsc_delta.
+	 *
+	 * The systems that have been tested so far exhibit an error of 0.05%
+	 * of the expected TSC value once the system is up and running. Systems
+	 * that refine tsc_khz exhibit a larger initial error up to 0.2%. To be
+	 * safe, allow a maximum error of ~0.4% (i.e., tsc_delta / 256).
+	 */
+	tsc_next_error = tsc_delta >> 8;
 
-	/* Kick the timer only when needed. */
+	/*
+	 * We must compute the exptected TSC value always. Kick the timer only
+	 * when needed.
+	 */
 	if (!force && hdata->has_periodic)
 		return;
 
@@ -133,12 +166,31 @@ static void enable_timer(struct hpet_hld_data *hdata)
  * is_hpet_hld_interrupt() - Check if the HPET channel caused the interrupt
  * @hdata:	A data structure describing the HPET channel
  *
+ * Determining the sources of NMIs is not possible. Furthermore, we have
+ * programmed the HPET channel for MSI delivery, which does not have a
+ * status bit. Also, reading HPET registers is slow.
+ *
+ * Instead, we just assume that an NMI delivered within a time window
+ * of when the HPET was expected to fire probably came from the HPET.
+ *
+ * The window is estimated using the TSC counter. Check the comments in
+ * kick_timer() for details on the size of the time window.
+ *
  * Returns:
  * True if the HPET watchdog timer caused the interrupt. False otherwise.
  */
 static bool is_hpet_hld_interrupt(struct hpet_hld_data *hdata)
 {
-	return false;
+	u64 tsc_curr, tsc_curr_min, tsc_curr_max;
+
+	if (smp_processor_id() != hdata->handling_cpu)
+		return false;
+
+	tsc_curr = rdtsc();
+	tsc_curr_min = tsc_curr - tsc_next_error;
+	tsc_curr_max = tsc_curr + tsc_next_error;
+
+	return time_in_range64(hdata->tsc_next, tsc_curr_min, tsc_curr_max);
 }
 
 /**
-- 
2.25.1

