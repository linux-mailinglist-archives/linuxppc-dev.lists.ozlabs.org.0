Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6D23B34E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 05:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLL9K4bgGzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 13:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLL7X3dFlzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 13:38:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0743blDc134506; Mon, 3 Aug 2020 23:38:02 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pxt518jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 23:37:58 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0743EnHM018095;
 Tue, 4 Aug 2020 03:33:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 32n0189qww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 03:33:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0743XYmd32440750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 03:33:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A173F11C04A;
 Tue,  4 Aug 2020 03:33:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3376111C04C;
 Tue,  4 Aug 2020 03:33:31 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.77.201.172])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 03:33:30 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 2/2] powerpc/topology: Override cpu_smt_mask
Date: Tue,  4 Aug 2020 09:03:07 +0530
Message-Id: <20200804033307.76111-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_15:2020-08-03,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040025
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Power9 a pair of cores can be presented by the firmware as a big-core
for backward compatibility reasons, with 4 threads per (small) core and 8
threads per big-core. cpu_smt_mask() should generally point to the cpu mask
of the (small)core.

In order to maintain userspace backward compatibility (with Power8 chips in
case of Power9) in enterprise Linux systems, the topology_sibling_cpumask
has to be set to big-core. Hence override the default cpu_smt_mask() to be
powerpc specific allowing for better scheduling behaviour on Power.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/cputhreads.h |  1 -
 arch/powerpc/include/asm/smp.h        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cputhreads.h b/arch/powerpc/include/asm/cputhreads.h
index deb99fd6e060..98c8bd155bf9 100644
--- a/arch/powerpc/include/asm/cputhreads.h
+++ b/arch/powerpc/include/asm/cputhreads.h
@@ -23,7 +23,6 @@
 extern int threads_per_core;
 extern int threads_per_subcore;
 extern int threads_shift;
-extern bool has_big_cores;
 extern cpumask_t threads_core_mask;
 #else
 #define threads_per_core	1
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 9cd0765633c5..d4bc28accb28 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -131,6 +131,19 @@ static inline struct cpumask *cpu_smallcore_mask(int cpu)
 
 extern int cpu_to_core_id(int cpu);
 
+extern bool has_big_cores;
+
+#define cpu_smt_mask cpu_smt_mask
+#ifdef CONFIG_SCHED_SMT
+static inline const struct cpumask *cpu_smt_mask(int cpu)
+{
+	if (has_big_cores)
+		return per_cpu(cpu_smallcore_map, cpu);
+
+	return per_cpu(cpu_sibling_map, cpu);
+}
+#endif /* CONFIG_SCHED_SMT */
+
 /* Since OpenPIC has only 4 IPIs, we use slightly different message numbers.
  *
  * Make sure this matches openpic_request_IPIs in open_pic.c, or what shows up
-- 
2.18.2

