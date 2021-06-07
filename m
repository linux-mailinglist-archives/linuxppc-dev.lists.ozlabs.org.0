Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75339D91A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 11:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz7wH5ywGz3bsw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 19:53:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz7vz2g7jz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 19:52:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fz7vr17S4zB9k7;
 Mon,  7 Jun 2021 11:52:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UvNQhhKzusu; Mon,  7 Jun 2021 11:52:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fz7vr0FtYzB9jy;
 Mon,  7 Jun 2021 11:52:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C20038B78F;
 Mon,  7 Jun 2021 11:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aT1VFKAxzZko; Mon,  7 Jun 2021 11:52:39 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A86288B78D;
 Mon,  7 Jun 2021 11:52:38 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 45F2664C67; Mon,  7 Jun 2021 09:52:38 +0000 (UTC)
Message-Id: <d2d520231f8082f9c1f7a896af8db1d09565ac84.1623059495.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3] powerpc: Fixup for v3 "powerpc/nohash: Refactor update of
 BDI2000 pointers in switch_mmu_context()" in next-test
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  7 Jun 2021 09:52:38 +0000 (UTC)
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

As mentionned in history, v3 doesn't apply to book3s/32 so the hunk
on head_book3s_32.S has to be dropped from the commit mentionned
in the title.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Michael, tell me if you prefer a v4 of the series.
---
 arch/powerpc/kernel/head_book3s_32.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 32c27dac9b80..326262030279 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1282,3 +1282,9 @@ EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
+
+/* Room for two PTE pointers, usually the kernel and current user pointers
+ * to their respective root page table.
+ */
+abatron_pteptrs:
+	.space	8
-- 
2.25.0

