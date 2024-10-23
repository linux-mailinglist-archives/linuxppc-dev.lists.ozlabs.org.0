Return-Path: <linuxppc-dev+bounces-2516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B49AD079
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 18:28:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYZGj0YWjz2yxP;
	Thu, 24 Oct 2024 03:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729700893;
	cv=none; b=MrnzpUTnAizAO9cpF3ZXJSV8LxtZnQ4kMhyHHpyGRAbTtXHrv4b8gcpI4UcxxBkmUj7B2nlC77UReoQugzkYjrmhc+3huQz5+5irLV8i3HK8OMQ10W1SEPsGKTner4Gg7SMeS5Q/SzB+grYOuY81LgH9R8v7Ky5f3PdBO5gg42OtUjaO49FzF+vAP6VeXg7r7pIlKFqbvHNCEaZFiYKWUXZOiMm9FrWv+aFUUwTg3AoI603oLnBMtp/cmxM1afW3VlNcAGEGb9hvk3gIujRvGhroaghtb5Yn+QQW9YVV61lKRYtVyVzFWOhMEQSquKeN5aY+NSHHbVoC5ehjDtxQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729700893; c=relaxed/relaxed;
	bh=lEN/DUg8OpeBMnFOqUOvMNdeZM8ZqIXrCjuMxHrebUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLZRaCkdKQl4fZ3vcylAaZPpxVdlp1wkPcl2kKULRbhKwsvnNhRHAh+1n2pMtuSVKede4spNlS4iXLNxcfD+3vC+HTnqMtfuZAvXytpYMU3z+1vCyWW1XUiKu0Ru9QZDaYS2onvEGR1mbuU80Rn/jnkrcfXzebM1UtWIYldYwaQK6L5ZXgjWCT9mW0IJJWw6Tls/Uk/BnnY8ptD+Kw8l8mNsqugx0HmVTMNIUPBVYlInXWhaFrRGkcplwPW652AvoKy1exvgceIqFPoMUaq1zwqmVVlX+xogZNRpp8CmxxP7tZFBJ20MpbqdR5r9bbrQsUAn4cWiu0+8vqD4rtbciw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MksvU0Ha; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MksvU0Ha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYZGg6Xqwz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 03:28:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 615CFA41B5B;
	Wed, 23 Oct 2024 16:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B4DC4CEE7;
	Wed, 23 Oct 2024 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700889;
	bh=HxNNSVRyyfyrPRCaFVp5s4SXKjHAQ4AhySVjRrfREus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MksvU0HaetB7l+rvL5crZVM93NPTlNcrfu6YrKoKkzCIK/OyHPU9MR3j5y140F/u0
	 TWrZIHcKqwtYib/NBb5usCgcwhA+g3bNW3YgyhFYl1AcI7ozEsTOGWmZ+Dl5kQr4Jp
	 hgs53lWF95EQt4sAc6eAE3i0p6HqWI/0Odajl9H0wJQFeRAmFhWp9VOc2snwQv/XjZ
	 JyuWFaBxFUQ5u3svCmC8vNSqqg2IKU4pHaPbT/JfcPYGGqiExtri61Z2bC2GwYWfdA
	 Fb619NBOFCRRMrcv9s+C9SJEvb4IOkwksPANHclcy9AEWj43gvk8rOpUvfLK30rzZS
	 mF+tuhvVsxe1A==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v7 2/8] mm: vmalloc: don't account for number of nodes for HUGE_VMAP allocations
Date: Wed, 23 Oct 2024 19:27:05 +0300
Message-ID: <20241023162711.2579610-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023162711.2579610-1-rppt@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explicitly
specify node ID will use huge pages only if size_per_node is larger than
a huge page.
Still the actual allocated memory is not distributed between nodes and
there is no advantage in such approach.
On the contrary, BPF allocates SZ_2M * num_possible_nodes() for each
new bpf_prog_pack, while it could do with a single huge page per pack.

Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
NUMA_NO_NODE and use huge pages whenever the requested allocation size
is larger than a huge page.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: kdevops <kdevops@lists.linux.dev>
---
 mm/vmalloc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 634162271c00..86b2344d7461 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3763,8 +3763,6 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 	}
 
 	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
-		unsigned long size_per_node;
-
 		/*
 		 * Try huge pages. Only try for PAGE_KERNEL allocations,
 		 * others like modules don't yet expect huge pages in
@@ -3772,13 +3770,10 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		size_per_node = size;
-		if (node == NUMA_NO_NODE)
-			size_per_node /= num_online_nodes();
-		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
+		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
 			shift = PMD_SHIFT;
 		else
-			shift = arch_vmap_pte_supported_shift(size_per_node);
+			shift = arch_vmap_pte_supported_shift(size);
 
 		align = max(real_align, 1UL << shift);
 		size = ALIGN(real_size, 1UL << shift);
-- 
2.43.0


