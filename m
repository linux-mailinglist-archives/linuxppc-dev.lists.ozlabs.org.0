Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3A2DCB27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 03:57:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxGrL5ctGzDqN3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 13:57:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxGpY6m1GzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 13:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YSAqPGpK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxGpX3C6Yz9sTK;
 Thu, 17 Dec 2020 13:56:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608173765;
 bh=0hZNggZ84WIE/wYSVyJZPAYI+EbjoxXSfGZrGmkZx2Y=;
 h=From:To:Subject:Date:From;
 b=YSAqPGpKb1KxXjGRS4FDHXnb410TCAM61oWufKDqtu951M5uXAXTCxZpASNcLKb7O
 sFeryFGr/3dKLv3K/R6XcwsRuICM3Ave1Umh5QDD3uGivvYGm9F5d42hNHN7GzzQVY
 YuBgWiP7+IPu+8KtvqHrCj37sZQI7F4FfOS+6gqkGWnFIuN2mPfjdLiYh4JEXOExtX
 j0T8mK6d77QjYNSsR2SvhhnAE1/15kLT6xnp+sWDzXR3pOwRIncbKVMl/bzlr+OGVj
 p66VWNunfvwgVyYlC5XrupIUZaQvIU0lQQf5N+CrLYvfOOdSMEFG0ytmTcOpTvFJcB
 9q9H4Ht7xjVgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org
Subject: powerpc VDSO files being unnecessarily rebuilt
Date: Thu, 17 Dec 2020 13:56:01 +1100
Message-ID: <87tuslxhry.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi all,

Since the merge of the C VDSO I see we are repeatedly rebuilding some
files in the VDSO, eg:

  $ make V=2
  make[1]: Entering directory '/home/michael/linux/build~'
    GEN     Makefile
    CALL    /home/michael/linux/scripts/checksyscalls.sh - due to target missing
    CALL    /home/michael/linux/scripts/atomic/check-atomics.sh - due to target missing
    CHK     include/generated/compile.h
    CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to vgettimeofday.o not in $(targets)

This then causes multiple other files to be rebuilt.

So the obvious fix is to add it to targets:

diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index d365810a689a..5386532866ce 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -5,6 +5,7 @@ ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
+targets := $(obj-vdso64) vdso64.so.dbg
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
@@ -13,11 +14,11 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
   CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
   CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
+  targets += vgettimeofday.o
 endif
 
 # Build rules
 
-targets := $(obj-vdso64) vdso64.so.dbg
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 GCOV_PROFILE := n


But then I see it still rebuilt:

  CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change


I'm not changing the command line, and AFAICS the .cmd file is not
changing either:

  $ make V=2
  ...
    CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
  
  $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
  7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
  
  $ make V=2
  ...
    CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
  
  $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
  7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o


So any hints on what I'm missing here?

cheers
