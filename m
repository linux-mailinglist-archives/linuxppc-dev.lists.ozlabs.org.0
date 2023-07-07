Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9D74A875
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 03:32:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fGYJfV0a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxwqp5zX3z3c8q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 11:32:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fGYJfV0a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxwps2p7bz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 11:31:32 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3671LMR8016924;
	Fri, 7 Jul 2023 01:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jDs5oPLM7Fm1XuWhzcN+iNgHTg4AeqvGOirA5Wshfuw=;
 b=fGYJfV0a4QPGc2LbKUNH0kEjTxRPxDfo5JvKF66M+okRDXFtWa1blqftZktxMba6akzZ
 gqrSVNEdCA8/5sOrRiPJ/dcU2YAH07cAKnQgf8Epr7dQZWWzIvjveh8Gfz54jK/Z6F6p
 OPiS7v3TvDZzebILzocnB8JZJTnYsU3y94OUgtoFw288A2FzcvSEwqC/ba/PpGwN+bsa
 jMwlAD70bfIGqClNqAGIM+wO/tvQ5y0zjQxRIuoHowNUAb6AZBZGLzJkcvVmUcto4gfm
 hGFrzqOv7vr1aQvCGetMP5rohNdRzzjWwtMBME2Xc+tH48i53seHFvHUTfusjCPZezLr Ug== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp8ya85q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 01:31:29 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36714G3H016980;
	Fri, 7 Jul 2023 01:31:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rjbs52qgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 01:31:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3671VPQj52036056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 01:31:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34BC82004D;
	Fri,  7 Jul 2023 01:31:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B33D320063;
	Fri,  7 Jul 2023 01:31:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 01:31:24 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8F02B60142;
	Fri,  7 Jul 2023 11:31:21 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc64/kasan: Call kasan_early_init() after PACA initialised
Date: Fri,  7 Jul 2023 11:31:10 +1000
Message-ID: <20230707013110.215693-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mA0EkRik4oFtroMeHQMz1j3pllPW9DmM
X-Proofpoint-GUID: mA0EkRik4oFtroMeHQMz1j3pllPW9DmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxlogscore=597 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070007
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The KCOV handler __sanitizer_cov_trace_pc() uses the PACA, so initialise
the PACA first. This fixes a hang during boot when KASAN and KCOV are
both enabled, where the coverage tracer in kasan_early_init() tries to
access a field of the (currently null) PACA.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

I tried annotating kasan_early_init() with 'notrace', but it still
seemed to hang. It would also be less robust, because kasan_early_init()
may in future call generic code that should keep coverage.
---
 arch/powerpc/kernel/head_64.S  | 3 ---
 arch/powerpc/kernel/setup_64.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index f132d8704263..21a78a849ca8 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -1004,9 +1004,6 @@ start_here_multiplatform:
 	 * and SLB setup before we turn on relocation.
 	 */
 
-#ifdef CONFIG_KASAN
-	bl	CFUNC(kasan_early_init)
-#endif
 	/* Restore parameters passed from prom_init/kexec */
 	mr	r3,r31
 	LOAD_REG_ADDR(r12, DOTSYM(early_setup))
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 246201d0d879..a3f5decbc041 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -369,6 +369,10 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* -------- printk is now safe to use ------- */
 
+#ifdef CONFIG_KASAN
+	kasan_early_init();
+#endif
+
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (mfmsr() & MSR_HV))
 		enable_machine_check();
 
-- 
2.41.0

