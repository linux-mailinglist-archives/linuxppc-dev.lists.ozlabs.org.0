Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412587650B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:21:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/UXphJo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trmz61sx5z3vgk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:21:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/UXphJo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trmsk2Thzz3vYv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:16:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903819; x=1741439819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=16GQ0vc+mvjtkGYNmUSKlWdfc5Q8uWzvZ2NpVFo2g5s=;
  b=A/UXphJoVkTHDk7NZeAzHmP6lhxKeb6O8RDUM8JOroEuMv5IEudKDXr5
   tTioDFp3aQYpULnOTTc35jkhRTgGMgSohupxffEAqB6qHrNr8Bb/tUhKq
   iOi+BQsU8rC9d02TVJ8Kf3VGOar65gc0U3+ijpiiKei0nFFh86GnGiUoT
   thSmzcA8gLzb0/Vtjtb1m/fr5RxfEMk3ajHJGtfQ8mYH8DECqvFYpT82x
   awiqE509TR99YrovmDndPYxYz0yHmpkVqxO+6QP7UC9QbphkVQmeVHyyF
   vO5FH/qDhb2GrKRKgBKcziiqZhmVeflL/vGtplGJugdQyXbP3JlJYTi25
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342801"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161573"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:50 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 13/19] timekeeping: Refactor timekeeping helpers
Date: Fri,  8 Mar 2024 15:15:06 +0200
Message-Id: <20240308131512.44324-14-adrian.hunter@intel.com>
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

Simplify use of timekeeping sanity checking, in preparation for
consolidating timekeeping helpers. This works towards eliminating
timekeeping_delta_to_ns() in favour of timekeeping_cycles_to_ns().

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 kernel/time/timekeeping.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index f81d675291e0..618328cd4bc4 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -237,7 +237,7 @@ static void timekeeping_check_update(struct timekeeper *tk, u64 offset)
 	}
 }
 
-static inline u64 timekeeping_get_delta(const struct tk_read_base *tkr)
+static inline u64 timekeeping_debug_get_delta(const struct tk_read_base *tkr)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
 	u64 now, last, mask, max, delta;
@@ -281,17 +281,9 @@ static inline u64 timekeeping_get_delta(const struct tk_read_base *tkr)
 static inline void timekeeping_check_update(struct timekeeper *tk, u64 offset)
 {
 }
-static inline u64 timekeeping_get_delta(const struct tk_read_base *tkr)
+static inline u64 timekeeping_debug_get_delta(const struct tk_read_base *tkr)
 {
-	u64 cycle_now, delta;
-
-	/* read clocksource */
-	cycle_now = tk_clock_read(tkr);
-
-	/* calculate the delta since the last update_wall_time */
-	delta = clocksource_delta(cycle_now, tkr->cycle_last, tkr->mask);
-
-	return delta;
+	BUG();
 }
 #endif
 
@@ -396,10 +388,10 @@ static __always_inline u64 __timekeeping_get_ns(const struct tk_read_base *tkr)
 
 static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
 {
-	u64 delta;
+	if (IS_ENABLED(CONFIG_DEBUG_TIMEKEEPING))
+		return timekeeping_delta_to_ns(tkr, timekeeping_debug_get_delta(tkr));
 
-	delta = timekeeping_get_delta(tkr);
-	return timekeeping_delta_to_ns(tkr, delta);
+	return __timekeeping_get_ns(tkr);
 }
 
 /**
-- 
2.34.1

