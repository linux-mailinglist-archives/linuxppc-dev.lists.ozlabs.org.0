Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC991394AFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 09:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsYQg0QsCz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 17:41:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TKcOfeDR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TKcOfeDR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsYN81zqqz2yYC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 17:39:19 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14T7YUa4139564; Sat, 29 May 2021 03:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=phlelUiwwf9FkIzWHxlnmcO4lmaOP2QCxLeEmnMYuvw=;
 b=TKcOfeDR+56XaXkAg4xiq03PxUA0obWg8/Uu/Q9kUAPJSWWd8T5UzbHOeEo+q+DE3DYh
 lIPKVutFB5IsnY+FC1+I6yLYKVEMVIR47H5FqGmugLSsNPKlBBe7x0onJLzSKqNI1nab
 ap5KcsFYRCjbmg8MExg0tl/bCxsnWtC1xQQHNWJ4L/V8JGqrqXsDEzyVsbK+KISMsslp
 pD86a15EKSsEPq9b0NpwSfl0eQrhngQAkPtrlhsfdTzpafFJhfs4fCnCyXNe5SFOEwmm
 9nMwUIVuwSj8UtFk3zbrxCHggf/PH7OaQ8iOlaPEIK1WrqzGLYQ1vxfi7tlFPCj8WwSY zg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38uehqkune-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 May 2021 03:38:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14T7crLb021113;
 Sat, 29 May 2021 07:38:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 38ucvh82bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 May 2021 07:38:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14T7coZD29098298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 May 2021 07:38:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F4B84C046;
 Sat, 29 May 2021 07:38:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB914C040;
 Sat, 29 May 2021 07:38:46 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.45.117])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 29 May 2021 07:38:46 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org
Subject: [RFC v3 2/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Date: Sat, 29 May 2021 13:08:26 +0530
Message-Id: <20210529073828.1542292-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210529073828.1542292-1-kjain@linux.ibm.com>
References: <20210529073828.1542292-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1KQiAoDqRPDWZorUUSCss0dV6H5vQXX5
X-Proofpoint-ORIG-GUID: 1KQiAoDqRPDWZorUUSCss0dV6H5vQXX5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-29_03:2021-05-27,
 2021-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105290058
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
pmu register/unregister functions which can be used to set
arch/platform specific data such as supported events and pmu
event functions like event_init/add/read/del.
User could use the standard perf tool to access perf
events exposed via pmu.

Interface also adds cpu hotplug functions to nvdimm pmu incase
its not added by arch/platform specific code. It will adds
cpumask to the nvdimm pmu to designate a cpu to collect the
counter data.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 drivers/nvdimm/Makefile  |   1 +
 drivers/nvdimm/nd_perf.c | 195 +++++++++++++++++++++++++++++++++++++++
 include/linux/nd.h       |   3 +
 3 files changed, 199 insertions(+)
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
index 000000000000..a7679699118a
--- /dev/null
+++ b/drivers/nvdimm/nd_perf.c
@@ -0,0 +1,195 @@
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
+			    struct device_attribute *attr, char *buf)
+{
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct nvdimm_pmu *nd_pmu;
+
+	nd_pmu = container_of(pmu, struct nvdimm_pmu, pmu);
+
+	return cpumap_print_to_pagebuf(true, buf, cpumask_of(nd_pmu->cpu));
+}
+
+static int nvdimm_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct nvdimm_pmu *nd_pmu;
+	int target, nodeid;
+	const struct cpumask *cpumask;
+
+	nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
+
+	if (!nd_pmu->dev)
+		return -1;
+
+	if (cpu != nd_pmu->cpu)
+		return 0;
+
+	/*
+	 * here function dev_to_node will return node id for given nvdimm device
+	 * which need to be assigned to variable nodeid but incase that node is
+	 * offline, numa_map_to_online_node function will lookup for next
+	 * closest online node and assigned that value to nodeid.
+	 */
+	nodeid = numa_map_to_online_node(dev_to_node(nd_pmu->dev));
+
+	cpumask = cpumask_of_node(nodeid);
+	target = cpumask_any_but(cpumask, cpu);
+	nd_pmu->cpu = target;
+
+	if (target < 0 || target >= nr_cpu_ids)
+		return -1;
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
+	int nodeid,  rc;
+	const struct cpumask *cpumask;
+
+	nodeid = numa_map_to_online_node(dev_to_node(nd_pmu->dev));
+	cpumask = cpumask_of_node(nodeid);
+	nd_pmu->cpu = cpumask_any(cpumask);
+
+	rc = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/nvdimm:online",
+				     NULL, nvdimm_pmu_offline_cpu);
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
+
+	/* handle freeing of memory nd_pmu in arch specific code */
+	perf_pmu_unregister(&nd_pmu->pmu);
+	nvdimm_pmu_free_hotplug_memory(nd_pmu);
+}
+EXPORT_SYMBOL_GPL(unregister_nvdimm_pmu);
diff --git a/include/linux/nd.h b/include/linux/nd.h
index 3baeeb7c3c41..f71744daa234 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -62,6 +62,9 @@ struct nvdimm_pmu {
 	enum cpuhp_state cpuhp_state;
 };
 
+int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
+void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
+
 struct nd_device_driver {
 	struct device_driver drv;
 	unsigned long type;
-- 
2.27.0

