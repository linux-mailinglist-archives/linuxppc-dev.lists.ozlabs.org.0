Return-Path: <linuxppc-dev+bounces-17289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGMzIQtjoGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:13:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D31A8570
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFL75zB0z3cKQ;
	Fri, 27 Feb 2026 02:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118719;
	cv=none; b=YPCm0fwOnDmQ2pK54sD/0fcN3GPIWCWZ1kPA+tZEdAGZNMwiRK4AX4TmwgTooHg49xuz78mCUW420HV044741fG4G1neRE9sQNl8UScZg/AaFRiIzrsX2MIRvOLedzyLKADUqNab2014yg+CrgkVpIfGdTs13yACpHDxvzuWFe8Ah6eriicFlpMJpth9na4K6kEa6sQ/RmCD9FP+iQL7BCMlhT0P1iVhpmfEd4arE5z4VHmUOyCF7y0/uE0K4tmyuWnnYUALp3szC75L+jgh7EWrGXlnOeK4hD2NRp64qlZMXAPJKGUuu//dnGW5TolxAN3L1dvpB62pinIxLyXo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118719; c=relaxed/relaxed;
	bh=1N/WiUgWMSpYjlopJG9AbWnsi38DwWQVuDQYplZc2H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJ4aRAR3wOCbAH8xcDtNsxwrk57wIwALf7c+t5CbiIHnMK1YutAl8/cO1tdw0AXoVRunuC365MzQWC+aNtCgWSCCng2z7Mo/StyKYBc6UGL7Ja+M064i/pBq2fATysZBoiFqC2W27qRpTH4RBLJfl9A56/LZPHLMK3zzwTB9fKDQtA2bNXEMv5AbTwxfLaDPUtj4sMMFr3rYO9hUdkI2cZRrr6E5GrsOMwX/pk5w0nrNCpmDb1FLcbXNyQNG5gfS1AIaToacg9o0dqjZD1PXIlgWKgmYhKLSeZ4XPfEx3E5/oBSCKlqJjCY2xPpjH+TtgD1Q9itTND5T7DGja1KytQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RVYvPTrC; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RVYvPTrC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFL21tMLz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1N/WiUgWMSpYjlopJG9AbWnsi38DwWQVuDQYplZc2H8=; b=RVYvPTrC9VsHqGI+vAdX5WvLmo
	2/dUPA3s80/g4rfGsHuQGVL0XMDyIkHOjelmK0A2uCwAX43gM++Y7oomsb61j0pg8fshV8Z2OETvi
	lw/t7qLV+UG4b3FcZEqegNdMnRlvMUjVth/cix5BAjQlqDIaGMFTCzpiBvqRGGZPiVBPSzDopadsz
	KuoNLOf7BQWecY/Zsn2pCgY1zSZNuROTes1oAYq4+m/SSBaRimtIyzASOS0Fd54iX2OpFng+4TRwX
	wUPvn6HPPGT931iNBXQuFSAHhvPLzILiGTcklm7VjqCI23NSsIyy8mjyjwgj9IlP6i7+HgZ2unOTz
	+JKXrSog==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1S-00000006QGJ-1uEA;
	Thu, 26 Feb 2026 15:11:26 +0000
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
Subject: [PATCH 13/25] loongarch: move the XOR code to lib/raid/
Date: Thu, 26 Feb 2026 07:10:25 -0800
Message-ID: <20260226151106.144735-14-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17289-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@li
 sts.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,lst.de:mid,lst.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 770D31A8570
X-Rspamd-Action: no action

Move the optimized XOR into lib/raid and include it it in xor.ko
instead of always building it into the main kernel image.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/loongarch/include/asm/xor.h              | 24 ++----------
 arch/loongarch/include/asm/xor_simd.h         | 34 ----------------
 arch/loongarch/lib/Makefile                   |  2 -
 lib/raid/xor/Makefile                         |  2 +
 .../lib => lib/raid/xor/loongarch}/xor_simd.c |  0
 .../lib => lib/raid/xor/loongarch}/xor_simd.h |  0
 .../raid/xor/loongarch}/xor_simd_glue.c       | 39 +++++++++++--------
 .../raid/xor/loongarch}/xor_template.c        |  0
 8 files changed, 27 insertions(+), 74 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/xor_simd.h
 rename {arch/loongarch/lib => lib/raid/xor/loongarch}/xor_simd.c (100%)
 rename {arch/loongarch/lib => lib/raid/xor/loongarch}/xor_simd.h (100%)
 rename {arch/loongarch/lib => lib/raid/xor/loongarch}/xor_simd_glue.c (64%)
 rename {arch/loongarch/lib => lib/raid/xor/loongarch}/xor_template.c (100%)

diff --git a/arch/loongarch/include/asm/xor.h b/arch/loongarch/include/asm/xor.h
index d17c0e3b047f..7e32f72f8b03 100644
--- a/arch/loongarch/include/asm/xor.h
+++ b/arch/loongarch/include/asm/xor.h
@@ -6,27 +6,6 @@
 #define _ASM_LOONGARCH_XOR_H
 
 #include <asm/cpu-features.h>
