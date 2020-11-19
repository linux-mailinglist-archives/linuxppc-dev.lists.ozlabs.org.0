Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BD2B8B15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 06:43:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7rb6m5HzDqfZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 16:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nCwBy0iw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7pt477VzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 16:41:55 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ5ZMQN007209; Thu, 19 Nov 2020 00:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rwlvu4v6zmhxHRxW1AFZfAM4h7H0LJ+/D5n2lUantUw=;
 b=nCwBy0iwsQ9z7pbWbcbZe0xZUWZcc/MdN9jl8tTHefR1jG5eca/Pt/91YF6EJFhFvFSj
 CXlqUj+t0BG/fwwXqTBtDrjR75kSlh2My4GdFTf27dwudLTJHGl3onFjIrbhm369+0Ff
 Pw0DJ9xGisFyRAJgwh8R1RvqNNOH+ni9QPbWxH8BGd13fSsakSXMby6aQYt3q2KHz1sP
 s6RIF48G8vs4Z037CvdE1EyJuG1t/pzFsCadfkYN/IOV+Wz8YoFSHH2y84OqrttF77Fs
 WYm3rlhIkgfrtEjDiz5Z+7yYQNaENtII4AucPI+qQDXv1g6VEaBHLShFF+KPvyT3sJQJ Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg603954-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 00:41:48 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJ5a75l010178;
 Thu, 19 Nov 2020 00:41:48 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg60394j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 00:41:48 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ5fj3i000457;
 Thu, 19 Nov 2020 05:41:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 34w4yfgkp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 05:41:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ5fh4L54460774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 05:41:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7699011C058;
 Thu, 19 Nov 2020 05:41:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D2311C04A;
 Thu, 19 Nov 2020 05:41:42 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 05:41:41 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc: sstep: Fix store and update instructions
Date: Thu, 19 Nov 2020 11:11:39 +0530
Message-Id: <20201119054139.244083-2-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119054139.244083-1-sandipan@linux.ibm.com>
References: <20201119054139.244083-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_01:2020-11-17,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=873 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190037
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Power ISA says that the fixed-point store and update
instructions must not use R0 for the base address (RA).
In this case, the instruction is invalid. This applies
to the following instructions.
  * Store Byte with Update (stbu)
  * Store Byte with Update Indexed (stbux)
  * Store Halfword with Update (sthu)
  * Store Halfword with Update Indexed (sthux)
  * Store Word with Update (stwu)
  * Store Word with Update Indexed (stwux)
  * Store Doubleword with Update (stdu)
  * Store Doubleword with Update Indexed (stdux)

To remove any inconsistencies, this adds an additional check
for the aforementioned instructions to make sure that they
are treated as unknown by the emulation infrastructure when
RA = 0. The kernel will then fallback to executing the
instruction on hardware.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 25a5436be6c6..1c20c14f8757 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2226,17 +2226,23 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 149:	/* stdx */
 		case 181:	/* stdux */
+			if (u && ra == 0)
+				return -1;
 			op->type = MKOP(STORE, u, 8);
 			break;
 #endif
 
 		case 151:	/* stwx */
 		case 183:	/* stwux */
+			if (u && ra == 0)
+				return -1;
 			op->type = MKOP(STORE, u, 4);
 			break;
 
 		case 215:	/* stbx */
 		case 247:	/* stbux */
+			if (u && ra == 0)
+				return -1;
 			op->type = MKOP(STORE, u, 1);
 			break;
 
@@ -2265,6 +2271,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 407:	/* sthx */
 		case 439:	/* sthux */
+			if (u && ra == 0)
+				return -1;
 			op->type = MKOP(STORE, u, 2);
 			break;
 
@@ -2568,12 +2576,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 36:	/* stw */
 	case 37:	/* stwu */
+		if (u && ra == 0)
+			return -1;
 		op->type = MKOP(STORE, u, 4);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 38:	/* stb */
 	case 39:	/* stbu */
+		if (u && ra == 0)
+			return -1;
 		op->type = MKOP(STORE, u, 1);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2596,6 +2608,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 44:	/* sth */
 	case 45:	/* sthu */
+		if (u && ra == 0)
+			return -1;
 		op->type = MKOP(STORE, u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2746,6 +2760,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(STORE, 0, 8);
 			break;
 		case 1:		/* stdu */
+			if (ra == 0)
+				return -1;
 			op->type = MKOP(STORE, UPDATE, 8);
 			break;
 		case 2:		/* stq */
-- 
2.25.1

