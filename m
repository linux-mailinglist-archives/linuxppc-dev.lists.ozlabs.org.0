Return-Path: <linuxppc-dev+bounces-11049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B46B27B26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:35:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Fmv3QFxz3cb7;
	Fri, 15 Aug 2025 18:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246943;
	cv=none; b=YmDwwnhSPdLdJOxnEsFdz1ot5eUXb7Af/OzWe4u/Nq7ShbQOMT89ZPJt4MxpZH+02uIwlXvfUEwkQ60W/FwOsqM0mBe8GrGLuN75eQIxlx4ArLrrj+I+4Yi9XlS9JKfDQufZDNCbbyXmzUd0PcRGJ6dPWpfFFcc3wEBpazmQraWreeg29u63NlZ4YKYrAq5q0WfJLIJ9D/L81N5JXV27iDCTdyLpEO7FrGont5FXjP0bgVXQh/mpCQDcEoaIhgo0u8BviDk+6Keh+HC9cOGuZCXSuBjwy/sESMcWmT6IjLD/UOf2q/wQO+AcRLFVLT7CVcLr5eXq3eOIlWpeZqE95A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246943; c=relaxed/relaxed;
	bh=vpQoWSnCPUm7PQY2woov/wjwkju8NqZH1+PYWjuaXV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IaEac4w0KiOOoh3kvvYvu+Pdbub1SxC8piXVeuJy0hHYaidQljyrBLXDnCv516Lw3PmVEOwt4MYoxKfJwNJof5kt/bdZWO6y7ly5iFNzPRXDUX8wtTa1ffJS+TgBLBxj8VW280E8An3VVvNZCPx4PnNapg8Tbw9nvt52YBjaDYARvND1iBhJLvdlIB3lQVowqY4Gvi5MOzUbOrlAwTExF1aftwAPbw6sXz6W0G6LLmR1ys/ABiqik7oid94R+VYoUnZx084I92UfzDha37Yvd3l7tIWEyaz0isR8Jw+yAMPgQnKHfYpPLOC/nT6eOfN0zwau9yg7Znv4SBIOB8RmZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TyBdhXJj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TyBdhXJj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Fmt51XYz3cb2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:35:42 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EL04O4029887;
	Fri, 15 Aug 2025 08:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vpQoWSnCPUm7PQY2w
	oov/wjwkju8NqZH1+PYWjuaXV0=; b=TyBdhXJjYJb0MeMs9eZ0PIrujTTU9uR/q
	gdUW0x3NDy16rtki+KH1fSVMy0YMMxev7pFUHfPdjbcPLLcZapK39Xkt4x8FPisH
	+MQ9nKa1KSOS25sSRmDufiFKwoPxphXLMdz7dQ40u48pQ3RMpL/Bt0+CI6PusAXz
	tGEj3G67beLJOwdP3qt8Ms1hRPUuX6p+gryl504tMCUiy3djh3bIfmXRhXR2aMvp
	DrxNmy06NVC3iHedjWVJ2q17G96pO1abB60jR+cpdfFeL8/k9j5COU4lsZR3OVAt
	DBmRrNnzTp9D2VnqD2pF/X7DfAkZTK7dbREkhEgygUgEcLu2Lal2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrpe96s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:36 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8ZawR012664;
	Fri, 15 Aug 2025 08:35:36 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrpe96r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:36 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F7Q5ir028647;
	Fri, 15 Aug 2025 08:35:35 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5ng1y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8ZVIX56689070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FB2B2004D;
	Fri, 15 Aug 2025 08:35:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B24A120040;
	Fri, 15 Aug 2025 08:35:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 07/14] tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
Date: Fri, 15 Aug 2025 14:04:00 +0530
Message-Id: <20250815083407.27953-8-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfXySICyZB/y5Jo
 I8V3pCHcHPyrlz9mr469omw6Z22wu5yQ+qQoYtKjatc/goNq+2bqaBgho8nD5LTiQiib8z0JFg2
 z3Ee7GmE3HjRMI7ry56UIvLToS3rAaZDtfceuDE2zSB2sROh1iOFNRhM1mz29yC8moEt2w+YRuT
 nY699pyT27fEG3ZyPRc3wqAknuszXJvf/kMGDTGYzQUrnpqs0RLuaPOYJZsG3cUdGPnU+gEcOjy
 UflFLwNiqyNu85FIrzfmWwjH4sco0NO/+4MaebswqfqISsiv2VeKky4YKeZVcgDTsZ6bZ7s33sq
 4av1zAANaVRY5a+7nHeslnJ68DDUBAigqAGRXRwesUXMt1ER/fVYOjEQ1typVYOHXR/7XuybkVU
 9iksyoSi
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=689ef158 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=_XbrgBOa1qvozJZRVgMA:9
X-Proofpoint-GUID: uwCzC4m04zaGsITZf3rAL0pfV-BcOBne
X-Proofpoint-ORIG-GUID: VyKM2j4EbqWPQXgwGAquYzGZSE_YfHf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120219
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The powerpc PMU collecting Dispatch Trace Log (DTL) entries makes use of
AUX support in perf infrastructure. The PMU driver has the functionality
to collect trace entries in the aux buffer. On the tools side, this data
is made available as PERF_RECORD_AUXTRACE records. This record is
generated by "perf record" command. To enable the creation of
PERF_RECORD_AUXTRACE, add functions to initialize auxtrace records ie
"auxtrace_record__init()". Fill in fields for other callbacks like
info_priv_size, info_fill, free, recording options etc. Define
auxtrace_type as PERF_AUXTRACE_VPA_PMU. Add header file to define vpa
dtl pmu specific details.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/arch/powerpc/util/Build      |   1 +
 tools/perf/arch/powerpc/util/auxtrace.c | 122 ++++++++++++++++++++++++
 tools/perf/util/auxtrace.c              |   2 +
 tools/perf/util/auxtrace.h              |   1 +
 tools/perf/util/powerpc-vpadtl.h        |  26 +++++
 5 files changed, 152 insertions(+)
 create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
 create mode 100644 tools/perf/util/powerpc-vpadtl.h

diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index fdd6a77a3432..a5b0babd307e 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -10,3 +10,4 @@ perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
 perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
+perf-util-$(CONFIG_AUXTRACE) += auxtrace.o
diff --git a/tools/perf/arch/powerpc/util/auxtrace.c b/tools/perf/arch/powerpc/util/auxtrace.c
new file mode 100644
index 000000000000..ec8ec601fd08
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/auxtrace.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VPA support
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <time.h>
+
+#include "../../util/cpumap.h"
+#include "../../util/evsel.h"
+#include "../../util/evlist.h"
+#include "../../util/session.h"
+#include "../../util/util.h"
+#include "../../util/pmu.h"
+#include "../../util/debug.h"
+#include "../../util/auxtrace.h"
+#include "../../util/powerpc-vpadtl.h"
+#include "../../util/record.h"
+#include <internal/lib.h> // page_size
+
+#define KiB(x) ((x) * 1024)
+
+static int
+powerpc_vpadtl_parse_snapshot_options(struct auxtrace_record *itr __maybe_unused,
+				struct record_opts *opts __maybe_unused,
+				const char *str __maybe_unused)
+{
+	return 0;
+}
+
+static int
+powerpc_vpadtl_recording_options(struct auxtrace_record *ar __maybe_unused,
+			struct evlist *evlist __maybe_unused,
+			struct record_opts *opts)
+{
+	opts->full_auxtrace = true;
+
+	/*
+	 * Set auxtrace_mmap_pages to minimum
+	 * two pages
+	 */
+	if (!opts->auxtrace_mmap_pages) {
+		opts->auxtrace_mmap_pages = KiB(128) / page_size;
+		if (opts->mmap_pages == UINT_MAX)
+			opts->mmap_pages = KiB(256) / page_size;
+	}
+
+	return 0;
+}
+
+static size_t powerpc_vpadtl_info_priv_size(struct auxtrace_record *itr __maybe_unused,
+					struct evlist *evlist __maybe_unused)
+{
+	return 0;
+}
+
+static int
+powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
+		struct perf_session *session __maybe_unused,
+		struct perf_record_auxtrace_info *auxtrace_info __maybe_unused,
+		size_t priv_size __maybe_unused)
+{
+	auxtrace_info->type = PERF_AUXTRACE_VPA_PMU;
+
+	return 0;
+}
+
+static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return 0;
+}
+
+static void powerpc_vpadtl_free(struct auxtrace_record *itr)
+{
+	free(itr);
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist __maybe_unused,
+						int *err)
+{
+	struct auxtrace_record *aux;
+	struct evsel *pos;
+	char *pmu_name;
+	int found = 0;
+
+	evlist__for_each_entry(evlist, pos) {
+		pmu_name = strdup(pos->name);
+		pmu_name = strtok(pmu_name, "/");
+		if (!strcmp(pmu_name, "vpa_dtl")) {
+			found = 1;
+			pos->needs_auxtrace_mmap = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return NULL;
+
+	/*
+	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
+	 * must come first.
+	 */
+	evlist__to_front(pos->evlist, pos);
+
+	aux = zalloc(sizeof(*aux));
+	if (aux == NULL) {
+		pr_debug("aux record is NULL\n");
+		*err = -ENOMEM;
+		return NULL;
+	}
+
+	aux->parse_snapshot_options = powerpc_vpadtl_parse_snapshot_options;
+	aux->recording_options = powerpc_vpadtl_recording_options;
+	aux->info_priv_size = powerpc_vpadtl_info_priv_size;
+	aux->info_fill = powerpc_vpadtl_info_fill;
+	aux->free = powerpc_vpadtl_free;
+	aux->reference = powerpc_vpadtl_reference;
+	return aux;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index ebd32f1b8f12..f587d386c5ef 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -55,6 +55,7 @@
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
 #include "util/mmap.h"
+#include "powerpc-vpadtl.h"
 
 #include <linux/ctype.h>
 #include "symbol/kallsyms.h"
@@ -1393,6 +1394,7 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 	case PERF_AUXTRACE_HISI_PTT:
 		err = hisi_ptt_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_VPA_PMU:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index f001cbb68f8e..1f9ef473af77 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -50,6 +50,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_ARM_SPE,
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
+	PERF_AUXTRACE_VPA_PMU,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
new file mode 100644
index 000000000000..625172adaba5
--- /dev/null
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VPA DTL PMU Support
+ */
+
+#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
+#define INCLUDE__PERF_POWERPC_VPADTL_H__
+
+#define POWERPC_VPADTL_NAME "powerpc_vpadtl_"
+
+enum {
+	POWERPC_VPADTL_TYPE,
+	VPADTL_PER_CPU_MMAPS,
+	VPADTL_AUXTRACE_PRIV_MAX,
+};
+
+#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
+
+union perf_event;
+struct perf_session;
+struct perf_pmu;
+
+int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
+				  struct perf_session *session);
+
+#endif
-- 
2.47.1


