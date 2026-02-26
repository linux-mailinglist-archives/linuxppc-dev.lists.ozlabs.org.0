Return-Path: <linuxppc-dev+bounces-17298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK6sAVJjoGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF91A85F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLH0SRBz3cYf;
	Fri, 27 Feb 2026 02:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118726;
	cv=none; b=H/SI91HRBptRdE9cWQmcSJrcs8vbGcbWb8I+7xAOqdmk5IvtJUK+SCJX35hMykdP8sS6mPdrQv4p/VJChzeW/5Y+ZYKbuphqljIcRiTEHBGsk4BrMB7rVXjIaWHNvlzOipZGcYuSYMvI1ATXXJLER9HRDXxL7YKC6aeWL/ZhfZ3kAB6euKUjSWH5NgjdsrpadOzaJ7LQoPZldUzgBZ7n6k+L7K4vGVd0gr6ICUS3m7FdYPmCZoqDOfuFIjJLr+CKOx70rhAPZ5FOSvmu+71VbypbRyjMPYbRBBrUP1l8jk1PV3BgGa7AffUKWT0jvE8I6k4ONo13S8LhBzzTzt59+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118726; c=relaxed/relaxed;
	bh=ZmHir4kLI71goSyhP9g9l4qH6RG8kss9LTXFyJextAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNt30W1NrrPlfZcZs4xApDJ5TClGMWV9Y3HEQh++RjMyA54B1RE+NHROXZq196ZTMuudIdVyVkX2Fx/kvzpK02B54qC0d0QZr3+vRM+doL5dGlaPN/9Ypth4n750x6kMwz9FjwIXTiZU8VNo8a79wAmUVqgdoCFRwZHE8t6C4wgxccWjo/YzAqmswRVD2aRO/lFj/PlL+GJWVffbuUFeoHKrnBnlr6mr4G8JMdY+GrV/uxqw3sziDHvA0tXbr172RNHhZMdOoYHUwWThRKnAU9+4X1ps6BmztgLqDKU5WA2M3MczoN03a63AH5A9DLNBcP5i9X7c/5l71ElCkci4Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gm7LtLz9; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gm7LtLz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFLF0FNbz3cQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:12:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZmHir4kLI71goSyhP9g9l4qH6RG8kss9LTXFyJextAM=; b=gm7LtLz9wMZuzDcGD/MfA1Gpk4
	1zparoUu9+zy8gxIAr9kBD07xJ7ckiT2sGElE1o5eexZVGNkxFcwHcZZGcVPkMcQMybPKbUfKhB5N
	OSkOjtcMgu8OhGBtEenu59L4QZ/C2TNjcf8VPcjTvBqyXYwh+sfjxEoeeJRfMfqNwmIZeDJ3tMw/Z
	pLWJUrdOzBI3AzMcPX1upuVl7rJ5UBnb7NOR9UaIIeTYupJLHck+g1G5xEIQhsi7l9aauMHo+fvv8
	kJ0/Yt0xQKPeUpkJ9NBDvFBu6HRzzrhlnikMAJQRTFZDiUIo0yjXLxC05qnEay53LtqWlmImq5XqP
	pJu2wOTw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1a-00000006QU7-07S8;
	Thu, 26 Feb 2026 15:11:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 18/25] x86: move the XOR code to lib/raid/
Date: Thu, 26 Feb 2026 07:10:30 -0800
Message-ID: <20260226151106.144735-19-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226151106.144735-1-hch@lst.de>
References: <20260226151106.144735-1-hch@lst.de>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17298-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@li
 sts.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,infradead.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 31DF91A85F0
X-Rspamd-Action: no action

Move the optimized XOR code out of line into lib/raid.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/xor.h                    | 518 ++----------------
 arch/x86/include/asm/xor_64.h                 |  32 --
 lib/raid/xor/Makefile                         |   8 +
 .../xor_avx.h => lib/raid/xor/x86/xor-avx.c   |  14 +-
 .../xor_32.h => lib/raid/xor/x86/xor-mmx.c    |  60 +-
 lib/raid/xor/x86/xor-sse.c                    | 476 ++++++++++++++++
 6 files changed, 528 insertions(+), 580 deletions(-)
 delete mode 100644 arch/x86/include/asm/xor_64.h
 rename arch/x86/include/asm/xor_avx.h => lib/raid/xor/x86/xor-avx.c (95%)
 rename arch/x86/include/asm/xor_32.h => lib/raid/xor/x86/xor-mmx.c (90%)
 create mode 100644 lib/raid/xor/x86/xor-sse.c

