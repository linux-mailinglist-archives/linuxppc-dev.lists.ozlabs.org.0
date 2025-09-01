Return-Path: <linuxppc-dev+bounces-11567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30AB3E098
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 12:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFlyk5hwxz2yrB;
	Mon,  1 Sep 2025 20:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756723838;
	cv=none; b=Yat7Cf7gk5Vg37+53Z+C2yoXkRNs9NpaBG7iAkiNMcOMXY5bjtTfryG5ic+bzo3OQlw4TA63xHRtLyMdvonXGxcklAHQAplGMd83Qci6OuFLPe6abBsFQo+vVG6gUaCwDtgnD795XMMLC4fIxjEmDCygFRLL829Ok1SAfOhmiKOTuJ8D3nfaN2YW41tr6vePsNDHY4HJ8cfJfE/R95UKpfPwZ2srWF4oz3XklKgy//ZeXVLjK5j2fDM9j629xUe/4m3mjaGs6o8iYNT6v6N7RLKramYelA28+/4Xb03pzED1X4eRin4fi419jjXl2XocHkECz2p2VxaNvzQ6rnSTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756723838; c=relaxed/relaxed;
	bh=i6bzSVEwYdL2sFXXItKZ/3iKxXcmXbcmHcLT5jMEfXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kffamL0d2nzBGEW9AWKXWLPwveYvgCzzzGmM5/ZRl0eH+ZlaF8QeY3Iypo8uTCo+hxhtuCpHZr5YSEJkL3KoWr877KvxTiaLXmQC1uDWslhR5BYhq68howK+wT4wYC7OHxiUdqOvM4dbtY1+VrVWC/rf1CWXEUFdLwBVyCMTP3WnHcfUHB/aDjyQweViiAd8DT4njGedLqYVVCG/1OMByCthTz3lWhAaeqNWfZ3NZQBWV7I77rSXT4+2PPmRDGDdW9XVAnECB3jCTyZH0/3BPrsu204B442kvTj660kxsAkogWivMBkLh3oKyWfvbXMzoeNZLDVzUp4A3s2YX0jLJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFlyj6SDxz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 20:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFlgs4DDhz9sSK;
	Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIX_k0S4RAlZ; Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFlgs3YJCz9sSC;
	Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 646F38B78C;
	Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id anueRLxppAms; Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 43BED8B77B;
	Mon,  1 Sep 2025 12:37:45 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Restore clearing of MSR[RI] in interrupt_exit_kernel_prepare()
Date: Mon,  1 Sep 2025 12:37:42 +0200
Message-ID: <e6166d2568386517de96a89e6cb3c7bd67e71eec.1756723048.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756723062; l=990; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JY4nN22IRUYGqIwovVvxnnDJT9Tx3pnktgQJfDzu+l8=; b=y2rc7jN2J4jQtRTKtfGfL5xNOKpQuFwxU3QJQyLve6PYon5aub7ayqEdEj+rSIf2/kbus6dAD EkNdMGwCCR4D+OWc98sj/rbbjIwHY8/23Gq4YSj/7kDxd6cfzYuvS2n
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
up return from interrupt") removed the inconditional clearing of MSR[RI]
when returning from interrupt into kernel. But powerpc/32 doesn't
implement interrupt restart table hence still need MSR[RI] to be
cleared.

Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0c681d0b076..e63bfde13e03 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -443,6 +443,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 		if (unlikely(stack_store))
 			__hard_EE_RI_disable();
+#else
+	} else {
+		__hard_EE_RI_disable();
 #endif /* CONFIG_PPC64 */
 	}
 
-- 
2.49.0


