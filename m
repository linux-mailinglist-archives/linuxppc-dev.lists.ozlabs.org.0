Return-Path: <linuxppc-dev+bounces-12277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB94B58DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 07:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQr3N22dfz30T9;
	Tue, 16 Sep 2025 15:26:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758000368;
	cv=none; b=M9pL4sX5jqw3SDEoE1e/cZqmfnDxGfIHMMbo3Rm5mXpx4p/xSlUeUXdMBlg7nEEqqrrEi9m5sDrhf1aNn/WgdCUPYEe0C6nJ+vXZmlV/amcQ/iQrLMeXJipvCIIswlBe3vqcV5nbwDr14P7gTEJ43cRW+2O9PZnwkWUGaOqPd3q5eTWI6O3cHLotfA0AkRCybU9cLXE+0huMxnsdAiGAJvBufua3cy1SwumUCjQrnZPc+0MQ5RD8BEnwMLvhI9gh8P9eQtP6Ql2d0ZyqZzoyvBp6mlHii9osjFU1L8Kndz9NX3L/1q7rLgCvApDAIlxsrSxWN06kwi0y/POSJ1kUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758000368; c=relaxed/relaxed;
	bh=o5XIWQgMKQ657aEing5yIPQNOpdM692/mQMQG37a86U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A0YQnnQ4mOOlkesdi2FWSbl0Po5dCmE6z8svhM09YX0Rl1LivY4fIEWY7jUTI5xy/dR2fNkBymOvADyLjeGGnm1lmfJkAmPm8if8zy2bmQYrfzlakxXzxvpSHECF70XxqHJJTD61yDHsgl5wQTilTaq04HsinBGjvjAHqdnLzYA+SWH3FLaQFp6dZnUYVV5Gm61pUQjgYxpnsGYXpUEmD1ryG+XRBYzVijHjsKeR5eg4oZit16liX/8ox0cBPOL/tIj7SuJL3UHcQizW9r8xsnfRUCXL/OKNeZKblY6KPfBaEXCf+f0IcUKpzDgRyXgl4HeG9WFNVBgtl34VjhvYyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kc/nrz5p; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kc/nrz5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQr3M22Wtz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 15:26:06 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G0CWxC027599;
	Tue, 16 Sep 2025 05:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=o5XIWQgMKQ657aEin
	g5yIPQNOpdM692/mQMQG37a86U=; b=Kc/nrz5puJQYaVa1c96g0wVMJnPl/PZZR
	LVpsR35a9kC6J/rzACFbLOCOUYRT1oC/TJ2St1w9cZAW48Dq43Ll6kWkXze/otrj
	AAYV2vrtesxSCxHk2Bi3eXu6JWESrMs5xZheeiwFlQRZxlJR3Uq4TFiZIUtTrGzL
	ThfZKgQAxGqiZWcY9pcZv9/+/puLteupccG46RglrnLDncW7EBLrjLqLoVAl2/ac
	MpsH/dt+06CpWV+KLM6tCyoQajxb2Du7AI0//Fb9ZoYzmHQ5M0M5f9APa8Uc+sBz
	FAc1wptKaieCfLCSu9yF/GG//FGFBbmu2bC0Vw1DigWHObCWorovg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x6adf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:00 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G5Pixo027570;
	Tue, 16 Sep 2025 05:26:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x6ade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G47pFb019200;
	Tue, 16 Sep 2025 05:25:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 495n5ma12t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:25:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G5PthD34275936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 05:25:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEC0E20043;
	Tue, 16 Sep 2025 05:25:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AAA520040;
	Tue, 16 Sep 2025 05:25:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.152])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 05:25:49 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 1/6] tools/perf: Add basic CONFIG_AUXTRACE support for VPA pmu on powerpc
Date: Tue, 16 Sep 2025 10:55:31 +0530
Message-Id: <20250916052536.93911-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250916052536.93911-1-atrajeev@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfXwzSk+m5aLM4p
 zWAbC8KD6FdQz8bx/VfReAF60XqFGwkUMbwHrbZiEe5JHatppwrq5JDJEBd7SHHPblh+B1PUPSY
 3Z/2RJOAkS5HcBgopcAMAIPkqZfydMpNXNSshF/ddLMrFIJXUimgaIt133mIfEMWTcPcP5sbnMF
 ut7a79HpY0FMp9J30LgugRcjesSvrs/bxClPkCjENq5pkxJ8Z3EbcAIO3Is72TYQuJ94rqYQQ4j
 6f/jmzNQSgY6P+EPDwkQuQPTZclYyuegQtSJCBW991v4LLI/T79asewrUahjwwRoT7h0MT7f3UL
 Jn9e82pM8vV7uJCkuarOlzDiKa0XajbMUrT+wn9TbXG78vAdQmI8Lw6TVtS2KP7CLUttrC/Anp7
 4+OIV8R8
X-Proofpoint-ORIG-GUID: mxGTaiFedJDAPCbXTGre2DA0kpvtjRw7
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c8f4e9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=dmz93kU106DcD6hd10MA:9
X-Proofpoint-GUID: nTBQU-OsivLoTEYoJPG6WU9mCiWoMOFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
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

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v3:
Addressed review comments from Adrian:
- Remove unused header files from arch/powerpc/util/auxtrace.c
- Use evsel name instead of using new variable
- Remove unused POWERPC_VPADTL_NAME

- Added Tested by from Venkat

v2:
Addressed review comments from Adrian:
- Return VPADTL_AUXTRACE_PRIV_SIZE in powerpc_vpadtl_info_priv_size
- Remove unused powerpc_vpadtl_parse_snapshot_options
- Some of the function parameters had "__maybe_unused", corrected it.
- Used PERF_AUXTRACE_VPA_DTL instead of PERF_AUXTRACE_VPA_PMU
- Moved powerpc_vpadtl_process_auxtrace_info to next patch

 tools/perf/arch/powerpc/util/Build      |   1 +
 tools/perf/arch/powerpc/util/auxtrace.c | 103 ++++++++++++++++++++++++
 tools/perf/util/auxtrace.c              |   1 +
 tools/perf/util/auxtrace.h              |   1 +
 tools/perf/util/powerpc-vpadtl.h        |  16 ++++
 5 files changed, 122 insertions(+)
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
index 000000000000..62c6f67f1bbe
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/auxtrace.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VPA support
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/string.h>
+
+#include "../../util/evlist.h"
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
+	int found = 0;
+
+	evlist__for_each_entry(evlist, pos) {
+		if (strstarts(pos->name, "vpa_dtl")) {
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
index 000000000000..0bca9b56379d
--- /dev/null
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VPA DTL PMU Support
+ */
+
+#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
+#define INCLUDE__PERF_POWERPC_VPADTL_H__
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