diff --git a/arch/x86/include/asm/xor.h b/arch/x86/include/asm/xor.h
index 33f5620d8d69..d1aab8275908 100644
--- a/arch/x86/include/asm/xor.h
+++ b/arch/x86/include/asm/xor.h
@@ -2,498 +2,42 @@
 #ifndef _ASM_X86_XOR_H
 #define _ASM_X86_XOR_H
 
-/*
- * Optimized RAID-5 checksumming functions for SSE.
- */
-
-/*
- * Cache avoiding checksumming functions utilizing KNI instructions
- * Copyright (C) 1999 Zach Brown (with obvious credit due Ingo)
- */
+#include <asm/cpufeature.h>
+#include <asm-generic/xor.h>
 
-/*
- * Based on
- * High-speed RAID5 checksumming functions utilizing SSE instructions.
- * Copyright (C) 1998 Ingo Molnar.
- */
+extern struct xor_block_template xor_block_pII_mmx;
+extern struct xor_block_template xor_block_p5_mmx;
+extern struct xor_block_template xor_block_sse;
+extern struct xor_block_template xor_block_sse_pf64;
+extern struct xor_block_template xor_block_avx;
 
 /*
- * x86-64 changes / gcc fixes from Andi Kleen.
- * Copyright 2002 Andi Kleen, SuSE Labs.
+ * When SSE is available, use it as it can write around L2.  We may also be able
+ * to load into the L1 only depending on how the cpu deals with a load to a line
+ * that is being prefetched.
+ *
+ * When AVX2 is available, force using it as it is better by all measures.
  *
- * This hasn't been optimized for the hammer yet, but there are likely
- * no advantages to be gotten from x86-64 here anyways.
+ * 32-bit without MMX can fall back to the generic routines.
  */
-
-#include <asm/fpu/api.h>
-
-#ifdef CONFIG_X86_32
-/* reduce register pressure */
-# define XOR_CONSTANT_CONSTRAINT "i"
-#else
-# define XOR_CONSTANT_CONSTRAINT "re"
-#endif
-
-#define OFFS(x)		"16*("#x")"
-#define PF_OFFS(x)	"256+16*("#x")"
-#define PF0(x)		"	prefetchnta "PF_OFFS(x)"(%[p1])		;\n"
-#define LD(x, y)	"	movaps "OFFS(x)"(%[p1]), %%xmm"#y"	;\n"
-#define ST(x, y)	"	movaps %%xmm"#y", "OFFS(x)"(%[p1])	;\n"
-#define PF1(x)		"	prefetchnta "PF_OFFS(x)"(%[p2])		;\n"
-#define PF2(x)		"	prefetchnta "PF_OFFS(x)"(%[p3])		;\n"
-#define PF3(x)		"	prefetchnta "PF_OFFS(x)"(%[p4])		;\n"
-#define PF4(x)		"	prefetchnta "PF_OFFS(x)"(%[p5])		;\n"
-#define XO1(x, y)	"	xorps "OFFS(x)"(%[p2]), %%xmm"#y"	;\n"
-#define XO2(x, y)	"	xorps "OFFS(x)"(%[p3]), %%xmm"#y"	;\n"
-#define XO3(x, y)	"	xorps "OFFS(x)"(%[p4]), %%xmm"#y"	;\n"
-#define XO4(x, y)	"	xorps "OFFS(x)"(%[p5]), %%xmm"#y"	;\n"
-#define NOP(x)
-
-#define BLK64(pf, op, i)				\
-		pf(i)					\
-		op(i, 0)				\
-			op(i + 1, 1)			\
-				op(i + 2, 2)		\
-					op(i + 3, 3)
-
-static void
-xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,
-	  const unsigned long * __restrict p2)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i)					\
-		LD(i, 0)				\
-			LD(i + 1, 1)			\
-		PF1(i)					\
-				PF1(i + 2)		\
-				LD(i + 2, 2)		\
-					LD(i + 3, 3)	\
-		PF0(i + 4)				\
-				PF0(i + 6)		\
-		XO1(i, 0)				\
-			XO1(i + 1, 1)			\
-				XO1(i + 2, 2)		\
-					XO1(i + 3, 3)	\
-		ST(i, 0)				\
-			ST(i + 1, 1)			\
-				ST(i + 2, 2)		\
-					ST(i + 3, 3)	\
-
-
-		PF0(0)
-				PF0(2)
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines),
-	  [p1] "+r" (p1), [p2] "+r" (p2)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i)			\
-		BLK64(PF0, LD, i)	\
-		BLK64(PF1, XO1, i)	\
-		BLK64(NOP, ST, i)	\
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines),
-	  [p1] "+r" (p1), [p2] "+r" (p2)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,
-	  const unsigned long * __restrict p2,
-	  const unsigned long * __restrict p3)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i) \
-		PF1(i)					\
-				PF1(i + 2)		\
-		LD(i, 0)				\
-			LD(i + 1, 1)			\
-				LD(i + 2, 2)		\
-					LD(i + 3, 3)	\
-		PF2(i)					\
-				PF2(i + 2)		\
-		PF0(i + 4)				\
-				PF0(i + 6)		\
-		XO1(i, 0)				\
-			XO1(i + 1, 1)			\
-				XO1(i + 2, 2)		\
-					XO1(i + 3, 3)	\
-		XO2(i, 0)				\
-			XO2(i + 1, 1)			\
-				XO2(i + 2, 2)		\
-					XO2(i + 3, 3)	\
-		ST(i, 0)				\
-			ST(i + 1, 1)			\
-				ST(i + 2, 2)		\
-					ST(i + 3, 3)	\
-
-
-		PF0(0)
-				PF0(2)
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines),
-	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+		xor_force(&xor_block_avx);
+	} else if (IS_ENABLED(CONFIG_X86_64) || boot_cpu_has(X86_FEATURE_XMM)) {
+		xor_register(&xor_block_sse);
+		xor_register(&xor_block_sse_pf64);
+	} else if (boot_cpu_has(X86_FEATURE_MMX)) {
+		xor_register(&xor_block_pII_mmx);
+		xor_register(&xor_block_p5_mmx);
+	} else {
+		xor_register(&xor_block_8regs);
+		xor_register(&xor_block_8regs_p);
+		xor_register(&xor_block_32regs);
+		xor_register(&xor_block_32regs_p);
+	}
 }
 
