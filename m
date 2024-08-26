Return-Path: <linuxppc-dev+bounces-508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657695EA97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjBk6YrGz2yRC;
	Mon, 26 Aug 2024 17:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724655741;
	cv=none; b=JFZVHs2Hz3FyC2cJP6QV0yV7PVXVO+UWjDO/MiMpMu0r39hEijl6sQp0/Id37D0ee2I2df5aYJX9hy80drtDdDj5y/cCzN+J3i9+KIijhU76ZcrOp50/JLoufT4bUw8Ker1t/nqXyrAEnHKiVEaYdHXUpd4UyMr5ZfCnDSERfYMlYTk5zNPlbpbiIQzcVOsyCXWQeYV8hcv5lbwZeYAoh0Z4f39vfE57o63gHJtVIBH9Q42TH0isrL6zghkbR8DG0hKQEay4YXj6HJHzItPwPXy8HuEb52Uvynxeixi7DrZKmspyh5TdF55uG6PZ1gKl4+h5oQ70QMSpHQASaTXfag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724655741; c=relaxed/relaxed;
	bh=4+/ziKRuaKuWojekn/jGc5BdErtoYihuf167rUpztYo=;
	h=X-Greylist:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=QHZftaCbbI+QCefMqePF9Ve7r/gylfE2kxmcj+ZjPBDxlrZfViZffhXR3rxC0H/91nxvq4LMmagyM8fGyNsUHrqNYy1tsBcMgpUiaorWbzyCdOUJ0XO2k77PRjF+NWXDRWUDdd5dnbIDltlJbi2i0XBhJ3H5Jj1FYd/HtFLj18ulp9wLTvslwGwE1SazY1Fwt93vTazunYs24TAR527FWy3jXWe+1xSKnb+P+zdKamtVLebWjbYU/ECMHCIGRDCSUqKEBB1bu2zEv0ppMZwIEZ7SK+KcBGTRNJmCVPStN3i5GiYyKgXxa0kxDcMk+0NTnfe93UvQnMIPDFFwvJ/VYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnaG1q6R; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnaG1q6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 261 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 17:02:21 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshSY1xVfz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:02:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85AD6A41349;
	Mon, 26 Aug 2024 07:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E492C51CA1;
	Mon, 26 Aug 2024 06:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724655386;
	bh=diG+Fv3wDftGRjrnWBdO8lGUovRExvU5pHk1HsKnyW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnaG1q6R4qlIaSK/fWkGnB06BhXbyowHMLkXN+Wa/EmI8MXCHyCRZspeqUfjxlFn8
	 I5lAr0mBOGk6Pt3c7iaZXbNbgEWcTB2h0HEGHe4mQWtVg4kIYBz60y4INpqUCOObQh
	 snsW+ukoJgEDrqZbxOJXvgYwpT1mdmaXAK0KgEiHeSDv0S/jdqlA7izDk1dLlRr7T2
	 JvFAUL1avz8KDvpXtlCDFgtgmsVTawfWmOS9mj/Sm91+tuowTK8XuuK95GWPjy8VKl
	 t+6xvbWV5dUVQztjsq3xx57LLL9mOi//qHDE6IYxAExuUD3vx++wbsh6uwKeNHOBbT
	 TnTRQT6DCjzuA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
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
	Luis Chamberlain <mcgrof@kernel.org>,
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
Subject: [PATCH v2 2/8] mm: vmalloc: don't account for number of nodes for HUGE_VMAP allocations
Date: Mon, 26 Aug 2024 09:55:26 +0300
Message-ID: <20240826065532.2618273-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826065532.2618273-1-rppt@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 mm/vmalloc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index af2de36549d6..d0fbe6b2b73c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3769,8 +3769,6 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 	}
 
 	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
-		unsigned long size_per_node;
-
 		/*
 		 * Try huge pages. Only try for PAGE_KERNEL allocations,
 		 * others like modules don't yet expect huge pages in
@@ -3778,13 +3776,10 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
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


