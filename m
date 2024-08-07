Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92D94A012
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 08:43:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/6HTsXb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf0xg6zsgz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:43:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/6HTsXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf0vp0b3Mz30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:41:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6437661053;
	Wed,  7 Aug 2024 06:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3518C32782;
	Wed,  7 Aug 2024 06:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723012916;
	bh=MnJNRzTir4c4kkideYaF9K0DolOoIZtSsJtHw0oKjF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/6HTsXbawFBe7Hl72eb3Fv4OkQcMobrOhl99riEcgs4wiGHwDDTkdDSTH17vApOV
	 9lZhZhCJiXDKThYkfu1t3tCthjob4fEkdPm4FHQUz8kzZVdDCjhwCcMgLP6oR0ZyuV
	 v4sMPQXcYUWjuwyvthF4ey4dyPEEm7JdeyTd9lgRrRjOYF+0uNiLrs+QoHNbhSj05m
	 PvtayYhdMjtXKolIrQaQ2u+nD3K2x3Nq8c+EmuWgNK1XviMNK/G4VRa+teOpPpf35C
	 e5n12nCa9Q58u6pMb7WUgu9llXT9kIqqGvWCa08d5O4ny9Z4aJ6c+Xxw+JT0MY3Xe9
	 vcfhOfEy5oraA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/26] MIPS: sgi-ip27: make NODE_DATA() the same as on all other architectures
Date: Wed,  7 Aug 2024 09:40:46 +0300
Message-ID: <20240807064110.1003856-3-rppt@kernel.org>
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

sgi-ip27 is the only system that defines NODE_DATA() differently than
the rest of NUMA machines.

Add node_data array of struct pglist pointers that will point to
__node_data[node]->pglist and redefine NODE_DATA() to use node_data
array.

This will allow pulling declaration of node_data to the generic mm code
in the next commit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
 arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index 08c36e50a860..629c3f290203 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -22,7 +22,10 @@ struct node_data {
 
 extern struct node_data *__node_data[];
 
-#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
 #define hub_data(n)		(&__node_data[(n)]->hub)
 
+extern struct pglist_data *node_data[];
+
+#define NODE_DATA(nid)		(node_data[nid])
+
 #endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index b8ca94cfb4fe..c30ef6958b97 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -34,8 +34,10 @@
 #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
 
-struct node_data *__node_data[MAX_NUMNODES];
+struct pglist_data *node_data[MAX_NUMNODES];
+EXPORT_SYMBOL(node_data);
 
+struct node_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
 static u64 gen_region_mask(void)
@@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
 	 */
 	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
 	memset(__node_data[node], 0, PAGE_SIZE);
+	node_data[node] = &__node_data[node]->pglist;
 
 	NODE_DATA(node)->node_start_pfn = start_pfn;
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
-- 
2.43.0

