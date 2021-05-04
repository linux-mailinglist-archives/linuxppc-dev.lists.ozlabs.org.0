Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14173726BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 09:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZBgH33qfz30D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:44:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=h4yuVwTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=h4yuVwTB; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZBfr2xmlz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 17:43:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FZBfq3pBJz9s1l; Tue,  4 May 2021 17:43:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4FZBfq3K3Lz9sSs; Tue,  4 May 2021 17:43:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1620114227; bh=LNm9rYCHOivA1wmBd43uuQ2Hwao3gfk1DNewEgsTg2I=;
 h=Date:From:To:Cc:Subject:From;
 b=h4yuVwTBfONSYi8mCLEk4rbhlFYSy6fekDmdv5khDaw4aQxxf9CtByykmQv+2Cnpf
 QMm0K/HjK4saH5hhsavmD4dTSMgM8CMfzmOTklYAu7tb9tBS/njbg98x1ytxy3RvcS
 J/YMlHaVEzPL1RRU9Y+EX4kHRvR0MQupSU87j+vCnqfywgrsZVjtOn2cxW6vEqab/D
 5i/Rlbuc2/X30pzlkHIoC1ZRj2bk37Ubn3cYhmzeKdT8j+aVMuGPv8MqKJPRCtwi3e
 soXJe+calZuj526yjPWLkwB+p5JfQV8q07nMwf3dLhdMGIr5x1+nSDReMZpo98V3Mx
 7XYEriwY6kG3A==
Date: Tue, 4 May 2021 17:43:43 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/pmu: Make the generic compat PMU use the architected
 events
Message-ID: <YJD7L9yeoxvxqeYi@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Michael Ellerman <michael@ellerman.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This changes generic-compat-pmu.c so that it only uses architected
events defined in Power ISA v3.0B, rather than event encodings which,
while common to all the IBM Power Systems implementations, are
nevertheless implementation-specific rather than architected.  The
intention is that any CPU implementation designed to conform to Power
ISA v3.0B or later can use generic-compat-pmu.c.

In addition to the existing events for cycles and instructions, this
adds several other architected events, including alternative encodings
for some events.  In order to make it possible to measure cycles and
instructions at the same time as each other, we set the CC5-6RUN bit
in MMCR0, which makes PMC5 and PMC6 count instructions and cycles
regardless of the run bit, so their events are now PM_CYC and
PM_INST_CMPL rather than PM_RUN_CYC and PM_RUN_INST_CMPL (the latter
are still available via other event codes).

Note that POWER9 has an erratum where one architected event
(PM_FLOP_CMPL, floating-point operations completed, code 0x100f4) does
not work correctly.  Given that there is a specific PMU driver for P9
which will be used in preference to generic-compat-pmu.c, that is not
a real problem.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/perf/generic-compat-pmu.c | 170 +++++++++++++++++++------
 1 file changed, 134 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index eb8a6aaf4cc1..695975227e60 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -14,45 +14,119 @@
  *
  *        28        24        20        16        12         8         4         0
  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
