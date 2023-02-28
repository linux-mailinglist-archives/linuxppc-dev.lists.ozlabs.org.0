Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598296A52B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 06:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQmYT1T7Vz3cJn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 16:45:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gOfQNnJ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gOfQNnJ8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQmXT4VW7z2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 16:44:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S2aR9b009182;
	Tue, 28 Feb 2023 05:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=DeCS/KN8GPXwm6sRPuda/iTP+WJBeLt1wY1xqKeZc+Y=;
 b=gOfQNnJ87eQ9IhpPcqKc1OI0VKO6XW/i5EGCHQMX066wOsAppTSZuoioeQq6duOZr+lb
 Rzx4t8YF2NZCi6DFoq/N16+MXlvCsPwb4wN+AAOR2suOXsYhRzEkr+F7Bgi4CjWS+ZRY
 DnH9XDWoEP1VyFIR1Scd+rC0P0iSYvtiQml7KMQWfOCNBX5p/B85UMNYGcLjbNpwFX60
 S4dzom1HuCNHZo7+XDn3JPo8gnTyTSi/pq8WbUBpvQ+J9UMPUY+/v0Hzi1PiJ3ghri6x
 HYJuJv/TjuJ4G9Ujw6DwYHkOcRBwcnIfndmehNsVCFnjwxsGOcm7Ja0cWTY/HgbWKuGk Zg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p15ytq7bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 05:44:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31R95Wwq013004;
	Tue, 28 Feb 2023 05:44:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nybcq2pa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Feb 2023 05:44:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31S5iXwJ43712882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Feb 2023 05:44:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E3FA20049;
	Tue, 28 Feb 2023 05:44:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3B8B20043;
	Tue, 28 Feb 2023 05:44:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Feb 2023 05:44:32 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D3F0C60312;
	Tue, 28 Feb 2023 16:44:30 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: Implement arch_within_stack_frames
Date: Tue, 28 Feb 2023 05:43:55 +0000
Message-Id: <20230228054355.300628-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xFYppK26q0NqJvdPvmOZfaAqJ3j6M05J
X-Proofpoint-ORIG-GUID: xFYppK26q0NqJvdPvmOZfaAqJ3j6M05J
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_02,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=901 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302280039
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Walks the stack when copy_{to,from}_user address is in the stack to
ensure that the object being copied is entirely a single stack frame and
does not contain stack metadata.

Substantially similar to the x86 implementation. The back chain is used
to traverse the stack and identify stack frame boundaries.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
v3: Move STACK_FRAME_PARAMS macros to ppc_asm.h
    Add diagram in comments to show position of pointers into the stack during execution

v2: Rename PARAMETER_SAVE_OFFSET to STACK_FRAME_PARAMS
    Add definitions of STACK_FRAME_PARAMS for PPC32 and remove dependancy on PPC64
    Ignore the current stack frame and start with it's parent, similar to x86

v1: https://lore.kernel.org/linuxppc-dev/20221214044252.1910657-1-nicholas@linux.ibm.com/
v2: https://lore.kernel.org/linuxppc-dev/20230119053127.17782-1-nicholas@linux.ibm.com/
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/ppc_asm.h     |  8 ++++++
 arch/powerpc/include/asm/thread_info.h | 38 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2c9cdf1d8761..3ce17f9aa90a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -200,6 +200,7 @@ config PPC
 	select HAVE_ARCH_KCSAN            	if PPC_BOOK3S_64
 	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
+	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index d2f44612f4b0..1f1a64b780e3 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -837,4 +837,12 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define BTB_FLUSH(reg)
 #endif /* CONFIG_PPC_E500 */
 
+#if defined(CONFIG_PPC64_ELF_ABI_V1)
+#define STACK_FRAME_PARAMS 48
+#elif defined(CONFIG_PPC64_ELF_ABI_V2)
+#define STACK_FRAME_PARAMS 32
+#elif defined(CONFIG_PPC32)
+#define STACK_FRAME_PARAMS 8
+#endif
+
 #endif /* _ASM_POWERPC_PPC_ASM_H */
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index af58f1ed3952..07f1901da8fd 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -45,6 +45,7 @@
 #include <linux/cache.h>
 #include <asm/processor.h>
 #include <asm/accounting.h>
+#include <asm/ppc_asm.h>
 
 #define SLB_PRELOAD_NR	16U
 /*
@@ -186,6 +187,43 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define is_elf2_task() (0)
 #endif
 
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
+	const void *params;
+	const void *frame;
+
+	params = *(const void * const *)current_stack_pointer + STACK_FRAME_PARAMS;
+	frame = **(const void * const * const *)current_stack_pointer;
+
+    /*
+     * low -----------------------------------------------------------> high
+     * [backchain][metadata][params][local vars][saved registers][backchain]
+     *                      ^------------------------------------^
+     *                      |  allows copies only in this region |
+     *                      |                                    |
+     *                    params                               frame
+     * The metadata region contains the saved LR, CR etc.
+     */
+	while (stack <= frame && frame < stackend) {
+		if (obj + len <= frame)
+			return obj >= params ? GOOD_FRAME : BAD_STACK;
+		params = frame + STACK_FRAME_PARAMS;
+		frame = *(const void * const *)frame;
+	}
+
+	return BAD_STACK;
+}
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
-- 
2.34.1

