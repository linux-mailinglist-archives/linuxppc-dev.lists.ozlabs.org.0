Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EFA948C0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 11:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdSQC6TpSz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 19:17:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdSPr3w7xz301T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 19:17:36 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WdRvv15sVzQngm;
	Tue,  6 Aug 2024 16:55:07 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A30A118009B;
	Tue,  6 Aug 2024 16:59:32 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 6 Aug 2024 16:59:31 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
Subject: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based system
Date: Tue, 6 Aug 2024 16:53:19 +0800
Message-ID: <20240806085320.63514-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20240806085320.63514-1-yangyicong@huawei.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
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
Cc: xuwei5@huawei.com, rafael@kernel.org, gregkh@linuxfoundation.org, x86@kernel.org, guohanjun@huawei.com, linux-kernel@vger.kernel.org, linuxarm@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yicong Yang <yangyicong@hisilicon.com>

For ACPI we'll build the topology from PPTT and we cannot directly
get the SMT number of each core. Instead using a temporary xarray
to record the SMT number of each core when building the topology
and we can know the largest SMT number in the system. Then we can
enable the support of SMT control.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..f72e1e55b05e 100644
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
@@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
  */
 int __init parse_acpi_topology(void)
 {
+	int thread_num, max_smt_thread_num = 1;
+	struct xarray core_threads;
 	int cpu, topology_id;
+	void *entry;
 
 	if (acpi_disabled)
 		return 0;
 
+	xa_init(&core_threads);
+
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0)
@@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
 			cpu_topology[cpu].thread_id = topology_id;
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			cpu_topology[cpu].core_id   = topology_id;
+
+			entry = xa_load(&core_threads, topology_id);
+			if (!entry) {
+				xa_store(&core_threads, topology_id,
+					 xa_mk_value(1), GFP_KERNEL);
+			} else {
+				thread_num = xa_to_value(entry);
+				thread_num++;
+				xa_store(&core_threads, topology_id,
+					 xa_mk_value(thread_num), GFP_KERNEL);
+
+				if (thread_num > max_smt_thread_num)
+					max_smt_thread_num = thread_num;
+			}
 		} else {
 			cpu_topology[cpu].thread_id  = -1;
 			cpu_topology[cpu].core_id    = topology_id;
@@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
+	xa_destroy(&core_threads);
 	return 0;
 }
 #endif
-- 
2.24.0

