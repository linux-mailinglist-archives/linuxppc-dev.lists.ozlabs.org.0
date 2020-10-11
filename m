Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D578728A5C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 07:12:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C891N0PT2zDqvY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 16:12:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ec3vFE3v; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C88xl0XQPzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 16:09:46 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09B535mc045832; Sun, 11 Oct 2020 01:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+IJCd/a5bEZabDFEXndAP8F644tRIHfPh4Zz9tAfJ60=;
 b=Ec3vFE3vMC+jx9PArpO2H/cGf6yVefoXcRAHOYzE+OGjQtD8bLKB4YKzaXJRGhG8gBu8
 W4jplkeWZ/4Bigt9xeHNEtrP2vnYhDHWXa4fsD7Ui7ESVGORIMVrn2YF1kySeViepI1F
 ozjAxCwiWp25CsZoam3DvWGUBfp6BQff34YntxtYk7IXavvL9Z/5UM3oL2yC1Mu3z/ZO
 wwD+HjMurdeOZ3rh0bJdo4FcsOHERTwlf284WY4ELYBg/CtyrMQziFaobE9bxzcG+e6Y
 62bfh8opracnscpjVnrkSc5a3O00ZO53HyyzPkmIyAMog2J0yhwWQg3qg0N3/+/OlrJ7 pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u3j0hhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:40 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09B53DSj046240;
 Sun, 11 Oct 2020 01:09:39 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u3j0hgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:39 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09B57vlA007885;
 Sun, 11 Oct 2020 05:09:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3434k7renp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 05:09:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09B59YBu32047434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Oct 2020 05:09:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB534203F;
 Sun, 11 Oct 2020 05:09:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F359142041;
 Sun, 11 Oct 2020 05:09:31 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.47.193])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Oct 2020 05:09:31 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only when
 CPU_FTR_ARCH_31 is set
Date: Sun, 11 Oct 2020 10:39:04 +0530
Message-Id: <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-10_07:2020-10-09,
 2020-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=1
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=583
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010110048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balamuruhan S <bala24@linux.ibm.com>

Unconditional emulation of prefixed instructions will allow
emulation of them on Power10 predecessors which might cause
issues. Restrict that.

Fixes: 3920742b92f5 ("powerpc sstep: Add support for prefixed fixed-point arithmetic")
Fixes: 50b80a12e4cc ("powerpc sstep: Add support for prefixed load/stores")
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e9dcaba9a4f8..e6242744c71b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1346,6 +1346,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	switch (opcode) {
 #ifdef __powerpc64__
 	case 1:
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
 		rd = (suffix >> 21) & 0x1f;
@@ -2733,6 +2736,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		}
 		break;
 	case 1: /* Prefixed instructions */
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
 		op->update_reg = ra;
-- 
2.26.2

