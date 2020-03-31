Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC2199B5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:23:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sF4m33J4zDqQh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:23:36 +1100 (AEDT)
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
 header.s=mail header.b=dsK++CkO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDdt1LrwzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:03:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sDdn22Hjz9twdb;
 Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dsK++CkO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9Zz3L44BCPIq; Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sDdn0bVXz9twdT;
 Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585670621; bh=pFa685KlyWN06RXEcsNIfZ77QAkrvTD2C1XmlgN6mts=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=dsK++CkOlYibJbMVX8NFiMu/TUejAXt0mqm8IyGN3TqNoLurJ6RbC3vYXjq/0nLZr
 eu7K5u0DjjBmuHS0vDVKRmNmY3oUifncDNzd42opm5S/kb4J6Xfq71RsZYYldsjHiG
 LqS8jevI44HlMkh+igGFoAh0t6bJfCjmXk+TQnAc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B69488B86A;
 Tue, 31 Mar 2020 18:03:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rx_Q8XDoQ7PK; Tue, 31 Mar 2020 18:03:42 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DC8A8B868;
 Tue, 31 Mar 2020 18:03:42 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6D6DA656AC; Tue, 31 Mar 2020 16:03:42 +0000 (UTC)
Message-Id: <dabed523c1b8955dd425152ce260b390053e727a.1585670437.git.christophe.leroy@c-s.fr>
In-Reply-To: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 07/12] powerpc/32s: Blacklist functions running with MMU
 disabled for kprobe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 31 Mar 2020 16:03:42 +0000 (UTC)
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
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
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

