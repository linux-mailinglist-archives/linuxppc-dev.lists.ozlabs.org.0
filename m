Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991E64C33B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 05:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX2pW1mhkz3bfV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 15:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ka2Kmaey;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ka2Kmaey;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX2nW48R9z3bYD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 15:43:59 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE482s4003549;
	Wed, 14 Dec 2022 04:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=y4AyobDPjfvzMmawvL1EyqPJQ77I6OMiTD3mTjgd0MM=;
 b=Ka2Kmaeyicd98n+G+iYH91wjesZP6QT/P3QpLCN7grFg9Pf3HfFKviVKwrB2ABlsjOW/
 EG3gwVSrN+ia9iyvvz4h5PjwIxLFZoqgT7/XelYFUt/q6pSNiNy0HmFty7bFhor6ykYp
 I0RcZjCqOBGfXecVsBCtIUBaxtGi040Fkkw6klu2BsrMHw4s4wEJpQvUjjJsLo1D41jz
 pfKheWFoxmFiz/Q/Hj2Dph40c4s4PxCElMhTVENwJdO61TE82uKWN9Nktt521x7D7/VM
 VxI2oKXz206eErgCf3fx2nETOEB29v5PxqDpeEHUgw6aN/ytSwLwLeV7L6kdv6G0Hh8a pg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mf76r0k7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 04:43:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDJQkPu024411;
	Wed, 14 Dec 2022 04:43:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3meyjbgfke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 04:43:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BE4hoAJ51773720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Dec 2022 04:43:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD45020043;
	Wed, 14 Dec 2022 04:43:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 314B720040;
	Wed, 14 Dec 2022 04:43:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Dec 2022 04:43:50 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 252856016D;
	Wed, 14 Dec 2022 15:43:45 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Implement arch_within_stack_frames
Date: Wed, 14 Dec 2022 04:42:52 +0000
Message-Id: <20221214044252.1910657-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sd_lV87qYgfwseTcmxVNDi1LlmKU5jxm
X-Proofpoint-GUID: Sd_lV87qYgfwseTcmxVNDi1LlmKU5jxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_01,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=985 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212140034
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Walks the stack when copy_{to,from}_user address is in the stack to
ensure that the object being copied is entirely within a single stack
frame.

Substatially similar to the x86 implementation except using the back
chain to traverse the stack and identify stack frame boundaries.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/thread_info.h | 38 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..4c59d139ea83 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -198,6 +198,7 @@ config PPC
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
+	select HAVE_ARCH_WITHIN_STACK_FRAMES	if PPC64
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index af58f1ed3952..efdf39e07884 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -186,6 +186,44 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define is_elf2_task() (0)
 #endif
 
+#ifdef CONFIG_PPC64
+
+#ifdef CONFIG_PPC64_ELF_ABI_V1
+#define PARAMETER_SAVE_OFFSET 48
+#else
+#define PARAMETER_SAVE_OFFSET 32
+#endif
+
+/*
+ * Walks up the stack frames to make sure that the specified object is
+ * entirely contained by a single stack frame.
+ *
+ * Returns:
+ *	GOOD_FRAME	if within a frame
+ *	BAD_STACK	if placed across a frame boundary (or outside stack)
+ */
+static inline int arch_within_stack_frames(const void * const stack,
+					   const void * const stackend,
+					   const void *obj, unsigned long len)
+{
+	const void *frame;
+	const void *oldframe;
+
+	oldframe = (const void *)current_stack_pointer;
+	frame = *(const void * const *)oldframe;
+
+	while (stack <= frame && frame < stackend) {
+		if (obj + len <= frame)
+			return obj >= oldframe + PARAMETER_SAVE_OFFSET ?
+				GOOD_FRAME : BAD_STACK;
+		oldframe = frame;
+		frame = *(const void * const *)oldframe;
+	}
+
+	return BAD_STACK;
+}
+#endif /* CONFIG_PPC64 */
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
-- 
2.34.1