-static void
-xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i)			\
-		BLK64(PF0, LD, i)	\
-		BLK64(PF1, XO1, i)	\
-		BLK64(PF2, XO2, i)	\
-		BLK64(NOP, ST, i)	\
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines),
-	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,
-	  const unsigned long * __restrict p2,
-	  const unsigned long * __restrict p3,
-	  const unsigned long * __restrict p4)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i) \
-		PF1(i)					\
-				PF1(i + 2)		\
-		LD(i, 0)				\
-			LD(i + 1, 1)			\
-				LD(i + 2, 2)		\
-					LD(i + 3, 3)	\
-		PF2(i)					\
-				PF2(i + 2)		\
-		XO1(i, 0)				\
-			XO1(i + 1, 1)			\
-				XO1(i + 2, 2)		\
-					XO1(i + 3, 3)	\
-		PF3(i)					\
-				PF3(i + 2)		\
-		PF0(i + 4)				\
-				PF0(i + 6)		\
-		XO2(i, 0)				\
-			XO2(i + 1, 1)			\
-				XO2(i + 2, 2)		\
-					XO2(i + 3, 3)	\
-		XO3(i, 0)				\
-			XO3(i + 1, 1)			\
-				XO3(i + 2, 2)		\
-					XO3(i + 3, 3)	\
-		ST(i, 0)				\
-			ST(i + 1, 1)			\
-				ST(i + 2, 2)		\
-					ST(i + 3, 3)	\
-
-
-		PF0(0)
-				PF0(2)
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       add %[inc], %[p4]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines), [p1] "+r" (p1),
-	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i)			\
-		BLK64(PF0, LD, i)	\
-		BLK64(PF1, XO1, i)	\
-		BLK64(PF2, XO2, i)	\
-		BLK64(PF3, XO3, i)	\
-		BLK64(NOP, ST, i)	\
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       add %[inc], %[p4]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines), [p1] "+r" (p1),
-	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,
-	  const unsigned long * __restrict p2,
-	  const unsigned long * __restrict p3,
-	  const unsigned long * __restrict p4,
-	  const unsigned long * __restrict p5)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i) \
-		PF1(i)					\
-				PF1(i + 2)		\
-		LD(i, 0)				\
-			LD(i + 1, 1)			\
-				LD(i + 2, 2)		\
-					LD(i + 3, 3)	\
-		PF2(i)					\
-				PF2(i + 2)		\
-		XO1(i, 0)				\
-			XO1(i + 1, 1)			\
-				XO1(i + 2, 2)		\
-					XO1(i + 3, 3)	\
-		PF3(i)					\
-				PF3(i + 2)		\
-		XO2(i, 0)				\
-			XO2(i + 1, 1)			\
-				XO2(i + 2, 2)		\
-					XO2(i + 3, 3)	\
-		PF4(i)					\
-				PF4(i + 2)		\
-		PF0(i + 4)				\
-				PF0(i + 6)		\
-		XO3(i, 0)				\
-			XO3(i + 1, 1)			\
-				XO3(i + 2, 2)		\
-					XO3(i + 3, 3)	\
-		XO4(i, 0)				\
-			XO4(i + 1, 1)			\
-				XO4(i + 2, 2)		\
-					XO4(i + 3, 3)	\
-		ST(i, 0)				\
-			ST(i + 1, 1)			\
-				ST(i + 2, 2)		\
-					ST(i + 3, 3)	\
-
-
-		PF0(0)
-				PF0(2)
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       add %[inc], %[p4]       ;\n"
-	"       add %[inc], %[p5]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines), [p1] "+r" (p1), [p2] "+r" (p2),
-	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static void
-xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4,
-	       const unsigned long * __restrict p5)
-{
-	unsigned long lines = bytes >> 8;
-
-	kernel_fpu_begin();
-
-	asm volatile(
-#undef BLOCK
-#define BLOCK(i)			\
-		BLK64(PF0, LD, i)	\
-		BLK64(PF1, XO1, i)	\
-		BLK64(PF2, XO2, i)	\
-		BLK64(PF3, XO3, i)	\
-		BLK64(PF4, XO4, i)	\
-		BLK64(NOP, ST, i)	\
-
-	" .align 32			;\n"
-	" 1:                            ;\n"
-
-		BLOCK(0)
-		BLOCK(4)
-		BLOCK(8)
-		BLOCK(12)
-
-	"       add %[inc], %[p1]       ;\n"
-	"       add %[inc], %[p2]       ;\n"
-	"       add %[inc], %[p3]       ;\n"
-	"       add %[inc], %[p4]       ;\n"
-	"       add %[inc], %[p5]       ;\n"
-	"       dec %[cnt]              ;\n"
-	"       jnz 1b                  ;\n"
-	: [cnt] "+r" (lines), [p1] "+r" (p1), [p2] "+r" (p2),
-	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
-	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
-	: "memory");
-
-	kernel_fpu_end();
-}
-
-static struct xor_block_template xor_block_sse_pf64 = {
-	.name = "prefetch64-sse",
-	.do_2 = xor_sse_2_pf64,
-	.do_3 = xor_sse_3_pf64,
-	.do_4 = xor_sse_4_pf64,
-	.do_5 = xor_sse_5_pf64,
-};
-
-#undef LD
-#undef XO1
-#undef XO2
-#undef XO3
-#undef XO4
-#undef ST
-#undef NOP
-#undef BLK64
-#undef BLOCK
-
-#undef XOR_CONSTANT_CONSTRAINT
-
-#ifdef CONFIG_X86_32
-# include <asm/xor_32.h>
-#else
-# include <asm/xor_64.h>
-#endif
-
 #endif /* _ASM_X86_XOR_H */