-#include <asm/xor_simd.h>
-
-#ifdef CONFIG_CPU_HAS_LSX
-static struct xor_block_template xor_block_lsx = {
-	.name = "lsx",
-	.do_2 = xor_lsx_2,
-	.do_3 = xor_lsx_3,
-	.do_4 = xor_lsx_4,
-	.do_5 = xor_lsx_5,
-};
-#endif /* CONFIG_CPU_HAS_LSX */
-
-#ifdef CONFIG_CPU_HAS_LASX
-static struct xor_block_template xor_block_lasx = {
-	.name = "lasx",
-	.do_2 = xor_lasx_2,
-	.do_3 = xor_lasx_3,
-	.do_4 = xor_lasx_4,
-	.do_5 = xor_lasx_5,
-};
-#endif /* CONFIG_CPU_HAS_LASX */
 
 /*
  * For grins, also test the generic routines.
@@ -38,6 +17,9 @@ static struct xor_block_template xor_block_lasx = {
  */
 #include <asm-generic/xor.h>
 
+extern struct xor_block_template xor_block_lsx;
+extern struct xor_block_template xor_block_lasx;
+
 #define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
diff --git a/arch/loongarch/include/asm/xor_simd.h b/arch/loongarch/include/asm/xor_simd.h
deleted file mode 100644
index 471b96332f38..000000000000
--- a/arch/loongarch/include/asm/xor_simd.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2023 WANG Xuerui <git@xen0n.name>
- */
-#ifndef _ASM_LOONGARCH_XOR_SIMD_H
-#define _ASM_LOONGARCH_XOR_SIMD_H
-
-#ifdef CONFIG_CPU_HAS_LSX
-void xor_lsx_2(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2);
-void xor_lsx_3(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2, const unsigned long * __restrict p3);
-void xor_lsx_4(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2, const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4);
-void xor_lsx_5(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2, const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4, const unsigned long * __restrict p5);
-#endif /* CONFIG_CPU_HAS_LSX */
-
-#ifdef CONFIG_CPU_HAS_LASX
-void xor_lasx_2(unsigned long bytes, unsigned long * __restrict p1,
-	        const unsigned long * __restrict p2);
-void xor_lasx_3(unsigned long bytes, unsigned long * __restrict p1,
-	        const unsigned long * __restrict p2, const unsigned long * __restrict p3);
-void xor_lasx_4(unsigned long bytes, unsigned long * __restrict p1,
-	        const unsigned long * __restrict p2, const unsigned long * __restrict p3,
-	        const unsigned long * __restrict p4);
-void xor_lasx_5(unsigned long bytes, unsigned long * __restrict p1,
-	        const unsigned long * __restrict p2, const unsigned long * __restrict p3,
-	        const unsigned long * __restrict p4, const unsigned long * __restrict p5);
-#endif /* CONFIG_CPU_HAS_LASX */
-
-#endif /* _ASM_LOONGARCH_XOR_SIMD_H */
diff --git a/arch/loongarch/lib/Makefile b/arch/loongarch/lib/Makefile
index ccea3bbd4353..827a88529a42 100644
--- a/arch/loongarch/lib/Makefile
+++ b/arch/loongarch/lib/Makefile
@@ -8,6 +8,4 @@ lib-y	+= delay.o memset.o memcpy.o memmove.o \
 
 obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
 
-obj-$(CONFIG_CPU_HAS_LSX) += xor_simd.o xor_simd_glue.o
-
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index 3c13851219e5..fafd131cef27 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -15,6 +15,8 @@ xor-$(CONFIG_KERNEL_MODE_NEON)	+= arm/xor-neon.o arm/xor-neon-glue.o
 else
 xor-$(CONFIG_KERNEL_MODE_NEON)	+= arm64/xor-neon.o arm64/xor-neon-glue.o
 endif
+xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd.o
+xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd_glue.o
 
 
 CFLAGS_arm/xor-neon.o		+= $(CC_FLAGS_FPU)
diff --git a/arch/loongarch/lib/xor_simd.c b/lib/raid/xor/loongarch/xor_simd.c
similarity index 100%
rename from arch/loongarch/lib/xor_simd.c
rename to lib/raid/xor/loongarch/xor_simd.c
diff --git a/arch/loongarch/lib/xor_simd.h b/lib/raid/xor/loongarch/xor_simd.h
similarity index 100%
rename from arch/loongarch/lib/xor_simd.h
rename to lib/raid/xor/loongarch/xor_simd.h
diff --git a/arch/loongarch/lib/xor_simd_glue.c b/lib/raid/xor/loongarch/xor_simd_glue.c
similarity index 64%
rename from arch/loongarch/lib/xor_simd_glue.c
rename to lib/raid/xor/loongarch/xor_simd_glue.c
index 393f689dbcf6..11fa3b47ba83 100644
--- a/arch/loongarch/lib/xor_simd_glue.c
+++ b/lib/raid/xor/loongarch/xor_simd_glue.c
@@ -5,24 +5,23 @@
  * Copyright (C) 2023 WANG Xuerui <git@xen0n.name>
  */
 
