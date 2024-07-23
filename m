Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E95939A5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:45:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jjn0IMhJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnhL3H5Yz3cY1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:45:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jjn0IMhJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSndp0HBzz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:42:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A56860D2D;
	Tue, 23 Jul 2024 06:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A2C4AF0B;
	Tue, 23 Jul 2024 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721716972;
	bh=mRZLqq2N2ryJ5ZO7g59g+rrLvkwOpPlbSt8yNKJxh4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jjn0IMhJcrPhS4Bl96Cwo0k6df1nhuQSiNyQ/dbVBMzBCcrp9rXxtpGaIPsnWwg1g
	 EutfShLwl4ML33LtMf4CMUXhriaZXC2Y0XnDQ5eHWFqH0oTLeSRxwYQvMiTH4+3pg4
	 23X5S2IXpSsSIpciOEufgRtYvvNy1kJjTIubaTDearGmucjQ2peycwqBYrl0lnidvI
	 C3r1Rp8+mjvm7PE1YQsVU4cLUmpqTmzFmPLSRVzjvocHAABjPDxVifYy/vK56oo8wA
	 2FidhSRWcQ1vbPPvkPNtW95l80WFNvn/FUjHRkFCWUy8NwC+vz8A4Ft0biSW1xNoPs
	 CVT7tSIze5Nug==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/25] MIPS: sgi-ip27: ensure node_possible_map only contains valid nodes
Date: Tue, 23 Jul 2024 09:41:34 +0300
Message-ID: <20240723064156.4009477-4-rppt@kernel.org>
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

For SGI IP27 machines node_possible_map is statically set to
NODE_MASK_ALL and it is not updated during NUMA initialization.

Ensure that it only contains nodes present in the system.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/sgi-ip27/ip27-smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 5d2652a1d35a..62733e049570 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -70,11 +70,13 @@ void cpu_node_probe(void)
 	gda_t *gdap = GDA;
 
 	nodes_clear(node_online_map);
+	nodes_clear(node_possible_map);
 	for (i = 0; i < MAX_NUMNODES; i++) {
 		nasid_t nasid = gdap->g_nasidtable[i];
 		if (nasid == INVALID_NASID)
 			break;
 		node_set_online(nasid);
+		node_set(nasid, node_possible_map);
 		highest = node_scan_cpus(nasid, highest);
 	}
 
-- 
2.43.0

