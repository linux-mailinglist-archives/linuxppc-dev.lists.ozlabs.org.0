Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5B8891F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:53:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gT9CSL09;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33Y64CFpz3wCl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:53:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gT9CSL09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Jm3RgDz3vcK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:42:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348953; x=1742884953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xuu117cG1lowhe30UpLIG5BgAby+hnwaDFUtdrI4YDU=;
  b=gT9CSL09lW4b6AKGOKyqG24Mt7xa2WowLIo38pey8jZ5887+awALoW/D
   8YQ6JqqVQ+CBBAR1EXa6giLNCsgCRl8e4JU1tZ2frzok2t7dkseXyZwFM
   NSDq6qoW58VqBIRxG4h7iBQeKP/uqItZ82s5nmXjFId3jBddkIuUOmBDj
   q0jvZ5VDfrkoIPyY5p6tnwoTYC6opXpuTDb1xoZ9sPHUWqxRhFgCe8Rv2
   8VbSa++DjOwdyD9xqzwBFuyAFfTrS4h9Q3Hu6GUkILRZmDEwLPIbzST7E
   bRR1MK7z5cUGmSfe+1UG8thU0wiGxywjzetCG7d2FqTmTmZzb3rOVXGMr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6191585"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6191585"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629707"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 17/19] timekeeping: Make delta calculation overflow safe
Date: Mon, 25 Mar 2024 08:40:21 +0200
Message-Id: <20240325064023.2997-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325064023.2997-1-adrian.hunter@intel.com>
References: <20240325064023.2997-1-adrian.hunter@intel.com>
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

