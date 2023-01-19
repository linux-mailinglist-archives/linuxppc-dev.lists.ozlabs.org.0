Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08506733A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 09:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyG1b3M8gz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:26:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iT/hmlqt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iT/hmlqt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyG0f1Pv2z3c8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 19:25:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC07A611FB;
	Thu, 19 Jan 2023 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CFFC433F0;
	Thu, 19 Jan 2023 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674116733;
	bh=ghjfgjQy0BKb/C6LfAEq6+fVqZmZeT2M4t0k/6l5bN4=;
	h=From:To:Cc:Subject:Date:From;
	b=iT/hmlqtrPaMfsfA5C6T3dPUpevSfxmWLR3aEIwMwTorEBT0YyWkjbBVySwBvnvjW
	 E0YtHhJMKphZa12C/JftqksZTccO+V48/yojtXFS1nsokX/Y/wcmSg3LeOENbnXJFv
	 USf0ejmaS47uyXnTzsHwTCIf8pgY3lAl+SiyrLpBXO36yWTvDJvBj2Aufe4+xesR7e
	 H/cuTX+6oB35Qm3kpnseCep2Qlho9iJiHm9t7T3nCbfGC8WFoGG3+P6eCWPtCmNiYC
	 wNP/GqaBikzvLYVOt+AED7JsSsRJuc+fCN/H4STyEo0AItUKHH+vb+tMytvbqXLNyQ
	 FxVvUPlvYymiw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Date: Thu, 19 Jan 2023 17:24:47 +0900
Message-Id: <20230119082447.152020-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

crtsavres.o is linked to modules, but as commit d0e628cd817f ("kbuild:
doc: clarify the difference between extra-y and always-y") explained,
'make modules' does not build extra-y.

The following command fails:

  $ make ARCH=powerpc LLVM=1 mrproper ps3_defconfig modules
    [snip]
    LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
  make[1]: *** [scripts/Makefile.modfinal:61: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
  make: *** [Makefile:1924: modules] Error 2

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c53618c34b70..aa34854bc9f5 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -43,7 +43,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
 ifndef CONFIG_LD_IS_BFD
-extra-$(CONFIG_PPC64)	+= crtsavres.o
+always-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-- 
2.34.1

