Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA05BF6E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTrj5lGMz304j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FfbXj5Gu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FfbXj5Gu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTlT3zBhz3chg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6Rx8g013685;
	Wed, 21 Sep 2022 06:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=6VFSZteSY8PuR96x4DPxmnKehB2z6az5XwJqehHJcTM=;
 b=FfbXj5Gu3lvbpYPpuyfosKydg4SueeyYysZE5zpQdSqOsVEyRPU9dHi8cedTytdJwH4X
 0tzcS6qVAzA696wiYcY9ygiK0GdinGiMZPw/F1XF+bNbQRamo8JbSX5/NX5SZfO+/5+s
 QxgW0KESMlNGitv/EqGHUzrUKIzPUkYLNGpQzfuOkjTV2J1EwZXuN/UOnKKnLRW/dfM0
 SrCAmCI9u1Jzdq8zX6PS0Ikhfv8/rUe9arSoyq/468NDkIeVHs5Jc8d1wBH0Pl+LLrjI
 xlfEWjXkFn3WBqjHKGV+T3jsUmT6c4P5GollSXaeCuQOgqXIb5dmB1WrlAyWxXd7XGqE BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwcb8tft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:22 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6TXXh018266;
	Wed, 21 Sep 2022 06:58:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwcb8tf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6qtBt015933;
	Wed, 21 Sep 2022 06:58:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma01fra.de.ibm.com with ESMTP id 3jn5v8kk77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wiCx40042972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1512452050;
	Wed, 21 Sep 2022 06:58:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 699295204E;
	Wed, 21 Sep 2022 06:58:17 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A35CB60060;
	Wed, 21 Sep 2022 16:58:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 08/25] powerpc: Fix fallocate and fadvise64_64 compat parameter combination
Date: Wed, 21 Sep 2022 16:55:48 +1000
Message-Id: <20220921065605.1051927-9-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n6en2-6C3qLRL_VrAFugaMF6CzEoeN4T
X-Proofpoint-ORIG-GUID: Va2msf1MdKD-hiLEfqtPGqFgnASy3eua
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported[1] by Arnd, the arch-specific fadvise64_64 and fallocate
compatibility handlers assume parameters are passed with 32-bit
big-endian ABI. This affects the assignment of odd-even parameter pairs
to the high or low words of a 64-bit syscall parameter.

Fix fadvise64_64 fallocate compat handlers to correctly swap upper/lower
32 bits conditioned on endianness.

A future patch will replace the arch-specific compat fallocate with an
asm-generic implementation. This patch is intended for ease of
back-port.

[1]: https://lore.kernel.org/all/be29926f-226e-48dc-871a-e29a54e80583@www.fastmail.com/

Fixes: 57f48b4b74e7 ("powerpc/compat_sys: swap hi/lo parts of 64-bit syscall args in LE mode")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V5: New patch.
---
 arch/powerpc/include/asm/syscalls.h | 12 ++++++++++++
 arch/powerpc/kernel/sys_ppc32.c     | 14 +-------------
 arch/powerpc/kernel/syscalls.c      |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 21c2faaa2957..16b668515d15 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,6 +8,18 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+/*
+ * long long munging:
+ * The 32 bit ABI passes long longs in an odd even register pair.
+ * High and low parts are swapped depending on endian mode,
+ * so define a macro (similar to mips linux32) to handle that.
+ */
+#ifdef __LITTLE_ENDIAN__
+#define merge_64(low, high) ((u64)high << 32) | low
+#else
+#define merge_64(high, low) ((u64)high << 32) | low
+#endif
+
 struct rtas_args;
 
 long sys_mmap(unsigned long addr, size_t len,
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index f4edcc9489fb..ba363328da2b 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -56,18 +56,6 @@ unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
 	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
 }
 
-/* 
- * long long munging:
- * The 32 bit ABI passes long longs in an odd even register pair.
- * High and low parts are swapped depending on endian mode,
- * so define a macro (similar to mips linux32) to handle that.
- */
-#ifdef __LITTLE_ENDIAN__
-#define merge_64(low, high) ((u64)high << 32) | low
-#else
-#define merge_64(high, low) ((u64)high << 32) | low
-#endif
-
 compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
 			     u32 reg6, u32 pos1, u32 pos2)
 {
@@ -94,7 +82,7 @@ int compat_sys_truncate64(const char __user * path, u32 reg4,
 long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
 				     u32 len1, u32 len2)
 {
-	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
+	return ksys_fallocate(fd, mode, merge_64(offset1, offset2),
 			     merge_64(len1, len2));
 }
 
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index fc999140bc27..abc3fbb3c490 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -98,8 +98,8 @@ long ppc64_personality(unsigned long personality)
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low)
 {
-	return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
-				 (u64)len_high << 32 | len_low, advice);
+	return ksys_fadvise64_64(fd, merge_64(offset_high, offset_low),
+				 merge_64(len_high, len_low), advice);
 }
 
 SYSCALL_DEFINE0(switch_endian)
-- 
2.34.1

