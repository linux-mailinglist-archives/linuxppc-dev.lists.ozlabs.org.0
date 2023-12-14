Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF28127A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:05:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPBCCJIq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMJw5HXyz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:05:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPBCCJIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM783g97z3c55
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:52 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE5bkhT003442;
	Thu, 14 Dec 2023 05:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Or+ER3iSwLY+2GcnBysJHFAbWg54QnxrivHZZRWSUlo=;
 b=jPBCCJIq3GKGrIuMP1yn436SePKJpby26k22ilj2Zem4QVli3eQCXD+/wL1bjAOD1iuJ
 /FZtdWsm7ipjuytRcepQOR1cQXIRTw3R6XshoDZQbbrMErpEkwAwJybCndj1K544Yg25
 hq1zYmXU2FZ70rTaisY9r79SKKj32xliME3keJfd4RILx2JlFn6DWkOnvsx4oqAnlI3Z
 FLh87rcb7Y5C9OUm5eFP+TfQRbo+BTby94YosokRO49Hij6k/J8r461vUgCrpGWYxL/9
 rIyYoy6VBsqO1l7ojZyS8F+AiRjyaA6xdhYF+9W+WdGUwSwls8UJ4ltppIgHzDPjmNV9 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyuqp0av5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:40 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5rRSq022695;
	Thu, 14 Dec 2023 05:56:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyuqp0asc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE3jVip008467;
	Thu, 14 Dec 2023 05:56:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw2jtpnfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uO5O46727664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D30272004D;
	Thu, 14 Dec 2023 05:56:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E42AE20040;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 98F37606F0;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 10/13] powerpc: Define KMSAN metadata address ranges for vmalloc and ioremap
Date: Thu, 14 Dec 2023 05:55:36 +0000
Message-Id: <20231214055539.9420-11-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214055539.9420-1-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BSRtrog9VNVw4H1y8EPLE2_PMzM43F4_
X-Proofpoint-GUID: z-dPmrvTGG-i94A2fIfwubmwfRHh6Qb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312140035
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
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Splits the vmalloc region into four. The first quarter is the new
vmalloc region, the second is used to store shadow metadata and the
third is used to store origin metadata. The fourth quarter is unused.

Do the same for the ioremap region.

Module data is stored in the vmalloc region so alias the modules
metadata addresses to the respective vmalloc metadata addresses. Define
MODULES_VADDR and MODULES_END to the start and end of the vmalloc
region.

Since MODULES_VADDR was previously only defined on ppc32 targets checks
for if this macro is defined need to be updated to include
defined(CONFIG_PPC32).

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 42 ++++++++++++++++++++
 arch/powerpc/kernel/module.c                 |  2 +-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb77eddca54b..b3a02b8d96e3 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -249,7 +249,38 @@ enum pgtable_index {
 extern unsigned long __vmalloc_start;
 extern unsigned long __vmalloc_end;
 #define VMALLOC_START	__vmalloc_start
+
+#ifndef CONFIG_KMSAN
 #define VMALLOC_END	__vmalloc_end
+#else
+/*
+ * In KMSAN builds vmalloc area is four times smaller, and the remaining 3/4
+ * are used to keep the metadata for virtual pages. The memory formerly
+ * belonging to vmalloc area is now laid out as follows:
+ *
+ * 1st quarter: VMALLOC_START to VMALLOC_END - new vmalloc area
+ * 2nd quarter: KMSAN_VMALLOC_SHADOW_START to
+ *              KMSAN_VMALLOC_SHADOW_START+VMALLOC_LEN - vmalloc area shadow
+ * 3rd quarter: KMSAN_VMALLOC_ORIGIN_START to
+ *              KMSAN_VMALLOC_ORIGIN_START+VMALLOC_LEN - vmalloc area origins
+ * 4th quarter: unused
+ */
+#define VMALLOC_LEN ((__vmalloc_end - __vmalloc_start) >> 2)
+#define VMALLOC_END (VMALLOC_START + VMALLOC_LEN)
+
+#define KMSAN_VMALLOC_SHADOW_START VMALLOC_END
+#define KMSAN_VMALLOC_ORIGIN_START (VMALLOC_END + VMALLOC_LEN)
+
+/*
+ * Module metadata is stored in the corresponding vmalloc metadata regions
+ */
+#define KMSAN_MODULES_SHADOW_START	KMSAN_VMALLOC_SHADOW_START
+#define KMSAN_MODULES_ORIGIN_START	KMSAN_VMALLOC_ORIGIN_START
+#endif /* CONFIG_KMSAN */
+
+#define MODULES_VADDR VMALLOC_START
+#define MODULES_END VMALLOC_END
+#define MODULES_LEN		(MODULES_END - MODULES_VADDR)
 
 static inline unsigned int ioremap_max_order(void)
 {
@@ -264,7 +295,18 @@ extern unsigned long __kernel_io_start;
 extern unsigned long __kernel_io_end;
 #define KERN_VIRT_START __kernel_virt_start
 #define KERN_IO_START  __kernel_io_start
+#ifndef CONFIG_KMSAN
 #define KERN_IO_END __kernel_io_end
+#else
+/*
+ * In KMSAN builds IO space is 4 times smaller, the remaining space is used to
+ * store metadata. See comment for vmalloc regions above.
+ */
+#define KERN_IO_LEN             ((__kernel_io_end - __kernel_io_start) >> 2)
+#define KERN_IO_END             (KERN_IO_START + KERN_IO_LEN)
+#define KERN_IO_SHADOW_START    KERN_IO_END
+#define KERN_IO_ORIGIN_START    (KERN_IO_SHADOW_START + KERN_IO_LEN)
+#endif /* !CONFIG_KMSAN */
 
 extern struct page *vmemmap;
 extern unsigned long pci_io_base;
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a1692..5043b959ad4d 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -107,7 +107,7 @@ __module_alloc(unsigned long size, unsigned long start, unsigned long end, bool
 
 void *module_alloc(unsigned long size)
 {
-#ifdef MODULES_VADDR
+#if defined(MODULES_VADDR) && defined(CONFIG_PPC32)
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 	void *ptr = NULL;
 
-- 
2.40.1

