Return-Path: <linuxppc-dev+bounces-2259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75D99DC50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 04:36:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSJBh0n0vz3c3n;
	Tue, 15 Oct 2024 13:36:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728959788;
	cv=none; b=bzDbOVHCh81Ru6wopEy8PfbA6QF2Gf6vOfeNQ19WLUe2xLxK9JrnZ5HTyIeiCDMilEiVtm7+Kym6hmSiRYv6SEbiV3tVTj+E338imZ3663YvazHfM6srF3WR/kdOwpdVnU8CNkZkn/fzDVhEeUg34x16NesqcCanEbMXQ3xdiNHlHxezdcQTGpQiU5jkTmOhGA0mmvBLh8pPNpabaztACzUmKQISwh/qjQjaXsNRFFV2kJd/fjObOmG4W7V+OOOSavw80LDaWusI1DqXetja4AOqOWSQMWZzYefGgMfeyHqq6IsNN5pO423DlYIPNwIhDDFQ/gHsJJzubFPnzQ4fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728959788; c=relaxed/relaxed;
	bh=hldZw9KaJPDELoreg639bWDC2G4OhEEBghyJvWtZzDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuMsxACZlYjNWAkvL3rsjn6bno9gCd/qjkaTtPHqUyOJG1h10Br8vYj/LUIDSUOegDqbtYrSCEDRTwCrHzWRXRLYHsR1l9ldIoe5RAa60kHahZuEgDzkkVzjsEDZGSkazqDWH03bZK79C1JjR4Sowq1CmFqbtbYlMCHyDo312K5iBB5LRgD9Gnu4kXaHAZXHBDN3N+9FpdroajX0g5zm10kxQMa5oyXSSkuyMJHWVOpntykfZMjNMmzk1oM/PWyOUd4qUibcDr2d9KMeXEWB0RcCl3ABxDE8OOExcZj0kKaueix5R08P5jEnFWsKVBQPT1531Mo4WvdmZI2zmHkaaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1040 seconds by postgrey-1.37 at boromir; Tue, 15 Oct 2024 13:36:26 AEDT
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSJBf0Qdmz3brB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 13:36:23 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XSHn84z2Qz1j9wx;
	Tue, 15 Oct 2024 10:17:48 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id F26161400D4;
	Tue, 15 Oct 2024 10:19:00 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 15 Oct 2024 10:19:00 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: [PATCH v6 3/4] arm64: topology: Support SMT control on ACPI based system
Date: Tue, 15 Oct 2024 10:18:40 +0800
Message-ID: <20241015021841.35713-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241015021841.35713-1-yangyicong@huawei.com>
References: <20241015021841.35713-1-yangyicong@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

For ACPI we'll build the topology from PPTT and we cannot directly
get the SMT number of each core. Instead using a temporary xarray
to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
and SMT information of the first core in its heterogeneous CPU cluster
when building the topology. Then we can know the largest SMT number
in the system.

The core's SMT control provides two interface to the users [1]:
1) enable/disable SMT by writing on/off
2) enable/disable SMT by writing thread number 1/max_thread_number

If a system have more than one SMT thread number the 2) may
not handle it well, since there're multiple thread numbers in the
system and 2) only accept 1/max_thread_number. So issue a warning
to notify the users if such system detected.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..2fa584b932ee 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -15,8 +15,10 @@
 #include <linux/arch_topology.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_smt.h>
 #include <linux/init.h>
 #include <linux/percpu.h>
+#include <linux/xarray.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }
 
+struct cpu_smt_info {
+	int thread_num;
+	int core_id;
+	int cpu;
+};
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
  */
 int __init parse_acpi_topology(void)
 {
+	int max_smt_thread_num = 0;
+	struct cpu_smt_info *entry;
+	struct xarray hetero_cpu;
+	unsigned long hetero_id;
 	int cpu, topology_id;
 
 	if (acpi_disabled)
 		return 0;
 
+	xa_init(&hetero_cpu);
+
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0)
@@ -57,6 +71,30 @@ int __init parse_acpi_topology(void)
 			cpu_topology[cpu].thread_id = topology_id;
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			cpu_topology[cpu].core_id   = topology_id;
+
+			/*
+			 * Build up the XArray using the heterogeneous ID of
+			 * the CPU cluster. Store the CPU and SMT information
+			 * of the first appeared CPU in the CPU cluster of this
+			 * heterogeneous ID since the SMT information should be
+			 * the same in this CPU cluster. Then we can know the
+			 * SMT information of each heterogeneous CPUs in the
+			 * system.
+			 */
+			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
+			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON(!entry);
+
+				entry->cpu = cpu;
+				entry->core_id = topology_id;
+				entry->thread_num = 1;
+				xa_store(&hetero_cpu, hetero_id,
+					 entry, GFP_KERNEL);
+			} else if (entry->core_id == topology_id) {
+				entry->thread_num++;
+			}
 		} else {
 			cpu_topology[cpu].thread_id  = -1;
 			cpu_topology[cpu].core_id    = topology_id;
@@ -67,6 +105,29 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+	/*
+	 * This should be a short loop depending on the number of heterogeneous
+	 * CPU clusters. Typically on a homogeneous system there's only one
+	 * entry in the XArray.
+	 */
+	xa_for_each(&hetero_cpu, hetero_id, entry) {
+		/*
+		 * If max_smt_thread_num has been initialized and doesn't match
+		 * the thread number of this entry, then the system has
+		 * heterogeneous SMT topology.
+		 */
+		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
+			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
+
+		if (entry->thread_num > max_smt_thread_num)
+			max_smt_thread_num = entry->thread_num;
+
+		xa_erase(&hetero_cpu, hetero_id);
+		kfree(entry);
+	}
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&hetero_cpu);
 	return 0;
 }
 #endif
-- 
2.24.0


