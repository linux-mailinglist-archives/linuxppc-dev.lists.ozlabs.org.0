Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33811175358
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:32:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W80M31gtzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:32:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7qw5ZqHzDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:44 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225OKTu145721
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:42 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfncc1puh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:42 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:33 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OVSB54067362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C035204F;
 Mon,  2 Mar 2020 05:24:31 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 583F452054;
 Mon,  2 Mar 2020 05:24:28 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 04/11] powerpc/perf: Arch support to expose Hazard data
Date: Mon,  2 Mar 2020 10:53:48 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0008-0000-0000-000003583690
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0009-0000-0000-00004A7960B7
Message-Id: <20200302052355.36365-5-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-01_09:2020-02-28,
 2020-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

SIER register on PowerPC hw pmu provides cpu pipeline hazard information.
Add logic to convert this arch specific data into perf_pipeline_haz_data
structure.

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |   2 +
 arch/powerpc/perf/core-book3s.c              |   4 +
 arch/powerpc/perf/isa207-common.c            | 157 +++++++++++++++++++
 arch/powerpc/perf/isa207-common.h            |  12 ++
 arch/powerpc/perf/power8-pmu.c               |   1 +
 arch/powerpc/perf/power9-pmu.c               |   1 +
 6 files changed, 177 insertions(+)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 3e9703f44c7c..9b8f90439ff2 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -37,6 +37,8 @@ struct power_pmu {
 	void		(*get_mem_data_src)(union perf_mem_data_src *dsrc,
 				u32 flags, struct pt_regs *regs);
 	void		(*get_mem_weight)(u64 *weight);
+	void		(*get_phazard_data)(struct perf_pipeline_haz_data *phaz,
+				u32 flags, struct pt_regs *regs);
 	unsigned long	group_constraint_mask;
 	unsigned long	group_constraint_val;
 	u64             (*bhrb_filter_map)(u64 branch_sample_type);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3086055bf681..fcbb4acc3a03 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2096,6 +2096,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 						ppmu->get_mem_weight)
 			ppmu->get_mem_weight(&data.weight);
 
+		if (event->attr.sample_type & PERF_SAMPLE_PIPELINE_HAZ &&
+						ppmu->get_phazard_data)
+			ppmu->get_phazard_data(&data.pipeline_haz, ppmu->flags, regs);
+
 		if (perf_event_overflow(event, &data, regs))
 			power_pmu_stop(event, 0);
 	}
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 07026bbd292b..03dafde7cace 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -239,6 +239,163 @@ void isa207_get_mem_weight(u64 *weight)
 		*weight = mantissa << (2 * exp);
 }
 
