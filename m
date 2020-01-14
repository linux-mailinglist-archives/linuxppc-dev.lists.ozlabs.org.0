Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18C13A2A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 09:15:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xjty0vSqzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 19:15:22 +1100 (AEDT)
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
 header.s=mail header.b=l4r9J0yC; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xjrT6wFSzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 19:13:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xjrP2Dw5z9txpt;
 Tue, 14 Jan 2020 09:13:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=l4r9J0yC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZA4-nlv4eVuX; Tue, 14 Jan 2020 09:13:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xjrP1BwVz9txpr;
 Tue, 14 Jan 2020 09:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578989589; bh=/7x/mycY9dv8CNXkK/5+j4m894fmSmqk/jtK+1OjjHA=;
 h=From:Subject:To:Cc:Date:From;
 b=l4r9J0yCVpu7NK0emogqymwSAxTQMbXHpQ3o/qn2ZXKGN6eqt6S0WJ7Bt03mSow2P
 zQvXT9F+5CHYFTmMBs30ok3fMKF2jKaLzPoAnw5IVG/PMqMBW9CoYcuNCPRqka/oQL
 89ZpXcThea2AfvixAwxyST5n95cybXvZs9Lk9Agg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 295318B7D1;
 Tue, 14 Jan 2020 09:13:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ipU9AATOC6P7; Tue, 14 Jan 2020 09:13:10 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED3EB8B769;
 Tue, 14 Jan 2020 09:13:09 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C04FD64A20; Tue, 14 Jan 2020 08:13:09 +0000 (UTC)
Message-Id: <0d894839fdbb19070f0e1e4140363be4f2bb62fc.1578989540.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/ptdump: fix W+X verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 14 Jan 2020 08:13:09 +0000 (UTC)
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

Verification cannot rely on simple bit checking because on some
platforms PAGE_RW is 0, checking that a page is not W means
checking that PAGE_RO is set instead of checking that PAGE_RW
is not set.

Use pte helpers instead of checking bits.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 453d87f6a8ae ("powerpc/mm: Warn if W+X pages found on boot")
---
 arch/powerpc/mm/ptdump/ptdump.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 4af0d5d9589e..206156255247 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -175,10 +175,12 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 
 static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
+	pte_t pte = __pte(st->current_flags);
+
 	if (!IS_ENABLED(CONFIG_PPC_DEBUG_WX) || !st->check_wx)
 		return;
 
-	if (!((st->current_flags & pgprot_val(PAGE_KERNEL_X)) == pgprot_val(PAGE_KERNEL_X)))
+	if (!pte_write(pte) || !pte_exec(pte))
 		return;
 
 	WARN_ONCE(1, "powerpc/mm: Found insecure W+X mapping at address %p/%pS\n",
-- 
2.13.3

