Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05C5993BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M877d0Xv0z3fkN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiAwaSmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiAwaSmG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vQ1Xw6z3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3RwNH024311;
	Fri, 19 Aug 2022 03:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zQ1aY6R71DlL45RDlh7DB0v409SzFsLGUpdrcVC6fv0=;
 b=IiAwaSmGzOuMojjPwICm+SqE7XrB4sPPXGygFVDjQPtqXbybAmXDZAlJcDf+oyHwLolQ
 sXPTRSb43svCWojOK0zky92uMGOsjbUAZ1LtYx/dQGQ93NFJ4wZLoPCO0zEt17339JfX
 Cx+7doPn8ljCCTdJB7eGV1uYilt2MM4vqXuB6xbGdI6p3KpQ/O7cr/jsOPX3lUbslp2Y
 PDF/vUA69DxX1vsu1ce0WswyB81Ljm2VUmxpXJ4u3YRXeLLhT/WR2XT97Yeam3xbekAj
 u6SCoRu8i2Qr8HRqrMe0Lcg7g+2oPgF0LD0D/Fu08h1KA7wONWZ6xbKXnESw4rHR3V6J eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22mwgaby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:37 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3b3M4003257;
	Fri, 19 Aug 2022 03:39:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3hx3k8vynn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:35 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dXcg34078988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30E32AE04D;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEB5BAE045;
	Fri, 19 Aug 2022 03:39:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:32 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 962946043A;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/18] powerpc: Remove direct call to mmap2 syscall handlers
Date: Fri, 19 Aug 2022 13:37:55 +1000
Message-Id: <20220819033806.162054-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FVnMGqIQ8kCrGtJGU1fcvRxHyaqFpXZU
X-Proofpoint-ORIG-GUID: FVnMGqIQ8kCrGtJGU1fcvRxHyaqFpXZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=960
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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

Syscall handlers should not be invoked internally by their symbol names,
as these symbols defined by the architecture-defined SYSCALL_DEFINE
macro. Move the compatibility syscall definition for mmap2 to
syscalls.c, so that all mmap implementations can share an inline helper
function, as is done with the personality handlers.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
---
 arch/powerpc/kernel/sys_ppc32.c | 10 ----------
 arch/powerpc/kernel/syscalls.c  | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 60cb5b4413b0..dd9039671227 100644
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
@@ -48,15 +47,6 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-COMPAT_SYSCALL_DEFINE6(mmap2,
-		       unsigned long, addr, size_t, len,
-		       unsigned long, prot, unsigned long, flags,
-		       unsigned long, fd, unsigned long, pgoff)
-{
-	/* This should remain 12 even if PAGE_SIZE changes */
-	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
-}
-
 /* 
  * long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index e083935c5bf2..0afbcbd50433 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
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

