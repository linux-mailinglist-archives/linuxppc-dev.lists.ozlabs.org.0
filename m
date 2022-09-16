Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC355BA65E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:36:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTN951K1gz3fBW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CFkhybVb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CFkhybVb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5k1dJQz3bZt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5SkiG008898;
	Fri, 16 Sep 2022 05:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jg4HvWBwT5S2C3SUQM7yZQUo64Da9pQa+qv9Xg7pNxk=;
 b=CFkhybVbyimwHT0GujfgfOGolMS3UR56Og3CKjN2u+kgj8zUV81jGCv29mZ4P8SKaLqR
 Tgtt9Om2e3/FpYTC/PTckoxCZgeoCmLSI47V2PstQGj8zVOSIY/UKZ/qcCEKKuzI0Vs8
 nWWD6tA0YzKHccWhSYfWjD/OK2/IOnIIH6syU55/r5ehJ0HP++vL9m4/ImnjsfRWe7zO
 //uTYa6r88IbgjkcbjTZEsWmaWNQlr/VJK7r0W1IuthMMeNtbyxAf1EIazuA4S/WMSVn
 7JQoE9JPm+7oBO7zx2hoaKKApKCDT8lmRxiH8iw3DUVt30RRkWkc9cEN8WHcPurSueDg sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk1b05xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5T6xj010429;
	Fri, 16 Sep 2022 05:33:23 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk1b05vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kpnd020720;
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3jm9168cgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XIiJ34013662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74781AE045;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20226AE04D;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7172260556;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/23] powerpc: Remove direct call to mmap2 syscall handlers
Date: Fri, 16 Sep 2022 15:32:50 +1000
Message-Id: <20220916053300.786330-14-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e7mWz5YN6wmnuT1dee0gxQH7fkpmmcX0
X-Proofpoint-ORIG-GUID: rIaLBS8fvfi1sOyLD5PJEK7WasZL_5nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Syscall handlers should not be invoked internally by their symbol names,
as these symbols defined by the architecture-defined SYSCALL_DEFINE
macro. Move the compatibility syscall definition for mmap2 to
syscalls.c, so that all mmap implementations can share a helper function.

Remove 'inline' on static mmap helper.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V1 -> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
V3 -> V4: Move to be applied before syscall wrapper introduced.
V4 -> V5: Remove 'inline' in helper.
---
 arch/powerpc/kernel/sys_ppc32.c |  9 ---------
 arch/powerpc/kernel/syscalls.c  | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index d961634976d8..776ae7565fc5 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -25,7 +25,6 @@
 #include <linux/poll.h>
 #include <linux/personality.h>
 #include <linux/stat.h>
-#include <linux/mman.h>
 #include <linux/in.h>
 #include <linux/syscalls.h>
 #include <linux/unistd.h>
@@ -48,14 +47,6 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			  unsigned long prot, unsigned long flags,
-			  unsigned long fd, unsigned long pgoff)
-{
-	/* This should remain 12 even if PAGE_SIZE changes */
-	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
-}
-
 compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
 			     u32 reg6, u32 pos1, u32 pos2)
 {
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index a04c97faa21a..9830957498b0 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -36,9 +36,9 @@
 #include <asm/time.h>
 #include <asm/unistd.h>
 
-static inline long do_mmap2(unsigned long addr, size_t len,
-			unsigned long prot, unsigned long flags,
-			unsigned long fd, unsigned long off, int shift)
+static long do_mmap2(unsigned long addr, size_t len,
+		     unsigned long prot, unsigned long flags,
+		     unsigned long fd, unsigned long off, int shift)
 {
 	if (!arch_validate_prot(prot, addr))
 		return -EINVAL;
@@ -56,6 +56,17 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, size_t, len,
 	return do_mmap2(addr, len, prot, flags, fd, pgoff, PAGE_SHIFT-12);
 }
 
+#ifdef CONFIG_COMPAT
+COMPAT_SYSCALL_DEFINE6(mmap2,
+		       unsigned long, addr, size_t, len,
+		       unsigned long, prot, unsigned long, flags,
+		       unsigned long, fd, unsigned long, pgoff)
+{
+	/* This should remain 12 even if PAGE_SIZE changes */
+	return do_mmap2(addr, len, prot, flags, fd, pgoff << 12, PAGE_SHIFT-12);
+}
+#endif
+
 SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 		unsigned long, prot, unsigned long, flags,
 		unsigned long, fd, off_t, offset)
-- 
2.34.1