diff --git a/arch/x86/include/asm/xor_64.h b/arch/x86/include/asm/xor_64.h
deleted file mode 100644
index 2d2ceb241866..000000000000
--- a/arch/x86/include/asm/xor_64.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_XOR_64_H
-#define _ASM_X86_XOR_64_H
-
-static struct xor_block_template xor_block_sse = {
-	.name = "generic_sse",
-	.do_2 = xor_sse_2,
-	.do_3 = xor_sse_3,
-	.do_4 = xor_sse_4,
-	.do_5 = xor_sse_5,
-};
-
-
-/* Also try the AVX routines */
-#include <asm/xor_avx.h>
-
-/* We force the use of the SSE xor block because it can write around L2.
-   We may also be able to load into the L1 only depending on how the cpu
-   deals with a load to a line that is being prefetched.  */
-#define arch_xor_init arch_xor_init
-static __always_inline void __init arch_xor_init(void)
-{
-	if (boot_cpu_has(X86_FEATURE_AVX) &&
-	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
-		xor_force(&xor_block_avx);
-	} else {
-		xor_register(&xor_block_sse_pf64);
-		xor_register(&xor_block_sse);
-	}
-}
-
-#endif /* _ASM_X86_XOR_64_H */
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index 15fd8797ae61..eeda2610f7e7 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -23,6 +23,14 @@ xor-$(CONFIG_SPARC32)		+= sparc/xor-sparc32.o
 xor-$(CONFIG_SPARC64)		+= sparc/xor-vis.o sparc/xor-vis-glue.o
 xor-$(CONFIG_SPARC64)		+= sparc/xor-niagara.o sparc/xor-niagara-glue.o
 xor-$(CONFIG_S390)		+= s390/xor.o
