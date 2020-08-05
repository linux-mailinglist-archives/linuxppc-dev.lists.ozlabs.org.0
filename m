Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7F23C6A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 09:11:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM2q76WcvzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 17:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM2mn70cjzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 17:09:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BM2mg4dB7z9vD3m;
 Wed,  5 Aug 2020 09:09:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C6ZTSBY6xrEi; Wed,  5 Aug 2020 09:09:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BM2mg3ZlMz9vD3j;
 Wed,  5 Aug 2020 09:09:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8FEC8B7E1;
 Wed,  5 Aug 2020 09:09:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rx_hIlBOx_ZP; Wed,  5 Aug 2020 09:09:24 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FC388B75F;
 Wed,  5 Aug 2020 09:09:24 +0200 (CEST)
Received: by po16052vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5A37E65BBD; Wed,  5 Aug 2020 07:09:24 +0000 (UTC)
Message-Id: <fbcca4cf3f73a059a6954b39fb5499bee5a0be60.1596611196.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1596611196.git.christophe.leroy@csgroup.eu>
References: <cover.1596611196.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v10 3/5] powerpc/vdso: Save and restore TOC pointer on PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, anton@ozlabs.org
Date: Wed,  5 Aug 2020 07:09:24 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PPC64, the TOC pointer needs to be saved and restored.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v9: New.

I'm not sure this is really needed, I can't see the VDSO C code doing
anything with r2, at least on ppc64_defconfig.

So I let you decide whether you take it or not.
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index e2c462796a22..8ed4329c9fb8 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -19,10 +19,16 @@
   .cfi_register lr, r0
 	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
 	PPC_STL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
+#ifdef CONFIG_PPC64
+	PPC_STL		r2, STACK_FRAME_OVERHEAD + STK_GOT(r1)
+#endif
 	get_datapage	r5, r0
 	addi		r5, r5, VDSO_DATA_OFFSET
 	bl		\funct
 	PPC_LL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
+#ifdef CONFIG_PPC64
+	PPC_LL		r2, STACK_FRAME_OVERHEAD + STK_GOT(r1)
+#endif
 	cmpwi		r3, 0
 	mtlr		r0
   .cfi_restore lr
@@ -42,10 +48,16 @@
   .cfi_register lr, r0
 	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
 	PPC_STL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
+#ifdef CONFIG_PPC64
+	PPC_STL		r2, STACK_FRAME_OVERHEAD + STK_GOT(r1)
+#endif
 	get_datapage	r4, r0
 	addi		r4, r4, VDSO_DATA_OFFSET
 	bl		\funct
 	PPC_LL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
+#ifdef CONFIG_PPC64
+	PPC_LL		r2, STACK_FRAME_OVERHEAD + STK_GOT(r1)
+#endif
 	crclr		so
 	mtlr		r0
   .cfi_restore lr
-- 
2.25.0

