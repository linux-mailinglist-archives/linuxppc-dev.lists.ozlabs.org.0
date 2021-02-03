Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B708030D373
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:41:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsXD0j5QzDxSg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TdIi8R5e; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVsTX0Yk0zDwrb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:38:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136YfjO081595; Wed, 3 Feb 2021 01:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UWXWnZKUyaDzhd9Z1mP8jsoehKvhgzDnDpO/YmZewq0=;
 b=TdIi8R5eAZEfAfIl9bz/VKzqbCxKg5YXsMR5JPUeCCABc/WTZO4uBfouxUKvYBtb8Gj7
 yTCZ6Tt8JQNZL5JMz+2j9ahPTENKSN2IDyxCrlU/xlDpqYfOABBzzQJ0wufa1hL86D69
 yO5G6+7j9UiEsgTJPQ+sKS421yVCzQ6htzh8nVxC/g72wAUHpZoL6l5g4N72jBIMQD4H
 X2Fzuj3XMjp+VZLopS5FdUNxRPpK5ucAuRyT4MOznQnMVkbuIlqyTuFlrdioTo1Pc37C
 1hIGn15qAr0t3dZq0Xhh7XEduXbPK51fRj/lfEJtLhwYbx6HL65T4l7MxKJO4JKixTjg xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpjjg7f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:50 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1136Z01k083441;
 Wed, 3 Feb 2021 01:38:50 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpjjg7eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:50 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136XFm1013178;
 Wed, 3 Feb 2021 06:38:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 36fpc9g07k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:38:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1136cjvU40108422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:38:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EC8B52057;
 Wed,  3 Feb 2021 06:38:45 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2F7F85204E;
 Wed,  3 Feb 2021 06:38:44 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/3] powerpc: sstep: Fix store and update emulation
Date: Wed,  3 Feb 2021 12:08:40 +0530
Message-Id: <20210203063841.431063-2-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203063841.431063-1-sandipan@linux.ibm.com>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
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

Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-2-sandipan@linux.ibm.com/

Changes in v2:
- Jump to unknown_opcode instead of returning -1 for invalid
  instruction forms.

---
 arch/powerpc/lib/sstep.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index db824fec6165..230d1ae77ef5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2301,17 +2301,23 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 149:	/* stdx */
 		case 181:	/* stdux */
+			if (u && ra == 0)
+				goto unknown_opcode;
 			op->type = MKOP(STORE, u, 8);
 			break;
 #endif
 
 		case 151:	/* stwx */
 		case 183:	/* stwux */
+			if (u && ra == 0)
+				goto unknown_opcode;
 			op->type = MKOP(STORE, u, 4);
 			break;
 
 		case 215:	/* stbx */
 		case 247:	/* stbux */
+			if (u && ra == 0)
+				goto unknown_opcode;
 			op->type = MKOP(STORE, u, 1);
 			break;
 
@@ -2340,6 +2346,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 407:	/* sthx */
 		case 439:	/* sthux */
+			if (u && ra == 0)
+				goto unknown_opcode;
 			op->type = MKOP(STORE, u, 2);
 			break;
 
@@ -2684,12 +2692,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 36:	/* stw */
 	case 37:	/* stwu */
+		if (u && ra == 0)
+			goto unknown_opcode;
 		op->type = MKOP(STORE, u, 4);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 38:	/* stb */
 	case 39:	/* stbu */
+		if (u && ra == 0)
+			goto unknown_opcode;
 		op->type = MKOP(STORE, u, 1);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2712,6 +2724,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 44:	/* sth */
 	case 45:	/* sthu */
+		if (u && ra == 0)
+			goto unknown_opcode;
 		op->type = MKOP(STORE, u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2890,6 +2904,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(STORE, 0, 8);
 			break;
 		case 1:		/* stdu */
+			if (ra == 0)
+				goto unknown_opcode;
 			op->type = MKOP(STORE, UPDATE, 8);
 			break;
 		case 2:		/* stq */
-- 
2.25.1

