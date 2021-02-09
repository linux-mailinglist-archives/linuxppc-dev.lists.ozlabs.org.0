Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13563314C23
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 10:54:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZdXC1bLtzDsTx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 20:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jMWC/LA2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdVY3v7MzDsNq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:52:52 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1199lok4108524; Tue, 9 Feb 2021 04:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kH3TDlVRoFChjlDFNPVt5B1BnTmQlJ6iXHCozIJOtq8=;
 b=jMWC/LA22g9ddBpsLL9QtxP52x+sEd940jpJ+yHUB2eGijacEzwkYltL63iBryAgi5LS
 eMJUjPbEt/8VIDRCqICqlBMU2Ydh4hcrCBQZ8fWcPjn0mUblWhTEI/yUOuMT9HvX3ehT
 yietjtV3Z0eVQC436QeFAkZZ3vtFyP6z+sKehXKZpgAoUySchQOYAPvBFhg6TyMmBSot
 qJ27b+L7xL19TpdwcSG+ReB0SQjVGOCC/9zSJvhaeT8qg/R664s+H0miZ2h55B+vTAG6
 x+LJHPZZJwjF0vuZ8qND0F8SV8P+Y/YNgghmMHGFjkO1D+3rpF34dPFFy9NiAPdmjQRN hA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36kr30g2j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 04:52:45 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1199DpNs027680;
 Tue, 9 Feb 2021 09:52:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 36hjr81k8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 09:52:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1199qfqL22806906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 09:52:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE6442049;
 Tue,  9 Feb 2021 09:52:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0315A4203F;
 Tue,  9 Feb 2021 09:52:40 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.94.112])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Feb 2021 09:52:39 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3] powerpc/perf: Adds support for programming of Thresholding
 in P10
Date: Tue,  9 Feb 2021 15:22:34 +0530
Message-Id: <20210209095234.837356-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090044
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thresholding, a performance monitoring unit feature, can be
used to identify marked instructions which take more than
expected cycles between start event and end event.
Threshold compare (thresh_cmp) bits are programmed in MMCRA
register. In Power9, thresh_cmp bits were part of the
event code. But in case of P10, thresh_cmp are not part of
event code due to inclusion of MMCR3 bits.

Patch here adds an option to use attr.config1 variable
to be used to pass thresh_cmp value to be programmed in
MMCRA register. A new ppmu flag called PPMU_HAS_ATTR_CONFIG1
has been added and this flag is used to notify the use of
attr.config1 variable.

Patch has extended the parameter list of 'compute_mmcr',
to include power_pmu's 'flags' element and parameter list of
get_constraint to include attr.config1 value. It also extend
parameter list of power_check_constraints inorder to pass
perf_event list.

As stated by commit ef0e3b650f8d ("powerpc/perf: Fix Threshold
Event Counter Multiplier width for P10"), constraint bits for
thresh_cmp is also needed to be increased to 11 bits, which is
handled as part of this patch. We added bit number 53 as part
of constraint bits of thresh_cmp for power10 to make it an
11 bit field.

Updated layout for p10:

/*
 * Layout of constraint bits:
 *
 *        60        56        52        48        44        40        36        32
 * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
 *   [   fab_match   ]         [       thresh_cmp      ] [   thresh_ctl    ] [   ]
 *                                          |                                  |
 *                           [  thresh_cmp bits for p10]           thresh_sel -*
 *
 *        28        24        20        16        12         8         4         0
 * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
 *               [ ] |   [ ] |  [  sample ]   [     ]   [6] [5]   [4] [3]   [2] [1]
 *                |  |    |  |                  |
 *      BHRB IFM -*  |    |  |*radix_scope      |      Count of events for each PMC.
 *              EBB -*    |                     |        p1, p2, p3, p4, p5, p6.
 *      L1 I/D qualifier -*                     |
 *                     nc - number of counters -*
 *
 * The PMC fields P1..P6, and NC, are adder fields. As we accumulate constraints
 * we want the low bit of each field to be added to any existing value.
 *
 * Everything else is a value field.
 */

Result:
command#: cat /sys/devices/cpu/format/thresh_cmp
config1:0-17

ex. usage:

command#: perf record -I --weight -d  -e
	 cpu/event=0x67340101EC,thresh_cmp=500/ ./ebizzy -S 2 -t 1 -s 4096
1826636 records/s
real  2.00 s
user  2.00 s
sys   0.00 s
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.038 MB perf.data (61 samples) ]

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  5 +-
 arch/powerpc/perf/core-book3s.c              | 15 +++--
 arch/powerpc/perf/isa207-common.c            | 67 +++++++++++++++++---
 arch/powerpc/perf/isa207-common.h            | 15 +++--
 arch/powerpc/perf/mpc7450-pmu.c              |  5 +-
 arch/powerpc/perf/power10-pmu.c              |  4 +-
 arch/powerpc/perf/power5+-pmu.c              |  5 +-
 arch/powerpc/perf/power5-pmu.c               |  5 +-
 arch/powerpc/perf/power6-pmu.c               |  5 +-
 arch/powerpc/perf/power7-pmu.c               |  5 +-
 arch/powerpc/perf/ppc970-pmu.c               |  5 +-
 11 files changed, 102 insertions(+), 34 deletions(-)

