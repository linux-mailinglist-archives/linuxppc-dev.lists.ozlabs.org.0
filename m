Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3BD876518
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:23:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hs8fc731;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn1b4tlfz3vql
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hs8fc731;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trmss3njgz3vXx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903826; x=1741439826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/EwrCmdvQfW3F1Dq8qT6GRyUT8dQLcc34j3rdWdn4M=;
  b=Hs8fc731p1JF9R77Qp8h1/crFeIkuLqhZxHykHxfDrfJ61f+HLg7KDmM
   t0mahguxuJ7vIaHc2IKrl39xcCDEZ1Q9QN9/Ct+dESaGWV0u25BpeyX3D
   ifweSx/2jRFdK99R7Ro/isuHlfJAwWTCONrypDmnC2gVM0bLunXcx/Mk7
   C++S8rEP3CG9qhbBHUxJhqFdkLV6NLXr7iTLpStLsTm6+P8974/Xpewxc
   rRU1yxmlNK4I1VLWqf1Yl58tUwvqSpk4VYYz7x8eZhhCd9TgBJfOY/ksO
   KuBcWNoAgD2buWZi0w5Q8XuyPIVc+Pl0Cham26HFvS3LCCJEyINHsaBbw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342830"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161581"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:57 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 14/19] timekeeping: Consolidate timekeeping helpers
Date: Fri,  8 Mar 2024 15:15:07 +0200
Message-Id: <20240308131512.44324-15-adrian.hunter@intel.com>
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

