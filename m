Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D081F109F1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 14:19:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MkyM16CHzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 00:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tQ0qhDKU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mk0l5HmpzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 23:36:23 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mk0d3zr6z9v0GF;
 Tue, 26 Nov 2019 13:36:17 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tQ0qhDKU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ESRVT72F2IAT; Tue, 26 Nov 2019 13:36:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mk0d2mFsz9v0G3;
 Tue, 26 Nov 2019 13:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574771777; bh=qRvylrdY1eoWCvXWdblIuIfpjDppGXhuUd6oPfPcO7c=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tQ0qhDKUAmxnmr94/uWODgTkbZt7bx0AScwLnHdHLeiqeuGzHBwfqYHbzqlhVzfq5
 6YZWi17oElvUHLHtlNaP2ncLyyQOjKSFIPu+itay0A+tQ+ZRvkD2SCybU53vZ2Tmcx
 ZSQh3Eiyy7lIaK+a1PfucgCf7jRf8KyZ9LPZRd4o=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC40E8B7FF;
 Tue, 26 Nov 2019 13:36:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yks6Q9RGG00r; Tue, 26 Nov 2019 13:36:18 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 792638B771;
 Tue, 26 Nov 2019 13:36:18 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4CF7C6B76A; Tue, 26 Nov 2019 12:36:18 +0000 (UTC)
Message-Id: <b07098858befd1384ff66a6cc13cbf7e09f3e5fa.1574771541.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1574771539.git.christophe.leroy@c-s.fr>
References: <cover.1574771539.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 14/16] powerpc/32s: reorganise DSI handler.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 26 Nov 2019 12:36:18 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The part decidated to handling hash_page() is fully unneeded for
processors not having real hash pages like the 603.

Lets enlarge the content of the feature fixup, and provide
an alternative which jumps directly instead of getting NIPs.

Also, in preparation of VMAP stacks, the end of DSI handler has moved
to later in the code as it won't fit anymore once VMAP stacks
are there.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 449625b4ff03..7ec780858299 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -295,24 +295,20 @@ __secondary_hold_acknowledge:
 	DO_KVM  0x300
 DataAccess:
 	EXCEPTION_PROLOG
-	mfspr	r10,SPRN_DSISR
-	stw	r10,_DSISR(r11)
+	get_and_save_dar_dsisr_on_stack	r4, r5, r11
+BEGIN_MMU_FTR_SECTION
 #ifdef CONFIG_PPC_KUAP
-	andis.	r0,r10,(DSISR_BAD_FAULT_32S | DSISR_DABRMATCH | DSISR_PROTFAULT)@h
+	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH | DSISR_PROTFAULT)@h
 #else
-	andis.	r0,r10,(DSISR_BAD_FAULT_32S|DSISR_DABRMATCH)@h
+	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
 #endif
-	bne	1f			/* if not, try to put a PTE */
-	mfspr	r4,SPRN_DAR		/* into the hash table */
-	rlwinm	r3,r10,32-15,21,21	/* DSISR_STORE -> _PAGE_RW */
-BEGIN_MMU_FTR_SECTION
+	bne	handle_page_fault_tramp_2	/* if not, try to put a PTE */
+	rlwinm	r3, r5, 32 - 15, 21, 21		/* DSISR_STORE -> _PAGE_RW */
 	bl	hash_page
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
-1:	lwz	r5,_DSISR(r11)		/* get DSISR value */
-	mfspr	r4,SPRN_DAR
-	stw	r4, _DAR(r11)
-	EXC_XFER_LITE(0x300, handle_page_fault)
-
+	b	handle_page_fault_tramp_1
+FTR_SECTION_ELSE
+	b	handle_page_fault_tramp_2
+ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 
 /* Instruction access exception. */
 	. = 0x400
@@ -642,6 +638,13 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 
 	. = 0x3000
 
+handle_page_fault_tramp_1:
+	lwz	r4, _DAR(r11)
+	lwz	r5, _DSISR(r11)
+	/* fall through */
+handle_page_fault_tramp_2:
+	EXC_XFER_LITE(0x300, handle_page_fault)
+
 AltiVecUnavailable:
 	EXCEPTION_PROLOG
 #ifdef CONFIG_ALTIVEC
-- 
2.13.3

