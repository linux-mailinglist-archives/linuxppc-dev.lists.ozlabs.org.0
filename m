Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE40271B3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 09:11:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvwbk1wXDzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 17:11:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nvt+v8F8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvwZ10qdBzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 17:10:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08L717ZE147188; Mon, 21 Sep 2020 03:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=OGy/bn8iwEo0O1J4plxts8zWo9Frau5AWQ1yWoiWkkY=;
 b=Nvt+v8F8JDbuVh0S6jySW07YrHBPuFosVd8k+11ZRWHmESub9+gU1BVDXoRyIdpM/GkO
 U3oE6KbqQQmtUlfBJXzAhz0erkaJur6slZZZB7c4Dj2qYNnFyTkXumgC5HirFdUnq9lM
 96OPorS2cuoDtNW2T5vSr0HXDCWiifa2LlHuL0ZLqpdX1hDZ8i/gzL0Ix2efXLAeBPUv
 89nTXjPWD2hcA77hQrwFGg6PUlaBqSxpoS9wld8O/NUSBQHEbBtOQ/iZEaDacDvNt83o
 DdlsXcAQyQjxv1/VwErYSh9kvbgs+d481aac5MiPp49cfay2TiWUf+qzmBmUTqKyzhS1 cQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pnv92ge7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 03:10:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08L6qMVr020162;
 Mon, 21 Sep 2020 07:10:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33n98gss8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 07:10:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08L7A6kw27787712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 07:10:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DC3A4C04A;
 Mon, 21 Sep 2020 07:10:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1D0E4C073;
 Mon, 21 Sep 2020 07:10:05 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.87.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 07:10:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group
 constraints
Date: Mon, 21 Sep 2020 03:10:04 -0400
Message-Id: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_01:2020-09-21,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=1 mlxlogscore=948 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210049
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PMU counter support functions enforces event constraints for group of
events to check if all events in a group can be monitored. Incase of
event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
not all constraints are applicable, say the threshold or sample bits.
But current code includes pmc5 and pmc6 in some group constraints (like
IC_DC Qualifier bits) which is actually not applicable and hence results
in those events not getting counted when scheduled along with group of
other events. Patch fixes this by excluding PMC5/6 from constraints
which are not relevant for it.

Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
- Added a block comment in the fix path explaining
  why the change is needed.

 arch/powerpc/perf/isa207-common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437a..12153da 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -288,6 +288,15 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 
 		mask  |= CNST_PMC_MASK(pmc);
 		value |= CNST_PMC_VAL(pmc);
+
+		/*
+		 * PMC5 and PMC6 are used to count cycles and instructions
+		 * and these doesnot support most of the constraint bits.
+		 * Add a check to exclude PMC5/6 from most of the constraints
+		 * except for ebb/bhrb.
+		 */
+		if (pmc >= 5)
+			goto ebb_bhrb;
 	}
 
 	if (pmc <= 4) {
@@ -357,6 +366,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 		}
 	}
 
+ebb_bhrb:
 	if (!pmc && ebb)
 		/* EBB events must specify the PMC */
 		return -1;
-- 
1.8.3.1

