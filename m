Return-Path: <linuxppc-dev+bounces-5376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 180C3A15D2E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 14:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZy0g6qqMz2ykf;
	Sun, 19 Jan 2025 00:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737206467;
	cv=none; b=KjSnkhfwq26dpb4W6u3ZRGRN/tpjq9QlQzr9Fp4IGHldmu+M7C7rcJhIpcGPlH/+psKuE8dQt6jMIbAv0iQCAObeuWa+jmu4PN2yL7mV1ztXzBFtcy27e6s8nYFSCa0DzoQ7f3Z2N/Ahw/5ajcUXTYHtGO06ICyE0uaU0/xUENSTOeGmh9rkXyKuyTPVHlBJgioALckd19W9i2RFRjeVhHZfYSekIoU58Gl6l1D32kuyK++S1lprMmTqCRxSxAdBkxWwSgKWqlYk7+xLK1m+7477xCWx8i4seEwFVPO+SB+voZ+AyMnpy9cCmrRNh98MWO2GhUyRCYdtVaVbZVzJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737206467; c=relaxed/relaxed;
	bh=UIVjePIxZ1lvqFj/Gsh8IZzOYjYSYUfDGfFXPMpy3ec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I8VuI66406QwW64Da240KHTJZhKm2wTxVyGcXRjgQqr98wzc05ghWH913g+wYAxgWiaGQE4VPxL7p4IycAourSNIfvD6e20mbxKpVthJgUM4Ks7qZjLSFoBvg6xsKTZ2Luh3QeQXSzCGniLTm3Tfnjsdqi9XSISlOR8u5zMp2z5jCJG4tT+Kl4T0WZTzRpTkUwRAffAO3rlyaXuTAqnQuJrIRulJgvJYkZVgFqpABvRh8i8/Up3Le64tT8FUlwwxJVWNTAc8ipHeHCjbFrbaMrn1dymtnZfTAxnPrdCV8KquhjkuU7fnrKfpXUae+zyZVFoEfg2YszFe7fek4aE0WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qztbDb2l; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qztbDb2l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZy0c528Lz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jan 2025 00:21:03 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50I9uiVC019641
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=UIVjePIxZ1lvqFj/Gsh8IZzOYjYSYUfDGfFXPMpy3
	ec=; b=qztbDb2lNDqQYbL1piiSKldeJxntYFnraYJ/Ge4C5v2i2AVBChzUd0jHb
	+4Wn+uhDGpxFMzKUkQiXY08N46wOzvMMnb+FubNUQ/LUB9KSADDgiRvJBgyv7/JH
	QmDciIglusuDqdGcLbRqFbWOZT+UpYjp0D+BwZx5w0plxdT2DsVzl5bxk7s2fzUm
	L9ZQjncTxBc/UDQYHhWhhHk+mdgz8a48JoK18Zi2IResc2C6xWVNZXyaZrU2atfy
	342Cyt9jsNlyWPZQVMfjTDepwubXCwH33jp7OyVtkMNLmrPDj39nr5bgUXwX1eLj
	udhb0+k7gP+volnHiq0RSWdMF8MNg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4485w9s92y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50I9WqjU003157
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:20:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4485n7hg77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:20:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50IDKts222217050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Jan 2025 13:20:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8826120043;
	Sat, 18 Jan 2025 13:20:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ECE520040;
	Sat, 18 Jan 2025 13:20:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.250.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 18 Jan 2025 13:20:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 1/2] arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
Date: Sat, 18 Jan 2025 18:50:45 +0530
Message-Id: <20250118132046.93872-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iUcNLpJfpPIfFCMHNqu8U3T_O43dN0tl
X-Proofpoint-GUID: iUcNLpJfpPIfFCMHNqu8U3T_O43dN0tl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501180104
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS
	autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf mem report aborts as below sometimes (during some corner
case) in powerpc:

   # ./perf mem report 1>out
   *** stack smashing detected ***: terminated
   Aborted (core dumped)

The backtrace is as below:
   __pthread_kill_implementation ()
   raise ()
   abort ()
   __libc_message
   __fortify_fail
   __stack_chk_fail
   hist_entry.lvl_snprintf
   __sort__hpp_entry
   __hist_entry__snprintf
   hists.fprintf
   cmd_report
   cmd_mem

