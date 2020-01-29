Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BD14CAED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 13:38:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48731G3YS9zDqRD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 23:38:10 +1100 (AEDT)
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
 header.s=mail header.b=l3nV9ySF; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4872xH5y1kzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 23:34:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4872x84Y4Lz9tx92;
 Wed, 29 Jan 2020 13:34:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=l3nV9ySF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uH-i69bvoEWL; Wed, 29 Jan 2020 13:34:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4872x83HG1z9tx91;
 Wed, 29 Jan 2020 13:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580301276; bh=pguVXdOhkyypdIZhHe1n3i7XEXX+yG1raLA7WsBiY2c=;
 h=From:Subject:To:Cc:Date:From;
 b=l3nV9ySFTQoaYWheRtSLpxXQWqDGTF+7CTkVzroN17yb2abpx51Sg/dbEkTnsIVbk
 GtQOxks2plKz5QZekbeokoSW1Bnpd8AO3Xe8erFZ1ECC8pknxQ0FATIm6ekInrAo1a
 WTX3EkLwQWhOYOha5WxJJc1ramrscA9+ArL7eUBw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCB268B81C;
 Wed, 29 Jan 2020 13:34:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id buSXGuoXKh3u; Wed, 29 Jan 2020 13:34:37 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F00F8B815;
 Wed, 29 Jan 2020 13:34:37 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 05B396523E; Wed, 29 Jan 2020 12:34:36 +0000 (UTC)
Message-Id: <fc8390a33c2a470105f01abbcbdc7916c30c0a54.1580301269.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: Fix kasan_early_hash_table() for
 CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jan 2020 12:34:36 +0000 (UTC)
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

On book3s/32 CPUs that are handling MMU through a hash table,
MMU_init_hw() function was adapted for VMAP_STACK in order to
handle virtual addresses instead of physical addresses in the
low level hash functions.

When using KASAN, the same adaptations are required for the
early hash table set up by kasan_early_hash_table() function.

Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index d3cacd462560..16dd95bd0749 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -185,8 +185,11 @@ u8 __initdata early_hash[256 << 10] __aligned(256 << 10) = {0};
 
 static void __init kasan_early_hash_table(void)
 {
-	modify_instruction_site(&patch__hash_page_A0, 0xffff, __pa(early_hash) >> 16);
-	modify_instruction_site(&patch__flush_hash_A0, 0xffff, __pa(early_hash) >> 16);
+	unsigned int hash = IS_ENABLED(CONFIG_VMAP_STACK) ? (unsigned int)early_hash :
+							    __pa(early_hash);
+
+	modify_instruction_site(&patch__hash_page_A0, 0xffff, hash >> 16);
+	modify_instruction_site(&patch__flush_hash_A0, 0xffff, hash >> 16);
 
 	Hash = (struct hash_pte *)early_hash;
 }
-- 
2.25.0

