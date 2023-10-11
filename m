Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8B7C4956
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:44:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FECBKeZ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51t32Hqnz3vmp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FECBKeZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kQ5B3pz3c5L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:34 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5PlFS016161
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VdqU1NyobT3RQDQWhhoGtgExt3P0fj9/BC3qkLYVXRY=;
 b=FECBKeZ6ewFMBPUsNHydovQSCWalp2kbOxjOw8x8xiQM2eFcQjidOa/AQGK1ZFUTlySS
 val+7wAeYnsMUrh1XQ+JjyDTr9dpUYa0ABvxhUoAYqViTq+K3+/625tnA3Uw2z/4RCaE
 G8qhdsnMXSOg7MoxlGM3i3set/ouCJPkxlRHE4H19mScC9TjUbdmjgYewVqVqBeNdmRV
 nmhtzdtqj2YxW24iXfhEqYFr50U0f+P7WJS3n9PMNqVxuDUjk7Bbfx8yYXuKq0UbD7g1
 gU8uw8wg6PICcwfe0b25eJSFm7G9rjOVDZ6xnUMamh3kQtNxiv4ktYGi3IEYLwS3Gc0b 0A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnhw8bpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4AMV3024465
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsp7xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bTtN18612842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E28E2004E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B8D32004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8972460832;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/12] powerpc: Cast away __iomem in low level IO routines
Date: Wed, 11 Oct 2023 16:37:09 +1100
Message-ID: <20231011053711.93427-11-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sxBVtdMfMvB8r293YGF9IZ_REDPQTxVy
X-Proofpoint-GUID: sxBVtdMfMvB8r293YGF9IZ_REDPQTxVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_02,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=731 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110048
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports dereferencing an __iomem pointer. These routines
are clearly low level handlers for IO memory, so force cast away
the __iomem annotation to tell sparse the dereferences are safe.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/io.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
index 2f29b7d432de..6af535905984 100644
--- a/arch/powerpc/kernel/io.c
+++ b/arch/powerpc/kernel/io.c
@@ -33,7 +33,7 @@ void _insb(const volatile u8 __iomem *port, void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		tmp = *port;
+		tmp = *(const volatile u8 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
@@ -49,7 +49,7 @@ void _outsb(volatile u8 __iomem *port, const void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		*port = *tbuf++;
+		*(volatile u8 __force *)port = *tbuf++;
 	} while (--count != 0);
 	asm volatile("sync");
 }
@@ -64,7 +64,7 @@ void _insw_ns(const volatile u16 __iomem *port, void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		tmp = *port;
+		tmp = *(const volatile u16 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
@@ -80,7 +80,7 @@ void _outsw_ns(volatile u16 __iomem *port, const void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		*port = *tbuf++;
+		*(volatile u16 __force *)port = *tbuf++;
 	} while (--count != 0);
 	asm volatile("sync");
 }
@@ -95,7 +95,7 @@ void _insl_ns(const volatile u32 __iomem *port, void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		tmp = *port;
+		tmp = *(const volatile u32 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
@@ -111,7 +111,7 @@ void _outsl_ns(volatile u32 __iomem *port, const void *buf, long count)
 		return;
 	asm volatile("sync");
 	do {
-		*port = *tbuf++;
+		*(volatile u32 __force *)port = *tbuf++;
 	} while (--count != 0);
 	asm volatile("sync");
 }
-- 
2.39.2

