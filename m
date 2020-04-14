Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D0F1A765C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:44:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fD9210KzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:44:09 +1000 (AEST)
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
 header.s=mail header.b=WuvBJBwA; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgm2f5wzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgf2XY8z9tydY;
 Tue, 14 Apr 2020 10:19:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WuvBJBwA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jJzYB_7bVD7s; Tue, 14 Apr 2020 10:19:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgf1WfRz9tydT;
 Tue, 14 Apr 2020 10:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852366; bh=/lgZ5be7C2dgr3D45vmCyTrMsZNvNgzVwY0/UD2Mr1Q=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=WuvBJBwAtNigJ0spyZIqTfQQ8MxeFPcB6rFlU2zphe+D+ZcjnBp+CalvTTB++XaKO
 EEuurExXhk5X1vbpuL6QiphIbSevR1Rwh/n2preXtieBSFWvibK6r4cf3ktbcoIkrv
 cxrJy7rEjKLzViNsZtH/abjrmP/zyo0FJz3SVFMA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F7098B798;
 Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 77CbdN7KhNxV; Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01F6F8B796;
 Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id C85436578A; Tue, 14 Apr 2020 08:19:26 +0000 (UTC)
Message-Id: <7fe0c14129cc47a5ed48f8fa6b683538e9bfbe01.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 10/13] powerpc/40x: Remove IBM405 Erratum #51
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:26 +0000 (UTC)
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