-#include <linux/export.h>
 #include <linux/sched.h>
+#include <linux/raid/xor_impl.h>
 #include <asm/fpu.h>
-#include <asm/xor_simd.h>
+#include <asm/xor.h>
 #include "xor_simd.h"
 
 #define MAKE_XOR_GLUE_2(flavor)							\
-void xor_##flavor##_2(unsigned long bytes, unsigned long * __restrict p1,	\
+static void xor_##flavor##_2(unsigned long bytes, unsigned long * __restrict p1,\
 		      const unsigned long * __restrict p2)			\
 {										\
 	kernel_fpu_begin();							\
 	__xor_##flavor##_2(bytes, p1, p2);					\
 	kernel_fpu_end();							\
 }										\
-EXPORT_SYMBOL_GPL(xor_##flavor##_2)
 
 #define MAKE_XOR_GLUE_3(flavor)							\
-void xor_##flavor##_3(unsigned long bytes, unsigned long * __restrict p1,	\
+static void xor_##flavor##_3(unsigned long bytes, unsigned long * __restrict p1,\
 		      const unsigned long * __restrict p2,			\
 		      const unsigned long * __restrict p3)			\
 {										\
@@ -30,10 +29,9 @@ void xor_##flavor##_3(unsigned long bytes, unsigned long * __restrict p1,	\
 	__xor_##flavor##_3(bytes, p1, p2, p3);					\
 	kernel_fpu_end();							\
 }										\
-EXPORT_SYMBOL_GPL(xor_##flavor##_3)
 
 #define MAKE_XOR_GLUE_4(flavor)							\
-void xor_##flavor##_4(unsigned long bytes, unsigned long * __restrict p1,	\
+static void xor_##flavor##_4(unsigned long bytes, unsigned long * __restrict p1,\
 		      const unsigned long * __restrict p2,			\
 		      const unsigned long * __restrict p3,			\
 		      const unsigned long * __restrict p4)			\
@@ -42,10 +40,9 @@ void xor_##flavor##_4(unsigned long bytes, unsigned long * __restrict p1,	\
 	__xor_##flavor##_4(bytes, p1, p2, p3, p4);				\
 	kernel_fpu_end();							\
 }										\
-EXPORT_SYMBOL_GPL(xor_##flavor##_4)
 
 #define MAKE_XOR_GLUE_5(flavor)							\
-void xor_##flavor##_5(unsigned long bytes, unsigned long * __restrict p1,	\
+static void xor_##flavor##_5(unsigned long bytes, unsigned long * __restrict p1,\
 		      const unsigned long * __restrict p2,			\
 		      const unsigned long * __restrict p3,			\
 		      const unsigned long * __restrict p4,			\
@@ -55,18 +52,26 @@ void xor_##flavor##_5(unsigned long bytes, unsigned long * __restrict p1,	\
 	__xor_##flavor##_5(bytes, p1, p2, p3, p4, p5);				\
 	kernel_fpu_end();							\
 }										\
-EXPORT_SYMBOL_GPL(xor_##flavor##_5)
 
-#define MAKE_XOR_GLUES(flavor)		\
-	MAKE_XOR_GLUE_2(flavor);	\
-	MAKE_XOR_GLUE_3(flavor);	\
-	MAKE_XOR_GLUE_4(flavor);	\
-	MAKE_XOR_GLUE_5(flavor)
+#define MAKE_XOR_GLUES(flavor)				\
+	MAKE_XOR_GLUE_2(flavor);			\
+	MAKE_XOR_GLUE_3(flavor);			\
+	MAKE_XOR_GLUE_4(flavor);			\
+	MAKE_XOR_GLUE_5(flavor);			\
+							\
+struct xor_block_template xor_block_##flavor = {	\
+	.name = __stringify(flavor),			\
+	.do_2 = xor_##flavor##_2,			\
+	.do_3 = xor_##flavor##_3,			\
+	.do_4 = xor_##flavor##_4,			\
+	.do_5 = xor_##flavor##_5,			\
+}
+
 
 #ifdef CONFIG_CPU_HAS_LSX
 MAKE_XOR_GLUES(lsx);
-#endif
+#endif /* CONFIG_CPU_HAS_LSX */
 
 #ifdef CONFIG_CPU_HAS_LASX
 MAKE_XOR_GLUES(lasx);
-#endif
+#endif /* CONFIG_CPU_HAS_LASX */
diff --git a/arch/loongarch/lib/xor_template.c b/lib/raid/xor/loongarch/xor_template.c
similarity index 100%
rename from arch/loongarch/lib/xor_template.c
rename to lib/raid/xor/loongarch/xor_template.c
-- 
2.47.3


