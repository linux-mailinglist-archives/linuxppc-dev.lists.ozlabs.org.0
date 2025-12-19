Return-Path: <linuxppc-dev+bounces-14909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A58FACD0CDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 17:17:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXt3N1dWyz2yFn;
	Sat, 20 Dec 2025 03:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766161040;
	cv=none; b=JbvjXIyguEGdc7p3pMKB5soQtCRdzHOekNIQPceQ6TEcfK6L7WubkTRBD1+ngmTvvWk16tSlzUEOn2ngTcHY2ohSxX/Xy6k8C6kMCgBaS7OyjD9mHcoraxegoQ9D7E6+b8Fk2s0kyi7SfU5KubkV+X/4zmrqrEYPBhdD3RXA0YVKyJDsuMcS47TxU4Z9kke2NWU53XEOtxpyEPXhFmSUlF2ODE/G3uaT5Y9rhB1UmU1ehpo4CGo8pCY2TRJPEl+Z/jjSDs8kRLr3LKyHI5cZbe4vlIMn8fEb8jMow3CEhi1PmcJqKL7GUpYnZ+IFcD/bfPTGsi2RwLMzpqUDoB3nNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766161040; c=relaxed/relaxed;
	bh=01cMqftZsswJxQ3FrQQhcZuowTNtnEI5y+kOuc6pxjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OwH0wtByB8pbuiQdNa8XEyp5RIP49UjX0KTAaBT+H/kIWAt3pXGasylS4jc3Hkv+B9TstDkZQMwzZdGtN9UBYimV5l/QkMV97QzcLO3FiUrrBA9pt/YgmbZROYfTHBHtgvL5AVwQP8UF00JAlL2XOLkkd5b/1+V0XWj8OdSjkkRAZgHr/upOm8Nywzg+qLM18Jjbp+eCwraozA/RGhFuMX4SDu8bTYF6eeKPmS42NhHf+GmrnEzHgJXCKT1hWkcrx3qmqUUX8ifCTDJ7E7Sjc06EHWu/eSw8WRfDbv9qaCqelkjDBW0IeLZZm2WwFq7Yh/VmzaYkVaFaDwYwB7VH1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cu2dCyJi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cu2dCyJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXt3M42lpz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 03:17:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 030AD41A3A;
	Fri, 19 Dec 2025 16:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9ACC4CEF1;
	Fri, 19 Dec 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766161007;
	bh=47hL5I2ijXMcmF1JU7EI3Nhpa9ZQCp3egcgt0wmJuoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cu2dCyJigvnIJ4mGAhXUE+8LQLSdMxxsf9j1n6iwtD4VW3+uKb8f1+ydeAa7BQ8zQ
	 S+h9zdfukpR/1sKyw8Nv2b86nr52SGY6JZoNsmB5Wlxv/HpNKUZ1oXRuc0+whL4nPQ
	 n8M07pw863419mdts5E4xVdf+QQ2GL+hgz0UuwBsKdv5/oe1ChTaWfxhmL2BLv8sjy
	 7Ck7DTgFi+BX8xgYCywqy7IxdyCa5XadbES2il8LMaf0eu342WX+CZTNt8Tb22655s
	 bKaqIzztqrF73J1cLSW9sVWu65aIlAguqbxhWwd5aHrU7UWeTQGhofmrZ2lJaFtSVA
	 ZF79v11xxcRBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 2/4] ARM: add CONFIG_VMSPLIT_2G_OPT option
Date: Fri, 19 Dec 2025 17:15:57 +0100
Message-Id: <20251219161559.556737-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251219161559.556737-1-arnd@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

Unlike x86 and powerpc, there is currently no option to use exactly 2GiB
of lowmem on Arm. Since 2GiB is still a relatively common configuration
on embedded systems, it makes sense to allow this to be used in
non-highmem builds.

Add the Kconfig option and make this the default for non-LPAE builds
with highmem enabled instead of CONFIG_VMSPLIT_2G.  LPAE still requires
the vmsplit to be on a gigabyte boundary, so this is only available for
classic pagetables at the moment, same as CONFIG_VMSPLIT_3G_OPT.

Tested in qemu -M virt, both with and without HIGHMEM enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7c0ac017e086..921ea61aa96e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1009,7 +1009,8 @@ config BL_SWITCHER_DUMMY_IF
 choice
 	prompt "Memory split"
 	depends on MMU
-	default VMSPLIT_2G if HIGHMEM || ARM_LPAE
+	default VMSPLIT_2G if ARM_LPAE
+	default VMSPLIT_2G_OPT if HIGHMEM
 	default VMSPLIT_3G_OPT
 	help
 	  Select the desired split between kernel and user memory.
@@ -1026,6 +1027,9 @@ choice
 		bool "3G/1G user/kernel split (for full 1G low memory)"
 	config VMSPLIT_2G
 		bool "2G/2G user/kernel split"
+	config VMSPLIT_2G_OPT
+		depends on !ARM_LPAE
+		bool "2G/2G user/kernel split (for full 2G low memory)"
 	config VMSPLIT_1G
 		bool "1G/3G user/kernel split"
 endchoice
@@ -1034,6 +1038,7 @@ config PAGE_OFFSET
 	hex
 	default PHYS_OFFSET if !MMU
 	default 0x40000000 if VMSPLIT_1G
+	default 0x70000000 if VMSPLIT_2G_OPT
 	default 0x80000000 if VMSPLIT_2G
 	default 0xB0000000 if VMSPLIT_3G_OPT
 	default 0xC0000000
@@ -1042,6 +1047,7 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
 	default 0x1f000000 if PAGE_OFFSET=0x40000000
+	default 0x4f000000 if PAGE_OFFSET=0x70000000
 	default 0x5f000000 if PAGE_OFFSET=0x80000000
 	default 0x9f000000 if PAGE_OFFSET=0xC0000000
 	default 0x8f000000 if PAGE_OFFSET=0xB0000000
-- 
2.39.5


