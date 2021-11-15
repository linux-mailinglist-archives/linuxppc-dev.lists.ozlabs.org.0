Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1414500D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 10:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht3G74fVNz304R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht3Fh055bz2xCc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 20:05:58 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ht3Fb4jLKz9sSH;
 Mon, 15 Nov 2021 10:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23Jkjqa8PDsV; Mon, 15 Nov 2021 10:05:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ht3Fb3Ts8z9sSB;
 Mon, 15 Nov 2021 10:05:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 631328B767;
 Mon, 15 Nov 2021 10:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vYt0LtQYyl6m; Mon, 15 Nov 2021 10:05:55 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4092D8B763;
 Mon, 15 Nov 2021 10:05:55 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 1AF95jiL136901
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 10:05:45 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 1AF95jhV136900;
 Mon, 15 Nov 2021 10:05:45 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/book3e: Fix TLBCAM preset at boot
Date: Mon, 15 Nov 2021 10:05:32 +0100
Message-Id: <d319f2a9367d4d08fd2154e506101bd5f100feeb.1636967119.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1636967130; l=2048; s=20211009;
 h=from:subject:message-id; bh=UkVSGT3r0lZYtsOemswUnqSkhTNjQKOQEhjWVTHKcoY=;
 b=8aZCsj5qx3yqs8pm5bTdJlxec2S/WaewNn8VpChIp91Dq0ejGnqCK3vY/gKfU/cg6oRPYKsFaIEL
 Tvd5OowBDD4qJaSlagvZn8Sxia6cy7PKKLLHhbe7XP61ljJck8V/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if
init is done") was supposed to just add an additional parameter to
map_mem_in_cams() and always set it to 'true' at that time.

But a few call sites were messed up. Fix them.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Fixes: 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if init is done")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/kaslr_booke.c | 2 +-
 arch/powerpc/mm/nohash/tlb.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 8fc49b1b4a91..6ec978967da0 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -314,7 +314,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 		pr_warn("KASLR: No safe seed for randomizing the kernel base.\n");
 
 	ram = min_t(phys_addr_t, __max_low_memory, size);
-	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, false);
+	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, true);
 	linear_sz = min_t(unsigned long, ram, SZ_512M);
 
 	/* If the linear size is smaller than 64M, do not randmize */
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 89353d4f5604..647bf454a0fa 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -645,7 +645,7 @@ static void early_init_this_mmu(void)
 
 		if (map)
 			linear_map_top = map_mem_in_cams(linear_map_top,
-							 num_cams, true, true);
+							 num_cams, false, true);
 	}
 #endif
 
@@ -766,7 +766,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
 
 		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
-					    false, true);
+					    true, true);
 
 		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
 	} else
-- 
2.31.1

