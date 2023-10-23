Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028797D30F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jqtO1Tw0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDXPj6MStz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 22:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jqtO1Tw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDXNs4tbFz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 22:03:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 72E7CB81A65;
	Mon, 23 Oct 2023 11:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9ABC433CA;
	Mon, 23 Oct 2023 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698058999;
	bh=BMggmvtBQY8hwOyVQVq62AgRI2SUxHnvQuDjQvfxizc=;
	h=From:To:Cc:Subject:Date:From;
	b=jqtO1Tw07SOPfYVrK8fE6SZMvbytaHht7Jy5OtrX9diVHSX5K3HNQxskPtktWfFvz
	 CjZ3YK4olpEa2TBbnNdiztmCRUBd/sy56szRbdoFsDXW/CznME+hySB2P9cqNX0M+G
	 G3dtuG3I41vbJXJ3s4zIxr3NveJQMHa2i2EwT6nbV9LnN8cL03l9/1eQnftyaqrLoh
	 DLxrYtZeDq9LUl4ENQCU5ls+0AUUTqADDGpY0CmxjUulJqc+dMJKoL61DIHafHxImc
	 G/V+zxP4KmKLxKv1J30hLeV7f3DNlkrN+uvdFRZ28Fv1G2e93EwT8ag9OCuvvUoUcD
	 0DMGDNiF0NVXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Eric DeVolder <eric.devolder@oracle.com>
Subject: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Date: Mon, 23 Oct 2023 13:01:54 +0200
Message-Id: <20231023110308.1202042-1-arnd@kernel.org>
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The cleanup for the CONFIG_KEXEC Kconfig logic accidentally changed the
'depends on CRYPTO=y' dependency to a plain 'depends on CRYPTO', which
causes a link failure when all the crypto support is in a loadable module
and kexec_file support is built-in:

x86_64-linux-ld: vmlinux.o: in function `__x64_sys_kexec_file_load':
(.text+0x32e30a): undefined reference to `crypto_alloc_shash'
x86_64-linux-ld: (.text+0x32e58e): undefined reference to `crypto_shash_update'
x86_64-linux-ld: (.text+0x32e6ee): undefined reference to `crypto_shash_final'

Both s390 and x86 have this problem, while ppc64 and riscv have the
correct dependency already. On riscv, the dependency is only used
for the purgatory, not for the kexec_file code itself, which may
be a bit surprising as it means that with CONFIG_CRYPTO=m, it is
possible to enable KEXEC_FILE but then the purgatory code is silently
left out.

Move this into the common Kconfig.kexec file in a way that is
correct everywhere, using the dependency on CRYPTO_SHA256=y only
when the purgatory code is available. This requires reversing the
dependency between ARCH_SUPPORTS_KEXEC_PURGATORY and KEXEC_FILE,
but the effect remains the same, other than making riscv behave
like the other ones.

On s390, there is an additional dependency on CRYPTO_SHA256_S390, which
should technically not be required but gives better performance. Remove
this dependency here, noting that it was not present in the initial
Kconfig code but was brought in without an explanation in commit
71406883fd357 ("s390/kexec_file: Add kexec_file_load system call").

Fixes: 6af5138083005 ("x86/kexec: refactor for kernel/Kconfig.kexec")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/Kconfig | 4 ++--
 arch/riscv/Kconfig   | 4 +---
 arch/s390/Kconfig    | 4 ++--
 arch/x86/Kconfig     | 4 ++--
 kernel/Kconfig.kexec | 1 +
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d5d5388973ac7..4640cee33f123 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -607,10 +607,10 @@ config ARCH_SUPPORTS_KEXEC
 	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 
 config ARCH_SUPPORTS_KEXEC_FILE
-	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
+	def_bool PPC64
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+	def_bool y
 
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 25474f8c12b79..f571bad2d22d0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -687,9 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	select KEXEC_ELF
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
+	def_bool y
 
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index b0d67ac8695f9..ec77106af4137 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -253,13 +253,13 @@ config ARCH_SUPPORTS_KEXEC
 	def_bool y
 
 config ARCH_SUPPORTS_KEXEC_FILE
-	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+	def_bool y
 
 config ARCH_SUPPORTS_KEXEC_SIG
 	def_bool MODULE_SIG_FORMAT
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+	def_bool y
 
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 94efde80ebf35..f9975b15ccd57 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2073,7 +2073,7 @@ config ARCH_SUPPORTS_KEXEC
 	def_bool y
 
 config ARCH_SUPPORTS_KEXEC_FILE
-	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
+	def_bool X86_64
 
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
@@ -2081,7 +2081,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+	def_bool y
 
 config ARCH_SUPPORTS_KEXEC_SIG
 	def_bool y
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 7aff28ded2f48..bfc636d64ff2b 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -36,6 +36,7 @@ config KEXEC
 config KEXEC_FILE
 	bool "Enable kexec file based system call"
 	depends on ARCH_SUPPORTS_KEXEC_FILE
+	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
 	select KEXEC_CORE
 	help
 	  This is new version of kexec system call. This system call is
-- 
2.39.2

