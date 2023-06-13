Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D472E910
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:11:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TkGdjeEK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZnt73LXz30XT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TkGdjeEK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZl022ndz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:08:28 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkHEN005364;
	Tue, 13 Jun 2023 17:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ENQmD46c5YBItFlsdaqoRkCUe0nhD//Wkt5f9ekGWCU=;
 b=TkGdjeEK+t07yuyMceLvi4nY9vUn2pHkh10fVvu25aLtGJ+gIuPqcKmEyk32wcKn7IIN
 whrgwKiqbQkrbZW79rdDk2qsbWODh2U6mOt1UDnQwn7uZGG5kuwdBsKCpkB6/JnSDs+4
 a6K/4eb6rCznlQfFcFXdFLQvrUP0fgQ4sYQAckGsgM0XlAlxvduJPkFhV809roszUnFN
 3IFm/Gfo1cFoTiTwJesjTpqdjQsr/Py9mxIurm0gNuE0d37fVpSia3Yib2GVavBnK2c8
 VOduSB8CSSozZUh8OmO+oReqA0SBIQfQFenDQxrK3gtX3fXSXA/4rjSa9jeVuLuJeNmd EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs1ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:20 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH8CV3003159;
	Tue, 13 Jun 2023 17:08:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs103-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35DFeuaE023360;
	Tue, 13 Jun 2023 16:42:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4sqb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgaxK62521632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53BBF20043;
	Tue, 13 Jun 2023 16:42:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CF7020040;
	Tue, 13 Jun 2023 16:42:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 08/17] tools/perf/tests/shell/stat_all_metrics: Fix shellcheck warning SC2076 in stat_all_metrics.sh
Date: Tue, 13 Jun 2023 22:11:36 +0530
Message-Id: <20230613164145.50488-9-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yLHv54M5GrURSpn0-2Sg_DcEePvGMGTg
X-Proofpoint-ORIG-GUID: qU4nhpVaDeRw2XBuIU9xhQW0LkLWrjzs
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Barnali Guha Thakurata <barnali@linux.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Barnali Guha Thakurata <barnali@linux.ibm.com>

Fixed shellcheck warning SC2076 in stat_all_metrics.sh.

Before the patch:
shell$ shellcheck stat_all_metrics.sh

In stat_all_metrics.sh line 9:
  if [[ "$result" =~ "${m:0:50}" ]] || [[ "$result" =~ "<not supported>" ]]
                     ^---------^ SC2076: Don't quote right-hand
side of =~, it'll match literally rather than as a regex.

In stat_all_metrics.sh line 15:
  if [[ "$result" =~ "${m:0:50}" ]]
                     ^---------^ SC2076: Don't quote right-hand
side of =~, it'll match literally rather than as a regex.

In stat_all_metrics.sh line 22:
  if [[ "$result" =~ "${m:0:50}" ]]
                     ^---------^ SC2076: Don't quote right-hand
side of =~, it'll match literally rather than as a regex.

After the patch:
shell$ shellcheck stat_all_metrics.sh
shell$

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Barnali Guha Thakurata <barnali@linux.ibm.com>
---
 tools/perf/tests/shell/stat_all_metrics.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 22e9cb294b40..54774525e18a 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -6,20 +6,20 @@ err=0
 for m in $(perf list --raw-dump metrics); do
   echo "Testing $m"
   result=$(perf stat -M "$m" true 2>&1)
-  if [[ "$result" =~ "${m:0:50}" ]] || [[ "$result" =~ "<not supported>" ]]
+  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]]
   then
     continue
   fi
   # Failed so try system wide.
   result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
-  if [[ "$result" =~ "${m:0:50}" ]]
+  if [[ "$result" =~ ${m:0:50} ]]
   then
     continue
   fi
   # Failed again, possibly the workload was too small so retry with something
   # longer.
   result=$(perf stat -M "$m" perf bench internals synthesize 2>&1)
-  if [[ "$result" =~ "${m:0:50}" ]]
+  if [[ "$result" =~ ${m:0:50} ]]
   then
     continue
   fi
-- 
2.39.1

