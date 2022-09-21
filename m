Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9310F5BF6EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:04:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTtB1B4Mz3fhK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:04:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WCqUjhP8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WCqUjhP8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTll3G8Bz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6bamH002137;
	Wed, 21 Sep 2022 06:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UVYNUqKIKcZrByiZV3XmYWZWXjUvc2HtfoeISGdbVLY=;
 b=WCqUjhP8pVB/opO/PzkD7R63OKmb9aaHJ+uKNB6++9PEdEeJHmUGkaCN33s5i2rc9FtH
 1Bk9Sm9eVSnJJBEEdy48/v1DAcXGSfQbz1gMpkNJ//ePwUMvw4WzeCjLLWTkroOGOgp0
 Ewe+vofrZQX1us3jSTEAFkCygUEJl6qy4KFCFiHHx1oRb7RefnaDKXHX3vwoMS5UKzf/
 hOS7ZfOO0ZU4DX1WRR0kJDZ0shmq+Votzzz0DG253B4NGqB+NU4HqFZ3h5ZcFqBvvQti
 2zWly4yYOqPDxAi/1vYN6rpJgTxinVaLGf1mn5SITFTX8DVpA9ON5T74nvqJO6sYADVV nQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw6yrxb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rdN0025150;
	Wed, 21 Sep 2022 06:58:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3jn5v94uhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wWSq7799192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 448B74C040;
	Wed, 21 Sep 2022 06:58:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E21C94C044;
	Wed, 21 Sep 2022 06:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:58:31 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8413D60531;
	Wed, 21 Sep 2022 16:58:28 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 10/25] powerpc: Use generic fallocate compatibility syscall
Date: Wed, 21 Sep 2022 16:55:50 +1000
Message-Id: <20220921065605.1051927-11-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ezRTu3DVNnCgsd1gEbRIU2u_ZhgFkngI
X-Proofpoint-GUID: ezRTu3DVNnCgsd1gEbRIU2u_ZhgFkngI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=733 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc fallocate compat syscall handler is identical to the
generic implementation provided by commit 59c10c52f573f ("riscv:
compat: syscall: Add compat_sys_call_table implementation"), and as
such can be removed in favour of the generic implementation.

A future patch series will replace more architecture-defined syscall
handlers with generic implementations, dependent on introducing generic
implementations that are compatible with powerpc and arm's parameter
reorderings.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
V2: Remove arch-specific fallocate handler.
V3: Remove generic fallocate prototype. Move to beginning of.
V5: Remove implementation as well which I somehow failed to do.
Replace local BE compat_arg_u64 with generic.
---
 arch/powerpc/include/asm/syscalls.h | 2 --
 arch/powerpc/include/asm/unistd.h   | 1 +
 arch/powerpc/kernel/sys_ppc32.c     | 7 -------
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 16b668515d15..960b3871db72 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -51,8 +51,6 @@ compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u3
 int compat_sys_truncate64(const char __user *path, u32 reg4,
 			  unsigned long len1, unsigned long len2);
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1, u32 len2);
-
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 			   unsigned long len2);
 
diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index b1129b4ef57d..659a996c75aa 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -45,6 +45,7 @@
 #define __ARCH_WANT_SYS_UTIME
 #define __ARCH_WANT_SYS_NEWFSTATAT
 #define __ARCH_WANT_COMPAT_STAT
+#define __ARCH_WANT_COMPAT_FALLOCATE
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE
 #endif
 #define __ARCH_WANT_SYS_FORK
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index ba363328da2b..d961634976d8 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -79,13 +79,6 @@ int compat_sys_truncate64(const char __user * path, u32 reg4,
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
-				     u32 len1, u32 len2)
-{
-	return ksys_fallocate(fd, mode, merge_64(offset1, offset2),
-			     merge_64(len1, len2));
-}
-
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 				 unsigned long len2)
 {
-- 
2.34.1

