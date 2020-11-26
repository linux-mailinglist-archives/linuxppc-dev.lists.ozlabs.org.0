Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB12C5672
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:50:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChfKL627BzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdR41k5yzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ap3XKyon; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdR31393z9sWk; Fri, 27 Nov 2020 00:10:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdR221tVz9sVV; Fri, 27 Nov 2020 00:10:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396222;
 bh=3u2Pnz7CANWqJ7Aa8IZL1GQZXk66Fp60fyqc+wCNy14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ap3XKyons6OCm+wXBLlt+ZQonoel3S2O0/+kc7SbjvouVPtlh7CkW50ZvtsTH1DQj
 w9nQPl65ZEp6YXgBMVk5rDqeSN7uFR8R087GpV/eqWs7PIuZ81QYEC0srhiPN2pK3j
 eN5m6XKTtLHPL8aKaqQP+GIeCjmMkvzEOb953T8kuge2owg9MD9k0vuEMRty5bOh8K
 pDmdgSdJnAGC4yVHm2BsFUmrrgUiX/4oP2JX+iBRIJhmWQzmrzA7kwiwE5Oem9eoHt
 Pw2m6+SAlPx934VVKL/1H0zsDrzJIRGlOI/9mY19NeMILUbk4MY4MvBVOuvn0ASXNW
 4dLMrofRXFRJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 5/9] powerpc/barrier: Use CONFIG_PPC64 for barrier
 selection
Date: Fri, 27 Nov 2020 00:10:02 +1100
Message-Id: <20201126131006.2431205-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126131006.2431205-1-mpe@ellerman.id.au>
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we use ifdef __powerpc64__ in barrier.h to decide if we
should use lwsync or eieio for SMPWMB which is then used by
__smp_wmb().

That means when we are building the compat VDSO we will use eieio,
because it's 32-bit code, even though we're building a 64-bit kernel
for a 64-bit CPU.

Although eieio should work, it would be cleaner if we always used the
same barrier, even for the 32-bit VDSO.

So change the ifdef to CONFIG_PPC64, so that the selection is made
based on the bitness of the kernel we're building for, not the current
compilation unit.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/barrier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v14: new

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index f53c42380832..aecfde829d5d 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -40,7 +40,7 @@
 #define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
 
 /* The sub-arch has lwsync */
-#if defined(__powerpc64__) || defined(CONFIG_PPC_E500MC)
+#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
 #    define SMPWMB      LWSYNC
 #else
 #    define SMPWMB      eieio
-- 
2.25.1

