Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E085326E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:59:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ2xX1SHxz3dXb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ2x32LSfz2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 00:58:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TZ2ww1CDMz9sVS;
	Tue, 13 Feb 2024 14:58:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1E_EeBkDSIX; Tue, 13 Feb 2024 14:58:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TZ2ww0Zntz9sB2;
	Tue, 13 Feb 2024 14:58:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F7078B77C;
	Tue, 13 Feb 2024 14:58:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JKHH19f2aSBj; Tue, 13 Feb 2024 14:58:40 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A89BA8B77A;
	Tue, 13 Feb 2024 14:58:39 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
Date: Tue, 13 Feb 2024 14:58:37 +0100
Message-ID: <bbd84ad52bf377e8d3b5865a906f2dc5d99964ba.1707832677.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707832717; l=2386; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=kv2uFLc6+Eb7crZB0DwT0EbAmO8DVB3Gjl+I/8V/mOI=; b=CNnbjJVQQZei8836DNMFYQzpXNX9HGWQZ2qITCeZPH6qZb3LJxSoMNxYif7L/PhiUI63WzKR6 fS0Wc5G6o0vBgO59ZJi4YOgMdzbTJOQpDp3j0AEqa4qfFOQmbWbxZal
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch_vmap_pud_supported() and arch_vmap_pmd_supported() are
expected to constant-fold to false when RADIX is not enabled.

Force inlining in order to avoid following failure which
leads to unexpected call of non-existing pud_set_huge() and
pmd_set_huge() on powerpc 8xx.

In function 'pud_huge_tests',
    inlined from 'debug_vm_pgtable' at mm/debug_vm_pgtable.c:1399:2:
./arch/powerpc/include/asm/vmalloc.h:9:33: warning: inlining failed in call to 'arch_vmap_pud_supported.isra': call is unlikely and code size would grow [-Winline]
    9 | #define arch_vmap_pud_supported arch_vmap_pud_supported
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
./arch/powerpc/include/asm/vmalloc.h:10:20: note: in expansion of macro 'arch_vmap_pud_supported'
   10 | static inline bool arch_vmap_pud_supported(pgprot_t prot)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
./arch/powerpc/include/asm/vmalloc.h:9:33: note: called from here
    9 | #define arch_vmap_pud_supported arch_vmap_pud_supported
mm/debug_vm_pgtable.c:458:14: note: in expansion of macro 'arch_vmap_pud_supported'
  458 |         if (!arch_vmap_pud_supported(args->page_prot) ||
      |              ^~~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402131836.OU1TDuoi-lkp@intel.com/
Fixes: 8309c9d71702 ("powerpc: inline huge vmap supported functions")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vmalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
index 4c69ece52a31..59ed89890c90 100644
--- a/arch/powerpc/include/asm/vmalloc.h
+++ b/arch/powerpc/include/asm/vmalloc.h
@@ -7,14 +7,14 @@
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 
 #define arch_vmap_pud_supported arch_vmap_pud_supported
-static inline bool arch_vmap_pud_supported(pgprot_t prot)
+static __always_inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
 	/* HPT does not cope with large pages in the vmalloc area */
 	return radix_enabled();
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
-static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+static __always_inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	return radix_enabled();
 }
-- 
2.43.0