---
Changelog
v2 -> v3
- Removed field 'events_config1' from struct cpu_hw_events
  and directly using attr.config1 field instead as suggested
  by Michael Ellerman.
- Extended the parameter list of 'power_check_constraints' function
  to also pass perf_event struct array as we need to access
  event's attr.config1 value. And since when we call
  'power_check_constraints' from 'power_pmu_event_init' the
  cpu_hw_events structure not get updated.

v1 -> v2
- Add new function 'p10_thresh_cmp_val' to evaluate thresh_cmp
  value.
- Extended the parameter list of get_constraint function
  to include attr.config1 value.
- Added bit number 53 as part of constraint bits of thresh_cmp
  to make it a 11 bit field for power10.
- Updated PPMU_HAS_ATTR_CONFIG1 value to 0x00000800
- Add new field 'events_config1' in struct cpu_hw_events and also
  update this field in all required functions accordingly.
---

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 3b7baba01c92..00e7e671bb4b 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -36,9 +36,9 @@ struct power_pmu {
 	unsigned long	test_adder;
 	int		(*compute_mmcr)(u64 events[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[]);
+				struct perf_event *pevents[], u32 flags);
 	int		(*get_constraint)(u64 event_id, unsigned long *mskp,
-				unsigned long *valp);
+				unsigned long *valp, u64 event_config1);
 	int		(*get_alternatives)(u64 event_id, unsigned int flags,
 				u64 alt[]);
 	void		(*get_mem_data_src)(union perf_mem_data_src *dsrc,
@@ -83,6 +83,7 @@ struct power_pmu {
 #define PPMU_NO_SIAR		0x00000100 /* Do not use SIAR */
 #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
 #define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
+#define PPMU_HAS_ATTR_CONFIG1	0x00000800 /* Using config1 attribute */
 
 /*
  * Values for flags to get_alternatives()
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 28206b1fe172..85073d9e79fe 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -915,7 +915,7 @@ void perf_event_print_debug(void)
  */
 static int power_check_constraints(struct cpu_hw_events *cpuhw,
 				   u64 event_id[], unsigned int cflags[],
-				   int n_ev)
+				   int n_ev, struct perf_event **event)
 {
 	unsigned long mask, value, nv;
 	unsigned long smasks[MAX_HWEVENTS], svalues[MAX_HWEVENTS];
@@ -938,7 +938,7 @@ static int power_check_constraints(struct cpu_hw_events *cpuhw,
 			event_id[i] = cpuhw->alternatives[i][0];
 		}
 		if (ppmu->get_constraint(event_id[i], &cpuhw->amasks[i][0],
-					 &cpuhw->avalues[i][0]))
+					 &cpuhw->avalues[i][0], event[i]->attr.config1))
 			return -1;
 	}
 	value = mask = 0;
@@ -973,7 +973,8 @@ static int power_check_constraints(struct cpu_hw_events *cpuhw,
 		for (j = 1; j < n_alt[i]; ++j)
 			ppmu->get_constraint(cpuhw->alternatives[i][j],
 					     &cpuhw->amasks[i][j],
-					     &cpuhw->avalues[i][j]);
+					     &cpuhw->avalues[i][j],
+					     event[i]->attr.config1);
 	}
 
 	/* enumerate all possibilities and see if any will work */