+static __u8 get_inst_type(u64 sier)
+{
+	switch (SIER_TYPE(sier)) {
+	case 1:
+		return PERF_HAZ__ITYPE_LOAD;
+	case 2:
+		return PERF_HAZ__ITYPE_STORE;
+	case 3:
+		return PERF_HAZ__ITYPE_BRANCH;
+	case 4:
+		return PERF_HAZ__ITYPE_FP;
+	case 5:
+		return PERF_HAZ__ITYPE_FX;
+	case 6:
+		return PERF_HAZ__ITYPE_CR_OR_SC;
+	}
+	return PERF_HAZ__ITYPE_NA;
+}
+
+static __u8 get_inst_cache(u64 sier)
+{
+	switch (SIER_ICACHE(sier)) {
+	case 1:
+		return PERF_HAZ__ICACHE_L1_HIT;
+	case 2:
+		return PERF_HAZ__ICACHE_L2_HIT;
+	case 3:
+		return PERF_HAZ__ICACHE_L3_HIT;
+	case 4:
+		return PERF_HAZ__ICACHE_L3_MISS;
+	}
+	return PERF_HAZ__ICACHE_NA;
+}
+
+static void get_hazard_data(u64 sier, struct perf_pipeline_haz_data *haz)
+{
+	if (SIER_MPRED(sier)) {
+		haz->hazard_stage = PERF_HAZ__PIPE_STAGE_BRU;
+
+		switch (SIER_MPRED_TYPE(sier)) {
+		case 1:
+			haz->hazard_reason = PERF_HAZ__HAZ_BRU_MPRED_DIR;
+			return;
+		case 2:
+			haz->hazard_reason = PERF_HAZ__HAZ_BRU_MPRED_TA;
+			return;
+		}
+	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
+	    (SIER_TYPE(sier) == 1 || SIER_TYPE(sier) == 2)) {
+		haz->hazard_stage = PERF_HAZ__PIPE_STAGE_LSU;
+		haz->hazard_reason = PERF_HAZ__HAZ_DERAT_MISS;
+		return;
+	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+	    (SIER_TYPE(sier) == 1 || SIER_TYPE(sier) == 2)) {
+		int derat_miss = SIER_DERAT_MISS(sier);
+
+		haz->hazard_stage = PERF_HAZ__PIPE_STAGE_LSU;
+
+		switch (p8_SIER_REJ_LSU_REASON(sier)) {
+		case 0:
+			haz->hazard_reason = PERF_HAZ__HAZ_LSU_ERAT_MISS;
+			return;
+		case 1:
+			haz->hazard_reason = (derat_miss) ?
+					     PERF_HAZ__HAZ_LSU_LMQ_DERAT_MISS :
+					     PERF_HAZ__HAZ_LSU_LMQ;
+			return;
+		case 2:
+			haz->hazard_reason = (derat_miss) ?
+					     PERF_HAZ__HAZ_LSU_LHS_DERAT_MISS :
+					     PERF_HAZ__HAZ_LSU_LHS;
+			return;
+		case 3:
+			haz->hazard_reason = (derat_miss) ?
+					     PERF_HAZ__HAZ_LSU_MPRED_DERAT_MISS :
+					     PERF_HAZ__HAZ_LSU_MPRED;
+			return;
+		}
+
+		if (derat_miss)
+			haz->hazard_reason = PERF_HAZ__HAZ_DERAT_MISS;
+	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_207S) && p8_SIER_REJ_ISU(sier)) {
+		haz->hazard_stage = PERF_HAZ__PIPE_STAGE_ISU;
+
+		if (p8_SIER_REJ_ISU_SRC(sier))
+			haz->hazard_reason = PERF_HAZ__HAZ_ISU_SRC;
+		if (p8_SIER_REJ_ISU_COL(sier))
+			haz->hazard_reason = PERF_HAZ__HAZ_ISU_COL;
+	}
+}
+
+static void get_stall_data(u64 sier, struct perf_pipeline_haz_data *haz)
+{
+	switch (SIER_FIN_STALL_REASON(sier)) {
+	case 1:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_OTHER;
+		haz->stall_reason = PERF_HAZ__STALL_NTC;
+		break;
+	case 4:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_LSU;
+		haz->stall_reason = PERF_HAZ__STALL_LSU_DCACHE_MISS;
+		break;
+	case 5:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_LSU;
+		haz->stall_reason = PERF_HAZ__STALL_LSU_LD_FIN;
+		break;
+	case 6:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_LSU;
+		haz->stall_reason = PERF_HAZ__STALL_LSU_ST_FWD;
+		break;
+	case 7:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_LSU;
+		haz->stall_reason = PERF_HAZ__STALL_LSU_ST;
+		break;
+	case 8:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_FXU;
+		haz->stall_reason = PERF_HAZ__STALL_FXU_MC;
+		break;
+	case 9:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_BRU;
+		haz->stall_reason = PERF_HAZ__STALL_BRU_FIN_MPRED;
+		break;
+	case 10:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_VSU;
+		haz->stall_reason = PERF_HAZ__STALL_VSU_MC;
+		break;
+	case 12:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_FXU;
+		haz->stall_reason = PERF_HAZ__STALL_FXU_FC;
+		break;
+	case 13:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_VSU;
+		haz->stall_reason = PERF_HAZ__STALL_VSU_FC;
+		break;
+	case 14:
+		haz->stall_stage = PERF_HAZ__PIPE_STAGE_BRU;
+		haz->stall_reason = PERF_HAZ__STALL_BRU_FC;
+	}
+}
+
+void isa207_get_phazard_data(struct perf_pipeline_haz_data *haz, u32 flags,
+			     struct pt_regs *regs)
+{
+	u64 sier = mfspr(SPRN_SIER);
+
+	haz->itype = get_inst_type(sier);
+	haz->icache = get_inst_cache(sier);
+	get_hazard_data(sier, haz);
+	get_stall_data(sier, haz);
+}
+
 int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 {
 	unsigned int unit, pmc, cache, ebb;
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 7027eb9f3e40..125e0e44aeea 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -12,6 +12,7 @@
 #include <linux/perf_event.h>
 #include <asm/firmware.h>
 #include <asm/cputable.h>
+#include <asm/perf_pipeline_haz.h>
 
 #define EVENT_EBB_MASK		1ull
 #define EVENT_EBB_SHIFT		PERF_EVENT_CONFIG_EBB_SHIFT
@@ -202,8 +203,17 @@
 #define MAX_ALT				2
 #define MAX_PMU_COUNTERS		6
 
+#define SIER_FIN_STALL_REASON(sier)	(((sier) >> (63 -  6)) & 0xfull)
 #define SIER_DATA_SRC(sier)		(((sier) >> (63 - 10)) & 0x7ull)
+#define p8_SIER_REJ_ISU_SRC(sier)	(((sier) >> (63 - 32)) & 0x1ull)
+#define p8_SIER_REJ_ISU_COL(sier)	(((sier) >> (63 - 33)) & 0x1ull)
+#define p8_SIER_REJ_ISU(sier)		(((sier) >> (63 - 33)) & 0x3ull)
+#define p8_SIER_REJ_LSU_REASON(sier)	(((sier) >> (63 - 36)) & 0x3ull)
 #define SIER_TYPE(sier)			(((sier) >> (63 - 48)) & 0x7ull)
+#define SIER_ICACHE(sier)		(((sier) >> (63 - 51)) & 0x7ull)
+#define SIER_MPRED(sier)		(((sier) >> (63 - 53)) & 0x1ull)
+#define SIER_MPRED_TYPE(sier)		(((sier) >> (63 - 55)) & 0x3ull)
+#define SIER_DERAT_MISS(sier)		(((sier) >> (63 - 56)) & 0x1ull)
 #define SIER_LDST(sier)			(((sier) >> (63 - 62)) & 0x7ull)
 
 #define P(a, b)				PERF_MEM_S(a, b)
@@ -220,5 +230,7 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 							struct pt_regs *regs);
 void isa207_get_mem_weight(u64 *weight);
+void isa207_get_phazard_data(struct perf_pipeline_haz_data *haz, u32 flags,
+			     struct pt_regs *regs);
 
 #endif
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index 3a5fcc20ff31..dc407329ba94 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -370,6 +370,7 @@ static struct power_pmu power8_pmu = {
 	.get_mem_data_src	= isa207_get_mem_data_src,
 	.get_mem_weight		= isa207_get_mem_weight,
 	.disable_pmc		= isa207_disable_pmc,
+	.get_phazard_data	= isa207_get_phazard_data,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S,
 	.n_generic		= ARRAY_SIZE(power8_generic_events),
 	.generic_events		= power8_generic_events,
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 08c3ef796198..84f663d8df13 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -428,6 +428,7 @@ static struct power_pmu power9_pmu = {
 	.get_mem_data_src	= isa207_get_mem_data_src,
 	.get_mem_weight		= isa207_get_mem_weight,
 	.disable_pmc		= isa207_disable_pmc,
+	.get_phazard_data	= isa207_get_phazard_data,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S,
 	.n_generic		= ARRAY_SIZE(power9_generic_events),
 	.generic_events		= power9_generic_events,
-- 
2.21.1

