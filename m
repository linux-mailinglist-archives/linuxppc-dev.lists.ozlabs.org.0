Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DADBB812788
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:02:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2biZhd7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMG048KLz3vlZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2biZhd7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM711Vj6z3cGS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE3j4SP012290;
	Thu, 14 Dec 2023 05:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ovh2+Yrkn7RejFOEC//qHuFziQE6QAg7xqk0h8rVmGI=;
 b=r2biZhd7TGcoAOibOg/73AqtBA+KKbfug6reSpANz3hXkY1iqH5o1gg6Z8GOXPIXVRQ6
 U20TaBxWJntRbZXJ6lPjPPxbnGgIrcae8NvCjc7wxK12J0h1hWzpBneHofSex4iX6Uqh
 3Zj05n6UIopnju1yvMKwU/dCPTHXCO57pWPM1hM2/fIO2J4akDzcIROvDGF29AG8aQ4N
 uyFcqBzfXrbYefCkz7kaUMPcrzMLTMa5gNpU8m4lWk3ck+aN2VGdE558dbtiKPIzR+wD
 0yMC7ZFXVV+1MDlc+h64snO4u+ek7f4eOhV/+a9Q3zqYNS0MAEGp3SJuKT7xT7/SBOUK ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uypr2xbm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:31 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5Q8Xa019113;
	Thu, 14 Dec 2023 05:56:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uypr2xbjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE3ZZKd012593;
	Thu, 14 Dec 2023 05:56:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw3jp6eg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uOHO22151740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9AF920043;
	Thu, 14 Dec 2023 05:56:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAA982004B;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A6B3F6070D;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 12/13] powerpc/string: Add KMSAN support
Date: Thu, 14 Dec 2023 05:55:38 +0000
Message-Id: <20231214055539.9420-13-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214055539.9420-1-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3BssezVAxDdviUPaDOyqZR4dSdHksbIi
X-Proofpoint-GUID: 8uj1JSwoXAIg2-3RyoUW_4goY-hONVyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140035
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

KMSAN expects functions __mem{set,cpy,move} so add aliases pointing to
the respective functions.

Disable use of architecture specific memset{16,32,64} to ensure that
metadata is correctly updated and strn{cpy,cmp} and mem{chr,cmp} which
are implemented in assembly and therefore cannot be instrumented to
propagate/check metadata.

Alias calls to mem{set,cpy,move} to __msan_mem{set,cpy,move} in
instrumented code to correctly propagate metadata.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/include/asm/kmsan.h               |  7 +++++++
 arch/powerpc/include/asm/string.h              | 18 ++++++++++++++++--
 arch/powerpc/lib/Makefile                      |  2 ++
 arch/powerpc/lib/mem_64.S                      |  5 ++++-
 arch/powerpc/lib/memcpy_64.S                   |  2 ++
 .../selftests/powerpc/copyloops/asm/kmsan.h    |  0
 .../selftests/powerpc/copyloops/linux/export.h |  1 +
 7 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/copyloops/asm/kmsan.h

diff --git a/arch/powerpc/include/asm/kmsan.h b/arch/powerpc/include/asm/kmsan.h
index bc84f6ff2ee9..fc59dc24e170 100644
--- a/arch/powerpc/include/asm/kmsan.h
+++ b/arch/powerpc/include/asm/kmsan.h
@@ -7,6 +7,13 @@
 #ifndef _ASM_POWERPC_KMSAN_H
 #define _ASM_POWERPC_KMSAN_H
 
