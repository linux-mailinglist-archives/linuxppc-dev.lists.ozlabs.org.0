Return-Path: <linuxppc-dev+bounces-8622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF7ABA79C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 03:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zzn3T4LKMz2yfK;
	Sat, 17 May 2025 11:51:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747446661;
	cv=none; b=bFNUhv+hvZ/UQhN47KqZd2YidThInbmemctWPHqihkLtmwMRuZ0aUotkg9YNzZMpPg7tM5cjU6SGUFYLqg7k/v8Wef0mzcUpQvYk2weyhAsHDsf0EkQq5SF3jWjdhqCbZ5RtKCD+d9rAwtEBMAJ4nu89qN8Ymm1UYA8I9JUlvtNt09RiG7FDPfSHM3xINmOUyByHemZ0zCM0drcQBbhvr8KL0fE2i5mt/8n/lOfE1uqC353Qx99dka7hPtygoJ+keC6zA6QIPEyunnuyPjOmlyxeNnkLIhXToBrt9++Y9JelDxhm71Y6mrnV8AizViVGS/R9y1C/SFyZkSgUCubCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747446661; c=relaxed/relaxed;
	bh=UXb6LPirWZPeGfwUPWZJ+mkDqLNt13DgEKjkP7gfTRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce477+rITVvMq/YdKAqTenDS20pz+xR9LAC1d2BAzYwaqG40epDA+N01O6vBOVDktaPKkTKEUG5zzWWT2ZaKAJ+BdIEGq6D4Ogip6miYZLrmnq4azGV2htt1QI8j8aGQ1hTFCoQu7BdUBkHoCDX839FRRmrTwjwSOzgCvrg4s7WS/FTk1Tcs6Tqjzx2xN7VgT4dA7x+QCHKE3qyKXEiC02o9UOwY34VbGsaWFSwIstX77huoqx03YcDCLegiBcS5Q2CeAcoNH9PIvUn+FarC/d8DgOTJ0d1pQO+9mxU1iB2F1pM4j+PV/xkXI5OHbof4oQYbFZZatx1qtPQUR6umjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZIgGx0Lm; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZIgGx0Lm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zzn3S2Jlvz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 11:50:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UXb6LPirWZPeGfwUPWZJ+mkDqLNt13DgEKjkP7gfTRg=; b=ZIgGx0LmludT6ZEHkKfmw0k6Cj
	lF4lirTVzW1/mMBvBxIFSEPn41NBWfVLh7z684v/EAtddcfiBBwNP8VTyCJ0NFq1ixC9uqIZGaXHl
	BCszg06h0eEOhMfRYUz6RLMcl9OBZrfSpIMa4kgCO1MJ8fILcF/JavJhEJsAdSTXHKBuR7W/qoTxF
	258OwDuRSVw0Hou1pjj1BXW8KY/u1HplLmuJLUcXAmu0q4WWsxYAZpnHVQALgbtTLO4wj6jZ+LTM/
	vZvzmFoHKqqI7Lff64IIkaL2J5BMYMPpQ9puhhgyRsp0IUaNlYikcrvjjuAbayBhxRelDPFnV0jXp
	QQl4luiQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uG6hE-006jky-08;
	Sat, 17 May 2025 09:50:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 17 May 2025 09:50:40 +0800
Date: Sat, 17 May 2025 09:50:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Gabriel Paubert <paubert@iram.es>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [v2 PATCH] powerpc: Add gcc 128-bit shift helpers
Message-ID: <aCfrcNFYIWJruP4G@gondor.apana.org.au>
References: <202505152053.FrKekjCe-lkp@intel.com>
 <aCb7WW2gRrtEmgqD@gondor.apana.org.au>
 <aCccToR_71ETmPd-@lt-gp.iram.es>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCccToR_71ETmPd-@lt-gp.iram.es>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 16, 2025 at 01:06:54PM +0200, Gabriel Paubert wrote:
> 
> It won't work for big endian, nor for 32 bit obviously.

Good catch, I will restrict the Kconfig option to little-endian.
The accelerated crypto code which uses this is already restricted
to little-endian anyway.

The Kconfig option is also dependent on PPC64 so 32-bit shouldn't
be a problem.

> Besides that, in arch/power/kernel/misc_32.S, you'll find a branchless
> version of these functions. It's for 64 bit shifts on 32 bit big-endian
> but it can easily be adapted to 128 bit shifts on 64 bit processors
> (swapping r3 and r4 depending on endianness).