- *                                 [ pmc ]   [unit ]   [ ]   m   [    pmcxsel    ]
- *                                                     |     |
- *                                                     |     *- mark
- *                                                     |
- *                                                     |
- *                                                     *- combine
- *
- * Below uses IBM bit numbering.
- *
- * MMCR1[x:y] = unit    (PMCxUNIT)
- * MMCR1[24]   = pmc1combine[0]
- * MMCR1[25]   = pmc1combine[1]
- * MMCR1[26]   = pmc2combine[0]
- * MMCR1[27]   = pmc2combine[1]
- * MMCR1[28]   = pmc3combine[0]
- * MMCR1[29]   = pmc3combine[1]
- * MMCR1[30]   = pmc4combine[0]
- * MMCR1[31]   = pmc4combine[1]
- *
+ *                                 [ pmc ]                       [    pmcxsel    ]
  */
 
 /*
- * Some power9 event codes.
+ * Event codes defined in ISA v3.0B
  */
 #define EVENT(_name, _code)	_name = _code,
 
 enum {
-EVENT(PM_CYC,					0x0001e)
-EVENT(PM_INST_CMPL,				0x00002)
+	/* Cycles, alternate code */
+	EVENT(PM_CYC_ALT,			0x100f0)
+	/* One or more instructions completed in a cycle */
+	EVENT(PM_CYC_INST_CMPL,			0x100f2)
+	/* Floating-point instruction completed */
+	EVENT(PM_FLOP_CMPL,			0x100f4)
+	/* Instruction ERAT/L1-TLB miss */
+	EVENT(PM_L1_ITLB_MISS,			0x100f6)
+	/* All instructions completed and none available */
+	EVENT(PM_NO_INST_AVAIL,			0x100f8)
+	/* A load-type instruction completed (ISA v3.0+) */
+	EVENT(PM_LD_CMPL,			0x100fc)
+	/* Instruction completed, alternate code (ISA v3.0+) */
+	EVENT(PM_INST_CMPL_ALT,			0x100fe)
+	/* A store-type instruction completed */
+	EVENT(PM_ST_CMPL,			0x200f0)
+	/* Instruction Dispatched */
+	EVENT(PM_INST_DISP,			0x200f2)
+	/* Run_cycles */
+	EVENT(PM_RUN_CYC,			0x200f4)
+	/* Data ERAT/L1-TLB miss/reload */
+	EVENT(PM_L1_DTLB_RELOAD,		0x200f6)
+	/* Taken branch completed */
+	EVENT(PM_BR_TAKEN_CMPL,			0x200fa)
+	/* Demand iCache Miss */
+	EVENT(PM_L1_ICACHE_MISS,		0x200fc)
+	/* L1 Dcache reload from memory */
+	EVENT(PM_L1_RELOAD_FROM_MEM,		0x200fe)
+	/* L1 Dcache store miss */
+	EVENT(PM_ST_MISS_L1,			0x300f0)
+	/* Alternate code for PM_INST_DISP */
+	EVENT(PM_INST_DISP_ALT,			0x300f2)
+	/* Branch direction or target mispredicted */
+	EVENT(PM_BR_MISPREDICT,			0x300f6)
+	/* Data TLB miss/reload */
+	EVENT(PM_DTLB_MISS,			0x300fc)
+	/* Demand LD - L3 Miss (not L2 hit and not L3 hit) */
+	EVENT(PM_DATA_FROM_L3MISS,		0x300fe)
+	/* L1 Dcache load miss */
+	EVENT(PM_LD_MISS_L1,			0x400f0)
+	/* Cycle when instruction(s) dispatched */
+	EVENT(PM_CYC_INST_DISP,			0x400f2)
+	/* Branch or branch target mispredicted */
+	EVENT(PM_BR_MPRED_CMPL,			0x400f6)
+	/* Instructions completed with run latch set */
+	EVENT(PM_RUN_INST_CMPL,			0x400fa)
+	/* Instruction TLB miss/reload */
+	EVENT(PM_ITLB_MISS,			0x400fc)
+	/* Load data not cached */
+	EVENT(PM_LD_NOT_CACHED,			0x400fe)
+	/* Instructions */
+	EVENT(PM_INST_CMPL,			0x500fa)
+	/* Cycles */
+	EVENT(PM_CYC,				0x600f4)
 };
 
 #undef EVENT
 
+/* Table of alternatives, sorted in increasing order of column 0 */
+/* Note that in each row, column 0 must be the smallest */
+static const unsigned int generic_event_alternatives[][MAX_ALT] = {
+	{ PM_CYC_ALT,			PM_CYC },
+	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
+	{ PM_INST_DISP,			PM_INST_DISP_ALT },
+};
+
+static int generic_get_alternatives(u64 event, unsigned int flags, u64 alt[])
+{
+	int num_alt = 0;
+
+	num_alt = isa207_get_alternatives(event, alt,
+					  ARRAY_SIZE(generic_event_alternatives), flags,
+					  generic_event_alternatives);
+
+	return num_alt;
+}
+
 GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
 GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
+GENERIC_EVENT_ATTR(stalled-cycles-frontend,	PM_NO_INST_AVAIL);
+GENERIC_EVENT_ATTR(branch-misses,		PM_BR_MPRED_CMPL);
+GENERIC_EVENT_ATTR(cache-misses,		PM_LD_MISS_L1);
+
+CACHE_EVENT_ATTR(L1-dcache-load-misses,		PM_LD_MISS_L1);
+CACHE_EVENT_ATTR(L1-dcache-store-misses,	PM_ST_MISS_L1);
+CACHE_EVENT_ATTR(L1-icache-load-misses,		PM_L1_ICACHE_MISS);
+CACHE_EVENT_ATTR(LLC-load-misses,		PM_DATA_FROM_L3MISS);
+CACHE_EVENT_ATTR(branch-load-misses,		PM_BR_MPRED_CMPL);
+CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
+CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
 
 static struct attribute *generic_compat_events_attr[] = {
 	GENERIC_EVENT_PTR(PM_CYC),
 	GENERIC_EVENT_PTR(PM_INST_CMPL),
+	GENERIC_EVENT_PTR(PM_NO_INST_AVAIL),
+	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
+	GENERIC_EVENT_PTR(PM_LD_MISS_L1),
+	CACHE_EVENT_PTR(PM_LD_MISS_L1),
+	CACHE_EVENT_PTR(PM_ST_MISS_L1),
+	CACHE_EVENT_PTR(PM_L1_ICACHE_MISS),
+	CACHE_EVENT_PTR(PM_DATA_FROM_L3MISS),
+	CACHE_EVENT_PTR(PM_BR_MPRED_CMPL),
+	CACHE_EVENT_PTR(PM_DTLB_MISS),
+	CACHE_EVENT_PTR(PM_ITLB_MISS),
 	NULL
 };
 
