Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF1944465
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 08:25:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqPSECnC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZJqZ1v5jz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 16:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqPSECnC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZJYT5Hckz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 16:13:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04D8B62779;
	Thu,  1 Aug 2024 06:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FA9C4AF0A;
	Thu,  1 Aug 2024 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492795;
	bh=wgBkv6gb0pPzoMRiWhD0EVSQTy0zZwrH+GjPrFy0JG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqPSECnC0eM5g/zSNnOAmjrOasiIzwPA6z/+g6VkF4/et9bbVvssBzCmMrT2fH2FH
	 s8h76/CNsq3n19tI98+vSyv3i90mhkvLpBDaWko03EvTXamnFlNQgmpdo+G83yUOyx
	 QyLtENSdzXa9vkqCaNUDnt/UF6i2lx9sq7bccco42lDyUnUu3rXB+g1cBh06tVNc9Z
	 O/TqPVS7+0XmmBYN3tsp7y8r/0t3RnE/Zo1cRWYh4hXoZOIuKMzLdquIzKitbNSpQR
	 n3IeWHly9yw4naiZQqSAl7QY2ittG7QUqkHNN9dFTUw1WtpMMeCmArHNdljr08O4Fn
	 RoQH6f0HaoqCg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/26] of, numa: return -EINVAL when no numa-node-id is found
Date: Thu,  1 Aug 2024 09:08:23 +0300
Message-ID: <20240801060826.559858-24-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Currently of_numa_parse_memory_nodes() returns 0 if no "memory" node in
device tree contains "numa-node-id" property. This makes of_numa_init()
to return "success" despite no NUMA nodes were actually parsed and set
up.

arch_numa workarounds this by returning an error if numa_nodes_parsed is
empty.

numa_memblks however would WARN() in such case and since it will be used
by arch_numa shortly, such warning is not desirable.

Make sure of_numa_init() returns -EINVAL when no NUMA node information
was found in the device tree.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/of/of_numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 838747e319a2..2ec20886d176 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -45,7 +45,7 @@ static int __init of_numa_parse_memory_nodes(void)
 	struct device_node *np = NULL;
 	struct resource rsrc;
 	u32 nid;
-	int i, r;
+	int i, r = -EINVAL;
 
 	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
@@ -72,7 +72,7 @@ static int __init of_numa_parse_memory_nodes(void)
 		}
 	}
 
-	return 0;
+	return r;
 }
 
 static int __init of_numa_parse_distance_map_v1(struct device_node *map)
-- 
2.43.0

