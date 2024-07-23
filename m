Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627D939B3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:58:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdtNpb5f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnzk2pbQz3clH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:58:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdtNpb5f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnk33xhtz3ccS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:46:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B0A6CE0E07;
	Tue, 23 Jul 2024 06:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E983C4AF14;
	Tue, 23 Jul 2024 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717193;
	bh=zVDs6WKjT/YvUD2GuaqovEFQsz1PVdi+2wlgjwoVKBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GdtNpb5fUIpXsX9U29NSh04YZWODgndxZxjste8kTAvvVKauwF6UNM6S9Dr3BCKEs
	 yzF3a95E4FDYjaodsPNzYMUIiAFluD4W6BzfRkWMXJaN5mJiDqA0nbhJUlVN8YBreY
	 N8Lfe55rcuYatNFvDLpb1o/ai1cq2a87KFY1vXc2G3PokM+pzDBZiGx1YYc0JvUIwd
	 hD+FxT+d7coc5Nv4te6g48WPgLLOAIBVm7uSHK4G4+cw6nfe/xZpmv2v/wDAZjLxfx
	 maJJGo9Hlb/cksHiz+XhQBIYl3hu/DniwedBxjLUcBhi+OlRUy+RXddlr9a1o66hWz
	 zfdJosOcK+iJA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/25] mm: numa_memblks: use memblock_{start,end}_of_DRAM() when sanitizing meminfo
Date: Tue, 23 Jul 2024 09:41:53 +0300
Message-ID: <20240723064156.4009477-23-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
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

numa_cleanup_meminfo() moves blocks outside system RAM to
numa_reserved_meminfo and it uses 0 and PFN_PHYS(max_pfn) to determine
the memory boundaries.

Replace the memory range boundaries with more portable
memblock_start_of_DRAM() and memblock_end_of_DRAM().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/numa_memblks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e97665a5e8ce..e4358ad92233 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -212,8 +212,8 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
  */
 int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
 {
-	const u64 low = 0;
-	const u64 high = PFN_PHYS(max_pfn);
+	const u64 low = memblock_start_of_DRAM();
+	const u64 high = memblock_end_of_DRAM();
 	int i, j, k;
 
 	/* first, trim all entries */
-- 
2.43.0

