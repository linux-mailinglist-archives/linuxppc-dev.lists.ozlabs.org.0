Return-Path: <linuxppc-dev+bounces-5115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C0A0B069
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 08:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWl5v0rkcz303B;
	Mon, 13 Jan 2025 18:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736755171;
	cv=none; b=JT5W24rAJY/vBehU9a/vbEw1PHm22tI4rAcwNKJP88Sp/53fUsRTM52qfKuoRPb0SbkkrBwSPIO6bpR4ltEloa2VswBG1RhThur2ap7g2aHGE0DT01EtvWU7WudbWvsix8y1dxKyKAkvzClNnTSdONxmEZ/qM2A8JjLwCu23Bd10gWv54S33suZ003lRFMMn1fYLlPJEJJCveswlRKkn11BeRuhooaCXpOx9unbiiriSLPVYSPysNTBurJ9kOKc/5qRSjpyMu+NVMeU1aBRmuAQTAFrhr46bg20EhwpYQiKJNH3C+hrRXgmxpdPEus8me7SRNsKMcATogbwULrQOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736755171; c=relaxed/relaxed;
	bh=jFkNZUl9lk6JURS0Ep8cL+mFBAm0Lel5GaD4z060ppQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8n17dFTzHfUIg1S9X0SkB7rO4BheMsUnf5R7x9gfYo4KkPttUfkSbNj+iHS6aq50E1EiNoslSlLpgYnzlPV95MFS/2+fnsEM6Axg+TGg9fzBAhRokm0SElmyWyyinowVPDTsDkfJ8UfMgx9an128fVZEX8JHi/mE2UaltazzgOWozMnOn8IGdWzsLM3KaudBai8IOn4iCOXS22PQS/qc8LBrRiSwD6YEKHd9EV+SQ9IKtPxzgTk+PaXeSmS3Z/m3596TqTJjKmPJU2FIfeOlqOnnBQoii9ZSkoi5jBeIM1ok0K8YMWLMH2s4T4gO4Ql0Z4yz3lqBca3HP1PS/lVQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ghxab1pg; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ghxab1pg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWl5s4TSJz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:59:29 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3raDe003381
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jFkNZUl9lk6JURS0E
	p8cL+mFBAm0Lel5GaD4z060ppQ=; b=Ghxab1pgL+ig9e2S/D1I9aBo83qiMME1s
	TY+lTIKMIHKm4/YgLFbi4xa//ligNQT6p1hLJjIOX4/OwtHww0lWKCIcM7z4lLzG
	Hl7WQhdbF+rKiRvoBDOHWv30NP2SisQEYGRqlNFX7znv4smDQ8qrz4MzenicS3wR
	Zu2wD8DZve9+xr8ROykhOnxrx4SuKHy27pmKl0NK1M9NjG/s62hXJg27XcVfQQlQ
	5mu2KMKE5FrvS+eBa80/wr1YnMZUhOPRM703wnx14XNvP+AwG+Cv3lI7R3x4PtJh
	F271ylEAvjeDo95/rNlXlI8xX5I5Ucg8vpNcXWnhmLMiMGYtd/dUQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uagrs4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5en3f016582
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1ctvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D7xA2S18350442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 07:59:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AF9520043;
	Mon, 13 Jan 2025 07:59:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7509120040;
	Mon, 13 Jan 2025 07:59:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 07:59:07 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 2/5] tools/testing/selftests/powerpc: Add check for power11 pvr for pmu selfests
Date: Mon, 13 Jan 2025 13:28:55 +0530
Message-Id: <20250113075858.45137-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
References: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-ORIG-GUID: dvpvZsXD3sRZHm1K01jJZ87E1zOrCMnK
X-Proofpoint-GUID: dvpvZsXD3sRZHm1K01jJZ87E1zOrCMnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130067
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some of the tests depends on pvr value to choose
the event. Example:
- event_alternatives_tests_p10: alternative event depends
  on registered PMU driver which is based on pvr
- generic_events_valid_test varies based on platform
- bhrb_filter_map_test: again its dependent on pmu to
  decide which bhrb filter to use
- reserved_bits_mmcra_sample_elig_mode: randome sampling
  mode reserved bits is also varies based on platform

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 No code changes. Rebased to latest upstream

 .../pmu/event_code_tests/event_alternatives_tests_p10.c    | 3 ++-
 .../pmu/event_code_tests/generic_events_valid_test.c       | 3 ++-
 .../reserved_bits_mmcra_sample_elig_mode_test.c            | 3 ++-
 .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c      | 7 +++++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
index 8be7aada6523..355f8bbe06c3 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
@@ -26,6 +26,7 @@ static int event_alternatives_tests_p10(void)
 {
 	struct event *e, events[5];
 	int i;
+	int pvr = PVR_VER(mfspr(SPRN_PVR));
 
 	/* Check for platform support for the test */
 	SKIP_IF(platform_check_for_tests());
@@ -36,7 +37,7 @@ static int event_alternatives_tests_p10(void)
 	 * code and using PVR will work correctly for all cases
 	 * including generic compat mode.
 	 */
-	SKIP_IF(PVR_VER(mfspr(SPRN_PVR)) != POWER10);
+	SKIP_IF((pvr != POWER10) && (pvr != POWER11));
 
 	SKIP_IF(check_for_generic_compat_pmu());
 
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
index 0d237c15d3f2..a378fa9a5a7b 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
@@ -17,6 +17,7 @@
 static int generic_events_valid_test(void)
 {
 	struct event event;
+	int pvr = mfspr(SPRN_PVR);
 
 	/* Check for platform support for the test */
 	SKIP_IF(platform_check_for_tests());
@@ -31,7 +32,7 @@ static int generic_events_valid_test(void)
 	 * - PERF_COUNT_HW_STALLED_CYCLES_BACKEND
 	 * - PERF_COUNT_HW_REF_CPU_CYCLES
 	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	if ((pvr == POWER10) || (pvr == POWER11)) {
 		event_init_opts(&event, PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
 		FAIL_IF(event_open(&event));
 		event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
index 4c119c821b99..7bb26a232fbe 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
@@ -21,6 +21,7 @@
 static int reserved_bits_mmcra_sample_elig_mode(void)
 {
 	struct event event;
+	int pvr = PVR_VER(mfspr(SPRN_PVR));
 
 	/* Check for platform support for the test */
 	SKIP_IF(platform_check_for_tests());
@@ -59,7 +60,7 @@ static int reserved_bits_mmcra_sample_elig_mode(void)
 	 * is reserved in power10 and 0xC is reserved in
 	 * power9.
 	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	if ((pvr == POWER10) || (pvr == POWER11)) {
 		event_init(&event, 0x100401e0);
 		FAIL_IF(!event_open(&event));
 	} else if (PVR_VER(mfspr(SPRN_PVR)) == POWER9) {
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 3f43c315c666..64ab9784f9b1 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -83,13 +83,16 @@ static int bhrb_filter_map_test(void)
 	 * using PVR will work correctly for all cases including generic
 	 * compat mode.
 	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	switch (PVR_VER(mfspr(SPRN_PVR))) {
+	case POWER11:
+	case POWER10:
 		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
 			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
 			FAIL_IF(event_open(&event));
 			event_close(&event);
 		}
-	} else {
+		break;
+	default:
 		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
 			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
 			FAIL_IF(!event_open(&event));
-- 
2.43.5


