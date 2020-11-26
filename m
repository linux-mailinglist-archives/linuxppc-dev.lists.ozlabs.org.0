Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C42C59AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 17:57:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChkST38QvzDrP1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 03:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dpkRrnZ7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQL4gsWzDrNW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGdFUp043464; Thu, 26 Nov 2020 11:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=VVmBBZI+LG0A+RhlMa/zxCplTMbiWXEro4ILRttMoXw=;
 b=dpkRrnZ7NlPjq+y7Q07KyAOl7dhoSIxII9n6LGb10ws8dDhvYcCy1EDvi4KHyjM/9RoO
 A6mT75XTj0ecMBsZYeeBrBJHtMFhFd9bV5YdiaZAdnK7KV4qq9zVl/5qp1pFEOfxm6Uy
 UXNbs69rS0EeNAT5O8xl3U1j1CRoWjv6iTgUoqWza/NBn/H+8tPjXd8JsBkpOQ8QjNWO
 dYEgc5xsR77RHKW590Ebe8Kd38GNkQKRmB6PoHQ0L+IdonxBsZEoeS/7RWVmQfXJxslq
 E0YUu1FupZtdTysU6J3ANvgQ3z9gv04pboBT6Gb8h2wldyK+Q/qZRSY+dPRSeAKi+GnL yA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352ccepwh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:55:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGsEkQ030534;
 Thu, 26 Nov 2020 16:54:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8hvut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:54:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQGstVS53739910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:54:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738DC4C050;
 Thu, 26 Nov 2020 16:54:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 090304C046;
 Thu, 26 Nov 2020 16:54:54 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:54:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 1/7] powerpc/perf: Fix to update radix_scope_qual in power10
Date: Thu, 26 Nov 2020 11:54:38 -0500
Message-Id: <1606409684-1589-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 lowpriorityscore=0 bulkscore=0 mlxlogscore=956 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260097
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

power10 uses bit 9 of the raw event code as RADIX_SCOPE_QUAL.
This bit is used for enabling the radix process events.
Patch fixes the PMU counter support functions to program bit
18 of MMCR1 ( Monitor Mode Control Register1 ) with the
RADIX_SCOPE_QUAL bit value. Since this field is not per-pmc,
add this to PMU group constraints to make sure events in a
group will have same bit value for this field. Use bit 21 as
constraint bit field for radix_scope_qual. Patch also updates
the power10 raw event encoding layout information, format field
and constraints bit layout to include the radix_scope_qual bit.

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 12 ++++++++++++
 arch/powerpc/perf/isa207-common.h | 13 ++++++++++---
 arch/powerpc/perf/power10-pmu.c   | 11 +++++++----
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 2848904..f57f54f 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -339,6 +339,11 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 		value |= CNST_L1_QUAL_VAL(cache);
 	}
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mask |= CNST_RADIX_SCOPE_GROUP_MASK;
+		value |= CNST_RADIX_SCOPE_GROUP_VAL(event >> p10_EVENT_RADIX_SCOPE_QUAL_SHIFT);
+	}
+
 	if (is_event_marked(event)) {
 		mask  |= CNST_SAMPLE_MASK;
 		value |= CNST_SAMPLE_VAL(event >> EVENT_SAMPLE_SHIFT);
@@ -456,6 +461,13 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 			}
 		}
 
