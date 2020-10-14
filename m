Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F1E28DBF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 10:47:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB5dH3nhbzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 19:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dbB4prEZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB5Zw5TDMzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 19:45:12 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E8WiHo062484; Wed, 14 Oct 2020 04:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KxAY9x1UVSRIfjZ4HkKwAMXtZHwEybQOdLdsqyqVa/E=;
 b=dbB4prEZ4gUuhpM6sAcix9pgs5OEy1YK7enek9G/zqnXucn7cwx956zognNjpD33GKmk
 /pvTnlRhAA//+xqjk6RfJj/+HYp2BWBNsoKCCSzkdcpog/Kax3qh3yykleg127tZy8pt
 sBt8l5RcBI9/PRoSQn3+SgfKRShny8YIw1qQor/a8ktzVpbw7o03EG/jR9aNwQlBLVBA
 6lWhZ2wIAH2rGXwrxdeYqY/ZOA9Ke6qT2LtlB+rifXeBw7iQGAEQvRnfR0vwl0pI75ge
 fkkWfKOGmwd0/gThnGtCawGxiSMv6DQmX5BeasS5xbgumqGGU4cFjKKopiHOEhL9rm7N KQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345wwq8g8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 04:45:04 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E8gisb009654;
 Wed, 14 Oct 2020 08:45:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3434k83y3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 08:45:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E8ixPr33292650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 08:45:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDC9B42042;
 Wed, 14 Oct 2020 08:44:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6094242041;
 Wed, 14 Oct 2020 08:44:58 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.34.55])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 08:44:58 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Add support for programming of Thresholding in
 P10
Date: Wed, 14 Oct 2020 14:14:42 +0530
Message-Id: <20201014084442.168943-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=1 phishscore=0 mlxlogscore=997 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010140057
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
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
attr.config1 variable. Secondly, thresh_cmp bits are not
part of the group constraints.

Patch has extended the parameter list of 'compute_mmcr',
to include power_pmu's 'flags' element.

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

