Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516116B7F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 04:15:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RPF35SlyzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 14:15:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RPCJ6bgzzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 14:13:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QE6jVcOm; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RPCJ5SZJz9sPK; Tue, 25 Feb 2020 14:13:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RPCJ4p4Sz9sQt; Tue, 25 Feb 2020 14:13:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582600412;
 bh=6n7fBGk5fVx/DZJXvJgd1jCLEzrUCRAMHQ1Oo6snhsY=;
 h=From:To:Subject:Date:From;
 b=QE6jVcOmtKKokKTjGyB3VAONxZBbN/hnH2pFTFOponVa7Fe7KzHRV9jf3FlmlYhIK
 SptCfzRJuDv1tPDeDQAd/B/q0wN5glv01E1x2XeFGgbtGtc+haRj2P/gbv9DKQvekf
 CWuSlN2u9fNkSxaykCAdm5ggAQcvcnkpO+v/U1eCkTqee7XU9P7wt7Tleu/5X1Aueo
 mzuXD63nw11DeHjlLd+s5uv9ZXnZ3ZnDvIryhIjcbro4VcKAbrlqO8fgUDlN9+mjOi
 kXzKkjNvsFA8zrD1XdJ/brNVd1/eiZidMLWdJjeruaEk7b3nZXsP0CZTKE/9tTzvVY
 vIozOGTFKB2Sg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64s: Fix section mismatch warnings from boot code
Date: Tue, 25 Feb 2020 14:13:28 +1100
Message-Id: <20200225031328.14676-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We currently have two section mismatch warnings:

  The function __boot_from_prom() references
  the function __init prom_init().

  The function start_here_common() references
  the function __init start_kernel().

The warnings are correct, we do have branches from non-init code into
init code, which is freed after boot. But we don't expect to ever
execute any of that early boot code after boot, if we did that would
be a bug. In particular calling into OF after boot would be fatal
because OF is no longer resident.

So for now fix the warnings by marking the relevant functions as
__REF, which puts them in the ".ref.text" section.

This causes some reordering of the functions in the final link:

  @@ -217,10 +217,9 @@
   c00000000000b088 t generic_secondary_common_init
   c00000000000b124 t __mmu_off
   c00000000000b14c t __start_initialization_multiplatform
  -c00000000000b1ac t __boot_from_prom
  -c00000000000b1ec t __after_prom_start
  -c00000000000b260 t p_end
  -c00000000000b27c T copy_and_flush
  +c00000000000b1ac t __after_prom_start
  +c00000000000b220 t p_end
  +c00000000000b23c T copy_and_flush
   c00000000000b300 T __secondary_start
   c00000000000b300 t copy_to_here
   c00000000000b344 t start_secondary_prolog
  @@ -228,8 +227,9 @@
   c00000000000b36c t enable_64b_mode
   c00000000000b388 T relative_toc
   c00000000000b3a8 t p_toc
  -c00000000000b3b0 t start_here_common
  -c00000000000b3d0 t start_here_multiplatform
  +c00000000000b3b0 t __boot_from_prom
  +c00000000000b3f0 t start_here_multiplatform
  +c00000000000b480 t start_here_common
   c00000000000b880 T system_call_common
   c00000000000b974 t system_call
   c00000000000b9dc t system_call_exit

In particular __boot_from_prom moves after copy_to_here, which means
it's not copied to zero in the first stage of copy of the kernel to
zero.

But that's OK, because we only call __boot_from_prom before we do the
copy, so it makes no difference when it's copied. The call sequence
is:
  __start
  -> __start_initialization_multiplatform
     -> __boot_from_prom
        -> __start
           -> __start_initialization_multiplatform
              -> __after_prom_start
                 -> copy_and_flush
                 -> copy_and_flush (relocated to 0)
                    -> start_here_multiplatform
                       -> early_setup

Reported-by: Mauricio Faria de Oliveira <mauricfo@linux.ibm.com>
Reported-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/head_64.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ad79fddb974d..ddfbd02140d9 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -537,6 +537,7 @@ _GLOBAL(generic_secondary_smp_init)
 	b	__after_prom_start
 #endif /* CONFIG_PPC_BOOK3E */
 
+__REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
 	/* Save parameters */
@@ -574,6 +575,7 @@ _GLOBAL(generic_secondary_smp_init)
 	/* We never return. We also hit that trap if trying to boot
 	 * from OF while CONFIG_PPC_OF_BOOT_TRAMPOLINE isn't selected */
 	trap
+	.previous
 
 __after_prom_start:
 #ifdef CONFIG_RELOCATABLE
@@ -977,7 +979,6 @@ __REF
 	RFI
 	b	.	/* prevent speculative execution */
 
-	.previous
 	/* This is where all platforms converge execution */
 
 start_here_common:
@@ -1001,6 +1002,7 @@ __REF
 	/* Not reached */
 	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
+	.previous
 
 /*
  * We put a few things here that have to be page-aligned.
-- 
2.21.1

