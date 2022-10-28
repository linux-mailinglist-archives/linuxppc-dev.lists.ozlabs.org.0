Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501A611640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:49:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzRmy0ClYz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:49:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nU69oVM1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nU69oVM1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRm06FcDz3bhl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:48:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SFgdr3000810;
	Fri, 28 Oct 2022 15:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zgcTu3K35nbjvpaPSZxkS35U3PhE9L8XB7sIOU+O4jc=;
 b=nU69oVM1gTtlLJbZpTIzErTonY0U0BxnALQzNzOZhIAaw9GZnw4Yd/56bWzFSvcHcvz7
 rzXZ8r7TTlSTnHZdRVGgOjbOoTLiqpSl7CwhnbUYMFR/f9Ny1m42wfegDjMlQED+hXxU
 uXb+Tcd3vCa77dXvITssEbHeA+1P1cXO52FKKlFQ2ErkI0z1jQ0p+G7d5jSb4jUSR2Ci
 3ik78ASJWhkIjxo6qxTqvgxQqP+r9HDvbVOZQke39xZeIMgORD6SzKXUO1vzSMqOKKIJ
 j0dfaawBRzaKEOUSCFCIs0ZktwwZU/YdueaofNjkiaAfH3rGFErIHnvP0vTFmeULDLV1 zw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kghy8g6a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 15:48:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SFaC0X012845;
	Fri, 28 Oct 2022 15:48:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3kftf1swvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 15:48:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SFmL4S63897940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 15:48:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F04F95204F;
	Fri, 28 Oct 2022 15:48:20 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.12.76])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DEB505204E;
	Fri, 28 Oct 2022 15:48:18 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/hv-gpci: Fix hv_gpci event list
Date: Fri, 28 Oct 2022 21:18:06 +0530
Message-Id: <20221028154806.141272-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TgrXuE-Ym7CSYCOnb6blvmjSqVj5cht3
X-Proofpoint-GUID: TgrXuE-Ym7CSYCOnb6blvmjSqVj5cht3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280097
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based on getPerfCountInfo v1.018 documentation, some of the
hv_gpci events got deprecated for platforms firmware that
supports counter_info_version 0x8 or above.

Patch fixes the hv_gpci event list by adding a new attribute
group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"
macro to enable these events for platform firmware
that supports counter_info_version 0x6 or below. And assigning
the hv_gpci event list based on output counter info version
of underlying plaform.

Fixes: 97bf2640184f ("powerpc/perf/hv-gpci: add the remaining gpci requests")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog:

v1 -> v2
- As suggested by Michael Ellerman, using counter_info_version value
  rather then cpu_has_feature() to assign hv-gpci event list.

 arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
 arch/powerpc/perf/hv-gpci.c          | 35 ++++++++++++++++++++++++++--
 arch/powerpc/perf/hv-gpci.h          |  1 +
 arch/powerpc/perf/req-gen/perf.h     | 17 ++++++++++++++
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/hv-gpci-requests.h b/arch/powerpc/perf/hv-gpci-requests.h
index 8965b4463d43..baef3d082de9 100644
--- a/arch/powerpc/perf/hv-gpci-requests.h
+++ b/arch/powerpc/perf/hv-gpci-requests.h
@@ -79,6 +79,7 @@ REQUEST(__field(0,	8,	partition_id)
 )
 #include I(REQUEST_END)
 
