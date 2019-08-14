Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE168CAA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 07:30:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467dT11YvDzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SJyMuRjs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467dRH4Gy6zDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:28:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467dR73hPVz9tysX;
 Wed, 14 Aug 2019 07:28:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SJyMuRjs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Emf7ZwD-8uSz; Wed, 14 Aug 2019 07:28:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467dR72Wgqz9tysW;
 Wed, 14 Aug 2019 07:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565760515; bh=cBLCcGqZYtPFnQ97sG88gUvqoP0qZ97rvAj0rE6pSks=;
 h=From:Subject:To:Cc:Date:From;
 b=SJyMuRjslWkUbJFg1pNT8CdaiFoiuf/pZlvJ48iRmVZg1OrtgYda2dXfwEw6T5Dle
 VaC0GFZxrDuy7QAsYlM21BPatf+5FHDgsKV6fqR6WKasa1ITTeyRjpCRrNDwn5i6nt
 fTJq/9vJXUsebUihn5XXaOFBHm3WzXiBmw/zar+8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 42B778B780;
 Wed, 14 Aug 2019 07:28:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 79kopmmf8McE; Wed, 14 Aug 2019 07:28:36 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2612A8B761;
 Wed, 14 Aug 2019 07:28:36 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EEEDB69635; Wed, 14 Aug 2019 05:28:35 +0000 (UTC)
Message-Id: <8c83a4e1237658ed1acfb9a9891048a15f9ca36b.1565760495.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: fix boot failure with DEBUG_PAGEALLOC without
 KASAN.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 j.neuschaefer@gmx.net
Date: Wed, 14 Aug 2019 05:28:35 +0000 (UTC)
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

When KASAN is selected, the definitive hash table has to be
set up later, but there is already an early temporary one.

When KASAN is not selected, there is no early hash table,
so the setup of the definitive hash table cannot be delayed.

Reported-by: Jonathan Neuschafer <j.neuschaefer@gmx.net>
Fixes: 72f208c6a8f7 ("powerpc/32s: move hash code patching out of MMU_init_hw()")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S  | 2 ++
 arch/powerpc/mm/book3s32/mmu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index f255e22184b4..c8b4f7ed318c 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -897,9 +897,11 @@ start_here:
 	bl	machine_init
 	bl	__save_cpu_setup
 	bl	MMU_init
+#ifdef CONFIG_KASAN
 BEGIN_MMU_FTR_SECTION
 	bl	MMU_init_hw_patch
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 
 /*
  * Go back to running unmapped so we can load up new values
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index e249fbf6b9c3..6ddcbfad5c9e 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -358,6 +358,11 @@ void __init MMU_init_hw(void)
 	hash_mb2 = hash_mb = 32 - LG_HPTEG_SIZE - lg_n_hpteg;
 	if (lg_n_hpteg > 16)
 		hash_mb2 = 16 - LG_HPTEG_SIZE;
+
+	if (IS_ENABLED(CONFIG_KASAN))
+		return;
+
+	MMU_init_hw_patch();
 }
 
 void __init MMU_init_hw_patch(void)
-- 
2.13.3

