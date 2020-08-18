Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724F248D2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:35:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJ3T4zPLzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhY03SqzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhS09Ttz9vCxl;
 Tue, 18 Aug 2020 19:19:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kFOy8En8D3SV; Tue, 18 Aug 2020 19:19:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhR6X75z9vCxg;
 Tue, 18 Aug 2020 19:19:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCBA58B7EC;
 Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id idDfGtHJ5pca; Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82E2C8B7D7;
 Tue, 18 Aug 2020 19:19:21 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 63FE465CF4; Tue, 18 Aug 2020 17:19:21 +0000 (UTC)
Message-Id: <13ef6510ce30a4867e043157b93af5bb8c67fb3b.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 09/25] powerpc/signal: Remove get_clean_sp()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:21 +0000 (UTC)
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

get_clean_sp() is only used once in kernel/signal.c .

GCC is smart enough to see that x & 0xffffffff is a nop
calculation on PPC32, no need of a special PPC32 trivial version.

Include the logic from the PPC64 version of get_clean_sp() directly
in get_sigframe().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h | 14 --------------
 arch/powerpc/kernel/signal.c         |  5 ++++-
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index e20b0c5abe62..8320aedbdca3 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -406,20 +406,6 @@ static inline void prefetchw(const void *x)
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT
 
-#ifdef CONFIG_PPC64
-static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
-{
-	if (is_32)
-		return sp & 0x0ffffffffUL;
-	return sp;
-}
-#else
-static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
-{
-	return sp;
-}
-#endif
-
 /* asm stubs */
 extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
 extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 1be5fd01f866..a295d482adec 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -150,7 +150,10 @@ void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
         unsigned long oldsp, newsp;
 
         /* Default to using normal stack */
-        oldsp = get_clean_sp(sp, is_32);
+	if (is_32)
+		oldsp = sp & 0x0ffffffffUL;
+	else
+		oldsp = sp;
 	oldsp = sigsp(oldsp, ksig);
 	newsp = (oldsp - frame_size) & ~0xFUL;
 
-- 
2.25.0

