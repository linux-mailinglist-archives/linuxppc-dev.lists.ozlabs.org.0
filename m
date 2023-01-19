Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44042673137
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 06:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyB9P0Yr3z3fDK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:32:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aGu1kj3N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aGu1kj3N;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyB8R3kp4z30CT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 16:32:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J30woH014235
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=4Yshp2KAXyhcb1OV9rTr+n+3vLfFkFfWdhZ3CLdLfjU=;
 b=aGu1kj3NWHdFDPor5oEXLxTAg8TtrZmxkjRUJ5gLFvwDsPT6TSq1KCQGsfMRZLejTpIj
 JM+uxYQ+OUCqfndytQAG7ybnOBfuHhV1YIvdrxSyK9j8aW9biE/RlkR/ZV69f0udZOxr
 NASuDd9QEESd0Z0zIio2ZP5/PPPGkcIMLNA58/T9HCCN0eD+kgASV+BUycuD/F1p6/MM
 HfOEW8WMpZ3GoKkqLig3sVq7nh4OZK2Ezeqq6kRkLYjC1MeRq3UJhasJ4CnrPdb/VB2M
 bBmlDZ1+iA5AJq1OCc5Lr3hO5uY3FKIteog1ZRke6ERzzff/GJtJDQvi7HcXjaXDFmcn mw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6fp773qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30IE0De1023694
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16p6b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30J5W02Q46072260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 056D120040
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:32:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E3EB20043
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:31:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:31:59 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C8418600E0;
	Thu, 19 Jan 2023 16:31:57 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: Implement arch_within_stack_frames
Date: Thu, 19 Jan 2023 05:31:27 +0000
Message-Id: <20230119053127.17782-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AiTGPjDhW_-pZkF79yH0rX0owccrNyVP
X-Proofpoint-ORIG-GUID: AiTGPjDhW_-pZkF79yH0rX0owccrNyVP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=884
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190042
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
v2: Rename PARAMETER_SAVE_OFFSET to STACK_FRAME_PARAMS
    Add definitions of STACK_FRAME_PARAMS for PPC32 and remove dependancy on PPC64
    Ignore the current stack frame and start with it's parent, similar to x86

v1: https://lore.kernel.org/linuxppc-dev/20221214044252.1910657-1-nicholas@linux.ibm.com/
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/thread_info.h | 36 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..97ca54773521 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -198,6 +198,7 @@ config PPC
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
+	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index af58f1ed3952..c5dce5f239c1 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -186,6 +186,42 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define is_elf2_task() (0)
 #endif
 
+#if defined(CONFIG_PPC64_ELF_ABI_V1)
+#define STACK_FRAME_PARAMS 48
+#elif defined(CONFIG_PPC64_ELF_ABI_V2)
+#define STACK_FRAME_PARAMS 32
+#elif defined(CONFIG_PPC32)
+#define STACK_FRAME_PARAMS 8
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
+	const void *params;
+	const void *frame;
+
+	params = *(const void * const *)current_stack_pointer + STACK_FRAME_PARAMS;
+	frame = **(const void * const * const *)current_stack_pointer;
+
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

