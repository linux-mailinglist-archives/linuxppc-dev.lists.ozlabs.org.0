Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB8760A2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 08:17:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JMvyFsI0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R96K05C5zz3bVp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 16:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JMvyFsI0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R96J43CCsz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 16:17:07 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P690T9030295;
	Tue, 25 Jul 2023 06:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qg5UToZ80SPAYRKfm6KKrmL+JXtqbCd/dGOHTSiGNHU=;
 b=JMvyFsI0zm1npG/I75aUbd7nNdvNvC2HmCWu3hKf6XiTDYkz2KdDcm66rq35ksT/H46Q
 wuOMscKuVEquoVYHjNU2ajrb2XH4cK/Mq3FXEL5DSm7skn6osGS5cT7gRFN1gUT4qeR0
 6kkoZg45KG+LrfcHn5C9T3G/wv6HOeDSOTkSq8inzSG6sSMUul2efKha7kM58/BvdQgW
 8PKwIMVF5ozzYjJSn+HDnKeP2l9X1hZlkSZuRu36AsogZiZE46y1xNINw7oHrlcW7zM7
 dDDR6iGxXKjygHC1GoX/RJpFj2v10AqJYrN0IHG8M0oa3zlZoKA0grSXkP9BL4jOeuFP /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s25vjkamg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 06:17:01 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36P695KO030996;
	Tue, 25 Jul 2023 06:17:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s25vjkam8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 06:17:01 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P57YMH026189;
	Tue, 25 Jul 2023 06:17:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0sert2h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 06:17:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P6GvuA15074024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 06:16:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C40C020040;
	Tue, 25 Jul 2023 06:16:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0027D2004B;
	Tue, 25 Jul 2023 06:16:54 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com.com (unknown [9.179.8.104])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 06:16:53 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/1] perf tests task_analyzer: Check perf build options for libtraceevent support
Date: Tue, 25 Jul 2023 11:46:49 +0530
Message-ID: <20230725061649.34937-1-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Au2LeecZb0ZVeUe0LYRK4dYEaek8Iiwh
X-Proofpoint-ORIG-GUID: 7gVAge_J8glCS1OU5AXol1nqlG2cPNmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_02,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250054
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we depend on output of 'perf record -e "sched:sched_switch"', to
check whether perf was built with libtraceevent support.

Instead, a more straightforward approach can be to check the build options,
using 'perf version --build-options', to check for libtraceevent support.

When perf is compiled WITHOUT libtraceevent ('make NO_LIBTRACEEVENT=1'),
'perf version --build-options' outputs (output trimmed):

	 ...
         libtraceevent: [ OFF ]  # HAVE_LIBTRACEEVENT
	 ...

While, when perf is compiled WITH libtraceevent,

'perf version --build-options' outputs:

...
         libtraceevent: [ on ]  # HAVE_LIBTRACEEVENT
	 ...

Suggested-by: Ian Rogers <irogers@google.com>
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---

 tools/perf/tests/shell/test_task_analyzer.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index 0095abbe20ca..a28d784987b4 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -52,7 +52,7 @@ find_str_or_fail() {
 
 # check if perf is compiled with libtraceevent support
 skip_no_probe_record_support() {
-	perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
+	perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && return 2
 	return 0
 }
 
-- 
2.41.0

