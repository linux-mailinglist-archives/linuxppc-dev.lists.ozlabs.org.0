Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B542713A176
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 08:16:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xhbL3bHKzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 18:16:46 +1100 (AEDT)
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
 header.s=mail header.b=TkYvKHPt; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xhY36VLZzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 18:14:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xhXw53kqz9v0Lw;
 Tue, 14 Jan 2020 08:14:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TkYvKHPt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iVxTb8TgLh8h; Tue, 14 Jan 2020 08:14:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xhXw41y7z9v0Ls;
 Tue, 14 Jan 2020 08:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578986080; bh=/OK6Lpp7q/9c+0HECybQ/RM7ndx7YGHdn+KmKQ2b57U=;
 h=From:Subject:To:Cc:Date:From;
 b=TkYvKHPtwfkKien2LiSh59HoFcKt5XlSmkrqoExvlCi2KdY/VOWh4r836el1A29gO
 2TS9rpQxdPfLKgG9cSH0emRi0+gbRZVM1Jj9lCiHPdz0E3OEM5GDSV6iFitN6soZ3B
 tD+5IP76FAIrgGuiOigNQ+oRMrpToxBsvwgY2JUM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A1AE8B7CE;
 Tue, 14 Jan 2020 08:14:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FZr_hZylWbSH; Tue, 14 Jan 2020 08:14:41 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33C588B769;
 Tue, 14 Jan 2020 08:14:41 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C8C0264A1F; Tue, 14 Jan 2020 07:14:40 +0000 (UTC)
Message-Id: <bf34fd9dca61eadf9a134a9f89ebbc162cfd5f86.1578986011.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/ptdump: don't entirely rebuild kernel when
 selecting CONFIG_PPC_DEBUG_WX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 14 Jan 2020 07:14:40 +0000 (UTC)
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

Selecting CONFIG_PPC_DEBUG_WX only impacts ptdump and pgtable_32/64
init calls. Declaring related functions in asm/pgtable.h implies
rebuilding almost everything.

Move ptdump_check_wx() declaration in mm/mmu_decl.h

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: use mm/mmu_decl.h instead of a new asm/ptdump.h
---
 arch/powerpc/include/asm/pgtable.h | 6 ------
 arch/powerpc/mm/mmu_decl.h         | 6 ++++++
 arch/powerpc/mm/ptdump/ptdump.c    | 2 ++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 0e4ec8cc37b7..8cc543ed114c 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -94,12 +94,6 @@ void mark_initmem_nx(void);
 static inline void mark_initmem_nx(void) { }
 #endif
 
-#ifdef CONFIG_PPC_DEBUG_WX
-void ptdump_check_wx(void);
-#else
-static inline void ptdump_check_wx(void) { }
-#endif
-
 /*
  * When used, PTE_FRAG_NR is defined in subarch pgtable.h
  * so we are sure it is included when arriving here.
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 8e99649c24fc..7097e07a209a 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -181,3 +181,9 @@ void mmu_mark_rodata_ro(void);
 static inline void mmu_mark_initmem_nx(void) { }
 static inline void mmu_mark_rodata_ro(void) { }
 #endif
+
+#ifdef CONFIG_PPC_DEBUG_WX
+void ptdump_check_wx(void);
+#else
+static inline void ptdump_check_wx(void) { }
+#endif
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 2f9ddc29c535..4af0d5d9589e 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -24,6 +24,8 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 
+#include <mm/mmu_decl.h>
+
 #include "ptdump.h"
 
 /*
-- 
2.13.3

