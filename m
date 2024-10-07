Return-Path: <linuxppc-dev+bounces-1786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07B992480
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 08:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTln4gPtz2yNB;
	Mon,  7 Oct 2024 17:29:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282597;
	cv=none; b=Y+ULyzQ9ZmnN37NPO5+TVhRq0fiXY22eo2vM42Dq5d4Z8JJ6kwTItcrTBBcR4wQpKKU0Hmc/5c4rMY4K5SRwwsUK4xNrwr3AFkku15iC1zgLwmnwTHaX0Xswc3I44I0Kpy66Oxsz25uLSJ5jEEZ2GcZKySCCDC3e4mHXsfajgBXOwsZE8LIhxSbr3TXv2H1qYUPF2x/ZlwVKaxzcrE47wA0SL+d4qbABw+CvipAMYA/omlzEXekNJBxKcieUfcPWLYD1taXOhVo9sJiuiZbKfw7M8JvLOF2GM75UNCdgltTu/38rv/0hbFdHBrdjZWyKqScu4S/utpsjq4ylnwVnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282597; c=relaxed/relaxed;
	bh=VoDjrKHpUT224dnSitnnGFqJ2by/iZ5cZnUq7cIEdF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgjpNkxXDWlfoH1IvbnIVLeLvo02t+7rEtEw6cxoTEg0f5J7eVSKmnR9DjiFSQFIRhU6Z8zvQ50ArY+5qwvoXL575Zfg+LJ3G+9NeFf/oadXFk8i6+p+9bVedonPaknH1oVurPS/Ap5az9BfcC0nBT9e1Ov1irAnS3eghPoushC7gUC9O7XaCHV0hGIj+i2SyUJIIlvki/0oT0K3ltDpn3oP4s+0YtlQgPupsnxgrPSAe5BprdmiRyVujmfPQkuLjrGNCPgYFVhLxKw7kpNMepy88caszF05vjQC5+X/bTobVcEnh3NJRIdmI+qS1BiGbsoM18lSFodeVRYdLE0cSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OQrnWRR3; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OQrnWRR3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTlm3zszz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 17:29:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06EF05C59DC;
	Mon,  7 Oct 2024 06:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2BFC4CEC6;
	Mon,  7 Oct 2024 06:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728282594;
	bh=FFXSlSIenlvc/JFQhdQdJ8pK7321CYQcMdI24yMcjAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQrnWRR3/g7hkdwqKSPCCpC6iFIYY/d292H/OkXvsUSIeBCbNT8KZSGMgs98muJ6O
	 hStgp6uWL5I4mPNO24G+F+cFs8u7131j/Ey2uNjues5m4rGfIl+ezO5d7V6cyfXRrB
	 ff1uz0i8ryxaYlWwqB3Tbk2Qfaen2IbD0G0cn3eSzNqjZHyYnCmEOJkRb1lVxqWFoq
	 uXQrayzrXN+XpU2Oiz+opHfaOrJilIbQoWVWPrD++Zkr2uZPOk/qb3+N03ykByAfhN
	 p1iJ7Mmzt/MjewEvg+nhLagLlQ4uD909oU6Ls/cTOKl5Oc1CSXLgqfomaexJDZ7MVY
	 yRZGKqDqoDdLw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
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
Subject: [PATCH v4 2/8] mm: vmalloc: don't account for number of nodes for HUGE_VMAP allocations
Date: Mon,  7 Oct 2024 09:28:52 +0300
Message-ID: <20241007062858.44248-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007062858.44248-1-rppt@kernel.org>
References: <20241007062858.44248-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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


