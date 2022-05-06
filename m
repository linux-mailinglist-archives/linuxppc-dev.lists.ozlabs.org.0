Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28751CDB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWHn6G5hz3fND
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G1ufFhMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G1ufFhMg; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzT3D3Xz3byb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795157; x=1683331157;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=yC1VMzzaD0T/TLg0eVxuSiZa3kBrYQyg8Df/Iv+75Oc=;
 b=G1ufFhMg4bnrg7nhCxiFdaF4Frc9ISEakK+HmhDDfmY4YDTtH5vZpPWr
 CLRXVwz51zYT8bmpeZqNYH86iG3VusD4I/xrOKrRoMe6o2xmVin/kWZPn
 /uCGYxx1eGWw6i1YzVKgB2o406NLXvaPYvJ6eSIyFMlAW7E55UHZNxme7
 v+mY/jF/FwyQZ7Qs8ETXeYYdz3CHjOogEVJOhON0GS1RxQLBOQHyfAHWR
 ddU4QgMWGoDmGgDtE5JuMwZmEDeosHYE3Lfs0hg9THgiIuSgn8Lxz7eT+
 Rl/UaandKV8TB/52cirTJ+9PrGMCUXclDdYR/nwG26A6owNWgzsGtIoSP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437333"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437333"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914432"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:54 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 23/29] x86/watchdog/hardlockup/hpet: Determine if HPET
 timer caused NMI
Date: Thu,  5 May 2022 17:00:02 -0700
Message-Id: <20220506000008.30892-24-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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

It is not possible to determine the source of a non-maskable interrupt
(NMI) in x86. When dealing with an HPET channel, the only direct method to
determine whether it caused an NMI would be to read the Interrupt Status
register.

However, reading HPET registers is slow and, therefore, not to be done
while in NMI context. Furthermore, status is not available if the HPET
channel is programmed to deliver an MSI interrupt.

An indirect manner to infer if an incoming NMI was caused by the HPET
channel of the detector is to use the time-stamp counter (TSC). Compute the
value that the TSC is expected to have at the next interrupt of the HPET
channel and compare it with the value it has when the interrupt does
happen. If the actual value falls within a small error window, assume
that the HPET channel of the detector is the source of the NMI.

Let tsc_delta be the difference between the value the TSC has now and the
value it will have when the next HPET channel interrupt happens. Define the
error window as a percentage of tsc_delta.

Below is a table that characterizes the error in the error in the expected
TSC value when the HPET channel fires on a variety of systems. It presents
the error as a percentage of tsc_delta and in microseconds.

The table summarizes the error of 4096 interrupts of the HPET channel
collected after the system has been up for 5 minutes as well as since boot.

The maximum observed error on any system is 0.045%. When the error since
boot is considered, the maximum observed error is 0.198%.

To find the most common error value, the collected data is grouped into
buckets of 0.000001 percentage points of the error and 10ns, respectively.
The most common error on any system is of 0.01317%

Allow a maximum error that is twice as big the maximum error observed in
these experiments: 0.4%

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

Intel(R) Xeon(R) Platinum 8170M - INTEL_FAM6_SKYLAKE_X
Abs max
since boot 0.10530  1053.04    0.01324  1324.27   0.00407  2443.25
Abs max    0.01166   116.59    0.00114   114.11   0.00024   143.47
Mode      -0.01023  -102.32   -0.00103  -102.44  -0.00022  -132.38

Intel(R) Xeon(R) CPU E5-2699A v4 - INTEL_FAM6_BROADSWELL_X
Abs max
since boot 0.00010    99.34    0.00099    98.83   0.00016    97.50
Abs max    0.00010    99.34    0.00099    98.83   0.00016    97.50
Mode      -0.00007   -74.29   -0.00074   -73.99  -0.00012   -73.12

Intel(R) Xeon(R) Gold 5318H - INTEL_FAM6_COOPERLAKE_X
Abs max
since boot 0.11262  1126.17    0.01109  1109.17   0.00409  2455.73
Abs max    0.01073   107.31    0.00109   109.02   0.00019   115.34
Mode      -0.00953   -95.26   -0.00094   -93.63  -0.00015   -90.42

Intel(R) Xeon(R) Platinum 8360Y - INTEL_FAM6_ICELAKE_X
Abs max
since boot 0.19853  1985.30    0.00784   783.53  -0.00017  -104.77
Abs max    0.01550   155.02    0.00158   157.56   0.00020   117.74
Mode      -0.01317  -131.65   -0.00136  -136.42  -0.00018  -105.06

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Suggested-by: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
NOTE: The error characterization data is repetead here from the cover
letter.
---
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
 arch/x86/kernel/watchdog_hld_hpet.c | 54 +++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

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
index 9fc7ac2c5059..3effdbf29095 100644
--- a/arch/x86/kernel/watchdog_hld_hpet.c
+++ b/arch/x86/kernel/watchdog_hld_hpet.c
@@ -34,6 +34,7 @@
 
 static struct hpet_hld_data *hld_data;
 static bool hardlockup_use_hpet;
+static u64 tsc_next_error;
 
 extern struct static_key_false apic_use_ipi_shorthand;
 
@@ -59,10 +60,39 @@ static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
  * Reprogram the timer to expire within watchdog_thresh seconds in the future.
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
+	 * that refine tsc_khz exhibit a larger initial error up to 0.2%.
+	 *
+	 * To be safe, allow a maximum error of ~0.4%. This error value can be
+	 * computed by left-shifting tsc_delta by 8 positions. Shift 9
+	 * positions to calculate half the error. When the HPET channel fires,
+	 * check if the actual TSC value is in the range
+	 *  [tsc_next - (tsc_next_error / 2), tsc_next + (tsc_next_error / 2)]
+	 */
+	tsc_next_error = tsc_delta >> 9;
 
 	/* Kick the timer only when needed. */
 	if (!force && hdata->has_periodic)
@@ -126,12 +156,32 @@ static void enable_timer(struct hpet_hld_data *hdata)
  * is_hpet_hld_interrupt() - Check if an HPET timer caused the interrupt
  * @hdata:	A data structure with the timer instance to enable
  *
+ * Checking whether the HPET was the source of this NMI is not possible.
+ * Determining the sources of NMIs is not possible. Furthermore, we have
+ * programmed the HPET channel for MSI delivery, which does not have a
+ * status bit. Also, reading HPET registers is slow.
+ *
+ * Instead, we just assume that any NMI delivered within a time window
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
2.17.1

