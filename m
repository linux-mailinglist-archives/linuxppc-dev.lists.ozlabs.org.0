Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902A4F67C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:42:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYWzr3JKQz3bdp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 03:42:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QAUnmT69;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QAUnmT69; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYWz62xpYz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 03:41:37 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236F16sE022229; 
 Wed, 6 Apr 2022 17:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=t6cmvtnlTfByGWWD1UjXGdi7gwnyC3bRIgmDKYQTktc=;
 b=QAUnmT69JiKxw9DU5cV9qhTWvLvHmlAAJjG13RJqh9HicwohgZkwERYyKEWGDvpBGJfw
 xMCf4Jqxwjni6Ppafi/I/c/rXxumymXb7E7pVEBw9GD4rf47un0DpMuEQlycNMciTRPs
 DSe0B9MJ2nx+ht8Oy+uXNdX5HE6FvWr4Pog+uLl9w9/ppiLPYJ375nXa9khNzM2V8HOm
 fmuixmqvFJkdbhwAdnMEBBaSx7Mw1LD7S49a4k/Lz/Rvp5z107CMTJwsIGMPJzpLB+I4
 gHw1kTFM6cPGS0qFOZKwn3fglDuM7m1GRYVmm7maDYmtZUT4cgTNneSkkRHHh/GIvnMZ qA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f96s7v4ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:41:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 236HXgE6028706;
 Wed, 6 Apr 2022 17:41:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3f6e4907vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:41:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 236HfPqL43123066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 17:41:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4CD64C044;
 Wed,  6 Apr 2022 17:41:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A5254C040;
 Wed,  6 Apr 2022 17:41:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.90.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 17:41:23 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix the event alternatives array to have
 correct sort order
Date: Wed,  6 Apr 2022 23:11:21 +0530
Message-Id: <20220406174121.87837-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m6oMPeKjmuZhoJBb0Uyfi6ynTRf_lpvf
X-Proofpoint-ORIG-GUID: m6oMPeKjmuZhoJBb0Uyfi6ynTRf_lpvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_09,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204060087
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Platform specific PMU supports alternative event for some
of the event codes. During perf_event_open, if any event
group doesn't match constraint check criteria, further lookup
is done to find alternative event. Code checks to see if
it is possible to schedule event as group using alternative
events.

Currently the array of alternatives events in PMU code is expected
to be sorted by column 0. This is because in find_alternative()
function, the return criteria is based on event code comparison.
ie "event < ev_alt[i][0])". If the input "event" code is less
than event code in table of alternative events, the search will end.
This optimisation that it has to be sorted is used since
find_alternative() potentially gets called a lot. In power9/power10
PMU code, the alternative event array is not sorted list and hence
there is breakage in finding alternative event.

To work with existing logic, fix the alternative event array
to be sorted by column 0 for power9-pmu.c and power10-pmu.c

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/power10-pmu.c | 2 +-
 arch/powerpc/perf/power9-pmu.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index d3398100a60f..c6d51e7093cf 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -91,8 +91,8 @@ extern u64 PERF_REG_EXTENDED_MASK;
 
 /* Table of alternatives, sorted by column 0 */
 static const unsigned int power10_event_alternatives[][MAX_ALT] = {
-	{ PM_CYC_ALT,			PM_CYC },
 	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
+	{ PM_CYC_ALT,			PM_CYC },
 };
 
 static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index c9eb5232e68b..c393e837648e 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -133,11 +133,11 @@ int p9_dd22_bl_ev[] = {
 
 /* Table of alternatives, sorted by column 0 */
 static const unsigned int power9_event_alternatives[][MAX_ALT] = {
-	{ PM_INST_DISP,			PM_INST_DISP_ALT },
-	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
-	{ PM_RUN_INST_CMPL_ALT,		PM_RUN_INST_CMPL },
-	{ PM_LD_MISS_L1,		PM_LD_MISS_L1_ALT },
 	{ PM_BR_2PATH,			PM_BR_2PATH_ALT },
+	{ PM_INST_DISP,			PM_INST_DISP_ALT },
+	{ PM_RUN_CYC_ALT,               PM_RUN_CYC },
+	{ PM_LD_MISS_L1,                PM_LD_MISS_L1_ALT },
+	{ PM_RUN_INST_CMPL_ALT,         PM_RUN_INST_CMPL },
 };
 
 static int power9_get_alternatives(u64 event, unsigned int flags, u64 alt[])
-- 
2.35.1

