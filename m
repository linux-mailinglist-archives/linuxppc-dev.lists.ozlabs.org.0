Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CB8891F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:53:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f6aLl1/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33Yv0Bpfz3wFs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f6aLl1/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Jy2tq2z3vd9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:42:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348963; x=1742884963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOOcsyBxpUsFxkAH1hi2UNpYCz2148dQEbBRMVKVw/4=;
  b=f6aLl1/4lb+z4fE+bxyH1uSac4FtWt+fB4GuJXCYuvCJwYXr6AJ5tPqP
   lBicSfwHnZoXQ5ySg/7u1elKlQ2poAlZi4hEli7+xzVOiuvEi+/Qq6Z3O
   v/F9w6L2aQSRr+3+JRPcIf8Ehr0y+Jrst6QMY6hrzugZCk10BT7XI99L9
   DcKqsNufjoR2igUpkPhH1DnOKRhOxtbWxdP8EO03kZcyb1BzEQ+oupzJz
   Fu5qw9uU9GEpzJx/6xTb8R5YZxSyEWxRkDfLOB6fyn3Jy9xQ7H/hZ9fKC
   dsruemJfV1iXzsxhVbbXDs096ud2+eD0dqK5f6oEUkFhS7OoLauLJkFy3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6191596"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6191596"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629710"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 18/19] timekeeping: Let timekeeping_cycles_to_ns() handle both under and overflow
Date: Mon, 25 Mar 2024 08:40:22 +0200
Message-Id: <20240325064023.2997-19-adrian.hunter@intel.com>
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

For the case !CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE, forego overflow
protection in the range (mask << 1) < delta <= mask, and interpret it
always as an inconsistency between CPU clock values. That allows
slightly neater code, and it is on a slow path so has no effect on
performance.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 kernel/time/timekeeping.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 111dfdbd488f..4e18db1819f8 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -266,17 +266,14 @@ static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *tkr)
 	 * Try to catch underflows by checking if we are seeing small
 	 * mask-relative negative values.
 	 */
-	if (unlikely((~delta & mask) < (mask >> 3))) {
+	if (unlikely((~delta & mask) < (mask >> 3)))
 		tk->underflow_seen = 1;
-		now = last;
-	}
 
-	/* Cap delta value to the max_cycles values to avoid mult overflows */
-	if (unlikely(delta > max)) {
+	/* Check for multiplication overflows */
+	if (unlikely(delta > max))
 		tk->overflow_seen = 1;
-		now = last + max;
-	}
 
+	/* timekeeping_cycles_to_ns() handles both under and overflow */
 	return timekeeping_cycles_to_ns(tkr, now);
 }
 #else
@@ -375,19 +372,17 @@ static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *tkr, u64 c
 	u64 mask = tkr->mask, delta = (cycles - tkr->cycle_last) & mask;
 
 	/*
-	 * This detects the case where the delta overflows the multiplication
-	 * with tkr->mult.
+	 * This detects both negative motion and the case where the delta
+	 * overflows the multiplication with tkr->mult.
 	 */
 	if (unlikely(delta > tkr->clock->max_cycles)) {
-		if (IS_ENABLED(CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE)) {
-			/*
-			 * Handle clocksource inconsistency between CPUs to prevent
-			 * time from going backwards by checking for the MSB of the
-			 * mask being set in the delta.
-			 */
-			if (unlikely(delta & ~(mask >> 1)))
-				return tkr->xtime_nsec >> tkr->shift;
-		}
+		/*
+		 * Handle clocksource inconsistency between CPUs to prevent
+		 * time from going backwards by checking for the MSB of the
+		 * mask being set in the delta.
+		 */
+		if (delta & ~(mask >> 1))
+			return tkr->xtime_nsec >> tkr->shift;
 
 		return delta_to_ns_safe(tkr, delta);
 	}
-- 
2.34.1

