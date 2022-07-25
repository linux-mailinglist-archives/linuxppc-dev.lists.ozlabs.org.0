Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73357F963
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqq94w0Sz3chp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:28:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVQrZzPB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVQrZzPB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqp40Twkz3d9h
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:27:07 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6L8u2001820;
	Mon, 25 Jul 2022 06:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=s80XWhgX/cKZP5k3H1YrkJVbWV6EHq2u/S1FduupPUU=;
 b=TVQrZzPBPYMW3rtIFdmbpLl8UFYxZQTWAlACKlVSMWD3mlhAoDSFUFPfI8hZgHdXdoG/
 yx3KH1i41VKbfvdvFivPNcaQfpmw8KqprvZsVNPRpY4lKgd7jA9QwciSzWQl6Sko9aCm
 kVvdybRWBlk6UPf+u8IvuzLyKoshlDe3fbofGeoXbkZmhMmB/jLSHT03KwD0EikTUgqk
 ciAJHoYsP3j0kAm89lhVMUquRxWpxqbjJhMh7j8Bjpl48KNZkJuPnT/UQYIjC4xbQyk5
 rIIkVOcf6Lu+ztBnhqjT9Qgrn/CcQDc8HN9sJNf/a4wNrRYn8hcQ/PvY6D6j4GreoVpj 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g4hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:27:01 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6M7Qc004347;
	Mon, 25 Jul 2022 06:27:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g4he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:27:00 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LU1R017336;
	Mon, 25 Jul 2022 06:26:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3hg9469xu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:26:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6QuXa14811544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:26:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A97211C050;
	Mon, 25 Jul 2022 06:26:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B83411C04A;
	Mon, 25 Jul 2022 06:26:54 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:26:54 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/14] powerpc: Use generic fallocate compatibility syscall
Date: Mon, 25 Jul 2022 16:26:51 +1000
Message-Id: <20220725062651.119176-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6HOFq3eW69Goopb3IszE4RtQv5kmzLbB
X-Proofpoint-GUID: suB2tsLp9rjZvs0KjZv9QMs236qLlrwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=670 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, arnd@arndb.de, npiggin@gmail.com
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
---
V1 -> V2: Remove arch-specific fallocate handler.
---
 arch/powerpc/include/asm/compat.h        | 5 +++++
 arch/powerpc/include/asm/unistd.h        | 1 +
 arch/powerpc/kernel/asm-offsets.c        | 1 +
 arch/powerpc/kernel/sys_ppc32.c          | 8 --------
 arch/powerpc/kernel/syscalls/syscall.tbl | 2 +-
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index dda4091fd012..f20caae3f019 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -16,6 +16,11 @@ typedef u16		compat_ipc_pid_t;
 #include <asm-generic/compat.h>
 
 #ifdef __BIG_ENDIAN__
+#define compat_arg_u64(name)		u32  name##_hi, u32  name##_lo
+#define compat_arg_u64_dual(name)	u32, name##_hi, u32, name##_lo
+#define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
+					 ((u64)name##_hi << 32))
+
 #define COMPAT_UTS_MACHINE	"ppc\0\0"
 #else
 #define COMPAT_UTS_MACHINE	"ppcle\0\0"
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
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8c10f536e478..c669f1d1ee77 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -9,6 +9,7 @@
  * #defines from the assembly-language output.
  */
 
+#include <asm/compat.h>
 #include <linux/compat.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 89e8c478fd6a..bd00b7dab7cd 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -89,14 +89,6 @@ COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-COMPAT_SYSCALL_DEFINE6(ppc_fallocate,
-		       int, fd, int, mode, u32, offset1, u32, offset2,
-		       u32, len1, u32, len2)
-{
-	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
-			     merge_64(len1, len2));
-}
-
 COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
 		       unsigned int, fd, u32, reg4, unsigned long, len1,
 		       unsigned long, len2)
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index c6cfcdf52c57..b4c970c9c6b1 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -391,7 +391,7 @@
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
 308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_file_range2
-309	nospu	fallocate			sys_fallocate			compat_sys_ppc_fallocate
+309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
 311	64	timerfd_settime			sys_timerfd_settime
-- 
2.34.1

