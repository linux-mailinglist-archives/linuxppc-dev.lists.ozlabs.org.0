Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4E1B393
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 12:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452bwk5n4xzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 20:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Iw78WSCj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452bsf24THzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 20:00:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 452bsS0Bwkz9v1jM;
 Mon, 13 May 2019 12:00:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Iw78WSCj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xVhwNUTxPomi; Mon, 13 May 2019 12:00:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 452bsR67Kjz9v1jV;
 Mon, 13 May 2019 12:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557741611; bh=pt848MYhMrnfLmquFYiuTx2kZFGt5w9tP2p2+9ZTMM0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Iw78WSCj0WS9rFnTnPZ7/I08F2D2+zQBshdaZta0kPpnmmBrjATS/TP/AAqS3jumv
 RV7DUZZmj/4KHJpWH83ewEtHm4djVZiW/Cg0YPfLtfFi6wUcmAEGX3U3LDW26i9NrM
 ixPko349KkviJB/BU7Y/OhF3TV3Lnwc3z/itUZDQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 756CF8B883;
 Mon, 13 May 2019 12:00:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TZycueQ-iAhg; Mon, 13 May 2019 12:00:16 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFF3A8B8A4;
 Mon, 13 May 2019 12:00:15 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5C92C67402; Mon, 13 May 2019 10:00:15 +0000 (UTC)
Message-Id: <134ce533030ae76a60b88e3e73839681c1958f8c.1557741292.git.christophe.leroy@c-s.fr>
In-Reply-To: <7496da89e027e563cb8e62dc89548525cf53b57e.1557741292.git.christophe.leroy@c-s.fr>
References: <7496da89e027e563cb8e62dc89548525cf53b57e.1557741292.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/lib: only build ldstfp.o when CONFIG_PPC_FPU is
 set
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 13 May 2019 10:00:15 +0000 (UTC)
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

The entire code in ldstfp.o is enclosed into #ifdef CONFIG_PPC_FPU,
so there is no point in building it when this config is not selected.

Fixes: cd64d1697cf0 ("powerpc: mtmsrd not defined")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/lib/Makefile | 3 ++-
 arch/powerpc/lib/ldstfp.S | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 17fce3738d48..eebc782d89a5 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -49,7 +49,8 @@ obj64-$(CONFIG_KPROBES_SANITY_TEST)	+= test_emulate_step.o \
 obj-y			+= checksum_$(BITS).o checksum_wrappers.o \
 			   string_$(BITS).o
 
-obj-y			+= sstep.o ldstfp.o
+obj-y			+= sstep.o
+obj-$(CONFIG_PPC_FPU)	+= ldstfp.o
 obj64-y			+= quad.o
 
 obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
diff --git a/arch/powerpc/lib/ldstfp.S b/arch/powerpc/lib/ldstfp.S
index 32e91994b6b2..e388a3127cb6 100644
--- a/arch/powerpc/lib/ldstfp.S
+++ b/arch/powerpc/lib/ldstfp.S
@@ -18,8 +18,6 @@
 #include <asm/asm-compat.h>
 #include <linux/errno.h>
 
-#ifdef CONFIG_PPC_FPU
-
 #define STKFRM	(PPC_MIN_STKFRM + 16)
 
 /* Get the contents of frN into *p; N is in r3 and p is in r4. */
@@ -241,5 +239,3 @@ _GLOBAL(conv_dp_to_sp)
 	MTMSRD(r6)
 	isync
 	blr
-
-#endif	/* CONFIG_PPC_FPU */
-- 
2.13.3

