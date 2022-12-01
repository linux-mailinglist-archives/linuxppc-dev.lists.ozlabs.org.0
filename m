Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00063EA2C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN6l44y5pz3bfF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS9T7S1O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS9T7S1O;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN6g42KVCz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:10:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B16xj5q011736;
	Thu, 1 Dec 2022 07:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VOAMstgk1DDXg7FK24wKhybWhVmFhKedDdiLRA3Bfn4=;
 b=JS9T7S1OZqLRKe6zB4UKihed/SVK4VFwzs4RSDMdKYcP2C1TBMmasKMlQsBNo5W7CxGj
 3AjxxEoTFn6MHXH+A2d7GsjOdLIAMvgpSvh79xtpfrAWyD0b0Kg0vwon9kHDVMK0cT6e
 GowhZFAc7F7NJ7MFPr5plcQ3fxFtpxGYuWilwziDztXsL+2xMSCOZHwKbUjefoHIV/VN
 wUi+05RUVH9HyLfgEo9iLp3bJD+VstEf/RoPVuJ77q/cBijhYbmVpr1+bSLJ94Nr25Np
 biuMAYDkfO1Pgq8idVflHEr+8rqQ4IsxRiEsYyavA2MNYtEESBMeMjiX1IbMXXEXke9+ Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qa40cja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:51 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B1745Aq029672;
	Thu, 1 Dec 2022 07:10:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qa40che-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B176MY6012734;
	Thu, 1 Dec 2022 07:10:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hxy5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B17Akwx7340578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 07:10:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D1BEA405B;
	Thu,  1 Dec 2022 07:10:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BC9A4054;
	Thu,  1 Dec 2022 07:10:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 07:10:46 +0000 (GMT)
Received: from civic.. (unknown [9.177.92.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C06DE60366;
	Thu,  1 Dec 2022 18:10:42 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/7] powerpc/64s: IOption for MSR stored in r12
Date: Thu,  1 Dec 2022 18:10:16 +1100
Message-Id: <20221201071019.1953023-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221201071019.1953023-1-rmclure@linux.ibm.com>
References: <20221201071019.1953023-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MdLzY-1RdX1hv2eCZZ8NzzRcv4DJ_7hA
X-Proofpoint-ORIG-GUID: G2p6o-Pq2ZPtyRK1EGVozxEM8beR6e8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=761
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010048
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

Interrupt handlers in asm/exceptions-64s.S contain a great deal of common
code produced by the GEN_COMMON macros. Currently, at the exit point of
the macro, r12 will contain the contents of the MSR. A future patch will
cause these macros to zeroise architected registers to avoid potential
speculation influence of user data.

Provide an IOption that signals that r12 must be retained, as the
interrupt handler assumes it to hold the contents of the MSR.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v4: Split 64s register sanitisation commit to establish this IOption
---
 arch/powerpc/kernel/exceptions-64s.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5381a43e50fe..58d72db1d484 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -111,6 +111,7 @@ name:
 #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
 #define __ISTACK(name)	.L_ISTACK_ ## name
 #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
+#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -176,6 +177,9 @@ do_define_int n
 	.ifndef IKUAP
 		IKUAP=1
 	.endif
+	.ifndef IMSR_R12
+		IMSR_R12=0
+	.endif
 .endm
 
 /*
@@ -1751,6 +1755,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -2372,6 +2377,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2421,6 +2427,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	IMSR_R12=1
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
-- 
2.37.2

