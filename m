Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E121C1CD8AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 13:39:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LJrY1Ry4zDqVL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 21:39:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJX100B9zDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJWj47h2z9ty3m;
 Mon, 11 May 2020 13:25:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BDfGMIPT8x-X; Mon, 11 May 2020 13:25:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJWj38k8z9ty3k;
 Mon, 11 May 2020 13:25:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F88F8B7AE;
 Mon, 11 May 2020 13:25:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FRhu3HcDIC0H; Mon, 11 May 2020 13:25:28 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5CD78B7AD;
 Mon, 11 May 2020 13:25:27 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BD1FA65A09; Mon, 11 May 2020 11:25:27 +0000 (UTC)
Message-Id: <f5b173c662b8675a8f375dd436449da7e866b659.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 02/45] powerpc/kasan: Fix issues by lowering
 KASAN_SHADOW_END
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:27 +0000 (UTC)
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

At the time being, KASAN_SHADOW_END is 0x100000000, which
is 0 in 32 bits representation.

This leads to a couple of issues:
- kasan_remap_early_shadow_ro() does nothing because the comparison
k_cur < k_end is always false.
- In ptdump, address comparison for markers display fails and the
marker's name is printed at the start of the KASAN area instead of
being printed at the end.

However, there is no need to shadow the KASAN shadow area itself,
so the KASAN shadow area can stop shadowing memory at the start
of itself.

With a PAGE_OFFSET set to 0xc0000000, KASAN shadow area is then going
from 0xf8000000 to 0xff000000.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: cbd18991e24f ("powerpc/mm: Fix an Oops in kasan_mmu_init()")
Cc: stable@vger.kernel.org
---
 arch/powerpc/include/asm/kasan.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index fbff9ff9032e..fc900937f653 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -23,9 +23,7 @@
 
 #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
 
-#define KASAN_SHADOW_END	0UL
-
-#define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
+#define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
 
 #ifdef CONFIG_KASAN
 void kasan_early_init(void);
-- 
2.25.0

