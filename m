Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186959F147
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8h22L7Mz3f6d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkX9cRlV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkX9cRlV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8c2621qz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:06:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1xrw6008816;
	Wed, 24 Aug 2022 02:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dsbzqu9Q6MjSuLW77o4ZpL8UGycI39xp/NSHPPlml+Q=;
 b=rkX9cRlVHP/99J4I8fts1RHZ2Zd3ijriaTmSWAFdn/9POv7EwlG88rlQ0DaQUTMBZjB6
 pNMjma0th1F2k7aBZb9uiVu1hEzZ/HWKpJZvmyOxNNKU+CrhE51ZNSZkmIqEMCZRYr3l
 WsMNcEwDeUK40/TCc6XwwD+NWQi+yEIeLZ3d9FGL4nSyGARid08jPSf8GOoLpE0ScnJA
 DiyqL1LZS8eZveN1VM5/rlwDULZ5C8GSLQt+aZkmu4YArxVwlUWhGYpflkao+coEyYO0
 R/AaLdVBGki6BF+8Jx17rjRWIl2kRlvEwA8NpbkWsgQdcYVmxXut2Ja3HnUlwWvNBczd Qg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag55y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25UKJ021688;
	Wed, 24 Aug 2022 02:06:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3j2q88vfqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26h9o29163844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B83454203F;
	Wed, 24 Aug 2022 02:06:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61BB842042;
	Wed, 24 Aug 2022 02:06:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:06:43 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6791160430;
	Wed, 24 Aug 2022 12:06:39 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/20] powerpc: Remove direct call to mmap2 syscall handlers
Date: Wed, 24 Aug 2022 12:05:34 +1000
Message-Id: <20220824020548.62625-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _pgjAOZwYODoAXe5qzh-x4GfYtLiMlMu
X-Proofpoint-ORIG-GUID: _pgjAOZwYODoAXe5qzh-x4GfYtLiMlMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=983 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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
V3 -> V4: Move to be applied before syscall wrapper introduced.
---
 arch/powerpc/kernel/sys_ppc32.c |  9 ---------
 arch/powerpc/kernel/syscalls.c  | 11 +++++++++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index f4edcc9489fb..bc6491ed6454 100644
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
 /* 
  * long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index b8461128c8f7..32fadf3c2cd3 100644
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

