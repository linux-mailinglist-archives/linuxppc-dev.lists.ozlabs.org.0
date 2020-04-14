Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5E1A7668
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:49:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fLS2t5nzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=jZxn3ODM; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgn4MqHzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgj2vRdz9tydc;
 Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jZxn3ODM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id K1nEimlO-mtz; Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgj1vNGz9tydZ;
 Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852369; bh=RsyxMy7Y5Bx9LrA8rcOoGxnVO3hSnKKPR8y4ZmX75Pg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jZxn3ODMiqKMwokxZePb8whd4KMBgWkMXyPD466oQkWR634Y2xIL8wuE22W4AnZ6m
 a09qAvAOhIs+HNIQj3+Pz5wbT6VgJg29uW7EBS3DldAp0OwGtv7aDO1OLfWwd/lJbE
 aD71oy61jJmKtVJX2wcP8UjBxPfuWhMXI8no7LGg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 53FF78B797;
 Tue, 14 Apr 2020 10:19:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4G1S6cfpD57T; Tue, 14 Apr 2020 10:19:30 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18D5B8B796;
 Tue, 14 Apr 2020 10:19:30 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id E0D6F6578A; Tue, 14 Apr 2020 08:19:29 +0000 (UTC)
Message-Id: <b6b9b7f710a21d9dc0ab60825ad10bb568835726.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 13/13] powerpc/40x: Don't save CR in SPRN_SPRG_SCRATCH6
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:29 +0000 (UTC)
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

We have r12 available, use it to keep CR around and don't
save it in SPRN_SPRG_SCRATCH6.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 804cbd0899ac..f9b880235aee 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -253,9 +253,8 @@ _ENTRY(saved_ksp_limit)
 	mtspr	SPRN_SPRG_SCRATCH1, r11
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
+	mfcr	r12
 	mfspr	r9, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
 	mtspr	SPRN_SPRG_SCRATCH5, r9
 	mfspr	r10, SPRN_DEAR		/* Get faulting address */
 
@@ -322,9 +321,8 @@ _ENTRY(saved_ksp_limit)
 	 * and call the heavyweights to help us out.
 	 */
 	mfspr	r9, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r9
-	mtcr	r11
+	mtcr	r12
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
 	mfspr	r11, SPRN_SPRG_SCRATCH1
@@ -340,9 +338,8 @@ _ENTRY(saved_ksp_limit)
 	mtspr	SPRN_SPRG_SCRATCH1, r11
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
+	mfcr	r12
 	mfspr	r9, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
 	mtspr	SPRN_SPRG_SCRATCH5, r9
 	mfspr	r10, SPRN_SRR0		/* Get faulting address */
 
@@ -409,9 +406,8 @@ _ENTRY(saved_ksp_limit)
 	 * and call the heavyweights to help us out.
 	 */
 	mfspr	r9, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r9
-	mtcr	r11
+	mtcr	r12
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
 	mfspr	r11, SPRN_SPRG_SCRATCH1
@@ -555,9 +551,8 @@ finish_tlb_load:
 	/* Done...restore registers and get out of here.
 	*/
 	mfspr	r9, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
 	mtspr	SPRN_PID, r9
-	mtcr	r11
+	mtcr	r12
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
 	mfspr	r11, SPRN_SPRG_SCRATCH1
-- 
2.25.0

