Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751661162E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:44:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzRfl030Xz3cHh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:43:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=axD+DtvM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=axD+DtvM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRdk1z39z30NS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:43:05 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SFECNR013754;
	Fri, 28 Oct 2022 15:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AuSo8EyBcxSAreS7UllZmSol851VHxia2fpnS6U077U=;
 b=axD+DtvMu0quxdv2n+3NfxK+OLU0tou+PuviLtjGOyIOU2nMOBgP4edTwmSOZs2vexD9
 AGaVZLY7LyURc08qw4yvZKlien83E4AmjYE2OGy993tUjgtQjE6sg9YWNzL8suNnxR2d
 X58UAQ4e5kD4u2rxvI9nbZh0KsKPwbLbsVWxKdpaSuL+3MJ4ASMI8U5dq5OMepmv4cHL
 SXLzIGzLN9BjHu1m6mfzN2/w6bLOWgkQpLydX6k9a7LNl++RCQTqXzwjWP5AHH4PQC9j
 vnKCBLprXK2Wts3jdby5GndFAnPsZhX0S8KJGTIB/9FMGnWNSIwor36n6RjdIwLF7mPm gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kghhw181w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 15:42:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SFbQY0026913;
	Fri, 28 Oct 2022 15:42:52 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kghhw17xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 15:42:52 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SFa5XB025043;
	Fri, 28 Oct 2022 15:42:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3kfbg2aqg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 15:42:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SFgkcg4325894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 15:42:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33B89A405B;
	Fri, 28 Oct 2022 15:42:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 471EFA4054;
	Fri, 28 Oct 2022 15:42:43 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.12.76])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 15:42:43 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH] perf test bpf: Skip test if kernel-debuginfo is not present
Date: Fri, 28 Oct 2022 21:12:30 +0530
Message-Id: <20221028154230.140709-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HpBAPdfTok6vfA1nzPmibUzWh5naDlvt
X-Proofpoint-ORIG-GUID: CQYuff1woyh3AuoF0nBvLz4ziNEZtLQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280097
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
Cc: irogers@google.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Perf BPF filter test fails in environment where "kernel-debuginfo"
is not installed.

Test failure logs:
<<>>
 42: BPF filter                            :
 42.1: Basic BPF filtering                 : Ok
 42.2: BPF pinning                         : Ok
 42.3: BPF prologue generation             : FAILED!
<<>>

Enabling verbose option provided debug logs, which says debuginfo
needs to be installed. Snippet of verbose logs:

<<>>
 42.3: BPF prologue generation                                       :
--- start ---
test child forked, pid 28218
<<>>
Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
package.
bpf_probe: failed to convert perf probe events
Failed to add events selected by BPF
test child finished with -1
---- end ----
BPF filter subtest 3: FAILED!
<<>>

Here subtest, "BPF prologue generation" failed and
logs shows debuginfo is needed. After installing
kernel-debuginfo package, testcase passes.

Subtest "BPF prologue generation" failed because, the "do_test"
function returns "TEST_FAIL" without checking the error type
returned by "parse_events_load_bpf_obj" function.
Function parse_events_load_bpf_obj can also return error of type
"-ENOENT" incase kernel-debuginfo package is not installed. Fix this
by adding check for -ENOENT error.

Test result after the patch changes:

Test failure logs:
<<>>
 42: BPF filter                 :
 42.1: Basic BPF filtering      : Ok
 42.2: BPF pinning              : Ok
 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
installed or environment missing BPF support)

Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/perf/tests/bpf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
index 17c023823713..57cecadc1da2 100644
--- a/tools/perf/tests/bpf.c
+++ b/tools/perf/tests/bpf.c
@@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (*func)(void),
 
 	err = parse_events_load_bpf_obj(&parse_state, &parse_state.list, obj, NULL);
 	parse_events_error__exit(&parse_error);
+	if (err == -ENOENT) {
+		pr_debug("Failed to add events selected by BPF, debuginfo package not installed\n");
+		return TEST_SKIP;
+	}
 	if (err || list_empty(&parse_state.list)) {
 		pr_debug("Failed to add events selected by BPF\n");
 		return TEST_FAIL;
@@ -368,7 +372,7 @@ static struct test_case bpf_tests[] = {
 			"clang isn't installed or environment missing BPF support"),
 #ifdef HAVE_BPF_PROLOGUE
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
-			"clang isn't installed or environment missing BPF support"),
+			"clang/debuginfo isn't installed or environment missing BPF support"),
 #else
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
 #endif
-- 
2.31.1

