Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8910145B46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:02:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tXS6ymSzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 05:02:16 +1100 (AEDT)
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
 header.s=mail header.b=najcw7ip; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tKg4QzczDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:52:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482tKY450Pz9vBf4;
 Wed, 22 Jan 2020 18:52:49 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=najcw7ip; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2vbxDVXx3gT8; Wed, 22 Jan 2020 18:52:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482tKY348bz9vBf1;
 Wed, 22 Jan 2020 18:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579715569; bh=Wl+zaBbMBZgvhufq6pfrc9DXJ49WhaqTuzhVpUiFLfc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=najcw7ipVpyl+ds1ybPWEWZx+Trqykq2FxH5AIjJ30tw07JF6/cNp4jIt8m0CpJeD
 wP4sRYVC6CHoqC1gOZDF9buVV+XHf19z0DrlNATjwVUMcvrK+DW5G3ESN4BzvfF9kH
 YZdGZ/BD0xWu+IDv5XGoNUvkiz+i+CEVEtflYF7s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 251308B810;
 Wed, 22 Jan 2020 18:52:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lXx_an0ltPsO; Wed, 22 Jan 2020 18:52:51 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAC3D8B7FE;
 Wed, 22 Jan 2020 18:52:50 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id B3ABD651E0; Wed, 22 Jan 2020 17:52:50 +0000 (UTC)
Message-Id: <d79cb9f680f4e971e05262303103a4b94baa91ce.1579715466.git.christophe.leroy@c-s.fr>
In-Reply-To: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 4/6] powerpc/32s: Drop NULL addr verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 22 Jan 2020 17:52:50 +0000 (UTC)
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NULL addr is a user address. Don't waste time checking it. If
someone tries to access it, it will SIGFAULT the same way as for
address 1, so no need to make it special.

The special case is when not doing a write, in that case we want
to drop the entire function. This is now handled by 'dir' param
and not by the nulity of 'to' anymore.

Also make beginning of prevent_user_access() similar
to beginning of allow_user_access(), and tell the compiler
that writing in kernel space or with a 0 length is unlikely

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: no change
---
 arch/powerpc/include/asm/book3s/32/kup.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index d765515bd1c1..3c1798e56b55 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -113,7 +113,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 
 	addr = (__force u32)to;
 
-	if (!addr || addr >= TASK_SIZE || !size)
+	if (unlikely(addr >= TASK_SIZE || !size))
 		return;
 
 	end = min(addr + size, TASK_SIZE);
@@ -124,16 +124,18 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 static __always_inline void prevent_user_access(void __user *to, const void __user *from,
 						u32 size, unsigned long dir)
 {
-	u32 addr = (__force u32)to;
-	u32 end = min(addr + size, TASK_SIZE);
+	u32 addr, end;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 	if (!(dir & KUAP_W))
 		return;
 
-	if (!addr || addr >= TASK_SIZE || !size)
+	addr = (__force u32)to;
+
+	if (unlikely(addr >= TASK_SIZE || !size))
 		return;
 
+	end = min(addr + size, TASK_SIZE);
 	current->thread.kuap = 0;
 	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
 }
-- 
2.25.0