Nice.  I've replaced the shift code with one based on misc_32.S.

> Several functions of kernel/misc_32.S should arguably be moved to lib/.

I'll leave that to someone else :)

Thanks,

---8<---
When optimising for size, gcc generates out-of-line calls for 128-bit
integer shifts.  Add these functions to avoid build errors.

Also restrict ARCH_SUPPORTS_INT128 to little-endian since the only
user that prompted this poly1305 only supports that.

Fixes: c66d7ebbe2fa ("crypto: powerpc/poly1305 - Add SIMD fallback")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505152053.FrKekjCe-lkp@intel.com/__;!!D9dNQwwGXtA!TSuOAutxjuD3Hp-RC0Fw9dTNuagdCKeNLTN71tv_OmhUxyAPLfIfwwpZop5pKFXgS4Jfkt830_tEMkbo7rsvYg$ 
Suggested-by: Gabriel Paubert <paubert@iram.es>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 651e0c32957a..7a7d39fa8b01 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -173,7 +173,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
-	select ARCH_SUPPORTS_INT128		if PPC64 && CC_HAS_INT128
+	select ARCH_SUPPORTS_INT128		if PPC64 && CC_HAS_INT128 && CPU_LITTLE_ENDIAN
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 1cd74673cbf7..a41c071c1652 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -87,3 +87,5 @@ obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-powerpc.o
 crc-t10dif-powerpc-y := crc-t10dif-glue.o crct10dif-vpmsum_asm.o
 
 obj-$(CONFIG_PPC64) += $(obj64-y)
+
+obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
diff --git a/arch/powerpc/lib/tishift.S b/arch/powerpc/lib/tishift.S
new file mode 100644
index 000000000000..f63748b5e1c5
--- /dev/null
+++ b/arch/powerpc/lib/tishift.S
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
+ * Largely rewritten by Cort Dougan (cort@cs.nmt.edu)
+ * and Paul Mackerras.
+ * Copyright (c) 2025 Herbert Xu <herbert@gondor.apana.org.au>
+ */
+#include <asm/ppc_asm.h>
+#include <linux/export.h>
+
+_GLOBAL(__lshrti3)
+	subfic	r6,r5,64
+	srd	r3,r3,r5	# LSW = count > 63 ? 0 : LSW >> count
+	addi	r7,r5,-64	# could be xori, or addi with -64
+	sld	r6,r4,r6	# t1 = count > 63 ? 0 : MSW << (64-count)
+	srd	r7,r4,r7	# t2 = count < 64 ? 0 : MSW >> (count-64)
+	or	r3,r3,r6	# LSW |= t1
+	srd	r4,r4,r5	# MSW = MSW >> count
+	or	r3,r3,r7	# LSW |= t2
+	blr
+EXPORT_SYMBOL(__lshrti3)
+
+_GLOBAL(__ashrti3)
+	subfic	r6,r5,64
+	srd	r3,r3,r5	# LSW = count > 63 ? 0 : LSW >> count
+	addi	r7,r5,-64	# could be xori, or addi with -64
+	sld	r6,r4,r6	# t1 = count > 63 ? 0 : MSW << (64-count)
+	rlwinm	r8,r7,0,64	# t3 = (count < 64) ? 64 : 0
+	srad	r7,r4,r7	# t2 = MSW >> (count-64)
+	or	r3,r3,r6	# LSW |= t1
+	sld	r7,r7,r8	# t2 = (count < 64) ? 0 : t2
+	srad	r4,r4,r5	# MSW = MSW >> count
+	or	r3,r3,r7	# LSW |= t2
+	blr
+EXPORT_SYMBOL(__ashrti3)
+
+_GLOBAL(__ashlti3)
+	subfic	r6,r5,64
+	sld	r4,r4,r5	# MSW = count > 64 ? 0 : MSW << count
+	addi	r7,r5,-64	# could be xori, or addi with -64
+	srd	r6,r3,r6	# t1 = count > 63 ? 0 : LSW >> (64-count)
+	sld	r7,r3,r7	# t2 = count < 64 ? 0 : LSW << (count-64)
+	or	r4,r4,r6	# MSW |= t1
+	sld	r3,r3,r5	# LSW = LSW << count
+	or	r4,r4,r7	# MSW |= t2
+	blr
+EXPORT_SYMBOL(__ashlti3)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

