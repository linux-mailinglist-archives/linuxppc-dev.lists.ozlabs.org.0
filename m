Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE0506B67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 13:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjMYK5F89z3bql
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 21:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hyJXjh8y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hyJXjh8y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjMWx36ftz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 21:48:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JBixIu024128; 
 Tue, 19 Apr 2022 11:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H4vJphjH5WpMWPhviwxS9TsozADhHMFMc1JexMZO3f4=;
 b=hyJXjh8yCifm3PXHxBcqyQlei722VEbPqFOBslGYvU5/9QR/XvBZucPZPTtUIJtYh3Bq
 Mgxu0QVJBAStnYhI1JaltVtGoM8EHz40StS/k84hvNySLulcV0QV/5EibuJ9RH0pQsts
 +AvNWpjE4BSFUzSOVDDDfz5BIMyJVFZEop0gYhAYYBqQV1z+sKR22tc+WEOve3wP3LJV
 4b1D2S/TesXGmCxx1YPLZmL5QIa5svT+MCPMkpSl43aXOk9SHuUzAcQrPyAml0J5aNUI
 0XEMO2ISDHXRy6Uglh5v5TcVkhJcsouXZxzzOvVb7TlQp8SlLbtGa+DA3R2JLbZNF9V2 xQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7vnv985-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 11:48:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23JBlbek009017;
 Tue, 19 Apr 2022 11:48:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3ffn2hvakt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 11:48:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23JBmaSo46203232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 11:48:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C940A404D;
 Tue, 19 Apr 2022 11:48:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7954A4040;
 Tue, 19 Apr 2022 11:48:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.73.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 11:48:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 2/2] powerpc/perf: Fix the power10 event alternatives array
 to have correct sort order
Date: Tue, 19 Apr 2022 17:18:28 +0530
Message-Id: <20220419114828.89843-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419114828.89843-1-atrajeev@linux.vnet.ibm.com>
References: <20220419114828.89843-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8wf5v7WUaEmU1nJ90POxhbvrIs7Xtq90
X-Proofpoint-GUID: 8wf5v7WUaEmU1nJ90POxhbvrIs7Xtq90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
multiple times. In power10 PMU code, the alternative event array
is not sorted list and hence there is breakage in finding 
alternative event.

To work with existing logic, fix the alternative event array
to be sorted by column 0 for power10-pmu.c

Results:

In case where an alternative event is not chosen when we could,
events will be multiplexed. ie, time sliced where it could
actually run concurrently.
Example, in power10 PM_INST_CMPL_ALT(0x00002) has alternative
event, PM_INST_CMPL(0x500fa). Without the fix, if a group of
events with PMC1 to PMC4 is used along with PM_INST_CMPL_ALT,
it will be time sliced since all programmable PMC's are
consumed already. But with the fix, when it picks alternative
event on PMC5, all events will run concurrently.

<< Before Patch >>
 # perf stat -e r00002,r100fc,r200fa,r300fc,r400fc
^C
 Performance counter stats for 'system wide':

         328668935      r00002               (79.94%)
          56501024      r100fc               (79.95%)
          49564238      r200fa               (79.95%)
               376      r300fc               (80.19%)
               660      r400fc               (79.97%)

       4.039150522 seconds time elapsed

With the fix, since alternative event is chosen to run
on PMC6, events will be run concurrently.

<< After Patch >>
 # perf stat -e r00002,r100fc,r200fa,r300fc,r400fc
^C
 Performance counter stats for 'system wide':

          23596607      r00002
           4907738      r100fc
           2283608      r200fa
               135      r300fc
               248      r400fc

       1.664671390 seconds time elapsed

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 Added Fixes tag and reworded commit message
 Added Reviewed-by from Maddy
 v2 -> v3:
 Added info about what is the breakage with current 
 code.

 arch/powerpc/perf/power10-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.35.1

