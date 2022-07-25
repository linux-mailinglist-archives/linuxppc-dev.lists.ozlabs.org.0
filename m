Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B957F813
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 03:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrjrC17nBz3c7p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:58:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=l2QSq3zY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.74; helo=conuserg-07.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=l2QSq3zY;
	dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrjqW5dLbz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 11:57:59 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-07.nifty.com with ESMTP id 26P1ul8D018856;
	Mon, 25 Jul 2022 10:56:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 26P1ul8D018856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658714208;
	bh=xq0WN+SM7aNSnGtzOLwQXZdnjd13BMgHWxDA8av/i8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=l2QSq3zYMYc9O2toKl19OI/oILLXfnJXPjTbx/CwhpQxlqDZ8GtqWVRHFmfwdgv7h
	 kAlvzWUG5MIgxwjrJsLmn6ndHxR4xMbOD7Iz9eexMhAdgK4zjNSxSF0i2H1D8wLkRA
	 HoBnwa0Awzcf5YN9OFct3L3nj8JTTRaRiduoI5g+iRpT2JPqJqb6iDlJ8BeNeCBXAi
	 l9IrHmhXIdpbtNr4YZASgpGhgPyctLlDKYVTP/+x/tAR1KDR444hu+E6A5WyB0N8LY
	 5EsAQoArT+j1VEhHUej1TkWXYM7phj6TnAx7EZa38B4ODPdJ7kOSC06uiK5AmNed7h
	 35t+I2oxhRt8Q==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/purgatory: Omit use of bin2c
Date: Mon, 25 Jul 2022 10:56:19 +0900
Message-Id: <20220725015619.618070-1-masahiroy@kernel.org>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .incbin assembler directive is much faster than bin2c + $(CC).

Do similar refactoring as in commit 4c0f032d4963 ("s390/purgatory:
Omit use of bin2c").

Please note the .quad directive matches to size_t in C (both 8 byte)
because the purgatory is compiled only for the 64-bit kernel.
(KEXEC_FILE depends on PPC64).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
---

Changes in v2:
  - Fix a typo (kexec_purgatroy_end -> kexec_purgatory_end)

 arch/powerpc/Kconfig                     |  1 -
 arch/powerpc/purgatory/.gitignore        |  1 -
 arch/powerpc/purgatory/Makefile          |  8 ++------
 arch/powerpc/purgatory/kexec-purgatory.S | 14 ++++++++++++++
 scripts/remove-stale-files               |  2 ++
 5 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 arch/powerpc/purgatory/kexec-purgatory.S

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa12e88c580..5050af5c1a23 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -551,7 +551,6 @@ config KEXEC_FILE
 	bool "kexec file based system call"
 	select KEXEC_CORE
 	select HAVE_IMA_KEXEC if IMA
-	select BUILD_BIN2C
 	select KEXEC_ELF
 	depends on PPC64
 	depends on CRYPTO=y
diff --git a/arch/powerpc/purgatory/.gitignore b/arch/powerpc/purgatory/.gitignore
index b8dc6ff34254..5e40575c1f2b 100644
--- a/arch/powerpc/purgatory/.gitignore
+++ b/arch/powerpc/purgatory/.gitignore
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-kexec-purgatory.c
 purgatory.ro
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 348f59581052..a81d155b89ae 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -2,17 +2,13 @@
 
 KASAN_SANITIZE := n
 
-targets += trampoline_$(BITS).o purgatory.ro kexec-purgatory.c
+targets += trampoline_$(BITS).o purgatory.ro
 
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
 
 $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE
 		$(call if_changed,ld)
 
-quiet_cmd_bin2c = BIN2C   $@
-      cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
-
-$(obj)/kexec-purgatory.c: $(obj)/purgatory.ro FORCE
-	$(call if_changed,bin2c)
+$(obj)/kexec-purgatory.o: $(obj)/purgatory.ro
 
 obj-y	+= kexec-purgatory.o
diff --git a/arch/powerpc/purgatory/kexec-purgatory.S b/arch/powerpc/purgatory/kexec-purgatory.S
new file mode 100644
index 000000000000..f494fd5a0526
--- /dev/null
+++ b/arch/powerpc/purgatory/kexec-purgatory.S
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+	.section .rodata, "a"
+
+	.align	8
+kexec_purgatory:
+	.globl	kexec_purgatory
+	.incbin	"arch/powerpc/purgatory/purgatory.ro"
+.Lkexec_purgatory_end:
+
+	.align	8
+kexec_purgatory_size:
+	.globl	kexec_purgatory_size
+	.quad	.Lkexec_purgatory_end - kexec_purgatory
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 7adab4618035..5a7543469698 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -20,6 +20,8 @@ set -e
 # yard. Stale files stay in this file for a while (for some release cycles?),
 # then will be really dead and removed from the code base entirely.
 
+rm -f arch/powerpc/purgatory/kexec-purgatory.c
+
 # These were previously generated source files. When you are building the kernel
 # with O=, make sure to remove the stale files in the output tree. Otherwise,
 # the build system wrongly compiles the stale ones.
-- 
2.34.1

