Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89D145B4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:04:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tZT20wnzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 05:04:01 +1100 (AEDT)
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
 header.s=mail header.b=qkN85J/J; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tKh1mYSzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:52:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482tKZ4Mjhz9vBmj;
 Wed, 22 Jan 2020 18:52:50 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qkN85J/J; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id G2ifJQ-r2Ov6; Wed, 22 Jan 2020 18:52:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482tKZ3FV0z9vBf1;
 Wed, 22 Jan 2020 18:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579715570; bh=8dizNlmXa18nvxrEuEdmfsHiWWHIwWhz4sd63oYOH1M=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=qkN85J/J4f24fMTGQqzRMSxhPlbRBM87KY1WY1BCFViZW/pK4PZItQZFf8zrCuUt9
 kohquxPCVJkomgfZ6jp7fb8O70vVeyERCKclSwTCI0Y+pbbnihwATZqev5G0O/8JV3
 kEslOIxA5EMMOY4eT9zoXQlS+QXFEHnAqa/PEQ+k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29D548B810;
 Wed, 22 Jan 2020 18:52:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rTomGVjtT7Og; Wed, 22 Jan 2020 18:52:52 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E55738B7FE;
 Wed, 22 Jan 2020 18:52:51 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id BE563651E0; Wed, 22 Jan 2020 17:52:51 +0000 (UTC)
Message-Id: <824b69f5452d1d41d12c4dbd306d4b8f32d493fc.1579715466.git.christophe.leroy@c-s.fr>
In-Reply-To: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 5/6] powerpc/32s: prepare prevent_user_access() for
 user_access_end()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 22 Jan 2020 17:52:51 +0000 (UTC)
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

In preparation of implementing user_access_begin and friends
on powerpc, the book3s/32 version of prevent_user_access() need
to be prepared for user_access_end().

user_access_end() doesn't provide the address and size which
were passed to user_access_begin(), required by prevent_user_access()
to know which segment to modify.

The list of segments which where unprotected by allow_user_access()
are available in current->kuap. But we don't want prevent_user_access()
to read this all the time, especially everytime it is 0 (for instance
because the access was not a write access).

Implement a special direction case named KUAP_SELF. In this case only,
the addr and end are retrieved from current->kuap.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: no change
---
 arch/powerpc/include/asm/book3s/32/kup.h | 25 ++++++++++++++++++------
 arch/powerpc/include/asm/kup.h           |  1 +
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 3c1798e56b55..a99fc3428ac9 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -117,6 +117,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 		return;
 
 	end = min(addr + size, TASK_SIZE);
+
 	current->thread.kuap = (addr & 0xf0000000) | ((((end - 1) >> 28) + 1) & 0xf);
 	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
 }
@@ -127,15 +128,27 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 	u32 addr, end;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
-	if (!(dir & KUAP_W))
-		return;
 
-	addr = (__force u32)to;
+	if (dir == KUAP_SELF) {
+		u32 kuap = current->thread.kuap;
 
-	if (unlikely(addr >= TASK_SIZE || !size))
-		return;
+		if (unlikely(!kuap))
+			return;
+
+		addr = kuap & 0xf0000000;
+		end = kuap << 28;
+	} else {
+		if (!(dir & KUAP_W))
+			return;
+
+		addr = (__force u32)to;
+
+		if (unlikely(addr >= TASK_SIZE || !size))
+			return;
+
+		end = min(addr + size, TASK_SIZE);
+	}
 
-	end = min(addr + size, TASK_SIZE);
 	current->thread.kuap = 0;
 	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
 }
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index ff57bfcb88f7..4229e749dcf4 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -5,6 +5,7 @@
 #define KUAP_R		1
 #define KUAP_W		2
 #define KUAP_RW		(KUAP_R | KUAP_W)
+#define KUAP_SELF	4
 
 #ifdef CONFIG_PPC64
 #include <asm/book3s/64/kup-radix.h>
-- 
2.25.0

