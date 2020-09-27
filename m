Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5227A059
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:50:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgqT2KZHzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg532XX4zDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4v5Bd4z9vCy7;
 Sun, 27 Sep 2020 11:16:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TupNUypj6y0x; Sun, 27 Sep 2020 11:16:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4v4SbYz9vCxw;
 Sun, 27 Sep 2020 11:16:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3664D8B771;
 Sun, 27 Sep 2020 11:16:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I-YkZQShlrs7; Sun, 27 Sep 2020 11:16:36 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C796A8B75B;
 Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AC1E565DE8; Sun, 27 Sep 2020 09:16:35 +0000 (UTC)
Message-Id: <4c7dcc6544882761b2b0249d7a8ec2c3a8088cb5.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 18/30] powerpc/vdso: Merge __kernel_sync_dicache_p5() into
 __kernel_sync_dicache()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:35 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__kernel_sync_dicache_p5() is an alternative to
__kernel_sync_dicache() when cpu has CPU_FTR_COHERENT_ICACHE

Remove this alternative function and merge
__kernel_sync_dicache_p5() into __kernel_sync_dicache() using
standard CPU feature fixup.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c              |  4 ----
 arch/powerpc/kernel/vdso32/cacheflush.S | 17 ++++++-----------
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  1 -
 arch/powerpc/kernel/vdso64/cacheflush.S | 16 ++++++----------
 arch/powerpc/kernel/vdso64/vdso64.lds.S |  1 -
 5 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index ba2b935a67f6..3a4fbcc0d1be 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -87,10 +87,6 @@ struct vdso_patch_def
  * with a coherent icache
  */
 static struct vdso_patch_def vdso_patches[] = {
-	{
-		CPU_FTR_COHERENT_ICACHE, CPU_FTR_COHERENT_ICACHE,
-		"__kernel_sync_dicache", "__kernel_sync_dicache_p5"
-	},
 };
 
 /*
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/vdso32/cacheflush.S
index 017843bf5382..f340e82d1981 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
@@ -24,11 +24,15 @@
  */
 V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
+BEGIN_FTR_SECTION
+	b	3f
+END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 #ifdef CONFIG_PPC64
 	mflr	r12
   .cfi_register lr,r12
 	get_datapage	r10
 	mtlr	r12
+  .cfi_restore	lr
 #endif
 
 #ifdef CONFIG_PPC64
@@ -84,20 +88,11 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 	isync
 	li	r3,0
 	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_sync_dicache)
-
-
-/*
- * POWER5 version of __kernel_sync_dicache
- */
-V_FUNCTION_BEGIN(__kernel_sync_dicache_p5)
-  .cfi_startproc
+3:
 	crclr	cr0*4+so
 	sync
 	isync
 	li	r3,0
 	blr
   .cfi_endproc
-V_FUNCTION_END(__kernel_sync_dicache_p5)
-
+V_FUNCTION_END(__kernel_sync_dicache)
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index dd9f262e07c6..c70f5dac8c98 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -163,7 +163,6 @@ VERSION
 		__kernel_get_tbfreq;
 #endif
 		__kernel_sync_dicache;
-		__kernel_sync_dicache_p5;
 		__kernel_sigtramp32;
 		__kernel_sigtramp_rt32;
 #if defined(CONFIG_PPC64) || !defined(CONFIG_SMP)
diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/vdso64/cacheflush.S
index 61985de5758f..76c3c8cf8ece 100644
--- a/arch/powerpc/kernel/vdso64/cacheflush.S
+++ b/arch/powerpc/kernel/vdso64/cacheflush.S
@@ -23,10 +23,14 @@
  */
 V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
+BEGIN_FTR_SECTION
+	b	3f
+END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	mflr	r12
   .cfi_register lr,r12
 	get_datapage	r10
 	mtlr	r12
+  .cfi_restore lr
 
 	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
 	addi	r5,r7,-1
@@ -61,19 +65,11 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 	isync
 	li	r3,0
 	blr
-  .cfi_endproc
-V_FUNCTION_END(__kernel_sync_dicache)
-
-
-/*
- * POWER5 version of __kernel_sync_dicache
- */
-V_FUNCTION_BEGIN(__kernel_sync_dicache_p5)
-  .cfi_startproc
+3:
 	crclr	cr0*4+so
 	sync
 	isync
 	li	r3,0
 	blr
   .cfi_endproc
-V_FUNCTION_END(__kernel_sync_dicache_p5)
+V_FUNCTION_END(__kernel_sync_dicache)
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index e950bf68783a..a049000eacfe 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -159,7 +159,6 @@ VERSION
 		__kernel_clock_getres;
 		__kernel_get_tbfreq;
 		__kernel_sync_dicache;
-		__kernel_sync_dicache_p5;
 		__kernel_sigtramp_rt64;
 		__kernel_getcpu;
 		__kernel_time;
-- 
2.25.0

