Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E652B65B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 11:30:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L374X0Wj2z3cFd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 19:30:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ce1HV8DF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ce1HV8DF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L373n0s0rz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 19:29:24 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I9Jgcr032514;
 Wed, 18 May 2022 09:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=laJdj4sx12aZhshlPWONa65aRFSh9J7ElHIerkBUs44=;
 b=Ce1HV8DFEhoWrrO1ApZAOKsh/A930gduH3PMOG+6dnVO4pVF6UtfZA2JGch1WKPTZfMW
 HI6D1lUjPSRbKaq4jDbP3/j6hr+KlbrO2j+eUhn0P8IHmlPu6Poq4K7gxjfnxf/9oUxB
 I3kSuZiKdcauuyoYqOdOQlG/G3F1Mtc2Nu5mHD0+jJzkPRAV2KmdOdLHPr2O6CeXSgjJ
 YGKLC1frWQYAlmt8SBKY9ScSp04kNOyNHgEC7DCzmnirLUr1T9FOX5ml6KCtUr3Bx9Ul
 EqbioMIFDTEWpgY3hGYkrNNkfK1bo7VtiENk6Si3MdgndWYnNkWPvIJ9t+Mh2zZE+cXt aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4x2t85a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:29:18 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24I9PmIx004992;
 Wed, 18 May 2022 09:29:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4x2t859s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:29:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I9SRKL013712;
 Wed, 18 May 2022 09:29:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3g2428vdet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:29:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24I9TCPl45941216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 09:29:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E538D52050;
 Wed, 18 May 2022 09:29:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.14.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4881652051;
 Wed, 18 May 2022 09:29:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
Date: Wed, 18 May 2022 14:59:03 +0530
Message-Id: <20220518092903.7065-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A8eDoEaPQr1_XPxcn22nsJdhEQHyUwxx
X-Proofpoint-GUID: 0el3cysM-VBWMCDLuRj-dmw8hkTFV4IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180048
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
 kjain@linux.ibm.com, linux-perf-users@vger.kernel.org,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"perf all PMU test" picks the input events from
"perf list --raw-dump pmu" list and runs "perf stat -e"
for each of the event in the list. In case of powerpc, the
PowerVM environment supports events from hv_24x7 and hv_gpci
PMU which is of example format like below:
- hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
- hv_gpci/event,partition_id=?/

The value for "?" needs to be filled in depending on
system and respective event. CPM_ADJUNCT_INST needs have
core value and domain value. hv_gpci event needs partition_id.
Similarly, there are other events for hv_24x7 and hv_gpci
having "?" in event format. Hence skip these events on powerpc
platform since values like partition_id, domain is specific
to system and event.

Fixes: 3d5ac9effcc6 ("perf test: Workload test of all PMUs")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
index b30dba455f36..4a854b545bec 100755
--- a/tools/perf/tests/shell/stat_all_pmu.sh
+++ b/tools/perf/tests/shell/stat_all_pmu.sh
@@ -5,6 +5,16 @@
 set -e
 
 for p in $(perf list --raw-dump pmu); do
+  # In powerpc, skip the events for hv_24x7 and hv_gpci.
+  # These events needs input values to be filled in for
+  # core, chip, patition id based on system.
+  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
+  # hv_gpci/event,partition_id=?/
+  # Hence skip these events for ppc.
+  if lscpu  |grep ppc && echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
+    echo "Skipping: Event '$p' in powerpc"
+    continue
+  fi
   echo "Testing $p"
   result=$(perf stat -e "$p" true 2>&1)
   if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
-- 
2.35.1

