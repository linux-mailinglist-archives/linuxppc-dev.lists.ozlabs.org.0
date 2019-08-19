Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7215891D47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 08:42:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bkr225cTzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:42:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NOZaBBXr"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bknp6NrTzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 16:40:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Bknd2y6kz9ty3R;
 Mon, 19 Aug 2019 08:40:21 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NOZaBBXr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OMD3V-L3p4ax; Mon, 19 Aug 2019 08:40:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Bknd1t7Rz9ty3Q;
 Mon, 19 Aug 2019 08:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566196821; bh=sCAmNTzDss97fNELC7ORUanTnOz6STab8w1eA0xcMnw=;
 h=From:Subject:To:Cc:Date:From;
 b=NOZaBBXrZ7XxbXVASCbXaAEy1ZKDbgT94TY0hY6DBsdDS5TEpcsr9v9kM8Pi0M3Vl
 febjtBiOqF9gfoAYkHKJv7US6pMEyVQCLl99FyLSmncWgMh3MPyoLU/UFxhmD6yW4L
 GZ3xWsWUXOPwsqCa1IG2bDliVD2IXKRwDX2ux7Mc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3653B8B74F;
 Mon, 19 Aug 2019 08:40:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ucq29RtvVw9g; Mon, 19 Aug 2019 08:40:26 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D2158B781;
 Mon, 19 Aug 2019 08:40:26 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E6C3D6B700; Mon, 19 Aug 2019 06:40:25 +0000 (UTC)
Message-Id: <80432f71194d7ee75b2f5043ecf1501cf1cca1f3.1566196646.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/603: fix handling of the DIRTY flag
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Doug Crawford <doug.crawford@intelight-its.com>
Date: Mon, 19 Aug 2019 06:40:25 +0000 (UTC)
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

If a page is already mapped RW without the DIRTY flag, the DIRTY
flag is never set and a TLB store miss exception is taken forever.

This is easily reproduced with the following app:

void main(void)
{
	volatile char *ptr = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);

	*ptr = *ptr;
}

When DIRTY flag is not set, bail out of TLB miss handler and take
a minor page fault which will set the DIRTY flag.

Fixes: f8b58c64eaef ("powerpc/603: let's handle PAGE_DIRTY directly")
Cc: stable@vger.kernel.org
Reported-by: Doug Crawford <doug.crawford@intelight-its.com>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index f255e22184b4..534dd2718795 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -557,9 +557,9 @@ DataStoreTLBMiss:
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SPRG_PGDIR
 #ifdef CONFIG_SWAP
-	li	r1, _PAGE_RW | _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 #else
-	li	r1, _PAGE_RW | _PAGE_PRESENT
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT
 #endif
 	bge-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-- 
2.13.3

