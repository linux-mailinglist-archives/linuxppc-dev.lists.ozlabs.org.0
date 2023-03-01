Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652C6A781E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:56:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrk01fCBz3fWK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:56:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AOBB/LWd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AOBB/LWd;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJc5K9yz3cMy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713888; x=1709249888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OqhPN6kNm1+6G6yIlNPIASa1IBCFVuZdDvhvGUbI0q8=;
  b=AOBB/LWdZLdxtjd4r+sxXsRjAkrteQbBt3PTcA4zb1+ePNicyjt2fNTB
   p7t4QptGyVpwdH2ji3gNCXPOISf0HYVSk5/JwwNtmET5EWMMa+uswDWv5
   tbQ/fpB+GrNA8AAErsmEeehWUspm+/SDdMiZTGtPv/D/7mptGBuyS6em3
   RI8lKjQXFNGrGpIv6yvTD4e5FKPrCucSNGJqgK+NM5Zh0TnHUJQRf6+Yl
   S9ASruNx1dwvqfux+XyQwROFMtt2kjANF5p7yeOKattvHAideDM6ZDP7o
   d3pdbbC2zHlob5Kpw4+NBut4/SoFliTTZ0XyP1vf2EUeAogwY5r7fprH+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818792"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826868"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826868"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:38:00 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 21/24] watchdog/hardlockup/hpet: Only enable the HPET watchdog via a boot parameter
Date: Wed,  1 Mar 2023 15:47:50 -0800
Message-Id: <20230301234753.28582-22-ricardo.neri-calderon@linux.intel.com>
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

Keep the HPET-based hardlockup detector disabled unless explicitly enabled
via a command-line argument. If such parameter is not given, the
initialization of the HPET-based hardlockup detector fails and the NMI
watchdog will fall back to use the perf-based implementation.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
--
Changes since v6:
 * Do not reuse the nmi_watchdog command line option. Instead, use a
   separate command line option. (Nicholas Piggin)
 * Document conflict with conflict between `hpet_nmi_watchdog` and
   `nohz_full` and dependency on `no_ipi_broadcast`.

Changes since v5:
 * None

Changes since v4:
 * None

Changes since v3:
 * None

Changes since v2:
 * Do not imply that using nmi_watchdog=hpet means the detector is
   enabled. Instead, print a warning in such case.

Changes since v1:
 * Added documentation to the function handing the nmi_watchdog
   kernel command-line argument.
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 arch/x86/kernel/watchdog_hld_hpet.c             | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 46268d6baa43..2d1262bb99c7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1708,6 +1708,14 @@
 	hpet_mmap=	[X86, HPET_MMAP] Allow userspace to mmap HPET
 			registers.  Default set by CONFIG_HPET_MMAP_DEFAULT.
 
+	hpet_nmi_watchdog [X86, KNL]
+			Drive the NMI watchdog with an HPET channel. This option
+			has no effect if the NMI watchdog is not enabled.
+			The HPET NMI watchdog conflicts with the parameters
+			nohz_full, no_ipi_broadcast, and hpet=disable. If any
+			of these parameters is present the NMI watchdog will
+			fall back to the perf-driven implementation.
+
 	hugepages=	[HW] Number of HugeTLB pages to allocate at boot.
 			If this follows hugepagesz (below), it specifies
 			the number of pages of hugepagesz to be allocated.
diff --git a/arch/x86/kernel/watchdog_hld_hpet.c b/arch/x86/kernel/watchdog_hld_hpet.c
index a03126e02eda..0fc728ad6f15 100644
--- a/arch/x86/kernel/watchdog_hld_hpet.c
+++ b/arch/x86/kernel/watchdog_hld_hpet.c
@@ -39,6 +39,7 @@
 #include "apic/local.h"
 
 static struct hpet_hld_data *hld_data;
+static bool hardlockup_use_hpet;
 static u64 tsc_next_error;
 
 static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
@@ -366,6 +367,19 @@ void hardlockup_detector_hpet_start(void)
 	enable_timer(hld_data);
 }
 
+/**
+ * hardlockup_detector_hpet_setup() - Parse command-line parameters
+ * @str:	A string containing the kernel command line
+ *
+ * If selected by the user, enable this hardlockup detector.
+ */
+static int __init hardlockup_detector_hpet_setup(char *str)
+{
+	hardlockup_use_hpet = true;
+	return 1;
+}
+__setup("hpet_nmi_watchdog", hardlockup_detector_hpet_setup);
+
 static const char hpet_hld_init_failed[] = "Initialization failed:";
 
 /**
@@ -382,6 +396,9 @@ int __init hardlockup_detector_hpet_init(void)
 {
 	int ret;
 
+	if (!hardlockup_use_hpet)
+		return -ENODEV;
+
 	if (!is_hpet_enabled()) {
 		pr_info("%s HPET unavailable\n", hpet_hld_init_failed);
 		return -ENODEV;
-- 
2.25.1

