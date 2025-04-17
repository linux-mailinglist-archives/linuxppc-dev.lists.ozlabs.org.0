Return-Path: <linuxppc-dev+bounces-7732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9305A919D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 12:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdZVx2YS7z2yrM;
	Thu, 17 Apr 2025 20:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744887193;
	cv=none; b=fvX6/5cfgpu4wC6+zzyAiMcLfAHmxCdfOIpihtMq67gV9IjxsQYJc46TTIlFe4XERH0PzBEtjX32y9M5y0e+ZlaTmIv+wvjE//+QjRiV50ezt19RnRZZ4hdc4kswpSt+UZcPZk95k48M1bSXmGy5fCfgiixrINDGM9zmxKpZpbu1/JaGnXP0ON5It3445FDag6xe3ItYG58u+ucVGN6tQzocwujdCBFFZD0RP0an9xdEAsBOB6lRZQljyQVR0/5blLMfIctJGClMGc9+pl+C1SACrirV30g5tAqGBrOIByEgnkyP4GxhvIaBfGFMTGy36VBCMQWg+l6d7g0xncW4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744887193; c=relaxed/relaxed;
	bh=bGv19C02XM7HNCz2CoDyiF9v/2lkXEZchBIgIvlaDL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8Pl203iUnEDXcD6LKXJpWHueEVb4Jxxw4qEdOnFNWDFvIsUJz6mueiIXpuyzHP70s+AufESUL3e+SGQpSVh5Jc2Fe1smV/6y3MPISej/X7BlAgXKZdr3f3EcknEojuynFyW55O++nTlWgffWnfefAFWchmJ3Jg/5I0b3OUGsO2El3+BapuUEe5whifB4wnLTOLGg21Q7AKGumsQNpQ1UTsdzMitrDXMeYgABBvKiiXeoCwm2Dp/k1O1qI/2QZT52/WY7Z13y1tC1F8St99oOcUoBzrtjY2E6/iau7t1ZCbx2LEH1XvNvBRXc1H3P0K7xKu7zwM6u4+p/afcBIF4+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nw6iYQxw; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nw6iYQxw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdZVw1T99z2yfy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 20:53:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B692434E0;
	Thu, 17 Apr 2025 10:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F92CC4CEE4;
	Thu, 17 Apr 2025 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744887189;
	bh=DEOh/xDigK1NByOK61g6Wl8Mz/oDKd0FkZ/D+PwhbIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Nw6iYQxwYtNuZltKjS92K89pKZeAhf/kvap0qdjys+Df8PXk9eD1Uu5ugpZxaeRSv
	 HRPGjTMn9w3aowEuOW9xtHOfV+DPinue3nD+4ymR8Jr5SMdsE2pDmd+5fpAQfhv5gf
	 nqh7sjsPnM1f4oaEqxJjb7lEmXJKElOiJgu/BG1nviXvfab1elMzqPE6ryB75D9KJ5
	 6Ihn21t4UPUWFS6RIXx6TpBw07OhcwmMUU3IlkLHKGAuXENq6TWNhTLQzLPwbyqx+1
	 BSLA1hB6WXHfsKBZRXPJnyj8ApJCMvgG/HXnomnrcbZDuK0YuncedtIKjjEbGBNHTz
	 GL+Y68nhfAKQA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: maddy@linux.ibm.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: do not build ppc_save_regs.o always
Date: Thu, 17 Apr 2025 12:53:05 +0200
Message-ID: <20250417105305.397128-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
conditions to enable the build of ppc_save_regs.o. But it failed to do
so, in fact. The commit omitted to add a dollar sign.

Therefore, ppc_save_regs.o is built always these days (as
"(CONFIG_PPC_BOOK3S)" is never an empty string).

Fix this by adding the missing dollar sign.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Fixes: fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64s builds")
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 6ac621155ec3..0c26b2412d17 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -160,7 +160,7 @@ endif
 
 obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
 
-ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)(CONFIG_PPC_BOOK3S),)
+ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)$(CONFIG_PPC_BOOK3S),)
 obj-y				+= ppc_save_regs.o
 endif
 
-- 
2.49.0


