Return-Path: <linuxppc-dev+bounces-6417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C862FA42039
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1h7v0kDZz307C;
	Tue, 25 Feb 2025 00:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740402971;
	cv=none; b=C40vBZIMMMbwLcwSj7xwQsVCChUADISGYnxQX/Ubk0bFQcR1+MPHTXMz/II2FglSZeWVx07G/7/kRCetL+jiXXSx6HsgW6Zax0BYh14UNIj2RsOksnOT0oWYYoZSbp2+wCcy3uLaQQeR6tgF8zzOAQlsWjx3vqWNsJ1RbBn6JFr1YoAwP2FMNrzS1tkd3DfsYbXo/syfm253lPiQ+LnunwfrvYd9RQVWAZe8/V8UVxkyNXVyImGMWP8gSZV1CWEs73F+EbOv02x0hHECOfzVFxB5f4mDxLukDFAMSh2KBNhQz3SMEmgmubJ2lFsAG9Lsq8pt1kRQYQmDkb09CwYn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740402971; c=relaxed/relaxed;
	bh=ivPT11LlTFu/lL+TENMjxZGFwjW0ydLf7h/6x3BmqwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2hMq2nNbJFy1xmVKe2fWW+ygdF5C5ASq0s7q0dpkif26DizbSMyViHjny+Ncy+5DATXGPdRXXqtN0w2lwiQuNf5VuPPZhYmdnLDvMOJ5N3L7GIglevH/MUz2TtAVcEdUQfc1G0WXEMfn+eCzAQBoi0yDMe1FLsooBLk5lugukd8TrFeoyUF4I2hvwhlSUA/j6cZcu8FDP+1iE+s3bzX+UrCAbl+Xr7p1WIr1HCrJsQRIlODpSzPxNSlrR69MoqC5gyryTGCPGJtq6Q9K2VuxOvauoX/n2mfhjfJlR4D7M0W4tlhzp/AxBuenFOya2Sfetetm29iPEE/iYS9gCo5wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIu5zHyy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIu5zHyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1h7t1m6jz306x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:16:10 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O7Wvt4006316;
	Mon, 24 Feb 2025 13:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ivPT11LlTFu/lL+TE
	NMjxZGFwjW0ydLf7h/6x3BmqwQ=; b=UIu5zHyyQ7xlusDcCpZ17vxULkhXxoTNe
	LGm5WRp5i3WPpvwGM3r3ViEzI00UTgjRk9Vux5bze6b43carEyAbCgr4ecblXS3+
	uhTR+/98t9CVlsu2igk+h/AxN1VTaoOft2YetIuIX60WonZFyEaI/J0NVqw4egmb
	unSSmBchrFZmqhl38q+exo9oIr/fnHtR5Y/Rp9ZVr54uY4pEMf2w87JovcCilSY8
	hAxbWgJD6Nkm+brWaVpBFQzgzdJYQeLcRi5560jkznSZ2AOFRg4IzCjy222p0VM6
	aRdoMIetJMX4QrAa0tKz8AVKxKgDfDbQAGFHg5/5kvMo5Uz/H2y6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450mfp1eqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:59 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ODDQZG030955;
	Mon, 24 Feb 2025 13:15:58 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450mfp1eqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51OD7c0Q026990;
	Mon, 24 Feb 2025 13:15:58 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdk754r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ODFslp12976410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:15:54 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DFE620043;
	Mon, 24 Feb 2025 13:15:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BA5E20040;
	Mon, 24 Feb 2025 13:15:50 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.32])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 24 Feb 2025 13:15:49 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 24 Feb 2025 18:45:49 +0530
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
Subject: [PATCH v4 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
Date: Mon, 24 Feb 2025 18:45:18 +0530
Message-ID: <20250224131522.77104-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224131522.77104-1-vaibhav@linux.ibm.com>
References: <20250224131522.77104-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: LwT7Mcu480ZOKrXrD5c5ieNf0QnudYo4
X-Proofpoint-GUID: -AGYJWSJPXi-gKl-3NNwAn_hl7LF7XLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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

v3->v4:
* Introduced a new kernel module named 'kmv-hv-pmu' to host the new PMU
instead of building the as part of KVM-HV module. [ Maddy ]
* Moved the code from arch/powerpc/kvm to arch/powerpc/perf [ Atheera ]
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
index dbfdc126bf14..5f0ce19e7e27 100644
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
+	depends on KVM_BOOK3S_64_HV && HV_PERF_CTRS
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
index 000000000000..c154f54e09e2
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
+		/* Setup done now register the PMU */
+		pr_info("Registering kvm-hv pmu");
+
+		/* Register only if we arent already registered */
+		rc = (kvmppc_pmu.type == -1) ?
+			     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
+					       -1) : 0;
+	}
+
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
2.48.1


