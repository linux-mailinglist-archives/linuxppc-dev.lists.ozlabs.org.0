Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C1184DFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 18:51:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48fCsw3RddzDqS3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 04:51:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48fCqy2T85zDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 04:49:17 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DHVVm1136034
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 13:49:15 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yrcncnmhg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 13:49:15 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <atrajeev@linux.vnet.ibm.com>;
 Fri, 13 Mar 2020 17:49:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Mar 2020 17:49:10 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02DHn9ln27000936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 17:49:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17F324C044;
 Fri, 13 Mar 2020 17:49:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C1CC4C040;
 Fri, 13 Mar 2020 17:49:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.71.208])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Mar 2020 17:49:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/perf: Use SIER_USER_MASK while updating SPRN_SIER
 for EBB events
Date: Fri, 13 Mar 2020 13:49:07 -0400
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 20031317-4275-0000-0000-000003ABD15C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031317-4276-0000-0000-000038C0F3B0
Message-Id: <1584121747-6213-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_06:2020-03-12,
 2020-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=958
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130084
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

Sampled instruction address register (SIER), is a PMU register,
captures architecture state for a given sample. And sier_user_mask
defined in commit 330a1eb7775b ("powerpc/perf: Core EBB support for 64-bit
book3s") defines the architected bits that needs to be saved from the SPR.
Currently all of the bits from SIER are saved for EBB events. Patch fixes
this by ANDing the "sier_user_mask" to data from SIER in ebb_switch_out().
This will force save only architected bits from the SIER.

Fixes: 330a1eb7775b ("powerpc/perf: Core EBB support for 64-bit book3s")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
  - Make the commit message more clearer.

 arch/powerpc/perf/core-book3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3086055..48b61cc 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -579,7 +579,7 @@ static void ebb_switch_out(unsigned long mmcr0)
 		return;
 
 	current->thread.siar  = mfspr(SPRN_SIAR);
-	current->thread.sier  = mfspr(SPRN_SIER);
+	current->thread.sier  = mfspr(SPRN_SIER) & SIER_USER_MASK;
 	current->thread.sdar  = mfspr(SPRN_SDAR);
 	current->thread.mmcr0 = mmcr0 & MMCR0_USER_MASK;
 	current->thread.mmcr2 = mfspr(SPRN_MMCR2) & MMCR2_USER_MASK;
-- 
1.8.3.1

