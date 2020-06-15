Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94961F9162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 10:28:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lkx726GbzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 18:28:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lkvG18WrzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 18:26:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lkv53h6Nz9v03C;
 Mon, 15 Jun 2020 10:26:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b_rTsqgA_kcz; Mon, 15 Jun 2020 10:26:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lkv23ynTz9v1fZ;
 Mon, 15 Jun 2020 10:26:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 81B3D8B786;
 Mon, 15 Jun 2020 09:48:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lsX-bHFjEBuH; Mon, 15 Jun 2020 09:48:25 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44F098B791;
 Mon, 15 Jun 2020 09:48:25 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1B25265B0A; Mon, 15 Jun 2020 07:48:25 +0000 (UTC)
Message-Id: <ca8c9f8249f523b1fab873e67b81b11989d46553.1592207216.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page size is
 256k
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Albert Herranz <albert_herranz@yahoo.es>
Date: Mon, 15 Jun 2020 07:48:25 +0000 (UTC)
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

FIX_EARLY_DEBUG_BASE reserves a 128k area for debuging.

When page size is 256k, the calculation results in a 0 number of
pages, leading to the following failure:

  CC      arch/powerpc/kernel/asm-offsets.s
In file included from ./arch/powerpc/include/asm/nohash/32/pgtable.h:77:0,
                 from ./arch/powerpc/include/asm/nohash/pgtable.h:8,
                 from ./arch/powerpc/include/asm/pgtable.h:20,
                 from ./include/linux/pgtable.h:6,
                 from ./arch/powerpc/include/asm/kup.h:42,
                 from ./arch/powerpc/include/asm/uaccess.h:9,
                 from ./include/linux/uaccess.h:11,
                 from ./include/linux/crypto.h:21,
                 from ./include/crypto/hash.h:11,
                 from ./include/linux/uio.h:10,
                 from ./include/linux/socket.h:8,
                 from ./include/linux/compat.h:15,
                 from arch/powerpc/kernel/asm-offsets.c:14:
./arch/powerpc/include/asm/fixmap.h:75:2: error: overflow in enumeration values
  __end_of_permanent_fixed_addresses,
  ^
make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1

Ensure the debug area is at least one page.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: b8e8efaa8639 ("powerpc: reserve fixmap entries for early debug")
Cc: stable@vger.kernel.org
Cc: Albert Herranz <albert_herranz@yahoo.es>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/fixmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 29188810ba30..925cf89cbf4b 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -52,7 +52,7 @@ enum fixed_addresses {
 	FIX_HOLE,
 	/* reserve the top 128K for early debugging purposes */
 	FIX_EARLY_DEBUG_TOP = FIX_HOLE,
-	FIX_EARLY_DEBUG_BASE = FIX_EARLY_DEBUG_TOP+((128*1024)/PAGE_SIZE)-1,
+	FIX_EARLY_DEBUG_BASE = FIX_EARLY_DEBUG_TOP+(ALIGN(SZ_128, PAGE_SIZE)/PAGE_SIZE)-1,
 #ifdef CONFIG_HIGHMEM
 	FIX_KMAP_BEGIN,	/* reserved pte's for temporary kernel mappings */
 	FIX_KMAP_END = FIX_KMAP_BEGIN+(KM_TYPE_NR*NR_CPUS)-1,
-- 
2.25.0