+#ifdef EVENT_ENABLE
 /*
  * Not available for counter_info_version >= 0x8, use
  * run_instruction_cycles_by_partition(0x100) instead.
@@ -92,6 +93,7 @@ REQUEST(__field(0,	8,	partition_id)
 	__count(0x10,	8,	cycles)
 )
 #include I(REQUEST_END)
+#endif
 
 #define REQUEST_NAME system_performance_capabilities
 #define REQUEST_NUM 0x40
@@ -103,6 +105,7 @@ REQUEST(__field(0,	1,	perf_collect_privileged)
 )
 #include I(REQUEST_END)
 
+#ifdef EVENT_ENABLE
 #define REQUEST_NAME processor_bus_utilization_abc_links
 #define REQUEST_NUM 0x50
 #define REQUEST_IDX_KIND "hw_chip_id=?"
@@ -194,6 +197,7 @@ REQUEST(__field(0,	4,	phys_processor_idx)
 	__count(0x28,	8,	instructions_completed)
 )
 #include I(REQUEST_END)
+#endif
 
 /* Processor_core_power_mode (0x95) skipped, no counters */
 /* Affinity_domain_information_by_virtual_processor (0xA0) skipped,
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 5eb60ed5b5e8..6eeabf3975e5 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -70,9 +70,9 @@ static const struct attribute_group format_group = {
 	.attrs = format_attrs,
 };
 
-static const struct attribute_group event_group = {
+static struct attribute_group event_group = {
 	.name  = "events",
-	.attrs = hv_gpci_event_attrs,
+	/* .attrs is set in init */
 };
 
 #define HV_CAPS_ATTR(_name, _format)				\
@@ -330,6 +330,7 @@ static int hv_gpci_init(void)
 	int r;
 	unsigned long hret;
 	struct hv_perf_caps caps;
+	struct hv_gpci_request_buffer *arg;
 
 	hv_gpci_assert_offsets_correct();
 
@@ -353,6 +354,36 @@ static int hv_gpci_init(void)
 	/* sampling not supported */
 	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * hcall H_GET_PERF_COUNTER_INFO populates the output
+	 * counter_info_version value based on the system hypervisor.
+	 * Pass the counter request 0x10 corresponds to request type
+	 * 'Dispatch_timebase_by_processor', to get the supported
+	 * counter_info_version.
+	 */
+	arg->params.counter_request = cpu_to_be32(0x10);
+
+	r = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
+			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
+	if (r) {
+		pr_devel("hcall failed, can't get supported counter_info_version: 0x%x\n", r);
+		arg->params.counter_info_version_out = 0x8;
+	}
+
+	/*
+	 * Use counter_info_version_out value to assign
+	 * required hv-gpci event list.
+	 */
+	if (arg->params.counter_info_version_out >= 0x8)
+		event_group.attrs = hv_gpci_event_attrs;
+	else
+		event_group.attrs = hv_gpci_event_attrs_v6;
+
+	put_cpu_var(hv_gpci_reqb);
+
 	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
 	if (r)
 		return r;
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index 4d108262bed7..10aba0ccb434 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -26,6 +26,7 @@ enum {
 #define REQUEST_FILE "../hv-gpci-requests.h"
 #define NAME_LOWER hv_gpci
 #define NAME_UPPER HV_GPCI
+#define EVENT_ENABLE
 #include "req-gen/perf.h"
 #undef REQUEST_FILE
 #undef NAME_LOWER
diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
index fa9bc804e67a..e0b355931271 100644
--- a/arch/powerpc/perf/req-gen/perf.h
+++ b/arch/powerpc/perf/req-gen/perf.h
@@ -139,6 +139,23 @@ PMU_EVENT_ATTR_STRING(							\
 #define REQUEST_(r_name, r_value, r_idx_1, r_fields)			\
 	r_fields
 
+/* Generate event list for platforms with counter_info_version 0x6 or below */
+static __maybe_unused struct attribute *hv_gpci_event_attrs_v6[] = {
+#include REQUEST_FILE
+	NULL
+};
+
+/*
+ * Based on getPerfCountInfo v1.018 documentation, some of the hv-gpci
+ * events got deprecated for platforms firmware that supports
+ * counter_info_version 0x8 or above.
+ * Undefining macro EVENT_ENABLE, to disable the addition of deprecated
+ * events in "hv_gpci_event_attrs" attribute group, for platforms that
+ * supports counter_info_version 0x8 or above.
+ */
+#undef EVENT_ENABLE
+
+/* Generate event list for platforms with counter_info_version 0x8 or above*/
 static __maybe_unused struct attribute *hv_gpci_event_attrs[] = {
 #include REQUEST_FILE
 	NULL
-- 
2.31.1

