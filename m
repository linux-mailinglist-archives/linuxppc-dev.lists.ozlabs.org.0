Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B941F505A65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 16:57:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhqlY6ZXyz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 00:56:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7uW+irY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O7uW+irY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khqk51Qwgz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 00:55:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23IE2cah018382; 
 Mon, 18 Apr 2022 14:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2DNMORwCO7SqLoy/1TUOtM5po9aqVBmyc1UIUZIjqNE=;
 b=O7uW+irY2buHe+YSRbiZ4atZAsTw956t17IKkfwnvSslqyQJ6I37Us2H2fZQj0mzVoc0
 Vd3k0RIa35Yu6qnZloGFm0hiImfp1i3hPdKmKZMINGCTg2TBCTSdIjkR/6Vrqrzt3hmj
 OGCO0Ve3cA7cKEt7x7s4xIQxia3C2hDWaXwwODDe3qg4WcPNppiA4JuBxmFZ8YWO/6qZ
 yELLkmxh+1xsotSy3O3w8rAVvUiRMGcxeWKq2P3yMiEwUQ9CLnG1dk+XvLh/slapbGsT
 MwdDWLuecZihPYOLlNzIDdYSvWfB+X621yDX8GJQON2on8ouQ1zik7uRmFZm1+mSn0iC VA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ffpdxmcnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 14:55:34 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23IEsjMb030706;
 Mon, 18 Apr 2022 14:55:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ffvt99xdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 14:55:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23IEtUjL55902512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 14:55:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BF31AE045;
 Mon, 18 Apr 2022 14:55:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 170C6AE04D;
 Mon, 18 Apr 2022 14:55:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.2.35])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 14:55:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 2/2] powerpc/perf: Fix the power10 event alternatives array
 to have correct sort order
Date: Mon, 18 Apr 2022 20:25:20 +0530
Message-Id: <20220418145520.85753-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418145520.85753-1-atrajeev@linux.vnet.ibm.com>
References: <20220418145520.85753-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RDJTJqzvkApasD7A8vlFSmPaXjz1vdoi
X-Proofpoint-GUID: RDJTJqzvkApasD7A8vlFSmPaXjz1vdoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180085
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

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
Changelog:
 Added Fixes tag and reworded commit message
 Added Reviewed-by from Maddy

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

