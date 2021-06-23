Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572E3B1AB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 15:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G93Qv0svgz3bwn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 23:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mojw4VlM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mojw4VlM; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G93QQ71Dfz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 23:05:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G93QN1hWrz9sVm; Wed, 23 Jun 2021 23:04:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624453500;
 bh=I4MxHP1dXup6kLo8GZg073Bh7ZQwBFa9+tka66GbagE=;
 h=From:To:Cc:Subject:Date:From;
 b=mojw4VlMBTOV48QnS2A0ySIrFvMy/qGQet8L4MeNN2vn6JzSXRWqSIh0cECdOjURW
 YVAKkXvXTrST0/U0XWOBwB4s1z7Sc21X+C510aZQNjU3bGwXy/gUAqbf8J/ZEIc4z9
 AzWnZeye3YguhL0zQdM2EjhrJ+fbKCEZ+VG69mhE6L/jy9veJtEMc7Ooybp7pTVyGQ
 OHAeqbeClNTNsUOQz/RyFG1umrOHUoCV7vplkxpTo7z9AyDN2pCwgGVzYgD94sN13a
 HniTwwoWnQt3rAxqt0ploSRnlHfJyOPY5Fs5XO+Sjfr91XE+PwUvGUTx/fFsYsw81U
 bmmwogoba5oCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Make prom_init require RELOCATABLE
Date: Wed, 23 Jun 2021 23:04:54 +1000
Message-Id: <20210623130454.2542945-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we boot from open firmware (OF) using PPC_OF_BOOT_TRAMPOLINE, aka.
prom_init, we run parts of the kernel at an address other than the link
address. That happens because OF loads the kernel above zero (OF is at
zero) and we run prom_init before copying the kernel down to zero.

Currently that works even for non-relocatable kernels, because we do
various fixups to the prom_init code to make it run where it's loaded.

However those fixups are not sufficient if the kernel becomes large
enough. In that case prom_init()'s final call to __start() can end up
generating a plt branch:

bl      c000000002000018 <00000078.plt_branch.__start>

That results in the kernel jumping to the linked address of __start,
0xc000000000000000, when really it needs to jump to the
0xc000000000000000 + the runtime address because the kernel is still
running at the load address.

We could do further shenanigans to handle that, see Jordan's patch for
example:
  https://lore.kernel.org/linuxppc-dev/20210421021721.1539289-1-jniethe5@gmail.com

However it is much simpler to just require a kernel with prom_init() to
be built relocatable. The result works in all configurations without
further work, and requires less code.

This should have no effect on most people, as our defconfigs and
essentially all distro configs already have RELOCATABLE enabled.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom_init.c | 58 ++-------------------------------
 arch/powerpc/platforms/Kconfig  |  1 +
 2 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 05ce15b854e2..a5bf355ce1d6 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3243,54 +3243,6 @@ static void __init prom_check_initrd(unsigned long r3, unsigned long r4)
 #endif /* CONFIG_BLK_DEV_INITRD */
 }
 
-#ifdef CONFIG_PPC64
-#ifdef CONFIG_RELOCATABLE
-static void reloc_toc(void)
-{
-}
-
-static void unreloc_toc(void)
-{
-}
-#else
-static void __reloc_toc(unsigned long offset, unsigned long nr_entries)
-{
-	unsigned long i;
-	unsigned long *toc_entry;
-
-	/* Get the start of the TOC by using r2 directly. */
-	asm volatile("addi %0,2,-0x8000" : "=b" (toc_entry));
-
-	for (i = 0; i < nr_entries; i++) {
-		*toc_entry = *toc_entry + offset;
-		toc_entry++;
-	}
-}
-
-static void reloc_toc(void)
-{
-	unsigned long offset = reloc_offset();
-	unsigned long nr_entries =
-		(__prom_init_toc_end - __prom_init_toc_start) / sizeof(long);
-
-	__reloc_toc(offset, nr_entries);
-
-	mb();
-}
-
-static void unreloc_toc(void)
-{
-	unsigned long offset = reloc_offset();
-	unsigned long nr_entries =
-		(__prom_init_toc_end - __prom_init_toc_start) / sizeof(long);
-
-	mb();
-
-	__reloc_toc(-offset, nr_entries);
-}
-#endif
-#endif
-
 #ifdef CONFIG_PPC_SVM
 /*
  * Perform the Enter Secure Mode ultracall.
@@ -3324,14 +3276,12 @@ static void __init setup_secure_guest(unsigned long kbase, unsigned long fdt)
 	 * relocated it so the check will fail. Restore the original image by
 	 * relocating it back to the kernel virtual base address.
 	 */
-	if (IS_ENABLED(CONFIG_RELOCATABLE))
-		relocate(KERNELBASE);
+	relocate(KERNELBASE);
 
 	ret = enter_secure_mode(kbase, fdt);
 
 	/* Relocate the kernel again. */
-	if (IS_ENABLED(CONFIG_RELOCATABLE))
-		relocate(kbase);
+	relocate(kbase);
 
 	if (ret != U_SUCCESS) {
 		prom_printf("Returned %d from switching to secure mode.\n", ret);
@@ -3359,8 +3309,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 #ifdef CONFIG_PPC32
 	unsigned long offset = reloc_offset();
 	reloc_got2(offset);
-#else
-	reloc_toc();
 #endif
 
 	/*
@@ -3537,8 +3485,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 
 #ifdef CONFIG_PPC32
 	reloc_got2(-offset);
-#else
-	unreloc_toc();
 #endif
 
 	/* Move to secure memory if we're supposed to be secure guests. */
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 2f071fb9694c..e02d29a9d12f 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -51,6 +51,7 @@ config PPC_NATIVE
 config PPC_OF_BOOT_TRAMPOLINE
 	bool "Support booting from Open Firmware or yaboot"
 	depends on PPC_BOOK3S_32 || PPC64
+	select RELOCATABLE if PPC64
 	default y
 	help
 	  Support from booting from Open Firmware or yaboot using an
-- 
2.25.1

