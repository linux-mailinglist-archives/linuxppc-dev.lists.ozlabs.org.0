Return-Path: <linuxppc-dev+bounces-12208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7685B57649
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLrx3vJ6z3dSs;
	Mon, 15 Sep 2025 20:30:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932225;
	cv=none; b=O3wNgCCURAPHuy1j/YYRajmR+3c7AVJo022EvpqKToy0YUSlLb32Ns1MNTD8NQEFlHezl27vzqsBIHBuDYDNZezctPaNIUWaORuGjbtWpJCXtmldT/+XK3YDZCbuKUEkQkWHXxmo2e+kRkYEvIjiABadwWi4f3WhbEFLdN/0m/WczNj0tQuTW3+5xdVB/FwRLvb4M80uUa/gtBeU8+yCNbO54ZYMGTlI43LX73kQfsNnLxMA7D9dmddieBQFTmPEhPtj155xe715Ys4srRRp6Y5zcrjRz/8XFkddoweteZlqzkXk/hm8p5RsWpOET2u0gebeYXqVZdRKzpzhcNAMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932225; c=relaxed/relaxed;
	bh=adWvo7XP+ImAfhPB++hQBn5dY2F1Pvjb3gBz9QnngRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIb9N30bImeF/G+SbmwaFOUH7EQWANHJU1qwiQqb9x10I8IYPatcjxzWnO8sTTBtfsJodiHnr4rGha5av+/SNx9mXsw/osd0Mt54qcNBWrNjQAhGSDpnpaLw0zQ4x9IyAsnbgqHN9hMZn5r0Ub7ZX8XlQLx6WXW1cDp5pvXDAQF1eqOkcuKG1TQ4oHxHMsvOlDbo1T4CWcqvQchydoBVuGtZARHeQlE+LgZ9jYScgAp+JOysIPgIv5CaMnjFanBlSUdlbwddZ1GTQFhjuFrq2C6sliTVBmJ8EZHxIBw7aokbX2q+GvFN2QWpy2TGwAh9uf2auG5i39dGP2Hvf5lyzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nDAeAot8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nDAeAot8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLrw59kMz3dK0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:24 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F4Lbls003028;
	Mon, 15 Sep 2025 10:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=adWvo7XP+ImAfhPB+
	+hQBn5dY2F1Pvjb3gBz9QnngRI=; b=nDAeAot8Fq4cQZrVroDXDhTtBkylhCCxA
	uGl7ffSSSSWGl7br4E5+U/P+b+tdz2aROqgPK9nnfhM/cYfQw2e6zq5LKNfdahUl
	dJMCSJGE1ACf0lV1Vmf98Kaz0gbrb083GxaRjqa/3IYeOE3Nti3iDGiZXO5/l6rV
	omUr3a9gdcv6S9n9ONS4wcgqEVs6YUZ068q+ULwNQ58qwBtUMeTrZq5n3viZfKuJ
	jycpjaadOblBa+AEiTdx17HwYXFP09RHCjU+bjPAJm0JnHYNyAleLqLcazSzpnb7
	xgJWjn/y1EkOJaBFWK+khSYZW6NJUgCFb8+58qnaZF9yw1/hxSVqQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x1ga0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:19 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FASZNe030575;
	Mon, 15 Sep 2025 10:30:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x1g9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7pL53027349;
	Mon, 15 Sep 2025 10:30:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memwuqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAUDJD54329722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABDC320043;
	Mon, 15 Sep 2025 10:30:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B36D20040;
	Mon, 15 Sep 2025 10:30:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:30:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com,
        Kajol Jain <kjain@linux.ibm.com>
Subject: [PATCH V3 2/7] powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
Date: Mon, 15 Sep 2025 15:59:42 +0530
Message-Id: <20250915102947.26681-3-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfX9MPhNL9zqjeV
 uhESkVHaoCfMP8ghvlU1jCRvz410n5X48SqvaYLd0VVX07TjwQXxgEveEF1Lo6q1EfOOBA8J/Q1
 0RvF3tdh1H8hXczB2FJ2iOgaFDg86ksNK7ZO4tRU3QeCIq4hU8trfwh800nAblkAXcR0Qt/KO8V
 BpPMzoYYkUDq2O3m9NtERKClfnsMQxBE5RRlqogK/7Uo2Zh98/IlduDLazckCQgKS1qGKw4ac+s
 QCUJF7SdaVe/e9RLf2L5JDtmlA5MMbotN9O33kHvGgZnDKjYniTMHcgtmjDMr5kBlETKWbm+5pF
 gdGmb+rK/Pws3Jo5A5AQ4HywjydJs6iZu9N1n9DUlZdy+c73IGYumOJHOLsc/MGof6YEYFHck9y
 v32DA1xK
