Return-Path: <linuxppc-dev+bounces-5516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C564A1A3D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 13:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf08X67zqz306S;
	Thu, 23 Jan 2025 23:08:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737634108;
	cv=none; b=OEgK5628oIqZX1RmhAl+uoSamdzryIs4U2tEzfcoyb+9Og6SV2wz72CLyEFpJ2BV6zMNJLojEIol+DZIo+V7ZgasUMP7RBjMCGwT0HE3FZT/518UPv+pMv/88SPcvO5NH84LRmVvH/Afe1uzD60MWGmSzC/rkedFAys0cCPKCwb2TDM6FAQ18dAfpooFDy7oqup6H+r8cSL8UXLbtMJiCrDFOyu616PEbomJ8EpQ/e4MQZwSOnLVdMmLBlnJDXGJpdRiFUB5beOJaphoSUl46OC0P/OuSBAMNmNQ2UERDSmnU9RF8cicxHTj6o/VJVd8Vjub1fdndaLU1OZR64QVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737634108; c=relaxed/relaxed;
	bh=0XCDVlduxcD7Mqbg3m8m785H0JvVeFiJ/A6G1mWOJiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le/nRIxA+ZaardswNudHNcP52SbOAFnxaJciaN0G/2A1N8bH8z5N/qIeC+7bhQq+90RhpZMj0SDBbGqsyyong6AbhTyqiun4RW0IBZiwJEpEp24I0kP+bcPZfgGfgFfrWxPodCtedU4s07FW5CwOgUiL49lNqo4dQnYF6JEqWkI1uK5cHLpy07ECOgvzCP3LZZVcJvE7r2bXEkImxXrldSibB8a8Z9e6La18QYii+l/lmOhwDLnrCdpoiZRYDkIGXpr3n1BU9lig5eWw6NVHpO+/d3Z5ujcoeqimxMwCYA3x7XpKXgTXNtGNrBAPLxDEhrbtiiagZFbVT9OdEC+/Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dpv5ELuc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dpv5ELuc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf08W6fzyz305G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 23:08:27 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7X1m1028157;
	Thu, 23 Jan 2025 12:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0XCDVlduxcD7Mqbg3
	m8m785H0JvVeFiJ/A6G1mWOJiw=; b=Dpv5ELucRtEqoYiLjNuI5VP4ZSyuqnu/0
	1/vj5E70Cb+R1qP2oFo3Vd8YWXIzMXV3n+ntvAFbiLVcz5vNf3UxbALxFKj69v5H
	MkqUNeZx2jZ8Eu2nAy0sztyN5Z37RiIfD55zb4yhOTuM/vLmh0+jByTmOGhmXM6u
	RdZTtAONAU4MrfVdF6K2wT2jeyVd053dqbK0+Si1eJMG5GRhGdLkLewqpjNroZG2
	Hlg7sQAExGjwCR9zrEgQUrihBUSTeBdlUTAkiB8VmGKoXbEfjxg4i14FJa44qLGo
	MuC7ve6Nw4d0kZhfrJzT+rrz6CEqsW8o2TeJWtObVs7AYAbkJtgBw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfph81f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50NC8H5l007904;
	Thu, 23 Jan 2025 12:08:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfph81a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N9fJG0019223;
	Thu, 23 Jan 2025 12:08:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsnm0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:17 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NC8Dwh53412218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 12:08:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3ED12004B;
	Thu, 23 Jan 2025 12:08:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A72420043;
	Thu, 23 Jan 2025 12:08:10 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.34])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 23 Jan 2025 12:08:10 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Thu, 23 Jan 2025 17:38:09 +0530
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
Subject: [PATCH v3 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
Date: Thu, 23 Jan 2025 17:37:46 +0530
Message-ID: <20250123120749.90505-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123120749.90505-1-vaibhav@linux.ibm.com>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: HE3GzOUWaKoEhvJqsM81GQ6Rv9ZtU6zP
X-Proofpoint-ORIG-GUID: ml7IXyUQJEbyEznw6dewLGplifoFqh5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230091
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

v2->v3:
* Fixed a build warning reported by kernel build robot.
Link:
https://lore.kernel.org/oe-kbuild-all/202501171030.3x0gqW8G-lkp@intel.com

v1->v2:
* Fixed an issue of kvm-hv not loading on baremetal kvm [Gautam]
---
 arch/powerpc/include/asm/kvm_book3s.h |  20 ++++
 arch/powerpc/kvm/Makefile             |   6 ++
 arch/powerpc/kvm/book3s_hv.c          |   9 ++
 arch/powerpc/kvm/book3s_hv_pmu.c      | 133 ++++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index e1ff291ba891..7a7854c65ebb 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -348,6 +348,26 @@ static inline bool kvmhv_is_nestedv1(void)
 
 #endif
 
+/* kvm-ppc pmu registration */
+#if IS_ENABLED(CONFIG_KVM_BOOK3S_64_HV)
+#ifdef CONFIG_PERF_EVENTS
+int kvmppc_register_pmu(void);
+void kvmppc_unregister_pmu(void);
+
+#else
+
+static inline int kvmppc_register_pmu(void)
+{
+	return 0;
+}
+
+static inline void kvmppc_unregister_pmu(void)
+{
+	/* do nothing */
+}
+#endif /* CONFIG_PERF_EVENTS */
+#endif /* CONFIG_KVM_BOOK3S_64_HV */
+
 int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
 int __kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
 int __kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden);
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..7645307ff277 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -92,6 +92,12 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
 
+# enable kvm_hv perf events
+ifdef CONFIG_PERF_EVENTS
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
2.48.1


