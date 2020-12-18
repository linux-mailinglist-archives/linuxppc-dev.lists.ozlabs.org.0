Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602A2DE1F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 12:26:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cy65V6WM3zDqYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:26:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cy5t81XXYzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 22:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KNaTChVn; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cy5t44fHbz9sWX; Fri, 18 Dec 2020 22:17:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cy5t41Bqzz9sWd; Fri, 18 Dec 2020 22:16:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608290220;
 bh=LrxTOR9y2PTwVqNsYpSYzqRjocgGNwhM+AtWxTHDCFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KNaTChVnlCroaQ3LBFVeNC9LQ5vcigM6wYELPUt4n+nB9z10XYRKBAqzniDFcKBys
 Uh9OTijIMat5iOTKX2iluCh3bL2Y2r3g2TPXGC+hdxlag0NAmTu9gxRhTAaK3FJY7m
 CwiCOj5Px9o/OJqRQJRMYJtqC+AWx8zpuwvhxHtV5VZhRxhmJBLn2QxUqU7zeowF7O
 3NT12C2HauaWxiy+5GW6eopn2sQwJg1N8xMQzMFPVI9ID/kQx0AAXgkqXRsEWwGQa/
 fMVqr28zoW8122gwzriTPUPiMWf2yX7qbKcbrdeNtkkQmhZdriu7PT4LxRfnFTHejs
 o4BylW9k9QIDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/3] powerpc/vdso: Fix DOTSYM for 32-bit LE VDSO
Date: Fri, 18 Dec 2020 22:16:19 +1100
Message-Id: <20201218111619.1206391-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218111619.1206391-1-mpe@ellerman.id.au>
References: <20201218111619.1206391-1-mpe@ellerman.id.au>
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
Cc: skirmisher@protonmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Skirmisher reported on IRC that the 32-bit LE VDSO was hanging. This
turned out to be due to a branch to self in eg. __kernel_gettimeofday.
Looking at the disassembly with objdump -dR shows why:

  00000528 <__kernel_gettimeofday>:
   528:   f0 ff 21 94     stwu    r1,-16(r1)
   52c:   a6 02 08 7c     mflr    r0
   530:   f0 ff 21 94     stwu    r1,-16(r1)
   534:   14 00 01 90     stw     r0,20(r1)
   538:   05 00 9f 42     bcl     20,4*cr7+so,53c <__kernel_gettimeofday+0x14>
   53c:   a6 02 a8 7c     mflr    r5
   540:   ff ff a5 3c     addis   r5,r5,-1
   544:   c4 fa a5 38     addi    r5,r5,-1340
   548:   f0 00 a5 38     addi    r5,r5,240
   54c:   01 00 00 48     bl      54c <__kernel_gettimeofday+0x24>
                          54c: R_PPC_REL24        .__c_kernel_gettimeofday

Because we don't process relocations for the VDSO, this branch remains
a branch from 0x54c to 0x54c.

With the preceding patch to prohibit R_PPC_REL24 relocations, we
instead get a build failure:

  0000054c R_PPC_REL24       .__c_kernel_gettimeofday
  00000598 R_PPC_REL24       .__c_kernel_clock_gettime
  000005e4 R_PPC_REL24       .__c_kernel_clock_gettime64
  00000630 R_PPC_REL24       .__c_kernel_clock_getres
  0000067c R_PPC_REL24       .__c_kernel_time
  arch/powerpc/kernel/vdso32/vdso32.so.dbg: dynamic relocations are not supported

The root cause is that we're branching to `.__c_kernel_gettimeofday`.
But this is 32-bit LE code, which doesn't use function descriptors, so
there are no dot symbols.

The reason we're trying to branch to a dot symbol is because we're
using the DOTSYM macro, but the ifdefs we use to define the DOTSYM
macro do not currently work for 32-bit LE.

So like previous commits we need to differentiate if the current
compilation unit is 64-bit, rather than the kernel as a whole. ie.
switch from CONFIG_PPC64 to __powerpc64__.

With that fixed 32-bit LE code gets the empty version of DOTSYM, which
just resolves to the original symbol name, leading to a direct branch
and no relocations:

  000003f8 <__kernel_gettimeofday>:
   3f8:   f0 ff 21 94     stwu    r1,-16(r1)
   3fc:   a6 02 08 7c     mflr    r0
   400:   f0 ff 21 94     stwu    r1,-16(r1)
   404:   14 00 01 90     stw     r0,20(r1)
   408:   05 00 9f 42     bcl     20,4*cr7+so,40c <__kernel_gettimeofday+0x14>
   40c:   a6 02 a8 7c     mflr    r5
   410:   ff ff a5 3c     addis   r5,r5,-1
   414:   f4 fb a5 38     addi    r5,r5,-1036
   418:   f0 00 a5 38     addi    r5,r5,240
   41c:   85 06 00 48     bl      aa0 <__c_kernel_gettimeofday>

Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
Reported-by: "Will Springer <skirmisher@protonmail.com>"
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ppc_asm.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index cfa814824285..cc1bca571332 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -180,7 +180,12 @@ END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
 #define VCPU_GPR(n)	__VCPU_GPR(__REG_##n)
 
 #ifdef __KERNEL__
-#ifdef CONFIG_PPC64
+
+/*
+ * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
+ * version below in the else case of the ifdef.
+ */
+#ifdef __powerpc64__
 
 #define STACKFRAMESIZE 256
 #define __STK_REG(i)   (112 + ((i)-14)*8)
-- 
2.25.1

