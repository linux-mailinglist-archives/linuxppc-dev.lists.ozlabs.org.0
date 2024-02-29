Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E186C935
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:28:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RjitJVH8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlr941BQpz3vhg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RjitJVH8;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlr621mWZz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709209528;
	bh=V04tGcDAl14PAb5ZrYiZcf6vNrsGeQtOqUIJkPeweSI=;
	h=From:To:Cc:Subject:Date:From;
	b=RjitJVH8TvU6lxpEJSVb+Zkl4DCgcabfQRZ/RdaccO/j0fTPgM58ygPyxIkoHzxV6
	 kp4eg6NO2JXr9KcakD402SlXa5Knnfv2gz24OIsfsanB91lLOB73WR6azSj9CnnsQ/
	 RFXBqOHTruKc2x9CzrK0C0AJf4je8l21kv2LDQl6MofAsj7CKG/b2qEGdx+FjutPRO
	 V50NFyF4Ynz6bGelC4zOo3OB1QS/iimq1+SJDU7E1jq7ynoDYZEmjZLcDeoA+g63HZ
	 BTp64C6nh4y6lwBnnfZypB64TD8CR+Il76jVrQaiAmdIAcybAoTdFbzkW/E4JYWQBB
	 EP4mFabrOPXyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlr6043bTz4wbh;
	Thu, 29 Feb 2024 23:25:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/5] powerpc/64s: Move dcbt/dcbtst sequence into a macro
Date: Thu, 29 Feb 2024 23:25:17 +1100
Message-ID: <20240229122521.762431-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's an almost identical code sequence to specify load/store access
hints in __copy_tofrom_user_power7(), copypage_power7() and
memcpy_power7().

Move the sequence into a common macro, which is passed the registers to
use as they differ slightly.

There also needs to be a copy in the selftests, it could be shared in
future if the headers are cleaned up / refactored.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ppc_asm.h                   | 12 ++++++++++++
 arch/powerpc/lib/copypage_power7.S                   | 12 +-----------
 arch/powerpc/lib/copyuser_power7.S                   | 12 +-----------
 arch/powerpc/lib/memcpy_power7.S                     | 10 +---------
 .../selftests/powerpc/copyloops/asm/ppc_asm.h        | 12 ++++++++++++
 5 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 041ee2595520..78c7548eac1e 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -510,6 +510,18 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
        lis     scratch,0x60000000@h;			\
        dcbt    0,scratch,0b01010
 
+#define DCBT_SETUP_STREAMS(from, from_parms, to, to_parms, scratch)	\
+	lis	scratch,0x8000;	/* GO=1 */				\
+	clrldi	scratch,scratch,32;					\
+	/* setup read stream 0 */					\
+	dcbt	0,from,0b01000;		/* addr from */			\
+	dcbt	0,from_parms,0b01010;	/* length and depth from */	\
+	/* setup write stream 1 */					\
+	dcbtst	0,to,0b01000;		/* addr to */			\
+	dcbtst	0,to_parms,0b01010;	/* length and depth to */	\
+	eieio;								\
+	dcbt	0,scratch,0b01010;	/* all streams GO */
+
 /*
  * toreal/fromreal/tophys/tovirt macros. 32-bit BookE makes them
  * keep the address intact to be compatible with code shared with
diff --git a/arch/powerpc/lib/copypage_power7.S b/arch/powerpc/lib/copypage_power7.S
index a783973f1215..07e7cec4d135 100644
--- a/arch/powerpc/lib/copypage_power7.S
+++ b/arch/powerpc/lib/copypage_power7.S
@@ -27,17 +27,7 @@ _GLOBAL(copypage_power7)
 #endif
 	ori	r10,r7,1	/* stream=1 */
 
-	lis	r8,0x8000	/* GO=1 */
-	clrldi	r8,r8,32
-
-	/* setup read stream 0  */
-	dcbt	0,r4,0b01000  	/* addr from */
-	dcbt	0,r7,0b01010   /* length and depth from */
-	/* setup write stream 1 */
-	dcbtst	0,r9,0b01000   /* addr to */
-	dcbtst	0,r10,0b01010  /* length and depth to */
-	eieio
-	dcbt	0,r8,0b01010	/* all streams GO */
+	DCBT_SETUP_STREAMS(r4, r7, r9, r10, r8)
 
 #ifdef CONFIG_ALTIVEC
 	mflr	r0
diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
index ac41053c3a5a..8474c682a178 100644
--- a/arch/powerpc/lib/copyuser_power7.S
+++ b/arch/powerpc/lib/copyuser_power7.S
@@ -298,17 +298,7 @@ err1;	stb	r0,0(r3)
 	or	r7,r7,r0
 	ori	r10,r7,1	/* stream=1 */
 
-	lis	r8,0x8000	/* GO=1 */
-	clrldi	r8,r8,32
-
-	/* setup read stream 0 */
-	dcbt	0,r6,0b01000   /* addr from */
-	dcbt	0,r7,0b01010   /* length and depth from */
-	/* setup write stream 1 */
-	dcbtst	0,r9,0b01000   /* addr to */
-	dcbtst	0,r10,0b01010  /* length and depth to */
-	eieio
-	dcbt	0,r8,0b01010	/* all streams GO */
+	DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
 
 	beq	cr1,.Lunwind_stack_nonvmx_copy
 
diff --git a/arch/powerpc/lib/memcpy_power7.S b/arch/powerpc/lib/memcpy_power7.S
index 9398b2b746c4..b7c5e7fca8b9 100644
--- a/arch/powerpc/lib/memcpy_power7.S
+++ b/arch/powerpc/lib/memcpy_power7.S
@@ -244,15 +244,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	or	r7,r7,r0
 	ori	r10,r7,1	/* stream=1 */
 
-	lis	r8,0x8000	/* GO=1 */
-	clrldi	r8,r8,32
-
-	dcbt	0,r6,0b01000
-	dcbt	0,r7,0b01010
-	dcbtst	0,r9,0b01000
-	dcbtst	0,r10,0b01010
-	eieio
-	dcbt	0,r8,0b01010	/* GO */
+	DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
 
 	beq	cr1,.Lunwind_stack_nonvmx_copy
 
diff --git a/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h b/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
index a89f1fbf86ec..1d293ab77185 100644
--- a/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
+++ b/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
@@ -47,4 +47,16 @@
 /* Default to taking the first of any alternative feature sections */
 test_feature = 1
 
+#define DCBT_SETUP_STREAMS(from, from_parms, to, to_parms, scratch)	\
+	lis	scratch,0x8000;	/* GO=1 */				\
+	clrldi	scratch,scratch,32;					\
+	/* setup read stream 0 */					\
+	dcbt	0,from,0b01000;		/* addr from */			\
+	dcbt	0,from_parms,0b01010;	/* length and depth from */	\
+	/* setup write stream 1 */					\
+	dcbtst	0,to,0b01000;		/* addr to */			\
+	dcbtst	0,to_parms,0b01010;	/* length and depth to */	\
+	eieio;								\
+	dcbt	0,scratch,0b01010;	/* all streams GO */
+
 #endif /* __SELFTESTS_POWERPC_PPC_ASM_H */
-- 
2.43.2

