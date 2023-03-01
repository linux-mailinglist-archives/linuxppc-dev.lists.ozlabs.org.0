Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A46A781F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrl95pnXz3fTP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAbHbTcF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAbHbTcF;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJd1P7qz3cKD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713889; x=1709249889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TJtWiEKn9cKtWyiPL16X6Q+Hc9VuKWnOfoMEGJZdAM0=;
  b=ZAbHbTcFOyZ2HMg5U6+7zoE73BhrYTXz6lzCN3hJyU18fkqmj/9lXgDJ
   CJX4r86woOWQ7zoXP6zd9VTEkPRhLkRRo8bIeJzqRM0FL6GUfIc1jwzIB
   D8o5CTZ1g+fiJIZJrq4YLzvzU8ys7BKkXW+cWQxneSZMvKShkO9zOayRT
   HXFD7kWMcKAMcPO4CEGV/YOmyGkW1oe7+SHMDNPb8bKnomF34iFM/M5qg
   /OLrt4EiDnmO9izIEi5aS803wfdcBb7Z4sbmTm5HNByHFVGeYTlbenEXV
   XSNTVXyWbHbcZqKy0SGPDeiiaCAH27M6V2pjz9BF+AyW2JM6a8Xpjqtnz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818801"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818801"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826874"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826874"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:38:00 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 23/24] watchdog: Introduce hardlockup_detector_mark_unavailable()
Date: Wed,  1 Mar 2023 15:47:52 -0800
Message-Id: <20230301234753.28582-24-ricardo.neri-calderon@linux.intel.com>
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

The NMI watchdog may become unreliable during runtime. This is the case
in x86 if, for instance, the HPET-based hardlockup detector is in use and
the TSC counter becomes unstable.

Introduce a new interface to mark the hardlockup detector as unavailable
in such cases. When doing this, update the state of /proc/sys/kernel/
nmi_watchdog to keep it consistent.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Introduced this patch

Changes since v5:
 * N/A

Changes since v4
 * N/A

Changes since v3
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 include/linux/nmi.h |  2 ++
 kernel/watchdog.c   | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index a38c4509f9eb..40a97139ec65 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -83,9 +83,11 @@ static inline void reset_hung_task_detector(void) { }
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR)
 extern void hardlockup_detector_disable(void);
+extern void hardlockup_detector_mark_unavailable(void);
 extern unsigned int hardlockup_panic;
 #else
 static inline void hardlockup_detector_disable(void) {}
+static inline void hardlockup_detector_mark_unavailable(void) {}
 #endif
 
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 8e61f21e7e33..0e4fed6d95b9 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -47,6 +47,8 @@ static int __read_mostly nmi_watchdog_available;
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
 
+static void __lockup_detector_reconfigure(void);
+
 #ifdef CONFIG_HARDLOCKUP_DETECTOR
 
 # ifdef CONFIG_SMP
@@ -85,6 +87,24 @@ static int __init hardlockup_panic_setup(char *str)
 }
 __setup("nmi_watchdog=", hardlockup_panic_setup);
 
+/**
+ * hardlockup_detector_mark_unavailable - Mark the NMI watchdog as unavailable
+ *
+ * Indicate that the hardlockup detector has become unavailable. This may
+ * happen if the hardware resources that the detector uses have become
+ * unreliable.
+ */
+void hardlockup_detector_mark_unavailable(void)
+{
+	mutex_lock(&watchdog_mutex);
+
+	/* These variables can be updated without stopping the detector. */
+	nmi_watchdog_user_enabled = 0;
+	nmi_watchdog_available = false;
+
+	__lockup_detector_reconfigure();
+	mutex_unlock(&watchdog_mutex);
+}
 #endif /* CONFIG_HARDLOCKUP_DETECTOR */
 
 /*
-- 
2.25.1

