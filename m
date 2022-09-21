Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10055BF755
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV5Y2LNcz3gJ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:14:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lpvLZHMW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lpvLZHMW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTmY1l7nz3f4t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6gQxr025613;
	Wed, 21 Sep 2022 06:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p016jM1f1mQNYpH62akW3Tf41ixuV/Q/lxVjkwHfogY=;
 b=lpvLZHMWHtLYdjTHLHzlnnKY+sVjh/p+OcHgrDImlqxSeiLGbet0zGP83Ezva2dS9+12
 irHyonF6CM0dLqky5PE2syio/oWDP2Rnyu877I8vPMuGJI+CbZVMoHdSGMug9iG247+U
 B7n34DJhkVsjG3BjGCezUFMeUM09ZmfK96tz0gj13pvTjfi8zv40bvjAibBi4RJuOgHm
 UjSojOUIDXvIxGFzSoAJ9Wy2D+6OlGwelu4EHXPffMqzC8Zu0WlBfUtQ6Vm6bUocY8jF
 LA0ZTaYTX1rV5pLKL20f8jQANEAm+RDNT5AKYzVMZmiEKR6rj0UplhGGFLPf1WAPs0Ze og== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwju8emu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rUut004615;
	Wed, 21 Sep 2022 06:59:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8mvk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6tGqQ40174054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:55:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64B4E4C046;
	Wed, 21 Sep 2022 06:59:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F3624C040;
	Wed, 21 Sep 2022 06:59:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:59:16 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2164960531;
	Wed, 21 Sep 2022 16:59:12 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 25/25] powerpc/64e: Clear gprs on interrupt routine entry on Book3E
Date: Wed, 21 Sep 2022 16:56:05 +1000
Message-Id: <20220921065605.1051927-26-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Sz5HTIvM77kp0CyQJfCcFMaPtQqwbGHG
X-Proofpoint-ORIG-GUID: Sz5HTIvM77kp0CyQJfCcFMaPtQqwbGHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 mlxlogscore=608 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
V4: New patch.
V5: Depend on Kconfig option. Remove ZEROIZE_NVGPRS on bad kernel
stack handler.
V6: Change name of zeroize macro to be consistent with Book3S.
---
 arch/powerpc/kernel/exceptions-64e.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index f1d714acc945..d55c0a368dcb 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -366,6 +366,11 @@ ret_from_mc_except:
 	std	r14,PACA_EXMC+EX_R14(r13);				    \
 	std	r15,PACA_EXMC+EX_R15(r13)
 
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_ZEROIZE_NVGPRS()	ZEROIZE_NVGPRS()
+#else
+#define SANITIZE_ZEROIZE_NVGPRS()
+#endif
 
 /* Core exception code for all exceptions except TLB misses. */
 #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
@@ -402,7 +407,8 @@ exc_##n##_common:							    \
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

