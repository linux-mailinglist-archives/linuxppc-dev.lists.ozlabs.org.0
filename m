Return-Path: <linuxppc-dev+bounces-3409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6869D0FDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 12:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsQh84DHCz30RG;
	Mon, 18 Nov 2024 22:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731930104;
	cv=none; b=lmpipUSrlsJz4hFqJiA1CF/iMgm7XiQi6EhZxDRbnEfFfRSdA+nJWX+5XEJqzOnNBGd8Hy5OiUOHJ8w2vud/VsKCezaGKi60HYjjDIPuSLvo3KGy0nSLPfx5UIHQHSrvojOZHL/WCjJncWSQf5zF7q3UPD1H+DrJSruTMXlVxu8TxNPhcIwNwQE9gWIEVeY+Ly5sjL4bxef5w8wOEG06MJe5VoJ6Yr0+zUwlWQ6Oj1OaMcTVzrpkV8n9dQiPkeEC2hkDO7txHRqaaT6gLNIzxwM2ALxa4YUGxUlRYWQksYm+BNdq0F9A+P69a3XveVCNXiLFo15jOrbz6SGSflWXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731930104; c=relaxed/relaxed;
	bh=F3+JvQD0m/r/0rpciYdXVJtz6YwRfmTI2Oz4oZLhM/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O318i7oMvdC9p4is7JOo2H5jsfBvF/4R+ewUgk84to7sPviKdoIfHncx/XDZsbxewPYuV/54vpPjpqhgCnnKRbP4M6tFg0CJ6nu8CKP3YQGiH8ozZQG5+jMYR1iARS1d1wrE9hpexgtACLgDFImHBsqvY/XzC2xggNcs679mO8K0ISypLd6Rgab4IcL8PyKln1llci2nZjUM3szY/f3Pkcy6vrX+1oLvv1jH4l2pxtcNNRBPJe63Pk+/sPNpy6zSzt5N2gTQWKVUN9a5vu+fvOqM3ZAD3Q9IqzxMDmXsSmWNsIct+33dg+kxGTa2Y69d6BI+CxhUoTl9w9CiHDybFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fWGlqWYH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fWGlqWYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsQh06D6Pz2yfm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 22:41:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI0h0wE012238;
	Mon, 18 Nov 2024 11:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=F3+JvQD0m/r/0rpciYdXVJtz6YwRfmTI2Oz4oZLhM
	/c=; b=fWGlqWYHbgMImrjOGCcmx6NXkK9/B1BgoF+ZVQXC+B17oOgvhvRRZ5l7P
	NEt27vO6aBvaP0FMAwHhKBsS5GylUM5tZ8NDxHsatOpMUcSA5E8WcbbamS71XGu1
	ph56axzl3Z79V/JOf7kDuIYr1MXxaQlww2/1GUbKslKtr26SozoAs4g3uXEH6t6O
	21tezQd2I+FEwG3VVo57I7QlimZoi9Y6GC8aA31W7jCngHb8QdPLk5zL1qmOZN+3
	vv0zJfnY54JDCzEfn560EUg4/BRwo6EQLWu4xUHzq3HjuNNL1F3QQT4zDSV/iiYd
	0lpD5Uf8l0xtXw/DbYRb87fS7tWKQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk2vsktv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI3A885021892;
	Mon, 18 Nov 2024 11:41:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42y6qmth1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AIBfKjd33489502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Nov 2024 11:41:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BCB20043;
	Mon, 18 Nov 2024 11:41:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C19C020040;
	Mon, 18 Nov 2024 11:41:17 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.96.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Nov 2024 11:41:17 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] powerpc/perf: Add perf interface to expose vpa counters
Date: Mon, 18 Nov 2024 17:11:11 +0530
Message-ID: <20241118114114.208964-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _MySIRK3YXdxDNv3NUTLIS4cnS9S_Rrh
X-Proofpoint-GUID: _MySIRK3YXdxDNv3NUTLIS4cnS9S_Rrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180096
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

To support performance measurement for KVM on PowerVM(KoP)
feature, PowerVM hypervisor has added couple of new software
counters in Virtual Process Area(VPA) of the partition.

