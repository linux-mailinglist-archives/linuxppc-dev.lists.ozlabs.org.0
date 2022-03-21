Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BD4E2CAC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMf8L3KVFz30Pq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 02:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMf7w4c61z3bfP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 02:45:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KMf7s3SVGz9sTR;
 Mon, 21 Mar 2022 16:44:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTON49PSekrA; Mon, 21 Mar 2022 16:44:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KMf7s2jxKz9sTJ;
 Mon, 21 Mar 2022 16:44:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4ADA28B76C;
 Mon, 21 Mar 2022 16:44:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WHfqW7FVGiGT; Mon, 21 Mar 2022 16:44:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 353D58B763;
 Mon, 21 Mar 2022 16:44:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22LFimKO961652
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 16:44:48 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22LFilCw961651;
 Mon, 21 Mar 2022 16:44:47 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: align address to page boundary in change_page_attr()
Date: Mon, 21 Mar 2022 16:44:45 +0100
Message-Id: <6bb118fb2ee89fa3c1f9cf90ed19f88220002cb0.1647877467.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647877483; l=1785; s=20211009;
 h=from:subject:message-id; bh=XD7Tck9OiYXR05COoXx5aqfW6pqO+VH6BD8lG/u3XEg=;
 b=TmSNUn02E3l15lu/1NK8vuqd8N+RO1fZ2rCnCFpIHKhiTQJDbao2uLhkrJ/7Wqtz9t4sFpp3SV9r
 c2QRt9ypCsWedDYifJx8yhAvx96L7TGbx/9tGCsL0xhs5oLyBx4V
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aligning address to page boundary allows flush_tlb_kernel_range()
to know it's a single page flush and use tlbie instead of tlbia.

On 603 we now have the following code in first leg of
change_page_attr():

	  2c:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
	  30:	91 23 00 00 	stw     r9,0(r3)
	  34:	7c 00 22 64 	tlbie   r4,r0
	  38:	7c 00 04 ac 	hwsync
	  3c:	38 60 00 00 	li      r3,0
	  40:	4e 80 00 20 	blr

Before we had:

	  28:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
	  2c:	91 23 00 00 	stw     r9,0(r3)
	  30:	54 89 00 26 	rlwinm  r9,r4,0,0,19
	  34:	38 84 10 00 	addi    r4,r4,4096
	  38:	7c 89 20 50 	subf    r4,r9,r4
	  3c:	28 04 10 00 	cmplwi  r4,4096
	  40:	41 81 00 30 	bgt     70 <change_page_attr+0x70>
	  44:	7c 00 4a 64 	tlbie   r9,r0
	  48:	7c 00 04 ac 	hwsync
	  4c:	38 60 00 00 	li      r3,0
	  50:	4e 80 00 20 	blr
	...
	  70:	94 21 ff f0 	stwu    r1,-16(r1)
	  74:	7c 08 02 a6 	mflr    r0
	  78:	90 01 00 14 	stw     r0,20(r1)
	  7c:	48 00 00 01 	bl      7c <change_page_attr+0x7c>
				7c: R_PPC_REL24	_tlbia
	  80:	80 01 00 14 	lwz     r0,20(r1)
	  84:	38 60 00 00 	li      r3,0
	  88:	7c 08 03 a6 	mtlr    r0
	  8c:	38 21 00 10 	addi    r1,r1,16
	  90:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/pageattr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 85753e32a4de..6163e484bc6d 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -31,6 +31,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 {
 	long action = (long)data;
 
+	addr &= PAGE_MASK;
 	/* modify the PTE bits as desired */
 	switch (action) {
 	case SET_MEMORY_RO:
-- 
2.35.1

