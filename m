Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516E21A4FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 18:41:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2hl64CvlzDrC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 02:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2hj60CSQzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 02:39:37 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069GWPIs138921; Thu, 9 Jul 2020 12:39:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32637wftp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 12:39:30 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 069GWZMk139984;
 Thu, 9 Jul 2020 12:39:29 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32637wftn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 12:39:29 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069GWFnm008508;
 Thu, 9 Jul 2020 16:39:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 325k2qrhad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 16:39:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 069GdOfa64815126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 16:39:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78FF3A4062;
 Thu,  9 Jul 2020 16:39:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00D4EA405C;
 Thu,  9 Jul 2020 16:39:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.209.33])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 16:39:21 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: Avoid using addr_to_pfn in realmode
Date: Thu,  9 Jul 2020 22:09:14 +0530
Message-Id: <20200709163914.13110-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_08:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=966 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090116
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
Cc: mahesh@linux.vnet.ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an UE or memory error exception is encountered the MCE handler
tries to find the pfn using addr_to_pfn() which takes effective
address as an argument, later pfn is used to poison the page where
memory error occurred, recent rework in this area made addr_to_pfn
to run in realmode, which can be fatal as it may try to access
memory outside RMO region.

To fix this use addr_to_pfn after switching to virtual mode.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
V2: Leave bare metal code and save_mce_event as is.
---
 arch/powerpc/platforms/pseries/ras.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f3736fcd98fc..def875815e92 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -610,16 +610,8 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 		if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED)
 			eaddr = be64_to_cpu(mce_log->effective_address);
 
-		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
+		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED)
 			paddr = be64_to_cpu(mce_log->logical_address);
-		} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
-			unsigned long pfn;
-
-			pfn = addr_to_pfn(regs, eaddr);
-			if (pfn != ULONG_MAX)
-				paddr = pfn << PAGE_SHIFT;
-		}
-
 		break;
 	case MC_ERROR_TYPE_SLB:
 		mce_err.error_type = MCE_ERROR_TYPE_SLB;
@@ -725,6 +717,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	 *       SLB multihit is done by now.
 	 */
 	mtmsr(mfmsr() | MSR_IR | MSR_DR);
+
+	/* Use addr_to_pfn after switching to virtual mode */
+	if (!paddr && error_type == MC_ERROR_TYPE_UE &&
+	    mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED) {
+		unsigned long pfn;
+
+		pfn = addr_to_pfn(regs, eaddr);
+		if (pfn != ULONG_MAX)
+			paddr = pfn << PAGE_SHIFT;
+	}
 	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
 			&mce_err, regs->nip, eaddr, paddr);
 
-- 
2.17.2