+ifeq ($(CONFIG_32BIT),y)
+xor-$(CONFIG_UML_X86)		+= x86/xor-mmx.o
+endif
+xor-$(CONFIG_UML_X86)		+= x86/xor-avx.o
+xor-$(CONFIG_UML_X86)		+= x86/xor-sse.o
+xor-$(CONFIG_X86_32)		+= x86/xor-mmx.o
+xor-$(CONFIG_X86)		+= x86/xor-avx.o
+xor-$(CONFIG_X86)		+= x86/xor-sse.o
 
 
 CFLAGS_arm/xor-neon.o		+= $(CC_FLAGS_FPU)
diff --git a/arch/x86/include/asm/xor_avx.h b/lib/raid/xor/x86/xor-avx.c
similarity index 95%
rename from arch/x86/include/asm/xor_avx.h
rename to lib/raid/xor/x86/xor-avx.c
index c600888436bb..b49cb5199e70 100644
--- a/arch/x86/include/asm/xor_avx.h
+++ b/lib/raid/xor/x86/xor-avx.c
@@ -1,18 +1,16 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASM_X86_XOR_AVX_H
-#define _ASM_X86_XOR_AVX_H
-
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * Optimized RAID-5 checksumming functions for AVX
+ * Optimized XOR parity functions for AVX
  *
  * Copyright (C) 2012 Intel Corporation
  * Author: Jim Kukunas <james.t.kukunas@linux.intel.com>
  *
  * Based on Ingo Molnar and Zach Brown's respective MMX and SSE routines
  */
-
 #include <linux/compiler.h>
+#include <linux/raid/xor_impl.h>
 #include <asm/fpu/api.h>
+#include <asm/xor.h>
 
 #define BLOCK4(i) \
 		BLOCK(32 * i, 0) \
@@ -158,12 +156,10 @@ do { \
 	kernel_fpu_end();
 }
 
