Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F228C72E90F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dg5r3mPK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZmv6TxPz30fQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dg5r3mPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZky1ydrz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:08:25 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkB9A005223;
	Tue, 13 Jun 2023 17:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wv/VwbY3EJkKp0AtdvkkDZp/XfJYRNTALH154pMMAfU=;
 b=Dg5r3mPK5gT87evjMBRNR+o22R8Szft4EtS2TfhpE6GOxb0FA+WcnLu6TG3tIrP4I8nT
 tarqZnNmnAfKrbFQ8sv/Tw8RQc4jRF0GODx7vD1ogPIwj4LQJOTJkNmsR4kMkWzlbqoh
 L+1ql8G/msTQjinGctAbT6qQ1QmipwvDLVuLaJ5DC45fMXA98sbeSXfqhbhbGhKZ590a
 OkkJRktyuOLaUGuwqX/knYpg8lCZssJEJQZJNjZG0yYn+xlOltWCEXKmAONLZkm53DNZ
 BUvgcvMI65nNlugTU7KPtRKMWl7jvkgGtTJlHZWBAP5Jn8kSc30xixgE7cq8mQzSE4bG lA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs1e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:18 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH8D9R003281;
	Tue, 13 Jun 2023 17:08:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs0yw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D9HtPj009704;
	Tue, 13 Jun 2023 16:42:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee2a76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgPpL27591352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6454220040;
	Tue, 13 Jun 2023 16:42:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B20D42004B;
	Tue, 13 Jun 2023 16:42:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:21 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 05/17] tools/perf/tests: Fix shellcheck warnings for stat+csv_output
Date: Tue, 13 Jun 2023 22:11:33 +0530
Message-Id: <20230613164145.50488-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sWroi7Gt8tt3el5p326X4-0PK0Qs--D2
X-Proofpoint-ORIG-GUID: ig5jLKFWcvjS-2QyEqR7Z64nQOaFfEt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=971 phishscore=0 impostorscore=0
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Korrapati Likhitha <likhitha@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Sathvika Vasireddy <sv@linux.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Korrapati Likhitha <likhitha@linux.ibm.com>

Running the shellcheck on stat+csv_output resulted in the
following warning.

Result with shellcheck  without patch:
=====
$ shellcheck -S warning stat+csv_output.sh

In stat+csv_output.sh line 23:
         [ $(uname -m) = "s390x" ] && exp='^[6-7]$'
           ^---------^ SC2046: Quote this to prevent word splitting.
In stat+csv_output.sh line 51:
[ $(id -u) != 0 ] && [ $(cat /proc/sys/kernel/perf_event_paranoid) -gt $1 ]
  ^------^ SC2046: Quote this to prevent word splitting.
                       ^-- SC2046: Quote this to prevent word splitting.
=====

Fixed the warning SC2046 by adding quotes to prevent word splitting.

Result with shellcheck with patch:
=====
$ shellcheck -S warning tests/shell/stat+csv_output.sh
$ ./perf test "stat CSV output linter"
 96: perf stat CSV output linter                                     : Ok
=====

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Korrapati Likhitha <likhitha@linux.ibm.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/perf/tests/shell/stat+csv_output.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/stat+csv_output.sh b/tools/perf/tests/shell/stat+csv_output.sh
index fb78b6251a4e..59607fb3cd98 100755
--- a/tools/perf/tests/shell/stat+csv_output.sh
+++ b/tools/perf/tests/shell/stat+csv_output.sh
@@ -35,7 +35,7 @@ function commachecker()
 	;; "--interval")	exp=7
 	;; "--per-thread")	exp=7
 	;; "--system-wide-no-aggr")	exp=7
-				[ $(uname -m) = "s390x" ] && exp='^[6-7]$'
+				[ "$(uname -m)" = "s390x" ] && exp='^[6-7]$'
 	;; "--per-core")	exp=8
 	;; "--per-socket")	exp=8
 	;; "--per-node")	exp=8
@@ -65,7 +65,7 @@ function commachecker()
 # Return true if perf_event_paranoid is > $1 and not running as root.
 function ParanoidAndNotRoot()
 {
-	 [ $(id -u) != 0 ] && [ $(cat /proc/sys/kernel/perf_event_paranoid) -gt $1 ]
+	 [ "$(id -u)" != 0 ] && [ "$(cat /proc/sys/kernel/perf_event_paranoid)" -gt $1 ]
 }
 
 check_no_args()
-- 
2.39.1

