Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48468390240
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFFJ1wKMz3070
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q4LInF3B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q4LInF3B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFCL6txqz3bnV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:23:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PD3pwa103863; Tue, 25 May 2021 09:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NPF7aTXPE9bcG5lWI1oZ+w6TfPK6ulLeAZpLoD+tcHk=;
 b=Q4LInF3BTf8YUvPd+tcxSHiggSb3NSd15ZhGmXhO1Ser/ZhQxYDO9JD1/5PSmctIHYUg
 HhuyqzUb5KGHHTrN0R1aTwWx/gwKA4hvHQaXYDDXfzKg9JNEiB0pF6PGd/Z21GqzrfAa
 /v//4nJVPMIcyzYhWq0praxoLtLKLFP3J9V6YF6IvcW/6W724lXCTZ/UsA/JzTfVUM0/
 it2G+cPfy+blSLY6VDvPp4Qo9dOm+qX+jcFkxHSopuz7vGKbYBeTWxxcNgv10j322GI8
 M687PHEQsxulR9fdJbD9V9huPEhFYKr8rm35k3pCcwygzTzxiZg5TGEHKu+3ROvtCd+f jg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s1adsubu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:23:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDEoQB026323;
 Tue, 25 May 2021 13:23:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 38s1ukg09a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:23:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PDNPYd31457720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:23:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 097CAAE045;
 Tue, 25 May 2021 13:23:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24190AE04D;
 Tue, 25 May 2021 13:23:21 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.34.186])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:23:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [RFC v2 4/4] powerpc/papr_scm: Add cpu hotplug support for nvdimm pmu
 device
Date: Tue, 25 May 2021 18:52:16 +0530
Message-Id: <20210525132216.1239259-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525132216.1239259-1-kjain@linux.ibm.com>
References: <20210525132216.1239259-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bj8Ty1h5GxdZAWDxFUbRNuFnWdmaRvLO
X-Proofpoint-GUID: bj8Ty1h5GxdZAWDxFUbRNuFnWdmaRvLO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250081
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

Patch here adds cpu hotplug functions to nvdimm pmu.
It adds cpumask to designate a cpu to make HCALL to
collect the counter data for the nvdimm device and
update ABI documentation accordingly.

Result in power9 lpar system:
command:# cat /sys/devices/nmem0/cpumask
0

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-bus-papr-pmem |  6 ++
 arch/powerpc/platforms/pseries/papr_scm.c     | 61 +++++++++++++++++++
 include/linux/nd.h                            | 17 ++++--
 3 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 38c4daf65af2..986df1691914 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -76,6 +76,12 @@ Description:	(RO) Attribute group to describe the magic bits
 		For example::
 		    noopstat = "event=0x1"
 
+What:		/sys/devices/nmemX/cpumask
+Date:		May 2021
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
+Description:	(RO) This sysfs file exposes the cpumask which is designated to make
+                HCALLs to retrieve nvdimm pmu event counter data.
+
 What:		/sys/devices/nmemX/events
 Date:		May 2021
 Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f2d57da98ff4..76121d876b7f 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -339,6 +339,28 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+static ssize_t cpumask_show(struct device *dev,
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
+static DEVICE_ATTR_RO(cpumask);
+
+static struct attribute *nvdimm_cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL,
+};
+
+static const struct attribute_group nvdimm_pmu_cpumask_group = {
+	.attrs = nvdimm_cpumask_attrs,
+};
+
 PMU_FORMAT_ATTR(event, "config:0-4");
 
 static struct attribute *nvdimm_pmu_format_attr[] = {
@@ -459,6 +481,24 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
 	papr_scm_pmu_read(event);
 }
 
