Return-Path: <linuxppc-dev+bounces-7095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C50A62B85
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 12:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCp5nl9z3cfT;
	Sat, 15 Mar 2025 21:59:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036390;
	cv=none; b=A3+U9oVoncRB8ErHCieq+WFbedyeF/dOr/bXbnD8aV82fuKYR0ESiiYpDM7h1g4EcpVy19uX8RmL3yS7OQAuHUcNxSirTJ6mlQnJIjUOIz2+bJiYSHGf0VnVQFS4KRjISR+M2sYfMI8o13SxrfLebHt3g0VdlBqek/i4t1IG756y1B+JaOcatI+nOPk2FLqSHdIyZq4EzeHO2gkiO7ciqwr3wQHsF8f3xmnzYek6H4Mb2aQTOMs6UBOPRwhbGGvK7UnNefyNN0C5A2qUStcpdoKGHFEKCYhPMjsDMfeRrlVOXHrfu7BJbWFjY51DWrEru37YfT/g7QIMBqsNf7HdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036390; c=relaxed/relaxed;
	bh=O4JY2b3iCIOGVMySKh8Hvc/VKiUD8zV/RHxZJeOkx4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUpg7xkJpw26tLv1Dmh/2/zVmyCGnF0GAVKK9DIy9HOp5qXpx1C+X40jUsl20cUzMIq7QC92G5UYeOwAD36c9QsVl9Y2XyISlYa5bplE12aqrlvJxB+hGen2jO5RY6BhOw7pgtHpFZylKyL6KMlnSWdUHEizYAzVvUT+81GzJxKdQIPTSQUvDGkpH7arPO4B6W/f8Gqgzuyrei/Tg0JxKBxh+JH2nDc7qiQzD4Nd5yj4GsMaBU00JdI+CSj3iS40Bf/I4lcOj8K7zkQGvfc1o9wV6ZrcwjIiRVB6NI5ak2W9r4PmDAqXuZWjKr+yt/xM6hGLXcS5NoR3RpF57E6YQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNNhAbIc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNNhAbIc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCp2G18z30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E06EA48A21;
	Sat, 15 Mar 2025 10:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D88DC4CEEB;
	Sat, 15 Mar 2025 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036388;
	bh=D1ohrsimuAws13B6dSJm4c6y+zLXLpUyAoEhItGWqLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNNhAbIcf8rr4eGgVdyHX/E4D7k+KscqVldr3+lldQwAq/jdglR4SphehjOkkIAfo
	 9MTwIzw6Z7O68YzXNinfAPSEpQJZ9wzcMof+k1SPnJ/7hFw6HtRWFJi1uTRy96dElT
	 Yrn3toSD3j2xehdk6dinEZuvTCExMzPnp+nP9BfsYnK13ARddI0p7dvolMIAOxtoRp
	 c3qisYBppYDADHR7fvA8+qJpI2/iweFvf6USys3kpwbK40VECL1kXsmdz6LVpJecQ5
	 JJy8sF2gcnadf9t6j3+n8Bo9nIq6Lmmec6msUk1Pt+0xre7BMklDXjYqi4id+5RyP6
	 qG4v1Q27bB3Og==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 6/6] m68k/nommu: stop using GENERIC_IOMAP
Date: Sat, 15 Mar 2025 11:59:07 +0100
Message-Id: <20250315105907.1275012-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315105907.1275012-1-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

There is no need to go through the GENERIC_IOMAP wrapper for PIO on
nommu platforms, since these always come from PCI I/O space that is
itself memory mapped.

Instead, the generic ioport_map() can just return the MMIO location
of the ports directly by applying the PCI_IO_PA offset, while
ioread32/iowrite32 trivially turn into readl/writel as they do
on most other architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig             | 2 +-
 arch/m68k/include/asm/io_no.h | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index b2ed0308c0ea..b50c275fa94d 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -18,7 +18,7 @@ config M68K
 	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
 	select GENERIC_ATOMIC64
 	select GENERIC_CPU_DEVICES
-	select GENERIC_IOMAP if HAS_IOPORT
+	select GENERIC_IOMAP if HAS_IOPORT && MMU
 	select GENERIC_IRQ_SHOW
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 2c96e8480173..516371d5587a 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -123,10 +123,6 @@ static inline void writel(u32 value, volatile void __iomem *addr)
 #define PCI_IO_SIZE	0x00010000		/* 64k */
 #define PCI_IO_MASK	(PCI_IO_SIZE - 1)
 
-#define HAVE_ARCH_PIO_SIZE
-#define PIO_OFFSET	0
-#define PIO_MASK	0xffff
-#define PIO_RESERVED	0x10000
 #define PCI_IOBASE	((void __iomem *) PCI_IO_PA)
 #define PCI_SPACE_LIMIT	PCI_IO_MASK
 #endif /* CONFIG_PCI */
-- 
2.39.5


