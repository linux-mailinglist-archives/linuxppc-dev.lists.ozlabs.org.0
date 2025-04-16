Return-Path: <linuxppc-dev+bounces-7695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A05A908DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd6060k9cz3bqq;
	Thu, 17 Apr 2025 02:28:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744820902;
	cv=none; b=Da5KjdaLFWw3AfimYVKGP8yOn/+qBefUiOGXZSVKafpRl5C08HkL2HjvDKcw8dTKHELnX3ilCXc9F7FrxK5CS1ZL+4k6zzHgVfVZYA4kHHma4F94UjxXHc6lHbfyl8f0mROpLITwvFbyeoiHDmzlgNYOeULMihcQDLFvHsA1jFdb5vEpvg2sKIjDYvc+4KMqHL/T4GQUY9E8kp0RXAt9k407KEvIF8gNFS7XKH4AAHsc1u6lRYvpd061X1UJ8fYCffyc+vgZBFQ1C1xr0K1VEJC6OLYL1vqEW9+13UhWOY9xPdAZt/D2T+65TjWWpLpjfsZfrqrVp0ZV04iVgUe3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744820902; c=relaxed/relaxed;
	bh=jXcD2hREtPnW8pwjOzLIPYow1SF+V5nC9F2KM3G6HWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GY4DGyw1lcUEI8pgXg75ytq0mb+wIpJ9TWb5Cg5WjIMwE+ydMggMUdFf9Hzyu6S4KngyENxCBYrwNG/Cv4RkkuET7t54KJbjuLaKdQ9TUf2tbsvuNiSyiuUaJG2vyAyFtebxO6RgR3F7qwIwnjV0rD4dnPv1Y8mr9oOJQcz9Vm7Oj25x1F+2mibqJ/YOiiK8DccmU4B00NchGcg09cLmPfVTB1ybquMHVCa+7f9J0MVmPtFfEjF+cEZkkXwo9hnrPA0qNnUuqw6GLPlVOiIWIP6t/2wYvVg0juOJDxRA4B7i/r2CmuHs5T3hhqnshzWmi5MadCJCaqlr/88yg6YRIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JNY1wmUI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JNY1wmUI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd6053FJYz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:28:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAGcxP016961;
	Wed, 16 Apr 2025 16:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jXcD2hREtPnW8pwjO
	zLIPYow1SF+V5nC9F2KM3G6HWk=; b=JNY1wmUIYy0be79l79nrf27q8/Lnznbn9
	mazjwMxT5152hguaRyXQS/bH6xTSAj3p64AsKXrinNZBf1qBD/FSMWra5ZV2kgia
	yc7dsj4wdlVGAU757LKBs6/pi81CEb9D1Jp3W2jKDk3eYWqjfXSpX8guP9G/ebCq
	7Y2Ijm6Yilm0tucF8phdLKSH9FEaKPZr+ve2B27Fy17gFHBQVBEZr4AZed/qrWS1
	wAkgWOldMEtEn3cZHzgqljdFYiKxlwjGjf6I+/Wdh60gsWO+vGH3hGIw6rgwt8h+
	YmbF46Vfyy3C0AEnXtKguoOo5hYo2L+NlplD3161oMbgUvmgkBmBg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461yj54x2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:28:14 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GGSD8V032465;
	Wed, 16 Apr 2025 16:28:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461yj54x2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:28:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GFxRhR016722;
	Wed, 16 Apr 2025 16:28:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4605728uua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:28:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GGS9RT30540440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 16:28:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40CE220043;
	Wed, 16 Apr 2025 16:28:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A88120040;
	Wed, 16 Apr 2025 16:28:05 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.156])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 16 Apr 2025 16:28:05 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 16 Apr 2025 21:58:04 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: [RESEND PATCH v5 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
Date: Wed, 16 Apr 2025 21:57:34 +0530
Message-ID: <20250416162740.93143-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416162740.93143-1-vaibhav@linux.ibm.com>
References: <20250416162740.93143-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: nStTRPUSKXhJIueL1Dfbk02J3ChV11lY
X-Proofpoint-ORIG-GUID: 8sz9IK8MaV26rvNhL-Jb61LhIh9d0EYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160127
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce a new PMU named 'kvm-hv' inside a new module named 'kvm-hv-pmu'
to report Book3s kvm-hv specific performance counters. This will expose
KVM-HV specific performance attributes to user-space via kernel's PMU
infrastructure and would enableusers to monitor active kvm-hv based guests.

The patch creates necessary scaffolding to for the new PMU callbacks and
introduces the new kernel module name 'kvm-hv-pmu' which is built with
CONFIG_KVM_BOOK3S_HV_PMU. The patch doesn't introduce any perf-events yet,
which will be introduced in later patches

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog

v5->resend:
* Rebase the patch to latest upstream kernel tree

v4->v5:
* Fixed a kismet warning reported by build-robot by removing dependency to
CONFIG_HV_PERF_CTRS
https://lore.kernel.org/oe-kbuild-all/202502280218.Jdd4jjlZ-lkp@intel.com/

* Removed a redundant check in kvmppc_register_pmu() [ Athira ]

v3->v4:
* Introduced a new kernel module named 'kmv-hv-pmu' to host the new PMU
instead of building the as part of KVM-HV module. [ Maddy ]
* Moved the code from arch/powerpc/kvm to arch/powerpc/perf [ Athira ]
* Added a new config named KVM_BOOK3S_HV_PMU to arch/powerpc/kvm/Kconfig

v2->v3:
* Fixed a build warning reported by kernel build robot.
Link:
https://lore.kernel.org/oe-kbuild-all/202501171030.3x0gqW8G-lkp@intel.com

v1->v2:
* Fixed an issue of kvm-hv not loading on baremetal kvm [Gautam]
---
 arch/powerpc/kvm/Kconfig       |  13 ++++
 arch/powerpc/perf/Makefile     |   2 +
 arch/powerpc/perf/kvm-hv-pmu.c | 138 +++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 arch/powerpc/perf/kvm-hv-pmu.c

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index dbfdc126bf14..2f2702c867f7 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -83,6 +83,7 @@ config KVM_BOOK3S_64_HV
 	depends on KVM_BOOK3S_64 && PPC_POWERNV
 	select KVM_BOOK3S_HV_POSSIBLE
 	select KVM_GENERIC_MMU_NOTIFIER
+	select KVM_BOOK3S_HV_PMU
 	select CMA
 	help
 	  Support running unmodified book3s_64 guest kernels in
@@ -171,6 +172,18 @@ config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
 	  those buggy L1s which saves the L2 state, at the cost of performance
 	  in all nested-capable guest entry/exit.
 
+config KVM_BOOK3S_HV_PMU
+	tristate "Hypervisor Perf events for KVM Book3s-HV"
+	depends on KVM_BOOK3S_64_HV
+	help
+	  Enable Book3s-HV Hypervisor Perf events PMU named 'kvm-hv'. These
+	  Perf events give an overview of hypervisor performance overall
+	  instead of a specific guests. Currently the PMU reports
+	  L0-Hypervisor stats on a kvm-hv enabled PSeries LPAR like:
+	  * Total/Used Guest-Heap
+	  * Total/Used Guest Page-table Memory
+	  * Total amount of Guest Page-table Memory reclaimed
+
 config KVM_BOOKE_HV
 	bool
 
diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index ac2cf58d62db..7f53fcb7495a 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -18,6 +18,8 @@ obj-$(CONFIG_HV_PERF_CTRS) += hv-24x7.o hv-gpci.o hv-common.o
 
 obj-$(CONFIG_VPA_PMU) += vpa-pmu.o
 
+obj-$(CONFIG_KVM_BOOK3S_HV_PMU) += kvm-hv-pmu.o
+
 obj-$(CONFIG_PPC_8xx) += 8xx-pmu.o
 
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
new file mode 100644
index 000000000000..12f40a7b3ced
--- /dev/null
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Description: PMUs specific to running nested KVM-HV guests
+ * on Book3S processors (specifically POWER9 and later).
+ */
+
+#define pr_fmt(fmt)  "kvmppc-pmu: " fmt
+
+#include "asm-generic/local64.h"
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/ratelimit.h>
+#include <linux/kvm_host.h>
+#include <linux/gfp_types.h>
+#include <linux/pgtable.h>
+#include <linux/perf_event.h>
+#include <linux/spinlock_types.h>
+#include <linux/spinlock.h>
+
+#include <asm/types.h>
+#include <asm/kvm_ppc.h>
+#include <asm/kvm_book3s.h>
+#include <asm/mmu.h>
+#include <asm/pgalloc.h>
+#include <asm/pte-walk.h>
+#include <asm/reg.h>
+#include <asm/plpar_wrappers.h>
+#include <asm/firmware.h>
+
+enum kvmppc_pmu_eventid {
+	KVMPPC_EVENT_MAX,
+};
+
+static struct attribute *kvmppc_pmu_events_attr[] = {
+	NULL,
+};
+
+static const struct attribute_group kvmppc_pmu_events_group = {
+	.name = "events",
+	.attrs = kvmppc_pmu_events_attr,
+};
+
+PMU_FORMAT_ATTR(event, "config:0");
+static struct attribute *kvmppc_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group kvmppc_pmu_format_group = {
+	.name = "format",
+	.attrs = kvmppc_pmu_format_attr,
+};
+
+static const struct attribute_group *kvmppc_pmu_attr_groups[] = {
+	&kvmppc_pmu_events_group,
+	&kvmppc_pmu_format_group,
+	NULL,
+};
+
+static int kvmppc_pmu_event_init(struct perf_event *event)
+{
+	unsigned int config = event->attr.config;
+
+	pr_debug("%s: Event(%p) id=%llu cpu=%x on_cpu=%x config=%u",
+		 __func__, event, event->id, event->cpu,
+		 event->oncpu, config);
+
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	if (config >= KVMPPC_EVENT_MAX)
+		return -EINVAL;
+
+	local64_set(&event->hw.prev_count, 0);
+	local64_set(&event->count, 0);
+
+	return 0;
+}
+
+static void kvmppc_pmu_del(struct perf_event *event, int flags)
+{
+}
+
+static int kvmppc_pmu_add(struct perf_event *event, int flags)
+{
+	return 0;
+}
+
+static void kvmppc_pmu_read(struct perf_event *event)
+{
+}
+
+/* L1 wide counters PMU */
+static struct pmu kvmppc_pmu = {
+	.module = THIS_MODULE,
+	.task_ctx_nr = perf_sw_context,
+	.name = "kvm-hv",
+	.event_init = kvmppc_pmu_event_init,
+	.add = kvmppc_pmu_add,
+	.del = kvmppc_pmu_del,
+	.read = kvmppc_pmu_read,
+	.attr_groups = kvmppc_pmu_attr_groups,
+	.type = -1,
+};
+
+static int __init kvmppc_register_pmu(void)
+{
+	int rc = -EOPNOTSUPP;
+
+	/* only support events for nestedv2 right now */
+	if (kvmhv_is_nestedv2()) {
+		/* Register the pmu */
+		rc = perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name, -1);
+		if (rc)
+			goto out;
+
+		pr_info("Registered kvm-hv pmu");
+	}
+
+out:
+	return rc;
+}
+
+static void __exit kvmppc_unregister_pmu(void)
+{
+	if (kvmhv_is_nestedv2()) {
+		if (kvmppc_pmu.type != -1)
+			perf_pmu_unregister(&kvmppc_pmu);
+
+		pr_info("kvmhv_pmu unregistered.\n");
+	}
+}
+
+module_init(kvmppc_register_pmu);
+module_exit(kvmppc_unregister_pmu);
+MODULE_DESCRIPTION("KVM PPC Book3s-hv PMU");
+MODULE_AUTHOR("Vaibhav Jain <vaibhav@linux.ibm.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0


