Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B410F63B932
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLqd34PGwz3f9m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 15:49:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kUCWsNP3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kUCWsNP3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLqW173Vlz3cS4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:44:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT2bNgY013857;
	Tue, 29 Nov 2022 04:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=4DpsrPgHWS8MCQu8VHPUbzGP5a965gNENKqLW49zMMg=;
 b=kUCWsNP34ZzvTH1Cd1YGQi3cEqIxnxWSjFAMWfK7oCiN2A1luLUFeVZaQaZEh9y6+lYl
 fmVsES7ouHyUSbQ1f5EAFknNwEkA+FLGmYQlnAFWuaPABTclqlidcT4/rnN4cBmRjSvw
 XHj3oV31+fibKtyji5b1MzQ9wKJfq0Yc4ksd2PaeJ+H4bSVwbIVJXDTRrQ8nOvrxUDAg
 smWcKB2OcrLaBzm7FNdj6vq0qg9WvuY2aRUI4IqXsK42yzI2LtLTKsSUYkrWvzOT+lKD
 qDyelAyv4sN9Qoc1xJfsI0Y2FZtwwun2Jz3dPThRPY1+dvS93sc1bXJAbhlmJU2+MvG0 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303k8uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:25 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT4dape014881;
	Tue, 29 Nov 2022 04:44:25 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303k8u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT4ajlm008413;
	Tue, 29 Nov 2022 04:44:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06fra.de.ibm.com with ESMTP id 3m3a2htge1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT4iKpk5505762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 04:44:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6953D5204F;
	Tue, 29 Nov 2022 04:44:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 14B0A5204E;
	Tue, 29 Nov 2022 04:44:20 +0000 (GMT)
Received: from civic.. (unknown [9.177.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5C4CC600D5;
	Tue, 29 Nov 2022 15:44:15 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 6/7] powerpc/64e: Clear gprs on interrupt routine entry on Book3E
Date: Tue, 29 Nov 2022 15:43:53 +1100
Message-Id: <20221129044354.1836018-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129044354.1836018-1-rmclure@linux.ibm.com>
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oNiyxccHPFbvPshk9xOqR-FmlB36ita5
X-Proofpoint-GUID: oNpzGdMB0Rm9i9mSWWryqr6CxRDOSFzO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_03,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=690 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290029
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zero GPRS r14-r31 on entry into the kernel for interrupt sources to
limit influence of user-space values in potential speculation gadgets.
Prior to this commit, all other GPRS are reassigned during the common
prologue to interrupt handlers and so need not be zeroised explicitly.

This may be done safely, without loss of register state prior to the
interrupt, as the common prologue saves the initial values of
non-volatiles, which are unconditionally restored in interrupt_64.S.
Mitigation defaults to enabled by INTERRUPT_SANITIZE_REGISTERS.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
---
 arch/powerpc/kernel/exceptions-64e.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 930e36099015..6b842d5ea4e1 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -358,7 +358,6 @@ ret_from_mc_except:
 	std	r14,PACA_EXMC+EX_R14(r13);				    \
 	std	r15,PACA_EXMC+EX_R15(r13)
 
-
 /* Core exception code for all exceptions except TLB misses. */
 #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
 exc_##n##_common:							    \
@@ -394,7 +393,8 @@ exc_##n##_common:							    \
 	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
 	std	r0,RESULT(r1);		/* clear regs->result */	    \
-	SAVE_NVGPRS(r1);
+	SAVE_NVGPRS(r1);						    \
+	SANITIZE_ZEROIZE_NVGPRS();	/* minimise speculation influence */
 
 #define EXCEPTION_COMMON(n) \
 	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_GEN_SCRATCH, PACA_EXGEN)
-- 
2.37.2

