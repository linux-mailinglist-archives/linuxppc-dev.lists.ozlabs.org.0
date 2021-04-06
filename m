Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBBE355907
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFCMY1nynz3br1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 02:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LwOMRTys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LwOMRTys; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFCM61vdfz2yR6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 02:16:17 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136G6KXc060127; Tue, 6 Apr 2021 12:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=deJI/wqN6BHO2/OqbU4lAeQCj7YqJQvgT0xW8m2mnzk=;
 b=LwOMRTysEuZ7XGolH744KrEapPM08AYd0eXr7bH4oOOEXWmuzebC6HY+8E41tWrG78E6
 rxoZNX3kkQLfGONLS46eqXr/hrWUueTVWr4YrBO8Kxn4J3zJ1qStDsNkEmVUvP3MZRI4
 F09eUpESsP7MrRSTsmhEr5qJPqLlUBmhqU5g7F9wKN0QdwcCraYWlPUCsD1ViMw+FGFs
 tjEcyQfTm43lCHTi70tkZRDmZkONN1GxHDecGosoaZt0pRsGfQx0O5G1Tmm0Amd5eJXI
 ZUNygen1g+Y2l+LIr6tlejYyoMbH3Fa0mrMGed6i5EAE4ed8UJnX+fUiRgU0ZJszbTKX Hg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5amare3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 12:16:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136GDRrE017103;
 Tue, 6 Apr 2021 16:16:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 37q2n2ta9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 16:16:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136GG4Yo24773046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 16:16:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B6F04C04A;
 Tue,  6 Apr 2021 16:16:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B7CA4C044;
 Tue,  6 Apr 2021 16:16:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.187.191])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 16:16:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix PMU constraint check for EBB events
Date: Tue,  6 Apr 2021 12:16:01 -0400
Message-Id: <1617725761-1464-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v8H78y7v6cqnOB-kn815K506l8HDDaod
X-Proofpoint-ORIG-GUID: v8H78y7v6cqnOB-kn815K506l8HDDaod
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_04:2021-04-06,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060105
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
Cc: cascardo@canonical.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The power PMU group constraints includes check for EBB events
to make sure all events in a group must agree on EBB. This
will prevent scheduling EBB and non-EBB events together.
But in the existing check, settings for constraint mask and
value is interchanged. Patch fixes the same.

Before the patch, PMU selftest "cpu_event_pinned_vs_ebb_test"
fails with below in dmesg logs. This happens because EBB event
gets enabled along with a non-EBB cpu event.

<<>>
[35600.453346] cpu_event_pinne[41326]: illegal instruction (4)
at 10004a18 nip 10004a18 lr 100049f8 code 1 in
cpu_event_pinned_vs_ebb_test[10000000+10000]
<<>>

Test results after the patch:

 ./pmu/ebb/cpu_event_pinned_vs_ebb_test
test: cpu_event_pinned_vs_ebb
tags: git_version:v5.12-rc5-93-gf28c3125acd3-dirty
Binding to cpu 8
EBB Handler is at 0x100050c8
read error on event 0x7fffe6bd4040!
PM_RUN_INST_CMPL: result 9872 running/enabled 37930432
success: cpu_event_pinned_vs_ebb

Fixes: 4df489991182 ("powerpc/perf: Add power8 EBB support")
Reported-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..8b5eeb6fb2fb 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -447,8 +447,8 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp,
 	 * EBB events are pinned & exclusive, so this should never actually
 	 * hit, but we leave it as a fallback in case.
 	 */
-	mask  |= CNST_EBB_VAL(ebb);
-	value |= CNST_EBB_MASK;
+	mask  |= CNST_EBB_MASK;
+	value |= CNST_EBB_VAL(ebb);
 
 	*maskp = mask;
 	*valp = value;
-- 
1.8.3.1

