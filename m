Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B9523239
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 13:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kytdp6GM4z3cGk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 21:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JjL7RbQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JjL7RbQU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kytd553ttz3bw4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 21:55:05 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BAWeUn000900;
 Wed, 11 May 2022 11:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OiqG13vW+36US08Un+Ci8ZfFPyPy+VaCDI4KenlxvcU=;
 b=JjL7RbQUt4G59UaORaLcg7g8JcZezjsa2JOpw4tU4JS9NTkFP38el8/sTh+2TzavFESb
 /vNiHNKcsIX3WmWV4muLYX02GG9C4pJnvIGoJE84iEheuH4lKsradJ41FuKuDrX1ho4B
 mTOTHmFa4pHIPfUq/KxsDQoCb/PKO74UmwJ+AhdppxUBJJshlA8yPVx6mr9PySMNjmgu
 xPsXC2PDWQlZEVaZUsH/OP6drbDymiuWyEG9xWYuBCMLxUyRLRO88jf5ci2dehIF79F4
 /0lrdAOOpTTQaswlVQU4n2I/MjSb50cDSEe+BN21P+b8uEB63QKPnMaY6oRgDw9jp6bq kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g054jqx5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:54:53 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BB6aO9026975;
 Wed, 11 May 2022 11:54:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g054jqx5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:54:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BBrbuW021715;
 Wed, 11 May 2022 11:54:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fyrkk1ae4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:54:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BBsl3H21823802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 11:54:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 959B711C04C;
 Wed, 11 May 2022 11:54:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB4211C04A;
 Wed, 11 May 2022 11:54:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.43.135])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 May 2022 11:54:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is not
 present
Date: Wed, 11 May 2022 17:24:38 +0530
Message-Id: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZE_Lcvm19bOmqMU684MYWXxNVJYbbBxa
X-Proofpoint-GUID: _auU4c1WDTaACS6TElFdDkeZVyFz1COE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_03,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205110053
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
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 Addressed review comments from Arnaldo by adding
 reason for skipping of testcase.

 tools/perf/tests/bpf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
index 57b9591f7cbb..17c023823713 100644
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
@@ -364,9 +364,11 @@ static int test__bpf_prologue_test(struct test_suite *test __maybe_unused,
 static struct test_case bpf_tests[] = {
 #ifdef HAVE_LIBBPF_SUPPORT
 	TEST_CASE("Basic BPF filtering", basic_bpf_test),
-	TEST_CASE("BPF pinning", bpf_pinning),
+	TEST_CASE_REASON("BPF pinning", bpf_pinning,
+			"clang isn't installed or environment missing BPF support"),
 #ifdef HAVE_BPF_PROLOGUE
-	TEST_CASE("BPF prologue generation", bpf_prologue_test),
+	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
+			"clang isn't installed or environment missing BPF support"),
 #else
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
 #endif
-- 
2.31.1

