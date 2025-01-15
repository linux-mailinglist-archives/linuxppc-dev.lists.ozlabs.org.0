Return-Path: <linuxppc-dev+bounces-5297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF8A1263A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 15:40:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7vb4wRGz3bg4;
	Thu, 16 Jan 2025 01:40:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736952027;
	cv=none; b=Nz1pVjjgSg9wSBVE0CSCfvAalxZuDOk+K5wrYy/Q9BzPLCHnGwxYlxBpdi5k8C3zko7a/73mWSjk9/kOsSXwC8NEO7MjIkP14iN+Fwx1chHskxrNcsUHICi5Pgh2KE+n+bA7lDWpFg+lV+ZafAOfm12Gj3Cw7GimCFm8lf9f1RX/zeu8T4AgoZbiunlX12W6GnY8eEtz5SsmDLAnvdm2M0oNyNxBY29HM50uWlqf3GahW0HprILwi8RyLxUk7zOC5saGlFLr0nkb8YuP4Oa3DLe4KqdcpYTC+17TI8jCj2xG0b3PMXKR9SYeizKXZRIXzdxDjU0C/Pt4lKKSWhzcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736952027; c=relaxed/relaxed;
	bh=dKEBP7F3xintJSLcoacxYBPwGCSgElBEdtNCjyQY864=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIbju+9dXoNReC78doVD+uGYU4CKSwrVCmvA8+COhdkPCEm0Q7M5bYX8wVa/S1+mQA9gMylRqGnXIkJE3Rlvy1Uc2QQySQnmXKtuSR0FDpgrqwes7zt6qAkuwmePE1175Bc4zfgvdo4KBCVcROc6zmwhFa4WDKjw1CLexOTEzVoJa/un1/XhbO+CBZpdlbWeURXRM4WQPDS1jbO3DByyxHxrFueikNEztzdG9kGXy4EUZ6zZUBNdlWNfqeC7/wnqEREukME45VjorabUq2d7tO0vYktVdRHi+kMkHZDLMfcCKaGibKK84bpo1EK2HVr/WAaTkJarHavBxAZz4esUxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBSH9ywX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBSH9ywX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7vZ71bcz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:40:26 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FEJ98e022567;
	Wed, 15 Jan 2025 14:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dKEBP7F3xintJSLco
	acxYBPwGCSgElBEdtNCjyQY864=; b=EBSH9ywXDV6JVksUQodQJrShMrQv+bHLk
	i1FufWO+ieGFbX1y7GBQ86Akg0Y54rPZ4SPWLC6mYnJCMg4gfsy6weWIAB4xuWA5
	ifpoyZZK3tH48vXMN5XN+8O7eCO5oUU1NxnDAn0TnHIdCVe4li0NZKtaGg43CzD3
	5t3SLTCYat6XzDioSYfGMyoSohW8S57DnVDoRqBhIkTqWcaIf2EDe5t/slMLo2SA
	XdKH6ktY300rovhEACRVFG3houDBPJ0rqcD+lXs7ofJFwUTYuSbotHkNU2V3Kkk6
	Uw4tKr1khOOWkMTBie2gLd65CscsJtc4+u8pIHXvbzTiI6DXuZ/XQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtqb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:20 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FEbcZ6012238;
	Wed, 15 Jan 2025 14:40:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtqb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FE35Vm002663;
	Wed, 15 Jan 2025 14:40:18 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443by8w0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FEeEQ755378350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 14:40:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83E9A2005A;
	Wed, 15 Jan 2025 14:40:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECEAB20040;
	Wed, 15 Jan 2025 14:40:10 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.24.117])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Jan 2025 14:40:10 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 15 Jan 2025 20:10:10 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Subject: [PATCH v2 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
Date: Wed, 15 Jan 2025 20:09:45 +0530
Message-ID: <20250115143948.369379-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115143948.369379-1-vaibhav@linux.ibm.com>
References: <20250115143948.369379-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: dmGWivaBNVOzmY1SIfJuf5qMV0-QSohi
X-Proofpoint-GUID: erUmpoV3tFfPMnLubll7vcs2n4e1n3Pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
performance counters. This will expose KVM-HV specific performance
attributes to user-space via kernel's PMU infrastructure and would enable
users to monitor active kvm-hv based guests.

The patch creates necessary scaffolding to for the new PMU callbacks and
introduces two new exports kvmppc_{,un}register_pmu() that are called from
kvm-hv init and exit function to perform initialize and cleanup for the
'kvm-hv' PMU. The patch doesn't introduce any perf-events yet, which will
be introduced in later patches

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog

v1->v2:
* Fixed an issue of kvm-hv not loading on baremetal kvm [Gautam]
---
 arch/powerpc/include/asm/kvm_book3s.h |  12 +++
 arch/powerpc/kvm/Makefile             |   6 ++
 arch/powerpc/kvm/book3s_hv.c          |   9 ++
 arch/powerpc/kvm/book3s_hv_pmu.c      | 133 ++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index e1ff291ba891..cf91a1493159 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -334,6 +334,9 @@ static inline bool kvmhv_is_nestedv1(void)
 	return !static_branch_likely(&__kvmhv_is_nestedv2);
 }
 
+int kvmppc_register_pmu(void);
+void kvmppc_unregister_pmu(void);
+
 #else
 
 static inline bool kvmhv_is_nestedv2(void)
@@ -346,6 +349,15 @@ static inline bool kvmhv_is_nestedv1(void)
 	return false;
 }
 
+static int kvmppc_register_pmu(void)
+{
+	return 0;
+}
+
+static void kvmppc_unregister_pmu(void)
+{
+}
+
 #endif
 
 int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..094c3916d9d0 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -92,6 +92,12 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
 
+# enable kvm_hv perf events
+ifdef CONFIG_HAVE_PERF_EVENTS
+kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
+	book3s_hv_pmu.o
+endif
+
 obj-$(CONFIG_GUEST_STATE_BUFFER_TEST) += test-guest-state-buffer.o
 endif
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 25429905ae90..6365b8126574 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6662,6 +6662,14 @@ static int kvmppc_book3s_init_hv(void)
 		return r;
 	}
 
+	r = kvmppc_register_pmu();
+	if (r == -EOPNOTSUPP) {
+		pr_info("KVM-HV: PMU not supported %d\n", r);
+	} else if (r) {
+		pr_err("KVM-HV: Unable to register PMUs %d\n", r);
+		goto err;
+	}
+
 	kvm_ops_hv.owner = THIS_MODULE;
 	kvmppc_hv_ops = &kvm_ops_hv;
 
@@ -6676,6 +6684,7 @@ static int kvmppc_book3s_init_hv(void)
 
 static void kvmppc_book3s_exit_hv(void)
 {
+	kvmppc_unregister_pmu();
 	kvmppc_uvmem_free();
 	kvmppc_free_host_rm_ops();
 	if (kvmppc_radix_possible())
diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c b/arch/powerpc/kvm/book3s_hv_pmu.c
new file mode 100644
index 000000000000..8c6ed30b7654
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_pmu.c
@@ -0,0 +1,133 @@
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
+int kvmppc_register_pmu(void)
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
+EXPORT_SYMBOL_GPL(kvmppc_register_pmu);
+
+void kvmppc_unregister_pmu(void)
+{
+	if (kvmhv_is_nestedv2()) {
+		if (kvmppc_pmu.type != -1)
+			perf_pmu_unregister(&kvmppc_pmu);
+
+		pr_info("kvmhv_pmu unregistered.\n");
+	}
+}
+EXPORT_SYMBOL_GPL(kvmppc_unregister_pmu);
-- 
2.47.1