+		/* Set RADIX_SCOPE_QUAL bit */
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			val = (event[i] >> p10_EVENT_RADIX_SCOPE_QUAL_SHIFT) &
+				p10_EVENT_RADIX_SCOPE_QUAL_MASK;
+			mmcr1 |= val << p10_MMCR1_RADIX_SCOPE_QUAL_SHIFT;
+		}
+
 		if (is_event_marked(event[i])) {
 			mmcra |= MMCRA_SAMPLE_ENABLE;
 
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 7025de5..dc9c3d2 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -101,6 +101,9 @@
 #define p10_EVENT_CACHE_SEL_MASK	0x3ull
 #define p10_EVENT_MMCR3_MASK		0x7fffull
 #define p10_EVENT_MMCR3_SHIFT		45
+#define p10_EVENT_RADIX_SCOPE_QUAL_SHIFT	9
+#define p10_EVENT_RADIX_SCOPE_QUAL_MASK	0x1
+#define p10_MMCR1_RADIX_SCOPE_QUAL_SHIFT	45
 
 #define p10_EVENT_VALID_MASK		\
 	((p10_SDAR_MODE_MASK   << p10_SDAR_MODE_SHIFT		|	\
@@ -112,6 +115,7 @@
 	(p9_EVENT_COMBINE_MASK << p9_EVENT_COMBINE_SHIFT)	|	\
 	(p10_EVENT_MMCR3_MASK  << p10_EVENT_MMCR3_SHIFT)	|	\
 	(EVENT_MARKED_MASK     << EVENT_MARKED_SHIFT)		|	\
+	(p10_EVENT_RADIX_SCOPE_QUAL_MASK << p10_EVENT_RADIX_SCOPE_QUAL_SHIFT)	|	\
 	 EVENT_LINUX_MASK					|	\
 	EVENT_PSEL_MASK))
 /*
@@ -125,9 +129,9 @@
  *
  *        28        24        20        16        12         8         4         0
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
- *               [ ] |   [ ]   [  sample ]   [     ]   [6] [5]   [4] [3]   [2] [1]
- *                |  |    |                     |
- *      BHRB IFM -*  |    |                     |      Count of events for each PMC.
+ *               [ ] |   [ ] |  [  sample ]   [     ]   [6] [5]   [4] [3]   [2] [1]
+ *                |  |    |  |                  |
+ *      BHRB IFM -*  |    |  |*radix_scope      |      Count of events for each PMC.
  *              EBB -*    |                     |        p1, p2, p3, p4, p5, p6.
  *      L1 I/D qualifier -*                     |
  *                     nc - number of counters -*
@@ -165,6 +169,9 @@
 #define CNST_L2L3_GROUP_VAL(v)	(((v) & 0x1full) << 55)
 #define CNST_L2L3_GROUP_MASK	CNST_L2L3_GROUP_VAL(0x1f)
 
+#define CNST_RADIX_SCOPE_GROUP_VAL(v)	(((v) & 0x1ull) << 21)
+#define CNST_RADIX_SCOPE_GROUP_MASK	CNST_RADIX_SCOPE_GROUP_VAL(1)
+
 /*
  * For NC we are counting up to 4 events. This requires three bits, and we need
  * the fifth event to overflow and set the 4th bit. To achieve that we bias the
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index a01e87f..88c5430 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -23,10 +23,10 @@
  *
  *        28        24        20        16        12         8         4         0
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
- *   [   ] [  sample ]   [ ] [ ]   [ pmc ]   [unit ]   [ ]   m   [    pmcxsel    ]
- *     |        |        |    |                        |     |
- *     |        |        |    |                        |     *- mark
- *     |        |        |    *- L1/L2/L3 cache_sel    |
+ *   [   ] [  sample ]   [ ] [ ]   [ pmc ]   [unit ]   [ ] |  m   [    pmcxsel    ]
+ *     |        |        |    |                        |   |  |
+ *     |        |        |    |                        |   |  *- mark
+ *     |        |        |    *- L1/L2/L3 cache_sel    |   |*-radix_scope_qual
  *     |        |        sdar_mode                     |
  *     |        *- sampling mode for marked events     *- combine
  *     |
@@ -59,6 +59,7 @@
  *
  * MMCR1[16] = cache_sel[0]
  * MMCR1[17] = cache_sel[1]
+ * MMCR1[18] = radix_scope_qual
  *
  * if mark:
  *	MMCRA[63]    = 1		(SAMPLE_ENABLE)
@@ -175,6 +176,7 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 PMU_FORMAT_ATTR(invert_bit,     "config:47");
 PMU_FORMAT_ATTR(src_mask,       "config:48-53");
 PMU_FORMAT_ATTR(src_match,      "config:54-59");
+PMU_FORMAT_ATTR(radix_scope,	"config:9");
 
 static struct attribute *power10_pmu_format_attr[] = {
 	&format_attr_event.attr,
@@ -194,6 +196,7 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	&format_attr_invert_bit.attr,
 	&format_attr_src_mask.attr,
 	&format_attr_src_match.attr,
+	&format_attr_radix_scope.attr,
 	NULL,
 };
 
-- 
1.8.3.1

