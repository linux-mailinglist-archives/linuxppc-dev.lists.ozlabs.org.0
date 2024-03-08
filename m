Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CE87654C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:28:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfkqnGF/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn7C1QwLz3vr4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfkqnGF/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrmtP5zLWz3vcs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903854; x=1741439854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zboSVI3HgVZXbpDBNnsTotqgGm69H9hHwUY1hZ67rA8=;
  b=OfkqnGF/SoGxVbwqQrOxyL4/tBwLo/HfX+LiwCrmMTUCSrGWOVbLwfn7
   rHcArpY3oJ+ibbjUPjBBDo/Amkv2t3YN2ObAo1CZNalS9ciVXTKWIWJHT
   Iq9I6gOQENShcWvpXzjt+ZCNIFMuttBo8jgWTtdlOoUp57SBQ7negz+RC
   cLdyTjJCzruYxuDayWuEgtNVaiF8NETHjMm24jBYBELItMaMuo+iu4o1Q
   QXwAGn5yfd5cR3WGlXvBfqFp8vJKIJGs+qQ34WxxMufQWI7LlwqNQTYaD
   b3caxxmIr20edxDHe6Gob+Rq3amKZZiA53OAjC10GunPgCe03eZouWd0A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342638"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161489"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:23 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 09/19] timekeeping: Move timekeeping helper functions
Date: Fri,  8 Mar 2024 15:15:02 +0200
Message-Id: <20240308131512.44324-10-adrian.hunter@intel.com>
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

