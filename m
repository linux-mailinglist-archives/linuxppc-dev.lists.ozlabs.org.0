Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E607FB41CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 22:28:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XHrL4fr8zDrKn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qc2T5P4b"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XHn64lhgzF3Mx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 06:25:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46XHn274NLz9v0sp;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qc2T5P4b; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W_5UD_T94ppf; Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46XHn2603lz9v0sm;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568665542; bh=EfeppcJfC7z4dz+NpDaNTk1OezSvA6hyV2vlPsX3zdQ=;
 h=From:Subject:To:Cc:Date:From;
 b=qc2T5P4bhLOJoXzmeUEqXDyn6GzxgKREKfKhCztODnRYXyep+GBRQ7r3P3b9aVk0w
 IZu0kgm4yo7BGrqMGXF7+jeVO5XnbbH+PSDg4ze3CcVYSogFF0OQT9F4NULR+oQ4kU
 PIowAGQfDB6Pq9R8VUcZweRRcG4LEqqkLg54eYlA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA2D98B848;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tvSznHTgdhzQ; Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3C738B841;
 Mon, 16 Sep 2019 22:25:42 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id A38306B763; Mon, 16 Sep 2019 20:25:39 +0000 (UTC)
Message-Id: <a212bd36fbd6179e0929b6c727febc35132ac25c.1568665466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/2] powerpc/32s: automatically allocate BAT in setbat()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 oss@buserror.net, galak@kernel.crashing.org
Date: Mon, 16 Sep 2019 20:25:39 +0000 (UTC)
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

If no BAT is given to setbat(), select an available BAT.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: no change
v3: no change
---
 arch/powerpc/mm/book3s32/mmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 84d5fab94f8f..69b2419accef 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -251,9 +251,18 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 {
 	unsigned int bl;
 	int wimgxpp;
-	struct ppc_bat *bat = BATS[index];
+	struct ppc_bat *bat;
 	unsigned long flags = pgprot_val(prot);
 
+	if (index == -1)
+		index = find_free_bat();
+	if (index == -1) {
+		pr_err("%s: no BAT available for mapping 0x%llx\n", __func__,
+		       (unsigned long long)phys);
+		return;
+	}
+	bat = BATS[index];
+
 	if ((flags & _PAGE_NO_CACHE) ||
 	    (cpu_has_feature(CPU_FTR_NEED_COHERENT) == 0))
 		flags &= ~_PAGE_COHERENT;
-- 
2.13.3

