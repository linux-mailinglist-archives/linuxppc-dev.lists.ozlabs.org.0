Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28D23E84A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 09:49:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNHZ44ZwXzDqws
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 17:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=omKXMc7x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNHTk2XmszDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 17:45:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0777VYKW083756; Fri, 7 Aug 2020 03:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aUlNL7sr0ua7PsthmyzDvPCr3i3J9piy9BAkH+ZcaXs=;
 b=omKXMc7xADJ6av7ZYWwzKaKFvp/9fMaNOOOm0V1BqOhEXydtUq81eaeamMm/iuEYUCpI
 5MlI3N80cGxOdU8T2Jf5ooJX5wXLA47dpj+gEbrNrsPz9tNDaz6cyf8dLABmX1uv0Ldo
 3Da2ef3wNMZdm5D1Rvf8M5khcEWokhisIPH8gN9FToCci23q6j1LryvMNFMrWW/r/haF
 CeXk8tsM75HglKMmTy3+r6NPaEzGIQ2YXM277LKAeI+nrUgZfERp0m+3bxeRLh1+ho6w
 AbDZBiT9636XmE035GiBKi9c+Of6/ywRJsH0/bpEOIdmNRSd4StXWHMk06eom82MUR/F SQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32rnu9meuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 03:45:34 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0777fTOP013194;
 Fri, 7 Aug 2020 07:45:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 32mynhbwrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 07:45:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0777jUVe31195456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 07:45:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5993CAE053;
 Fri,  7 Aug 2020 07:45:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6F79AE056;
 Fri,  7 Aug 2020 07:45:26 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.45.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 07:45:26 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/2] powerpc/topology: Override cpu_smt_mask
Date: Fri,  7 Aug 2020 13:15:17 +0530
Message-Id: <20200807074517.27957-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200807074517.27957-1-srikar@linux.vnet.ibm.com>
References: <20200807074517.27957-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_02:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070051
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Power9, a pair of SMT4 cores can be presented by the firmware as a SMT8
core for backward compatibility reasons, with the fusion of two SMT4 cores.
Powerpc allows LPARs to be live migrated from Power8 to Power9.  Existing
software developed/configured for Power8, expects to see a SMT8 core.

In order to maintain userspace backward compatibility (with Power8 chips in
case of Power9) in enterprise Linux systems, the topology_sibling_cpumask
has to be set to SMT8 core.

cpu_smt_mask() should generally point to the cpu mask of the SMT4 core.
Hence override the default cpu_smt_mask() to be powerpc specific
allowing for better scheduling behaviour on Power.

schbench
(latency measured in usecs, so lesser is better)
Without patch                   With patch
Latency percentiles (usec)	Latency percentiles (usec)
	50.0000th: 34           	50.0000th: 38
	75.0000th: 47           	75.0000th: 52
	90.0000th: 54           	90.0000th: 60
	95.0000th: 57           	95.0000th: 64
	*99.0000th: 62          	*99.0000th: 72
	99.5000th: 65           	99.5000th: 75
	99.9000th: 76           	99.9000th: 3452
	min=0, max=9205         	min=0, max=9344

schbench (With Cede disabled)
Without patch                   With patch
Latency percentiles (usec) 	Latency percentiles (usec)
	50.0000th: 20           	50.0000th: 21
	75.0000th: 28           	75.0000th: 29
	90.0000th: 33           	90.0000th: 34
	95.0000th: 35           	95.0000th: 37
	*99.0000th: 40          	*99.0000th: 40
	99.5000th: 48           	99.5000th: 42
	99.9000th: 94           	99.9000th: 79
	min=0, max=791          	min=0, max=791

perf bench sched pipe
usec/ops : lesser is better
Without patch
  N           Min           Max        Median           Avg        Stddev
101      5.095113      5.595269      5.204842     5.2298776    0.10762713

