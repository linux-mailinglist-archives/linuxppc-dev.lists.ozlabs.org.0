Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C8876545
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:27:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WDVRiMrt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn5f0jMlz3vq0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WDVRiMrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrmtG66bLz3vZs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903847; x=1741439847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xuu117cG1lowhe30UpLIG5BgAby+hnwaDFUtdrI4YDU=;
  b=WDVRiMrtq/wtpMk8MYTqjipLFNAG06+Knq2LJe0IhZ0swcyxPC/BzUzP
   gbDm+1oTkxKSNNowCCerQnswPcXrhlOSo2hKQWtOkXqBHpKIhpMZENgM4
   CKIsHdtxyHIqgup344k7vbcv2kHg9JA1E0g6nXEsZ16Vfr0BoN0N0PuQG
   3kNbkgOmQUEnLrtr0QXp4UXZSMXkSraHwi1zH4F8OA4GgsZtmYV4up13O
   ej7mrwSLioRyM955+zDeiJn/T/8eZ2u4yMQWQqCT1w9qCctJ60MdW+8D/
   EGhdIUkvZ0tDc/x/HEAjsv0n4u1Zk99aCdMUpH/C8zdaBlDl3eOB+0hBj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342899"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161603"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:17:18 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 17/19] timekeeping: Make delta calculation overflow safe
Date: Fri,  8 Mar 2024 15:15:10 +0200
Message-Id: <20240308131512.44324-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308131512.44324-1-adrian.hunter@intel.com>
References: <20240308131512.44324-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel timekeeping is designed to keep the change in cycles (since the last
timer interrupt) below max_cycles, which prevents multiplication overflow
when converting cycles to nanoseconds. However, if timer interrupts stop,
the calculation will eventually overflow.

Add protection against that. In timekeeping_cycles_to_ns() calculation,
check against max_cycles, falling back to a slower higher precision
calculation. In timekeeping_forward_now(), process delta in chunks of at
most max_cycles.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 kernel/time/timekeeping.c | 40 ++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index d17484082e2c..111dfdbd488f 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -364,19 +364,32 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 }
 
 /* Timekeeper helper functions. */
+static noinline u64 delta_to_ns_safe(const struct tk_read_base *tkr, u64 delta)
+{
+	return mul_u64_u32_add_u64_shr(delta, tkr->mult, tkr->xtime_nsec, tkr->shift);
+}
+
 static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *tkr, u64 cycles)
 {
 	/* Calculate the delta since the last update_wall_time() */
 	u64 mask = tkr->mask, delta = (cycles - tkr->cycle_last) & mask;
 
-	if (IS_ENABLED(CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE)) {
-		/*
-		 * Handle clocksource inconsistency between CPUs to prevent
-		 * time from going backwards by checking for the MSB of the
-		 * mask being set in the delta.
-		 */
-		if (unlikely(delta & ~(mask >> 1)))
-			return tkr->xtime_nsec >> tkr->shift;
+	/*
+	 * This detects the case where the delta overflows the multiplication
+	 * with tkr->mult.
+	 */
+	if (unlikely(delta > tkr->clock->max_cycles)) {
+		if (IS_ENABLED(CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE)) {
+			/*
+			 * Handle clocksource inconsistency between CPUs to prevent
+			 * time from going backwards by checking for the MSB of the
+			 * mask being set in the delta.
+			 */
+			if (unlikely(delta & ~(mask >> 1)))
+				return tkr->xtime_nsec >> tkr->shift;
+		}
+
+		return delta_to_ns_safe(tkr, delta);
 	}
 
 	return ((delta * tkr->mult) + tkr->xtime_nsec) >> tkr->shift;
@@ -789,10 +802,15 @@ static void timekeeping_forward_now(struct timekeeper *tk)
 	tk->tkr_mono.cycle_last = cycle_now;
 	tk->tkr_raw.cycle_last  = cycle_now;
 
-	tk->tkr_mono.xtime_nsec += delta * tk->tkr_mono.mult;
-	tk->tkr_raw.xtime_nsec += delta * tk->tkr_raw.mult;
+	while (delta > 0) {
+		u64 max = tk->tkr_mono.clock->max_cycles;
+		u64 incr = delta < max ? delta : max;
 
-	tk_normalize_xtime(tk);
+		tk->tkr_mono.xtime_nsec += incr * tk->tkr_mono.mult;
+		tk->tkr_raw.xtime_nsec += incr * tk->tkr_raw.mult;
+		tk_normalize_xtime(tk);
+		delta -= incr;
+	}
 }
 
 /**
-- 
2.34.1

