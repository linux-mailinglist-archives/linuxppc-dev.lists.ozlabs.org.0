Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E828F4BA619
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 17:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K00pQ3H70z3ddx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6PIsbFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F6PIsbFO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K00mP6cXCz3cVf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 03:35:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HG8G1G026151; 
 Thu, 17 Feb 2022 16:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=G6nfU3XsB3C+lD5WQ+P9iSbf13meDpwU8P6HuEBI1U8=;
 b=F6PIsbFOo6uaxUmfmO2sGmooWJ19Bbr1JMVShXODRuXsNO0UiHdqv8Xsef987BmAPANa
 mxRuKrKg4yV80O2xl2euuigt6yFIyZ/mzqlYm5maiSTz1RfR0KCJak9J+C7f68AWb1Nq
 WvlEbuG4kQhbEZg1axSq2pfbpZSOlENmnb8SNAles35V3cGnIQZzKNTXSqAqP18SpPPB
 xaLxhHZRBRM6qsmEycpgZK5oXtqJ4EX9jNK8aTiLXLu4yRYPfbG37IVfE4L8A9rVD+Hj
 t1peL/78mlhfqCS2InCMLXnTvsoIIkDv958xiWZKtEmhL74d40i+yc2j0gZE4M2PScH2 xg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9pp9nbxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 16:34:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HGHuJa007261;
 Thu, 17 Feb 2022 16:34:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3e64ha22rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 16:34:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HGYXIe41746838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 16:34:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D3EB52054;
 Thu, 17 Feb 2022 16:34:33 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.54.12])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5791552051;
 Thu, 17 Feb 2022 16:34:28 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [PATCH v6 2/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Date: Thu, 17 Feb 2022 22:03:55 +0530
Message-Id: <20220217163357.276036-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217163357.276036-1-kjain@linux.ibm.com>
References: <20220217163357.276036-1-kjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pjs1x7Zp07cJf2WtVzPJR1dEnhwARc_V
X-Proofpoint-ORIG-GUID: Pjs1x7Zp07cJf2WtVzPJR1dEnhwARc_V
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_06,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170075
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, kernel test robot <lkp@intel.com>,
 rnsastry@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, vaibhav@linux.ibm.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A common interface is added to get performance stats reporting
support for nvdimm devices. Added interface defines supported
event list, config fields for the event attributes and their
corresponding bit values which are exported via sysfs.

Interface also added support for pmu register/unregister functions,
cpu hotplug feature along with macros for handling events addition
via sysfs. It adds attribute groups for format, cpumask and events
to the pmu structure.

User could use the standard perf tool to access perf events exposed
via nvdimm pmu.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
[Make hotplug function static as reported by kernel test rorbot]
Reported-by: kernel test robot <lkp@intel.com>
---
Changelog:
Resend v5 -> v6
- No logic change, just a rebase to latest upstream and
  tested the patch.

- Link to the patchset Resend v5: https://lkml.org/lkml/2021/11/15/3979

 drivers/nvdimm/Makefile  |   1 +
 drivers/nvdimm/nd_perf.c | 328 +++++++++++++++++++++++++++++++++++++++
 include/linux/nd.h       |  21 +++
 3 files changed, 350 insertions(+)
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
index 000000000000..314415894acf
--- /dev/null
+++ b/drivers/nvdimm/nd_perf.c
@@ -0,0 +1,328 @@
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
+#define EVENT(_name, _code)     enum{_name = _code}
+
+/*
+ * NVDIMM Events codes.
+ */
+
+/* Controller Reset Count */
+EVENT(CTL_RES_CNT,		0x1);
+/* Controller Reset Elapsed Time */
+EVENT(CTL_RES_TM,		0x2);
+/* Power-on Seconds */
+EVENT(POWERON_SECS,		0x3);
+/* Life Remaining */
+EVENT(MEM_LIFE,		0x4);
+/* Critical Resource Utilization */
+EVENT(CRI_RES_UTIL,		0x5);
+/* Host Load Count */
+EVENT(HOST_L_CNT,		0x6);
+/* Host Store Count */
+EVENT(HOST_S_CNT,		0x7);
+/* Host Store Duration */
+EVENT(HOST_S_DUR,		0x8);
+/* Host Load Duration */
+EVENT(HOST_L_DUR,		0x9);
+/* Media Read Count */
+EVENT(MED_R_CNT,		0xa);
+/* Media Write Count */
+EVENT(MED_W_CNT,		0xb);
+/* Media Read Duration */
+EVENT(MED_R_DUR,		0xc);
+/* Media Write Duration */
+EVENT(MED_W_DUR,		0xd);
+/* Cache Read Hit Count */
+EVENT(CACHE_RH_CNT,		0xe);
+/* Cache Write Hit Count */
+EVENT(CACHE_WH_CNT,		0xf);
+/* Fast Write Count */
+EVENT(FAST_W_CNT,		0x10);
+
+NVDIMM_EVENT_ATTR(ctl_res_cnt,		CTL_RES_CNT);
+NVDIMM_EVENT_ATTR(ctl_res_tm,		CTL_RES_TM);
+NVDIMM_EVENT_ATTR(poweron_secs,		POWERON_SECS);
+NVDIMM_EVENT_ATTR(mem_life,		MEM_LIFE);
+NVDIMM_EVENT_ATTR(cri_res_util,		CRI_RES_UTIL);
+NVDIMM_EVENT_ATTR(host_l_cnt,		HOST_L_CNT);
+NVDIMM_EVENT_ATTR(host_s_cnt,		HOST_S_CNT);
+NVDIMM_EVENT_ATTR(host_s_dur,		HOST_S_DUR);
+NVDIMM_EVENT_ATTR(host_l_dur,		HOST_L_DUR);
+NVDIMM_EVENT_ATTR(med_r_cnt,		MED_R_CNT);
+NVDIMM_EVENT_ATTR(med_w_cnt,		MED_W_CNT);
+NVDIMM_EVENT_ATTR(med_r_dur,		MED_R_DUR);
+NVDIMM_EVENT_ATTR(med_w_dur,		MED_W_DUR);
+NVDIMM_EVENT_ATTR(cache_rh_cnt,		CACHE_RH_CNT);
+NVDIMM_EVENT_ATTR(cache_wh_cnt,		CACHE_WH_CNT);
+NVDIMM_EVENT_ATTR(fast_w_cnt,		FAST_W_CNT);
+
+static struct attribute *nvdimm_events_attr[] = {
+	NVDIMM_EVENT_PTR(CTL_RES_CNT),
+	NVDIMM_EVENT_PTR(CTL_RES_TM),
+	NVDIMM_EVENT_PTR(POWERON_SECS),
+	NVDIMM_EVENT_PTR(MEM_LIFE),
+	NVDIMM_EVENT_PTR(CRI_RES_UTIL),
+	NVDIMM_EVENT_PTR(HOST_L_CNT),
+	NVDIMM_EVENT_PTR(HOST_S_CNT),
+	NVDIMM_EVENT_PTR(HOST_S_DUR),
+	NVDIMM_EVENT_PTR(HOST_L_DUR),
+	NVDIMM_EVENT_PTR(MED_R_CNT),
+	NVDIMM_EVENT_PTR(MED_W_CNT),
+	NVDIMM_EVENT_PTR(MED_R_DUR),
+	NVDIMM_EVENT_PTR(MED_W_DUR),
+	NVDIMM_EVENT_PTR(CACHE_RH_CNT),
+	NVDIMM_EVENT_PTR(CACHE_WH_CNT),
+	NVDIMM_EVENT_PTR(FAST_W_CNT),
+	NULL
+};
+
+static struct attribute_group nvdimm_pmu_events_group = {
+	.name = "events",
+	.attrs = nvdimm_events_attr,
+};
+
+PMU_FORMAT_ATTR(event, "config:0-4");
+
+static struct attribute *nvdimm_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group nvdimm_pmu_format_group = {
+	.name = "format",
+	.attrs = nvdimm_pmu_format_attr,
+};
+
+ssize_t nvdimm_events_sysfs_show(struct device *dev,
+				 struct device_attribute *attr, char *page)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sprintf(page, "event=0x%02llx\n", pmu_attr->id);
+}
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
+	struct perf_pmu_events_attr *pmu_events_attr;
+	struct attribute **attrs_group;
+	struct attribute_group *nvdimm_pmu_cpumask_group;
+
+	pmu_events_attr = kzalloc(sizeof(*pmu_events_attr), GFP_KERNEL);
+	if (!pmu_events_attr)
+		return -ENOMEM;
+
+	attrs_group = kzalloc(2 * sizeof(struct attribute *), GFP_KERNEL);
+	if (!attrs_group) {
+		kfree(pmu_events_attr);
+		return -ENOMEM;
+	}
+
+	/* Allocate memory for cpumask attribute group */
+	nvdimm_pmu_cpumask_group = kzalloc(sizeof(*nvdimm_pmu_cpumask_group), GFP_KERNEL);
+	if (!nvdimm_pmu_cpumask_group) {
+		kfree(pmu_events_attr);
+		kfree(attrs_group);
+		return -ENOMEM;
+	}
+
+	sysfs_attr_init(&pmu_events_attr->attr.attr);
+	pmu_events_attr->attr.attr.name = "cpumask";
+	pmu_events_attr->attr.attr.mode = 0444;
+	pmu_events_attr->attr.show = nvdimm_pmu_cpumask_show;
+	attrs_group[0] = &pmu_events_attr->attr.attr;
+	attrs_group[1] = NULL;
+
+	nvdimm_pmu_cpumask_group->attrs = attrs_group;
+	nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR] = nvdimm_pmu_cpumask_group;
+	return 0;
+}
+
+static int nvdimm_pmu_cpu_hotplug_init(struct nvdimm_pmu *nd_pmu)
+{
+	int nodeid, rc;
+	const struct cpumask *cpumask;
+
+	/*
+	 * Incase of cpu hotplug feature, arch specific code
+	 * can provide required cpumask which can be used
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
+static void nvdimm_pmu_free_hotplug_memory(struct nvdimm_pmu *nd_pmu)
+{
+	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
+
+	if (nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR])
+		kfree(nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR]->attrs);
+	kfree(nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR]);
+}
+
+int register_nvdimm_pmu(struct nvdimm_pmu *nd_pmu, struct platform_device *pdev)
+{
+	int rc;
+
+	if (!nd_pmu || !pdev)
+		return -EINVAL;
+
+	/* event functions like add/del/read/event_init and pmu name should not be NULL */
+	if (WARN_ON_ONCE(!(nd_pmu->pmu.event_init && nd_pmu->pmu.add &&
+			   nd_pmu->pmu.del && nd_pmu->pmu.read && nd_pmu->pmu.name)))
+		return -EINVAL;
+
+	nd_pmu->pmu.attr_groups = kzalloc((NVDIMM_PMU_NULL_ATTR + 1) *
+					  sizeof(struct attribute_group *), GFP_KERNEL);
+	if (!nd_pmu->pmu.attr_groups)
+		return -ENOMEM;
+
+	/*
+	 * Add platform_device->dev pointer to nvdimm_pmu to access
+	 * device data in events functions.
+	 */
+	nd_pmu->dev = &pdev->dev;
+
+	/* Fill attribute groups for the nvdimm pmu device */
+	nd_pmu->pmu.attr_groups[NVDIMM_PMU_FORMAT_ATTR] = &nvdimm_pmu_format_group;
+	nd_pmu->pmu.attr_groups[NVDIMM_PMU_EVENT_ATTR] = &nvdimm_pmu_events_group;
+	nd_pmu->pmu.attr_groups[NVDIMM_PMU_NULL_ATTR] = NULL;
+
+	/* Fill attribute group for cpumask */
+	rc = nvdimm_pmu_cpu_hotplug_init(nd_pmu);
+	if (rc) {
+		pr_info("cpu hotplug feature failed for device: %s\n", nd_pmu->pmu.name);
+		kfree(nd_pmu->pmu.attr_groups);
+		return rc;
+	}
+
+	rc = perf_pmu_register(&nd_pmu->pmu, nd_pmu->pmu.name, -1);
+	if (rc) {
+		kfree(nd_pmu->pmu.attr_groups);
+		nvdimm_pmu_free_hotplug_memory(nd_pmu);
+		return rc;
+	}
+
+	pr_info("%s NVDIMM performance monitor support registered\n",
+		nd_pmu->pmu.name);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(register_nvdimm_pmu);
+
+void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu)
+{
+	perf_pmu_unregister(&nd_pmu->pmu);
+	nvdimm_pmu_free_hotplug_memory(nd_pmu);
+	kfree(nd_pmu);
+}
+EXPORT_SYMBOL_GPL(unregister_nvdimm_pmu);
diff --git a/include/linux/nd.h b/include/linux/nd.h
index ad186e828263..f28bda6c5512 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/badblocks.h>
 #include <linux/perf_event.h>