@@ -1391,7 +1392,7 @@ static void power_pmu_enable(struct pmu *pmu)
 	memset(&cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
 
 	if (ppmu->compute_mmcr(cpuhw->events, cpuhw->n_events, hwc_index,
-			       &cpuhw->mmcr, cpuhw->event)) {
+			       &cpuhw->mmcr, cpuhw->event, ppmu->flags)) {
 		/* shouldn't ever get here */
 		printk(KERN_ERR "oops compute_mmcr failed\n");
 		goto out;
@@ -1579,7 +1580,7 @@ static int power_pmu_add(struct perf_event *event, int ef_flags)
 
 	if (check_excludes(cpuhw->event, cpuhw->flags, n0, 1))
 		goto out;
-	if (power_check_constraints(cpuhw, cpuhw->events, cpuhw->flags, n0 + 1))
+	if (power_check_constraints(cpuhw, cpuhw->events, cpuhw->flags, n0 + 1, cpuhw->event))
 		goto out;
 	event->hw.config = cpuhw->events[n0];
 
@@ -1789,7 +1790,7 @@ static int power_pmu_commit_txn(struct pmu *pmu)
 	n = cpuhw->n_events;
 	if (check_excludes(cpuhw->event, cpuhw->flags, 0, n))
 		return -EAGAIN;
-	i = power_check_constraints(cpuhw, cpuhw->events, cpuhw->flags, n);
+	i = power_check_constraints(cpuhw, cpuhw->events, cpuhw->flags, n, cpuhw->event);
 	if (i < 0)
 		return -EAGAIN;
 
@@ -2027,7 +2028,7 @@ static int power_pmu_event_init(struct perf_event *event)
 	local_irq_save(irq_flags);
 	cpuhw = this_cpu_ptr(&cpu_hw_events);
 
-	err = power_check_constraints(cpuhw, events, cflags, n + 1);
+	err = power_check_constraints(cpuhw, events, cflags, n + 1, ctrs);
 
 	if (has_branch_stack(event)) {
 		u64 bhrb_filter = -1;
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 6ab5b272090a..e4f577da33d8 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -108,12 +108,57 @@ static void mmcra_sdar_mode(u64 event, unsigned long *mmcra)
 		*mmcra |= MMCRA_SDAR_MODE_TLB;
 }
 
+static u64 p10_thresh_cmp_val(u64 value)
+{
+	int exp = 0;
+	u64 result = value;
+
+	if (!value)
+		return value;
+
+	/*
+	 * Incase of P10, thresh_cmp value is not part of raw event code
+	 * and provided via attr.config1 parameter. To program threshold in MMCRA,
+	 * take a 18 bit number N and shift right 2 places and increment
+	 * the exponent E by 1 until the upper 10 bits of N are zero.
+	 * Write E to the threshold exponent and write the lower 8 bits of N
+	 * to the threshold mantissa.
+	 * The max threshold that can be written is 261120.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		if (value > 261120)
+			value = 261120;
+		while ((64 - __builtin_clzl(value)) > 8) {
+			exp++;
+			value >>= 2;
+		}
+
+		/*
+		 * Note that it is invalid to write a mantissa with the
+		 * upper 2 bits of mantissa being zero, unless the
+		 * exponent is also zero.
+		 */
+		if (!(value & 0xC0) && exp)
+			result = 0;
+		else
+			result = (exp << 8) | value;
+	}
+	return result;
+}
+
 static u64 thresh_cmp_val(u64 value)
 {
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		value = p10_thresh_cmp_val(value);
+
+	/*
+	 * Since location of threshold compare bits in MMCRA
+	 * is different for p8, using different shift value.
+	 */
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return value << p9_MMCRA_THR_CMP_SHIFT;
-
-	return value << MMCRA_THR_CMP_SHIFT;
+	else
+		return value << MMCRA_THR_CMP_SHIFT;
 }
 
 static unsigned long combine_from_event(u64 event)
