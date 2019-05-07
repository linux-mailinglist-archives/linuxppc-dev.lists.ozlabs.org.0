Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE1164AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 15:37:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z0zR3ZwYzDq63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 23:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NZhAPArn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z0rJ3jcSzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 23:31:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44z0rB3ns1z9v1qL;
 Tue,  7 May 2019 15:31:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NZhAPArn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id k7qaG0dZ0J0U; Tue,  7 May 2019 15:31:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44z0rB2ffmz9v1qJ;
 Tue,  7 May 2019 15:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557235898; bh=uxZQpxauEnM4aYWFAk/wkXMZ76Y3WDlotHwL8DND8kc=;
 h=From:Subject:To:Cc:Date:From;
 b=NZhAPArnVW1kBB8dsyWinS5PUZzBJVcD3YA4vGclaFu9u1jfLwdNMZQNg6RDhsQ7l
 EpyUprEBYrZ/E4Yn4bWaDKPv+9YHgqwma6cytQt72yx4iQoI+3epnbRzRqH9X1ook6
 7UGh4qvKt2PbRh2wArECo5C3iKSNybqQOqVz7LcE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C53DD8B8FF;
 Tue,  7 May 2019 15:31:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OW1MUf1y11wT; Tue,  7 May 2019 15:31:39 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 94E208B8F8;
 Tue,  7 May 2019 15:31:39 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 78EAC66242; Tue,  7 May 2019 13:31:39 +0000 (UTC)
Message-Id: <0b460a85319fb89dab2c5d1200ac69a3e1b7c1ef.1557235807.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc: slightly improve cache helpers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue,  7 May 2019 13:31:39 +0000 (UTC)
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

Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
that are summed to obtain the target address. Using '%y0' argument
gives GCC the opportunity to use both registers instead of only one
with the second being forced to 0.

Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cache.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 40ea5b3781c6..5a22a869a20b 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -85,22 +85,22 @@ extern void _set_L3CR(unsigned long);
 
 static inline void dcbz(void *addr)
 {
-	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbz %y0" : : "m"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbi(void *addr)
 {
-	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbi %y0" : : "m"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbf(void *addr)
 {
-	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbf %y0" : : "m"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbst(void *addr)
 {
-	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbst %y0" : : "m"(*(u8 *)addr) : "memory");
 }
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
-- 
2.13.3

