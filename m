Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6E1A763D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:34:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491f1250TQzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:34:30 +1000 (AEST)
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
 header.s=mail header.b=iJRtpihP; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgj3NclzDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgd3ZLyz9tydX;
 Tue, 14 Apr 2020 10:19:25 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iJRtpihP; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4V4LQiifNT80; Tue, 14 Apr 2020 10:19:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgd2YLhz9tydT;
 Tue, 14 Apr 2020 10:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852365; bh=P5l/XUfUvD4P00st6kgxn9/rml1eRRECj9OWtVUlXpg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=iJRtpihPkggZ5i1hMqrmky1S8ldtIo29f/5nR2JTCWLlSYnMrwYw2v1wAVchTYsKW
 ExX0ZMQRcL7PTQ/JgNDr0cQW7yESUe+pZhgVSRBL1tjP/8DpkbiLbweiulhv0m6dWM
 1ld6hsoEswW0hltcpf8V4phb2m9e+9oYplr8u7LU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 662C78B797;
 Tue, 14 Apr 2020 10:19:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G3sFzHe7Qy3X; Tue, 14 Apr 2020 10:19:26 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F05618B796;
 Tue, 14 Apr 2020 10:19:25 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id C33ED6578A; Tue, 14 Apr 2020 08:19:25 +0000 (UTC)
Message-Id: <c43cc980a4483879f555d46399b296957a46fe8e.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 09/13] powerpc/40x: Remove support for IBM 405GP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:25 +0000 (UTC)
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

All platforms selecting the obsolete processor are gone now.

Remove support for it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/cputable.c     | 13 -------------
 arch/powerpc/platforms/40x/Kconfig |  6 ------
 2 files changed, 19 deletions(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index bdc4eab0daaf..8ed553734919 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1232,19 +1232,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 	},
 #endif /* CONFIG_PPC_8xx */
 #ifdef CONFIG_40x
-	{	/* 405GP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40110000,
-		.cpu_name		= "405GP",
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
index 5d9d96e7223a..253c047fe6fe 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -51,12 +51,6 @@ config PPC40x_SIMPLE
 	help
 	  This option enables the simple PowerPC 40x platform support.
 
-config 405GP
-	bool
-	select IBM405_ERR77
-	select IBM405_ERR51
-	select IBM_EMAC_ZMII if IBM_EMAC
-
 config 405EX
 	bool
 	select IBM_EMAC_EMAC4 if IBM_EMAC
-- 
2.25.0

