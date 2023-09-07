Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD87979AD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:18:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XimzL3i/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQtq4841z3cWT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:18:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XimzL3i/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQr43hbtz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:16:04 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387Gckx2014947;
	Thu, 7 Sep 2023 17:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CRdb1SnuerVfXkkvHbHxQXRxBw2ZjpF3AYd2nC5UEfY=;
 b=XimzL3i/gWVOZK0lEn97gQbUIQyqYlBJEbMMZ5k4yiu97LL/SsKeHzx93MDJcYPaYTmn
 rSYgOJgbO/drSJDSTTgiuYWu9QLjCGPa51xMfZd1RkWz3cTLTgTKJI3WAMOLb+OaNVfq
 KYkEzGgN4/EC5Aq9nYBZ0ogzwcD+qMzzIF4IT0XuoEmQKrJH9ZX9bc+xq/6Dw2HLLfh1
 1EEt3juGlGsNOBBjzge8t3XKY5G4j2hxcn6SpVgMarQV2rF6psLOgMzNRlJI/t2izAim
 vIYyz9E/g1uKRcr9fVcjl5K6FbEhG633+q25ZZ3Z6E4+kyjXUzUMGyPQyvagYijswmon hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syhf5tc8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:57 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387GcsSS015650;
	Thu, 7 Sep 2023 17:15:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syhf5tc8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387GrM53011121;
	Thu, 7 Sep 2023 17:15:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svj324whd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387HFrLY24642178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 17:15:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB15C20043;
	Thu,  7 Sep 2023 17:15:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C07520040;
	Thu,  7 Sep 2023 17:15:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 17:15:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 3/3] tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts
Date: Thu,  7 Sep 2023 22:45:40 +0530
Message-Id: <20230907171540.36736-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tLZnW3qVxwWhWPkL_SnofljJJd2-E_vw
X-Proofpoint-GUID: OpG1ltHIZNqWKq7OqjWNgsw4V15DGNBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309070152
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running shellcheck on some of the shell scripts, throws
below warning on shellcheck v0.6. Example:

   In tests/shell/coresight/asm_pure_loop.sh line 14:
   DATA="$DATD/perf-$TEST-$DATV.data"
          ^---^ SC2153: Possible misspelling: DATD may not be assigned, but DATA is.

Here, DATD is exported from "lib/coresight.sh" and this
warning can be ignored. Use "shellcheck disable=" to ignore
this check.

Signed-off-by:  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 1 +
 tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 1 +
 tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 1 +
 tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 1 +
 tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
index 04387061e9f3..2d65defb7e0f 100755
--- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
+++ b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
@@ -11,6 +11,7 @@ TEST="asm_pure_loop"
 
 ARGS=""
 DATV="out"
+# shellcheck disable=SC2153
 DATA="$DATD/perf-$TEST-$DATV.data"
 
 perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
diff --git a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
index c17e442ac741..ddcc9bb850f5 100755
--- a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
+++ b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
@@ -11,6 +11,7 @@ TEST="memcpy_thread"
 
 ARGS="16 10 1"
 DATV="16k_10"
+# shellcheck disable=SC2153
 DATA="$DATD/perf-$TEST-$DATV.data"
 
 perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
index e47c4e955d0e..2ce5e139b2fd 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
@@ -11,6 +11,7 @@ TEST="thread_loop"
 
 ARGS="10 1"
 DATV="check-tid-10th"
+# shellcheck disable=SC2153
 DATA="$DATD/perf-$TEST-$DATV.data"
 STDO="$DATD/perf-$TEST-$DATV.stdout"
 
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
index 8bf94a02e384..3ad9498753d7 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
@@ -11,6 +11,7 @@ TEST="thread_loop"
 
 ARGS="2 20"
 DATV="check-tid-2th"
+# shellcheck disable=SC2153
 DATA="$DATD/perf-$TEST-$DATV.data"
 STDO="$DATD/perf-$TEST-$DATV.stdout"
 
diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
index 0dc9ef424233..4fbb4a29aad3 100755
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
@@ -11,6 +11,7 @@ TEST="unroll_loop_thread"
 
 ARGS="10"
 DATV="10"
+# shellcheck disable=SC2153
 DATA="$DATD/perf-$TEST-$DATV.data"
 
 perf record $PERFRECOPT -o "$DATA" "$BIN" $ARGS
-- 
2.31.1