-static struct xor_block_template xor_block_avx = {
+struct xor_block_template xor_block_avx = {
 	.name = "avx",
 	.do_2 = xor_avx_2,
 	.do_3 = xor_avx_3,
 	.do_4 = xor_avx_4,
 	.do_5 = xor_avx_5,
 };
-
-#endif
diff --git a/arch/x86/include/asm/xor_32.h b/lib/raid/xor/x86/xor-mmx.c
similarity index 90%
rename from arch/x86/include/asm/xor_32.h
rename to lib/raid/xor/x86/xor-mmx.c
index ee32d08c27bc..cf0fafea33b7 100644
--- a/arch/x86/include/asm/xor_32.h
+++ b/lib/raid/xor/x86/xor-mmx.c
@@ -1,15 +1,12 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_X86_XOR_32_H
-#define _ASM_X86_XOR_32_H
-
-/*
- * Optimized RAID-5 checksumming functions for MMX.
- */
-
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * High-speed RAID5 checksumming functions utilizing MMX instructions.
+ * Optimized XOR parity functions for MMX.
+ *
  * Copyright (C) 1998 Ingo Molnar.
  */
+#include <linux/raid/xor_impl.h>
+#include <asm/fpu/api.h>
+#include <asm/xor.h>
 
 #define LD(x, y)	"       movq   8*("#x")(%1), %%mm"#y"   ;\n"
 #define ST(x, y)	"       movq %%mm"#y",   8*("#x")(%1)   ;\n"
@@ -18,8 +15,6 @@
 #define XO3(x, y)	"       pxor   8*("#x")(%4), %%mm"#y"   ;\n"
 #define XO4(x, y)	"       pxor   8*("#x")(%5), %%mm"#y"   ;\n"
 
-#include <asm/fpu/api.h>
-
 static void
 xor_pII_mmx_2(unsigned long bytes, unsigned long * __restrict p1,
 	      const unsigned long * __restrict p2)
@@ -519,7 +514,7 @@ xor_p5_mmx_5(unsigned long bytes, unsigned long * __restrict p1,
 	kernel_fpu_end();
 }
 
-static struct xor_block_template xor_block_pII_mmx = {
+struct xor_block_template xor_block_pII_mmx = {
 	.name = "pII_mmx",
 	.do_2 = xor_pII_mmx_2,
 	.do_3 = xor_pII_mmx_3,
@@ -527,49 +522,10 @@ static struct xor_block_template xor_block_pII_mmx = {
 	.do_5 = xor_pII_mmx_5,
 };
 
-static struct xor_block_template xor_block_p5_mmx = {
+struct xor_block_template xor_block_p5_mmx = {
 	.name = "p5_mmx",
 	.do_2 = xor_p5_mmx_2,
 	.do_3 = xor_p5_mmx_3,
 	.do_4 = xor_p5_mmx_4,
 	.do_5 = xor_p5_mmx_5,
 };
-
-static struct xor_block_template xor_block_pIII_sse = {
-	.name = "pIII_sse",
-	.do_2 = xor_sse_2,
-	.do_3 = xor_sse_3,
-	.do_4 = xor_sse_4,
-	.do_5 = xor_sse_5,
-};
-
-/* Also try the AVX routines */
-#include <asm/xor_avx.h>
-
-/* Also try the generic routines.  */
-#include <asm-generic/xor.h>
-
-/* We force the use of the SSE xor block because it can write around L2.
-   We may also be able to load into the L1 only depending on how the cpu
-   deals with a load to a line that is being prefetched.  */
-#define arch_xor_init arch_xor_init
-static __always_inline void __init arch_xor_init(void)
-{
-	if (boot_cpu_has(X86_FEATURE_AVX) &&
-	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
-		xor_force(&xor_block_avx);
-	} else if (boot_cpu_has(X86_FEATURE_XMM)) {
-		xor_register(&xor_block_pIII_sse);
-		xor_register(&xor_block_sse_pf64);
-	} else if (boot_cpu_has(X86_FEATURE_MMX)) {
-		xor_register(&xor_block_pII_mmx);
-		xor_register(&xor_block_p5_mmx);
-	} else {
-		xor_register(&xor_block_8regs);
-		xor_register(&xor_block_8regs_p);
-		xor_register(&xor_block_32regs);
-		xor_register(&xor_block_32regs_p);
-	}
-}
-
-#endif /* _ASM_X86_XOR_32_H */
diff --git a/lib/raid/xor/x86/xor-sse.c b/lib/raid/xor/x86/xor-sse.c
new file mode 100644
index 000000000000..0e727ced8b00
--- /dev/null
+++ b/lib/raid/xor/x86/xor-sse.c
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Optimized XOR parity functions for SSE.
+ *
+ * Cache avoiding checksumming functions utilizing KNI instructions
+ * Copyright (C) 1999 Zach Brown (with obvious credit due Ingo)
+ *
+ * Based on
+ * High-speed RAID5 checksumming functions utilizing SSE instructions.
+ * Copyright (C) 1998 Ingo Molnar.
+ *
+ * x86-64 changes / gcc fixes from Andi Kleen.
+ * Copyright 2002 Andi Kleen, SuSE Labs.
+ */
+#include <linux/raid/xor_impl.h>
+#include <asm/fpu/api.h>
+#include <asm/xor.h>
+
+#ifdef CONFIG_X86_32
+/* reduce register pressure */
+# define XOR_CONSTANT_CONSTRAINT "i"
+#else
+# define XOR_CONSTANT_CONSTRAINT "re"
+#endif
+
+#define OFFS(x)		"16*("#x")"
+#define PF_OFFS(x)	"256+16*("#x")"
+#define PF0(x)		"	prefetchnta "PF_OFFS(x)"(%[p1])		;\n"
+#define LD(x, y)	"	movaps "OFFS(x)"(%[p1]), %%xmm"#y"	;\n"
+#define ST(x, y)	"	movaps %%xmm"#y", "OFFS(x)"(%[p1])	;\n"
+#define PF1(x)		"	prefetchnta "PF_OFFS(x)"(%[p2])		;\n"
+#define PF2(x)		"	prefetchnta "PF_OFFS(x)"(%[p3])		;\n"
+#define PF3(x)		"	prefetchnta "PF_OFFS(x)"(%[p4])		;\n"
+#define PF4(x)		"	prefetchnta "PF_OFFS(x)"(%[p5])		;\n"
+#define XO1(x, y)	"	xorps "OFFS(x)"(%[p2]), %%xmm"#y"	;\n"
+#define XO2(x, y)	"	xorps "OFFS(x)"(%[p3]), %%xmm"#y"	;\n"
+#define XO3(x, y)	"	xorps "OFFS(x)"(%[p4]), %%xmm"#y"	;\n"
+#define XO4(x, y)	"	xorps "OFFS(x)"(%[p5]), %%xmm"#y"	;\n"
+#define NOP(x)
+
+#define BLK64(pf, op, i)				\
+		pf(i)					\
+		op(i, 0)				\
+			op(i + 1, 1)			\
+				op(i + 2, 2)		\
+					op(i + 3, 3)
+
+static void
+xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,
+	  const unsigned long * __restrict p2)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i)					\
+		LD(i, 0)				\
+			LD(i + 1, 1)			\
+		PF1(i)					\
+				PF1(i + 2)		\
+				LD(i + 2, 2)		\
+					LD(i + 3, 3)	\
+		PF0(i + 4)				\
+				PF0(i + 6)		\
+		XO1(i, 0)				\
+			XO1(i + 1, 1)			\
+				XO1(i + 2, 2)		\
+					XO1(i + 3, 3)	\
+		ST(i, 0)				\
+			ST(i + 1, 1)			\
+				ST(i + 2, 2)		\
+					ST(i + 3, 3)	\
+
+
+		PF0(0)
+				PF0(2)
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines),
+	  [p1] "+r" (p1), [p2] "+r" (p2)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i)			\
+		BLK64(PF0, LD, i)	\
+		BLK64(PF1, XO1, i)	\
+		BLK64(NOP, ST, i)	\
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines),
+	  [p1] "+r" (p1), [p2] "+r" (p2)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,
+	  const unsigned long * __restrict p2,
+	  const unsigned long * __restrict p3)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i) \
+		PF1(i)					\
+				PF1(i + 2)		\
+		LD(i, 0)				\
+			LD(i + 1, 1)			\
+				LD(i + 2, 2)		\
+					LD(i + 3, 3)	\
+		PF2(i)					\
+				PF2(i + 2)		\
+		PF0(i + 4)				\
+				PF0(i + 6)		\
+		XO1(i, 0)				\
+			XO1(i + 1, 1)			\
+				XO1(i + 2, 2)		\
+					XO1(i + 3, 3)	\
+		XO2(i, 0)				\
+			XO2(i + 1, 1)			\
+				XO2(i + 2, 2)		\
+					XO2(i + 3, 3)	\
+		ST(i, 0)				\
+			ST(i + 1, 1)			\
+				ST(i + 2, 2)		\
+					ST(i + 3, 3)	\
+
+
+		PF0(0)
+				PF0(2)
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines),
+	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i)			\
+		BLK64(PF0, LD, i)	\
+		BLK64(PF1, XO1, i)	\
+		BLK64(PF2, XO2, i)	\
+		BLK64(NOP, ST, i)	\
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines),
+	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,
+	  const unsigned long * __restrict p2,
+	  const unsigned long * __restrict p3,
+	  const unsigned long * __restrict p4)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i) \
+		PF1(i)					\
+				PF1(i + 2)		\
+		LD(i, 0)				\
+			LD(i + 1, 1)			\
+				LD(i + 2, 2)		\
+					LD(i + 3, 3)	\
+		PF2(i)					\
+				PF2(i + 2)		\
+		XO1(i, 0)				\
+			XO1(i + 1, 1)			\
+				XO1(i + 2, 2)		\
+					XO1(i + 3, 3)	\
+		PF3(i)					\
+				PF3(i + 2)		\
+		PF0(i + 4)				\
+				PF0(i + 6)		\
+		XO2(i, 0)				\
+			XO2(i + 1, 1)			\
+				XO2(i + 2, 2)		\
+					XO2(i + 3, 3)	\
+		XO3(i, 0)				\
+			XO3(i + 1, 1)			\
+				XO3(i + 2, 2)		\
+					XO3(i + 3, 3)	\
+		ST(i, 0)				\
+			ST(i + 1, 1)			\
+				ST(i + 2, 2)		\
+					ST(i + 3, 3)	\
+
+
+		PF0(0)
+				PF0(2)
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       add %[inc], %[p4]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines), [p1] "+r" (p1),
+	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3,
+	       const unsigned long * __restrict p4)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i)			\
+		BLK64(PF0, LD, i)	\
+		BLK64(PF1, XO1, i)	\
+		BLK64(PF2, XO2, i)	\
+		BLK64(PF3, XO3, i)	\
+		BLK64(NOP, ST, i)	\
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       add %[inc], %[p4]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines), [p1] "+r" (p1),
+	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,
+	  const unsigned long * __restrict p2,
+	  const unsigned long * __restrict p3,
+	  const unsigned long * __restrict p4,
+	  const unsigned long * __restrict p5)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i) \
+		PF1(i)					\
+				PF1(i + 2)		\
+		LD(i, 0)				\
+			LD(i + 1, 1)			\
+				LD(i + 2, 2)		\
+					LD(i + 3, 3)	\
+		PF2(i)					\
+				PF2(i + 2)		\
+		XO1(i, 0)				\
+			XO1(i + 1, 1)			\
+				XO1(i + 2, 2)		\
+					XO1(i + 3, 3)	\
+		PF3(i)					\
+				PF3(i + 2)		\
+		XO2(i, 0)				\
+			XO2(i + 1, 1)			\
+				XO2(i + 2, 2)		\
+					XO2(i + 3, 3)	\
+		PF4(i)					\
+				PF4(i + 2)		\
+		PF0(i + 4)				\
+				PF0(i + 6)		\
+		XO3(i, 0)				\
+			XO3(i + 1, 1)			\
+				XO3(i + 2, 2)		\
+					XO3(i + 3, 3)	\
+		XO4(i, 0)				\
+			XO4(i + 1, 1)			\
+				XO4(i + 2, 2)		\
+					XO4(i + 3, 3)	\
+		ST(i, 0)				\
+			ST(i + 1, 1)			\
+				ST(i + 2, 2)		\
+					ST(i + 3, 3)	\
+
+
+		PF0(0)
+				PF0(2)
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       add %[inc], %[p4]       ;\n"
+	"       add %[inc], %[p5]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines), [p1] "+r" (p1), [p2] "+r" (p2),
+	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+static void
+xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3,
+	       const unsigned long * __restrict p4,
+	       const unsigned long * __restrict p5)
+{
+	unsigned long lines = bytes >> 8;
+
+	kernel_fpu_begin();
+
+	asm volatile(
+#undef BLOCK
+#define BLOCK(i)			\
+		BLK64(PF0, LD, i)	\
+		BLK64(PF1, XO1, i)	\
+		BLK64(PF2, XO2, i)	\
+		BLK64(PF3, XO3, i)	\
+		BLK64(PF4, XO4, i)	\
+		BLK64(NOP, ST, i)	\
+
+	" .align 32			;\n"
+	" 1:                            ;\n"
+
+		BLOCK(0)
+		BLOCK(4)
+		BLOCK(8)
+		BLOCK(12)
+
+	"       add %[inc], %[p1]       ;\n"
+	"       add %[inc], %[p2]       ;\n"
+	"       add %[inc], %[p3]       ;\n"
+	"       add %[inc], %[p4]       ;\n"
+	"       add %[inc], %[p5]       ;\n"
+	"       dec %[cnt]              ;\n"
+	"       jnz 1b                  ;\n"
+	: [cnt] "+r" (lines), [p1] "+r" (p1), [p2] "+r" (p2),
+	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
+	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
+	: "memory");
+
+	kernel_fpu_end();
+}
+
+struct xor_block_template xor_block_sse = {
+	.name = "sse",
+	.do_2 = xor_sse_2,
+	.do_3 = xor_sse_3,
+	.do_4 = xor_sse_4,
+	.do_5 = xor_sse_5,
+};
+
+struct xor_block_template xor_block_sse_pf64 = {
+	.name = "prefetch64-sse",
+	.do_2 = xor_sse_2_pf64,
+	.do_3 = xor_sse_3_pf64,
+	.do_4 = xor_sse_4_pf64,
+	.do_5 = xor_sse_5_pf64,
+};
-- 
2.47.3


