Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303761B8502
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 11:01:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Q5W4MWxzDrBr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 19:01:51 +1000 (AEST)
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
 header.s=mail header.b=cDms1dRQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498PhZ2BfgzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 18:43:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 498PhV1JSLz9txp3;
 Sat, 25 Apr 2020 10:43:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cDms1dRQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ES1suRTsPumc; Sat, 25 Apr 2020 10:43:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 498PhV03WFz9txnX;
 Sat, 25 Apr 2020 10:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587804218; bh=/lgZ5be7C2dgr3D45vmCyTrMsZNvNgzVwY0/UD2Mr1Q=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cDms1dRQ8k7Kl5vTZBwsSOARqsWEv+jqhX1jnaFXA3RNCxaCIYNMk4u2GQNX43Wc2
 6N8jDzZFoSL7mBu22a8ZrjGvCHndOrGeIthMb59S88BkBU9+jS91HxlGvqe4HwtVdx
 vWq2/B81NehBr3mgBWjz7PdcYabdwPwL03T8z9d8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E6738B769;
 Sat, 25 Apr 2020 10:43:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6dbaMBXKrtOt; Sat, 25 Apr 2020 10:43:39 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EADAD8B752;
 Sat, 25 Apr 2020 10:43:38 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AF70865877; Sat, 25 Apr 2020 08:43:38 +0000 (UTC)
Message-Id: <64b3de797ecaa53f5c91e5d76b6fb1fdc906ec86.1587804057.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1587804057.git.christophe.leroy@c-s.fr>
References: <cover.1587804057.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 10/13] powerpc/40x: Remove IBM405 Erratum #51
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Sat, 25 Apr 2020 08:43:38 +0000 (UTC)
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

This erratum was for IBM 403GCX, 405EP and STB03xxx which are
now gone.

Remove this erratum.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S     | 6 ------
 arch/powerpc/platforms/40x/Kconfig | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index b62b6ab769fc..faeea5b56525 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -425,13 +425,7 @@ _ENTRY(saved_ksp_limit)
 	EXCEPTION(0x1400, Trap_14, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_STD)
-#ifdef CONFIG_IBM405_ERR51
-	/* 405GP errata 51 */
-	START_EXCEPTION(0x1700, Trap_17)
-	b DTLBMiss
-#else
 	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_STD)
-#endif
 	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1A00, Trap_1A, unknown_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index 253c047fe6fe..ebe283476461 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -75,10 +75,6 @@ config PPC4xx_GPIO
 config IBM405_ERR77
 	bool
 
-# All 40x-based cores, up until the 405GPR and 405EP have this errata.
-config IBM405_ERR51
-	bool
-
 config APM8018X
 	bool "APM8018X"
 	depends on 40x
-- 
2.25.0

