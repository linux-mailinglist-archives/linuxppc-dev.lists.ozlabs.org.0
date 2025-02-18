Return-Path: <linuxppc-dev+bounces-6319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4FA39EB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 15:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy1yq1s4lz2ytT;
	Wed, 19 Feb 2025 01:25:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739888739;
	cv=none; b=K2bT86EHZf5urHgmQdqNZPKONChBFfZ5ejnDmTnA93sL45ne7a2EcUu1saAIp4MblpKwqLMfgN4YKU6wSZ6YBn42lwUr2HPjUMJYi47PslpTQp0NzwEuf/ZgSJvsX/BmYfI6oQj3+8Rv8OPuAbmspqaUpCBXRW/aWt+1S3cARlRTiHPlp0+0aos9RWg9mpbKUoIefRbPkRvTYFs606j620oIviv2N57umI1sMoeLfRv8nLhKhgbyyydWnZMHRMy2a/siCz1J57rgFYBJqzpIiZ82aW25rT749yDijezx9zPiEateKV95KjgAC1DjGP4SitwLkDU/NjUZmcYdVH4yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739888739; c=relaxed/relaxed;
	bh=ofjcbTC5Iths2yPSWOVtIfXGjT3o/MqZin0E+e7oyZc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IvZsLeEWjRHr3NEfl7MyOHNGr0G5OEVRLcESImsEi9WUOEe7vN4Y2DI84T2gvsPsruYcdpoay7pFTuSkQZAzCdVh3ebgE6iPrSz9f2OMyuh77+WPOlfYy2+QmIEOSSAyJoU7UdDLSJCjXQs6bMiNgPuhE6WAWd49v7rd1mEa2fpvwmQkiQbWufAfj4IhVukLpg8S4D9dTwPFLia+2F2MQz2VqzcYo8YPvAb9bvTvt1rmScmDK+iTDlCTPT2iNexl7iJgBWpes0KVpK1D8mJ5Tv3R/z/H81Vh/2TtH/CQTnLubRq9/Bg/jjZCGFiRn2i6FtHDD+X73847fQnAr1tMpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 921 seconds by postgrey-1.37 at boromir; Wed, 19 Feb 2025 01:25:36 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy1ym5KCXz2yVF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 01:25:34 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Yy1YV4MQsz22wPM;
	Tue, 18 Feb 2025 22:07:10 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F5211401F1;
	Tue, 18 Feb 2025 22:10:10 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 18 Feb 2025 22:10:08 +0800
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
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI based system
Date: Tue, 18 Feb 2025 22:10:17 +0800
Message-ID: <20250218141018.18082-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250218141018.18082-1-yangyicong@huawei.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

For ACPI we'll build the topology from PPTT and we cannot directly
get the SMT number of each core. Instead using a temporary xarray
to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
and SMT information of the first core in its heterogeneous CPU cluster
when building the topology. Then we can know the largest SMT number
in the system. If a homogeneous system's using ACPI 6.2 or later,
all the CPUs should be under the root node of PPTT. There'll be
only one entry in the xarray and all the CPUs in the system will
be assumed identical.

The core's SMT control provides two interface to the users [1]:
1) enable/disable SMT by writing on/off
2) enable/disable SMT by writing thread number 1/max_thread_number

If a system have more than one SMT thread number the 2) may
not handle it well, since there're multiple thread numbers in the
system and 2) only accept 1/max_thread_number. So issue a warning
to notify the users if such system detected.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..6eba1ac091ee 100644
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
@@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }
 
+struct cpu_smt_info {
+	unsigned int thread_num;
+	int core_id;
+};
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
  */
 int __init parse_acpi_topology(void)
 {
+	unsigned int max_smt_thread_num = 0;
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
@@ -57,6 +70,34 @@ int __init parse_acpi_topology(void)
 			cpu_topology[cpu].thread_id = topology_id;
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			cpu_topology[cpu].core_id   = topology_id;
+
+			/*
+			 * In the PPTT, CPUs below a node with the 'identical
+			 * implementation' flag have the same number of threads.
+			 * Count the number of threads for only one CPU (i.e.
+			 * one core_id) among those with the same hetero_id.
+			 * See the comment of find_acpi_cpu_topology_hetero_id()
+			 * for more details.
+			 *
+			 * One entry is created for each node having:
+			 * - the 'identical implementation' flag
+			 * - its parent not having the flag
+			 */
+			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
+			entry = xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON_ONCE(!entry);
+
+				if (entry) {
+					entry->core_id = topology_id;
+					entry->thread_num = 1;
+					xa_store(&hetero_cpu, hetero_id,
+						 entry, GFP_KERNEL);
+				}
+			} else if (entry->core_id == topology_id) {
+				entry->thread_num++;
+			}
 		} else {
 			cpu_topology[cpu].thread_id  = -1;
 			cpu_topology[cpu].core_id    = topology_id;
@@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+	/*
+	 * This should be a short loop depending on the number of heterogeneous
+	 * CPU clusters. Typically on a homogeneous system there's only one
+	 * entry in the XArray.
+	 */
+	xa_for_each(&hetero_cpu, hetero_id, entry) {
+		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
+			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
+
+		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
+		xa_erase(&hetero_cpu, hetero_id);
+		kfree(entry);
+	}
+
+	/*
+	 * Notify the CPU framework of the SMT support. Initialize the
+	 * max_smt_thread_num to 1 if no SMT support detected. A thread
+	 * number of 1 can be handled by the framework so we don't need
+	 * to check max_smt_thread_num to see we support SMT or not.
+	 */
+	if (!max_smt_thread_num)
+		max_smt_thread_num = 1;
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&hetero_cpu);
 	return 0;
 }
 #endif
-- 
2.24.0


