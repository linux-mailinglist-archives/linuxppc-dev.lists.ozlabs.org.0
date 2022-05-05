Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E951BCB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv8Nz4ZcTz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RukT1W+v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RukT1W+v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv8ND2Rwbz3bff
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:00:59 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458h2lN029794;
 Thu, 5 May 2022 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=O7FlpIdpvunb8H7LG2tuO8W6EjYlxJN7Ehrrlf6Np6o=;
 b=RukT1W+vx/A2l1d9CLA/zxzUmE6kWWFeMi7EG9ysN8mKIqxcpuNtNrF76brbKdOOYTi+
 k9UDwIA2SZszWCFk/yOt4zPP5AHl74D3Vyi0jpYqEN8qMs8jXsGDQL7hde3tCzIEts+A
 oz/xNXvVYQFjYSyjlbyrFCnXG17D5ZZMiAjCEbgujIPSrr0wVyn8e/RwGnYFeMAv1sU4
 ai5HddpQoYjMeN6H7XeS9gVtArUD4V57HN+t66JiwBVUkXtGzUGpgfQt8WYNQD00Ym7X
 UpBIEbtytjBHQd0PADFJY63Px0IBT4bTcW2g5dT3K9KXZHbfqtXnAp4pop9G8HU8TxK0 lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbabhbax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:00:53 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2459sVFn028359;
 Thu, 5 May 2022 10:00:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbabhb9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:00:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2459wUkI028161;
 Thu, 5 May 2022 10:00:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3frvr8y0jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:00:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245A0lG452822338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 10:00:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34511A4051;
 Thu,  5 May 2022 10:00:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95CBBA4053;
 Thu,  5 May 2022 10:00:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.80.15])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 10:00:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH] tools/perf/tests: Skip perf BPF test if clang is not present
Date: Thu,  5 May 2022 15:30:39 +0530
Message-Id: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CbjrL_Np5JLEUx6eEM6dBQNSMyBToXb5
X-Proofpoint-GUID: MIo7SbTwgpzbUbHupbyJNRlmvbxepMNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050067
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Perf BPF filter test fails in environment where "clang"
is not installed.

Test failure logs:

<<>>
 42: BPF filter                    :
 42.1: Basic BPF filtering         : Skip
 42.2: BPF pinning                 : FAILED!
 42.3: BPF prologue generation     : FAILED!
<<>>

Enabling verbose option provided debug logs which says
clang/llvm needs to be installed. Snippet of verbose logs:

<<>>
 42.2: BPF pinning                  :
 --- start ---
test child forked, pid 61423
ERROR:	unable to find clang.
Hint:	Try to install latest clang/llvm to support BPF.
        Check your $PATH

<<logs_here>>

Failed to compile test case: 'Basic BPF llvm compile'
Unable to get BPF object, fix kbuild first
test child finished with -1
 ---- end ----
BPF filter subtest 2: FAILED!
<<>>

Here subtests, "BPF pinning" and "BPF prologue generation"
failed and logs shows clang/llvm is needed. After installing
clang, testcase passes.

Reason on why subtest failure happens though logs has proper
debug information:
Main function __test__bpf calls test_llvm__fetch_bpf_obj by
passing 4th argument as true ( 4th arguments maps to parameter
"force" in test_llvm__fetch_bpf_obj ). But this will cause
test_llvm__fetch_bpf_obj to skip the check for clang/llvm.

Snippet of code part which checks for clang based on
parameter "force" in test_llvm__fetch_bpf_obj:

<<>>
if (!force && (!llvm_param.user_set_param &&
<<>>

Since force is set to "false", test won't get skipped and
fails to compile test case. The BPF code compilation needs
clang, So pass the fourth argument as "false" and also skip
the test if reason for return is "TEST_SKIP"

After the patch:

<<>>
 42: BPF filter                    :
 42.1: Basic BPF filtering         : Skip
 42.2: BPF pinning                 : Skip
 42.3: BPF prologue generation     : Skip
<<>>

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/bpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
index 57b9591f7cbb..ae62f01239e3 100644
--- a/tools/perf/tests/bpf.c
+++ b/tools/perf/tests/bpf.c
@@ -222,11 +222,11 @@ static int __test__bpf(int idx)
 
 	ret = test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
 				       bpf_testcase_table[idx].prog_id,
-				       true, NULL);
+				       false, NULL);
 	if (ret != TEST_OK || !obj_buf || !obj_buf_sz) {
 		pr_debug("Unable to get BPF object, %s\n",
 			 bpf_testcase_table[idx].msg_compile_fail);
-		if (idx == 0)
+		if ((idx == 0) || (ret == TEST_SKIP))
 			return TEST_SKIP;
 		else
 			return TEST_FAIL;
-- 
2.35.1

