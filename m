Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A239F5E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzpgr5G5tz3brt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:59:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WwhEjYsS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WwhEjYsS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzpfs00mXz3bsM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:58:44 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158BZVJW181560; Tue, 8 Jun 2021 07:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HaYI5OfsV5Q/Fg9rsDjKng0XGbyi3eOBs7xhnvhhy3Q=;
 b=WwhEjYsSSzXy4Klw+ZrBSxaIvcHO+EeyR1kjq5hXZi6n2dBl7n3/HATO6IFxvPDUQGOH
 l1MzLgbEC5JGXX2JIf0sn7kyLn2ChWVlq2XIH4+W6uOA4r5HQCpN4idau7CQrnJGOYi1
 fShGKCCAYHytINEXgbfDJs2vxLHVN3izo+hmxHHkTs3l/vO8TUMEnNGqSD36kB87dDWQ
 y5ap8EDtZC8jmf3cSw7RMUVV95cKuLZ/FCcm44bG8Czm0mHhpnvQEXVKdEkJkKC/kduS
 vlz2CVdjNHeBgl1vvbujuy+MbbXT3EKm4kSgo9QBGicsk1EdXUQzXd1qLB+QIN11BlOi 1Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3926qe2cpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:58:30 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 158Bw3Ub005015;
 Tue, 8 Jun 2021 11:58:29 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3900w8ru1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 11:58:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 158BwQFC32113090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 11:58:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E5E74C04A;
 Tue,  8 Jun 2021 11:58:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A5364C040;
 Tue,  8 Jun 2021 11:58:16 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 11:58:14 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org
Subject: [PATCH 2/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Date: Tue,  8 Jun 2021 17:26:58 +0530
Message-Id: <20210608115700.85933-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608115700.85933-1-kjain@linux.ibm.com>
References: <20210608115700.85933-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ewz3JSoPz2D_bs1fwmJ7neIjRBcBcX0
X-Proofpoint-ORIG-GUID: 9ewz3JSoPz2D_bs1fwmJ7neIjRBcBcX0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_09:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080077
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A common interface is added to get performance stats reporting
support for nvdimm devices. Added interface includes support for
pmu register/unregister functions, cpu hotplug and pmu event
functions like event_init/add/read/del.
User could use the standard perf tool to access perf
events exposed via pmu.

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
index 000000000000..5cc1f1c65972
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
+	nd_pmu->cpu = target;
+
+	/*
+	 * Incase we don't have any active cpu in nd_pmu->arch_cpumask,
+	 * check in given cpu's numa node list.
+	 */
+	if (target >= nr_cpu_ids) {
+		nodeid = cpu_to_node(cpu);
+		cpumask = cpumask_of_node(nodeid);
+		target = cpumask_any_but(cpumask, cpu);
+		nd_pmu->cpu = target;
+
+		if (target >= nr_cpu_ids)
+			return -1;
+	}
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
2.27.0