X-Proofpoint-ORIG-GUID: vWHwx2RmkVEuia0d_OL-lWnqty25q8Ob
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c7eabb cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=TdOdhRd_pGKyV27KRdwA:9
X-Proofpoint-GUID: H8teAlzn0XxAAU_2zFFYnG4DSPrB_5NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Kajol Jain <kjain@linux.ibm.com>

The pseries Shared Processor Logical Partition(SPLPAR) machines
can retrieve a log of dispatch and preempt events from the
hypervisor using data from Disptach Trace Log(DTL) buffer.
With this information, user can retrieve when and why each dispatch &
preempt has occurred. Added an interface to expose the Virtual Processor
Area(VPA) DTL counters via perf.

The following events are available and exposed in sysfs:

 vpa_dtl/dtl_cede/ - Trace voluntary (OS initiated) virtual processor waits
 vpa_dtl/dtl_preempt/ - Trace time slice preempts
 vpa_dtl/dtl_fault/ - Trace virtual partition memory page faults.
 vpa_dtl/dtl_all/ - Trace all (dtl_cede/dtl_preempt/dtl_fault)

Added interface defines supported event list, config fields for the
event attributes and their corresponding bit values which are exported
via sysfs. User could use the standard perf tool to access perf events
exposed via vpa-dtl pmu.

The VPA DTL PMU counters do not interrupt on overflow or generate any
PMI interrupts. Therefore, the kernel needs to poll the counters, added
hrtimer code to do that. The timer interval can be provided by user via
sample_period field in nano seconds. There is one hrtimer added per
vpa-dtl pmu thread.

To ensure there are no other conflicting dtl users (example: debugfs dtl
or /proc/powerpc/vcpudispatch_stats), interface added code to use
"down_write_trylock" call to take the dtl_access_lock. The dtl_access_lock
is defined in dtl.h file. Also added global reference count variable called
"dtl_global_refc", to ensure dtl data can be captured per-cpu. Code also
added global lock called "dtl_global_lock" to avoid race condition.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:
Addressed review comments from Shrikanth

- Removed unused active_lock
- Added GFP_ATOMIC as part of kmem_cache_alloc_node

 arch/powerpc/perf/Makefile  |   2 +-
 arch/powerpc/perf/vpa-dtl.c | 340 ++++++++++++++++++++++++++++++++++++
 2 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/perf/vpa-dtl.c

diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index 7f53fcb7495a..78dd7e25219e 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -14,7 +14,7 @@ obj-$(CONFIG_PPC_POWERNV)	+= imc-pmu.o
 obj-$(CONFIG_FSL_EMB_PERF_EVENT) += core-fsl-emb.o
 obj-$(CONFIG_FSL_EMB_PERF_EVENT_E500) += e500-pmu.o e6500-pmu.o
 
-obj-$(CONFIG_HV_PERF_CTRS) += hv-24x7.o hv-gpci.o hv-common.o
+obj-$(CONFIG_HV_PERF_CTRS) += hv-24x7.o hv-gpci.o hv-common.o vpa-dtl.o
 
 obj-$(CONFIG_VPA_PMU) += vpa-pmu.o
 
diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
new file mode 100644
index 000000000000..4a8ba5b3ae3f
--- /dev/null
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Perf interface to expose Dispatch Trace Log counters.
+ *
+ * Copyright (C) 2024 Kajol Jain, IBM Corporation
+ */
+
+#ifdef CONFIG_PPC_SPLPAR
+#define pr_fmt(fmt) "vpa_dtl: " fmt
+
+#include <asm/dtl.h>
+#include <linux/perf_event.h>
+#include <asm/plpar_wrappers.h>
+
+#define EVENT(_name, _code)     enum{_name = _code}
+
+/*
+ * Based on Power Architecture Platform Reference(PAPR) documentation,
+ * Table 14.14. Per Virtual Processor Area, below Dispatch Trace Log(DTL)
+ * Enable Mask used to get corresponding virtual processor dispatch
+ * to preempt traces:
+ *   DTL_CEDE(0x1): Trace voluntary (OS initiated) virtual
+ *   processor waits
+ *   DTL_PREEMPT(0x2): Trace time slice preempts
+ *   DTL_FAULT(0x4): Trace virtual partition memory page
+ faults.
+ *   DTL_ALL(0x7): Trace all (DTL_CEDE | DTL_PREEMPT | DTL_FAULT)
+ *
+ * Event codes based on Dispatch Trace Log Enable Mask.
+ */
+EVENT(DTL_CEDE,         0x1);
+EVENT(DTL_PREEMPT,      0x2);
+EVENT(DTL_FAULT,        0x4);
+EVENT(DTL_ALL,          0x7);
+
+GENERIC_EVENT_ATTR(dtl_cede, DTL_CEDE);
+GENERIC_EVENT_ATTR(dtl_preempt, DTL_PREEMPT);
+GENERIC_EVENT_ATTR(dtl_fault, DTL_FAULT);
+GENERIC_EVENT_ATTR(dtl_all, DTL_ALL);
+
+PMU_FORMAT_ATTR(event, "config:0-7");
+
+static struct attribute *events_attr[] = {
+	GENERIC_EVENT_PTR(DTL_CEDE),
+	GENERIC_EVENT_PTR(DTL_PREEMPT),
+	GENERIC_EVENT_PTR(DTL_FAULT),
+	GENERIC_EVENT_PTR(DTL_ALL),
+	NULL
+};
+
+static struct attribute_group event_group = {
+	.name = "events",
+	.attrs = events_attr,
+};
+
+static struct attribute *format_attrs[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static const struct attribute_group format_group = {
+	.name = "format",
+	.attrs = format_attrs,
+};
+
+static const struct attribute_group *attr_groups[] = {
+	&format_group,
+	&event_group,
+	NULL,
+};
+
+struct vpa_dtl {
+	struct dtl_entry	*buf;
+	u64			last_idx;
+};
+
+static DEFINE_PER_CPU(struct vpa_dtl, vpa_dtl_cpu);
+
+/* variable to capture reference count for the active dtl threads */
+static int dtl_global_refc;
+static spinlock_t dtl_global_lock = __SPIN_LOCK_UNLOCKED(dtl_global_lock);
+
+/*
+ * Function to dump the dispatch trace log buffer data to the
+ * perf data.
+ */
+static void vpa_dtl_dump_sample_data(struct perf_event *event)
+{
+	return;
+}
+
+/*
+ * The VPA Dispatch Trace log counters do not interrupt on overflow.
+ * Therefore, the kernel needs to poll the counters to avoid missing
+ * an overflow using hrtimer. The timer interval is based on sample_period
+ * count provided by user, and minimum interval is 1 millisecond.
+ */
+static enum hrtimer_restart vpa_dtl_hrtimer_handle(struct hrtimer *hrtimer)
+{
+	struct perf_event *event;
+	u64 period;
+
+	event = container_of(hrtimer, struct perf_event, hw.hrtimer);
+
+	if (event->state != PERF_EVENT_STATE_ACTIVE)
+		return HRTIMER_NORESTART;
+
+	vpa_dtl_dump_sample_data(event);
+	period = max_t(u64, NSEC_PER_MSEC, event->hw.sample_period);
+	hrtimer_forward_now(hrtimer, ns_to_ktime(period));
+
+	return HRTIMER_RESTART;
+}
+
+static void vpa_dtl_start_hrtimer(struct perf_event *event)
+{
+	u64 period;
+	struct hw_perf_event *hwc = &event->hw;
+
+	period = max_t(u64, NSEC_PER_MSEC, hwc->sample_period);
+	hrtimer_start(&hwc->hrtimer, ns_to_ktime(period), HRTIMER_MODE_REL_PINNED);
+}
+
+static void vpa_dtl_stop_hrtimer(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	hrtimer_cancel(&hwc->hrtimer);
+}
+
+static void vpa_dtl_reset_global_refc(struct perf_event *event)
+{
+	spin_lock(&dtl_global_lock);
+	dtl_global_refc--;
+	if (dtl_global_refc <= 0) {
+		dtl_global_refc = 0;
+		up_write(&dtl_access_lock);
+	}
+	spin_unlock(&dtl_global_lock);
+}
+
+static int vpa_dtl_mem_alloc(int cpu)
+{
+	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, cpu);
+	struct dtl_entry *buf = NULL;
+
+	/* Check for dispatch trace log buffer cache */
+	if (!dtl_cache)
+		return -ENOMEM;
+
+	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
+	if (!buf) {
+		pr_warn("buffer allocation failed for cpu %d\n", cpu);
+		return -ENOMEM;
+	}
+	dtl->buf = buf;
+	return 0;
+}
+
+static int vpa_dtl_event_init(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	/* test the event attr type for PMU enumeration */
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	if (!perfmon_capable())
+		return -EACCES;
+
+	/* Return if this is a counting event */
+	if (!is_sampling_event(event))
+		return -EOPNOTSUPP;
+
+	/* no branch sampling */
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	/* Invalid eventcode */
+	switch (event->attr.config) {
+	case DTL_LOG_CEDE:
+	case DTL_LOG_PREEMPT:
+	case DTL_LOG_FAULT:
+	case DTL_LOG_ALL:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock(&dtl_global_lock);
+
+	/*
+	 * To ensure there are no other conflicting dtl users
+	 * (example: /proc/powerpc/vcpudispatch_stats or debugfs dtl),
+	 * below code try to take the dtl_access_lock.
+	 * The dtl_access_lock is a rwlock defined in dtl.h, which is used
+	 * to unsure there is no conflicting dtl users.
+	 * Based on below code, vpa_dtl pmu tries to take write access lock
+	 * and also checks for dtl_global_refc, to make sure that the
+	 * dtl_access_lock is taken by vpa_dtl pmu interface.
+	 */
+	if (dtl_global_refc == 0 && !down_write_trylock(&dtl_access_lock)) {
+		spin_unlock(&dtl_global_lock);
+		return -EBUSY;
+	}
+
+	/* Allocate dtl buffer memory */
+	if (vpa_dtl_mem_alloc(event->cpu)) {
+		spin_unlock(&dtl_global_lock);
+		return -ENOMEM;
+	}
+
+	/*
+	 * Increment the number of active vpa_dtl pmu threads. The
+	 * dtl_global_refc is used to keep count of cpu threads that
+	 * currently capturing dtl data using vpa_dtl pmu interface.
+	 */
+	dtl_global_refc++;
+
+	spin_unlock(&dtl_global_lock);
+
+	hrtimer_setup(&hwc->hrtimer, vpa_dtl_hrtimer_handle, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+
+	/*
+	 * Since hrtimers have a fixed rate, we can do a static freq->period
+	 * mapping and avoid the whole period adjust feedback stuff.
+	 */
+	if (event->attr.freq) {
+		long freq = event->attr.sample_freq;
+
+		event->attr.sample_period = NSEC_PER_SEC / freq;
+		hwc->sample_period = event->attr.sample_period;
+		local64_set(&hwc->period_left, hwc->sample_period);
+		hwc->last_period = hwc->sample_period;
+		event->attr.freq = 0;
+	}
+
+	event->destroy = vpa_dtl_reset_global_refc;
+	return 0;
+}
+
+static int vpa_dtl_event_add(struct perf_event *event, int flags)
+{
+	int ret, hwcpu;
+	unsigned long addr;
+	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
+
+	/*
+	 * Register our dtl buffer with the hypervisor. The
+	 * HV expects the buffer size to be passed in the second
+	 * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
+	 * from PAPR for more information.
+	 */
+	((u32 *)dtl->buf)[1] = cpu_to_be32(DISPATCH_LOG_BYTES);
+	dtl->last_idx = 0;
+
+	hwcpu = get_hard_smp_processor_id(event->cpu);
+	addr = __pa(dtl->buf);
+
+	ret = register_dtl(hwcpu, addr);
+	if (ret) {
+		pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
+			event->cpu, hwcpu, ret);
+		return ret;
+	}
+
+	/* set our initial buffer indices */
+	lppaca_of(event->cpu).dtl_idx = 0;
+
+	/*
+	 * Ensure that our updates to the lppaca fields have
+	 * occurred before we actually enable the logging
+	 */
+	smp_wmb();
+
+	/* enable event logging */
+	lppaca_of(event->cpu).dtl_enable_mask = event->attr.config;
+
+	vpa_dtl_start_hrtimer(event);
+
+	return 0;
+}
+
+static void vpa_dtl_event_del(struct perf_event *event, int flags)
+{
+	int hwcpu = get_hard_smp_processor_id(event->cpu);
+	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
+
+	vpa_dtl_stop_hrtimer(event);
+	unregister_dtl(hwcpu);
+	kmem_cache_free(dtl_cache, dtl->buf);
+	dtl->buf = NULL;
+	lppaca_of(event->cpu).dtl_enable_mask = 0x0;
+}
+
+/*
+ * This function definition is empty as vpa_dtl_dump_sample_data
+ * is used to parse and dump the dispatch trace log data,
+ * to perf data.
+ */
+static void vpa_dtl_event_read(struct perf_event *event)
+{
+}
+
+static struct pmu vpa_dtl_pmu = {
+	.task_ctx_nr = perf_invalid_context,
+
+	.name = "vpa_dtl",
+	.attr_groups = attr_groups,
+	.event_init  = vpa_dtl_event_init,
+	.add         = vpa_dtl_event_add,
+	.del         = vpa_dtl_event_del,
+	.read        = vpa_dtl_event_read,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_EXCLUSIVE,
+};
+
+static int vpa_dtl_init(void)
+{
+	int r;
+
+	if (!firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		pr_debug("not a shared virtualized system, not enabling\n");
+		return -ENODEV;
+	}
+
+	/* This driver is intended only for L1 host. */
+	if (is_kvm_guest()) {
+		pr_debug("Only supported for L1 host system\n");
+		return -ENODEV;
+	}
+
+	r = perf_pmu_register(&vpa_dtl_pmu, vpa_dtl_pmu.name, -1);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+device_initcall(vpa_dtl_init);
+#endif //CONFIG_PPC_SPLPAR
-- 
2.47.1


