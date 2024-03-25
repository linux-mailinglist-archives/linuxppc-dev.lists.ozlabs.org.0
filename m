Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD98891B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:47:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mfUhWkUy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33Qk6nj5z3vvQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mfUhWkUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Hm0kLRz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:41:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348900; x=1742884900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zboSVI3HgVZXbpDBNnsTotqgGm69H9hHwUY1hZ67rA8=;
  b=mfUhWkUyMP9Xfg6SaFC6zk+XyeA3ns6ZKJukCAUaqZsWa9mj1hCE8zgp
   ac9eSr3i3/wzULGdyjvQIQIgz5IYFKp323s7fXTlJWeQhh2iUQz6w/YpT
   q9//g/zzlB48+nzi6FQektW7q+FfZumzY/sxSm59ulTQM8zSe1TFiHfXh
   MTZ4KAL++RKAtfsOaSxbLucjmOaYLbiQZLMhUSNTVKS0toG3IBx2BHZ2n
   DnqKeQHf7A00bsoLVz+hhpgWIuJ13EfmdoJ3qjeS7sHskdzisko1lOGV7
   x9q835ycblnDKY7miuT5zOIMhkjlhThtJcLtxW7ZguPhaNcwndsX8sx7v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17065264"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17065264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629609"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 09/19] timekeeping: Move timekeeping helper functions
Date: Mon, 25 Mar 2024 08:40:13 +0200
Message-Id: <20240325064023.2997-10-adrian.hunter@intel.com>
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

Move timekeeping helper functions to prepare for their reuse.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 kernel/time/timekeeping.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index b58dffc58a8f..3375f0a6400f 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -381,6 +381,23 @@ static inline u64 timekeeping_delta_to_ns(const struct tk_read_base *tkr, u64 de
 	return nsec;
 }
 
+static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *tkr, u64 cycles)
+{
+	u64 delta;
+
+	/* calculate the delta since the last update_wall_time */
+	delta = clocksource_delta(cycles, tkr->cycle_last, tkr->mask);
+	return timekeeping_delta_to_ns(tkr, delta);
+}
+
+static __always_inline u64 fast_tk_get_delta_ns(struct tk_read_base *tkr)
+{
+	u64 delta, cycles = tk_clock_read(tkr);
+
+	delta = clocksource_delta(cycles, tkr->cycle_last, tkr->mask);
+	return timekeeping_delta_to_ns(tkr, delta);
+}
+
 static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
 {
 	u64 delta;
@@ -389,15 +406,6 @@ static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
 	return timekeeping_delta_to_ns(tkr, delta);
 }
 
-static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *tkr, u64 cycles)
-{
-	u64 delta;
-
-	/* calculate the delta since the last update_wall_time */
-	delta = clocksource_delta(cycles, tkr->cycle_last, tkr->mask);
-	return timekeeping_delta_to_ns(tkr, delta);
-}
-
 /**
  * update_fast_timekeeper - Update the fast and NMI safe monotonic timekeeper.
  * @tkr: Timekeeping readout base from which we take the update
@@ -431,14 +439,6 @@ static void update_fast_timekeeper(const struct tk_read_base *tkr,
 	memcpy(base + 1, base, sizeof(*base));
 }
 
-static __always_inline u64 fast_tk_get_delta_ns(struct tk_read_base *tkr)
-{
-	u64 delta, cycles = tk_clock_read(tkr);
-
-	delta = clocksource_delta(cycles, tkr->cycle_last, tkr->mask);
-	return timekeeping_delta_to_ns(tkr, delta);
-}
-
 static __always_inline u64 __ktime_get_fast_ns(struct tk_fast *tkf)
 {
 	struct tk_read_base *tkr;
-- 
2.34.1

