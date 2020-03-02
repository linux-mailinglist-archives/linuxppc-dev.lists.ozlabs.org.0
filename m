Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 295FF17535E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:37:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W86K3srvzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7r60r0NzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:53 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225OINV042160
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:52 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfmyq9m1p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:51 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:49 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:44 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225Ogi438994036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 753985204F;
 Mon,  2 Mar 2020 05:24:42 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1F9A252050;
 Mon,  2 Mar 2020 05:24:38 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 07/11] perf hazard: Functions to convert generic hazard data to
 arch specific string
Date: Mon,  2 Mar 2020 10:53:51 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0028-0000-0000-000003DFC476
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0029-0000-0000-000024A4EBF6
Message-Id: <20200302052355.36365-8-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020039
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, ak@linux.intel.com,
 maddy@linux.ibm.com, peterz@infradead.org, alexey.budankov@linux.intel.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, adrian.hunter@intel.com,
 acme@kernel.org, alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com,
 mingo@redhat.com, paulus@samba.org, eranian@google.com, robert.richter@amd.com,
 namhyung@kernel.org, kim.phillips@amd.com, jolsa@redhat.com,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Kernel provides pipeline hazard data in struct perf_pipeline_haz_data
format. Add code to convert this data into meaningful string which can
be shown in perf report (followup patch).

Introduce tools/perf/utils/hazard directory which will contains arch
specific directories. Under arch specific directory, add arch specific
logic that will be called by generic code. This directory structure is
introduced to enable cross-arch reporting.

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/util/Build                         |   2 +
 tools/perf/util/hazard.c                      |  51 +++++++
 tools/perf/util/hazard.h                      |  14 ++
 tools/perf/util/hazard/Build                  |   1 +
 .../util/hazard/powerpc/perf_pipeline_haz.h   |  80 ++++++++++
 .../perf/util/hazard/powerpc/powerpc_hazard.c | 142 ++++++++++++++++++
 .../perf/util/hazard/powerpc/powerpc_hazard.h |  14 ++
 7 files changed, 304 insertions(+)
 create mode 100644 tools/perf/util/hazard.c
 create mode 100644 tools/perf/util/hazard.h
 create mode 100644 tools/perf/util/hazard/Build
 create mode 100644 tools/perf/util/hazard/powerpc/perf_pipeline_haz.h
 create mode 100644 tools/perf/util/hazard/powerpc/powerpc_hazard.c
 create mode 100644 tools/perf/util/hazard/powerpc/powerpc_hazard.h

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 07da6c790b63..f5e1b7d79b6d 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -118,6 +118,7 @@ perf-y += parse-regs-options.o
 perf-y += term.o
 perf-y += help-unknown-cmd.o
 perf-y += mem-events.o
+perf-y += hazard.o
 perf-y += vsprintf.o
 perf-y += units.o
 perf-y += time-utils.o
@@ -153,6 +154,7 @@ perf-$(CONFIG_LIBUNWIND_AARCH64)  += libunwind/arm64.o
 perf-$(CONFIG_LIBBABELTRACE) += data-convert-bt.o
 
 perf-y += scripting-engines/
+perf-y += hazard/
 
 perf-$(CONFIG_ZLIB) += zlib.o
 perf-$(CONFIG_LZMA) += lzma.o
