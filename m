Return-Path: <linuxppc-dev+bounces-6965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0651DA5F682
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:51:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD87651F3z3cB3;
	Fri, 14 Mar 2025 00:51:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873906;
	cv=none; b=D7nIFZLHxBi2rWXGmw5Kj/k3YKWQYCxrva1vFEttr1jxCKss8V/5OVPZ3ntt4Nxk8NKTJeeMnYcAnzjEalvlB+KFmSvoaV+qDViywtNEOc5WM69usgJ8ItmZsLYqqZTMFMkf5LRfUzjV0UnlNB71Qcry+LVxafjnkG1tn8YqMSStUEnVQx3ud7uNfOAiVqegxknFIF95DTu15JKTkMaJzaM20LKV0CvN/YiIli+jQjaVdjFU/KeAZd+FglBh0vXzu53RTXd1WP+CtQuC82KhmLeN6R18oHNvivmD+6hDfPAZ5rJWStlPIZd42veSIRh+cBFfkUQ8+t+Q2GboG0FfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873906; c=relaxed/relaxed;
	bh=U1P6C6yM63AogMuHE2GRwhThOWgbajmcPUTFZpTW0zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaGphs54ZFJz8Ab5zmluZ183Ji/75St+J3In2QsL7uSM3sy13b0XCY0a/94M/qUETommxSYE+ChVAl9L1u1VEV6FDKeZnHWTRalP0zpepUrm5dlCusc9x5dGpyNSZBkX535L0WFux32ewuqi9YSMf+lkkkRweMRpW0oCl/sKx5B+BAHkphzSAuUaeNTTgruv3dnHTNv784mr569JRsf9JXGLROg81GESfi/jjUNEjiR60q51m6wqqiZBrS9VRFJJ8gMqTcZUnrvfsuVwx+HIwDmz6Hb1BXTUZH/m3+5v0T45aX4yMrgWHCbxIvYgXigROjjH21SovUplGTEKA4Yiow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAvAkADl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAvAkADl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD87560Wqz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:51:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8BB0A474DA;
	Thu, 13 Mar 2025 13:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A398C4CEEA;
	Thu, 13 Mar 2025 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873903;
	bh=uD5faVqJ7G6OTY8H5Svd8uEX7wWQ143lrl+QSf2xljc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAvAkADl38NVbSZKILqjquMXN3H24XBk/B6I41lcVbP00o/57lseGod9pdeTReVMs
	 cGwlYVhuGgyWlrhDCI2daJ1ZuH+VeJ81cIRRK9frKmoiVueFr/N/mjUPeYtEx8wJ8T
	 nBs3CkwbMReqveisUvVZBC22mbfZgYYmTbCh29QOQKxl3NVOzvvN3jvxoRqmAwnVch
	 0ZqbY3ubQTUgmI2m+/Okv6ac4OZYKAK3inE5/1A+FzyXOEE0bOdUpCjBHuKjnqgp9K
	 6yHOo0+C4guHPMqoX35CH+VdOKq/D8Ff1oyIUB7Oo0RhP3dSOBxqfGBVfIxIiCRB+o
	 mLZqPSEOGfNGg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 06/13] nios2: move pr_debug() about memory start and end to setup_arch()
Date: Thu, 13 Mar 2025 15:49:56 +0200
Message-ID: <20250313135003.836600-7-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/nios2/kernel/setup.c | 2 ++
 arch/nios2/mm/init.c      | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index da122a5fa43b..a4cffbfc1399 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -149,6 +149,8 @@ void __init setup_arch(char **cmdline_p)
 	memory_start = memblock_start_of_DRAM();
 	memory_end = memblock_end_of_DRAM();
 
+	pr_debug("%s: start=%lx, end=%lx\n", __func__, memory_start, memory_end);
+
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 	init_task.thread.kregs = &fake_regs;
 
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index a2278485de19..aa692ad30044 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -65,8 +65,6 @@ void __init mem_init(void)
 	unsigned long end_mem   = memory_end; /* this must not include
 						kernel stack at top */
 
-	pr_debug("mem_init: start=%lx, end=%lx\n", memory_start, memory_end);
-
 	end_mem &= PAGE_MASK;
 	high_memory = __va(end_mem);
 
-- 
2.47.2


