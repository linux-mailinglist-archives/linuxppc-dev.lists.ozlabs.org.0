Return-Path: <linuxppc-dev+bounces-2723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2239B6370
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 13:55:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdnCV56HDz2ysb;
	Wed, 30 Oct 2024 23:55:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730292902;
	cv=none; b=FcWSQG3PaglcwV8133DdR6CLhB6A+ZDLk4nrrBA9CjSlDNSXhe7uMo+u1IgHSDfakiXt+CoU4F2ZdV2hK9q4cwvG2MO1hH/6O+0lmFLkkz6qQS49Oaff2oUqAv8pk+JSIw1luMZRkWaQDodNerkP/PeP58OzhSKhlsYzVjaY5/1FisWjv/zlmGTGiYeleSl8C43HMGzAHWpk7iKqqP201h5F2baTLsZBNfaQER/iytQKxS4heoxFUE+XwGFpAGtxyfj6DbBSyOR2RtEBJBjCkka5wM46/AIY0GC9Try4nYFVmCN3n+6fYsgSanSptKfPDS9VOnF3Tood+XfDEVFz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730292902; c=relaxed/relaxed;
	bh=gaJyc33YpasxmzVq2msy7/YeZGB80Mh1Vt6dUG0iHBU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpYzJ9hNpQUfjcbvTiHda7aLL9m8o9Q2N6/DOU55xtet6fSgyFL/Ton9k3OmzZ9Jr+Km6HEYysTuLOvW8JrVKppY/hdmuMW/L2uPRTgdxzF+QQkUxTVWI9RtzQc/J0xaUkTllqKtk7MGx7zoSUHgHNSnewl6P4xA5IBKUOh6PlaLXxwLzMd9FxiYe90y1VCosK5LsLqEDDp7QHXuvHGIXVHLJcN7HpO1CVi+wwCBVtGqU56YklJZ+SmHd+niCZHpGwwnhlSiqTKdypEiBSmCWqE1KJXt/A4Adl9x5gbmrTqmXUKRHsaF92DTGnfluKQamQGSEkSw2/wh89BEYIaCsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdnCT0SY4z2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 23:55:00 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xdn9Q5cSfz2Df7S;
	Wed, 30 Oct 2024 20:53:14 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0603A1A0188;
	Wed, 30 Oct 2024 20:54:47 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 30 Oct 2024 20:54:46 +0800
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
Subject: [PATCH v7 3/4] arm64: topology: Support SMT control on ACPI based system
Date: Wed, 30 Oct 2024 20:54:14 +0800
Message-ID: <20241030125415.18994-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241030125415.18994-1-yangyicong@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
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
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..47f838d6e823 100644
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
+	int thread_num;
+	int core_id;
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
@@ -57,6 +70,32 @@ int __init parse_acpi_topology(void)
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
+			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON(!entry);
+
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
@@ -67,6 +106,24 @@ int __init parse_acpi_topology(void)
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


