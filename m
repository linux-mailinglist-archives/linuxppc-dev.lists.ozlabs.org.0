Return-Path: <linuxppc-dev+bounces-2485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2939AB056
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 16:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXv5B0z9Nz2yGM;
	Wed, 23 Oct 2024 01:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729605758;
	cv=none; b=cK7/UZBs+g7TJjNirwYu4yflZuGxfjlIpEoySSqKrXEAPIXkFfLzXYWDN/giqQ9LNyT1QOUIEdl31so1YBpJ/8keZE+Wla88ICw1WZh52vmIKwOlPqmCzQwAFtUn0cAMWRFlrC+nNusjIa7hvA6LLfbBjdoOYlr5nck+hR9c7hZGS+kLtV31BEGptQTXLI8hPt0ROvH07zhwSpmuVFnauaak8C6eAPK/DsiG2gE+R34nsHrRwqowZeaovIprj3b7Y4XNiHyW2YvhGcoF7fmr+mqYSTzeVdwCfHIaKf+oFFgZJgEfs3o4pDIXDCDktmgxXyfCjsp0lyeJcsSUBCOhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729605758; c=relaxed/relaxed;
	bh=So3Twn6QWsG4soDWWAYO4es+YvEJgvYZXhZybm9gFwo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nlQ47kVTL+TihNV3vvMSco9U1HtwBPSKoVCqwwwfrwHAKY8+htGNr2huThs5/7wcV3zTsAvYG42tbfiDHuzZsO1/mrGJGY7ewc0ZHB7ptBFpMyVJVBteEGDEpZQiE3UjHNM33g84EVH/BxdwrYnVb+VyrPza37GL9j5ly2BpJ3BcKfXy7CnR37ZvgtfVMugd4vVQaDw6mpNh/MtofF99yvqShgq6RCW9MZYZwvL8kNsWRzMl00x5HL9qVgO1YcuPbf/AzVOM2BtlAb6QERiUTo7FEmYLxfLwgg9hjVZAKNW+y8k4NW4mwwnpVkyjbhJnTzLxdk9lNroaMIwY8pPlCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I3yZbDY6; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I3yZbDY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXv5823N3z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 01:02:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M2HBbF005317;
	Tue, 22 Oct 2024 14:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=So3Twn6QWsG4soDWWAYO4es+YvEJgvYZXhZybm9gF
	wo=; b=I3yZbDY6Bc4Tq/FiYULcZujdzZOrAMgiv77cUhOmHfjvbS56ttYmUdu/h
	eWRm2Gtn/bBaK0lke+is/Clox7taIB6lnHzBTg58/NmxUVJol0s2Xi0rrHcu1qpi
	AzFIlGs8AeBi4dAdQbRwiHCqGLcH6A7I4shxpjsOY/nGxNxF4O7e0hGpBr+jJbjt
	L7ALuTRkxKK4nhaZhITBs+VF3IbKR/GbyimtwhL1dhgv3PKJ34cGExrT1HHh1Lb2
	iueV2T1e+e7C8X+RsJaUeQ3Q7oqLPgAFfAoG+uWiZv59+zzy2s0PWHjUDie/vkQA
	sr66lvxpHuVmPlR+67A0i8jhGvm3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42c5fcp808-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:02:20 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49ME06i7008584;
	Tue, 22 Oct 2024 14:02:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42c5fcp806-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:02:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49MAh8AO018590;
	Tue, 22 Oct 2024 14:02:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42csajb7qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:02:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49ME2Fmt50528722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Oct 2024 14:02:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82DC02004B;
	Tue, 22 Oct 2024 14:02:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E3CF20040;
	Tue, 22 Oct 2024 14:02:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.248.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Oct 2024 14:02:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test only for intel
Date: Tue, 22 Oct 2024 19:31:56 +0530
Message-Id: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O02VkF2NcBu12s6_V8_f6krF4iBkKYgF
X-Proofpoint-GUID: CUQtrUpKoybBGq58DZ8aLjOr6o8eANhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The "Simple expression parser" test fails on powerpc
as below:

 parsing metric: #system_tsc_freq
 Unrecognized literal '#system_tsc_freq'literal: #system_tsc_freq = nan
 syntax error
 FAILED tests/expr.c:247 #system_tsc_freq
 ---- end(-1) ----
 7: Simple expression parser  : FAILED!

In the test, system_tsc_freq is checked as below:

 if (is_intel)
    TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
 else

But commit 609aa2667f67 ("perf tool_pmu: Switch to standard
pmu functions and json descriptions")' changed condition in
tool_pmu__skip_event so that system_tsc_freq event should
only appear on x86

 +#if !defined(__i386__) && !defined(__x86_64__)
 +       /* The system_tsc_freq event should only appear on x86. */
 +       if (strcasecmp(name, "system_tsc_freq") == 0)
 +               return true;
 +#endif

After this commit, the testcase breaks for expr__parse of
system_tsc_freq in powerpc case. Fix the testcase to have
complete system_tsc_freq test within "is_intel" check.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/expr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index e3aa9d4fcf3a..eb3bd68fc4ce 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -244,11 +244,10 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
 	if (num_dies) // Some platforms do not have CPU die support, for example s390
 		TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
 
-	TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
-	if (is_intel)
+	if (is_intel) {
+		TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
 		TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
-	else
-		TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
+	}
 
 	/*
 	 * Source count returns the number of events aggregating in a leader
-- 
2.43.5