@@ -141,13 +186,13 @@ static bool is_thresh_cmp_valid(u64 event)
 {
 	unsigned int cmp, exp;
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		return p10_thresh_cmp_val(event) != 0;
+
 	/*
 	 * Check the mantissa upper two bits are not zero, unless the
 	 * exponent is also zero. See the THRESH_CMP_MANTISSA doc.
-	 * Power10: thresh_cmp is replaced by l2_l3 event select.
 	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		return false;
 
 	cmp = (event >> EVENT_THR_CMP_SHIFT) & EVENT_THR_CMP_MASK;
 	exp = cmp >> 7;
@@ -256,7 +301,7 @@ void isa207_get_mem_weight(u64 *weight)
 		*weight = mantissa << (2 * exp);
 }
 
-int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
+int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp, u64 event_config1)
 {
 	unsigned int unit, pmc, cache, ebb;
 	unsigned long mask, value;
@@ -355,9 +400,11 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 	}
 
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		if (event_is_threshold(event)) {
+		if (event_is_threshold(event) && is_thresh_cmp_valid(event_config1)) {
 			mask  |= CNST_THRESH_CTL_SEL_MASK;
 			value |= CNST_THRESH_CTL_SEL_VAL(event >> EVENT_THRESH_SHIFT);
+			mask  |= p10_CNST_THRESH_CMP_MASK;
+			value |= p10_CNST_THRESH_CMP_VAL(p10_thresh_cmp_val(event_config1));
 		}
 	} else if (cpu_has_feature(CPU_FTR_ARCH_300))  {
 		if (event_is_threshold(event) && is_thresh_cmp_valid(event)) {
@@ -411,7 +458,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 
 int isa207_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[], u32 flags)
 {
 	unsigned long mmcra, mmcr1, mmcr2, unit, combine, psel, cache, val;
 	unsigned long mmcr3;
@@ -504,6 +551,10 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 				val = (event[i] >> EVENT_THR_CMP_SHIFT) &
 					EVENT_THR_CMP_MASK;
 				mmcra |= thresh_cmp_val(val);
+			} else if (flags & PPMU_HAS_ATTR_CONFIG1) {
+				val = (pevents[i]->attr.config1 >> p10_EVENT_THR_CMP_SHIFT) &
+					p10_EVENT_THR_CMP_MASK;
+				mmcra |= thresh_cmp_val(val);
 			}
 		}
 
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 454b32c31440..1af0e8c97ac7 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -105,6 +105,10 @@
 #define p10_EVENT_RADIX_SCOPE_QUAL_MASK	0x1
 #define p10_MMCR1_RADIX_SCOPE_QUAL_SHIFT	45
 
+/* Event Threshold Compare bit constant for power10 in config1 attribute */
+#define p10_EVENT_THR_CMP_SHIFT        0
+#define p10_EVENT_THR_CMP_MASK 0x3FFFFull
+
 #define p10_EVENT_VALID_MASK		\
 	((p10_SDAR_MODE_MASK   << p10_SDAR_MODE_SHIFT		|	\
 	(p10_EVENT_THRESH_MASK  << EVENT_THRESH_SHIFT)		|	\
@@ -124,8 +128,8 @@
  *        60        56        52        48        44        40        36        32
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
  *   [   fab_match   ]         [       thresh_cmp      ] [   thresh_ctl    ] [   ]
- *                                                                             |
- *                                                                 thresh_sel -*
+ *                                          |                                  |
+ *                           [  thresh_cmp bits for p10]           thresh_sel -*
  *
  *        28        24        20        16        12         8         4         0
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
@@ -152,6 +156,9 @@
 #define CNST_THRESH_CTL_SEL_VAL(v)	(((v) & 0x7ffull) << 32)
 #define CNST_THRESH_CTL_SEL_MASK	CNST_THRESH_CTL_SEL_VAL(0x7ff)
 
+#define p10_CNST_THRESH_CMP_VAL(v) (((v) & 0x7ffull) << 43)
+#define p10_CNST_THRESH_CMP_MASK   p10_CNST_THRESH_CMP_VAL(0x7ff)
+
 #define CNST_EBB_VAL(v)		(((v) & EVENT_EBB_MASK) << 24)
 #define CNST_EBB_MASK		CNST_EBB_VAL(EVENT_EBB_MASK)
 
@@ -262,10 +269,10 @@
 #define PH(a, b)			(P(LVL, HIT) | P(a, b))
 #define PM(a, b)			(P(LVL, MISS) | P(a, b))
 
-int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp);
+int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp, u64 event_config1);
 int isa207_compute_mmcr(u64 event[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[]);
+				struct perf_event *pevents[], u32 flags);
 void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr);
 int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 					const unsigned int ev_alt[][MAX_ALT]);
diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 1919e9df9165..e39b15b79a83 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -148,7 +148,7 @@ static u32 classbits[N_CLASSES - 1][2] = {
 };
 
 static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
-				  unsigned long *valp)
+				  unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, class;
 	u32 mask, value;
