Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DF54F044
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 06:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPR3M0qXxz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgiDr4MC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rashmica@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgiDr4MC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPR2h5JT4z3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 14:31:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H3RoZ4001542;
	Fri, 17 Jun 2022 04:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=S7O5dVhabzfgHb8SEqAXLtXSobTXSoHnjgyh2rp2CKA=;
 b=QgiDr4MCm11X81jilPcJ0pR7ijc/gGiPpMIQHBN7d6PzLTbowFjsvhK2wBvjNEsww6pf
 n1ZRkuJI1W7otXQGOGONjH9VN8XE5YuPnhaEsYET/eHDJ0BZyzMgmMNz7cezfrxVddQ9
 yF84KZmTFrY0HfZc60ckvTMeqeXk2AbARIJqyKzXeHEvpvl1u58UdiYicL2bOK1o72Xc
 NNHprexHgS9yEe7bnul+x5Dn1nxRrTN0gCu6+C5TVKy8O59OYqc2+hcAmPz+UJnyc7MO
 rZ+jHfYXR6gr1x5xCJezkRnf5Idz2uLZUIAUOZU5bW1tx7kidQroC+JlL6VAvLKKMQnw Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grbvf85xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:31:51 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25H4Qchv023368;
	Fri, 17 Jun 2022 04:31:51 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grbvf85x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:31:50 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25H4L42B014316;
	Fri, 17 Jun 2022 04:31:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3gmjp8xd0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:31:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25H4VjV622741328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 04:31:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8A0E42045;
	Fri, 17 Jun 2022 04:31:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 635964203F;
	Fri, 17 Jun 2022 04:31:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 17 Jun 2022 04:31:45 +0000 (GMT)
Received: from rashmica.home.majoof.com (unknown [9.43.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1324460100;
	Fri, 17 Jun 2022 14:31:42 +1000 (AEST)
From: Rashmica Gupta <rashmica@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/signal: Update comment for clarity
Date: Fri, 17 Jun 2022 14:31:35 +1000
Message-Id: <20220617043135.426897-1-rashmica@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DKn6nv7WNrP3nkGkxOQxmj7V3NYc3DeF
X-Proofpoint-ORIG-GUID: aknwYIGvMYECE52zlqBCTfPuBeJzxPKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_02,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170020
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The comment being referred to was deleted in commit af1bbc3dd3d5 ("powerpc:
Remove UP only lazy floating point and vector optimisations").

Add a bit more detail so it's clear why we need to clear the FP/VEC/VSX
bits here.

Signed-off-by: Rashmica Gupta <rashmica@linux.ibm.com>
---
 arch/powerpc/kernel/signal_64.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 472596a109e2..86bb5bb4c143 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -377,9 +377,12 @@ static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_
 		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
 
 	/*
-	 * Force reload of FP/VEC.
-	 * This has to be done before copying stuff into tsk->thread.fpr/vr
-	 * for the reasons explained in the previous comment.
+	 * Force reload of FP/VEC/VSX so userspace sees any changes.
+	 * Clear these bits from the user process' MSR before copying into the
+	 * thread struct. If we are rescheduled or preempted and another task
+	 * uses FP/VEC/VSX, and this process has the MSR bits set, then the
+	 * context switch code will save the current CPU state into the
+	 * thread_struct - possibly overwriting the data we are updating here.
 	 */
 	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX));
 
-- 
2.35.3

