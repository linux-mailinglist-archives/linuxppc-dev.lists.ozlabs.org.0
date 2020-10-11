Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C446928A5C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 07:14:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C893K00pHzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 16:14:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sZStxbZr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C88xl5v47zDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 16:09:47 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09B52rR9088249; Sun, 11 Oct 2020 01:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=c2uixfQYGbXw1oF9D9QWfiMFpYULmLTEUXYFCkBc92o=;
 b=sZStxbZru1Ys7am7oip9PA6z5kf5S9UAIduPQy2XvmnusLORrlzgiPS6W3EM94+Fn7tC
 zWS6NCwJuk7pfUnj1v1cRRb2iYY/p1WEjPmqptN6bKd+7q+nPR3u8SesY4dg4kOCeo9c
 7BFUAeP9OW95aBTbPKaCtp9v5oyomPN8PZ6XDAdHMUtU6G8xwBMlq5XvPvDcLRDL74Qd
 yCUqGjj3EZ5EvkmU/Gx4cHCfNcEszKbFrEvFhEwPo3pHmCwcAZW0SVNo5BtFDnp31nea
 L9F0lS2cyEPdPXX3b2/L2m5ey/KWT6aTLolsKQAsTrqsUjlWtzNWaYrla9oJtb4KX2Hx Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u8w8cga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:43 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09B57AYc099645;
 Sun, 11 Oct 2020 01:09:42 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u8w8cfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09B573PJ032627;
 Sun, 11 Oct 2020 05:09:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34347grw1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 05:09:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09B59bDe30408964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Oct 2020 05:09:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BB8F42042;
 Sun, 11 Oct 2020 05:09:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD39E42041;
 Sun, 11 Oct 2020 05:09:35 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.47.193])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Oct 2020 05:09:35 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 2/5] powerpc/sstep: Cover new VSX instructions under
 CONFIG_VSX
Date: Sun, 11 Oct 2020 10:39:05 +0530
Message-Id: <20201011050908.72173-3-ravi.bangoria@linux.ibm.com>
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
 lowpriorityscore=0
 malwarescore=0 suspectscore=1 mlxscore=0 mlxlogscore=853 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010110043
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

Recently added Power10 prefixed VSX instruction are included
unconditionally in the kernel. If they are executed on a
machine without VSX support, it might create issues. Fix that.
Also fix one mnemonics spelling mistake in comment.

Fixes: 50b80a12e4cc ("powerpc sstep: Add support for prefixed load/stores")
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e6242744c71b..faf0bbf3efb7 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2757,6 +2757,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 41:	/* plwa */
 				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
 				break;
+#ifdef CONFIG_VSX
 			case 42:        /* plxsd */
 				op->reg = rd + 32;
 				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
@@ -2797,13 +2798,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				op->element_size = 16;
 				op->vsx_flags = VSX_CHECK_VEC;
 				break;
+#endif /* CONFIG_VSX */
 			case 56:        /* plq */
 				op->type = MKOP(LOAD, PREFIXED, 16);
 				break;
 			case 57:	/* pld */
 				op->type = MKOP(LOAD, PREFIXED, 8);
 				break;
-			case 60:        /* stq */
+			case 60:        /* pstq */
 				op->type = MKOP(STORE, PREFIXED, 16);
 				break;
 			case 61:	/* pstd */
-- 
2.26.2

