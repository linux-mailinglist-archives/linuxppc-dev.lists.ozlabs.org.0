Return-Path: <linuxppc-dev+bounces-6757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6FA54863
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 11:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7mQl5qKCz30P3;
	Thu,  6 Mar 2025 21:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741258207;
	cv=none; b=VnsJjp7thsMIA6kybeZYrWx/wKV8u111jD5Rk4rbelKTFRH9+AYYvarEnKhSLju0suKzGkVIPObwThLg6hnhpbRxrEVRYakrYoz2GJOIj6380F+gcng8vbF3T2H4RAkCzVJSnEjBxFSzyDf3G3HaZrrs7zc2rZdfMyJGmKqhEJnJ+XCU6C1/sch/YwoHVMkdiEu88fFaOAcADRUpr6hlPay1ENfS9A5HgGczKjsG5gR/nW9MZ1g8BLj+RxTWxxLOJNSsD9q5YTWY18I4Q6Cy5Jowh21+eM5o2VhAt52lW6GjXuPjYtqrr+pDRmEvLYVovPecxh0aR+arOl4aJaseQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741258207; c=relaxed/relaxed;
	bh=fwtXMul9aUvmMTW2AQYb5SIt3R1zuCiwG/ZKSRh8SsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXTJFeQ15msfxZKBHjx6pPeIge5Zlcwk5bexM+SSldjXepG5Eoya2xpkac2Ap1jYPvIYB/cTxShxTTxGoSW8sZU5pmLQV7tubP1A7XtOYdxluwELxdH8h4s8iOGO8OIpxw7zv3tSddTA6qoidvdyWRaN+AqIzg31jjPvamINOjl20sF1JLxgEjvWO9xcRO1z9uEDk38HPsYx7yzinR1+b4anRTt2piiU+VKfdnIkh5DKaQNmd/6M+CWTa53HJc5h+x4n0wWfL1VOv6+FZSp/6gGGdRUw0gHgew6DzzQSWAEfQ1E95reMCfWybtKoQ2Sqg5y454ccssBdxEvWJdDAOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7mQk6Nm2z2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 21:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z7lsP5KYTz9stG;
	Thu,  6 Mar 2025 11:24:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4vbfzpb9Tx7; Thu,  6 Mar 2025 11:24:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z7lsP4K5zz9rvV;
	Thu,  6 Mar 2025 11:24:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A1338B766;
	Thu,  6 Mar 2025 11:24:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cLeejrd8zjee; Thu,  6 Mar 2025 11:24:41 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E9DD58B763;
	Thu,  6 Mar 2025 11:24:40 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/kexec: fix physical address calculation in clear_utlb_entry()
Date: Thu,  6 Mar 2025 11:24:28 +0100
Message-ID: <dc4f9616fba9c05c5dbf9b4b5480eb1c362adc17.1741256651.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741256668; l=1671; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aOImr5/U4ykbLTFYU0AB+Akmi9BbY0kGzfkbj74bCbw=; b=63/dW0ZW/45Bs9gOVtFdTdT4ylZccTHf357VIIIUuXR8lbn4iNW72GNZX4ilfWq8C5hADM0qG TBMsNMy1qQRDXRvsnpovR4/UyApzga3NB8oKN3M68m5tr8+cuj4rQJ4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In relocate_32.S, function clear_utlb_entry() goes into real mode. To
do so, it has to calculate the physical address based on the virtual
address. To get the virtual address it uses 'bl' which is problematic
(see commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
in __get_datapage()")). In addition, the calculation is done on a
wrong address because 'bl' loads LR with the address of the following
instruction, not the address of the target. So when the target is not
the instruction following the 'bl' instruction, it may lead to
unexpected behaviour.

Fix it by re-writing the code so that is goes via another path which
is based 'bcl 20,31,.+4' which is the right instruction to use for that.

Fixes: 683430200315 ("powerpc/47x: Kernel support for KEXEC")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Fixed patch description and added Fixes: tag.
[Previous patch subject was "powerpc: Fix address calculation in clear_utlb_entry()"]
---
 arch/powerpc/kexec/relocate_32.S | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kexec/relocate_32.S b/arch/powerpc/kexec/relocate_32.S
index 104c9911f406..dd86e338307d 100644
--- a/arch/powerpc/kexec/relocate_32.S
+++ b/arch/powerpc/kexec/relocate_32.S
@@ -348,16 +348,13 @@ write_utlb:
 	rlwinm	r10, r24, 0, 22, 27
 
 	cmpwi	r10, PPC47x_TLB0_4K
-	bne	0f
 	li	r10, 0x1000			/* r10 = 4k */
-	ANNOTATE_INTRA_FUNCTION_CALL
-	bl	1f
+	beq	0f
 
-0:
 	/* Defaults to 256M */
 	lis	r10, 0x1000
 
-	bcl	20,31,$+4
+0:	bcl	20,31,$+4
 1:	mflr	r4
 	addi	r4, r4, (2f-1b)			/* virtual address  of 2f */
 
-- 
2.47.0