+#include <linux/platform_device.h>
 
 enum nvdimm_event {
 	NVDIMM_REVALIDATE_POISON,
@@ -24,6 +25,19 @@ enum nvdimm_claim_class {
 	NVDIMM_CCLASS_UNKNOWN,
 };
 
+#define NVDIMM_EVENT_VAR(_id)  event_attr_##_id
+#define NVDIMM_EVENT_PTR(_id)  (&event_attr_##_id.attr.attr)
+
+#define NVDIMM_EVENT_ATTR(_name, _id)				\
+	PMU_EVENT_ATTR(_name, NVDIMM_EVENT_VAR(_id), _id,	\
+			nvdimm_events_sysfs_show)
+
+/* Event attribute array index */
+#define NVDIMM_PMU_FORMAT_ATTR	0
+#define NVDIMM_PMU_EVENT_ATTR	1
+#define NVDIMM_PMU_CPUMASK_ATTR	2
+#define NVDIMM_PMU_NULL_ATTR	3
+
 /**
  * struct nvdimm_pmu - data structure for nvdimm perf driver
  * @pmu: pmu data structure for nvdimm performance stats.
@@ -43,6 +57,13 @@ struct nvdimm_pmu {
 	struct cpumask arch_cpumask;
 };
 
+extern ssize_t nvdimm_events_sysfs_show(struct device *dev,
+					struct device_attribute *attr,
+					char *page);
+
+int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
+void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
+
 struct nd_device_driver {
 	struct device_driver drv;
 	unsigned long type;
-- 
2.31.1

