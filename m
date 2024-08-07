Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D560094A057
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 08:46:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rog+aUVA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf10w5Tjgz3dCV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:46:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rog+aUVA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf0wk4x7Tz3cl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:42:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBF0F61053;
	Wed,  7 Aug 2024 06:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAE5C4AF14;
	Wed,  7 Aug 2024 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723012964;
	bh=kJZJfhu5nor6HOX0azj8voc5RTepeR8//6fd4ZIyi1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rog+aUVAyug778VDrB9/Oq2AwEvuWRbs5jb4+bSQp/DEWop+GMEckTmCSRFIoycfx
	 DMhE4Ga+iUFapLeyEqADham2k/DVLfJeQbLHi8/sjHkPkpXEocc6ukquUxut1JzX2x
	 74Q9UAsgL8FhIRZPpPI6WpdC3CilhDNZd71tEMoP0/vX3K8uwfMfe9z6lfEcy1AmnR
	 K5BE3tc1oOJh08t8sou3tFPT5aAqbWlymO2/UNw0NBb0qcA+NWG/PcKOqDshjEnsO4
	 tPHQ4N/pr9kW7KLMlCOsnarQ7aFfHOtdNG8Vj3iPXmuCjmd0FrR6s5UD9S5kMFxUKq
	 hZ8AO8dPcvfhg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/26] MIPS: loongson64: drop HAVE_ARCH_NODEDATA_EXTENSION
Date: Wed,  7 Aug 2024 09:40:50 +0300
Message-ID: <20240807064110.1003856-7-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Commit f8f9f21c7848 ("MIPS: Fix build error for loongson64 and
sgi-ip27") added HAVE_ARCH_NODEDATA_EXTENSION to loongson64 to silence a
compilation error that happened because loongson64 didn't define array
of pg_data_t as node_data like most other architectures did.

After rename of __node_data to node_data arch_alloc_nodedata() and
HAVE_ARCH_NODEDATA_EXTENSION can be dropped from loongson64.

Since it was the only user of HAVE_ARCH_NODEDATA_EXTENSION config option
also remove this option from arch/mips/Kconfig.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/Kconfig           |  4 ----
 arch/mips/loongson64/numa.c | 10 ----------
 2 files changed, 14 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ea5f3c3c31f6..43da6d596e2b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -502,7 +502,6 @@ config MACH_LOONGSON64
 	select USE_OF
 	select BUILTIN_DTB
 	select PCI_HOST_GENERIC
-	select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -2612,9 +2611,6 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
-config HAVE_ARCH_NODEDATA_EXTENSION
-	bool
-
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index b50ce28d2741..64fcfaa885b6 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -198,13 +198,3 @@ void __init prom_init_numa_memory(void)
 	pr_info("CP0_PageGrain: CP0 5.1 (0x%x)\n", read_c0_pagegrain());
 	prom_meminit();
 }
-
-pg_data_t * __init arch_alloc_nodedata(int nid)
-{
-	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
-}
-
-void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
-{
-	node_data[nid] = pgdat;
-}
-- 
2.43.0

