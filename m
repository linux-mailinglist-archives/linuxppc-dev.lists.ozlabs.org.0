Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73F1E859
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:40:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lLS75gVzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="wQms0IPJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lK61W6CzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:39:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453lK20C3zz9vDbY;
 Wed, 15 May 2019 08:39:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wQms0IPJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3DRM9uJUoSn2; Wed, 15 May 2019 08:39:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453lK16GX3z9vDbX;
 Wed, 15 May 2019 08:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557902373; bh=Zd27inkpqKePc2+nFWhyuVIMsjs4o0Gzg4fEJKN3i/A=;
 h=From:Subject:To:Cc:Date:From;
 b=wQms0IPJnsjs5nVr3KKKWGy7/NZg2G0sOi8XTexKND+7IBvtIWN1srXGiZTqu7HqH
 T7mz0UppbStgGd81j+ybMxdP0h8uDr0aUCHIePoJJFq1ghHu0hO858z7/xoQ8lb3+e
 5Ee7vi+QuOEjjnqirN4jYkKWDTuZymFP7ZKVlwak=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C853F8B7D6;
 Wed, 15 May 2019 08:39:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t7GC_JjvUzXO; Wed, 15 May 2019 08:39:34 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACD968B7D2;
 Wed, 15 May 2019 08:39:34 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 921AD67F2C; Wed, 15 May 2019 06:39:34 +0000 (UTC)
Message-Id: <629c2acb1fcd09c2d2e3352370c3d9853372cf39.1557902321.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/lib: fix book3s/32 boot failure due to code patching
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg KH <gregkh@linuxfoundation.org>, erhard_f@mailbox.org,
 Michael Neuling <mikey@neuling.org>
Date: Wed, 15 May 2019 06:39:34 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Backport of upstream commit b45ba4a51cde29b2939365ef0c07ad34c8321789]

On powerpc32, patch_instruction() is called by apply_feature_fixups()
which is called from early_init()

There is the following note in front of early_init():
 * Note that the kernel may be running at an address which is different
 * from the address that it was linked at, so we must use RELOC/PTRRELOC
 * to access static data (including strings).  -- paulus

Therefore init_mem_is_free must be accessed with PTRRELOC()

Fixes: 1c38a84d4586 ("powerpc: Avoid code patching freed init sections")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=203597
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
Can't apply the upstream commit as such due to several other unrelated stuff
like for instance STRICT_KERNEL_RWX which are missing.
So instead, using same approach as for commit 252eb55816a6f69ef9464cad303cdb3326cdc61d
---
 arch/powerpc/lib/code-patching.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 14535ad4cdd1..c312955977ce 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -23,7 +23,7 @@ int patch_instruction(unsigned int *addr, unsigned int instr)
 	int err;
 
 	/* Make sure we aren't patching a freed init section */
-	if (init_mem_is_free && init_section_contains(addr, 4)) {
+	if (*PTRRELOC(&init_mem_is_free) && init_section_contains(addr, 4)) {
 		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
 		return 0;
 	}
-- 
2.13.3

