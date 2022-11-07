Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D261EB07
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 07:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5LxH1cpKz3f5m
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 17:32:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7ikb1KR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7ikb1KR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5LsC0R9cz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 17:28:30 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A75mMrp026231;
	Mon, 7 Nov 2022 06:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=g2XXo3nJNPfwOKVwxo8g5SQulXD4N0jqXaj/bxyqkD8=;
 b=s7ikb1KRGVfX5r8PBLXJTTBov8TYERSr7mwJ/BjxVUr0hoDZaie9gxX6+lNyPSyPijhE
 w22hvaWWNyInK1JSwiFPMghJm0wwKSXfxtdVPwOxwWMNAwFiBYAJms5IaiDIOVomqMjy
 kfrXdjSY59KlvyA/b7SYoqI+yAdj9S++NuC8Zz/189MO2YvwOLYLY/vgHN+nw7blx7f7
 pCHhfDvKSr8HxjNxsfEMVUvC6atrRGsX7jiDVdJLtHY59n1OdvK79B44GDRNb+PN0xrU
 cePdx2nq3y7Lb2yBMo9IW6RiAApn2Ho6p/9GShKKmO8JPEwt/TExt7eU6e7zu2bQKh3b XA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1vrya8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:28:22 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A76KJ2B006844;
	Mon, 7 Nov 2022 06:28:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3kngp5hgwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:28:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A76SIUo24773184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 06:28:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9416CA404D;
	Mon,  7 Nov 2022 06:28:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F320A4040;
	Mon,  7 Nov 2022 06:28:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 06:28:18 +0000 (GMT)
Received: from civic.. (unknown [9.177.26.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F295F6036F;
	Mon,  7 Nov 2022 17:28:14 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/64e: Clear gprs on interrupt routine entry on Book3E
Date: Mon,  7 Nov 2022 14:32:01 +1100
Message-Id: <20221107033202.1375238-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107033202.1375238-1-rmclure@linux.ibm.com>
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NgFVWjx5Q_KcTuYrHBHy0TTrIT_7kxZQ
X-Proofpoint-GUID: NgFVWjx5Q_KcTuYrHBHy0TTrIT_7kxZQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=701
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070051
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
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

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
---
 arch/powerpc/kernel/exceptions-64e.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 2f68fb2ee4fc..91d8019123c2 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -358,6 +358,11 @@ ret_from_mc_except:
 	std	r14,PACA_EXMC+EX_R14(r13);				    \
 	std	r15,PACA_EXMC+EX_R15(r13)
 
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_ZEROIZE_NVGPRS()	ZEROIZE_NVGPRS()
+#else
+#define SANITIZE_ZEROIZE_NVGPRS()
+#endif
 
 /* Core exception code for all exceptions except TLB misses. */
 #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
@@ -394,7 +399,8 @@ exc_##n##_common:							    \
 	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
 	std	r0,RESULT(r1);		/* clear regs->result */	    \
-	SAVE_NVGPRS(r1);
+	SAVE_NVGPRS(r1);						    \
+	SANITIZE_ZEROIZE_NVGPRS();	/* minimise speculation influence */
 
 #define EXCEPTION_COMMON(n) \
 	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_GEN_SCRATCH, PACA_EXGEN)
-- 
2.34.1

