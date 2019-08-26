Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E39D36F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:54:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HGlX2kVlzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 01:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="F4HiHO09"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGjH6NwtzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:52:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HGj53dmjz9v7Dm;
 Mon, 26 Aug 2019 17:52:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F4HiHO09; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Onjx9NsiuY8B; Mon, 26 Aug 2019 17:52:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HGj52Yyjz9v7Dl;
 Mon, 26 Aug 2019 17:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566834729; bh=kt+CYoK4PGukDXYgVhxhNn93WidNLx35FNjgmxgzUro=;
 h=From:Subject:To:Cc:Date:From;
 b=F4HiHO09Hnl+Qa4+MNUIU8WW2D3FYQ5UR1EIwTfDHA7RJwVZ+Zt66BFQREA8cXdok
 kLP14vGG9vrZURNvwM+G3OLgJiOx4REgrSTHs/qx3IcI4DnwkJz0H38yVUNOB7rUYs
 wKf+kalw4m13bk+0CgrJ7Zt4+Raf1l+68Rs/cmfQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A87F08B7EF;
 Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sh8BbHsLWtL2; Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 307838B7E1;
 Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 03822696D5; Mon, 26 Aug 2019 15:52:13 +0000 (UTC)
Message-Id: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/6] powerpc/32s: add an option to exclusively select powerpc
 601
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 15:52:13 +0000 (UTC)
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

Powerpc 601 is rather old powerpc which as some important
limitations compared to other book3s/32 powerpcs:
- No Timebase.
- Common BATs for instruction and data.
- No execution protection in segment registers.
- No RI bit in MSR
- ...

It is starting to be difficult and cumbersome to maintain
kernels that are compatible both with 601 and other 6xx cores.

Create a compiletime option to exclusively select either powerpc 601
or other 6xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/Kconfig.cputype | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 56a7c814160d..68c5cc075bfc 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -6,6 +6,9 @@ config PPC64
 	  This option selects whether a 32-bit or a 64-bit kernel
 	  will be built.
 
+config PPC_BOOK3S_32
+	bool
+
 menu "Processor support"
 choice
 	prompt "Processor Type"
@@ -21,13 +24,20 @@ choice
 
 	  If unsure, select 52xx/6xx/7xx/74xx/82xx/83xx/86xx.
 
-config PPC_BOOK3S_32
-	bool "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
+config PPC_BOOK3S_6xx
+	bool "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx except 601"
+	select PPC_BOOK3S_32
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 
+config PPC_BOOK3S_601
+	bool "PowerPC 601"
+	select PPC_BOOK3S_32
+	select PPC_FPU
+	select PPC_HAVE_KUAP
+
 config PPC_85xx
 	bool "Freescale 85xx"
 	select E500
-- 
2.13.3

