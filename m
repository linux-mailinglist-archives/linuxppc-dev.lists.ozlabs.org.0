Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D712A389EEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 09:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm1bk6PY6z3083
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSU2yUXu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NSU2yUXu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm1bB3Ts9z2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 17:29:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K7Mdlw010702; Thu, 20 May 2021 03:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UtMuWBPuEVcu2Gh2k/fYOCh1V8OfCbxF50LvXoovO4M=;
 b=NSU2yUXu43PbECNCpJHWnFjxCZY/gP8Wxs57m/0vx7KXvShHn1tCU2LIuwWflyny7Oz0
 J/U+Ww8AYsutGkE9Gm7PhQJ5O6bpfvr5cOu1qj6S2SucbPSINE0DLkAjyDwMJ2s3syyR
 9dTHGkfM7n5zra235RTYknmNuwGfFaat2BqFbbteEsNKsY9c5QERbRfhnr1HS1CnYj2s
 AjEeS/tczzAq6w0QgGAqEL2aoZ+C3rfgP1mf8evf1nFLMdUs+Zv5jpCndZZK6M9vIPCK
 Rhocq3p0CG7KePFXAOCLwsYcvSObfG2xOROcwkXrUPxEjW+M6RtPv5MsOyTFEc4O4jP2 BA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38nkay03q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 03:29:23 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14K7Rqxu015141;
 Thu, 20 May 2021 07:29:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x8aft7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 07:29:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14K7TJBp54329812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 07:29:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3067111C04A;
 Thu, 20 May 2021 07:29:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E679F11C054;
 Thu, 20 May 2021 07:29:17 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.120.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 07:29:17 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to emulate_step()
 on ppc32
Date: Thu, 20 May 2021 12:59:09 +0530
Message-Id: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 27PQiVW6h9PMu34pwv86fYqpu178JQZd
X-Proofpoint-ORIG-GUID: 27PQiVW6h9PMu34pwv86fYqpu178JQZd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_01:2021-05-20,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200054
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trying to use a kprobe on ppc32 results in the below splat:
    BUG: Unable to handle kernel data access on read at 0x7c0802a6
    Faulting instruction address: 0xc002e9f0
    Oops: Kernel access of bad area, sig: 11 [#1]
    BE PAGE_SIZE=4K PowerPC 44x Platform
    Modules linked in:
    CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb #7
    NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
    REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c0495fdb)
    MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
    DEAR: 7c0802a6 ESR: 00000000
    <snip>
    NIP [c002e9f0] emulate_step+0x28/0x324
    LR [c0011858] optinsn_slot+0x128/0x10000
    Call Trace:
     opt_pre_handler+0x7c/0xb4 (unreliable)
     optinsn_slot+0x128/0x10000
     ret_from_syscall+0x0/0x28

The offending instruction is:
    81 24 00 00     lwz     r9,0(r4)

Here, we are trying to load the second argument to emulate_step():
struct ppc_inst, which is the instruction to be emulated. On ppc64,
structures are passed in registers when passed by value. However, per
the ppc32 ABI, structures are always passed to functions as pointers.
This isn't being adhered to when setting up the call to emulate_step()
in the optprobe trampoline. Fix the same.

Fixes: eacf4c0202654a ("powerpc: Enable OPTPROBES on PPC32")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/optprobes.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index cdf87086fa33a0..2bc53fa48a1b33 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -281,8 +281,12 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
+		patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
+	} else {
+		patch_imm_load_insns((unsigned long)p->ainsn.insn, 4, buff + TMPL_INSN_IDX);
+	}
 
 	/*
 	 * 4. branch back from trampoline

base-commit: 3a81c0495fdb91fd9a9b4f617098c283131eeae1
-- 
2.30.2