+static int nvdimm_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct nvdimm_pmu *nd_pmu;
+	int target;
+
+	nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
+
+	if (cpu != nd_pmu->cpu)
+		return 0;
+
+	target = cpumask_last(cpu_active_mask);
+	if (target < 0 || target >= nr_cpu_ids)
+		return -1;
+
+	nd_pmu->cpu = target;
+	return 0;
+}
+
 static ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 				  char *buf)
 {
@@ -603,6 +643,7 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 	/* Fill attribute groups for the nvdimm pmu device */
 	nd_pmu->attr_groups[NVDIMM_PMU_FORMAT_ATTR] = &nvdimm_pmu_format_group;
 	nd_pmu->attr_groups[NVDIMM_PMU_EVENT_ATTR] = nvdimm_pmu_events_group;
+	nd_pmu->attr_groups[NVDIMM_PMU_CPUMASK_ATTR] = &nvdimm_pmu_cpumask_group;
 	nd_pmu->attr_groups[NVDIMM_PMU_NULL_ATTR] = NULL;
 
 	kfree(single_stats);
@@ -652,6 +693,20 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	nd_pmu->read = papr_scm_pmu_read;
 	nd_pmu->add = papr_scm_pmu_add;
 	nd_pmu->del = papr_scm_pmu_del;
+	nd_pmu->cpu = raw_smp_processor_id();
+
+	rc = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+				     "perf/nvdimm:online",
+			      NULL, nvdimm_pmu_offline_cpu);
+	if (rc < 0)
+		goto pmu_cpuhp_setup_err;
+
+	nd_pmu->cpuhp_state = rc;
+
+	/* Register the pmu instance for cpu hotplug */
+	rc = cpuhp_state_add_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	if (rc)
+		goto cpuhp_instance_err;
 
 	rc = register_nvdimm_pmu(nd_pmu, p->pdev);
 	if (rc)
@@ -665,6 +720,10 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	return;
 
 pmu_register_err:
+	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+cpuhp_instance_err:
+	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
+pmu_cpuhp_setup_err:
 	nvdimm_pmu_mem_free(nd_pmu);
 	kfree(p->nvdimm_events_map);
 pmu_check_events_err:
@@ -675,6 +734,8 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 
 static void nvdimm_pmu_uinit(struct nvdimm_pmu *nd_pmu)
 {
+	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
 	unregister_nvdimm_pmu(&nd_pmu->pmu);
 	nvdimm_pmu_mem_free(nd_pmu);
 	kfree(nd_pmu);
diff --git a/include/linux/nd.h b/include/linux/nd.h
index a0e0619256be..177795413ab3 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -28,7 +28,8 @@ enum nvdimm_claim_class {
 /* Event attribute array index */
 #define NVDIMM_PMU_FORMAT_ATTR		0
 #define NVDIMM_PMU_EVENT_ATTR		1
-#define NVDIMM_PMU_NULL_ATTR		2
+#define NVDIMM_PMU_CPUMASK_ATTR		2
+#define NVDIMM_PMU_NULL_ATTR		3
 
 /**
  * struct nvdimm_pmu - data structure for nvdimm perf driver
@@ -37,7 +38,10 @@ enum nvdimm_claim_class {
  * @pmu: pmu data structure for nvdimm performance stats.
  * @dev: nvdimm device pointer.
  * @functions(event_init/add/del/read): platform specific pmu functions.
- * @attr_groups: data structure for events and formats.
+ * @attr_groups: data structure for events, formats and cpumask
+ * @cpu: designated cpu for counter access.
+ * @node: node for cpu hotplug notifier link.
+ * @cpuhp_state: state for cpu hotplug notification.
  */
 struct nvdimm_pmu {
 	const char *name;
@@ -49,10 +53,13 @@ struct nvdimm_pmu {
 	void (*read)(struct perf_event *event);
 	/*
 	 * Attribute groups for the nvdimm pmu. Index 0 used for
-	 * format attribute, index 1 used for event attribute and
-	 * index 2 kept as NULL.
+	 * format attribute, index 1 used for event attribute,
+	 * index 2 used for cpusmask attribute and index 3 kept as NULL.
 	 */
-	const struct attribute_group *attr_groups[3];
+	const struct attribute_group *attr_groups[4];
+	int cpu;
+	struct hlist_node node;
+	enum cpuhp_state cpuhp_state;
 };
 
 int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
-- 
2.27.0

