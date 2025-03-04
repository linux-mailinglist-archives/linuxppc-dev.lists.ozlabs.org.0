Return-Path: <linuxppc-dev+bounces-6714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F932A4F159
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 00:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s952W5nz30MZ;
	Wed,  5 Mar 2025 10:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741130409;
	cv=none; b=JiLM4W8bNTwqTGjmuC5g0wqOFRDPBtnT6KxiMMIoAen1oyFz8Tk7YLJoeUOMwZ7BSvCBJm2z74jNgpwSOOWy0OSWglVW29e0BM8gRyZQot2sOZt9q5zR6sn4uerjIhzlYNYws4CzvYVzr9tFHhIuElH0z7QsoVlwo6LMGz2AD9p0eGuG6y7VnYxbu6OE3CVNYIw28xHTmBpl4M2PbQm7GeEtFDhLNmfKUxb90u0m0hKsOzDY34ThJ1PX5uwJBGdiHCd2+BJ0Ua0/H6JnjNDuAwwHK8/XrxDI1VDdKDgvSxq1y3HEzpsX4IEj+nbslWQ+5Z0Pa3PWMxtL2POLtTmd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741130409; c=relaxed/relaxed;
	bh=JwpDBeI+IBaM4JIxtPwiTBJufLD0nCE73cepz9zAt08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y513OLw/aYkqaXrlQrAHC/9D+g5vYgxjY1AF55gLMN2FH9edM9nRs9JCSDDsrmtezgVgejS0SNDTm4Lw+5Hb5u0NbEfGgePiEoE4EO5+6zu1/inw/+a90sDkBNMhRaXN+gl6OD3r1zdp4C23xyiVCdbxu1Xm4hQSwIgBW8EV5jWyuRhrXfP0ycmTW4H1ZaVYqLupjwZeX8FFNoNPjoC6H/vMnR03RrSdW0I+Ff+7qcaJ8qXFg9pTKHRJtSnzCu78Q21BywZLQG+ttXoa+4HjICdLZz8C0CplQgH64R19Dgeg3nwZih+jxn2QlZPy/OkpBFAi96rO3aXkWTSEVlK6qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s942vT8z30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 10:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6rjw6nlzz9stH;
	Wed,  5 Mar 2025 00:00:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLfibhs76Dlw; Wed,  5 Mar 2025 00:00:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6rjv31DTz9stG;
	Wed,  5 Mar 2025 00:00:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 537F88B776;
	Wed,  5 Mar 2025 00:00:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id A0eNGyMj1i94; Wed,  5 Mar 2025 00:00:03 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 70FCA8B763;
	Wed,  5 Mar 2025 00:00:02 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix address calculation in clear_utlb_entry()
Date: Tue,  4 Mar 2025 23:59:56 +0100
Message-ID: <e7ef54814c5341f201bee89aa401b5ab20164af6.1741128988.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741129197; l=1214; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=zj/1hg648gPj2/H3MIvqSLwL5kgx31RsIUiX/gZMNZI=; b=9R4+xIsE5RbZ7e//sO6xPodl1H9aLYMmhkehdnx/c98wFnoNGl6DsVCXQ31j+Ofnli45EUKzC Jxv4xV0nXrrBre25Jwmd4k9ocgYsDz2urrKguoXJLjyh7ucKQmAodPU
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In relocatable.S, function clear_utlb_entry() goes into real mode. To
do so, it has to calculate the physical address based on the virtual
address. To get the virtual address it used 'bl' which is problematic
(see commit XXX). In addition, the calculation is done on a bad address,
which may lead to unexpected behaviour.

Fix it by re-writing the code so that is goes via another path which
is based 'bcl 20,31,.+4' which is the right instruction to use for that.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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


