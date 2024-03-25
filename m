Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 292318891DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:51:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lewoe6ah;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33Vd6P4tz3w5b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lewoe6ah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33JV2ZW5z3vbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:42:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348938; x=1742884938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/EwrCmdvQfW3F1Dq8qT6GRyUT8dQLcc34j3rdWdn4M=;
  b=lewoe6ahEFPTJQDuwVMSkK6BpfPusNinXF6/QRPGsscaYlU2gbnalrbE
   DJEi3xjmUkd2lHs4PoB50QaGWprUwwetrUJNlnWs05KMSSpkgLtVhh5rr
   EHDS/sPyPky7+F1rgMe3U91MUxJ5n5VBzwky9rbmQa7LhkHFntdT7WIW7
   oUfwnZQruwho48QotzDGcYiiMAIv10QBBNs+wRJTQdMdkTzEXRKOk7A17
   k0yhqUjES2b0BgSFWahVDnl3vreyTrOI6cm2AQUq99alX9uoWvkuO6AOt
   Je1LLJGJTtvfEwWNidz9ec91nu0JchMDUxrvIQyK5B84ErQ+AYVVYkayZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6191527"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6191527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629681"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:42:04 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 14/19] timekeeping: Consolidate timekeeping helpers
Date: Mon, 25 Mar 2024 08:40:18 +0200
Message-Id: <20240325064023.2997-15-adrian.hunter@intel.com>
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

Consolidate timekeeping helpers, making use of timekeeping_cycles_to_ns()
in preference to directly using timekeeping_delta_to_ns().

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 kernel/time/timekeeping.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 618328cd4bc4..1bbfe1ff8d24 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -237,7 +237,9 @@ static void timekeeping_check_update(struct timekeeper *tk, u64 offset)
 	}
 }
 
-static inline u64 timekeeping_debug_get_delta(const struct tk_read_base *tkr)
+static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *tkr, u64 cycles);
+
+static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *tkr)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
 	u64 now, last, mask, max, delta;
@@ -266,22 +268,22 @@ static inline u64 timekeeping_debug_get_delta(const struct tk_read_base *tkr)
 	 */
 	if (unlikely((~delta & mask) < (mask >> 3))) {
 		tk->underflow_seen = 1;
-		delta = 0;
+		now = last;
 	}
 
 	/* Cap delta value to the max_cycles values to avoid mult overflows */
 	if (unlikely(delta > max)) {
 		tk->overflow_seen = 1;
-		delta = tkr->clock->max_cycles;
+		now = last + max;
 	}
 
-	return delta;
+	return timekeeping_cycles_to_ns(tkr, now);
 }
 #else
 static inline void timekeeping_check_update(struct timekeeper *tk, u64 offset)
 {
 }
-static inline u64 timekeeping_debug_get_delta(const struct tk_read_base *tkr)
+static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *tkr)
 {
 	BUG();
 }
@@ -389,7 +391,7 @@ static __always_inline u64 __timekeeping_get_ns(const struct tk_read_base *tkr)
 static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
 {
 	if (IS_ENABLED(CONFIG_DEBUG_TIMEKEEPING))
-		return timekeeping_delta_to_ns(tkr, timekeeping_debug_get_delta(tkr));
+		return timekeeping_debug_get_ns(tkr);
 
 	return __timekeeping_get_ns(tkr);
 }
-- 
2.34.1

