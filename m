Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21B806F46
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 12:56:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oKi63j9U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlbV74Qq7z3bgs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 22:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oKi63j9U;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlbTF0gP2z3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 22:56:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701863760;
	bh=0XtCQkBddChFD85AakVwj3y2yxSH4e0nTvadyEMgdH0=;
	h=From:To:Subject:Date:From;
	b=oKi63j9U++U9vQH4zFSC7Xu1osJvrZgqC9By9cKcXo9bjWvDqxMi5iegUjIkMq1hH
	 d5xr/YbeOeM8DWw4TpF8T+xhYrpy4u5AHns5G9kaV8eQbIq1NaW3lKkbiXcogoqNvK
	 hwjgM8E2//o4vM1SNJFYHzp1T+3zbNaEbFbQSbQc5fwg2rmLtDCrTZTGvCcSt1Qjw+
	 o5UksoeBta/Oq6lDZyqsdLhlaIRzGp3tO22/0pIPo+T8O4JR/DFNRVkWoiBhMSH9+L
	 D7dDd/ebrw1oSX2RxGVn8L5hDR9svjROc3uO+vV12qckwYhFpfzDQlyDDDqSTAdVOI
	 lnNZu2VmlpNiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlbTD0xdSz4wd6;
	Wed,  6 Dec 2023 22:56:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/4] powerpc/Makefile: Don't use $(ARCH) unnecessarily
Date: Wed,  6 Dec 2023 22:55:45 +1100
Message-ID: <20231206115548.1466874-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no need to use $(ARCH) for references to the arch directory in
the source tree, it is always arch/powerpc.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f19dbaa1d541..b0bc17c35ed7 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -161,7 +161,7 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
+KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
@@ -232,7 +232,7 @@ BOOT_TARGETS2 := zImage% dtbImage% treeImage.% cuImage.% simpleImage.% uImage.%
 
 PHONY += $(BOOT_TARGETS1) $(BOOT_TARGETS2)
 
-boot := arch/$(ARCH)/boot
+boot := arch/powerpc/boot
 
 $(BOOT_TARGETS1): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
@@ -336,7 +336,7 @@ PHONY += $(generated_configs)
 
 define archhelp
   echo '* zImage          - Build default images selected by kernel config'
-  echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
+  echo '  zImage.*        - Compressed kernel image (arch/powerpc/boot/zImage.*)'
   echo '  uImage          - U-Boot native image format'
   echo '  cuImage.<dt>    - Backwards compatible U-Boot image for older'
   echo '                    versions which do not support device trees'
@@ -347,12 +347,12 @@ define archhelp
   echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
   echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
   echo '                    install to $$(INSTALL_PATH) and run lilo'
-  echo '  *_defconfig     - Select default config from arch/$(ARCH)/configs'
+  echo '  *_defconfig     - Select default config from arch/powerpc/configs'
   echo ''
   echo '  Targets with <dt> embed a device tree blob inside the image'
   echo '  These targets support board with firmware that does not'
   echo '  support passing a device tree directly.  Replace <dt> with the'
-  echo '  name of a dts file from the arch/$(ARCH)/boot/dts/ directory'
+  echo '  name of a dts file from the arch/powerpc/boot/dts/ directory'
   echo '  (minus the .dts extension).'
   echo
   $(foreach cfg,$(generated_configs),
-- 
2.43.0

