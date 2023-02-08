Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148D68E698
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQSF5gP0z3f3m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6ecocL3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6ecocL3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQLP2YMsz3cMy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:23:09 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3183EqTa026463;
	Wed, 8 Feb 2023 03:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MVHaAAE3pPBcYDb3YKFfFMpRRndCqfxWqcroQlKkYwU=;
 b=g6ecocL33QFI9tTtwvlGa3NEz09cBaDJG7KDSo7tfjAI/MdHqCalgaxXBgh6Q9PcJmyv
 qbr9waZBybofUz2NirHtA+r7e6osAQgkEiCwdKJvY34VTx/VsAKEmbNJvaQCW84ULdt5
 lRkpc1zDsaBIuYpc3XKfOefeUefKEMeo+teRC5zhe8Pt1vB7B9XsrppAfOr773RAJeB3
 LYAJQY2+zixboNiattPVpceQQYXy1GTOA9t2MTBmB0XIc7nrTfegoWiQ2qpSXKhst686
 +Luiv1/3doRnMehm81r9oUYP6wHyAweRf2Lt4MlCRgmDuhD9W2qEko3Cj0WleTwdGJ2N xA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3nt84rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:03 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3183KEKp011503;
	Wed, 8 Feb 2023 03:23:03 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3nt84r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:03 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317FQ0LV005658;
	Wed, 8 Feb 2023 03:23:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06k1yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:23:01 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183Mx7052691310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:22:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F73720043;
	Wed,  8 Feb 2023 03:22:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FAC920040;
	Wed,  8 Feb 2023 03:22:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:22:58 +0000 (GMT)
Received: from civic.. (unknown [9.177.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4A172602EE;
	Wed,  8 Feb 2023 14:22:49 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux.xtensa.org
Subject: [PATCH v4 5/7] powerpc: kcsan: Memory barriers semantics
Date: Wed,  8 Feb 2023 14:22:00 +1100
Message-Id: <20230208032202.1357949-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208032202.1357949-1-rmclure@linux.ibm.com>
References: <20230208032202.1357949-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LVuKS4ZPogJ6Ym4g3XGH91HFxpe7qVO8
X-Proofpoint-ORIG-GUID: SS701nOodU1ECjlniBY57tm5OxzNne0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxlogscore=987 phishscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080027
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
Cc: chris@zankel.net, elver@google.com, npiggin@gmail.com, jcmvbkbc@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Annotate memory barriers *mb() with calls to kcsan_mb(), signaling to
compilers supporting KCSAN that the respective memory barrier has been
issued. Rename memory barrier *mb() to __*mb() to opt in for
asm-generic/barrier.h to generate the respective *mb() macro.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v2: Implement __smp_mb() in terms of __mb() to avoid duplicate calls to
kcsan_mb()
---
 arch/powerpc/include/asm/barrier.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index e80b2c0e9315..b95b666f0374 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -35,9 +35,9 @@
  * However, on CPUs that don't support lwsync, lwsync actually maps to a
  * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
  */
-#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
-#define rmb()  __asm__ __volatile__ ("sync" : : : "memory")
-#define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
+#define __rmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#define __wmb()  __asm__ __volatile__ ("sync" : : : "memory")
 
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
@@ -51,12 +51,12 @@
 /* clang defines this macro for a builtin, which will not work with runtime patching */
 #undef __lwsync
 #define __lwsync()	__asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
-#define dma_rmb()	__lwsync()
-#define dma_wmb()	__asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")
+#define __dma_rmb()	__lwsync()
+#define __dma_wmb()	__asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")
 
 #define __smp_lwsync()	__lwsync()
 
-#define __smp_mb()	mb()
+#define __smp_mb()	__mb()
 #define __smp_rmb()	__lwsync()
 #define __smp_wmb()	__asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")
 
-- 
2.37.2

