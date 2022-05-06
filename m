Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952F51CDC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWLY6fD5z3bxY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+KP8uHe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W+KP8uHe; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzY42Fdz3c8s
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795161; x=1683331161;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=CEzigczvRyU1oQzEnVej8ViYVBfDe59Bvau/LRgGfAw=;
 b=W+KP8uHeRkvUtM5OFzpaJjZgoPML5buCP51xu0xFx39QJ79Q3lkZC7H/
 2N542T1Xf4w5vWjlddB1kGAS/4GtclBNGk/d9wGeNHaOYhF2I7lcZZASt
 Vf8+n34uFxHXIqBnmXio5SXcxPU5o6IZqRM5JTh+cieYsFivgFimocMZ7
 ENZ8FZ+Nl00mC+oo94bBJywaTsChheTbmICBqf75Yvi7VtJo+GtNmBI6P
 aSSp8TQmsqRfr9dLO0xqxcdUGYP2tafuqDwjkMW2IUG4RMuDog+cNaihr
 /xjy+XR3/IuC16Kph0HoLXRE6ghQwPE26hog93hMzI8JKo5BUMtXiZKwl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437342"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914451"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:56 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 27/29] watchdog: Expose lockup_detector_reconfigure()
Date: Thu,  5 May 2022 17:00:06 -0700
Message-Id: <20220506000008.30892-28-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When there are multiple implementations of the NMI watchdog, there may be
situations in which switching from one to another is needed. If the time-
stamp counter becomes unstable, the HPET-based NMI watchdog can no longer
be used. Similarly, the HPET-based NMI watchdog relies on tsc_khz and
needs to be informed when it is refined.

Reloading the NMI watchdog or switching to another hardlockup detector can
be done cleanly by updating the arch-specific stub and then reconfiguring
the whole lockup detector.

Expose lockup_detector_reconfigure() to achieve this goal.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * None

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
index 6443841a755f..e5b67544f8c8 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -537,7 +537,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
@@ -579,7 +579,7 @@ static __init void lockup_detector_setup(void)
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
-- 
2.17.1

