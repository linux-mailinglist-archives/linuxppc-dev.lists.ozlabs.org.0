Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3387654E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:29:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bTRLqaaL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn7z6Jgvz3w52
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bTRLqaaL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrmtQ4pJyz3vZj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903855; x=1741439855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOOcsyBxpUsFxkAH1hi2UNpYCz2148dQEbBRMVKVw/4=;
  b=bTRLqaaLjH5nyzuzj+aiF7S3sBzufTyts+Lq9r9Swr7TQ19nXAlql7qO
   micXf7dOSt6px58/igy3CaMmWjZFxSW49YvxixD2TE5p6Zj+WwohWF08T
   G0Rn6Gw14Cg0R+ctC3xXA8L5BBA/i6f/Zdzy2nFhGgEooEVdqoWQI0xk2
   nL/xmyhHoM2ACcLHkRf8St2AvObaMOf1qOSY2zSoOwWGBrhictWHW4TPl
   1k8zLnNuG8ZOUsLEoPZ+LMEl6bzooTNrJSAFUjtW/H0cU7khtUlNjBdA4
   Bp4oR8O8/MNgiLJCKNzigJF6XoBJwr9JtiwjO+acUT8CHmSin+BEXQ63w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342933"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161611"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:17:25 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 18/19] timekeeping: Let timekeeping_cycles_to_ns() handle both under and overflow
Date: Fri,  8 Mar 2024 15:15:11 +0200
Message-Id: <20240308131512.44324-19-adrian.hunter@intel.com>
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

