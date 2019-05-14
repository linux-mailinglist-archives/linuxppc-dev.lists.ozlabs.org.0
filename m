Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC61C680
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:59:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Cnv6mblzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kOrYHCkh"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453Clz2bTPzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 19:57:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453Clr5yD4z9v0TK;
 Tue, 14 May 2019 11:57:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kOrYHCkh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id c-3CfmneCcBP; Tue, 14 May 2019 11:57:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453Clr4r8Yz9v0TH;
 Tue, 14 May 2019 11:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557827848; bh=zdtPGnm0T+yqlNrTgap6lTyGHmJafiFoK18Yujn2KhA=;
 h=From:Subject:To:Cc:Date:From;
 b=kOrYHCkhSzVoASUtlWDdYLIDHptcgdYBkPtEksoJyadmmFJpEm9G0TuN9DyXSzbxR
 CjupuowWE4ZoBoMuxTBdubYcPQimOgvYfPXH5R9UzePD8KLSaT3aIoGuSkUPs22VPU
 Oy24lNTd9+MPz770QPzeaGVvTsD84XJHo2/x8VTc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C45DB8B8BE;
 Tue, 14 May 2019 11:57:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0CAJZaYdHSQT; Tue, 14 May 2019 11:57:29 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C2418B7C1;
 Tue, 14 May 2019 11:57:29 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 437DB67F68; Tue, 14 May 2019 09:57:29 +0000 (UTC)
Message-Id: <015040d922a68fa15c81879cc2fc9ed7ac106e60.1557827275.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH stable 4.9] powerpc/lib: fix code patching during early init
 on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg KH <gregkh@linuxfoundation.org>, erhard_f@mailbox.org,
 Michael Neuling <mikey@neuling.org>
Date: Tue, 14 May 2019 09:57:29 +0000 (UTC)
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
Can't apply the upstream commit as such due to several of other unrelated stuff
like STRICT_KERNEL_RWX which are missing for instance.
So instead, using same approach as for commit 252eb55816a6f69ef9464cad303cdb3326cdc61d

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

