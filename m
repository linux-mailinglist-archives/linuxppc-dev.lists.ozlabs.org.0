Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DB344863
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:59:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yM31xH2z300P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:59:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m3dg7URz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m3dg7URz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yKg6GCPz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:57:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEZ0re059203; Mon, 22 Mar 2021 10:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=+GqHQhf8OyUnsv+kdTerOJlYkWDl0kyEBdWmq5wMqkE=;
 b=m3dg7URzBNHn5VdVkWgRHAUl7+yGGnTgz/pkwZS3fe+1jOhmRipDZWiiWEVqdCwekezC
 sG0B6dQILInO9bYVE/r5khfV+READ1P6jn5cGuqjXP4n7aLc/iBozwU44WpyVI29DhhP
 6dJIwEgV5107qGVl3xW1Fv6YJZ2Pv+6LBEDVMCZSzeWklkGVxqkUMRGqoy0Olxn5m1i6
 vlTO9KWcM8+9PVZPjFlI8FlX3+fH3RyrIXFi4oIPYmUStwNRUbsHJThPPYoYlDuPy0Ma
 hpDhgs2d69c/izVFH0UCsoM02YOMyPYhokY8NRl+KUKuqeiC0vJiarHU2kTPw/McgUS7 8Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef8b4bx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEgh86012462;
 Mon, 22 Mar 2021 14:57:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 37d99raf0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MEvaL632965048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 382994C040;
 Mon, 22 Mar 2021 14:57:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 844074C044;
 Mon, 22 Mar 2021 14:57:33 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage cycles
 using PERF_SAMPLE_WEIGHT_STRUCT
Date: Mon, 22 Mar 2021 10:57:23 -0400
Message-Id: <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103220107
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Performance Monitoring Unit (PMU) registers in powerpc provides
information on cycles elapsed between different stages in the
pipeline. This can be used for application tuning. On ISA v3.1
platform, this information is exposed by sampling registers.
Patch adds kernel support to capture two of the cycle counters
as part of perf sample using the sample type:
PERF_SAMPLE_WEIGHT_STRUCT.

The power PMU function 'get_mem_weight' currently uses 64 bit weight
field of perf_sample_data to capture memory latency. But following the
introduction of PERF_SAMPLE_WEIGHT_TYPE, weight field could contain
64-bit or 32-bit value depending on the architexture support for
PERF_SAMPLE_WEIGHT_STRUCT. Patches uses WEIGHT_STRUCT to expose the
pipeline stage cycles info. Hence update the ppmu functions to work for
64-bit and 32-bit weight values.

If the sample type is PERF_SAMPLE_WEIGHT, use the 64-bit weight field.
if the sample type is PERF_SAMPLE_WEIGHT_STRUCT, memory subsystem
latency is stored in the low 32bits of perf_sample_weight structure.
Also for CPU_FTR_ARCH_31, capture the two cycle counter information in
two 16 bit fields of perf_sample_weight structure.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 ++--
 arch/powerpc/perf/isa207-common.c            | 29 +++++++++++++++++++++++++---
 arch/powerpc/perf/isa207-common.h            |  6 +++++-
 4 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 00e7e671bb4b..112cf092d7b3 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -43,7 +43,7 @@ struct power_pmu {
 				u64 alt[]);
 	void		(*get_mem_data_src)(union perf_mem_data_src *dsrc,
 				u32 flags, struct pt_regs *regs);
-	void		(*get_mem_weight)(u64 *weight);
+	void		(*get_mem_weight)(u64 *weight, u64 type);
 	unsigned long	group_constraint_mask;
 	unsigned long	group_constraint_val;
 	u64             (*bhrb_filter_map)(u64 branch_sample_type);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..6936763246bd 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2206,9 +2206,9 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 						ppmu->get_mem_data_src)
 			ppmu->get_mem_data_src(&data.data_src, ppmu->flags, regs);
 
-		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT &&
+		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE &&
 						ppmu->get_mem_weight)
-			ppmu->get_mem_weight(&data.weight.full);
+			ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
 
 		if (perf_event_overflow(event, &data, regs))
 			power_pmu_stop(event, 0);
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..5dcbdbd54598 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -284,8 +284,10 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 	}
 }
 
-void isa207_get_mem_weight(u64 *weight)
+void isa207_get_mem_weight(u64 *weight, u64 type)
 {
+	union perf_sample_weight *weight_fields;
+	u64 weight_lat;
 	u64 mmcra = mfspr(SPRN_MMCRA);
 	u64 exp = MMCRA_THR_CTR_EXP(mmcra);
 	u64 mantissa = MMCRA_THR_CTR_MANT(mmcra);
@@ -296,9 +298,30 @@ void isa207_get_mem_weight(u64 *weight)
 		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
 
 	if (val == 0 || val == 7)
-		*weight = 0;
+		weight_lat = 0;
 	else
-		*weight = mantissa << (2 * exp);
+		weight_lat = mantissa << (2 * exp);
+
+	/*
+	 * Use 64 bit weight field (full) if sample type is
+	 * WEIGHT.
+	 *
+	 * if sample type is WEIGHT_STRUCT:
+	 * - store memory latency in the lower 32 bits.
+	 * - For ISA v3.1, use remaining two 16 bit fields of
+	 *   perf_sample_weight to store cycle counter values
+	 *   from sier2.
+	 */
+	weight_fields = (union perf_sample_weight *)weight;
+	if (type & PERF_SAMPLE_WEIGHT)
+		weight_fields->full = weight_lat;
+	else {
+		weight_fields->var1_dw = (u32)weight_lat;
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			weight_fields->var2_w = P10_SIER2_FINISH_CYC(mfspr(SPRN_SIER2));
+			weight_fields->var3_w = P10_SIER2_DISPATCH_CYC(mfspr(SPRN_SIER2));
+		}
+	}
 }
 
 int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp, u64 event_config1)
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 1af0e8c97ac7..fc30d43c4d0c 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -265,6 +265,10 @@
 #define ISA207_SIER_DATA_SRC_SHIFT	53
 #define ISA207_SIER_DATA_SRC_MASK	(0x7ull << ISA207_SIER_DATA_SRC_SHIFT)
 
+/* Bits in SIER2/SIER3 for Power10 */
+#define P10_SIER2_FINISH_CYC(sier2)	(((sier2) >> (63 - 37)) & 0x7fful)
+#define P10_SIER2_DISPATCH_CYC(sier2)	(((sier2) >> (63 - 13)) & 0x7fful)
+
 #define P(a, b)				PERF_MEM_S(a, b)
 #define PH(a, b)			(P(LVL, HIT) | P(a, b))
 #define PM(a, b)			(P(LVL, MISS) | P(a, b))
@@ -278,6 +282,6 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 					const unsigned int ev_alt[][MAX_ALT]);
 void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 							struct pt_regs *regs);
-void isa207_get_mem_weight(u64 *weight);
+void isa207_get_mem_weight(u64 *weight, u64 type);
 
 #endif
-- 
1.8.3.1