Commit e1f288d2f9c69 ("KVM: PPC: Book3S HV nestedv2: Add
support for reading VPA counters for pseries guests")
have updated the paca fields with corresponding changes.

Proposed perf interface is to expose these new software
counters for monitoring of context switch latencies and
runtime aggregate. Perf interface driver is called
"vpa_pmu" and it has dependency on KVM and perf, hence
added new config called "VPA_PMU" which depends on
"CONFIG_KVM_BOOK3S_64_HV" and "CONFIG_HV_PERF_CTRS".
Since, kvm and kvm_host are currently compiled as built-in
modules, this perf interface takes the same path and
registered as a module.

vpa_pmu perf interface needs access to some of the kvm
functions and structures like kvmhv_get_l2_counters_status(),
hence kvm_book3s_64.h and kvm_ppc.h are included.
Below are the events added to monitor KoP:

  vpa_pmu/l1_to_l2_lat/
  vpa_pmu/l2_to_l1_lat/
  vpa_pmu/l2_runtime_agg/

and vpa_pmu driver supports only per-cpu monitoring with this patch.
Example usage:

[command]# perf stat -e vpa_pmu/l1_to_l2_lat/ -a -I 1000
     1.001017682            727,200      vpa_pmu/l1_to_l2_lat/
     2.003540491          1,118,824      vpa_pmu/l1_to_l2_lat/
     3.005699458          1,919,726      vpa_pmu/l1_to_l2_lat/
     4.007827011          2,364,630      vpa_pmu/l1_to_l2_lat/

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog:

v1 -> v2
- Rebase the patch on top of kvm typo fix patch:
  https://github.com/linuxppc/linux/commit/590d2f9347f7974d7954400e5d937672fd844a8b
- Fix the config check reported by kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202411171117.Eq9JtACb-lkp@intel.com/

 arch/powerpc/include/asm/kvm_book3s_64.h |   3 +
 arch/powerpc/kvm/book3s_hv.c             |  19 +++
 arch/powerpc/perf/Makefile               |   2 +
 arch/powerpc/perf/vpa-pmu.c              | 197 +++++++++++++++++++++++
 arch/powerpc/platforms/pseries/Kconfig   |  14 ++
 5 files changed, 235 insertions(+)
 create mode 100644 arch/powerpc/perf/vpa-pmu.c

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 11065313d4c1..f620e3126d68 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -688,6 +688,9 @@ int kvmhv_counters_tracepoint_regfunc(void);
 void kvmhv_counters_tracepoint_unregfunc(void);
 int kvmhv_get_l2_counters_status(void);
 void kvmhv_set_l2_counters_status(int cpu, bool status);
+u64 kvmhv_get_l1_to_l2_cs_time(void);
+u64 kvmhv_get_l2_to_l1_cs_time(void);
+u64 kvmhv_get_l2_runtime_agg(void);
 
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d575f7c7ab38..e618533dfc4b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4153,6 +4153,7 @@ void kvmhv_set_l2_counters_status(int cpu, bool status)
 	else
 		lppaca_of(cpu).l2_counters_enable = 0;
 }
+EXPORT_SYMBOL(kvmhv_set_l2_counters_status);
 
 int kvmhv_counters_tracepoint_regfunc(void)
 {
@@ -4192,6 +4193,24 @@ static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
 	*l2_runtime_agg_ptr = l2_runtime_ns;
 }
 
