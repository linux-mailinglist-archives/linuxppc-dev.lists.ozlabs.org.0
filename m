Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC6128856
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 10:04:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g06G6xJfzDqxj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 20:04:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qTms3eIk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fzQ457gZzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 19:32:44 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fzPx461nz9txh9;
 Sat, 21 Dec 2019 09:32:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qTms3eIk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id teNqOt-k_Vr5; Sat, 21 Dec 2019 09:32:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fzPx33Gvz9txh8;
 Sat, 21 Dec 2019 09:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576917157; bh=s9tlncPBPF5ltYj2UYw1kqY6LrypIxcWu7hdOtJZAuk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=qTms3eIk2zKkMN/kwQc1BnM/S7KR4OnLEdLMCb4yf03SSme6S5LkKlrAUuX1wiDlK
 9Scyfud9umGbrASJBaEzLlXZTRfeEZg08j/qP5eZfwrr73IARVTNbhgG2mj1FF9g9/
 BzTRFv4lRtu2XEqwgwaybdGe1QWVB/jRiEIgudFY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E21B8B77C;
 Sat, 21 Dec 2019 09:32:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kNRebGGzUM1g; Sat, 21 Dec 2019 09:32:38 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1762D8B752;
 Sat, 21 Dec 2019 09:32:38 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id D4AED637B6; Sat, 21 Dec 2019 08:32:37 +0000 (UTC)
Message-Id: <30d2cda111b7977227fff067fa7e358440e2b3a4.1576916812.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1576916812.git.christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 16/17] powerpc/32s: avoid crossing page boundary while
 changing SRR0/1.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Sat, 21 Dec 2019 08:32:37 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trying VMAP_STACK with KVM, vmlinux was not starting.
This was due to SRR0 and SRR1 clobbered by an ISI due to
the rfi being in a different page than the mtsrr0/1:

c0003fe0 <mmu_off>:
c0003fe0:       38 83 00 54     addi    r4,r3,84
c0003fe4:       7c 60 00 a6     mfmsr   r3
c0003fe8:       70 60 00 30     andi.   r0,r3,48
c0003fec:       4d 82 00 20     beqlr
c0003ff0:       7c 63 00 78     andc    r3,r3,r0
c0003ff4:       7c 9a 03 a6     mtsrr0  r4
c0003ff8:       7c 7b 03 a6     mtsrr1  r3
c0003ffc:       7c 00 04 ac     hwsync
c0004000:       4c 00 00 64     rfi

Align the 4 instruction block used to deactivate MMU to order 4,
so that the block never crosses a page boundary.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 7ec780858299..90ef355e958b 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -917,6 +917,8 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	ori	r4,r4,2f@l
 	tophys(r4,r4)
 	li	r3,MSR_KERNEL & ~(MSR_IR|MSR_DR)
+
+	.align	4
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r3
 	SYNC
@@ -1058,6 +1060,8 @@ _ENTRY(update_bats)
 	rlwinm	r0, r6, 0, ~MSR_RI
 	rlwinm	r0, r0, 0, ~MSR_EE
 	mtmsr	r0
+
+	.align	4
 	mtspr	SPRN_SRR0, r4
 	mtspr	SPRN_SRR1, r3
 	SYNC
@@ -1097,6 +1101,8 @@ mmu_off:
 	andi.	r0,r3,MSR_DR|MSR_IR		/* MMU enabled? */
 	beqlr
 	andc	r3,r3,r0
+
+	.align	4
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r3
 	sync
-- 
2.13.3

