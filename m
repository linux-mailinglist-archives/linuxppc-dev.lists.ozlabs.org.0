Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06464196C3F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 11:52:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qrTm6nqyzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 20:51:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=B7fO6e/l; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qrFQ3xxyzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 20:41:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qrFF0t4mz9v0BN;
 Sun, 29 Mar 2020 11:41:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=B7fO6e/l; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0eZWStLjMwJh; Sun, 29 Mar 2020 11:41:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qrFD6zw1z9v0BM;
 Sun, 29 Mar 2020 11:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585474865; bh=0vpkTM3tG4ZjR3EO0VSRgC2cVNSmlLYTzT4l2ju++yE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=B7fO6e/lzSO+Jr7vrYMePI6nNuSMihzfcElYNvC3AM58LyO1I0rxJihkh2Xxu563q
 l6zvkPDEJWGZDBQhgW2qESULsgIP6sqOuvGclc4r4im0ogz0/iHjVfPxxZan7W8jPz
 MJCuZXeoJNpvYA4W48H/dfJ67sVRvUvAxIBB+FIw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E623F8B770;
 Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PhpRDFB6ViKG; Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B288C8B752;
 Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8538E65653; Sun, 29 Mar 2020 09:41:07 +0000 (UTC)
Message-Id: <16b177dc702570a1ef896857fd53b82bfdc7fd5d.1585474724.git.christophe.leroy@c-s.fr>
In-Reply-To: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 07/12] powerpc/32s: Blacklist functions running with MMU
 disabled for kprobe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Sun, 29 Mar 2020 09:41:07 +0000 (UTC)
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

kprobe does not handle events happening in real mode, all
functions running with MMU disabled have to be blacklisted.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/book3s32/hash_low.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 2afa3fa2012d..f5f836477009 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -163,6 +163,7 @@ _GLOBAL(hash_page)
 	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
 	blr
 #endif /* CONFIG_SMP */
+_ASM_NOKPROBE_SYMBOL(hash_page)
 
 /*
  * Add an entry for a particular page to the hash table.
@@ -267,6 +268,7 @@ _GLOBAL(add_hash_page)
 	lwz	r0,4(r1)
 	mtlr	r0
 	blr
+_ASM_NOKPROBE_SYMBOL(add_hash_page)
 
 /*
  * This routine adds a hardware PTE to the hash table.
@@ -472,6 +474,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 
 	sync		/* make sure pte updates get to memory */
 	blr
+_ASM_NOKPROBE_SYMBOL(create_hpte)
 
 	.section .bss
 	.align	2
@@ -628,6 +631,7 @@ _GLOBAL(flush_hash_pages)
 	isync
 	blr
 EXPORT_SYMBOL(flush_hash_pages)
+_ASM_NOKPROBE_SYMBOL(flush_hash_pages)
 
 /*
  * Flush an entry from the TLB
@@ -665,6 +669,7 @@ _GLOBAL(_tlbie)
 	sync
 #endif /* CONFIG_SMP */
 	blr
+_ASM_NOKPROBE_SYMBOL(_tlbie)
 
 /*
  * Flush the entire TLB. 603/603e only
@@ -706,3 +711,4 @@ _GLOBAL(_tlbia)
 	isync
 #endif /* CONFIG_SMP */
 	blr
+_ASM_NOKPROBE_SYMBOL(_tlbia)
-- 
2.25.0

