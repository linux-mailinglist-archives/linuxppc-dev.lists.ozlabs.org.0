Return-Path: <linuxppc-dev+bounces-4371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813959F9F18
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 08:38:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFbkM09syz2yHj;
	Sat, 21 Dec 2024 18:38:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734766714;
	cv=none; b=OYOp3munSBBFyHKJKjdGs58OtTMnp14Ft/wUTIZqGY1jwX4piatdzpn7p8BonrfsFcmfhGZVSbWEVLdQ7EzZMSl6Ts3b2O6caAPj5Bz0N3e0Vd/GkQZ3Gv/agRSIb1i7DiYJ7C3ORi7wAItSJMIES8hQWphAMw/hG+ZiBWNDa8mwUDjz9bz+TcpQz9AiYR4QFSujCJsiDnwEnhy2oJbaQnkJ/zmbGbE8JbVPdn9xKzt28ljPw0hCu5cjSqOq9vkvAgrEpyKXOLZuMMwGgFUSpmnwhzONdeHdyvyXxedkRJfJab/0RF4L8NbkkEnQSxhkIu3ROGMTfJmrq6b8CUmflw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734766714; c=relaxed/relaxed;
	bh=dcVkr9L6foeEggaZnMb305sJAPOfwZJiQkU1fb31h50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MtrJX5scRXwdYcFUnkzgMngf1F9FrNiK1xvaR9xbQykTP356hEHQBic2Fhz0zexIWrJeKEaj1JSh7NeZ152NB9UWlt2lQ+lq/fELwStPM/Yeya4wINhJSv7e70TpDi2UW0a++jGZDgf0SDgR0vtIi0e5ueczpTJYi7k8h0bm2U6z0Zkc4927BS+G7tRlNsONSAAWajGdMBmcFrGZDMdsbRLoy3fnsilZt3VoyRQIyMhSTHcbNVvoGv73in36VJjWEq0MY9mtDt/Rc1J74gx9pfS80148f3nDI5VmPf+RPppqfcZL/oIB0onFanQGP56T/5CoQzaCeABOOMU7+wskvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eQHeeVZe; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eQHeeVZe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFbkL1QrNz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 18:38:33 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL5TwB9002173;
	Sat, 21 Dec 2024 07:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dcVkr9L6foeEggaZn
	Mb305sJAPOfwZJiQkU1fb31h50=; b=eQHeeVZeKtd1zNRCV6ToYkgPt7TpMqvKU
	VHeebvuf5M7dcbR6vVPzq5wzyG4F/bigUzm13wbyfvldRphOGT1qOqv4oJgPgasC
	BLPQb/mbJiuqLzKE+mY9UmwD73TcKCd64RhhGV2dN730PdoHLFPArj3kyiY6PFfe
	c/OMsDeN2jn7CHxhJiGejZxEWu8L4uBYQcDZEiSMJV7qgaMox386V8s94lLY+rCs
	4MmRTl0W21iFYi0saQeGQRy/7Ihi6LImyWiBC2T3DSaFAiV2719rKMlFsEKS2kmT
	Vv2WFby/9kP2cI4VEfRDTel8azXEPZw2HacnpzT5rBDwF0w8obLKQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43nq9c8bf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 07:38:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL7F3QE029345;
	Sat, 21 Dec 2024 07:38:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hmbt6077-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 07:38:30 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BL7cREM16843136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 07:38:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C06620040;
	Sat, 21 Dec 2024 07:38:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD65820043;
	Sat, 21 Dec 2024 07:38:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.52])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Dec 2024 07:38:23 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: [PATCH 2/4] tools/testing/selftests/powerpc: Add check for power11 pvr for pmu selfests
Date: Sat, 21 Dec 2024 13:08:08 +0530
Message-Id: <20241221073810.65802-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20241221073810.65802-1-atrajeev@linux.vnet.ibm.com>
References: <20241221073810.65802-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-ORIG-GUID: 2lJg27x9WY3EV8usX6THuUJ9tCWhmvKP
X-Proofpoint-GUID: 2lJg27x9WY3EV8usX6THuUJ9tCWhmvKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412210063
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
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


