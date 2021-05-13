Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE637F4D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 11:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgmbh2pNkz3090
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 19:30:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgmbC097Cz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:29:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fgmb56cpzz9sbk;
 Thu, 13 May 2021 11:29:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDEWO3Hn51NL; Thu, 13 May 2021 11:29:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fgmb55jjQz9sY9;
 Thu, 13 May 2021 11:29:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A22C08B7F3;
 Thu, 13 May 2021 11:29:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YcK19x8QWg_h; Thu, 13 May 2021 11:29:53 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B9A48B76C;
 Thu, 13 May 2021 11:29:53 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 32A9064185; Thu, 13 May 2021 09:29:53 +0000 (UTC)
Message-Id: <ad2d366015794a9f21320dcbdd0a8eb98979e9df.1620898113.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] mm/ioremap: Fix iomap_max_page_shift
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 13 May 2021 09:29:53 +0000 (UTC)
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

iomap_max_page_shift is expected to contain a page shift,
so it can't be a 'bool', has to be an 'unsigned int'

And fix the default values: P4D_SHIFT is when huge iomap is allowed.

However, on some architectures (eg: powerpc book3s/64), P4D_SHIFT is
not a constant so it can't be used to initialise a static variable.
So, initialise iomap_max_page_shift with a maximum shift supported
by the architecture, it is gated by P4D_SHIFT in vmap_try_huge_p4d()
anyway.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: bbc180a5adb0 ("mm: HUGE_VMAP arch support cleanup")
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
v2: Initialise with BITS_PER_LONG - 1 instead of P4D_SHIFT which is not a constant on powerpc/64.
---
 mm/ioremap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/ioremap.c b/mm/ioremap.c
index d1dcc7e744ac..8ee0136f8cb0 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -16,16 +16,16 @@
 #include "pgalloc-track.h"
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static bool __ro_after_init iomap_max_page_shift = PAGE_SHIFT;
+static unsigned int __ro_after_init iomap_max_page_shift = BITS_PER_LONG - 1;
 
 static int __init set_nohugeiomap(char *str)
 {
-	iomap_max_page_shift = P4D_SHIFT;
+	iomap_max_page_shift = PAGE_SHIFT;
 	return 0;
 }
 early_param("nohugeiomap", set_nohugeiomap);
 #else /* CONFIG_HAVE_ARCH_HUGE_VMAP */
-static const bool iomap_max_page_shift = PAGE_SHIFT;
+static const unsigned int iomap_max_page_shift = PAGE_SHIFT;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
 int ioremap_page_range(unsigned long addr,
-- 
2.25.0

