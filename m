Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA6901AC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 08:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyLkr052Yz78XD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 16:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyLdd0fH1z3d8Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 15:56:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VyLcZ3yQqz9v6q;
	Mon, 10 Jun 2024 07:55:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_D9Qep5mycJ; Mon, 10 Jun 2024 07:55:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VyLcL6RHvz9v6s;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D88528B76C;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id r7jHJNprZhwF; Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC2468B764;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 13/18] powerpc/e500: Don't pre-check write access on data TLB error
Date: Mon, 10 Jun 2024 07:54:58 +0200
Message-ID: <0780765a5886c138237cd5dff261ba3dc2fa0c3e.1717955559.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1717955558.git.christophe.leroy@csgroup.eu>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717998887; l=1564; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=lXkJFaNOZfYs39NvzB2t7aMNQd5E4EiqpUUgx2rbgYk=; b=fyJyaGlU5NvFz815btq/r5inIMAyEky/CE3RqaurfPadYazgPcX4AA+lxvS+wpiUIvBnwvv7O C0F9qRxXucpC1wTeclXpfTB9p5U430ODMwWXulaA1tSIAx1FXouEuLP
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't pre-check write access on read-only pages on data TLB error.

Load the TLB anyway and take a DSI exception when it happens. This
avoids reading SPRN_ESR at every data TLB error exception.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 arch/powerpc/kernel/head_85xx.S | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index a305244afc9f..282e49c51deb 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -472,27 +472,12 @@ END_BTB_FLUSH_SECTION
 #endif
 
 4:
-	/* Mask of required permission bits. Note that while we
-	 * do copy ESR:ST to _PAGE_WRITE position as trying to write
-	 * to an RO page is pretty common, we don't do it with
-	 * _PAGE_DIRTY. We could do it, but it's a fairly rare
-	 * event so I'd rather take the overhead when it happens
-	 * rather than adding an instruction here. We should measure
-	 * whether the whole thing is worth it in the first place
-	 * as we could avoid loading SPRN_ESR completely in the first
-	 * place...
-	 *
-	 * TODO: Is it worth doing that mfspr & rlwimi in the first
-	 *       place or can we save a couple of instructions here ?
-	 */
-	mfspr	r12,SPRN_ESR
 #ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT|_PAGE_BAP_SR
 	oris	r13,r13,_PAGE_ACCESSED@h
 #else
 	li	r13,_PAGE_PRESENT|_PAGE_READ|_PAGE_ACCESSED
 #endif
-	rlwimi	r13,r12,11,29,29
 
 	FIND_PTE
 	andc.	r13,r13,r11		/* Check permission */
-- 
2.44.0

