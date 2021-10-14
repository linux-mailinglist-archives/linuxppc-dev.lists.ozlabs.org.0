Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE12F42D0AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 04:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVDK6245Wz3bXj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 13:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UPWUMDS1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVDJT06HHz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 13:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UPWUMDS1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVDJS4kJrz4xb9;
 Thu, 14 Oct 2021 13:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634179480;
 bh=PJyjoGNcjS93x8RYvVywazb6un3RK0YsMmizeepswDY=;
 h=From:To:Cc:Subject:Date:From;
 b=UPWUMDS1GCxIexe+jVNpYFsLBDqcNppe0vTFclInfZRuWbooJM4JYQrNULQVLd7iD
 8FX2FN1GD6AMU0jWrOA1cdTknPuLYHh3zjZtqPff/pYfJfA3mvcaCRdVP9fTRxUnOs
 AuNsO5/2Tu9YsX7WMJjo52nR1oLP//r31ThGW9PY4OPdrpHHF9Cg4hKcaDIzc1K2Qx
 LzU4khzgyRaKl+pltybdcZcD2STsCcwvRxejePjvuDWEDqt4SnYkbZwZp6cSZ3X+sA
 Ni82gfXxAZunlncc7fjW8RNam5sqaTthzlD7gsQtrfHmikM3vUDacyLKRvAkdTfHED
 M2QOgPBWPaxkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
Date: Thu, 14 Oct 2021 13:44:24 +1100
Message-Id: <20211014024424.528848-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ndesaulniers@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In dcr-low.S we use cmpli with three arguments, instead of four
arguments as defined in the ISA:

	cmpli	cr0,r3,1024

This appears to be a PPC440-ism, looking at the "PPC440x5 CPU Core
User’s Manual" it shows cmpli having no L field, but implied to be 0 due
to the core being 32-bit. It mentions that the ISA defines four
arguments and recommends using cmplwi.

dcr-low.S is only built 32-bit, because it is only built when
DCR_NATIVE=y, which is only selected by 40x and 44x. Looking at the
generated code (with gcc/gas) we see cmplwi as expected.

Although gas is happy with the 3-argument version when building for
32-bit, the LLVM assembler is not and errors out with:

  arch/powerpc/sysdev/dcr-low.S:27:10: error: invalid operand for instruction
   cmpli 0,%r3,1024; ...
           ^

Switching to the four argument version avoids any confusion when reading
the ISA, fixes the issue with the LLVM assembler, and also means the
code could be built 64-bit in future (though that's very unlikely).

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/sysdev/dcr-low.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/dcr-low.S b/arch/powerpc/sysdev/dcr-low.S
index efeeb1b885a1..329b9c4ae542 100644
--- a/arch/powerpc/sysdev/dcr-low.S
+++ b/arch/powerpc/sysdev/dcr-low.S
@@ -11,7 +11,7 @@
 #include <asm/export.h>
 
 #define DCR_ACCESS_PROLOG(table) \
-	cmpli	cr0,r3,1024;	 \
+	cmplwi	cr0,r3,1024;	 \
 	rlwinm  r3,r3,4,18,27;   \
 	lis     r5,table@h;      \
 	ori     r5,r5,table@l;   \
-- 
2.25.1

