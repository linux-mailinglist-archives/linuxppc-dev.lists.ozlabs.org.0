Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04872E91F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:14:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jdo/w2gX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZsz1PJxz30gs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:14:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jdo/w2gX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZmR0CJxz30hf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:09:42 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DH9JsB023745;
	Tue, 13 Jun 2023 17:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=b048L4Es89zXJhgbgHtFgRLsJ/7vFLw0apd174PjJnY=;
 b=jdo/w2gXxnlVBigG+la9eVavxTwX2sAn6Z1fxWNEwfcH2Lgfno7Z6MnSqUe73VYIlSdT
 NFNL9oQWUg3c6lS+MbDId3Ym9zMtsAu2deonFjoEAF3mtoy4/2lixJ6CaZme2I/vtySV
 Uyc7EXrlcGxMlBQy+4nfIldRaBDjg4T6j/Y4iLB4YFoJ7/oWl4vDI5+vc+M5teKfoUvo
 Yfhtk2zY1ygI2JU1BZQqHBT/Nj9iHqAGKhp95MGa6Y9Qzn4PSozZL+SY5WLx1w29fcex
 iTig+w69rOwc5uALWwCczmD0nqTtvK4IOZmf0A63gmXauN70LOn9+mYJ1lYOpRRJE1gn 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v94remt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:09:34 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH9V17025140;
	Tue, 13 Jun 2023 17:09:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v94re6x-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:09:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D1QJOx008529;
	Tue, 13 Jun 2023 16:41:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee2a69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:41:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGfskL55312834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:41:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B9332004B;
	Tue, 13 Jun 2023 16:41:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FC4520043;
	Tue, 13 Jun 2023 16:41:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:41:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 00/17] tool/perf/test: Fix shellcheck coding/formatting issues of test shell scripts
Date: Tue, 13 Jun 2023 22:11:28 +0530
Message-Id: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V5eZJ5wppojWsx28c92xj8LHhfKWNewm
X-Proofpoint-ORIG-GUID: i_o7wYRHjwvMmh_vzK0xqEOKFIWNAVE7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130151
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

Patchset covers a set of fixes for coding/formatting issues observed while
running shellcheck tool on the perf test shell scripts. Shellcheck is a static
analysis tool that can find semantic/syntax bugs in the shell scripts.

Patches 1-14 fixes the issues found with shellcheck. Patch 15, 16
and patch 17 address a fix in task_analyzer test.

This cleanup is a pre-requisite to include a build option for shellcheck
discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
Also this is first set of patches. There will be one more set which will
include build option for shellcheck as discussed in the mail thread.

Abhirup Deb (2):
  tools/perf/tests: fix test_arm_spe.sh signal case issues
  perf/tests/shell: fix shellscript errors for lock_contention.sh

Aboorva Devarajan (1):
  tools/perf/tests: Fix shellcheck issues in test_task_analyzer.sh file

Aditya Gupta (3):
  perf tests task_analyzer: fix bad substitution ${$1}
  perf tests task_analyzer: print command on failure
  perf tests task_analyzer: skip tests if no libtraceevent support

Akanksha J N (1):
  tools/perf/tests: Fix shellcheck warnings for
    trace+probe_vfs_getname.sh

Anushree Mathur (1):
  perf/tests/shell : Shellcheck fixes for perf test
    "test_arm_coresight.sh"

Barnali Guha Thakurata (1):
  tools/perf/tests/shell/stat_all_metrics: Fix shellcheck warning SC2076
    in stat_all_metrics.sh

Disha Goel (1):
  tools/perf/tests: fix shellcheck warning for stat+json_output

Geetika (1):
  tools/perf/tests: Fix all POSIX sh warnings in perf shell test
    test_brstack.sh

Korrapati Likhitha (1):
  tools/perf/tests: Fix shellcheck warnings for stat+csv_output

Samir Mulani (1):
  tools/perf/tests: fixed shellcheck warnings for perf shell scripts

Shirisha G (1):
  tools/perf/tests: fix shellcheck warnings for daemon.sh

Sourabh Jain (1):
  perf: get rid of unused import

Spoorthy S (2):
  shellcheck : fixing signal names and adding double quotes for
    expression in test_arm_callgraph_fp
  tools/perf/tests: Fix all POSIX sh warnings in stat+shadow_stat.sh

 .../scripts/python/arm-cs-trace-disasm.py     |   1 -
 tools/perf/tests/shell/buildid.sh             |  12 +-
 tools/perf/tests/shell/daemon.sh              | 113 ++++++++++++------
 tools/perf/tests/shell/lock_contention.sh     |  70 +++++------
 .../shell/record+probe_libc_inet_pton.sh      |   6 +-
 .../shell/record+script_probe_vfs_getname.sh  |   4 +-
 tools/perf/tests/shell/stat+csv_output.sh     |   4 +-
 tools/perf/tests/shell/stat+json_output.sh    |   2 +-
 tools/perf/tests/shell/stat+shadow_stat.sh    |   4 +-
 tools/perf/tests/shell/stat_all_metrics.sh    |   6 +-
 .../perf/tests/shell/test_arm_callgraph_fp.sh |   6 +-
 tools/perf/tests/shell/test_arm_coresight.sh  |   6 +-
 tools/perf/tests/shell/test_arm_spe.sh        |   2 +-
 tools/perf/tests/shell/test_brstack.sh        |  12 +-
 tools/perf/tests/shell/test_task_analyzer.sh  |  98 ++++++++-------
 .../tests/shell/trace+probe_vfs_getname.sh    |   6 +-
 16 files changed, 203 insertions(+), 149 deletions(-)

-- 
2.39.1