5.10 - 5.15 : ##################################################   23% (24)
5.15 - 5.20 : #############################################        21% (22)
5.20 - 5.25 : ##################################################   23% (24)
5.25 - 5.30 : #########################                            11% (12)
5.30 - 5.35 : ##########                                            4% (5)
5.35 - 5.40 : ########                                              3% (4)
5.40 - 5.45 : ########                                              3% (4)
5.45 - 5.50 : ####                                                  1% (2)
5.50 - 5.55 : ##                                                    0% (1)
5.55 - 5.60 : ####                                                  1% (2)

With patch
  N           Min           Max        Median           Avg        Stddev
101      5.134675      8.524719      5.207658     5.2780985    0.34911969

5.1 - 5.5 : ##################################################   94% (95)
5.5 - 5.8 : ##                                                    3% (4)
5.8 - 6.2 :                                                       0% (1)
6.2 - 6.5 :
6.5 - 6.8 :
6.8 - 7.2 :
7.2 - 7.5 :
7.5 - 7.8 :
7.8 - 8.2 :
8.2 - 8.5 :

perf bench sched pipe (cede disabled)
usec/ops : lesser is better
Without patch
  N           Min           Max        Median           Avg        Stddev
101      7.884227     12.576538      7.956474     8.0170722    0.46159054

7.9 - 8.4 : ##################################################   99% (100)
8.4 - 8.8 :
8.8 - 9.3 :
9.3 - 9.8 :
9.8 - 10.2 :
10.2 - 10.7 :
10.7 - 11.2 :
11.2 - 11.6 :
11.6 - 12.1 :
12.1 - 12.6 :

With patch
  N           Min           Max        Median           Avg        Stddev
101      7.956021      8.217284      8.015615     8.0283866   0.049844967

7.96 - 7.98 : ######################                               12% (13)
7.98 - 8.01 : ##################################################   28% (29)
8.01 - 8.03 : ####################################                 20% (21)
8.03 - 8.06 : #########################                            14% (15)
8.06 - 8.09 : ######################                               12% (13)
8.09 - 8.11 : ######                                                3% (4)
8.11 - 8.14 : ###                                                   1% (2)
8.14 - 8.17 : ###                                                   1% (2)
8.17 - 8.19 :
8.19 - 8.22 : #                                                     0% (1)

Observations: With the patch, the initial run/iteration takes a slight
longer time. This can be attributed to the fact that now we pick a CPU
from a idle core which could be sleep mode. Once we remove the cede,
state the numbers improve in favour of the patch.

ebizzy:
transactions per second (higher is better)
without patch
  N           Min           Max        Median           Avg        Stddev
100       1018433       1304470       1193208     1182315.7     60018.733

1018433 - 1047037 : ######                                                3% (3)
1047037 - 1075640 : ########                                              4% (4)
1075640 - 1104244 : ########                                              4% (4)
1104244 - 1132848 : ###############                                       7% (7)
1132848 - 1161452 : ####################################                 17% (17)
1161452 - 1190055 : ##########################                           12% (12)
1190055 - 1218659 : #############################################        21% (21)
1218659 - 1247263 : ##################################################   23% (23)
1247263 - 1275866 : ########                                              4% (4)
1275866 - 1304470 : ########                                              4% (4)

with patch
  N           Min           Max        Median           Avg        Stddev
100        967014       1292938       1208819     1185281.8     69815.851

 967014 - 999606  : ##                                                    1% (1)
 999606 - 1032199 : ##                                                    1% (1)
1032199 - 1064791 : ############                                          6% (6)
1064791 - 1097384 : ##########                                            5% (5)
1097384 - 1129976 : ##################                                    9% (9)
1129976 - 1162568 : ####################                                 10% (10)
1162568 - 1195161 : ##########################                           13% (13)
1195161 - 1227753 : ############################################         22% (22)
1227753 - 1260346 : ##################################################   25% (25)
1260346 - 1292938 : ##############                                        7% (7)

Observations: Not much changes, ebizzy is not much impacted.

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
Changelog v1->v2:
	Modified commit msg as per mailing list discussion.
	Added performance numbers

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
index 9cd0765633c5..bb06aa875131 100644
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

