Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290863D2E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:46:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbVN4GBCzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:46:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="bI7NTUW8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NZBj2wY4zDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 01:47:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NZBc2NN5z9v0FR;
 Tue, 11 Jun 2019 17:47:20 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bI7NTUW8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id B7h4bXuV-81Y; Tue, 11 Jun 2019 17:47:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NZBc0hwjz9v0FQ;
 Tue, 11 Jun 2019 17:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560268040; bh=1fnYeG8GbpjnYF6TrsfmDTOmxu5dgndNejmbugqQbx8=;
 h=From:Subject:To:Cc:Date:From;
 b=bI7NTUW88Vx5QZFajwgZyStnlVOl6u4+b+RdZ95JenYNvgDN462Dclzmdg+Ob4seQ
 nR9EWjUxHij/lbqFk2OpzV6SRucW26gHJ4nhgaegJvU36t82qnh+8q3JE5NNSkS3JY
 JXpI+yxyVdLmrGD0cghtcOglJUQaFKID6V7MNUoA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 587AA8B7F8;
 Tue, 11 Jun 2019 17:47:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qgv5iWZpPYN7; Tue, 11 Jun 2019 17:47:21 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5E578B7F7;
 Tue, 11 Jun 2019 17:47:20 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B4CAB68D05; Tue, 11 Jun 2019 15:47:20 +0000 (UTC)
Message-Id: <be07403806abc56ec027f6d47468411876e18bb5.1560267983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: fix initial setup of segment registers on
 secondary CPU
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 erhard_f@mailbox.org
Date: Tue, 11 Jun 2019 15:47:20 +0000 (UTC)
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

The patch referenced below moved the loading of segment registers
out of load_up_mmu() in order to do it earlier in the boot sequence.
However, the secondary CPU still needs it to be done when loading up
the MMU.

Reported-by: Erhard F. <erhard_f@mailbox.org>
Fixes: 215b823707ce ("powerpc/32s: set up an early static hash table for KASAN")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 1d5f1bd0dacd..f255e22184b4 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -752,6 +752,7 @@ __secondary_start:
 	stw	r0,0(r3)
 
 	/* load up the MMU */
+	bl	load_segment_registers
 	bl	load_up_mmu
 
 	/* ptr to phys current thread */
-- 
2.13.3

