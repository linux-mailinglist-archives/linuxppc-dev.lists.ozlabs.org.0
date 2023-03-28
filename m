Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE66CBDB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 13:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm6vZ0l27z3fV0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:31:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O82Pp87J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O82Pp87J;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm6tb2lvNz3cQl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 22:30:30 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SA9niV032356;
	Tue, 28 Mar 2023 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=xg+YHkHsXs8AGiJdTQbMYjOZVaBsjGkAIQA4bEe0A6I=;
 b=O82Pp87JAook/vwJBVPqkNI781KCwMa2mBHS0JOXUBkCEpLRwFN+cHHQScU5apUCsbm2
 K8ogNYtRRuNB7p8/mK4UD6YTPS7h7P4CchdMSPeg6to6nL46BP3KGhnODtffaSKjSzTj
 jP82EpzOnm4P+9LfPSSdHt7lETdtI6qOIZjQ8aMGarZHC/qKw0kack1FavBnge03Rz24
 c7l5HM6uoIeXjUI9GPceklNzwob7G4FOTcRuQgMFu7l4YvM7A4jY8tXhAiGnlDZXI3AX
 cluRJnrM+IBjFzDH5whlaecPESjEkzw0KmGQUNJ9TO1ZWuuf9McPLFodB53GFE3+v4k0 Og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkwy1244k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:30:19 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SB0h0J004434;
	Tue, 28 Mar 2023 11:30:18 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkwy123v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:30:18 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32S3TmHL003455;
	Tue, 28 Mar 2023 11:30:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3phrk6ub3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:30:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32SBTvXH31064782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 11:29:57 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C48DF20040;
	Tue, 28 Mar 2023 11:29:57 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4203420043;
	Tue, 28 Mar 2023 11:29:47 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.76.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Mar 2023 11:29:47 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH] perf vendor events power9: Remove UTF-8 characters from json files
Date: Tue, 28 Mar 2023 16:59:08 +0530
Message-Id: <20230328112908.113158-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6Alt45yqNPqB4Hrequa2KkD-STTXbzNn
X-Proofpoint-ORIG-GUID: CvoFLTqPOpcFawLY0NzQQjuuwGBPYQMY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280091
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
Cc: irogers@google.com, maddy@linux.ibm.com, disgoel@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.com>, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
added and updated power9 pmu json events. However some of the json
events which are part of other.json and pipeline.json files,
contains UTF-8 characters in their brief description.
Having UTF-8 character could brakes the perf build on some distros.
Fix this issue by removing the UTF-8 characters from other.json and
pipeline.json files.

Result without the fix patch:
[command]# file -i pmu-events/arch/powerpc/power9/*
pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/other.json:          application/json; charset=utf-8
pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=utf-8
pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii

Result with the fix patch:

[command]# file -i pmu-events/arch/powerpc/power9/*
pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/other.json:          application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii

Fixes: 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
Link: https://lore.kernel.org/lkml/ZBxP77deq7ikTxwG@kernel.org/
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/pmu-events/arch/powerpc/power9/other.json    | 4 ++--
 tools/perf/pmu-events/arch/powerpc/power9/pipeline.json | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power9/other.json b/tools/perf/pmu-events/arch/powerpc/power9/other.json
index 3f69422c21f9..f10bd554521a 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/other.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/other.json
@@ -1417,7 +1417,7 @@
   {
     "EventCode": "0x45054",
     "EventName": "PM_FMA_CMPL",
-    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only. "
+    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only."
   },
   {
     "EventCode": "0x201E8",
@@ -2017,7 +2017,7 @@
   {
     "EventCode": "0xC0BC",
     "EventName": "PM_LSU_FLUSH_OTHER",
-    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the “bad dval” back and flush all younger ops)"
+    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the 'bad dval' back and flush all younger ops)"
   },
   {
     "EventCode": "0x5094",
diff --git a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
index d0265f255de2..723bffa41c44 100644
--- a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
@@ -442,7 +442,7 @@
   {
     "EventCode": "0x4D052",
     "EventName": "PM_2FLOP_CMPL",
-    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg "
+    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg"
   },
   {
     "EventCode": "0x1F142",
-- 
2.39.1

