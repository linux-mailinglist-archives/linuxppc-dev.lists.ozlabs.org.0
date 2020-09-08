Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C82611B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 15:01:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm4yr62TszDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 23:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm4wG5ymhzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 22:58:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O8CUyi94; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Bm4wG2CCQz9sSJ; Tue,  8 Sep 2020 22:58:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Bm4wG1FFxz9sTS; Tue,  8 Sep 2020 22:58:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599569934;
 bh=KE/Ra+TMjADqCw/JtrFXsMxvBsgybgLiIE//budiCjY=;
 h=From:To:Cc:Subject:Date:From;
 b=O8CUyi941MRk3CWrtnbPA7mmYix+Pcoc3m9z2CfwcRNSdOtZtbmm6WUStUoMMAb+Y
 Y2KOxhJPuFdg66Wl46EgE35UB/i3gZWurTF4+eCVDhPlqegMarUNkESeXUkPN1mVJA
 3wbrJ/CmVUJ6s/9jN68avuW6X8HDVij/YkX4dw7HfzewI4jrxCgje6PpYvutFTTEn6
 RPKVce84lAF0B690lyBBYQv3UqI8nqn2FrxoKtiqLIwmZfsCeVx9XWr7qwxB2QIXpF
 DPJ3Sh5eeF3ZsqPJOr2bF14iwCkzsvKmPwnLN5FWEK/OeHGKPqz4PLJ3Z1IYjsQwqo
 Alr8zd0eyd2Sw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
Date: Tue,  8 Sep 2020 22:58:50 +1000
Message-Id: <20200908125850.407939-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: christophe.leroy@c-s.fr, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we added the VDSO32 kconfig symbol, which controls building of
the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).

That was because back then COMPAT was always enabled for 64-bit, so
depending on it would have left the 32-bit VDSO always enabled, which
we didn't want.

But since then we have made COMPAT selectable, and off by default for
ppc64le, so VDSO32 should really depend on that.

For most people this makes no difference, none of the defconfigs
change, it's only if someone is building ppc64le with COMPAT=y, they
will now also get VDSO32. If they've enabled COMPAT in order to run
32-bit binaries they presumably also want the 32-bit VDSO.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 87737ec86d39..a80ad0ef436e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -490,13 +490,12 @@ endmenu
 
 config VDSO32
 	def_bool y
-	depends on PPC32 || CPU_BIG_ENDIAN
+	depends on PPC32 || COMPAT
 	help
 	  This symbol controls whether we build the 32-bit VDSO. We obviously
 	  want to do that if we're building a 32-bit kernel. If we're building
-	  a 64-bit kernel then we only want a 32-bit VDSO if we're building for
-	  big endian. That is because the only little endian configuration we
-	  support is ppc64le which is 64-bit only.
+	  a 64-bit kernel then we only want a 32-bit VDSO if we're also enabling
+	  COMPAT.
 
 choice
 	prompt "Endianness selection"
-- 
2.25.1

