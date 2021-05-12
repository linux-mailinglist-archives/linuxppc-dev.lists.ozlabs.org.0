Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF9937C825
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:41:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgLC43Pp0z3c5n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:41:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5H3zfln;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C5H3zfln; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgL936B2Mz2yY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:39:19 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CGXq0O079715; Wed, 12 May 2021 12:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6swk1Nr0VebVD/2ZTyvSSaDuvoXqBeaExzWD9AJEF90=;
 b=C5H3zflnWECY1kg11PN+xOrJ74nmgTrr3qZdeqhqrr3wNzZRXq34DtTut3TnvjUwsJNW
 mze2k25gygTWYGv7MbqypkDB0eQc5efswFLuZAO6HdWRt9iIi/4DLxm03JGg3XoUGXSX
 kOAMTZaH8JHcwDHUXrPqXHJZ6f/b76PNq+QFtBbFL1aNjmC0F9H8YSG14nk4PzL3qRcp
 5GBZVU1IzLKc/CR3c65I9X1EpquIc2TLsSsvesZlVcvsbBWqur0B97gWINochnXNmSsY
 hBr9FItMG4Fe994JOrfCjehGlDcTk6kIq+Qi18X6Urzo3AkWvHeJGTKUxYWMauhRP1s3 1A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ghx3hg05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 12:39:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14CGW6CA003516;
 Wed, 12 May 2021 16:39:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38dj98aafc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 16:39:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14CGd0Ab21561692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 16:39:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7370AE0F6;
 Wed, 12 May 2021 16:39:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EEB2AE0FA;
 Wed, 12 May 2021 16:38:57 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.40.5])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 May 2021 16:38:57 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org
Subject: [RFC 4/4] powerpc/papr_scm: Add cpu hotplug support for nvdimm pmu
 device
Date: Wed, 12 May 2021 22:08:24 +0530
Message-Id: <20210512163824.255370-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512163824.255370-1-kjain@linux.ibm.com>
References: <20210512163824.255370-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BeEwXxnp-lNqm9ce08SWCrAjV06uiZ4S
X-Proofpoint-ORIG-GUID: BeEwXxnp-lNqm9ce08SWCrAjV06uiZ4S
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_09:2021-05-12,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105120105
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, peterz@infradead.org,
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
 arch/powerpc/platforms/pseries/papr_scm.c     | 62 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 216f70deca7e..a40fbec683a8 100644
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
index 997d379094d0..6d94c2f260aa 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -334,6 +334,28 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
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
 static struct attribute_group nvdimm_pmu_events_group = {
 	.name = "events",
 	/* .attrs is set in papr_scm_pmu_check_events function */
@@ -354,6 +376,7 @@ static struct attribute_group nvdimm_pmu_format_group = {
 static const struct attribute_group *nvdimm_pmu_attr_groups[] = {
 	&nvdimm_pmu_format_group,
 	&nvdimm_pmu_events_group,
+	&nvdimm_pmu_cpumask_group,
 	NULL,
 };
 
@@ -418,10 +441,30 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags,  struct device
 	papr_scm_pmu_read(event, dev);
 }
 
+static int nvdimm_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct nvdimm_pmu *pmu;
+	int target;
+
+	pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
+
+	if (cpu != pmu->cpu)
+		return 0;
+
+	target = cpumask_last(cpu_active_mask);
+	if (target < 0 || target >= nr_cpu_ids)
+		return -1;
+
+	pmu->cpu = target;
+	return 0;
+}
+
 static void nvdimm_pmu_uinit(struct nvdimm_pmu *nd_pmu)
 {
 	unregister_nvdimm_pmu(&nd_pmu->pmu);
 	kfree(nd_pmu);
+	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
+	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
 }
 
 static int papr_scm_pmu_register(struct papr_scm_priv *p)
@@ -438,6 +481,22 @@ static int papr_scm_pmu_register(struct papr_scm_priv *p)
 	papr_scm_pmu->add = papr_scm_pmu_add;
 	papr_scm_pmu->del = papr_scm_pmu_del;
 	papr_scm_pmu->attr_groups = nvdimm_pmu_attr_groups;
+	papr_scm_pmu->cpu = raw_smp_processor_id();
+
+	rc = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+				     "perf/nvdimm:online",
+			      NULL, nvdimm_pmu_offline_cpu);
+	if (rc < 0) {
+		kfree(papr_scm_pmu);
+		return rc;
+	}
+
+	papr_scm_pmu->cpuhp_state = rc;
+
+	/* Register the pmu instance for cpu hotplug */
+	rc = cpuhp_state_add_instance_nocalls(papr_scm_pmu->cpuhp_state, &papr_scm_pmu->node);
+	if (rc)
+		goto cpuhp_instance_err;
 
 	rc = register_nvdimm_pmu(papr_scm_pmu, p->pdev);
 	if (rc)
@@ -451,6 +510,9 @@ static int papr_scm_pmu_register(struct papr_scm_priv *p)
 	return 0;
 
 pmu_register_err:
+	cpuhp_state_remove_instance_nocalls(papr_scm_pmu->cpuhp_state, &papr_scm_pmu->node);
+cpuhp_instance_err:
+	cpuhp_remove_multi_state(papr_scm_pmu->cpuhp_state);
 	kfree(papr_scm_pmu);
 	return rc;
 }
-- 
2.27.0

