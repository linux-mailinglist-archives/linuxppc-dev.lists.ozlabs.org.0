Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4C3DD165
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 09:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdVLw5cdpz3dD1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 17:41:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WovcXPA6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WovcXPA6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdVKl0yn7z30HM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 17:40:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1727XflM193605; Mon, 2 Aug 2021 03:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZR9cYtXClKr5IGdog+sFytOuAUXDyObNFTluF4z0A64=;
 b=WovcXPA60muT1UF1Z0mNKudw3H3cxxjGXP1FT2QxK6OhqeP835Wn9sP9FypQrgktu0N2
 HyeLGpCNLDqwSP06cizsSTTY9AsHsCMSl3O/3bavityBMf9XJbGE+kYyfvtvLQrShDeu
 OXzxPnMNQn7+NjpSvcCbyer0GeU2R3t4VuSaTsn8qeB+UI5qrNhupn95btLdCEbbEPz4
 RM9/bXpk5Lco6KxA0jdLFqSlnt02i1aZZszx1X03VLMiyfIKtbjOvzVSddMXdujbp3Wa
 rDRNKjAbVeCwDbC7c2ESlR3KgCrk9ol5e5FfXAXFIg2fpH21qtO25M3jZ9SGpw3COL9N Ng== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5s26v6y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 03:40:29 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1727cJnF024971;
 Mon, 2 Aug 2021 07:40:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3a4x58kjux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 07:40:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1727eNcM23265676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 07:40:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D1F8A4040;
 Mon,  2 Aug 2021 07:40:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE2DA4053;
 Mon,  2 Aug 2021 07:40:18 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.36.88])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 07:40:18 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [PATCH v4 2/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Date: Mon,  2 Aug 2021 13:09:27 +0530
Message-Id: <20210802073929.907431-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802073929.907431-1-kjain@linux.ibm.com>
References: <20210802073929.907431-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H6SuuMQV7WFzGFk1Jya_gauAjnl4FTOo
X-Proofpoint-GUID: H6SuuMQV7WFzGFk1Jya_gauAjnl4FTOo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_01:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020053
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A common interface is added to get performance stats reporting
support for nvdimm devices. Added interface includes support for
pmu register/unregister functions, cpu hotplug and pmu event
functions like event_init/add/read/del.
User could use the standard perf tool to access perf
events exposed via pmu.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 drivers/nvdimm/Makefile  |   1 +
 drivers/nvdimm/nd_perf.c | 230 +++++++++++++++++++++++++++++++++++++++
 include/linux/nd.h       |   3 +
 3 files changed, 234 insertions(+)
 create mode 100644 drivers/nvdimm/nd_perf.c

diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
index 29203f3d3069..25dba6095612 100644
--- a/drivers/nvdimm/Makefile
+++ b/drivers/nvdimm/Makefile
@@ -18,6 +18,7 @@ nd_e820-y := e820.o
 libnvdimm-y := core.o
 libnvdimm-y += bus.o
 libnvdimm-y += dimm_devs.o
+libnvdimm-y += nd_perf.o
 libnvdimm-y += dimm.o
 libnvdimm-y += region_devs.o
 libnvdimm-y += region.o
diff --git a/drivers/nvdimm/nd_perf.c b/drivers/nvdimm/nd_perf.c
new file mode 100644
index 000000000000..4c49d1bc2a3c
--- /dev/null
+++ b/drivers/nvdimm/nd_perf.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * nd_perf.c: NVDIMM Device Performance Monitoring Unit support
+ *
+ * Perf interface to expose nvdimm performance stats.
+ *
+ * Copyright (C) 2021 IBM Corporation
+ */
+
+#define pr_fmt(fmt) "nvdimm_pmu: " fmt
+
+#include <linux/nd.h>
+
+static ssize_t nvdimm_pmu_cpumask_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct nvdimm_pmu *nd_pmu;
+
+	nd_pmu = container_of(pmu, struct nvdimm_pmu, pmu);
+
+	return cpumap_print_to_pagebuf(true, buf, cpumask_of(nd_pmu->cpu));
+}
+
+static int nvdimm_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
+{
+	struct nvdimm_pmu *nd_pmu;
+	u32 target;
+	int nodeid;
+	const struct cpumask *cpumask;
+
+	nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
+
+	/* Clear it, incase given cpu is set in nd_pmu->arch_cpumask */
+	cpumask_test_and_clear_cpu(cpu, &nd_pmu->arch_cpumask);
+
+	/*
+	 * If given cpu is not same as current designated cpu for
+	 * counter access, just return.
+	 */
+	if (cpu != nd_pmu->cpu)
+		return 0;
+
+	/* Check for any active cpu in nd_pmu->arch_cpumask */
+	target = cpumask_any(&nd_pmu->arch_cpumask);
+
+	/*
+	 * Incase we don't have any active cpu in nd_pmu->arch_cpumask,
+	 * check in given cpu's numa node list.
+	 */
+	if (target >= nr_cpu_ids) {
+		nodeid = cpu_to_node(cpu);
+		cpumask = cpumask_of_node(nodeid);
+		target = cpumask_any_but(cpumask, cpu);
+	}
+	nd_pmu->cpu = target;
+
+	/* Migrate nvdimm pmu events to the new target cpu if valid */
+	if (target >= 0 && target < nr_cpu_ids)
+		perf_pmu_migrate_context(&nd_pmu->pmu, cpu, target);
+
+	return 0;
+}
+
+static int nvdimm_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
+{
+	struct nvdimm_pmu *nd_pmu;
+
+	nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
+
+	if (nd_pmu->cpu >= nr_cpu_ids)
+		nd_pmu->cpu = cpu;
+
+	return 0;
+}
+
+static int create_cpumask_attr_group(struct nvdimm_pmu *nd_pmu)
+{
+	struct perf_pmu_events_attr *attr;
+	struct attribute **attrs;
+	struct attribute_group *nvdimm_pmu_cpumask_group;
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	attrs = kzalloc(2 * sizeof(struct attribute *), GFP_KERNEL);
+	if (!attrs) {
+		kfree(attr);
+		return -ENOMEM;
+	}
+
+	/* Allocate memory for cpumask attribute group */
+	nvdimm_pmu_cpumask_group = kzalloc(sizeof(*nvdimm_pmu_cpumask_group), GFP_KERNEL);
+	if (!nvdimm_pmu_cpumask_group) {
+		kfree(attr);
+		kfree(attrs);
+		return -ENOMEM;
+	}
+
+	sysfs_attr_init(&attr->attr.attr);
+	attr->attr.attr.name = "cpumask";
+	attr->attr.attr.mode = 0444;
+	attr->attr.show = nvdimm_pmu_cpumask_show;
+	attrs[0] = &attr->attr.attr;
+	attrs[1] = NULL;
+
+	nvdimm_pmu_cpumask_group->attrs = attrs;
+	nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR] = nvdimm_pmu_cpumask_group;
+	return 0;
+}
+
+static int nvdimm_pmu_cpu_hotplug_init(struct nvdimm_pmu *nd_pmu)
+{
+	int nodeid, rc;
+	const struct cpumask *cpumask;
+
+	/*
+	 * Incase cpu hotplug is not handled by arch specific code
+	 * they can still provide required cpumask which can be used
+	 * to get designatd cpu for counter access.
+	 * Check for any active cpu in nd_pmu->arch_cpumask.
+	 */
+	if (!cpumask_empty(&nd_pmu->arch_cpumask)) {
+		nd_pmu->cpu = cpumask_any(&nd_pmu->arch_cpumask);
+	} else {
+		/* pick active cpu from the cpumask of device numa node. */
+		nodeid = dev_to_node(nd_pmu->dev);
+		cpumask = cpumask_of_node(nodeid);
+		nd_pmu->cpu = cpumask_any(cpumask);
+	}
+
+	rc = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/nvdimm:online",
+				     nvdimm_pmu_cpu_online, nvdimm_pmu_cpu_offline);
+
+	if (rc < 0)
+		return rc;
+
+	nd_pmu->cpuhp_state = rc;
+
+	/* Register the pmu instance for cpu hotplug */
+	rc = cpuhp_state_add_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	if (rc) {
+		cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
+		return rc;
+	}
+
+	/* Create cpumask attribute group */
+	rc = create_cpumask_attr_group(nd_pmu);
+	if (rc) {
+		cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+		cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
+		return rc;
+	}
+
+	return 0;
+}
+
+void nvdimm_pmu_free_hotplug_memory(struct nvdimm_pmu *nd_pmu)
+{
+	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
+
+	if (nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR])
+		kfree(nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR]->attrs);
+	kfree(nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR]);
+}
+
+int register_nvdimm_pmu(struct nvdimm_pmu *nd_pmu, struct platform_device *pdev)
+{
+	int rc;
+
+	if (!nd_pmu || !pdev)
+		return -EINVAL;
+
+	/* event functions like add/del/read/event_init should not be NULL */
+	if (WARN_ON_ONCE(!(nd_pmu->event_init && nd_pmu->add && nd_pmu->del && nd_pmu->read)))
+		return -EINVAL;
+
+	nd_pmu->pmu.task_ctx_nr = perf_invalid_context;
+	nd_pmu->pmu.name = nd_pmu->name;
+	nd_pmu->pmu.event_init = nd_pmu->event_init;
+	nd_pmu->pmu.add = nd_pmu->add;
+	nd_pmu->pmu.del = nd_pmu->del;
+	nd_pmu->pmu.read = nd_pmu->read;
+
+	nd_pmu->pmu.attr_groups = nd_pmu->attr_groups;
+	nd_pmu->pmu.capabilities = PERF_PMU_CAP_NO_INTERRUPT |
+				PERF_PMU_CAP_NO_EXCLUDE;
+
+	/*
+	 * Add platform_device->dev pointer to nvdimm_pmu to access
+	 * device data in events functions.
+	 */
+	nd_pmu->dev = &pdev->dev;
+
+	/*
+	 * Incase cpumask attribute is set it means cpu
+	 * hotplug is handled by the arch specific code and
+	 * we can skip calling hotplug_init.
+	 */
+	if (!nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR]) {
+		/* init cpuhotplug */
+		rc = nvdimm_pmu_cpu_hotplug_init(nd_pmu);
+		if (rc) {
+			pr_info("cpu hotplug feature failed for device: %s\n", nd_pmu->name);
+			return rc;
+		}
+	}
+
+	rc = perf_pmu_register(&nd_pmu->pmu, nd_pmu->name, -1);
+	if (rc) {
+		nvdimm_pmu_free_hotplug_memory(nd_pmu);
+		return rc;
+	}
+
+	pr_info("%s NVDIMM performance monitor support registered\n",
+		nd_pmu->name);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(register_nvdimm_pmu);
+
+void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu)
+{
+	/* handle freeing of memory nd_pmu in arch specific code */
+	perf_pmu_unregister(&nd_pmu->pmu);
+	nvdimm_pmu_free_hotplug_memory(nd_pmu);
+}
+EXPORT_SYMBOL_GPL(unregister_nvdimm_pmu);
diff --git a/include/linux/nd.h b/include/linux/nd.h
index 712499cf7335..7d8b4f7d277d 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -66,6 +66,9 @@ struct nvdimm_pmu {
 	struct cpumask arch_cpumask;
 };
 
+int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
+void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
+
 struct nd_device_driver {
 	struct device_driver drv;
 	unsigned long type;
-- 
2.26.2

