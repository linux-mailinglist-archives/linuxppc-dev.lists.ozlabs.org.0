Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B2619EB9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3ng7457dz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AL19bup/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AL19bup/;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nf74fNCz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4H3xxG020685;
	Fri, 4 Nov 2022 17:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZfU0m6nYz+Z/Jnww7fTM3pITLVqXcMsc0KlCEjQLNO0=;
 b=AL19bup/hfIXzYwRb7bLAS59oQk0eLY6/ROaROK8xfeeYWpENgLbh7cPx3Dvw3CuW14w
 RyH8etn4MN9KbyoVX54OyaMK0JPUeNLeWxlizuDozk5xws7UXape4RF1Vh9qtOq/aVtD
 L1x4gSHpiaE3B0eQAMCaOkjfFZm/UEST5h/hsfkWe8pGNOTr3566MuCU8TExXWgxG967
 meCrlCNeBmr9F/2Jo2huEPppS5GELocXIYaz/cgYDR2Jb0mtKZLKGwxTDBUh1HwpR3rM
 75H6BnGvV6zHWG7NgqttuGFdtBEUKEz6lc2dGE4lalqi63OhR2VXli0zwbTKYrz6UhLs sw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjrffda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HK9tm009432;
	Fri, 4 Nov 2022 17:28:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguej2qgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HSBV526411304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE06BA405B;
	Fri,  4 Nov 2022 17:28:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EECAA4054;
	Fri,  4 Nov 2022 17:28:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 17:28:11 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 25A386038F;
	Sat,  5 Nov 2022 04:28:07 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/6] powerpc/64s: Fix assembly to support larger values of THREAD_SIZE
Date: Sat,  5 Nov 2022 04:27:32 +1100
Message-Id: <20221104172737.391978-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yKToFhghnCwEjsoAdT0l-yYYeAaHoDGR
X-Proofpoint-ORIG-GUID: yKToFhghnCwEjsoAdT0l-yYYeAaHoDGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=916 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_VMAP_STACK is enabled, we set THREAD_SIZE to be at least the
size of a page.

There's a few bits of assembly in the book3s64 code that use THREAD_SIZE in
immediate mode instructions, which can only take an operand of up to 16
bits signed, which isn't quite large enough.

Fix these spots to use a scratch register or use two immediate mode
instructions instead, so we can later enable VMAP_STACK.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/asm-compat.h   | 2 ++
 arch/powerpc/kernel/entry_64.S          | 4 +++-
 arch/powerpc/kernel/irq.c               | 8 ++++++--
 arch/powerpc/kernel/misc_64.S           | 4 +++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 ++-
 5 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index 2bc53c646ccd..30dd7813bf3b 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -11,6 +11,7 @@
 #define PPC_LL		stringify_in_c(ld)
 #define PPC_STL		stringify_in_c(std)
 #define PPC_STLU	stringify_in_c(stdu)
+#define PPC_STLUX	stringify_in_c(stdux)
 #define PPC_LCMPI	stringify_in_c(cmpdi)
 #define PPC_LCMPLI	stringify_in_c(cmpldi)
 #define PPC_LCMP	stringify_in_c(cmpd)
@@ -45,6 +46,7 @@
 #define PPC_LL		stringify_in_c(lwz)
 #define PPC_STL		stringify_in_c(stw)
 #define PPC_STLU	stringify_in_c(stwu)
+#define PPC_STLUX	stringify_in_c(stwux)
 #define PPC_LCMPI	stringify_in_c(cmpwi)
 #define PPC_LCMPLI	stringify_in_c(cmplwi)
 #define PPC_LCMP	stringify_in_c(cmpw)
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 3e2e37e6ecab..af25db6e0205 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -238,7 +238,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
 	   because we don't need to leave the 288-byte ABI gap at the
 	   top of the kernel stack. */
-	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
+	li	r9,0
+	ori	r9,r9,THREAD_SIZE-SWITCH_FRAME_SIZE
+	add	r7,r7,r9
 
 	/*
 	 * PMU interrupts in radix may come in here. They will use r1, not
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 9ede61a5a469..098cf6adceec 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -204,7 +204,9 @@ static __always_inline void call_do_softirq(const void *sp)
 {
 	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
 	asm volatile (
-		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
+		"li		%%r0, 0			;"
+		"ori		%%r0, %%r0, %[offset]	;"
+		 PPC_STLUX "	%%r1, %[sp], %%r0	;"
 		"mr		%%r1, %[sp]		;"
 		"bl		%[callee]		;"
 		 PPC_LL "	%%r1, 0(%%r1)		;"
@@ -256,7 +258,9 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 
 	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
 	asm volatile (
-		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
+		"li		%%r0, 0			;"
+		"ori		%%r0, %%r0, %[offset]	;"
+		 PPC_STLUX "	%%r1, %[sp], %%r0	;"
 		"mr		%%r4, %%r1		;"
 		"mr		%%r1, %[sp]		;"
 		"bl		%[callee]		;"
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 36184cada00b..ff71b98500a3 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -384,7 +384,9 @@ _GLOBAL(kexec_sequence)
 	std	r0,16(r1)
 
 	/* switch stacks to newstack -- &kexec_stack.stack */
-	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
+	li	r0,0
+	ori	r0,r0,THREAD_SIZE-STACK_FRAME_OVERHEAD
+	stdux	r1,r3,r0
 	mr	r1,r3
 
 	li	r0,0
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 37f50861dd98..d05e3d324f4d 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2686,7 +2686,8 @@ kvmppc_bad_host_intr:
 	mr	r9, r1
 	std	r1, PACAR1(r13)
 	ld	r1, PACAEMERGSP(r13)
-	subi	r1, r1, THREAD_SIZE/2 + INT_FRAME_SIZE
+	subi	r1, r1, THREAD_SIZE/2
+	subi	r1, r1, INT_FRAME_SIZE
 	std	r9, 0(r1)
 	std	r0, GPR0(r1)
 	std	r9, GPR1(r1)
-- 
2.38.1

