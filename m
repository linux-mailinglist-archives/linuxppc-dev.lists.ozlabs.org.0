Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6F2DE1EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 12:23:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cy61b07TzzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cy5t44gSfzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 22:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OYvISIZt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cy5t36F0Bz9sTc; Fri, 18 Dec 2020 22:16:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cy5t33Ybnz9sWc; Fri, 18 Dec 2020 22:16:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608290219;
 bh=8Kw/XOrjAqo+YwwdIsGSkKDPvMyfX6cFP4qoT79bImI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OYvISIZtBX9yyBrQZdurDcoBioKrc6g7aPdgKGtjWgQhNCcgz+eszyAoM1UVnWDwQ
 14kjOnlRgqnkM0rAf4rQj3DppcqcBxoI3vr87XE+H/q4Qe7K9iIcvppcf4bqmfeetW
 n9grBkSi0KoqW7hRyX57G1Rw6a0kTs4gcNCcf/q/ypEPR2IDtvAvZSTNEVA87dITwV
 0x2rUvLDtooVJc+X1mt6Eb+LNsW68IwDbDRdeC7mc3tzF5W1Gwx4Eqlac0sg1L8NM1
 SE7piMzXdNxAVWytVoEi4RFkDmrgMiiYU8Gmo0kq/msLrgIMRB8tO/JCR8/DFdtMeh
 RnT24ivNcs4jQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/3] powerpc/vdso: Don't pass 64-bit ABI cflags to 32-bit VDSO
Date: Fri, 18 Dec 2020 22:16:18 +1100
Message-Id: <20201218111619.1206391-2-mpe@ellerman.id.au>
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

When building the 32-bit VDSO, we are building 32-bit code as part of
a 64-bit kernel build. That requires us to tweak the cflags to trick
the compiler into building 32-bit code for us. The main way we do that
is by passing -m32, but there are other options that affect code
generation and ABI selection.

In particular when building vgettimeofday.c, we end up passing
-mcall-aixdesc because it's in KBUILD_CFLAGS, which causes the
compiler to generate function descriptors, and dot symbols, eg:

  $ nm arch/powerpc/kernel/vdso32/vgettimeofday.o
  000005d0 T .__c_kernel_clock_getres
  00000024 D __c_kernel_clock_getres
  ...

We get away with that at the moment because we also use the DOTSYM
macro, and that is also incorrectly prepending a '.' in 32-bit VDSO
code due to a separate bug.

But we shouldn't be generating function descriptors for this file,
there's no 32-bit ABI that includes function descriptors, so the
resulting object file is some frankenstein and it's surprising that it
even links.

So filter out all the ABI-related options we add to CFLAGS for 64-bit
builds, so that they're not used when building 32-bit code. With that
we only see regular text symbols:

  $ nm arch/powerpc/kernel/vdso32/vgettimeofday.o                                                                                                                                     michael@alpine1-p1
  000005d0 T __c_kernel_clock_getres
  00000000 T __c_kernel_clock_gettime
  00000200 T __c_kernel_clock_gettime64
  00000410 T __c_kernel_gettimeofday
  00000650 T __c_kernel_time

Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso32/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 6616f4e794d0..9cb6f524854b 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -27,7 +27,7 @@ endif
 CC32FLAGS :=
 ifdef CONFIG_PPC64
 CC32FLAGS += -m32
-KBUILD_CFLAGS := $(filter-out -mcmodel=medium,$(KBUILD_CFLAGS))
+KBUILD_CFLAGS := $(filter-out -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc,$(KBUILD_CFLAGS))
 endif
 
 targets := $(obj-vdso32) vdso32.so.dbg
-- 
2.25.1

