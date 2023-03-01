Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A086A7826
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrpD39lWz3fjm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 11:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X6wJbQaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X6wJbQaq;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJd4NJFz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713889; x=1709249889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NR72OLVunS5t2SqSsi29lRMoOPaXNWEb1txH4+ymFL0=;
  b=X6wJbQaqhjvo00wTDr3+7lf39mp6PXHSrKhM9MvuqMpqyr2aXbo2jkmW
   2X7l4JrnDIotQ33Q0IxM6LcfAAYpkAqDCuQKMx5Ht7IUVPsXKYi4D/ALB
   MsQ9sg53psP3JSjOlnPaZhxikhNEf3RTDeN2k9Lgkmsuo3OxdkS6FY1Gh
   NKmQ0TaOTWB4bx06kIrMzhLx1sud8ZHJzfOTdWbYF/dtTXDnpHblRGHC6
   bjjzYWKvkdeqG9PFpOvm+qTbn77PVN58GjyIkKnj4v9V2g+7yfa6/zWMK
   3wzTsHE+cMOf7NeUEnsC5bgZ9QTykiJs+Me4yX0LGjgI7yEWtOsDR9ubR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818805"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818805"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826877"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826877"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:38:01 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 24/24] x86/tsc: Stop the HPET hardlockup detector if TSC become unstable
Date: Wed,  1 Mar 2023 15:47:53 -0800
Message-Id: <20230301234753.28582-25-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HPET-based hardlockup detector relies on the TSC to determine if an
observed NMI interrupt was originated by HPET timer. Hence, this detector
can no longer be used with an unstable TSC. Once marked as unstable,
the TSC cannot be stable again. In such case, permanently stop the HPET-
based hardlockup detector.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Do not switch to the perf-based NMI watchdog. Instead, only stop
   the HPET-based NMI watchdog if the TSC counter becomes unstable.

Changes since v5:
 * Relocated the declaration of hardlockup_detector_switch_to_perf() to
   x86/nmi.h It does not depend on HPET.
 * Removed function stub. The shim hardlockup detector is always for x86.

Changes since v4:
 * Added a stub version of hardlockup_detector_switch_to_perf() for
   !CONFIG_HPET_TIMER. (lkp)
 * Reconfigure the whole lockup detector instead of unconditionally
   starting the perf-based hardlockup detector.

Changes since v3:
 * None

Changes since v2:
 * Introduced this patch.

Changes since v1:
 * N/A
---
 arch/x86/include/asm/nmi.h     |  6 ++++++
 arch/x86/kernel/tsc.c          |  3 +++
 arch/x86/kernel/watchdog_hld.c | 11 +++++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index 5c5f1e56c404..4d0687a2b4ea 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -63,4 +63,10 @@ void stop_nmi(void);
 void restart_nmi(void);
 void local_touch_nmi(void);
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR
+extern void hardlockup_detector_mark_hpet_hld_unavailable(void);
+#else
+static inline void hardlockup_detector_mark_hpet_hld_unavailable(void) {}
+#endif
+
 #endif /* _ASM_X86_NMI_H */
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 344698852146..24f77efea569 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1191,6 +1191,9 @@ void mark_tsc_unstable(char *reason)
 
 	clocksource_mark_unstable(&clocksource_tsc_early);
 	clocksource_mark_unstable(&clocksource_tsc);
+
+	/* The HPET hardlockup detector depends on a stable TSC. */
+	hardlockup_detector_mark_hpet_hld_unavailable();
 }
 
 EXPORT_SYMBOL_GPL(mark_tsc_unstable);
diff --git a/arch/x86/kernel/watchdog_hld.c b/arch/x86/kernel/watchdog_hld.c
index 33c22f6456a3..f5d79ce0e7a2 100644
--- a/arch/x86/kernel/watchdog_hld.c
+++ b/arch/x86/kernel/watchdog_hld.c
@@ -6,6 +6,8 @@
  * Copyright (C) Intel Corporation 2023
  */
 
+#define pr_fmt(fmt) "watchdog: " fmt
+
 #include <linux/nmi.h>
 #include <asm/hpet.h>
 
@@ -84,3 +86,12 @@ void watchdog_nmi_start(void)
 	if (detector_type == X86_HARDLOCKUP_DETECTOR_HPET)
 		hardlockup_detector_hpet_start();
 }
+
+void hardlockup_detector_mark_hpet_hld_unavailable(void)
+{
+	if (detector_type != X86_HARDLOCKUP_DETECTOR_HPET)
+		return;
+
+	pr_warn("TSC is unstable. Stopping the HPET NMI watchdog.");
+	hardlockup_detector_mark_unavailable();
+}
-- 
2.25.1

