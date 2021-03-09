Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814A332820
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 15:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvxqY4BDKz3cVZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 01:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ec58ocz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ec58ocz9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvxq72cVdz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 01:07:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129E46Yr108680; Tue, 9 Mar 2021 09:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=7ArucdtgAZPULah+t6ep+MnwDlRqIY/yl7A+BEsq3UQ=;
 b=Ec58ocz9h3TAM1wTp0C8DqUwhzeZZ1Cs5P+05CpOYSfHqOG0b07Y8jAwi2mmNVpgVA14
 wVOFInK8w0VhLsqnl9C9yJquW16ffTMSrWXelG2iQetDGZ4L1ywLJrocGq9TFMb0n0XC
 Phr3HrYdOq5bRSD9yoWQYppz99u/M5OhK+nlRmDvCP35W7QRbCFDl2oOSpylpu7bVAXB
 5gnjiAYK4E1DWvV80l16sZMtutsFS9N1s0JzRFdgu0TTIVYSo9pye0+kBSaQM2NkoKaK
 q2hyfPVlpnxemKdOPdq3Xe8p6GsuDHeXmeEWSxiQcQQbDRVMTQLa0/oaM88Zy+T6B87E jg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wet49ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 09:07:05 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129E4DRD023655;
 Tue, 9 Mar 2021 14:07:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3768n6022e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:07:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 129E6jL528115406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 14:06:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 529F54C040;
 Tue,  9 Mar 2021 14:07:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C4B44C058;
 Tue,  9 Mar 2021 14:06:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.34.70])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Mar 2021 14:06:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH 1/4] powerpc/perf: Expose processor pipeline stage cycles
 using PERF_SAMPLE_WEIGHT_STRUCT
Date: Tue,  9 Mar 2021 09:03:57 -0500
Message-Id: <1615298640-1529-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090071
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
index 6817331e22ff..57ff2494880c 100644
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

