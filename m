Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775651CD6C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWB50z7Zz3fBn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2J27PMd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S2J27PMd; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzK3XtKz3c9v
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795149; x=1683331149;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TyPidIU9s9JbwJNwvFvgLrTu4E+Y5y97BFEdQg2cUk8=;
 b=S2J27PMd9SknyErGqLFOHsHBL+dH8mzTMfYeF/hzd8sHjyb1Ye1yTxxC
 lPRVQmt4T2xJZ/FVnRSMCQwm+5bqsA5AgACIRgTwblmK+mrjG0atKg6N7
 w0tkz96hH9n+kDUvtvShEMbAshWRHDvu8L9oUJ+mXGDg5b37WNwREEGV1
 nuUFnFwC1IKqvrdb0Z4i2N/eKVxdz6WkqGqxS4rcqJCVu19f9rjCLS982
 bY2SqhF3PgNa9JFK71mLAOA5tqfpYeb97UxPGuyje0/QgXRWo3ujBcKy3
 ByE7+l78pJjSWtQUsLhZIRfmhesJITadfJxUdua5pmFUeTM5jfeBGXQPT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437320"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437320"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914380"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:50 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
Date: Thu,  5 May 2022 16:59:54 -0700
Message-Id: <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
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

Programming an HPET channel as periodic requires setting the
HPET_TN_SETVAL bit in the channel configuration. Plus, the comparator
register must be written twice (once for the comparator value and once for
the periodic value). Since this programming might be needed in several
places (e.g., the HPET clocksource and the HPET-based hardlockup detector),
add a helper function for this purpose.

A helper function hpet_set_comparator_oneshot() could also be implemented.
However, such function would only program the comparator register and the
function would be quite small. Hence, it is better to not bloat the code
with such an obvious function.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Originally-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
When programming the HPET channel in periodic mode, a udelay(1) between
the two successive writes to HPET_Tn_CMP was introduced in commit
e9e2cdb41241 ("[PATCH] clockevents: i386 drivers"). The commit message
does not give any reason for such delay. The hardware specification does
not seem to require it. The refactoring in this patch simply carries such
delay.
---
Changes since v5:
 * None

Changes since v4:
 * Implement function only for periodic mode. This removed extra logic to
   to use a non-zero period value as a proxy for periodic mode
   programming. (Thomas)
 * Added a comment on the history of the udelay() when programming the
   channel in periodic mode. (Ashok)

Changes since v3:
 * Added back a missing hpet_writel() for time configuration.

Changes since v2:
 *  Introduced this patch.

Changes since v1:
 * N/A
---
 arch/x86/include/asm/hpet.h |  2 ++
 arch/x86/kernel/hpet.c      | 49 ++++++++++++++++++++++++++++---------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index be9848f0883f..486e001413c7 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -74,6 +74,8 @@ extern void hpet_disable(void);
 extern unsigned int hpet_readl(unsigned int a);
 extern void hpet_writel(unsigned int d, unsigned int a);
 extern void force_hpet_resume(void);
+extern void hpet_set_comparator_periodic(int channel, unsigned int cmp,
+					 unsigned int period);
 
 #ifdef CONFIG_HPET_EMULATE_RTC
 
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 47678e7927ff..2c6713b40921 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -294,6 +294,39 @@ static void hpet_enable_legacy_int(void)
 	hpet_legacy_int_enabled = true;
 }
 
+/**
+ * hpet_set_comparator_periodic() - Helper function to set periodic channel
+ * @channel:	The HPET channel
+ * @cmp:	The value to be written to the comparator/accumulator
+ * @period:	Number of ticks per period
+ *
+ * Helper function for updating comparator, accumulator and period values.
+ *
+ * In periodic mode, HPET needs HPET_TN_SETVAL to be set before writing
+ * to the Tn_CMP to update the accumulator. Then, HPET needs a second
+ * write (with HPET_TN_SETVAL cleared) to Tn_CMP to set the period.
+ * The HPET_TN_SETVAL bit is automatically cleared after the first write.
+ *
+ * This function takes a 1 microsecond delay. However, this function is supposed
+ * to be called only once (or when reprogramming the timer) as it deals with a
+ * periodic timer channel.
+ *
+ * See the following documents:
+ *   - Intel IA-PC HPET (High Precision Event Timers) Specification
+ *   - AMD-8111 HyperTransport I/O Hub Data Sheet, Publication # 24674
+ */
+void hpet_set_comparator_periodic(int channel, unsigned int cmp, unsigned int period)
+{
+	unsigned int v = hpet_readl(HPET_Tn_CFG(channel));
+
+	hpet_writel(v | HPET_TN_SETVAL, HPET_Tn_CFG(channel));
+
+	hpet_writel(cmp, HPET_Tn_CMP(channel));
+
+	udelay(1);
+	hpet_writel(period, HPET_Tn_CMP(channel));
+}
+
 static int hpet_clkevt_set_state_periodic(struct clock_event_device *evt)
 {
 	unsigned int channel = clockevent_to_channel(evt)->num;
@@ -306,19 +339,11 @@ static int hpet_clkevt_set_state_periodic(struct clock_event_device *evt)
 	now = hpet_readl(HPET_COUNTER);
 	cmp = now + (unsigned int)delta;
 	cfg = hpet_readl(HPET_Tn_CFG(channel));
-	cfg |= HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
-	       HPET_TN_32BIT;
+	cfg |= HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_32BIT;
 	hpet_writel(cfg, HPET_Tn_CFG(channel));
-	hpet_writel(cmp, HPET_Tn_CMP(channel));
-	udelay(1);
-	/*
-	 * HPET on AMD 81xx needs a second write (with HPET_TN_SETVAL
-	 * cleared) to T0_CMP to set the period. The HPET_TN_SETVAL
-	 * bit is automatically cleared after the first write.
-	 * (See AMD-8111 HyperTransport I/O Hub Data Sheet,
-	 * Publication # 24674)
-	 */
-	hpet_writel((unsigned int)delta, HPET_Tn_CMP(channel));
+
+	hpet_set_comparator_periodic(channel, cmp, (unsigned int)delta);
+
 	hpet_start_counter();
 	hpet_print_config();
 
-- 
2.17.1

