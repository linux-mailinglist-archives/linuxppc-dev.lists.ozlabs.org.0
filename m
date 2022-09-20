Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0C5BEB35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX6hk4Vltz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KkfLvFNa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KkfLvFNa;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX6h059Xvz307F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:39:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGOuQq025830;
	Tue, 20 Sep 2022 16:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Snf6NantgU73oIZ2yGPMvchR6a8s+n8mDe93D16y/Cg=;
 b=KkfLvFNaFcPXkWmyBNsg90xcptp3ykE8r7Y+HaUyj3PSOtR9fFzGQm1RjU/F0Xz9qbAg
 mzYPoK0RxtIWat0g1LUGJP64a88XVqoIs1yggjkY22P5LYUjHdbF1LinFCCrHCTtaRHT
 vi70CxUlpdP8W3sy4y4UWG0hKBdHlAY4T84rpdZ8gChVS7KUT6VaHrd19MCK71kn6o2c
 dMwkcClU1HEuQnPBBjnSQzQQ3QpAwVn0aNTVkt21nBzyF5/DKHVX0h4h/o+IeOpnTSL6
 aK1jH6vYRiJy6bnnh1s7oeJRFjJ3miufkbRxJQGompZEcsHKGvqFIs0Lvx+hOjK2cZb+ 3Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqh0vrdys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 16:39:04 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28KGKk1G029155;
	Tue, 20 Sep 2022 16:39:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma02fra.de.ibm.com with ESMTP id 3jn5v8u2qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 16:39:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28KGcxQC51904858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Sep 2022 16:38:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FF85A405B;
	Tue, 20 Sep 2022 16:38:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93945A4054;
	Tue, 20 Sep 2022 16:38:57 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.74.132])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 20 Sep 2022 16:38:57 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/hv-gpci: Fix hv_gpci event list
Date: Tue, 20 Sep 2022 22:08:43 +0530
Message-Id: <20220920163843.233822-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gp4IamSrsTVf3lrA-AAOBF0M9nsqSqsi
X-Proofpoint-ORIG-GUID: Gp4IamSrsTVf3lrA-AAOBF0M9nsqSqsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200095
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
that supports counter_info_version 0x6 or below.

Fixes: 97bf2640184f4 ("powerpc/perf/hv-gpci: add the remaining gpci
requests")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
 arch/powerpc/perf/hv-gpci.c          |  9 +++++++--
 arch/powerpc/perf/hv-gpci.h          |  1 +
 arch/powerpc/perf/req-gen/perf.h     | 17 +++++++++++++++++
 4 files changed, 29 insertions(+), 2 deletions(-)

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
index 5eb60ed5b5e8..065a01812b3e 100644
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
@@ -353,6 +353,11 @@ static int hv_gpci_init(void)
 	/* sampling not supported */
 	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 
+	if (cpu_has_feature(CPU_FTR_ARCH_207S))
+		event_group.attrs = hv_gpci_event_attrs;
+	else
+		event_group.attrs = hv_gpci_event_attrs_v6;
+
 	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
 	if (r)
 		return r;
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index 4d108262bed7..866172c1651c 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -26,6 +26,7 @@ enum {
 #define REQUEST_FILE "../hv-gpci-requests.h"
 #define NAME_LOWER hv_gpci
 #define NAME_UPPER HV_GPCI
+#define EVENT_ENABLE	1
 #include "req-gen/perf.h"
 #undef REQUEST_FILE
 #undef NAME_LOWER
diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
index fa9bc804e67a..78d407e3fcc6 100644
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

