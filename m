Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44B67F7D2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 13:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3vJc0SKsz3fNM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 23:44:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mHiUU50a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mHiUU50a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3vGg66phz3fJM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 23:42:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30SAhIJV026598;
	Sat, 28 Jan 2023 12:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ViqCROLpTrolt7xH9lV0OQOv84Auq2dECHI/OSzkGQ4=;
 b=mHiUU50aBn3pZ3CPjpQO79ngGTYqxFFRGPL8SIqQSGGioXbDucuckP8xLDaiKaczTl8e
 0eQyWZZVD+P2Wufp9/MiMWCVFauq3eqAUnAA0PH6GXSfnJVewGQH3i3LPaPVj0Z4KARb
 FhVYyupBmK5fURSFBQtpdrH7O9dBd9XSXM0OeCGFJZck5CZen1Sf2Yho+zNmjP5CGKzr
 3nDhPM+ZEDFDW4FPCGJwfqKI+NuBmKSPVAqN27RSUdroezDnA5XgqlwCXB4hFHuSuLwR
 g82yy61QaqtT/2cojj8Drq56E3Gum+70YZsyPAna5/DbLptHta9nC2LEalHApJrEILvP ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nd26v9g81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Jan 2023 12:42:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30SCg94Z018947;
	Sat, 28 Jan 2023 12:42:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nd26v9g7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Jan 2023 12:42:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30S4ZKxw007454;
	Sat, 28 Jan 2023 12:42:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ncvt7g7ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Jan 2023 12:42:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30SCg4OD21889790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Jan 2023 12:42:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A502C2004D;
	Sat, 28 Jan 2023 12:42:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813F420040;
	Sat, 28 Jan 2023 12:42:02 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.36.224])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Jan 2023 12:42:02 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kvm: Fix objtool warning for unannotated intra-function call in booke.o
Date: Sat, 28 Jan 2023 18:11:58 +0530
Message-Id: <20230128124158.1066251-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LMEVs7JHU07UBifwtPXoEmKHfRSqv5fa
X-Proofpoint-ORIG-GUID: XDHFnzIhgPu0Nqxe2Z2RQWxFwf9CbnKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-28_05,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=810 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301280122
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
Cc: lkp@intel.com, npiggin@gmail.com, sv@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Objtool throws the following warning:
arch/powerpc/kvm/booke.o: warning: objtool: kvmppc_fill_pt_regs+0x30: unannotated intra-function call

Fix this warning by allowing the function to set the value of 'nip' field
using _THIS_IP_ macro, without having to use an additional assembly
instruction to save the instruction pointer.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 0dce93ccaadf..e89281d3ba28 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -912,16 +912,15 @@ static int kvmppc_handle_debug(struct kvm_vcpu *vcpu)
 
 static void kvmppc_fill_pt_regs(struct pt_regs *regs)
 {
-	ulong r1, ip, msr, lr;
+	ulong r1, msr, lr;
 
 	asm("mr %0, 1" : "=r"(r1));
 	asm("mflr %0" : "=r"(lr));
 	asm("mfmsr %0" : "=r"(msr));
-	asm("bl 1f; 1: mflr %0" : "=r"(ip));
 
 	memset(regs, 0, sizeof(*regs));
 	regs->gpr[1] = r1;
-	regs->nip = ip;
+	regs->nip = _THIS_IP_;
 	regs->msr = msr;
 	regs->link = lr;
 }
-- 
2.31.1