Snippet of code which triggers the issue
from tools/perf/util/sort.c

   static int hist_entry__lvl_snprintf(struct hist_entry *he, char *bf,
                                    size_t size, unsigned int width)
   {
        char out[64];

        perf_mem__lvl_scnprintf(out, sizeof(out), he->mem_info);
        return repsep_snprintf(bf, size, "%-*s", width, out);
   }

The value of "out" is filled from perf_mem_data_src value.
Debugging this further showed that for some corner cases, the
value of "data_src" was pointing to wrong value. This resulted
in bigger size of string and causing stack check fail.

The perf mem data source values are captured in the sample via
isa207_get_mem_data_src function. The initial check is to fetch
the type of sampled instruction. If the type of instruction is
not valid (not a load/store instruction), the function returns.

Since 'commit e16fd7f2cb1a ("perf: Use sample_flags for data_src")',
data_src field is not initialized by the perf_sample_data_init()
function. If the PMU driver doesn't set the data_src value to zero if
type is not valid, this will result in uninitailised value for data_src.
The uninitailised value of data_src resulted in stack check fail
followed by abort for "perf mem report".

When requesting for data source information in the sample, the
instruction type is expected to be load or store instruction.
In ISA v3.0, due to hardware limitation, there are corner cases
where the instruction type other than load or store is observed.
In ISA v3.0 and before values "0" and "7" are considered reserved.
In ISA v3.1, value "7" has been used to indicate "larx/stcx".
Drop the sample if instruction type has reserved values for this
field with a ISA version check. Initialize data_src to zero in
isa207_get_mem_data_src if the instruction type is not load/store.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 Define macros for ISA207_SIER_TYPE_SHIFT and
 ISA207_SIER_TYPE_MASK and remove include for "isa207-common.h"
 so that code compiles on 32 bit platform also.
 Reported-by: kernel test robot <lkp@intel.com>
 Closes: https://lore.kernel.org/oe-kbuild-all/202501180825.LpRG6wYe-lkp@intel.com/

 arch/powerpc/perf/core-book3s.c   | 20 ++++++++++++++++++++
 arch/powerpc/perf/isa207-common.c |  4 +++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 2b79171ee185..49831cd93cd3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2222,6 +2222,10 @@ static struct pmu power_pmu = {
 #define PERF_SAMPLE_ADDR_TYPE  (PERF_SAMPLE_ADDR |		\
 				PERF_SAMPLE_PHYS_ADDR |		\
 				PERF_SAMPLE_DATA_PAGE_SIZE)
+
+#define ISA207_SIER_TYPE_SHIFT	15
+#define ISA207_SIER_TYPE_MASK	(0x7ull << ISA207_SIER_TYPE_SHIFT)
+
 /*
  * A counter has overflowed; update its count and record
  * things if requested.  Note that interrupts are hard-disabled
@@ -2290,6 +2294,22 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	    is_kernel_addr(mfspr(SPRN_SIAR)))
 		record = 0;
 
+	/*
+	 * SIER[46-48] presents instruction type of the sampled instruction.
+	 * In ISA v3.0 and before values "0" and "7" are considered reserved.
+	 * In ISA v3.1, value "7" has been used to indicate "larx/stcx".
+	 * Drop the sample if "type" has reserved values for this field with a
+	 * ISA version check.
+	 */
+	if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
+			ppmu->get_mem_data_src) {
+		val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
+		if (val == 0 || (val == 7 && !cpu_has_feature(CPU_FTR_ARCH_31))) {
+			record = 0;
+			atomic64_inc(&event->lost_samples);
+		}
+	}
+
 	/*
 	 * Finally record data if requested.
 	 */
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 56301b2bc8ae..031a2b63c171 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -321,8 +321,10 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 
 	sier = mfspr(SPRN_SIER);
 	val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
-	if (val != 1 && val != 2 && !(val == 7 && cpu_has_feature(CPU_FTR_ARCH_31)))
+	if (val != 1 && val != 2 && !(val == 7 && cpu_has_feature(CPU_FTR_ARCH_31))) {
+		dsrc->val = 0;
 		return;
+	}
 
 	idx = (sier & ISA207_SIER_LDST_MASK) >> ISA207_SIER_LDST_SHIFT;
 	sub_idx = (sier & ISA207_SIER_DATA_SRC_MASK) >> ISA207_SIER_DATA_SRC_SHIFT;
-- 
2.39.3


