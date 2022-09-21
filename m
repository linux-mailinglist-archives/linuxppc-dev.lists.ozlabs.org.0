Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003B5C004F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXhJ06SMGz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 00:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j1imbdrF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j1imbdrF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXhHJ1hz5z2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 00:53:15 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LE7Dth017301;
	Wed, 21 Sep 2022 14:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YmV7+SR+naPySmui2WtOrJWH4gwxSgpGu/JELmjByHs=;
 b=j1imbdrF3YLDo2tYpNTdwRJDgOR8o7Tj5f8C0e8019UN+2C1bgAeHZfVyaMRVvGn3gld
 bYjIijMNULwbWDPwhUQPzVocqibNyJf4/pDiOrDyCxwJCHXsWLazf/Lmex40NQxJXRwg
 xOj2gwNFfu5/NmZYPmRgLe5a3ylZiCNvEPBIgxWKwYb96pvu4neM0sTJX/w4FBU2EQt5
 5g97U9VSe/bGrUparxjG2/+Xfy3ivenzc1t4rihPr1jRJtA/JtMQs7+lEq38GCftHned
 fnhJUvV7W9DCJzX9t9DYX/2LYq9FFn1dJdMhgqqT8eq8OvFirZxKywcW4pRumhmZxhrr /Q== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr3vx26nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:05 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LEprcR002568;
	Wed, 21 Sep 2022 14:53:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3jn5v9412x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LErPap41157070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 14:53:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D4E611C04C;
	Wed, 21 Sep 2022 14:52:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FCD811C04A;
	Wed, 21 Sep 2022 14:52:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.4.79])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 14:52:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V2 1/3] powerpc/perf: Fix branch_filter support for multiple filters in powerpc
Date: Wed, 21 Sep 2022 20:22:53 +0530
Message-Id: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rkGd131DKWhAy6pHHNDQl0_XXTPD2-1f
X-Proofpoint-ORIG-GUID: rkGd131DKWhAy6pHHNDQl0_XXTPD2-1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210099
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type
ie branch filters are supported. The branch filters are requested via
event attribute "branch_sample_type". Multiple branch filters can be
passed in event attribute.

Example:
perf record -b -o- -B --branch-filter any,ind_call true

Powerpc does not support having multiple branch filters at
sametime. In powerpc, branch filters for branch stack sampling
is set via MMCRA IFM bits [32:33]. But currently when requesting
for multiple filter types, the "perf record" command does not
report any error.

Example:
perf record -b -o- -B --branch-filter any,save_type true
perf record -b -o- -B --branch-filter any,ind_call true

The "bhrb_filter_map" function in PMU driver code does the
validity check for supported branch filters. But this check
is done for single filter. Hence "perf record" will proceed
here without reporting any error.

Fix power_pmu_event_init to return EOPNOTSUPP when multiple
branch filters are requested in the event attr.

After the fix:
perf record --branch-filter any,ind_call -- ls
Error:
cycles: PMU Hardware doesn't support sampling/overflow-interrupts.
Try 'perf stat'

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:
 Addressed review comment from Michael Ellerman to
 do irq restore before returning EOPNOTSUPP

 arch/powerpc/perf/core-book3s.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 13919eb96931..a939ac3b3a84 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2131,6 +2131,23 @@ static int power_pmu_event_init(struct perf_event *event)
 	if (has_branch_stack(event)) {
 		u64 bhrb_filter = -1;
 
+		/*
+		 * powerpc does not support having multiple branch filters
+		 * at sametime. Branch filters are set via MMCRA IFM[32:33]
+		 * bits for power8 and above. Return EOPNOTSUPP when multiple
+		 * branch filters are requested in the event attr.
+		 *
+		 * When opening event via perf_event_open, branch_sample_type
+		 * gets adjusted in perf_copy_attr function. Kernel will
+		 * automatically adjust the branch_sample_type based on the
+		 * event modifier settings to include PERF_SAMPLE_BRANCH_PLM_ALL.
+		 * Hence drop the check for PERF_SAMPLE_BRANCH_PLM_ALL.
+		 */
+		if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM_ALL) > 1) {
+			local_irq_restore(irq_flags);
+			return -EOPNOTSUPP;
+		}
+
 		if (ppmu->bhrb_filter_map)
 			bhrb_filter = ppmu->bhrb_filter_map(
 					event->attr.branch_sample_type);
-- 
2.31.1

