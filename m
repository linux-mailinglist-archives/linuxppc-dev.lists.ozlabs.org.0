Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136A16256C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 12:22:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MJNM6fhYzDqcS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:22:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MJJn5YQkzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 22:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ra3wq7GF; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48MJJm5qzsz9sRf; Tue, 18 Feb 2020 22:19:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48MJJm4kBgz9sRk; Tue, 18 Feb 2020 22:19:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582024744;
 bh=wOr2GBV5ekrEdUCRGWoPKLzHSJeH0L9Gcqv1tuXDEBE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ra3wq7GFPxdlQXKgTzlbJXdEZ9gG+gBZ7c9rRZ89t1n8iUZwsrk/OyeqXSrDvSkrh
 k/fuxhFBHR3XzsIyS6XTivw1J6jhRFbzsY6bZZQLdckyp4k47ZBrfG0RCnfDTgzLAI
 dJLKPeozlUE/8r3zuoSprH5RM16LOCsDo+KV5bPJOo943gfXkd3pQY7YLUW9BY6q3B
 ypKV4ToswimqzoZr3T6uU9viyhZGRMwwS57w+5uyPDYiX8LLqPj4rIGWiYjGBSolbN
 0sNOEMvPa28/WqFCAAhFgBBgEFOLDM3gXB29lqoe+WbYp3QMhMyJA6cFP/pRvLTeNm
 XQQS6Iqq3chpA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/Makefile: Mark phony targets as PHONY
Date: Tue, 18 Feb 2020 22:18:42 +1100
Message-Id: <20200218111842.1641-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of our phony targets are not marked as such. This can lead to
confusing errors, eg:

  $ make clean
  $ touch install
  $ make install
  make: 'install' is up to date.
  $

Fix it by adding them to the PHONY variable which is marked phony in
the top-level Makefile. In arch/powerpc/boot/Makefile we do it
manually.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile      | 6 ++++++
 arch/powerpc/boot/Makefile | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..cbe5ca4f0ee5 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -298,6 +298,7 @@ $(BOOT_TARGETS2): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
 
+PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
@@ -403,9 +404,11 @@ define archhelp
   @echo '  (minus the .dts extension).'
 endef
 
+PHONY += install
 install:
 	$(Q)$(MAKE) $(build)=$(boot) install
 
+PHONY += vdso_install
 vdso_install:
 ifdef CONFIG_PPC64
 	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso64 $@
@@ -425,6 +428,7 @@ archprepare: checkbin
 ifdef CONFIG_STACKPROTECTOR
 prepare: stack_protector_prepare
 
+PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
@@ -436,10 +440,12 @@ endif
 ifdef CONFIG_SMP
 prepare: task_cpu_prepare
 
+PHONY += task_cpu_prepare
 task_cpu_prepare: prepare0
 	$(eval KBUILD_CFLAGS += -D_TASK_CPU=$(shell awk '{if ($$2 == "TASK_CPU") print $$3;}' include/generated/asm-offsets.h))
 endif
 
+PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
 checkbin:
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0556bf4fc9e9..58d4b4667206 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -445,6 +445,8 @@ install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 	sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)" $^
 
+.PHONY: install zInstall
+
 # anything not in $(targets)
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
-- 
2.21.1