Signed-off-by: Kajol Jain<kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  4 +-
 arch/powerpc/perf/core-book3s.c              |  2 +-
 arch/powerpc/perf/isa207-common.c            | 54 ++++++++++++++++++--
 arch/powerpc/perf/isa207-common.h            |  6 ++-
 arch/powerpc/perf/mpc7450-pmu.c              |  3 +-
 arch/powerpc/perf/power10-pmu.c              |  4 +-
 arch/powerpc/perf/power5+-pmu.c              |  3 +-
 arch/powerpc/perf/power5-pmu.c               |  3 +-
 arch/powerpc/perf/power6-pmu.c               |  3 +-
 arch/powerpc/perf/power7-pmu.c               |  3 +-
 arch/powerpc/perf/ppc970-pmu.c               |  3 +-
 11 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index f6acabb6c9be..566e41d4ff6a 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -34,9 +34,10 @@ struct power_pmu {
 	int		max_alternatives;
 	unsigned long	add_fields;
 	unsigned long	test_adder;
+	/* TODO: parameter list is growing and should consider folding all this to a struct */
 	int		(*compute_mmcr)(u64 events[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[]);
+				struct perf_event *pevents[], u32 flags);
 	int		(*get_constraint)(u64 event_id, unsigned long *mskp,
 				unsigned long *valp);
 	int		(*get_alternatives)(u64 event_id, unsigned int flags,
@@ -82,6 +83,7 @@ struct power_pmu {
 #define PPMU_ARCH_207S		0x00000080 /* PMC is architecture v2.07S */
 #define PPMU_NO_SIAR		0x00000100 /* Do not use SIAR */
 #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
+#define PPMU_HAS_ATTR_CONFIG1	0x00000400 /* Using config1 attribute */
 
 /*
  * Values for flags to get_alternatives()
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cba1494..e4c817f64566 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1356,7 +1356,7 @@ static void power_pmu_enable(struct pmu *pmu)
 	memset(&cpuhw->mmcr, 0, sizeof(cpuhw->mmcr));
 
 	if (ppmu->compute_mmcr(cpuhw->events, cpuhw->n_events, hwc_index,
-			       &cpuhw->mmcr, cpuhw->event)) {
+			       &cpuhw->mmcr, cpuhw->event, ppmu->flags)) {
 		/* shouldn't ever get here */
 		printk(KERN_ERR "oops compute_mmcr failed\n");
 		goto out;
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437adec18..cfad88b7ca85 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -110,10 +110,48 @@ static void mmcra_sdar_mode(u64 event, unsigned long *mmcra)
 
 static u64 thresh_cmp_val(u64 value)
 {
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
-		return value << p9_MMCRA_THR_CMP_SHIFT;
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
 
-	return value << MMCRA_THR_CMP_SHIFT;
+	/*
+	 * Since location of threshold compare bits in MMCRA
+	 * is different for p8, using different shift value.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		return result << p9_MMCRA_THR_CMP_SHIFT;
+	else
+		return result << MMCRA_THR_CMP_SHIFT;
 }
 
 static unsigned long combine_from_event(u64 event)
@@ -144,7 +182,9 @@ static bool is_thresh_cmp_valid(u64 event)
 	/*
 	 * Check the mantissa upper two bits are not zero, unless the
 	 * exponent is also zero. See the THRESH_CMP_MANTISSA doc.
-	 * Power10: thresh_cmp is replaced by l2_l3 event select.
+	 * Power10: thresh_cmp bits are not part of raw event code.
+	 * attr.config1 is used to get thresh_cmp value from user.
+	 * And hence thresh_cmp is not part of group constraint.
 	 */
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		return false;
@@ -386,7 +426,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 
 int isa207_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[], u32 flags)
 {
 	unsigned long mmcra, mmcr1, mmcr2, unit, combine, psel, cache, val;
 	unsigned long mmcr3;
@@ -472,6 +512,10 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
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
index 044de65e96b9..8d365dccce50 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -100,6 +100,10 @@
 #define p10_EVENT_MMCR3_MASK		0x7fffull
 #define p10_EVENT_MMCR3_SHIFT		45
 
+/* Event Threshold Compare bit constant for power10 in config1 attribute */
+#define p10_EVENT_THR_CMP_SHIFT	0
+#define p10_EVENT_THR_CMP_MASK	0x3FFFFull
+
 #define p10_EVENT_VALID_MASK		\
 	((p10_SDAR_MODE_MASK   << p10_SDAR_MODE_SHIFT		|	\
 	(p10_EVENT_THRESH_MASK  << EVENT_THRESH_SHIFT)		|	\
@@ -249,7 +253,7 @@
 int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp);
 int isa207_compute_mmcr(u64 event[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[]);
+				struct perf_event *pevents[], u32 flags);
 void isa207_disable_pmc(unsigned int pmc, struct mmcr_regs *mmcr);
 int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 					const unsigned int ev_alt[][MAX_ALT]);
diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 1919e9df9165..50612b1fafb9 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
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
index 83148656b524..a838da409570 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -176,6 +176,7 @@ PMU_FORMAT_ATTR(src_sel,        "config:45-46");
 PMU_FORMAT_ATTR(invert_bit,     "config:47");
 PMU_FORMAT_ATTR(src_mask,       "config:48-53");
 PMU_FORMAT_ATTR(src_match,      "config:54-59");
+PMU_FORMAT_ATTR(thresh_cmp,     "config1:0-17");
 
 static struct attribute *power10_pmu_format_attr[] = {
 	&format_attr_event.attr,
@@ -195,6 +196,7 @@ static struct attribute *power10_pmu_format_attr[] = {
 	&format_attr_invert_bit.attr,
 	&format_attr_src_mask.attr,
 	&format_attr_src_match.attr,
+	&format_attr_thresh_cmp.attr,
 	NULL,
 };
 
@@ -393,7 +395,7 @@ static struct power_pmu power10_pmu = {
 	.get_mem_weight		= isa207_get_mem_weight,
 	.disable_pmc		= isa207_disable_pmc,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S |
-				  PPMU_ARCH_31,
+				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
 	.n_generic		= ARRAY_SIZE(power10_generic_events),
 	.generic_events		= power10_generic_events,
 	.cache_events		= &power10_cache_events,
diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index a62b2cd7914f..6eeeb4df523d 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
@@ -449,7 +449,8 @@ static int power5p_marked_instr_event(u64 event)
 
 static int power5p_compute_mmcr(u64 event[], int n_ev,
 				unsigned int hwc[], struct mmcr_regs *mmcr,
-				struct perf_event *pevents[])
+				struct perf_event *pevents[],
+				u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = 0;
diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index 8732b587cf71..190973b2d394 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -380,7 +380,8 @@ static int power5_marked_instr_event(u64 event)
 
 static int power5_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[],
+			       u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 0e318cf87129..579606315b4d 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -171,7 +171,8 @@ static int power6_marked_instr_event(u64 event)
  * Assign PMC numbers and compute MMCR1 value for a set of events
  */
 static int p6_compute_mmcr(u64 event[], int n_ev,
-			   unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event *pevents[])
+			   unsigned int hwc[], struct mmcr_regs *mmcr, struct perf_event *pevents[],
+			   u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index 5e0bf09cf077..a929917f7259 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -243,7 +243,8 @@ static int power7_marked_instr_event(u64 event)
 
 static int power7_compute_mmcr(u64 event[], int n_ev,
 			       unsigned int hwc[], struct mmcr_regs *mmcr,
-			       struct perf_event *pevents[])
+			       struct perf_event *pevents[],
+			       u32 flags __maybe_unused)
 {
 	unsigned long mmcr1 = 0;
 	unsigned long mmcra = MMCRA_SDAR_DCACHE_MISS | MMCRA_SDAR_ERAT_MISS;
diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index d35223fb112c..4a0b1eeab643 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -254,7 +254,8 @@ static int p970_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 
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