@@ -63,17 +137,11 @@ static struct attribute_group generic_compat_pmu_events_group = {
 
 PMU_FORMAT_ATTR(event,		"config:0-19");
 PMU_FORMAT_ATTR(pmcxsel,	"config:0-7");
-PMU_FORMAT_ATTR(mark,		"config:8");
-PMU_FORMAT_ATTR(combine,	"config:10-11");
-PMU_FORMAT_ATTR(unit,		"config:12-15");
 PMU_FORMAT_ATTR(pmc,		"config:16-19");
 
 static struct attribute *generic_compat_pmu_format_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_pmcxsel.attr,
-	&format_attr_mark.attr,
-	&format_attr_combine.attr,
-	&format_attr_unit.attr,
 	&format_attr_pmc.attr,
 	NULL,
 };
@@ -92,6 +160,9 @@ static const struct attribute_group *generic_compat_pmu_attr_groups[] = {
 static int compat_generic_events[] = {
 	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
 	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
+	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] =	PM_NO_INST_AVAIL,
+	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_CMPL,
+	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_MISS_L1,
 };
 
 #define C(x)	PERF_COUNT_HW_CACHE_##x
@@ -105,11 +176,11 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(L1D) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_LD_MISS_L1,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_ST_MISS_L1,
 		},
 		[ C(OP_PREFETCH) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
@@ -119,7 +190,7 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(L1I) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_L1_ICACHE_MISS,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
@@ -133,7 +204,7 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(LL) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_DATA_FROM_L3MISS,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
@@ -147,7 +218,7 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(DTLB) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_DTLB_MISS,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = -1,
@@ -161,7 +232,7 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(ITLB) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_ITLB_MISS,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = -1,
@@ -175,7 +246,7 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[ C(BPU) ] = {
 		[ C(OP_READ) ] = {
 			[ C(RESULT_ACCESS) ] = 0,
-			[ C(RESULT_MISS)   ] = 0,
+			[ C(RESULT_MISS)   ] = PM_BR_MPRED_CMPL,
 		},
 		[ C(OP_WRITE) ] = {
 			[ C(RESULT_ACCESS) ] = -1,
@@ -204,13 +275,30 @@ static u64 generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 
 #undef C
 
+/*
+ * We set MMCR0[CC5-6RUN] so we can use counters 5 and 6 for
+ * PM_INST_CMPL and PM_CYC.
+ */
+static int generic_compute_mmcr(u64 event[], int n_ev,
+				unsigned int hwc[], struct mmcr_regs *mmcr,
+				struct perf_event *pevents[], u32 flags)
+{
+	int ret;
+
+	ret = isa207_compute_mmcr(event, n_ev, hwc, mmcr, pevents, flags);
+	if (!ret)
+		mmcr->mmcr0 |= MMCR0_C56RUN;
+	return ret;
+}
+
 static struct power_pmu generic_compat_pmu = {
 	.name			= "GENERIC_COMPAT",
 	.n_counter		= MAX_PMU_COUNTERS,
 	.add_fields		= ISA207_ADD_FIELDS,
 	.test_adder		= ISA207_TEST_ADDER,
-	.compute_mmcr		= isa207_compute_mmcr,
+	.compute_mmcr		= generic_compute_mmcr,
 	.get_constraint		= isa207_get_constraint,
+	.get_alternatives	= generic_get_alternatives,
 	.disable_pmc		= isa207_disable_pmc,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S,
 	.n_generic		= ARRAY_SIZE(compat_generic_events),
@@ -223,6 +311,16 @@ int init_generic_compat_pmu(void)
 {
 	int rc = 0;
 
+	/*
+	 * From ISA v2.07 on, PMU features are architected;
+	 * we require >= v3.0 because (a) that has PM_LD_CMPL and
+	 * PM_INST_CMPL_ALT, which v2.07 doesn't have, and
+	 * (b) we don't expect any non-IBM Power ISA
+	 * implementations that conform to v2.07 but not v3.0.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
+		return -ENODEV;
+
 	rc = register_power_pmu(&generic_compat_pmu);
 	if (rc)
 		return rc;
-- 
2.26.2