@@ -258,7 +258,8 @@ static const u32 pmcsel_mask[N_COUNTER] = {
  */
 static int mpc7450_compute_mmcr(u64 event[], int n_ev, unsigned int hwc[],
 				struct mmcr_regs *mmcr,
-				struct perf_event *pevents[])
+				struct perf_event *pevents[],
+				u32 flags __maybe_unused)
 {
 	u8 event_index[N_CLASSES][N_COUNTER];
 	int n_classevent[N_CLASSES];
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 79e0206ca454..a901c1348cad 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -216,6 +216,7 @@ PMU_FORMAT_ATTR(invert_bit,     "config:47");
 PMU_FORMAT_ATTR(src_mask,       "config:48-53");
 PMU_FORMAT_ATTR(src_match,      "config:54-59");
 PMU_FORMAT_ATTR(radix_scope,	"config:9");
+PMU_FORMAT_ATTR(thresh_cmp,     "config1:0-17");
 
 static struct attribute *power10_pmu_format_attr[] = {
 	&format_attr_event.attr,
@@ -236,6 +237,7 @@ static struct attribute *power10_pmu_format_attr[] = {
 	&format_attr_src_mask.attr,
 	&format_attr_src_match.attr,
 	&format_attr_radix_scope.attr,
+	&format_attr_thresh_cmp.attr,
 	NULL,
 };
 
@@ -550,7 +552,7 @@ static struct power_pmu power10_pmu = {
 	.get_mem_weight		= isa207_get_mem_weight,
 	.disable_pmc		= isa207_disable_pmc,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S |
-				  PPMU_ARCH_31,
+				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
 	.n_generic		= ARRAY_SIZE(power10_generic_events),
 	.generic_events		= power10_generic_events,
 	.cache_events		= &power10_cache_events,
diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index 3e64b4a1511f..18732267993a 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
@@ -132,7 +132,7 @@ static unsigned long unit_cons[PM_LASTUNIT+1][2] = {
 };
 
 static int power5p_get_constraint(u64 event, unsigned long *maskp,
-				  unsigned long *valp)
+				  unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, byte, unit, sh;
 	int bit, fmask;
@@ -451,7 +451,8 @@ static int power5p_marked_instr_event(u64 event)
 
 static int power5p_compute_mmcr(u64 event[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[])
+				struct perf_event *pevents[],
+				u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = 0;
diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index 017bb19b73fb..cb611c1e7abe 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -136,7 +136,7 @@ static unsigned long unit_cons[PM_LASTUNIT+1][2] = {
 };
 
 static int power5_get_constraint(u64 event, unsigned long *maskp,
-				 unsigned long *valp)
+				 unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, byte, unit, sh;
 	int bit, fmask;
@@ -382,7 +382,8 @@ static int power5_marked_instr_event(u64 event)
 
 static int power5_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[],
+			       u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 189974478e9f..69ef38216418 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -173,7 +173,8 @@ static int power6_marked_instr_event(u64 event)
  * Assign PMC numbers and compute MMCR1 value for a set of events
  */
 static int p6_compute_mmcr(u64 event[], int n_ev,
-			   unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event *pevents[])
+			   unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event *pevents[],
+			   u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
@@ -266,7 +267,7 @@ static int p6_compute_mmcr(u64 event[], int n_ev,
  *	32-34	select field: nest (subunit) event selector
  */
 static int p6_get_constraint(u64 event, unsigned long *maskp,
-			     unsigned long *valp)
+			     unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, byte, sh, subunit;
 	unsigned long mask = 0, value = 0;
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index bacfab104a1a..894c17f9a762 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -81,7 +81,7 @@ enum {
  */
 
 static int power7_get_constraint(u64 event, unsigned long *maskp,
-				 unsigned long *valp)
+				 unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, sh, unit;
 	unsigned long mask = 0, value = 0;
@@ -245,7 +245,8 @@ static int power7_marked_instr_event(u64 event)
 
 static int power7_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[],
+			       u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index 7d78df97f272..1f8263785286 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -190,7 +190,7 @@ static unsigned long unit_cons[PM_LASTUNIT+1][2] = {
 };
 
 static int p970_get_constraint(u64 event, unsigned long *maskp,
-			       unsigned long *valp)
+			       unsigned long *valp, u64 event_config1 __maybe_unused)
 {
 	int pmc, byte, unit, sh, spcsel;
 	unsigned long mask = 0, value = 0;
@@ -256,7 +256,8 @@ static int p970_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 
 static int p970_compute_mmcr(u64 event[], int n_ev,
 			     unsigned int hwc[], struct mmcr_regs *mmcr,
-			     struct perf_event *pevents[])
+			     struct perf_event *pevents[],
+			     u32 flags __maybe_unused)
 {
 	unsigned long mmcr0 = 0, mmcr1 = 0, mmcra = 0;
 	unsigned int pmc, unit, byte, psel;
-- 
2.26.2

