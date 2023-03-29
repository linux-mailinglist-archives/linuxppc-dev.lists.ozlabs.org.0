Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E26CD30A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 09:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmdPK2sW9z3cFt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxjKslNH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmdMb3QLKz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 18:23:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxjKslNH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmdMX277yz4xDj;
	Wed, 29 Mar 2023 18:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680074632;
	bh=kbej4vwQfJJU4SOHkjGKDbZ4TpGVIfeR5bgGlWqPA98=;
	h=From:To:Subject:Date:From;
	b=lxjKslNHDGNzt6vKlCi6ZyO2sCp9lNoMKzSdOCY/bWSDTCdpk4mL2MF8LMMEN6w63
	 lU01t1ERK0ILhOAHeSIetd1IEPj8wnBdEBTd1znas85gxY284jsIPRA35AZrmkTAZH
	 aCN2RWlj4qk+ceBmWK8MkDIpPB3k83ULf9+stOfXPkoHy64ubDzlohhLO0K5VQkbMo
	 4khrkCVf0YV/3FPSepfwB2aaokkdq3hFg0m5s6ET0rwSzR77i8wm6m0w+nTgPusMej
	 bAI/TZFyJ/fs/ZewvhmWYbcBZSONqfobIaPZ9yCHkKC0JXekEhxh11ua4bbn6Bj3dQ
	 jhZPhlbWna++Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/Makefile: Don't prefix archhelp commands with "@"
Date: Wed, 29 Mar 2023 18:23:33 +1100
Message-Id: <20230329072334.2023357-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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

It's not necessary to prefix every command in archhelp with "@" (to
supress echoing the command), because that is done by the top level
Makefile when it evaluates archhelp.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dc4cbf0a5ca9..b9bfa9ac3f06 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -349,25 +349,25 @@ PHONY += ppc64_randconfig
 		-f $(srctree)/Makefile randconfig
 
 define archhelp
-  @echo '* zImage          - Build default images selected by kernel config'
-  @echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
-  @echo '  uImage          - U-Boot native image format'
-  @echo '  cuImage.<dt>    - Backwards compatible U-Boot image for older'
-  @echo '                    versions which do not support device trees'
-  @echo '  dtbImage.<dt>   - zImage with an embedded device tree blob'
-  @echo '  simpleImage.<dt> - Firmware independent image.'
-  @echo '  treeImage.<dt>  - Support for older IBM 4xx firmware (not U-Boot)'
-  @echo '  install         - Install kernel using'
-  @echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
-  @echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
-  @echo '                    install to $$(INSTALL_PATH) and run lilo'
-  @echo '  *_defconfig     - Select default config from arch/$(ARCH)/configs'
-  @echo ''
-  @echo '  Targets with <dt> embed a device tree blob inside the image'
-  @echo '  These targets support board with firmware that does not'
-  @echo '  support passing a device tree directly.  Replace <dt> with the'
-  @echo '  name of a dts file from the arch/$(ARCH)/boot/dts/ directory'
-  @echo '  (minus the .dts extension).'
+  echo '* zImage          - Build default images selected by kernel config'
+  echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
+  echo '  uImage          - U-Boot native image format'
+  echo '  cuImage.<dt>    - Backwards compatible U-Boot image for older'
+  echo '                    versions which do not support device trees'
+  echo '  dtbImage.<dt>   - zImage with an embedded device tree blob'
+  echo '  simpleImage.<dt> - Firmware independent image.'
+  echo '  treeImage.<dt>  - Support for older IBM 4xx firmware (not U-Boot)'
+  echo '  install         - Install kernel using'
+  echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
+  echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
+  echo '                    install to $$(INSTALL_PATH) and run lilo'
+  echo '  *_defconfig     - Select default config from arch/$(ARCH)/configs'
+  echo ''
+  echo '  Targets with <dt> embed a device tree blob inside the image'
+  echo '  These targets support board with firmware that does not'
+  echo '  support passing a device tree directly.  Replace <dt> with the'
+  echo '  name of a dts file from the arch/$(ARCH)/boot/dts/ directory'
+  echo '  (minus the .dts extension).'
 endef
 
 PHONY += install
-- 
2.39.2

