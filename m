Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2A506B65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 13:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjMXb47gtz3bdL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 21:49:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j8NWSlx2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j8NWSlx2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjMWx1n3Cz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 21:48:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23J94H7p019804; 
 Tue, 19 Apr 2022 11:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9FoH/1CHBJwPp0OhD3CXyI1rqGmrCYxqPOaTaiUf+kA=;
 b=j8NWSlx2t+t8QeSX2pz3SFtutlCYJUIZpnvxOFwJddkwELQNWRE5KrOTL6toFTOzcYgT
 rPw/HAy91l0S4Jdy4XmtsiNTvdADwZZe8PHrWGARixBPOaHrSj7mVve0U1gOMNkkhbUs
 kvsH5IoPDPG1ZZQU7jqZ7JQFX6TP2DOkt4BncwbdLD9SrGt/KpmIzjC4zRMbdsEcY7f/
 jqkHzD7QUW3JT2j+Bio9fkdAy8VjKp2yksZ55IA73aNq1XikgIKJzixzqreWj2lqNgkd
 kHtYbn11HzzWQ8brB5e/bcoJyeoLD3+dTIl/NF9xRWlqFOIKrukns1axlVzLGcR42vB4 ig== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7bt5ss5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 11:48:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23JBl0FM031540;
 Tue, 19 Apr 2022 11:48:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3ffne93e7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 11:48:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23JBZlBS28770784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 11:35:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0020EA404D;
 Tue, 19 Apr 2022 11:48:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAE49A4040;
 Tue, 19 Apr 2022 11:48:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.73.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 11:48:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 1/2] powerpc/perf: Fix the power9 event alternatives array
 to have correct sort order
Date: Tue, 19 Apr 2022 17:18:27 +0530
Message-Id: <20220419114828.89843-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _vMH_rfvLrLOsDYX7L1di9FNoDY0s-DR
X-Proofpoint-GUID: _vMH_rfvLrLOsDYX7L1di9FNoDY0s-DR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 mlxscore=0 mlxlogscore=952 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190064
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

When scheduling a group of events, there are constraint checks
done to make sure all events can go in a group. Example, one of
the criteria is that events in a group cannot use same PMC.
But platform specific PMU supports alternative event for some
of the event codes. During perf_event_open, if any event
group doesn't match constraint check criteria, further lookup
is done to find alternative event.

By current design, the array of alternatives events in PMU
code is expected to be sorted by column 0. This is because in
find_alternative() function, the return criteria is based on
event code comparison. ie "event < ev_alt[i][0])". This
optimisation is there since find_alternative() can get called
multiple times. In power9 PMU code, the alternative event array
is not sorted list and hence there is breakage in finding
alternative event.

To work with existing logic, fix the alternative event array
to be sorted by column 0 for power9-pmu.c

Results:

With alternative events, multiplexing can be avoided. That is, 
for example, in power9 PM_LD_MISS_L1 (0x3e054) has alternative
event, PM_LD_MISS_L1_ALT (0x400f0). This is an identical event
which can be programmed in a different PMC.

<< Before patch >>

 # perf stat -e r3e054,r300fc
^C
 Performance counter stats for 'system wide':

           1057860      r3e054              (50.21%)
               379      r300fc              (49.79%)

       0.944329741 seconds time elapsed
       
Since both the events are using PMC3 in this case, they are
multiplexed here.

<<With patch>>

 # perf stat -e r3e054,r300fc
^C
 Performance counter stats for 'system wide':

           1006948      r3e054
               182      r300fc
<<>>

Fixes: 91e0bd1e6251 ("powerpc/perf: Add PM_LD_MISS_L1 and PM_BR_2PATH to power9 event list")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 Added Fixes tag and reworded commit message.
 Added Reviewed-by from Maddy.
 v2 -> v3:
 Added info about what is the breakage with current
 code.

 arch/powerpc/perf/power9-pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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

