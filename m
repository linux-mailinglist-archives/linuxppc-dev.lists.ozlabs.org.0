Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2E1B84ED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 10:54:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498PxR3gYvzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 18:54:51 +1000 (AEST)
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
 header.s=mail header.b=mdWsb0NB; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498PhT4fClzDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 18:43:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 498PhN6Ny5z9txnp;
 Sat, 25 Apr 2020 10:43:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mdWsb0NB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sqh032_8E5Nl; Sat, 25 Apr 2020 10:43:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 498PhN5K4kz9txng;
 Sat, 25 Apr 2020 10:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587804212; bh=nC9NRfBEIcyt/C5wbGz/eU58sV6bgIGO/DlyXSHQ5oM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=mdWsb0NBWTNrA0ODDNN1spnHlOU3lOOlF36XYIkzvgvCaqBpr9g3+vW7yYrytXJrs
 QDsIUUQrpO3md2efqb8m+MxmOwIx+sFZdraN08dHnA3VHAViB0+haHx/H4Odw1YMtV
 G50KZCdFnhXKenApgsQfLKNdSPcLK4VHZEDNKpL0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E99DE8B769;
 Sat, 25 Apr 2020 10:43:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zPA3T83WqsMY; Sat, 25 Apr 2020 10:43:33 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B69118B752;
 Sat, 25 Apr 2020 10:43:33 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 878D465875; Sat, 25 Apr 2020 08:43:33 +0000 (UTC)
Message-Id: <c4d610c9e981a3712ae5393489c74c353070be0d.1587804057.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1587804057.git.christophe.leroy@c-s.fr>
References: <cover.1587804057.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 05/13] powerpc/40x: Remove STB03xxx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Sat, 25 Apr 2020 08:43:33 +0000 (UTC)
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

CONFIG_STB03xxx is not user selectable and is not selected
by any config.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/cputable.c     | 13 -------------
 arch/powerpc/platforms/40x/Kconfig |  5 -----
 2 files changed, 18 deletions(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 61bd8fb408b2..bdc4eab0daaf 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1245,19 +1245,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_4xx,
 		.platform		= "ppc405",
 	},
-	{	/* STB 03xxx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40130000,
-		.cpu_name		= "STB03xxx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
 	{	/* STB 04xxx */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x41810000,
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index 8669be59948c..ca8f44650647 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -86,11 +86,6 @@ config 405EZ
 	select IBM_EMAC_MAL_CLR_ICINTSTAT if IBM_EMAC
 	select IBM_EMAC_MAL_COMMON_ERR if IBM_EMAC
 
-config STB03xxx
-	bool
-	select IBM405_ERR77
-	select IBM405_ERR51
-
 config PPC4xx_GPIO
 	bool "PPC4xx GPIO support"
 	depends on 40x
-- 
2.25.0

