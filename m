Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD92FF0EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 17:51:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM7h95JvfzDrSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 03:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bl7mPqo5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM7dW6bnlzDrQc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 03:49:03 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LGWRR4053406; Thu, 21 Jan 2021 11:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=mm/Azo+F8YammwCDyiKESYWNbu/b3Zola+UPANi7sUM=;
 b=Bl7mPqo5GagTgBNetk3BnspDDz071zqR70aRHELz6PSUQHLcJyWoc28NV/peVqLQYuL9
 MDTzlKB3HPsnuRCsa2AuDDuES7Xl5iM41zZWZNgACpbZbawZLJEFx3pgClBnYbluubKi
 Sunh5bVWHpfs3r8B5vsfK0JrA3lpg/hOFXNkkxkMnI+eEYwvriGUTS4wqfhiRSjgvUlW
 lxz3drSL9EB+MGHYeoSYeOKo5dRD+oa0omgRnX5wVLwOOw8/I3b13gPQQEy0lmfrbEH5
 k0zlQr43UFDxz+P6CoMSBg2yt67Io/tSw4Hd5uNBxO2pE2uiI22gLvoVOEJIyHk7sCJ6 yg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367cq9hrkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 11:48:52 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LGl3ud015996;
 Thu, 21 Jan 2021 16:48:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3668ny0y0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 16:48:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LGmlT338339004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 16:48:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8CC211C04C;
 Thu, 21 Jan 2021 16:48:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E96A11C04A;
 Thu, 21 Jan 2021 16:48:46 +0000 (GMT)
Received: from thinktux.local (unknown [9.199.63.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 16:48:46 +0000 (GMT)
Subject: [PATCH] lib/sstep: Fix incorrect return from analyze_instr()
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Thu, 21 Jan 2021 22:18:45 +0530
Message-ID: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_08:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=980 priorityscore=1501 clxscore=1011
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210088
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
Cc: naveen.n.rao@linux.ibm.com, paulus@samba.org, sandipan@linux.ibm.com,
 ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We currently just percolate the return value from analyze_instr()
to the caller of emulate_step(), especially if it is a -1.

For one particular case (opcode = 4) for instructions that
aren't currently emulated, we are returning 'should not be
single-stepped' while we should have returned 0 which says
'did not emulate, may have to single-step'.

Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/lib/sstep.c |   49 +++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5a425a4a1d88..a3a0373843cd 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1445,34 +1445,39 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 #ifdef __powerpc64__
 	case 4:
-		if (!cpu_has_feature(CPU_FTR_ARCH_300))
-			return -1;
-
-		switch (word & 0x3f) {
-		case 48:	/* maddhd */
-			asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
-				     "=r" (op->val) : "r" (regs->gpr[ra]),
-				     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
-			goto compute_done;
+		/*
+		 * There are very many instructions with this primary opcode
+		 * introduced in the ISA as early as v2.03. However, the ones
+		 * we currently emulate were all introduced with ISA 3.0
+		 */
+		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+			switch (word & 0x3f) {
+			case 48:	/* maddhd */
+				asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
+					     "=r" (op->val) : "r" (regs->gpr[ra]),
+					     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
+				goto compute_done;
 
-		case 49:	/* maddhdu */
-			asm volatile(PPC_MADDHDU(%0, %1, %2, %3) :
-				     "=r" (op->val) : "r" (regs->gpr[ra]),
-				     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
-			goto compute_done;
+			case 49:	/* maddhdu */
+				asm volatile(PPC_MADDHDU(%0, %1, %2, %3) :
+					     "=r" (op->val) : "r" (regs->gpr[ra]),
+					     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
+				goto compute_done;
 
-		case 51:	/* maddld */
-			asm volatile(PPC_MADDLD(%0, %1, %2, %3) :
-				     "=r" (op->val) : "r" (regs->gpr[ra]),
-				     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
-			goto compute_done;
+			case 51:	/* maddld */
+				asm volatile(PPC_MADDLD(%0, %1, %2, %3) :
+					     "=r" (op->val) : "r" (regs->gpr[ra]),
+					     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
+				goto compute_done;
+			}
 		}
 
 		/*
-		 * There are other instructions from ISA 3.0 with the same
-		 * primary opcode which do not have emulation support yet.
+		 * Rest of the instructions with this primary opcode do not
+		 * have emulation support yet.
 		 */
-		return -1;
+		op->type = UNKNOWN;
+		return 0;
 #endif
 
 	case 7:		/* mulli */


