Return-Path: <linuxppc-dev+bounces-12197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B018CB57173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGps1FFtz3dHf;
	Mon, 15 Sep 2025 17:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921301;
	cv=none; b=ZgLDAt9etKkB9HcRu/5/AlyEfo5n1WBq9D9j0h+vxxSgMp6WMBsQQ9BCwm7GceoProy3xDB4CVWffLJSzWRSCHjJu30gJRPGZG4nK1l6YggBMJkkShpcyMxcDfN502RTBkfEMSrw4Ntj3FUGnJrKEMRmHCP1kEJp//E1DdjhI2FEvPb/EuldQCUoqVxTyQzi2SWbM68eGwja7kE2W0uD86hWEOpOliBw4W0pPDaWURFg3u1ap+XdJFUHXTLdXikodoarbnC4vrtFgECAgD6vfLKM3Cj8LTedLERxLhVcosXhuudwO1zEGGIU4NvpTUO1iXnz3/TsHnIghY3gFwxh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921301; c=relaxed/relaxed;
	bh=dSYWsXaIuonzTel88n36RiR4O7YFAFSQ0atvwnxppbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrrDIuQWrla8j1gWim6fnraABqXQM4o7kUdNsG8SX1FTCPHaCOY12QyW/FYTH2qMNirgz4b8ylKrJbddfXm3dOm6TMtVEjzvyCU+CjKvgBUya28TjQzOKdpWT+Umz5Zoj8ZrdULT8RIcNYlrHsKAAIEwLj+EkalUM4hHaUGsl4C1SfB4H4MAKwLNtt6huD8/tH44icprpXWaBqOsXRoJZhKvWe0xbLyskcUh+UJqXSw+JA6SF9wcbjGtxGP216Ud/DbR2l6IIlWpuviqO2R7TzXlbaQeICozZhcMX0PN4ba8hrAsDOp6xqictMu+x272WpKp0Lxc435F3/xxT4nLRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hlK4rLCv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hlK4rLCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGpr3ScPz3dHC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:20 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EL8mcg025368;
	Mon, 15 Sep 2025 07:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dSYWsXaIuonzTel88
	n36RiR4O7YFAFSQ0atvwnxppbY=; b=hlK4rLCvlAXzHWZjNvRPDpLot8mOUBy01
	vF3u3zxjBSXjnE8O6We/UCxJxUnl5AWT1gx4VFrumMtLh/1jH18es9IVffKhhLeA
	0OVQhh+Xd86kDoGomLXgwH+pc+E1uouqfvVmUHJM5vJMHfnVhPUgyeVGTcuJcDRI
	wLRlwsRzvXAb/HsyM9xsQsdNrhR/ls2aqhxDQyEL+zyM+mQvIqS47lBoRBK07HLY
	W8eumxyhkKQCx5ydApqijskvcdhp80TW+V+iOoWXWd38id8cxHVqjRqfhQte6sr7
	8TgqzxZ/AGK2NqiDKAGO7qi4o3V1K1gRueYq30paVL3yqTKUtScYA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y13w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7SGBZ022059;
	Mon, 15 Sep 2025 07:28:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y13w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3ZZo0027268;
	Mon, 15 Sep 2025 07:28:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memw5u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7SBQi56295746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C78220049;
	Mon, 15 Sep 2025 07:28:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8E6920040;
	Mon, 15 Sep 2025 07:28:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 1/6] tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
Date: Mon, 15 Sep 2025 12:57:49 +0530
Message-Id: <20250915072754.99850-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072754.99850-1-atrajeev@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX2TTdgPDDvUdP
 o37JM+Fc+KphKgm0xP0X3T9Vrxddq821QTztwdZQbRZ7rcRylEF6BHJxPgMuVgMi0mR/2N7Gtr7
 4MAxRvWQn2JC0ioWiNUxHnDyuC0RfaDmxHn9wSYtirvbQKnrIXP6w9IJN6zIu6qRG+w1jvSaV+l
 TN8TFfL3Qd9IacZLf2DMLmRUaujnmzKyjHO5b94s0q+jmwDrlys2vHQxbKuneH1SPZPYl/tEpMP
 chLgWjr+G/bjUVSF8MctgAtBw8xC5j1OAWcLt9OJMs6TqrSTlBJ2jxVuu2FIY7jG9yOdYuW1F6z
 Zet320GqFgASREkV5kvEC2it0NAFt+SUDl2TMGhgdWodIIYwVf8fcow1q0CLIJc/QA2cQekT604
 xftpQIQm
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c7c011 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=_XbrgBOa1qvozJZRVgMA:9
X-Proofpoint-GUID: BTZ-CBsyC3qnUE2V6zq7BcViPaUHHcSg
X-Proofpoint-ORIG-GUID: 0-Bp5dGblNTCYC5ZqttJ3njickH80NvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
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
auxtrace_type as PERF_AUXTRACE_VPA_DTL. Add header file to define vpa
dtl pmu specific details.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
Addressed review comments from Adrian:
- Return VPADTL_AUXTRACE_PRIV_SIZE in powerpc_vpadtl_info_priv_size
- Remove unused powerpc_vpadtl_parse_snapshot_options
- Some of the function parameters had "__maybe_unused", corrected it.
- Used PERF_AUXTRACE_VPA_DTL instead of PERF_AUXTRACE_VPA_PMU
- Moved powerpc_vpadtl_process_auxtrace_info to next patch

 tools/perf/arch/powerpc/util/Build      |   1 +
 tools/perf/arch/powerpc/util/auxtrace.c | 114 ++++++++++++++++++++++++
 tools/perf/util/auxtrace.c              |   1 +
 tools/perf/util/auxtrace.h              |   1 +
 tools/perf/util/powerpc-vpadtl.h        |  18 ++++
 5 files changed, 135 insertions(+)
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
index 000000000000..803c582c0c6f
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/auxtrace.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VPA support
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/string.h>
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
+	return VPADTL_AUXTRACE_PRIV_SIZE;
+}
+
+static int
+powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
+		struct perf_session *session __maybe_unused,
+		struct perf_record_auxtrace_info *auxtrace_info,
+		size_t priv_size __maybe_unused)
+{
+	auxtrace_info->type = PERF_AUXTRACE_VPA_DTL;
+
+	return 0;
+}
+
+static void powerpc_vpadtl_free(struct auxtrace_record *itr)
+{
+	free(itr);
+}
+
+static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return 0;
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist,
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
+		if (strstarts(pmu_name, "vpa_dtl")) {
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
+	aux->recording_options = powerpc_vpadtl_recording_options;
+	aux->info_priv_size = powerpc_vpadtl_info_priv_size;
+	aux->info_fill = powerpc_vpadtl_info_fill;
+	aux->free = powerpc_vpadtl_free;
+	aux->reference = powerpc_vpadtl_reference;
+	return aux;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index ebd32f1b8f12..f294658bb948 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1393,6 +1393,7 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 	case PERF_AUXTRACE_HISI_PTT:
 		err = hisi_ptt_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_VPA_DTL:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index f001cbb68f8e..e0a5b39fed12 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -50,6 +50,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_ARM_SPE,
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
+	PERF_AUXTRACE_VPA_DTL,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
new file mode 100644
index 000000000000..50a7aa24acbe
--- /dev/null
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -0,0 +1,18 @@
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
+	VPADTL_AUXTRACE_PRIV_MAX,
+};
+
+#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
+
+#endif
-- 
2.47.1