+#ifdef CONFIG_KMSAN
+#define EXPORT_SYMBOL_KMSAN(fn) SYM_FUNC_ALIAS(__##fn, fn) \
+				EXPORT_SYMBOL(__##fn)
+#else
+#define EXPORT_SYMBOL_KMSAN(fn)
+#endif
+
 #ifndef __ASSEMBLY__
 #ifndef MODULE
 
diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
index 60ba22770f51..412626ce619b 100644
--- a/arch/powerpc/include/asm/string.h
+++ b/arch/powerpc/include/asm/string.h
@@ -4,7 +4,7 @@
 
 #ifdef __KERNEL__
 
-#ifndef CONFIG_KASAN
+#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
 #define __HAVE_ARCH_STRNCPY
 #define __HAVE_ARCH_STRNCMP
 #define __HAVE_ARCH_MEMCHR
@@ -56,8 +56,22 @@ void *__memmove(void *to, const void *from, __kernel_size_t n);
 #endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
 #endif /* CONFIG_KASAN */
 
+#ifdef CONFIG_KMSAN
+
+void *__memset(void *s, int c, __kernel_size_t count);
+void *__memcpy(void *to, const void *from, __kernel_size_t n);
+void *__memmove(void *to, const void *from, __kernel_size_t n);
+
+#ifdef __SANITIZE_MEMORY__
+#include <linux/kmsan_string.h>
+#define memset __msan_memset
+#define memcpy __msan_memcpy
+#define memmove __msan_memmove
+#endif
+#endif /* CONFIG_KMSAN */
+
 #ifdef CONFIG_PPC64
-#ifndef CONFIG_KASAN
+#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
 #define __HAVE_ARCH_MEMSET32
 #define __HAVE_ARCH_MEMSET64
 
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 51ad0397c17a..fc3ea3eebbd6 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -32,9 +32,11 @@ obj-y += code-patching.o feature-fixups.o pmem.o
 obj-$(CONFIG_CODE_PATCHING_SELFTEST) += test-code-patching.o
 
 ifndef CONFIG_KASAN
+ifndef CONFIG_KMSAN
 obj-y	+=	string.o memcmp_$(BITS).o
 obj-$(CONFIG_PPC32)	+= strlen_32.o
 endif
+endif
 
 obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o
 
diff --git a/arch/powerpc/lib/mem_64.S b/arch/powerpc/lib/mem_64.S
index 6fd06cd20faa..a55f2fac49b3 100644
--- a/arch/powerpc/lib/mem_64.S
+++ b/arch/powerpc/lib/mem_64.S
@@ -9,8 +9,9 @@
 #include <asm/errno.h>
 #include <asm/ppc_asm.h>
 #include <asm/kasan.h>
+#include <asm/kmsan.h>
 
-#ifndef CONFIG_KASAN
+#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
 _GLOBAL(__memset16)
 	rlwimi	r4,r4,16,0,15
 	/* fall through */
@@ -96,6 +97,7 @@ _GLOBAL_KASAN(memset)
 	blr
 EXPORT_SYMBOL(memset)
 EXPORT_SYMBOL_KASAN(memset)
+EXPORT_SYMBOL_KMSAN(memset)
 
 _GLOBAL_TOC_KASAN(memmove)
 	cmplw	0,r3,r4
@@ -140,3 +142,4 @@ _GLOBAL(backwards_memcpy)
 	b	1b
 EXPORT_SYMBOL(memmove)
 EXPORT_SYMBOL_KASAN(memmove)
+EXPORT_SYMBOL_KMSAN(memmove)
diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
index b5a67e20143f..1657861618cc 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -8,6 +8,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 #include <asm/kasan.h>
+#include <asm/kmsan.h>
 
 #ifndef SELFTEST_CASE
 /* For big-endian, 0 == most CPUs, 1 == POWER6, 2 == Cell */
@@ -228,3 +229,4 @@ END_FTR_SECTION_IFCLR(CPU_FTR_UNALIGNED_LD_STD)
 #endif
 EXPORT_SYMBOL(memcpy)
 EXPORT_SYMBOL_KASAN(memcpy)
+EXPORT_SYMBOL_KMSAN(memcpy)
diff --git a/tools/testing/selftests/powerpc/copyloops/asm/kmsan.h b/tools/testing/selftests/powerpc/copyloops/asm/kmsan.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/copyloops/linux/export.h b/tools/testing/selftests/powerpc/copyloops/linux/export.h
index e6b80d5fbd14..6379624bbf9b 100644
--- a/tools/testing/selftests/powerpc/copyloops/linux/export.h
+++ b/tools/testing/selftests/powerpc/copyloops/linux/export.h
@@ -2,3 +2,4 @@
 #define EXPORT_SYMBOL(x)
 #define EXPORT_SYMBOL_GPL(x)
 #define EXPORT_SYMBOL_KASAN(x)
+#define EXPORT_SYMBOL_KMSAN(x)
-- 
2.40.1

