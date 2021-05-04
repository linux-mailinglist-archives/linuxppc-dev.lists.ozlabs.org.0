Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 265BC373068
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZTtL1N6kz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZTrn47nvz2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:08:25 +1000 (AEST)
IronPort-SDR: UWiN2kcRdGIibnbrdIv7XaPrVoYg+5mDqA+w7mApSsvsjK6THmEAgDEoR5+NoLq3eDkzp8qfvJ
 lbBjza1feChA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="283467388"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="283467388"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 12:07:18 -0700
IronPort-SDR: 5t1wJq0ned5QVzhquYFXXy/H3YaNTACGOfa3FXOh7/O0IBPXKL050SdG2cXy0mi49ncGZT1wuI
 uIrLgMe4pCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="618591763"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga006.fm.intel.com with ESMTP; 04 May 2021 12:07:18 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@suse.de>
Subject: [RFC PATCH v5 15/16] watchdog: Expose lockup_detector_reconfigure()
Date: Tue,  4 May 2021 12:05:25 -0700
Message-Id: <20210504190526.22347-16-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com>
References: <20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com>
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
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Stephane Eranian <eranian@google.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <andi.kleen@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When there are more than one implementation of the NMI watchdog, there may
be situations in which switching from one to another is needed. For
if the time-stamp counter becomes unstable, the HPET-based NMI watchdog
an no longer be used.

Switching to another hardlockup detector can be done cleanly by updating
the arch-specific stub and then reconfiguring the whole lockup detector.
Expose lockup_detector_reconfigure() to achieve this goal.

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Andi Kleen <andi.kleen@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v4:
 * Switching to the perf-based lockup detector under the hood is hacky.
   Instead, reconfigure the whole lockup detector.

Changes since v3:
 * None

Changes since v2:
 * Introduced this patch.

Changes since v1:
 * N/A
---
 include/linux/nmi.h | 2 ++
 kernel/watchdog.c   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index cf12380e51b3..73827a477288 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -16,6 +16,7 @@ void lockup_detector_init(void);
 void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 bool is_hardlockup(void);
+void lockup_detector_reconfigure(void);
 
 extern int watchdog_user_enabled;
 extern int nmi_watchdog_user_enabled;
@@ -37,6 +38,7 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
 static inline void lockup_detector_init(void) { }
 static inline void lockup_detector_soft_poweroff(void) { }
 static inline void lockup_detector_cleanup(void) { }
+static inline void lockup_detector_reconfigure(void) { }
 #endif /* !CONFIG_LOCKUP_DETECTOR */
 
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 4615064ee282..96f06938dc83 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -531,7 +531,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
@@ -577,7 +577,7 @@ static __init void lockup_detector_setup(void)
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
-- 
2.17.1

