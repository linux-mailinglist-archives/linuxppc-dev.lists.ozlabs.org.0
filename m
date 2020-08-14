Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A182444C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:03:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSXt36Cd6zDqkR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:03:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSXkR12pnzDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 15:56:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSXkK3hKSz9vD33;
 Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gQfU3jNeceuU; Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSXkK2bPqz9vD2y;
 Fri, 14 Aug 2020 07:56:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B9A68B775;
 Fri, 14 Aug 2020 07:56:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V1pBaDp2yooP; Fri, 14 Aug 2020 07:56:26 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 139F98B767;
 Fri, 14 Aug 2020 07:56:26 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B2CC365C93; Fri, 14 Aug 2020 05:56:25 +0000 (UTC)
Message-Id: <993445b5227e8ca2f0e38bcc9ea3dfea6e865920.1597384512.git.christophe.leroy@csgroup.eu>
In-Reply-To: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
References: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/4] powerpc: Move flush_instruction_cache() prototype in
 asm/cacheflush.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 hch@infradead.org
Date: Fri, 14 Aug 2020 05:56:25 +0000 (UTC)
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

flush_instruction_cache() belongs to the cache flushing function
family.

Move its prototype in asm/cacheflush.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: new
---
 arch/powerpc/include/asm/cacheflush.h      | 2 ++
 arch/powerpc/include/asm/processor.h       | 1 -
 arch/powerpc/platforms/44x/machine_check.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 54764c6e922d..481877879fec 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -98,6 +98,8 @@ static inline void invalidate_dcache_range(unsigned long start,
 	mb();	/* sync */
 }
 
+void flush_instruction_cache(void);
+
 #include <asm-generic/cacheflush.h>
 
 #endif /* _ASM_POWERPC_CACHEFLUSH_H */
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..d828813e35de 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -435,7 +435,6 @@ extern void power7_idle_type(unsigned long type);
 extern void power9_idle_type(unsigned long stop_psscr_val,
 			      unsigned long stop_psscr_mask);
 
-extern void flush_instruction_cache(void);
 extern void hard_reset_now(void);
 extern void poweroff_now(void);
 extern int fix_alignment(struct pt_regs *);
diff --git a/arch/powerpc/platforms/44x/machine_check.c b/arch/powerpc/platforms/44x/machine_check.c
index 90ad6ac529d2..a5c898bb9bab 100644
--- a/arch/powerpc/platforms/44x/machine_check.c
+++ b/arch/powerpc/platforms/44x/machine_check.c
@@ -7,6 +7,7 @@
 #include <linux/ptrace.h>
 
 #include <asm/reg.h>
+#include <asm/cacheflush.h>
 
 int machine_check_440A(struct pt_regs *regs)
 {
-- 
2.25.0

