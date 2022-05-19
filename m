Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2152DB1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 19:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3xZ94tJ8z3bnX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 03:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3xYj3BZdz2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 03:24:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L3xYZ08qcz9t0v;
 Thu, 19 May 2022 19:24:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddt7bRaOl9UR; Thu, 19 May 2022 19:24:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L3xYY6QdZz9t0Q;
 Thu, 19 May 2022 19:24:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE1468B77E;
 Thu, 19 May 2022 19:24:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iY_bcdOXjTrp; Thu, 19 May 2022 19:24:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 898AF8B763;
 Thu, 19 May 2022 19:24:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24JHOJFK3119573
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 19:24:19 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24JHOGv43119570;
 Thu, 19 May 2022 19:24:16 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/fsl_book3e: Don't set rodata RO too early
Date: Thu, 19 May 2022 19:24:15 +0200
Message-Id: <2e35f0fd649c83c5add17a99514ac040767be93a.1652981047.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652981054; l=2109; s=20211009;
 h=from:subject:message-id; bh=p6ejnAcRp1DXCMNYT2kdvj6nTKpgEruWDwQ7V/yK0UA=;
 b=YCxyW82yvhrDvdTSZOrtzTfRi2z5vOF3Fu4aR6vzJqRcB4CS0JKWHqwXmVUOviWs9NxEnzw57ItE
 Tp4MuPFZBVgkR7/y//Ec9JvC9ux9b2/xvuVmYe1tiac1Lq+GtZok
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
Cc: Guenter Roeck <linux@roeck-us.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On fsl_book3e, rodata is set read-only at the same time as
init text is set NX at the end of init. That's too early.

As both action are performed at the same time, delay both
actions to the time rodata is expected to be made read-only.

It means we will have a small window with init mem freed but
still executable. It shouldn't be an issue though, especially
because the said memory gets poisoned and should therefore
result to a bad instruction fault in case it gets executer.

mmu_mark_initmem_nx() is bailing out before doing anything when
CONFIG_STRICT_KERNEL_RWX is not selected or rodata_enabled is false.

mmu_mark_rodata_ro() is called only when CONFIG_STRICT_KERNEL_RWX
is selected and rodata_enabled is true so this is equivalent.

Move code from mmu_mark_initmem_nx() into mmu_mark_rodata_ro() and
remove the call to strict_kernel_rwx_enabled() which is not needed
anymore.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: d5970045cf9e ("powerpc/fsl_booke: Update of TLBCAMs after init")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/fsl_book3e.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index 08a984e29433..036e6a0e0137 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -285,22 +285,19 @@ void __init adjust_total_lowmem(void)
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mmu_mark_rodata_ro(void)
-{
-	/* Everything is done in mmu_mark_initmem_nx() */
-}
-#endif
-
-void mmu_mark_initmem_nx(void)
 {
 	unsigned long remapped;
 
-	if (!strict_kernel_rwx_enabled())
-		return;
-
 	remapped = map_mem_in_cams(__max_low_memory, CONFIG_LOWMEM_CAM_NUM, false, false);
 
 	WARN_ON(__max_low_memory != remapped);
 }
+#endif
+
+void mmu_mark_initmem_nx(void)
+{
+	/* Everything is done in mmu_mark_rodata_ro() */
+}
 
 void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
-- 
2.35.3

