Return-Path: <linuxppc-dev+bounces-9081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1CACB9B0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 18:33:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9zt25JRtz2y8l;
	Tue,  3 Jun 2025 02:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748881994;
	cv=none; b=Mq9G+rJRdvCd1TssE7Z518HnOfpsCr0Ldb49/NslWRYK+45OI0iEbVrzUQjIiADdpH+Ute9Ba26igUv/kxaWqixuPgipELLTJKeTTyUcZoBPPW9pwSvIeIRKjShDBdOpVSFGpHwxDG5hV+dkkfjGsbfwjre1tE//zmJrMYnrxjCwmXspuUiE8q51GqM6uJ9FmvZVZbz2F11cpLeLx8l/ovr8+1KtFfkwccGXnzNzlOxNgoXn++4g6rHtwKpnyxAEZKWKKgqHHCqP5Gp/2ql1R4cQfHj9OkoBWZM9bpWgxmrwEi1Xp7wInVproAECWCvnEp33MVII96fdpbWIh3/53A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748881994; c=relaxed/relaxed;
	bh=rLjh6sHOnL206lmJn3H2qiQYYtgS7DPLuk3q6ye2PZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PORcNe0cFxQb/IJ78G8zb/J55NzbF9qi5wN8mWCK1mBqgBCU4EWewmDowXT0/XJiv+2fbhaXDnrFn2VRQVNKZ0Up5bnLnqqaYPYJItPmF3Cht0EfnjOxwe0Uo63KFIlEsdGf82e3bNmWqi7by0utzRIU3WuxHilsgfEo/QWoIII+WGZIscV68C4vknZqYyfDixJ298OcDvSJnrTk7iBKrEMkuFHCshAOTtn3Nqo5dqxbY5pVISYNuxt06KSsvQ7pFv9b5+MOVMFBbC1iq9Ti+rtQi84HknvVhnCeeKm2JejKBVzN179H6ijm35u5h1+o/2o2qjThtAiUAfMGz9k4IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m64HknKK; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m64HknKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9zt12pLhz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 02:33:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CF7F615F2;
	Mon,  2 Jun 2025 16:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C620C4CEEE;
	Mon,  2 Jun 2025 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748881989;
	bh=LGwMZ23Ye1yiBNLdoBZUkgTCpcRIKyrLcW515NUCYWA=;
	h=From:To:Cc:Subject:Date:From;
	b=m64HknKKkP2Q0voFIUj9QsKA8oBZjLvmvuNjmM9n1AJlkB1i+b0Y73mTIiv+JjuY5
	 612fI1/JAY2sKLhk6/Cf28bqZ/HOqpysxgStQBZYqA1agiaDrrdtrfzHB0Zj5UJBR3
	 /DMRtuZxfXxbuoU5Z+yLXNgnW8LtX4g1RQdlEsBH02pnholTRPNCKc+1JdOdGwt8bU
	 KseFxedfEwAPZowGBYPC94MkNr9HJ1aEkFuWGUstREHxAkFikZLSp5Vo8J6J+4VLOr
	 /QiW5SB6hMI5cDqYOB5+SKScQdPAYG35xDGFLMqj9pVvWZmJVFBlSncKdLvel4oU+M
	 1iX5YJdN6wQ0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
Date: Tue,  3 Jun 2025 01:32:24 +0900
Message-ID: <20250602163302.478765-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The extra-y syntax is planned for deprecation because it is similar
to always-y.

When building the boot wrapper, always-y and extra-y are equivalent.
Use always-y instead.

In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
keep the current behavior: prom_init_check is skipped when building
only modular objects.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/boot/Makefile   | 6 +++---
 arch/powerpc/kernel/Makefile | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 184d0680e661..b003f7ac8755 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -242,13 +242,13 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
 hostprogs	:= addnote hack-coff mktree
 
 targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
-extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
+always-y	:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
 		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
 
 dtstree		:= $(src)/dts
 
 wrapper		:= $(src)/wrapper
-wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
+wrapperbits	:= $(always-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
 			$(wrapper) FORCE
 
 #############
@@ -455,7 +455,7 @@ WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
 WRAPPER_BINDIR := /usr/sbin
 INSTALL := install
 
-extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(extra-y))
+extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(always-y))
 hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs))
 wrapper-installed	:= $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
 dts-installed		:= $(patsubst $(dtstree)/%, $(DESTDIR)$(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4d2daa8e7bca..ac01cedad107 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -201,7 +201,9 @@ obj-$(CONFIG_ALTIVEC)		+= vector.o
 
 obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init.o
 obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_entry_64.o
-extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
+ifdef KBUILD_BUILTIN
+always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
+endif
 
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
 obj-$(CONFIG_PPC32)		+= $(obj32-y)
-- 
2.43.0


