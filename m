Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA13AFC14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 14:02:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T0sD44w7zF352
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 22:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T0m93XfzzF33T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 21:58:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="aSYcB3p8"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46T0m92h2vz9sDB; Wed, 11 Sep 2019 21:58:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46T0m90xyXz9sNF; Wed, 11 Sep 2019 21:58:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568203113;
 bh=fq8fQ22sZ/nyxorllJO6Q77Ryp80lsBaQrxTm1scNks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aSYcB3p8kSf3w4axofVVHUqrTb7pKuCteerz4+YKYzIs2aOzNEa6HapIdArGixeL2
 B99z8jtMAVgFBx3j0v8NL9rYN1DVnAxWGyoS3XJY6wbrjTMnnHrfmw4l1mld9QNKNq
 3KBfCjjFwz90iNMfkgg4oRkxqUGO19N8ddomkVgvPmHMcD0d0DFUY7Rx8nfnwJVhWU
 A/9+LlNqg09vNoVwUl1+T5N0tNkmAM7uxC49P572rLG7s3QK1P3AH1cd1+EniK2jrw
 fNICh3zRufz2l+gq8qjSadpxpyON9YkoNauS4efy0QprR5Kw7LmqNJqaXgjCBzTaDx
 XdkBidtk2zGEw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: Remove overlaps_kvm_tmp()
Date: Wed, 11 Sep 2019 21:57:44 +1000
Message-Id: <20190911115746.12433-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911115746.12433-1-mpe@ellerman.id.au>
References: <20190911115746.12433-1-mpe@ellerman.id.au>
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
Cc: cai@lca.pw, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvm_tmp is now in .text and so doesn't need a special overlap check.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/sections.h   | 11 -----------
 arch/powerpc/mm/book3s64/hash_utils.c |  4 ----
 2 files changed, 15 deletions(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 4a1664a8658d..5a9b6eb651b6 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -61,17 +61,6 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
 		(unsigned long)_stext < end;
 }
 
-static inline int overlaps_kvm_tmp(unsigned long start, unsigned long end)
-{
-#ifdef CONFIG_KVM_GUEST
-	extern char kvm_tmp[];
-	return start < (unsigned long)kvm_tmp &&
-		(unsigned long)&kvm_tmp[1024 * 1024] < end;
-#else
-	return 0;
-#endif
-}
-
 #ifdef PPC64_ELF_ABI_v1
 
 #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b8ad14bb1170..1be0622a1f38 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -271,10 +271,6 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 		if (overlaps_kernel_text(vaddr, vaddr + step))
 			tprot &= ~HPTE_R_N;
 
-		/* Make kvm guest trampolines executable */
-		if (overlaps_kvm_tmp(vaddr, vaddr + step))
-			tprot &= ~HPTE_R_N;
-
 		/*
 		 * If relocatable, check if it overlaps interrupt vectors that
 		 * are copied down to real 0. For relocatable kernel
-- 
2.21.0