+u64 kvmhv_get_l1_to_l2_cs_time(void)
+{
+	return tb_to_ns(be64_to_cpu(get_lppaca()->l1_to_l2_cs_tb));
+}
+EXPORT_SYMBOL(kvmhv_get_l1_to_l2_cs_time);
+
+u64 kvmhv_get_l2_to_l1_cs_time(void)
+{
+	return tb_to_ns(be64_to_cpu(get_lppaca()->l2_to_l1_cs_tb));
+}
+EXPORT_SYMBOL(kvmhv_get_l2_to_l1_cs_time);
+
+u64 kvmhv_get_l2_runtime_agg(void)
+{
+	return tb_to_ns(be64_to_cpu(get_lppaca()->l2_runtime_tb));
+}
+EXPORT_SYMBOL(kvmhv_get_l2_runtime_agg);
+
 #else
 int kvmhv_get_l2_counters_status(void)
 {
diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index 4f53d0b97539..ac2cf58d62db 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -16,6 +16,8 @@ obj-$(CONFIG_FSL_EMB_PERF_EVENT_E500) += e500-pmu.o e6500-pmu.o
 
 obj-$(CONFIG_HV_PERF_CTRS) += hv-24x7.o hv-gpci.o hv-common.o
 
+obj-$(CONFIG_VPA_PMU) += vpa-pmu.o
+
 obj-$(CONFIG_PPC_8xx) += 8xx-pmu.o
 
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
new file mode 100644
index 000000000000..2c785eee2f71
--- /dev/null
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Performance monitoring support for Virtual Processor Area(VPA) based counters
+ *
+ * Copyright (C) 2024 IBM Corporation
+ */
+#define pr_fmt(fmt) "vpa_pmu: " fmt
+
+#include <linux/module.h>
+#include <linux/perf_event.h>
+#include <asm/kvm_ppc.h>
+#include <asm/kvm_book3s_64.h>
+
+#define MODULE_VERS "1.0"
+#define MODULE_NAME "pseries_vpa_pmu"
+
+#define EVENT(_name, _code)     enum{_name = _code}
+
+#define VPA_PMU_EVENT_VAR(_id)  event_attr_##_id
+#define VPA_PMU_EVENT_PTR(_id)  (&event_attr_##_id.attr.attr)
+
+static ssize_t vpa_pmu_events_sysfs_show(struct device *dev,
+				 struct device_attribute *attr, char *page)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sprintf(page, "event=0x%02llx\n", pmu_attr->id);
+}
+
+#define VPA_PMU_EVENT_ATTR(_name, _id)				\
+	PMU_EVENT_ATTR(_name, VPA_PMU_EVENT_VAR(_id), _id,	\
+			vpa_pmu_events_sysfs_show)
+
+EVENT(L1_TO_L2_CS_LAT,	0x1);
+EVENT(L2_TO_L1_CS_LAT,	0x2);
+EVENT(L2_RUNTIME_AGG,	0x3);
+
+VPA_PMU_EVENT_ATTR(l1_to_l2_lat,  L1_TO_L2_CS_LAT);
+VPA_PMU_EVENT_ATTR(l2_to_l1_lat,  L2_TO_L1_CS_LAT);
+VPA_PMU_EVENT_ATTR(l2_runtime_agg, L2_RUNTIME_AGG);
+
+static struct attribute *vpa_pmu_events_attr[] = {
+	VPA_PMU_EVENT_PTR(L1_TO_L2_CS_LAT),
+	VPA_PMU_EVENT_PTR(L2_TO_L1_CS_LAT),
+	VPA_PMU_EVENT_PTR(L2_RUNTIME_AGG),
+	NULL
+};
+
+static const struct attribute_group vpa_pmu_events_group = {
+	.name = "events",
+	.attrs = vpa_pmu_events_attr,
+};
+
+PMU_FORMAT_ATTR(event, "config:0-31");
+static struct attribute *vpa_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group vpa_pmu_format_group = {
+	.name = "format",
+	.attrs = vpa_pmu_format_attr,
+};
+
+static const struct attribute_group *vpa_pmu_attr_groups[] = {
+	&vpa_pmu_events_group,
+	&vpa_pmu_format_group,
+	NULL
+};
+
+static int vpa_pmu_event_init(struct perf_event *event)
+{
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/* it does not support event sampling mode */
+	if (is_sampling_event(event))
+		return -EOPNOTSUPP;
+
+	/* no branch sampling */
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	/* Invalid event code */
+	if ((event->attr.config <= 0) || (event->attr.config > 3))
+		return -EINVAL;
+
+	return 0;
+}
+
+static unsigned long get_counter_data(struct perf_event *event)
+{
+	unsigned int config = event->attr.config;
+	u64 data;
+
+	switch (config) {
+	case L1_TO_L2_CS_LAT:
+		data = kvmhv_get_l1_to_l2_cs_time();
+		break;
+	case L2_TO_L1_CS_LAT:
+		data = kvmhv_get_l2_to_l1_cs_time();
+		break;
+	case L2_RUNTIME_AGG:
+		data = kvmhv_get_l2_runtime_agg();
+		break;
+	default:
+		data = 0;
+		break;
+	}
+
+	return data;
+}
+
+static int vpa_pmu_add(struct perf_event *event, int flags)
+{
+	u64 data;
+
+	kvmhv_set_l2_counters_status(
+			smp_processor_id(), true);
+
+	data = get_counter_data(event);
+	local64_set(&event->hw.prev_count, data);
+
+	return 0;
+}
+
+static void vpa_pmu_read(struct perf_event *event)
+{
+	u64 prev_data, new_data, final_data;
+
+	prev_data = local64_read(&event->hw.prev_count);
+	new_data = get_counter_data(event);
+	final_data = new_data - prev_data;
+
+	local64_add(final_data, &event->count);
+}
+
+static void vpa_pmu_del(struct perf_event *event, int flags)
+{
+	vpa_pmu_read(event);
+
+	/*
+	 * Disable vpa counter accumulation
+	 */
+	kvmhv_set_l2_counters_status(
+			smp_processor_id(), false);
+}
+
+static struct pmu vpa_pmu = {
+	.task_ctx_nr	= perf_sw_context,
+	.name		= "vpa_pmu",
+	.event_init	= vpa_pmu_event_init,
+	.add		= vpa_pmu_add,
+	.del		= vpa_pmu_del,
+	.read		= vpa_pmu_read,
+	.attr_groups	= vpa_pmu_attr_groups,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+};
+
+static int __init pseries_vpa_pmu_init(void)
+{
+
+	/*
+	 * List of current Linux on Power platforms and
+	 * this driver is supported only in PowerVM LPAR
+	 * (L1) platform.
+	 *
+	 *	Enabled    Linux on Power Platforms
+	 *      ----------------------------------------
+	 *        [X]      PowerVM LPAR (L1)
+	 *        [ ]      KVM Guest On PowerVM KoP(L2)
+	 *        [ ]      Baremetal(PowerNV)
+	 *        [ ]      KVM Guest On PowerNV
+	 */
+	if (!firmware_has_feature(FW_FEATURE_LPAR) || is_kvm_guest())
+		return -ENODEV;
+
+	perf_pmu_register(&vpa_pmu, vpa_pmu.name, -1);
+	pr_info("Virtual Processor Area PMU registered.\n");
+
+	return 0;
+}
+
+static void __exit pseries_vpa_pmu_cleanup(void)
+{
+	perf_pmu_unregister(&vpa_pmu);
+	pr_info("Virtual Processor Area PMU unregistered.\n");
+}
+
+module_init(pseries_vpa_pmu_init);
+module_exit(pseries_vpa_pmu_cleanup);
+MODULE_DESCRIPTION("Perf Driver for pSeries VPA pmu counter");
+MODULE_AUTHOR("Kajol Jain <kjain@linux.ibm.com>");
+MODULE_AUTHOR("Madhavan Srinivasan <maddy@linux.ibm.com>");
+MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index afc0f6a61337..42fc66e97539 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -140,6 +140,20 @@ config HV_PERF_CTRS
 
 	  If unsure, select Y.
 
+config VPA_PMU
+	tristate "VPA PMU events"
+	depends on KVM_BOOK3S_64_HV && HV_PERF_CTRS
+	help
+	  Enable access to the VPA PMU counters via perf. This enables
+	  code that support measurement for KVM on PowerVM(KoP) feature.
+	  PAPR hypervisor has introduced three new counters in the VPA area
+	  of LPAR CPUs for KVM L2 guest observability. Two for context switches
+	  from host to guest and vice versa, and one counter for getting
+	  the total time spent inside the KVM guest. This config enables code
+	  that access these software counters via perf.
+
+	  If unsure, Select N.
+
 config IBMVIO
 	depends on PPC_PSERIES
 	bool
-- 
2.43.5


