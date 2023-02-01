Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9D686D9E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 19:05:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6VFz2cntz3ccq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 05:05:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S1QQK2XQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S1QQK2XQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6VF10MXdz3cMP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 05:04:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311HxKkf036895;
	Wed, 1 Feb 2023 18:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hXLi2qY5QLfLOVLWh+TuLq4zumWJvk8PqjWCjMVKkes=;
 b=S1QQK2XQB7vgxk9y6nJ7HRAiLj3llNq29FOB+XzqvAEdWFkIFvce5gYHKqMdTuUQ145d
 uWSRdsbJYaD2fp/nMTQXihEkLK9ZTts4lrlrQU34me+FmD6ILm9QdI8h6GY9zWTDYTjs
 qjxr7SX+X3cnO8W78e9SA5U4snHAvyvZ65Mqp+R+O/Vmfq2s5EAYhUVpqVId7q8Kereq
 LYEyDte40L9LjUWFLjT1+CERxBV+BV8cWx1n3u9agV+wv9Uj3fDWj9FP+sFUK+DmbYaN
 ErZus6voxB/KY5VLKQtQhl2Q0AJXg6m5DIVyj95PZnavXKpNBBPHugKt4jIZximr2041 Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfvydg58n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 18:04:32 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311I0KT5040664;
	Wed, 1 Feb 2023 18:04:31 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfvydg57u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 18:04:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3116j675013346;
	Wed, 1 Feb 2023 18:04:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshbqry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 18:04:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311I4Q8621299904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 18:04:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11C2020040;
	Wed,  1 Feb 2023 18:04:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB63B20043;
	Wed,  1 Feb 2023 18:04:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.62.134])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 18:04:22 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 1/2] tests/shell: Add check for perf data file in record+probe_libc_inet_pton test
Date: Wed,  1 Feb 2023 23:34:20 +0530
Message-Id: <20230201180421.59640-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MGrcvA7yj8gUX6iazSOSCWu-H41nbRyZ
X-Proofpoint-ORIG-GUID: Y4TAiEWyZVVvS9piOm1TYwqP9Ug8oOTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010155
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"probe libc's inet_pton & backtrace it with ping" test
installs a uprobe and uses perf record/script to check
the backtrace. Currently even if the "perf record" fails,
the test reports success. Logs below:

 # ./perf test -v "probe libc's inet_pton & backtrace it with ping"
 81: probe libc's inet_pton & backtrace it with ping                 :
--- start ---
test child forked, pid 304211
failed to open /tmp/perf.data.Btf: No such file or directory
test child finished with 0
---- end ----
probe libc's inet_pton & backtrace it with ping: Ok

Fix this by adding check for presence of perf.data file
before proceeding with "perf script".

With the patch changes, test reports fail correctly.

 # ./perf test -v "probe libc's inet_pton & backtrace it with ping"
 81: probe libc's inet_pton & backtrace it with ping                 :
--- start ---
test child forked, pid 304358
FAIL: perf record failed to create "/tmp/perf.data.Uoi"
test child finished with -1
---- end ----
probe libc's inet_pton & backtrace it with ping: FAILED!

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index 57e7a6a470c9..08cdd902d0cf 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -58,6 +58,11 @@ trace_libc_inet_pton_backtrace() {
 	perf_data=`mktemp -u /tmp/perf.data.XXX`
 	perf_script=`mktemp -u /tmp/perf.script.XXX`
 	perf record -e $event_name/$eventattr/ -o $perf_data ping -6 -c 1 ::1 > /dev/null 2>&1
+	# check if perf data file got created in above step.
+	if [ ! -e $perf_data ]; then
+		printf "FAIL: perf record failed to create \"%s\" \n" "$perf_data"
+		return 1
+	fi
 	perf script -i $perf_data | tac | grep -m1 ^ping -B9 | tac > $perf_script
 
 	exec 3<$perf_script
-- 
2.39.0

