Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5969F0E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM9GK3yQlz2xJN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CgOf7IN2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CgOf7IN2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM9FK4NVZz3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:04:05 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M7C5ZR040585;
	Wed, 22 Feb 2023 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cxrO0BbDUH2tKiBBxpepRQ4gxOgG7/PBThZqAEqGpYE=;
 b=CgOf7IN29BzgdNz0ntpQ+BYARIaJMWYCPwNI5UYqWUok0+xlQ2CfvV2hxXDVa3Y9v7jH
 dCd+awsEIxeTeqDHchootYVV99wxhjoSlGSPvYSOQyv8Xwmgo30y1SKkzt/Y4VaOmGr0
 lHXCcW1pRZl5xPqLjwLb7Aq/B2pyQWwfm8aM1caCLn6+0pilcerZuz1/m/s+VjObXPi8
 ayGFsqarED3S5BOAouEQs28sL25tYj56uNcKyUJkjVaxuUBGRLRUN4BVChzCsWqDgrU3
 pKR7EPqL8anURG+plfYFt9fCrpieVwTOPFWGtEhQv/aC56qBcdDJVBzBiWNuiXAAa+Up VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nweesap5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:03:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M8uvaj024487;
	Wed, 22 Feb 2023 09:03:58 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nweesap4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:03:58 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LClhdQ031888;
	Wed, 22 Feb 2023 09:03:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ntpa6busf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:03:55 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M93rIx50266414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 09:03:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ACD82004B;
	Wed, 22 Feb 2023 09:03:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E0920043;
	Wed, 22 Feb 2023 09:03:50 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Feb 2023 09:03:50 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rohan McLure <rmclure@linux.ibm.com>
Subject: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb to  lwsync
Date: Wed, 22 Feb 2023 14:33:44 +0530
Message-Id: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NaYc2lZZu0jJ8X5W3gtlCbMrNFeQnFkQ
X-Proofpoint-GUID: H6girN4eq9gcI0GUR15wgtr31GAK9Iij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=837
 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220078
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

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/barrier.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index b95b666f0374..e088dacc0ee8 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -36,8 +36,15 @@
  * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
  */
 #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
+
+/* The sub-arch has lwsync. */
+#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
+#define __rmb() __asm__ __volatile__ ("lwsync" : : : "memory")
+#define __wmb() __asm__ __volatile__ ("lwsync" : : : "memory")
+#else
 #define __rmb()  __asm__ __volatile__ ("sync" : : : "memory")
 #define __wmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#endif
 
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
-- 
2.31.1

