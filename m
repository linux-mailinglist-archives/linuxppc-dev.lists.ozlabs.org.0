Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850152D858
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 17:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3vL61pyMz3blD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 01:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6GV6057;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h6GV6057; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3vKR3t4Rz2yny
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 01:43:55 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JDZo2n011386;
 Thu, 19 May 2022 15:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=adZC8wvyxdaVHqplMN4gKd7dtyqqxKTM0NA28ID9UC4=;
 b=h6GV6057seEOCJXKzjL+l5A8MuvlwW2ara4oNEVgwXFc9M1UYMmKyiFkJuunv6xhcPHK
 wyRIaeINWFq2m4NII8RY+QXklnsJywAxplWDlWPUSSGnSv2a2jStXF2aqWLSMpoXvwqB
 4McEr83RUfwffX71d77t6aa6lBD6wWiC0xCPZyEZpjgU+N1TIjqQm9vCOA4rRCIbXGIs
 k4N4iFq6JXPhIhaHjbEJAnjQ6iS2psZ7Bpjg1Sq3g89GyBo45Y/Z8VYHQWNL8egdgQd5
 4c2wJy1VkA0fDosxLEeTAugRVlesLbs9q91vl5l5bA9mmHsz4nZKnKUosDZMr00pXiZP GA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5pwvuh0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 15:43:37 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24JFasHt019462;
 Thu, 19 May 2022 15:43:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3g2428p7kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 15:43:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24JFTcmG27263462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 15:29:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7163A4054;
 Thu, 19 May 2022 15:43:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F339A405F;
 Thu, 19 May 2022 15:43:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.122.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 15:43:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V2] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
Date: Thu, 19 May 2022 21:13:24 +0530
Message-Id: <20220519154324.12531-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NApTNh27Bd31ZcyUAUzyPAOiMBj0W6U7
X-Proofpoint-ORIG-GUID: NApTNh27Bd31ZcyUAUzyPAOiMBj0W6U7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_04,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190092
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
Changelog:
 v1 -> v2:
 Instead of checking for platform, used the pmu name
 ie, hv_24x7 and hv_gpci to skip the test since this
 pmu name is specific to powerpc as suggested by
 Michael Ellerman.

 tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
index b30dba455f36..7d046bb8a7b9 100755
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
+  if echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
+    echo "Skipping: Event '$p' in powerpc"
+    continue
+  fi
   echo "Testing $p"
   result=$(perf stat -e "$p" true 2>&1)
   if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
-- 
2.35.1

