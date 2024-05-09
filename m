Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DD8C0F66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:13:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K3bUjOyM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrX21dMxz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K3bUjOyM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrWH09Kjz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 22:12:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715256774;
	bh=Ud9FCwPLiJHL1f5TAhWHimAbT7QmZrnpvxpHFEBi0Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K3bUjOyMJvV4S2ELBERwwrmDbNNMzzbvgHOe6yZ+09Ipa2NRdVeUvIcMP7vkkm0qh
	 DnwPRMW7bnasi7z9qe2Ul7UtP6hij/GlsUBlb1dqT/McrV2j90lzBG3Nc0V3GSPeIj
	 6ZnySVi+8mmYS7f6hiEkXyehoLcJvQRnuvt3afCAmD9k1hyyRaveGyBheglDDXCh1E
	 qoKP1zOW06uVuStJq3/tbT8UE/dW+KcjsSEOrFt9LHFduR77xPuPGzk+aD+cR/XTpo
	 WL5BQwtqVUqKLzfj0a9H5ZN7gQYoH5OKnGdOybh0wGpkCaQeVFwXR7ETd0AtZJlUJg
	 2JYbWag3rSVzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZrWB3zh9z4wqM;
	Thu,  9 May 2024 22:12:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/xmon: Fix disassembly CPU feature checks
Date: Thu,  9 May 2024 22:12:47 +1000
Message-ID: <20240509121248.270878-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509121248.270878-1-mpe@ellerman.id.au>
References: <20240509121248.270878-1-mpe@ellerman.id.au>
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

In the xmon disassembly code there are several CPU feature checks to
determine what dialects should be passed to the disassembler. The
dialect controls which instructions the disassembler will recognise.

Unfortunately the checks are incorrect, because instead of passing a
single CPU feature they are passing a mask of feature bits.

For example the code:

  if (cpu_has_feature(CPU_FTRS_POWER5))
      dialect |= PPC_OPCODE_POWER5;

Is trying to check if the system is running on a Power5 CPU. But
CPU_FTRS_POWER5 is a mask of *all* the feature bits that are enabled on
a Power5.

In practice the test will always return true for any 64-bit CPU, because
at least one bit in the mask will be present in the CPU_FTRS_ALWAYS
mask.

Similarly for all the other checks against CPU_FTRS_xx masks.

Rather than trying to match the disassembly behaviour exactly to the
current CPU, just differentiate between 32-bit and 64-bit, and Altivec,
VSX and HTM.

That will cause some instructions to be shown in disassembly even
on a CPU that doesn't support them, but that's OK, objdump -d output
has the same behaviour, and if anything it's less confusing than some
instructions not being disassembled.

Fixes: 897f112bb42e ("[POWERPC] Import updated version of ppc disassembly code for xmon")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/xmon/ppc-dis.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-dis.c b/arch/powerpc/xmon/ppc-dis.c
index 75fa98221d48..af105e1bc3fc 100644
--- a/arch/powerpc/xmon/ppc-dis.c
+++ b/arch/powerpc/xmon/ppc-dis.c
@@ -122,32 +122,21 @@ int print_insn_powerpc (unsigned long insn, unsigned long memaddr)
   bool insn_is_short;
   ppc_cpu_t dialect;
 
-  dialect = PPC_OPCODE_PPC | PPC_OPCODE_COMMON
-            | PPC_OPCODE_64 | PPC_OPCODE_POWER4 | PPC_OPCODE_ALTIVEC;
+  dialect = PPC_OPCODE_PPC | PPC_OPCODE_COMMON;
 
-  if (cpu_has_feature(CPU_FTRS_POWER5))
-    dialect |= PPC_OPCODE_POWER5;
+  if (IS_ENABLED(CONFIG_PPC64))
+    dialect |= PPC_OPCODE_64 | PPC_OPCODE_POWER4 | PPC_OPCODE_CELL |
+	PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7 | PPC_OPCODE_POWER8 |
+	PPC_OPCODE_POWER9;
 
-  if (cpu_has_feature(CPU_FTRS_CELL))
-    dialect |= (PPC_OPCODE_CELL | PPC_OPCODE_ALTIVEC);
+  if (cpu_has_feature(CPU_FTR_TM))
+    dialect |= PPC_OPCODE_HTM;
 
-  if (cpu_has_feature(CPU_FTRS_POWER6))
-    dialect |= (PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6 | PPC_OPCODE_ALTIVEC);
+  if (cpu_has_feature(CPU_FTR_ALTIVEC))
+    dialect |= PPC_OPCODE_ALTIVEC | PPC_OPCODE_ALTIVEC2;
 
-  if (cpu_has_feature(CPU_FTRS_POWER7))
-    dialect |= (PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7
-                | PPC_OPCODE_ALTIVEC | PPC_OPCODE_VSX);
-
-  if (cpu_has_feature(CPU_FTRS_POWER8))
-    dialect |= (PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7
-		| PPC_OPCODE_POWER8 | PPC_OPCODE_HTM
-		| PPC_OPCODE_ALTIVEC | PPC_OPCODE_ALTIVEC2 | PPC_OPCODE_VSX);
-
-  if (cpu_has_feature(CPU_FTRS_POWER9))
-    dialect |= (PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7
-		| PPC_OPCODE_POWER8 | PPC_OPCODE_POWER9 | PPC_OPCODE_HTM
-		| PPC_OPCODE_ALTIVEC | PPC_OPCODE_ALTIVEC2
-		| PPC_OPCODE_VSX | PPC_OPCODE_VSX3);
+  if (cpu_has_feature(CPU_FTR_VSX))
+    dialect |= PPC_OPCODE_VSX | PPC_OPCODE_VSX3;
 
   /* Get the major opcode of the insn.  */
   opcode = NULL;
-- 
2.45.0

