Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECD33E4D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 02:02:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0X1t0gZzz3drv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 12:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RYnFItXr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RYnFItXr; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0WzL1QJJz3dFf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 12:00:14 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FD7064FC0;
 Wed, 17 Mar 2021 01:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942812;
 bh=7/1TGVBoidArVAXWitaNhXo84JeMqOJOZU5nTgwNf8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYnFItXrXZ6mjpxCuWI0gSkmNty+Vldmn4ss1sO3b5KrGKbrYlYmHL2W/g6VV7f7A
 136XcB1piGHwowu3EaMbKQfvw5wg+fKnXHZBYtfLaPX08Pm9eTVuC/dhJ55rIiNixm
 R8/oOrwCXvxjDv2PJiUB+AbPRYtrbTnXKEbBABs0ItP9iiRwEeVAz+X8Mp9m2AP4dF
 qeWRDy/UwSUb0q8bv6fiTPUAf1K0GpScceoke14bbRIoNRFXRFDlbhHRklsUryd/3i
 BDPJ4qcRnIv4kkdZ2MYw8suXU+Ce6/2ZPiLRCO+8YGLe8a1I+c7dAwDjKdsnZq9vYP
 EJdEHtIwT/mfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 02/14] powerpc/4xx: Fix build errors from mfdcr()
Date: Tue, 16 Mar 2021 20:59:56 -0400
Message-Id: <20210317010008.727496-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317010008.727496-1-sashal@kernel.org>
References: <20210317010008.727496-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Feng Tang <feng.tang@intel.com>,
 kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit eead089311f4d935ab5d1d8fbb0c42ad44699ada ]

lkp reported a build error in fsp2.o:

  CC      arch/powerpc/platforms/44x/fsp2.o
  {standard input}:577: Error: unsupported relocation against base

Which comes from:

  pr_err("GESR0: 0x%08x\n", mfdcr(base + PLB4OPB_GESR0));

Where our mfdcr() macro is stringifying "base + PLB4OPB_GESR0", and
passing that to the assembler, which obviously doesn't work.

The mfdcr() macro already checks that the argument is constant using
__builtin_constant_p(), and if not calls the out-of-line version of
mfdcr(). But in this case GCC is smart enough to notice that "base +
PLB4OPB_GESR0" will be constant, even though it's not something we can
immediately stringify into a register number.

Segher pointed out that passing the register number to the inline asm
as a constant would be better, and in fact it fixes the build error,
presumably because it gives GCC a chance to resolve the value.

While we're at it, change mtdcr() similarly.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Feng Tang <feng.tang@intel.com>
Link: https://lore.kernel.org/r/20210218123058.748882-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/dcr-native.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/dcr-native.h b/arch/powerpc/include/asm/dcr-native.h
index 4efc11dacb98..4494d5e1932f 100644
--- a/arch/powerpc/include/asm/dcr-native.h
+++ b/arch/powerpc/include/asm/dcr-native.h
@@ -64,8 +64,8 @@ static inline void mtdcrx(unsigned int reg, unsigned int val)
 #define mfdcr(rn)						\
 	({unsigned int rval;					\
 	if (__builtin_constant_p(rn) && rn < 1024)		\
-		asm volatile("mfdcr %0," __stringify(rn)	\
-		              : "=r" (rval));			\
+		asm volatile("mfdcr %0, %1" : "=r" (rval)	\
+			      : "n" (rn));			\
 	else if (likely(cpu_has_feature(CPU_FTR_INDEXED_DCR)))	\
 		rval = mfdcrx(rn);				\
 	else							\
@@ -75,8 +75,8 @@ static inline void mtdcrx(unsigned int reg, unsigned int val)
 #define mtdcr(rn, v)						\
 do {								\
 	if (__builtin_constant_p(rn) && rn < 1024)		\
-		asm volatile("mtdcr " __stringify(rn) ",%0"	\
-			      : : "r" (v)); 			\
+		asm volatile("mtdcr %0, %1"			\
+			      : : "n" (rn), "r" (v));		\
 	else if (likely(cpu_has_feature(CPU_FTR_INDEXED_DCR)))	\
 		mtdcrx(rn, v);					\
 	else							\
-- 
2.30.1