diff --git a/tools/perf/util/hazard.c b/tools/perf/util/hazard.c
new file mode 100644
index 000000000000..db235b26b266
--- /dev/null
+++ b/tools/perf/util/hazard.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <string.h>
+#include "hazard/powerpc/powerpc_hazard.h"
+
+const char *perf_haz__itype_str(u8 itype, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__itype_str(itype);
+
+	return "-";
+}
+
+const char *perf_haz__icache_str(u8 icache, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__icache_str(icache);
+
+	return "-";
+}
+
+const char *perf_haz__hstage_str(u8 hstage, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__hstage_str(hstage);
+
+	return "-";
+}
+
+const char *perf_haz__hreason_str(u8 hstage, u8 hreason, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__hreason_str(hstage, hreason);
+
+	return "-";
+}
+
+const char *perf_haz__sstage_str(u8 sstage, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__sstage_str(sstage);
+
+	return "-";
+}
+
+const char *perf_haz__sreason_str(u8 sstage, u8 sreason, const char *arch)
+{
+	if (!strncmp(arch, "powerpc", strlen("powerpc")))
+		return powerpc__haz__sreason_str(sstage, sreason);
+
+	return "-";
+}
diff --git a/tools/perf/util/hazard.h b/tools/perf/util/hazard.h
new file mode 100644
index 000000000000..eab4190e056a
--- /dev/null
+++ b/tools/perf/util/hazard.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PERF_HAZARD_H
+#define __PERF_HAZARD_H
+
+#include "sort.h"
+
+const char *perf_haz__itype_str(u8 itype, const char *arch);
+const char *perf_haz__icache_str(u8 icache, const char *arch);
+const char *perf_haz__hstage_str(u8 hstage, const char *arch);
+const char *perf_haz__hreason_str(u8 hstage, u8 hreason, const char *arch);
+const char *perf_haz__sstage_str(u8 sstage, const char *arch);
+const char *perf_haz__sreason_str(u8 sstage, u8 sreason, const char *arch);
+
+#endif /* __PERF_HAZARD_H */
diff --git a/tools/perf/util/hazard/Build b/tools/perf/util/hazard/Build
new file mode 100644
index 000000000000..314c5e316383
--- /dev/null
+++ b/tools/perf/util/hazard/Build
@@ -0,0 +1 @@
+perf-y += powerpc/powerpc_hazard.o
diff --git a/tools/perf/util/hazard/powerpc/perf_pipeline_haz.h b/tools/perf/util/hazard/powerpc/perf_pipeline_haz.h
new file mode 100644
index 000000000000..de8857ec31dd
--- /dev/null
+++ b/tools/perf/util/hazard/powerpc/perf_pipeline_haz.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_POWERPC_PERF_PIPELINE_HAZ_H
+#define _UAPI_ASM_POWERPC_PERF_PIPELINE_HAZ_H
+
+enum perf_inst_type {
+	PERF_HAZ__ITYPE_LOAD = 1,
+	PERF_HAZ__ITYPE_STORE,
+	PERF_HAZ__ITYPE_BRANCH,
+	PERF_HAZ__ITYPE_FP,
+	PERF_HAZ__ITYPE_FX,
+	PERF_HAZ__ITYPE_CR_OR_SC,
+};
+
+enum perf_inst_cache {
+	PERF_HAZ__ICACHE_L1_HIT = 1,
+	PERF_HAZ__ICACHE_L2_HIT,
+	PERF_HAZ__ICACHE_L3_HIT,
+	PERF_HAZ__ICACHE_L3_MISS,
+};
+
+enum perf_pipeline_stage {
+	PERF_HAZ__PIPE_STAGE_IFU = 1,
+	PERF_HAZ__PIPE_STAGE_IDU,
+	PERF_HAZ__PIPE_STAGE_ISU,
+	PERF_HAZ__PIPE_STAGE_LSU,
+	PERF_HAZ__PIPE_STAGE_BRU,
+	PERF_HAZ__PIPE_STAGE_FXU,
+	PERF_HAZ__PIPE_STAGE_FPU,
+	PERF_HAZ__PIPE_STAGE_VSU,
+	PERF_HAZ__PIPE_STAGE_OTHER,
+};
+
+enum perf_haz_bru_reason {
+	PERF_HAZ__HAZ_BRU_MPRED_DIR = 1,
+	PERF_HAZ__HAZ_BRU_MPRED_TA,
+};
+
+enum perf_haz_isu_reason {
+	PERF_HAZ__HAZ_ISU_SRC = 1,
+	PERF_HAZ__HAZ_ISU_COL = 1,
+};
+
+enum perf_haz_lsu_reason {
+	PERF_HAZ__HAZ_LSU_ERAT_MISS = 1,
+	PERF_HAZ__HAZ_LSU_LMQ,
+	PERF_HAZ__HAZ_LSU_LHS,
+	PERF_HAZ__HAZ_LSU_MPRED,
+	PERF_HAZ__HAZ_DERAT_MISS,
+	PERF_HAZ__HAZ_LSU_LMQ_DERAT_MISS,
+	PERF_HAZ__HAZ_LSU_LHS_DERAT_MISS,
+	PERF_HAZ__HAZ_LSU_MPRED_DERAT_MISS,
+};
+
+enum perf_stall_lsu_reason {
+	PERF_HAZ__STALL_LSU_DCACHE_MISS = 1,
+	PERF_HAZ__STALL_LSU_LD_FIN,
+	PERF_HAZ__STALL_LSU_ST_FWD,
+	PERF_HAZ__STALL_LSU_ST,
+};
+
+enum perf_stall_fxu_reason {
+	PERF_HAZ__STALL_FXU_MC = 1,
+	PERF_HAZ__STALL_FXU_FC,
+};
+
+enum perf_stall_bru_reason {
+	PERF_HAZ__STALL_BRU_FIN_MPRED = 1,
+	PERF_HAZ__STALL_BRU_FC,
+};
+
+enum perf_stall_vsu_reason {
+	PERF_HAZ__STALL_VSU_MC = 1,
+	PERF_HAZ__STALL_VSU_FC,
+};
+
+enum perf_stall_other_reason {
+	PERF_HAZ__STALL_NTC,
+};
+
+#endif /* _UAPI_ASM_POWERPC_PERF_PIPELINE_HAZ_H */
diff --git a/tools/perf/util/hazard/powerpc/powerpc_hazard.c b/tools/perf/util/hazard/powerpc/powerpc_hazard.c
new file mode 100644
index 000000000000..dcb95b769367
--- /dev/null
+++ b/tools/perf/util/hazard/powerpc/powerpc_hazard.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stddef.h>
+#include "hazard.h"
+#include "powerpc_hazard.h"
+#include "perf_pipeline_haz.h"
+
+static const char *haz_inst_type[] = {
+	"-",
+	"Load",
+	"Store",
+	"Branch",
+	"Floating Point",
+	"Fixed point",
+	"Condition Register/System Call",
+};
+
+const char *powerpc__haz__itype_str(u8 itype)
+{
+	return haz_inst_type[itype];
+}
+
+static const char *haz_inst_cache[] = {
+	"-",
+	"L1 hit",
+	"L2 hit",
+	"L3 hit",
+	"L3 Miss"
+};
+
+const char *powerpc__haz__icache_str(u8 icache)
+{
+	return haz_inst_cache[icache];
+}
+
+static const char *pipeline_stages[] = {
+	"-",
+	"IFU",
+	"IDU",
+	"ISU",
+	"LSU",
+	"BRU",
+	"FXU",
+	"FPU",
+	"VSU",
+};
+
+const char *powerpc__haz__hstage_str(u8 hstage)
+{
+	return pipeline_stages[hstage];
+}
+
+static const char *haz_bru_reason[] = {
+	"-",
+	"Direction",
+	"Target Address",
+};
+
+static const char *haz_isu_reason[] = {
+	"-",
+	"Source Unavailable",
+	"Resource Collision",
+};
+
+static const char *haz_lsu_reason[] = {
+	"-",
+	"ERAT Miss",
+	"LMQ Full",
+	"Load Hit Store",
+	"Mispredict",
+	"DERAT Miss",
+	"LMQ Full, DERAT Miss",
+	"Load Hit Store, DERAT Miss",
+	"Mispredict, DERAT Miss",
+};
+
+const char *powerpc__haz__hreason_str(u8 hstage, u8 hreason)
+{
+	switch (hstage) {
+	case PERF_HAZ__PIPE_STAGE_BRU:
+		return haz_bru_reason[hreason];
+	case PERF_HAZ__PIPE_STAGE_LSU:
+		return haz_lsu_reason[hreason];
+	case PERF_HAZ__PIPE_STAGE_ISU:
+		return haz_isu_reason[hreason];
+	default:
+		return "-";
+	}
+}
+
+const char *powerpc__haz__sstage_str(u8 sstage)
+{
+	return pipeline_stages[sstage];
+}
+
+static const char *stall_lsu_reason[] = {
+	"-",
+	"Dcache_miss",
+	"Load fin",
+	"Store fwd",
+	"Store",
+};
+
+static const char *stall_fxu_reason[] = {
+	"-",
+	"Multi cycle",
+	"Fixed cycle",
+};
+
+static const char *stall_bru_reason[] = {
+	"-",
+	"Finish Mispredict",
+	"Fixed cycle",
+};
+
+static const char *stall_vsu_reason[] = {
+	"-",
+	"Multi cycle",
+	"Fixed cycle",
+};
+
+static const char *stall_other_reason[] = {
+	"-",
+	"Marked fin before NTC",
+};
+
+const char *powerpc__haz__sreason_str(u8 sstage, u8 sreason)
+{
+	switch (sstage) {
+	case PERF_HAZ__PIPE_STAGE_LSU:
+		return stall_lsu_reason[sreason];
+	case PERF_HAZ__PIPE_STAGE_FXU:
+		return stall_fxu_reason[sreason];
+	case PERF_HAZ__PIPE_STAGE_BRU:
+		return stall_bru_reason[sreason];
+	case PERF_HAZ__PIPE_STAGE_VSU:
+		return stall_vsu_reason[sreason];
+	case PERF_HAZ__PIPE_STAGE_OTHER:
+		return stall_other_reason[sreason];
+	default:
+		return "-";
+	}
+}
diff --git a/tools/perf/util/hazard/powerpc/powerpc_hazard.h b/tools/perf/util/hazard/powerpc/powerpc_hazard.h
new file mode 100644
index 000000000000..f13f8f3cd10d
--- /dev/null
+++ b/tools/perf/util/hazard/powerpc/powerpc_hazard.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PERF_POWERPC_HAZARD_H
+#define __PERF_POWERPC_HAZARD_H
+
+#include "hazard.h"
+
+const char *powerpc__haz__itype_str(u8 itype);
+const char *powerpc__haz__icache_str(u8 icache);
+const char *powerpc__haz__hstage_str(u8 hstage);
+const char *powerpc__haz__hreason_str(u8 hstage, u8 hreason);
+const char *powerpc__haz__sstage_str(u8 sstage);
+const char *powerpc__haz__sreason_str(u8 sstage, u8 sreason);
+
+#endif /* __PERF_POWERPC_HAZARD_H */
-- 
2.21.1

