Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014169F0DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM9DT6WyCz3c81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:03:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbHHtrEC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbHHtrEC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM9CX5rBtz3bgq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:02:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M8QXUq027042;
	Wed, 22 Feb 2023 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Wcw5U9usVW0jSpUTwgc+fcPdSplu62KQeKvS/wONcM8=;
 b=pbHHtrECsXb9y2BUnOMKh1X9REHJK02Zx8DjXES8efOlWFlTllOLHtBVtBik/Qn9R0Cl
 Itawjj7+onswD5JPLBr+B8bVyoBjQmHavk1y94M/tmfhhg7vaAc84p2AGtbCn+5j3SqO
 HBw7467JMun2EAzm3SLP8uR+EKN5deZYx+WYQkdDKoBluI5Ad61VL4Fw2YXdqC/Zcygw
 tE/gzJArsiFji4/QHh8Q+LAvS1VDQMMWMbTIxm1Y5RuR53ZfasqxLF2kwLPNbFdKwpiM
 Hsa6RJfmSILefiTmvd2XqNbXd6/jJ+QU8QqNHPnW182TXCvWIR/Zz5aK/1Eq3SrhH9IL 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwfhvgsns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:02:23 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M8bVc9001222;
	Wed, 22 Feb 2023 09:02:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwfhvgs6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:02:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDHs8u020937;
	Wed, 22 Feb 2023 09:01:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ntpa6buq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:01:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M91O6226280682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 09:01:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CDA12004B;
	Wed, 22 Feb 2023 09:01:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C24F20040;
	Wed, 22 Feb 2023 09:01:20 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Feb 2023 09:01:19 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rohan McLure <rmclure@linux.ibm.com>
Subject: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb to lwsync
Date: Wed, 22 Feb 2023 14:31:12 +0530
Message-Id: <20230222090112.187583-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QSyD09S1KL2OukIdwsFLPU76kYkEd2ei
X-Proofpoint-ORIG-GUID: zGfMT4bp9Ocw1RK_BS4iUcheaR5QJK7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=774 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220078
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A link from ibm.com states:
"Ensures that all instructions preceding the call to __lwsync
 complete before any subsequent store instructions can be executed
 on the processor that executed the function. Also, it ensures that
 all load instructions preceding the call to __lwsync complete before
 any subsequent load instructions can be executed on the processor
 that executed the function. This allows you to synchronize between
 multiple processors with minimal performance impact, as __lwsync
 does not wait for confirmation from each processor."

Thats why smp_rmb() and smp_wmb() are defined to lwsync.
But this same understanding applies to parallel pipeline
execution on each PowerPC processor.
So, use the lwsync instruction for rmb() and wmb() on the PPC
architectures that support it.

Also removed some useless spaces.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/barrier.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index e80b2c0e9315..553f5a5d20bd 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -41,11 +41,17 @@
 
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
-#    define SMPWMB      LWSYNC
+#undef rmb
+#undef wmb
+/* Redefine rmb() to lwsync. */
+#define rmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
+/* Redefine wmb() to lwsync. */
+#define wmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
+#define SMPWMB      LWSYNC
 #elif defined(CONFIG_BOOKE)
-#    define SMPWMB      mbar
+#define SMPWMB      mbar
 #else
-#    define SMPWMB      eieio
+#define SMPWMB      eieio
 #endif
 
 /* clang defines this macro for a builtin, which will not work with runtime patching */
-- 
2.31.1

