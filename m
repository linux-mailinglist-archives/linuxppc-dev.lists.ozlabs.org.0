Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3019A94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 11:26:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450lFh4HDrzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 19:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="taWSJ99P"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450lD6179RzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 19:24:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 450lD01KCKz9v1Mt;
 Fri, 10 May 2019 11:24:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=taWSJ99P; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KJXQjKtTJ41s; Fri, 10 May 2019 11:24:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 450lD00HK7z9v1MX;
 Fri, 10 May 2019 11:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557480288; bh=7+rPkb2mMCN5fVEdeNW5Bv+959x/xuLC/xkQspJWIF4=;
 h=From:Subject:To:Cc:Date:From;
 b=taWSJ99PKG67Av4raH7KIE+Cms6j4wKbf27OdG2itiwITW2soKJWE2LGl/28cLXXI
 +U9DlPPhQ7uHNnTjc3v8CfSWhU7C4wW1W5gzC6RdgDS/zUWx0AKQuWgBtOW1VGp7b5
 JbHEWmola2E6NrjmVNMdZ+MR5+b67mB2A+KLvZ1E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30AB88B940;
 Fri, 10 May 2019 11:24:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6vEArAskASY9; Fri, 10 May 2019 11:24:49 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15F368B7E6;
 Fri, 10 May 2019 11:24:49 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DAAD2673B2; Fri, 10 May 2019 09:24:48 +0000 (UTC)
Message-Id: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc: slightly improve cache helpers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
Date: Fri, 10 May 2019 09:24:48 +0000 (UTC)
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
that are summed to obtain the target address. Using 'Z' constraint
and '%y0' argument gives GCC the opportunity to use both registers
instead of only one with the second being forced to 0.

Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/cache.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 40ea5b3781c6..df8e4c407366 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -85,22 +85,22 @@ extern void _set_L3CR(unsigned long);
 
 static inline void dcbz(void *addr)
 {
-	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbi(void *addr)
 {
-	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbf(void *addr)
 {
-	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbf %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
 
 static inline void dcbst(void *addr)
 {
-	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
+	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
-- 
2.13.3

