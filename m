Return-Path: <linuxppc-dev+bounces-2977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99E9C03E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:27:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkftQ5mmJz3bld;
	Thu,  7 Nov 2024 22:27:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730978830;
	cv=none; b=L2wTp7d8sC2o98UMTLcQhStF0llpX2E0ybsMCAZyBimYlYl0zj+892FBn8MgCGcD0LKS4gdgYivXFaizjc/A8DxuetvNdgMuazSGQHQO6og4gg9wXh2XI85VbZMxj0teMbvAsgs2/CUiIDJEcwY1+lrX1mV/U0XVLbMRp+aSCo/xsIGEjTdhloWWAMMkCrQyKKlDpcKd7A/twExomFbU6bra695/hIO+XO7PGptxB1mruO8aX8svA1/ux3FQKXhSJpEquvV5UbaCpxyuINh+cRCHNmS0qfSf2upqtaOaWHbhK5YAVZ8IDsHvkG8pE6URWEhzhJgtE0Fsmc1oZuQhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730978830; c=relaxed/relaxed;
	bh=CkVnI4B9RaLkgZIo80cWqi78EKKTl4u9WpE2PtAh5Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6Ffo1fMD/ErdPc2vvMDtppZIy6jqaTrMFysZL6CEpqQ8zrPyDfCSl5lZ5EhNn0t1E0wpt/eveidJ12jToMQaVOnqoyFOpKJuMXpvIqZLNK7BpjBD8rdweSBuTK5E09R4HptyE2Z3v02V6TB/oNAM0vxGhq/R87qDvqz9oztda5le0Q0tnclmTEyC0V90sHJRU4qRiom1vQXPIQj7BOpmU7V+byg11lkrIDYeLUZL82DBRCeWDT7lxGF67dNqUFkQ45ydlOlogPEaEsNChM2MyUDCIS3H5rBIc6G6A4Nfg3XCeY6TU/K29w4+Oh1ME4+7Xd7ezUM67fERb2gytG74A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mezYusd1; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mezYusd1;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkftP5r86z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:27:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730978825;
	bh=CkVnI4B9RaLkgZIo80cWqi78EKKTl4u9WpE2PtAh5Uw=;
	h=From:To:Cc:Subject:Date:From;
	b=mezYusd1gCPz5AI/xDra74dOeHBi3re7aCQwdsfaGJH/+m9FzK3TanBi40uqQCXnY
	 Ph2HIXPTgysUEA7gPvkHo6OaDA4olcGiyidiT974U4YxAGPcp9bxtLM7+IKWHExoGr
	 RgDTKzkElPV2y9Jp9U/rC0QWlE4XO7QZbabX6UG3phV/0Aan1ijVV3cz48Bud7/tHt
	 ZJfs4lOdW/Asz8PjMvev+fKF8tYSduea1GbATRVw0VaAYIQPu+mjtv2g5tx7+Ag+x3
	 tZXnjuUHHBWHd8bU++NwDgTZ3IwVRLlzzJW+WzleD4ZRkOmXBAddUZRHc0d2MPS5a+
	 nGxAa+Yycb9Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkftK3pftz4x1w;
	Thu,  7 Nov 2024 22:27:05 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: arnd@arndb.de,
	<nathan@kernel.org>
Subject: [PATCH] powerpc/Makefile: Allow overriding CPP
Date: Thu,  7 Nov 2024 22:26:46 +1100
Message-ID: <20241107112646.32401-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

Unlike all other arches, powerpc doesn't allow the user to override CPP,
because it sets it unconditionally in the arch Makefile. This can lead
to strange build failures.

Instead add the required flags to KBUILD_CPPFLAGS, which are passed
to CPP, CC and AS invocations by the generic Makefile logic.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/all/20240607061629.530301-1-arnd@kernel.org
[mpe: Rebase, write change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile             | 7 +++----
 arch/powerpc/kernel/vdso/Makefile | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index cbb353ddacb7..94a6ccb8ad12 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
-KBUILD_CFLAGS	+= -mlittle-endian
+KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
 LDEMULATION	:= lppc
 GNUTARGET	:= powerpcle
 MULTIPLEWORD	:= -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
-KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+KBUILD_CPPFLAGS	+= $(call cc-option,-mbig-endian)
 KBUILD_LDFLAGS	+= -EB
 LDEMULATION	:= ppc
 GNUTARGET	:= powerpc
@@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
-KBUILD_CFLAGS	+= -m$(BITS)
+KBUILD_CPPFLAGS	+= -m$(BITS)
 KBUILD_AFLAGS	+= -m$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
 endif
@@ -168,7 +168,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
-CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 31ca5a547004..af130c82a71a 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -50,7 +50,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 
 # Filter flags that clang will warn are unused for linking
-ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
+ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 CC32FLAGS := -m32
 CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
-- 
2.47.0


