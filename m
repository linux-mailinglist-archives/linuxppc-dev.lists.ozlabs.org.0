Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6614850C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 13:17:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483ynv2vs8zDqXm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 23:17:39 +1100 (AEDT)
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
 header.s=mail header.b=gf3TbqMx; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yHW3PDPzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:54:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483yHQ428Pz9tyNC;
 Fri, 24 Jan 2020 12:54:42 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gf3TbqMx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1fODUHn7HhAt; Fri, 24 Jan 2020 12:54:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483yHQ2zh0z9tyMv;
 Fri, 24 Jan 2020 12:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579866882; bh=JXDaBnd7mgdJWDIpZlE9SEvwyWmEoszznADrTkNkdwM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=gf3TbqMxn4RpFN3iRulSVmL4SOIOE5qfoyd7wuIo2yD2J3XV0pBONcYt/padeKotW
 ADF45oxIjvSzVf6rktruAL9T7/Fwj+w67rB/gzC0WshJ/Mad/Azx7x5fyE8/dy+5W1
 LpIY/grk/X+52KDi+JmeWtKdVcusrZL/hxD96GZc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC3C98B85C;
 Fri, 24 Jan 2020 12:54:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1M8UtqIa11cZ; Fri, 24 Jan 2020 12:54:43 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 879518B84A;
 Fri, 24 Jan 2020 12:54:43 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 69317651F0; Fri, 24 Jan 2020 11:54:43 +0000 (UTC)
Message-Id: <55bcc1f25d8200892a31f67a0b024ff3b816c3cc.1579866752.git.christophe.leroy@c-s.fr>
In-Reply-To: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
References: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 5/7] powerpc/32s: prepare prevent_user_access() for
 user_access_end()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 11:54:43 +0000 (UTC)
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

Implement a special direction named KUAP_CURRENT. In this case only,
the addr and end are retrieved from current->kuap.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: No change
v3: This patch was not in v3
v4: Added build protection against bad use of KUAP_CURRENT.
---
 arch/powerpc/include/asm/book3s/32/kup.h      | 23 +++++++++++++++----
 .../powerpc/include/asm/book3s/64/kup-radix.h |  4 +++-
 arch/powerpc/include/asm/kup.h                | 11 +++++++++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index de29fb752cca..17e069291c72 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -108,6 +108,8 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 	u32 addr, end;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
+	BUILD_BUG_ON(dir == KUAP_CURRENT);
+
 	if (!(dir & KUAP_WRITE))
 		return;
 
@@ -117,6 +119,7 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 		return;
 
 	end = min(addr + size, TASK_SIZE);
+
 	current->thread.kuap = (addr & 0xf0000000) | ((((end - 1) >> 28) + 1) & 0xf);
 	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
 }
@@ -127,15 +130,25 @@ static __always_inline void prevent_user_access(void __user *to, const void __us
 	u32 addr, end;
 
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
-	if (!(dir & KUAP_WRITE))
-		return;
 
-	addr = (__force u32)to;
+	if (dir == KUAP_CURRENT) {
+		u32 kuap = current->thread.kuap;
 
-	if (unlikely(addr >= TASK_SIZE || !size))
+		if (unlikely(!kuap))
+			return;
+
+		addr = kuap & 0xf0000000;
+		end = kuap << 28;
+	} else if (dir & KUAP_WRITE) {
+		addr = (__force u32)to;
+		end = min(addr + size, TASK_SIZE);
+
+		if (unlikely(addr >= TASK_SIZE || !size))
+			return;
+	} else {
 		return;
+	}
 
-	end = min(addr + size, TASK_SIZE);
 	current->thread.kuap = 0;
 	kuap_update_sr(mfsrin(addr) | SR_KS, addr, end);	/* set Ks */
 }
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index c8d1076e0ebb..a0263e94df33 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -86,8 +86,10 @@ static __always_inline void allow_user_access(void __user *to, const void __user
 		set_kuap(AMR_KUAP_BLOCK_WRITE);
 	else if (dir == KUAP_WRITE)
 		set_kuap(AMR_KUAP_BLOCK_READ);
-	else
+	else if (dir == KUAP_READ_WRITE)
 		set_kuap(0);
+	else
+		BUILD_BUG();
 }
 
 static inline void prevent_user_access(void __user *to, const void __user *from,
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 94f24928916a..c3ce7e8ae9ea 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -5,6 +5,12 @@
 #define KUAP_READ	1
 #define KUAP_WRITE	2
 #define KUAP_READ_WRITE	(KUAP_READ | KUAP_WRITE)
+/*
+ * For prevent_user_access() only.
+ * Use the current saved situation instead of the to/from/size params.
+ * Used on book3s/32
+ */
+#define KUAP_CURRENT	4
 
 #ifdef CONFIG_PPC64
 #include <asm/book3s/64/kup-radix.h>
@@ -88,6 +94,11 @@ static inline void prevent_read_write_user(void __user *to, const void __user *f
 	prevent_user_access(to, from, size, KUAP_READ_WRITE);
 }
 
+static inline void prevent_current_access_user(void)
+{
+	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_KUAP_H_ */
-- 
2.25.0

