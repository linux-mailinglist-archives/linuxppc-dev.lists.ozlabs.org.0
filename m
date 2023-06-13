Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9872E916
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:11:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZK74EVeJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZpt1h3Zz30hn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZK74EVeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZl05j06z30Nq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:08:28 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkDau005244;
	Tue, 13 Jun 2023 17:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MJCi4rdKvumiWm1f5MMStY/3GwHkKfGUGXbY+nKZkrs=;
 b=ZK74EVeJm+lenJoWUG9WIOlFrAICHSjCZjJTFSTgA3lGZR5CLKh3xFj5piVvB+Z9E+i5
 pmqHgZ+6XmXGWu+d6WKB4EN0qDoxDXwDBLqFJaJ+oYhlaiu1SXkqVy9KzgKbbis9udQ2
 0W2a+GEJ8KwQzGKhem8La7dw89FT5HkxucBkAPx3zKD897+m//KK0gmv5nRV0fIAN0zB
 K4VteEU3RokTiEOvHep/OIxqVhqNEKh02mbmZgZex7hLYtBR/YmymxA2zRcq8LnRDWEB
 zHp4xoM6RZbAsy40rNp7xuPoy04Zfk3DhRjpoyWxIb+SA1iYINFVncJ5ApFKahxbPhP/ Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs1ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:19 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH8CV1003159;
	Tue, 13 Jun 2023 17:08:18 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs103-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:18 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35DDkE6U031182;
	Tue, 13 Jun 2023 16:42:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4sqb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgpWN26477276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC4CF20043;
	Tue, 13 Jun 2023 16:42:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED5C42004B;
	Tue, 13 Jun 2023 16:42:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 12/17] tools/perf/tests: fixed shellcheck warnings for perf shell scripts
Date: Tue, 13 Jun 2023 22:11:40 +0530
Message-Id: <20230613164145.50488-13-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qLVZjKszjqUn-ZNcSE4oxPKnY2c6u_yT
X-Proofpoint-ORIG-GUID: Y00nVgJrSLKthbk45Q3irvU--lplthlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Samir Mulani <samir@linux.vnet.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Samir Mulani <samir@linux.vnet.ibm.com>

Fixed the shellcheck warnings in buildid.sh, record+probe_libc_inet_pton.sh
and record+script_probe_vfs_getname.sh perf shell scripts:

1. Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.
2. Prefer [ p ] || [ q ] as [ p -o q ] is not well defined.
3. Used * argument to avoid the argument mixes string and array
4. Resolved issue for variable refernce, where the variable is
   being used before it has been initialized.
5. Resolved word splitting issue (syntax error).
6. The "err" variable has been removed from buildid.sh since
   it is not used anywhere in the code.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Samir Mulani <samir@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/buildid.sh                    | 12 ++++++------
 .../perf/tests/shell/record+probe_libc_inet_pton.sh  |  6 +++---
 .../tests/shell/record+script_probe_vfs_getname.sh   |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index 0ce22ea0a7f1..3383ca3399d4 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -83,12 +83,12 @@ check()
 	# in case of pe-file.exe file
 	echo $1 | grep ".exe"
 	if [ $? -eq 0 ]; then
-		if [ -x $1  -a ! -x $file ]; then
+		if [ -x $1 ] && [ ! -x $file ]; then
 			echo "failed: file ${file} executable does not exist"
 			exit 1
 		fi
 
-		if [ ! -x $file -a ! -e $file ]; then
+		if [ ! -x $file ] && [ ! -e $file ]; then
 			echo "failed: file ${file} does not exist"
 			exit 1
 		fi
@@ -136,10 +136,10 @@ test_record()
 	log_err=$(mktemp /tmp/perf.log.err.XXX)
 	perf="perf --buildid-dir ${build_id_dir}"
 
-	echo "running: perf record $@"
-	${perf} record --buildid-all -o ${data} $@ 1>${log_out} 2>${log_err}
+	echo "running: perf record $*"
+	${perf} record --buildid-all -o ${data} "$@" 1>${log_out} 2>${log_err}
 	if [ $? -ne 0 ]; then
-		echo "failed: record $@"
+		echo "failed: record $*"
 		echo "see log: ${log_err}"
 		exit 1
 	fi
@@ -172,4 +172,4 @@ if [ ${run_pe} -eq 1 ]; then
 	rm -r ${wineprefix}
 fi
 
-exit ${err}
+exit 0
diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index bbb5b3d185fa..0934fb0cd68f 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -10,8 +10,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
-. $(dirname $0)/lib/probe.sh
-. $(dirname $0)/lib/probe_vfs_getname.sh
+. "$(dirname "$0")/lib/probe.sh"
+. "$(dirname "$0")/lib/probe_vfs_getname.sh"
 
 libc=$(grep -w libc /proc/self/maps | head -1 | sed -r 's/.*[[:space:]](\/.*)/\1/g')
 nm -Dg $libc 2>/dev/null | fgrep -q inet_pton || exit 254
@@ -23,7 +23,7 @@ add_libc_inet_pton_event() {
 	event_name=$(perf probe -f -x $libc -a inet_pton 2>&1 | tail -n +2 | head -n -5 | \
 			grep -P -o "$event_pattern(?=[[:space:]]\(on inet_pton in $libc\))")
 
-	if [ $? -ne 0 -o -z "$event_name" ] ; then
+	if [ $? -ne 0 ] || [ -z "$event_name" ] ; then
 		printf "FAIL: could not add event\n"
 		return 1
 	fi
diff --git a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
index 1341437e1bd9..7f664f1889d9 100755
--- a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
@@ -9,11 +9,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
-. $(dirname $0)/lib/probe.sh
+. "$(dirname "$0")/lib/probe.sh"
 
 skip_if_no_perf_probe || exit 2
 
-. $(dirname $0)/lib/probe_vfs_getname.sh
+. "$(dirname "$0")/lib/probe_vfs_getname.sh"
 
 record_open_file() {
 	echo "Recording open file:"
-- 
2.39.1

