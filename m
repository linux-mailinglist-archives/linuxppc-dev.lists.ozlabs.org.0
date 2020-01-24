Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82388148503
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 13:13:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483yhd3P97zDqfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 23:13:05 +1100 (AEDT)
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
 header.s=mail header.b=bwZsiipU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yHV1C5rzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:54:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483yHP4WVnz9tyN8;
 Fri, 24 Jan 2020 12:54:41 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bwZsiipU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SSrNdcuyBBuq; Fri, 24 Jan 2020 12:54:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483yHP3MZ0z9tyMv;
 Fri, 24 Jan 2020 12:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579866881; bh=VLx+Lz40VzpGWWhkdYBRnnJLZiSw4fD8aXzdGmSoxMc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=bwZsiipUE7XPgOvT/fv2tqC+/BWEPK6x8YER7CmIw+j4b5yIyqSryoZtfG0J7w+Tf
 ZzZL2Q/9A94nVbWguyBkIyRGVFggtzAk1vSu8pZ2wXAHAKGyNcdqOVhqKB0aIWTh5a
 QQOzfPsEfaQ1xj33F6c7Av5mksgYB3EtZPDKDfIE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A1C98B85C;
 Fri, 24 Jan 2020 12:54:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rOBxj6ZDwIhG; Fri, 24 Jan 2020 12:54:42 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80CE08B84A;
 Fri, 24 Jan 2020 12:54:42 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 62D06651F0; Fri, 24 Jan 2020 11:54:42 +0000 (UTC)
Message-Id: <85e971223dfe6ace734637db1841678939a76155.1579866752.git.christophe.leroy@c-s.fr>
In-Reply-To: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
References: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 4/7] powerpc/32s: Drop NULL addr verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 11:54:42 +0000 (UTC)
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
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/d79cb9f680f4e971e05262303103a4b94baa91ce.1579715466.git.christophe.leroy@c-s.fr
---
v4: taken from powerpc/merge-test
---
 arch/powerpc/include/asm/book3s/32/kup.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 91c8f1d9bcee..de29fb752cca 100644
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
 	if (!(dir & KUAP_WRITE))
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

