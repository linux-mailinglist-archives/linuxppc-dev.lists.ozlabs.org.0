Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9F8D352
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:39:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467pzm4vPFzDqrT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 22:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="M1CfgpGd"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467pwc1ZG1zDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 22:36:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467pwW3NxJz9v0QX;
 Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=M1CfgpGd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zL9cEQFFkHXo; Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467pwW2Fkdz9v0dJ;
 Wed, 14 Aug 2019 14:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565786171; bh=FQUyM6c7VYcuMFXgP9DLplR+JJixkhgbCHgFtfjWXKI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=M1CfgpGd+59YMGG2W3jHT6lt4augCL1HrXFI/qdUfyYvag/qTpQyDcKVJgtXrTS6L
 mVkfJj+eOkxRDJjD4VLoe8cKv2cfrAXT9bKnPipM2Wb0+o+kDKKk7nii3PhS2gBfMa
 gH96bfUKLqnLxpO5/sOuCeT+0HZ/zb33ek0OYUdY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCCA58B7F5;
 Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id T43b992SB-7o; Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF41D8B761;
 Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A92906B6C0; Wed, 14 Aug 2019 12:36:12 +0000 (UTC)
Message-Id: <ff6c8f631bd4ce3a10e0cc241eb569816187bc20.1565786091.git.christophe.leroy@c-s.fr>
In-Reply-To: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
References: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/5] powerpc/ptdump: get out of note_prot_wx() when
 CONFIG_PPC_DEBUG_WX is not selected.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Aug 2019 12:36:12 +0000 (UTC)
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

When CONFIG_PPC_DEBUG_WX, note_prot_wx() is useless.

Get out of it early and inconditionnally in that case,
so that GCC can kick all the code out.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ptdump/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 9a2186c133e6..ab6a572202b4 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -177,7 +177,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 
 static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
-	if (!st->check_wx)
+	if (!IS_ENABLED(CONFIG_PPC_DEBUG_WX) || !st->check_wx)
 		return;
 
 	if (!((st->current_flags & pgprot_val(PAGE_KERNEL_X)) == pgprot_val(PAGE_KERNEL_X)))
-- 
2.13.3

