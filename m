Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8772C5C14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:36:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmgL6xvszDrbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m7qT+At/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm6P530VzDrN8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:11:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI2SrX010883; Thu, 26 Nov 2020 13:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1sFhh/W277Uq17/fL+ArloyRS3Z5ALEi6yijAXDfcRc=;
 b=m7qT+At/WvCgAr5SVVnaurZ+VlU6NPzl6zyPrjNnhpHncwnb/CFql8QakJVa/xg9Z9/g
 6myjgCbLbSXKNF4aEtHHWq53WFkwTyrPZAemZAoxiWQg/qncKYE8/ZFupV7sk1Y56oQB
 On7vU/r8E8JFC+TFCDbD/A2n1pqRR6YuUJe4MWxw6N+W4R0iDzzXVopJ5BFHmcondCo9
 fMkNnN9ef20UrXqoxXc1UBI9nTnqSEexYOI3Z8pLp964Rsk7wxstQMVZZ+SUAaGWIbby
 qlMtXT0WkkKNzDUG9XTuItrlqy8FwdONMj3ontZu0GMNTmA5gnq4bGTFLgaoIKKTHKBJ uQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352ccerjyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:11:05 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI8iop016109;
 Thu, 26 Nov 2020 18:11:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r3b6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:11:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9koP11272914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F97AA405F;
 Thu, 26 Nov 2020 18:09:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74BA2A4054;
 Thu, 26 Nov 2020 18:09:43 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:43 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 11/14] powerpc/ftrace: Use GPR save/restore macros in
 ftrace_graph_caller()
Date: Thu, 26 Nov 2020 23:38:48 +0530
Message-Id: <ab421e41485fe48faabdb9371abdd45f4f6899e2.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260108
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use SAVE_8GPRS(), REST_8GPRS() and _NIP(), along with using the standard
SWITCH_FRAME_SIZE for the stack frame in ftrace_graph_caller() to
simplify code. This increases the stack frame size, but it is unlikely
to be an issue since ftrace_[regs_]caller() have just used a similar
stack frame size, and it isn't evident that the graph caller has too
deep a call stack to cause issues.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 28 +++++--------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
index f9fd5f743eba34..bbe871b47ade58 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -279,24 +279,17 @@ livepatch_handler:
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(ftrace_graph_caller)
-	stdu	r1, -112(r1)
+	stdu	r1,-SWITCH_FRAME_SIZE(r1)
 	/* with -mprofile-kernel, parameter regs are still alive at _mcount */
-	std	r10, 104(r1)
-	std	r9, 96(r1)
-	std	r8, 88(r1)
-	std	r7, 80(r1)
-	std	r6, 72(r1)
-	std	r5, 64(r1)
-	std	r4, 56(r1)
-	std	r3, 48(r1)
+	SAVE_8GPRS(3, r1)
 
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, 24(r1)
 	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
 
-	addi	r5, r1, 112
+	addi	r5, r1, SWITCH_FRAME_SIZE
 	mfctr	r4		/* ftrace_caller has moved local addr here */
-	std	r4, 40(r1)
+	std	r4, _NIP(r1)
 	mflr	r3		/* ftrace_caller has restored LR from stack */
 	subi	r4, r4, MCOUNT_INSN_SIZE
 
@@ -309,21 +302,14 @@ _GLOBAL(ftrace_graph_caller)
 	 */
 	mtlr	r3
 
-	ld	r0, 40(r1)
+	ld	r0, _NIP(r1)
 	mtctr	r0
-	ld	r10, 104(r1)
-	ld	r9, 96(r1)
-	ld	r8, 88(r1)
-	ld	r7, 80(r1)
-	ld	r6, 72(r1)
-	ld	r5, 64(r1)
-	ld	r4, 56(r1)
-	ld	r3, 48(r1)
+	REST_8GPRS(3, r1)
 
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
 
-	addi	r1, r1, 112
+	addi	r1, r1, SWITCH_FRAME_SIZE
 	mflr	r0
 	std	r0, LRSAVE(r1)
 	bctr
-- 
2.25.4

