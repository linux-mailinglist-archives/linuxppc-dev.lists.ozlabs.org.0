Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504226A7802
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrdv0qkKz3fZY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D7B5abtj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D7B5abtj;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJb6b5Xz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713888; x=1709249888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7e3va9vu9qwj2yqdORjxuaJ7bdwskL9Kry8TAY9yGpM=;
  b=D7B5abtjcVLoa1KjZE2mgwbYBp7xLnQhQbJG1luOjqbXKybN61RRziJQ
   cr7iCOTcMPLbbNdC2cg+vyryuuSvodyaBIp7az4N8aZtawLsCYJsi4ckM
   iQYd2kgEE5tfYiWfldBeyp1AFdVq+XCHQiXgbhnNTiTOCnwxFtuAbcJZK
   l5NbwfkzSxnv87houpH3ZfqdByxVSndoEOXLGHAXk/Gh48tv5o8EfgAzd
   JILUF5QHDzy8o3tCCItKumQDYtQ196dJ7Cf9y8F0VPv+8TmAmaoDxc+xj
   P6haIUz7cr2QV1MG5MC9p9nCkXUtbLe7+sX7xkCnv82WCdh00udTqiagL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818764"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818764"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826849"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826849"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:59 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 16/24] watchdog/hardlockup: Define a generic function to detect hardlockups
Date: Wed,  1 Mar 2023 15:47:45 -0800
Message-Id: <20230301234753.28582-17-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The procedure to detect hardlockups is independent of the source of the
the non-maskable interrupt that drives it. Place it in a separate, generic
function to be invoked by various implementations of the NMI watchdog.

Move the bulk of watchdog_overflow_callback() to the new function
inspect_for_hardlockups(). This function can then be called from the
applicable NMI handlers. No functional changes.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * None

Changes since v5:
 * None

Changes since v4:
 * None

Changes since v3:
 * None

Changes since v2:
 * None

Changes since v1:
 * None
---
 include/linux/nmi.h   |  1 +
 kernel/watchdog_hld.c | 18 +++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 048c0b9aa623..75038cb2710e 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -209,6 +209,7 @@ int proc_nmi_watchdog(struct ctl_table *, int , void *, size_t *, loff_t *);
 int proc_soft_watchdog(struct ctl_table *, int , void *, size_t *, loff_t *);
 int proc_watchdog_thresh(struct ctl_table *, int , void *, size_t *, loff_t *);
 int proc_watchdog_cpumask(struct ctl_table *, int, void *, size_t *, loff_t *);
+void inspect_for_hardlockups(struct pt_regs *regs);
 
 #ifdef CONFIG_HAVE_ACPI_APEI_NMI
 #include <asm/nmi.h>
diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..b352e507b17f 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -106,14 +106,8 @@ static struct perf_event_attr wd_hw_attr = {
 	.disabled	= 1,
 };
 
-/* Callback function for perf event subsystem */
-static void watchdog_overflow_callback(struct perf_event *event,
-				       struct perf_sample_data *data,
-				       struct pt_regs *regs)
+void inspect_for_hardlockups(struct pt_regs *regs)
 {
-	/* Ensure the watchdog never gets throttled */
-	event->hw.interrupts = 0;
-
 	if (__this_cpu_read(watchdog_nmi_touch) == true) {
 		__this_cpu_write(watchdog_nmi_touch, false);
 		return;
@@ -163,6 +157,16 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	return;
 }
 
+/* Callback function for perf event subsystem */
+static void watchdog_overflow_callback(struct perf_event *event,
+				       struct perf_sample_data *data,
+				       struct pt_regs *regs)
+{
+	/* Ensure the watchdog never gets throttled */
+	event->hw.interrupts = 0;
+	inspect_for_hardlockups(regs);
+}
+
 static int hardlockup_detector_event_create(void)
 {
 	unsigned int cpu = smp_processor_id();
-- 
2.25.1

