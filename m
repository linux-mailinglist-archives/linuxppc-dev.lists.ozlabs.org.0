Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A69324D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:15:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VkMJWuO9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNc1S1lR2z3dBp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:15:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VkMJWuO9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc0C6yPVz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:14:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8FC9610A2;
	Tue, 16 Jul 2024 11:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF837C4AF09;
	Tue, 16 Jul 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128456;
	bh=y3TD89E5xgR+cEB9zJIVa1MhEE/ag71T+percuJb8Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VkMJWuO92ZVIqTdQkBEULX1mdRfTUE6/w4UgTHJ/fo7CztNbTtED3l85kzn8gLFLR
	 LumfY8sNSw4PSPj6yPSVQ8T2AEm8DCptdeO4INOBYjWuTbnE/JBCrfMzXTkNp8RXXu
	 PBbS4LvDKghzVJNnNuLWmFVcS9ZKXPYXnKmA2ypjS6EXUEizahbhRrvw97jmJUis9x
	 t5wpJsRgWDGJfWMC3y9xWDYl0Ok0JGcYB/caEAlLDVVeg4rOAYZV4nWqDO8bTw2kQj
	 43/rV7DDmhcC37yK0DUqUAJAzU4bD2511EnJEtmeEXsRdvV9Uz2W5zZnfn3J5VwvF8
	 0EWJpUJP/BkOg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] mm: move kernel/numa.c to mm/
Date: Tue, 16 Jul 2024 14:13:30 +0300
Message-ID: <20240716111346.3676969-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The stub functions in kernel/numa.c belong to mm/ rather than to kernel/

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/Makefile       | 1 -
 mm/Makefile           | 1 +
 {kernel => mm}/numa.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {kernel => mm}/numa.c (100%)

diff --git a/kernel/Makefile b/kernel/Makefile
index 3c13240dfc9f..87866b037fbe 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -116,7 +116,6 @@ obj-$(CONFIG_SHADOW_CALL_STACK) += scs.o
 obj-$(CONFIG_HAVE_STATIC_CALL) += static_call.o
 obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call_inline.o
 obj-$(CONFIG_CFI_CLANG) += cfi.o
-obj-$(CONFIG_NUMA) += numa.o
 
 obj-$(CONFIG_PERF_EVENTS) += events/
 
diff --git a/mm/Makefile b/mm/Makefile
index 8fb85acda1b1..773b3b267438 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -139,3 +139,4 @@ obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
+obj-$(CONFIG_NUMA) += numa.o
diff --git a/kernel/numa.c b/mm/numa.c
similarity index 100%
rename from kernel/numa.c
rename to mm/numa.c
-- 
2.43.0

