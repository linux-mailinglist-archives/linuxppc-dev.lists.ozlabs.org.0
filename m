Return-Path: <linuxppc-dev+bounces-17296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABJaLzljoGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080581A85D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLD6Tsdz3cPw;
	Fri, 27 Feb 2026 02:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118724;
	cv=none; b=K6a1u4d5qrjzCtzblBfxBwRdxzTFJMsLndkHyEVo2hOG4jIDsNLl05I7V93owL8vYP+toaqf9LdFY9RZXcDCYFkXlTihZwuL+CEP/hlUDPzgajYq0hgOr+I6cpH8a4lyb/UVAzG0leACS2+IEky3sY+B19BB6MmS1LtZtqeVNrszSIOvWblspo/+HRT5fWsPu/yhhtYyalq3ZIlX8K4mIwFCsa3BWq+eZbrAEiC4tNxPisXs5ao847Q8rp/nLZEeG5rB7ltRGUoYdoJsjlFBNg9yfzqpidgFiFrIxrBOCa26B1Z6PCnVCMasISk1UZVakb56XY/PE4tRNRvIVewk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118724; c=relaxed/relaxed;
	bh=Wm3fq6lPyIAlZT0/xjmEusfNIQRwR8CzDQcR5/1fvIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKrf1IWrTXX85ujLSIYwhjUCN9mkU+IcnFXPm+JmhTeYJXc3vMkBrMAfuiBsyVCDIxQNcY7gnRSBMD5nnql+ZkVXjWTH1TMuxU98UnbOh8VHYjbIyu1NyG3FS0HzmH1TEHqNWSrnEJ3xd77tDUn5FxHm5M5VUTMKv9Ijga/1xyrfMEE7E1uQAJbRO3A73WU4yimhJUv+OA53/Iq6fHEWQsV9ksDjPGFfxfVVzI2fhcWjKboDRKObqriQ1uFtpX3u1FYpCfypeQFSDx/LPJBfFh5sii/kSch/R2+OC68Ftfz4fLv2NMb78PLTImWOOS0Oc9xGXugt/MQMYpyoKc7jVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJNKTZnF; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJNKTZnF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFL40PpWz3cCJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Wm3fq6lPyIAlZT0/xjmEusfNIQRwR8CzDQcR5/1fvIU=; b=FJNKTZnFdI19cSqah+OXNH0v6X
	4b9y/9miHcVb4VyFk724rS7AzaXnL3AHrITYrP/uJFxjMeKes8twt90hhIHnqUd7hWM6G/u+POAnS
	wLJ6kGG06ct6JHxgZoyWn9HwWLF2nwgc32OY53eq3y5/X99C6WnP0Sh1alWaLhMhOrkRHK9J6WrFs
	VE09b/LI5WwOV5BefqLuEfHN7G2XvzGwugsGTVamurWchEqBowzVamzb5Yl/TuAppe29nU0okyX/5
	1n8QxZUXbMg00IDPGHr1Up3DDy/Ubj/aSwB9jxW+TUXrOjV3NtvVUcom9xxJUjh+JHKQmrIArjnIZ
	TddTmD4g==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1W-00000006QOa-3gka;
	Thu, 26 Feb 2026 15:11:30 +0000
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
Subject: [PATCH 16/25] sparc: move the XOR code to lib/raid/
Date: Thu, 26 Feb 2026 07:10:28 -0800
Message-ID: <20260226151106.144735-17-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-17296-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,infradead.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,davemloft.net:email]
X-Rspamd-Queue-Id: 080581A85D3
X-Rspamd-Action: no action

Move the optimized XOR into lib/raid and include it it in xor.ko
instead of always building it into the main kernel image.

This also splits the sparc64 code into separate files for the two
implementations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sparc/include/asm/asm-prototypes.h       |   1 -
 arch/sparc/include/asm/xor.h                  |  45 ++-
 arch/sparc/include/asm/xor_64.h               |  76 ----
 arch/sparc/lib/Makefile                       |   2 +-
 lib/raid/xor/Makefile                         |   3 +
 lib/raid/xor/sparc/xor-niagara-glue.c         |  33 ++
 .../xor.S => lib/raid/xor/sparc/xor-niagara.S | 346 +----------------
 .../raid/xor/sparc/xor-sparc32.c              |  23 +-
 lib/raid/xor/sparc/xor-vis-glue.c             |  35 ++
 lib/raid/xor/sparc/xor-vis.S                  | 348 ++++++++++++++++++
 10 files changed, 465 insertions(+), 447 deletions(-)
 delete mode 100644 arch/sparc/include/asm/xor_64.h
 create mode 100644 lib/raid/xor/sparc/xor-niagara-glue.c
 rename arch/sparc/lib/xor.S => lib/raid/xor/sparc/xor-niagara.S (53%)
 rename arch/sparc/include/asm/xor_32.h => lib/raid/xor/sparc/xor-sparc32.c (93%)
 create mode 100644 lib/raid/xor/sparc/xor-vis-glue.c
 create mode 100644 lib/raid/xor/sparc/xor-vis.S

diff --git a/arch/sparc/include/asm/asm-prototypes.h b/arch/sparc/include/asm/asm-prototypes.h
index 08810808ca6d..bbd1a8afaabf 100644
--- a/arch/sparc/include/asm/asm-prototypes.h
+++ b/arch/sparc/include/asm/asm-prototypes.h
@@ -14,7 +14,6 @@
 #include <asm/oplib.h>
 #include <asm/pgtable.h>
 #include <asm/trap_block.h>
-#include <asm/xor.h>
 
 void *__memscan_zero(void *, size_t);
 void *__memscan_generic(void *, int, size_t);
diff --git a/arch/sparc/include/asm/xor.h b/arch/sparc/include/asm/xor.h
index f4c651e203c4..f923b009fc24 100644
--- a/arch/sparc/include/asm/xor.h
+++ b/arch/sparc/include/asm/xor.h
@@ -1,9 +1,44 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
+ * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
+ */
 #ifndef ___ASM_SPARC_XOR_H
 #define ___ASM_SPARC_XOR_H
+
 #if defined(__sparc__) && defined(__arch64__)
-#include <asm/xor_64.h>
-#else
-#include <asm/xor_32.h>
-#endif
-#endif
+#include <asm/spitfire.h>
+
+extern struct xor_block_template xor_block_VIS;
+extern struct xor_block_template xor_block_niagara;
+
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	/* Force VIS for everything except Niagara.  */
+	if (tlb_type == hypervisor &&
+	    (sun4v_chip_type == SUN4V_CHIP_NIAGARA1 ||
+	     sun4v_chip_type == SUN4V_CHIP_NIAGARA2 ||
+	     sun4v_chip_type == SUN4V_CHIP_NIAGARA3 ||
+	     sun4v_chip_type == SUN4V_CHIP_NIAGARA4 ||
+	     sun4v_chip_type == SUN4V_CHIP_NIAGARA5))
+		xor_force(&xor_block_niagara);
+	else
+		xor_force(&xor_block_VIS);
+}
+#else /* sparc64 */
+
+/* For grins, also test the generic routines.  */
+#include <asm-generic/xor.h>
+
+extern struct xor_block_template xor_block_SPARC;
+
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_32regs);
+	xor_register(&xor_block_SPARC);
+}
+#endif /* !sparc64 */
+#endif /* ___ASM_SPARC_XOR_H */
diff --git a/arch/sparc/include/asm/xor_64.h b/arch/sparc/include/asm/xor_64.h
deleted file mode 100644
index e0482ecc0a68..000000000000
--- a/arch/sparc/include/asm/xor_64.h
+++ /dev/null
@@ -1,76 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * include/asm/xor.h
- *
- * High speed xor_block operation for RAID4/5 utilizing the
- * UltraSparc Visual Instruction Set and Niagara block-init
- * twin-load instructions.
- *
- * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
- * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
- */
-
-#include <asm/spitfire.h>
-
-void xor_vis_2(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2);
-void xor_vis_3(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3);
-void xor_vis_4(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4);
-void xor_vis_5(unsigned long bytes, unsigned long * __restrict p1,
-	       const unsigned long * __restrict p2,
-	       const unsigned long * __restrict p3,
-	       const unsigned long * __restrict p4,
-	       const unsigned long * __restrict p5);
-
-/* XXX Ugh, write cheetah versions... -DaveM */
-
-static struct xor_block_template xor_block_VIS = {
-        .name	= "VIS",
-        .do_2	= xor_vis_2,
-        .do_3	= xor_vis_3,
-        .do_4	= xor_vis_4,
-        .do_5	= xor_vis_5,
-};
-
-void xor_niagara_2(unsigned long bytes, unsigned long * __restrict p1,
-		   const unsigned long * __restrict p2);
-void xor_niagara_3(unsigned long bytes, unsigned long * __restrict p1,
-		   const unsigned long * __restrict p2,
-		   const unsigned long * __restrict p3);
-void xor_niagara_4(unsigned long bytes, unsigned long * __restrict p1,
-		   const unsigned long * __restrict p2,
-		   const unsigned long * __restrict p3,
-		   const unsigned long * __restrict p4);
-void xor_niagara_5(unsigned long bytes, unsigned long * __restrict p1,
-		   const unsigned long * __restrict p2,
-		   const unsigned long * __restrict p3,
-		   const unsigned long * __restrict p4,
-		   const unsigned long * __restrict p5);
-
-static struct xor_block_template xor_block_niagara = {
-        .name	= "Niagara",
-        .do_2	= xor_niagara_2,
-        .do_3	= xor_niagara_3,
-        .do_4	= xor_niagara_4,
-        .do_5	= xor_niagara_5,
-};
-
-#define arch_xor_init arch_xor_init
-static __always_inline void __init arch_xor_init(void)
-{
-	/* Force VIS for everything except Niagara.  */
-	if (tlb_type == hypervisor &&
-	    (sun4v_chip_type == SUN4V_CHIP_NIAGARA1 ||
-	     sun4v_chip_type == SUN4V_CHIP_NIAGARA2 ||
-	     sun4v_chip_type == SUN4V_CHIP_NIAGARA3 ||
-	     sun4v_chip_type == SUN4V_CHIP_NIAGARA4 ||
-	     sun4v_chip_type == SUN4V_CHIP_NIAGARA5))
-		xor_force(&xor_block_niagara);
-	else
-		xor_force(&xor_block_VIS);
-}
diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 783bdec0d7be..dd10cdd6f062 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -48,7 +48,7 @@ lib-$(CONFIG_SPARC64) += GENmemcpy.o GENcopy_from_user.o GENcopy_to_user.o
 lib-$(CONFIG_SPARC64) += GENpatch.o GENpage.o GENbzero.o
 
 lib-$(CONFIG_SPARC64) += copy_in_user.o memmove.o
-lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o xor.o hweight.o ffs.o
+lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o hweight.o ffs.o
 
 obj-$(CONFIG_SPARC64) += iomap.o
 obj-$(CONFIG_SPARC32) += atomic32.o
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index c939fad43735..eb7617b5c61b 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -19,6 +19,9 @@ xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd.o
 xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd_glue.o
 xor-$(CONFIG_ALTIVEC)		+= powerpc/xor_vmx.o powerpc/xor_vmx_glue.o
 xor-$(CONFIG_RISCV_ISA_V)	+= riscv/xor.o riscv/xor-glue.o
+xor-$(CONFIG_SPARC32)		+= sparc/xor-sparc32.o
+xor-$(CONFIG_SPARC64)		+= sparc/xor-vis.o sparc/xor-vis-glue.o
+xor-$(CONFIG_SPARC64)		+= sparc/xor-niagara.o sparc/xor-niagara-glue.o
 
 
 CFLAGS_arm/xor-neon.o		+= $(CC_FLAGS_FPU)
diff --git a/lib/raid/xor/sparc/xor-niagara-glue.c b/lib/raid/xor/sparc/xor-niagara-glue.c
new file mode 100644
index 000000000000..5087e63ac130
--- /dev/null
+++ b/lib/raid/xor/sparc/xor-niagara-glue.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * High speed xor_block operation for RAID4/5 utilizing the
+ * Niagara block-init twin-load instructions.
+ *
+ * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
+ */
+
+#include <linux/raid/xor_impl.h>
+#include <asm/xor.h>
+
+void xor_niagara_2(unsigned long bytes, unsigned long * __restrict p1,
+		   const unsigned long * __restrict p2);
+void xor_niagara_3(unsigned long bytes, unsigned long * __restrict p1,
+		   const unsigned long * __restrict p2,
+		   const unsigned long * __restrict p3);
+void xor_niagara_4(unsigned long bytes, unsigned long * __restrict p1,
+		   const unsigned long * __restrict p2,
+		   const unsigned long * __restrict p3,
+		   const unsigned long * __restrict p4);
+void xor_niagara_5(unsigned long bytes, unsigned long * __restrict p1,
+		   const unsigned long * __restrict p2,
+		   const unsigned long * __restrict p3,
+		   const unsigned long * __restrict p4,
+		   const unsigned long * __restrict p5);
+
+struct xor_block_template xor_block_niagara = {
+        .name	= "Niagara",
+        .do_2	= xor_niagara_2,
+        .do_3	= xor_niagara_3,
+        .do_4	= xor_niagara_4,
+        .do_5	= xor_niagara_5,
+};
diff --git a/arch/sparc/lib/xor.S b/lib/raid/xor/sparc/xor-niagara.S
similarity index 53%
rename from arch/sparc/lib/xor.S
rename to lib/raid/xor/sparc/xor-niagara.S
index 35461e3b2a9b..f8749a212eb3 100644
--- a/arch/sparc/lib/xor.S
+++ b/lib/raid/xor/sparc/xor-niagara.S
@@ -1,11 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * arch/sparc64/lib/xor.S
- *
  * High speed xor_block operation for RAID4/5 utilizing the
- * UltraSparc Visual Instruction Set and Niagara store-init/twin-load.
+ * Niagara store-init/twin-load.
  *
- * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
  * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
  */
 
@@ -16,343 +13,6 @@
 #include <asm/dcu.h>
 #include <asm/spitfire.h>
 
-/*
- *	Requirements:
- *	!(((long)dest | (long)sourceN) & (64 - 1)) &&
- *	!(len & 127) && len >= 256
- */
-	.text
-
-	/* VIS versions. */
-ENTRY(xor_vis_2)
-	rd	%fprs, %o5
-	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
-	be,pt	%icc, 0f
-	 sethi	%hi(VISenter), %g1
-	jmpl	%g1 + %lo(VISenter), %g7
-	 add	%g7, 8, %g7
-0:	wr	%g0, FPRS_FEF, %fprs
-	rd	%asi, %g1
-	wr	%g0, ASI_BLK_P, %asi
-	membar	#LoadStore|#StoreLoad|#StoreStore
-	sub	%o0, 128, %o0
-	ldda	[%o1] %asi, %f0
-	ldda	[%o2] %asi, %f16
-
-2:	ldda	[%o1 + 64] %asi, %f32
-	fxor	%f0, %f16, %f16
-	fxor	%f2, %f18, %f18
-	fxor	%f4, %f20, %f20
-	fxor	%f6, %f22, %f22
-	fxor	%f8, %f24, %f24
-	fxor	%f10, %f26, %f26
-	fxor	%f12, %f28, %f28
-	fxor	%f14, %f30, %f30
-	stda	%f16, [%o1] %asi
-	ldda	[%o2 + 64] %asi, %f48
-	ldda	[%o1 + 128] %asi, %f0
-	fxor	%f32, %f48, %f48
-	fxor	%f34, %f50, %f50
-	add	%o1, 128, %o1
-	fxor	%f36, %f52, %f52
-	add	%o2, 128, %o2
-	fxor	%f38, %f54, %f54
-	subcc	%o0, 128, %o0
-	fxor	%f40, %f56, %f56
-	fxor	%f42, %f58, %f58
-	fxor	%f44, %f60, %f60
-	fxor	%f46, %f62, %f62
-	stda	%f48, [%o1 - 64] %asi
-	bne,pt	%xcc, 2b
-	 ldda	[%o2] %asi, %f16
-
-	ldda	[%o1 + 64] %asi, %f32
-	fxor	%f0, %f16, %f16
-	fxor	%f2, %f18, %f18
-	fxor	%f4, %f20, %f20
-	fxor	%f6, %f22, %f22
-	fxor	%f8, %f24, %f24
-	fxor	%f10, %f26, %f26
-	fxor	%f12, %f28, %f28
-	fxor	%f14, %f30, %f30
-	stda	%f16, [%o1] %asi
-	ldda	[%o2 + 64] %asi, %f48
-	membar	#Sync
-	fxor	%f32, %f48, %f48
-	fxor	%f34, %f50, %f50
-	fxor	%f36, %f52, %f52
-	fxor	%f38, %f54, %f54
-	fxor	%f40, %f56, %f56
-	fxor	%f42, %f58, %f58
-	fxor	%f44, %f60, %f60
-	fxor	%f46, %f62, %f62
-	stda	%f48, [%o1 + 64] %asi
-	membar	#Sync|#StoreStore|#StoreLoad
-	wr	%g1, %g0, %asi
-	retl
-	  wr	%g0, 0, %fprs
-ENDPROC(xor_vis_2)
-EXPORT_SYMBOL(xor_vis_2)
-
-ENTRY(xor_vis_3)
-	rd	%fprs, %o5
-	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
-	be,pt	%icc, 0f
-	 sethi	%hi(VISenter), %g1
-	jmpl	%g1 + %lo(VISenter), %g7
-	 add	%g7, 8, %g7
-0:	wr	%g0, FPRS_FEF, %fprs
-	rd	%asi, %g1
-	wr	%g0, ASI_BLK_P, %asi
-	membar	#LoadStore|#StoreLoad|#StoreStore
-	sub	%o0, 64, %o0
-	ldda	[%o1] %asi, %f0
-	ldda	[%o2] %asi, %f16
-
-3:	ldda	[%o3] %asi, %f32
-	fxor	%f0, %f16, %f48
-	fxor	%f2, %f18, %f50
-	add	%o1, 64, %o1
-	fxor	%f4, %f20, %f52
-	fxor	%f6, %f22, %f54
-	add	%o2, 64, %o2
-	fxor	%f8, %f24, %f56
-	fxor	%f10, %f26, %f58
-	fxor	%f12, %f28, %f60
-	fxor	%f14, %f30, %f62
-	ldda	[%o1] %asi, %f0
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	add	%o3, 64, %o3
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	subcc	%o0, 64, %o0
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	stda	%f48, [%o1 - 64] %asi
-	bne,pt	%xcc, 3b
-	 ldda	[%o2] %asi, %f16
-
-	ldda	[%o3] %asi, %f32
-	fxor	%f0, %f16, %f48
-	fxor	%f2, %f18, %f50
-	fxor	%f4, %f20, %f52
-	fxor	%f6, %f22, %f54
-	fxor	%f8, %f24, %f56
-	fxor	%f10, %f26, %f58
-	fxor	%f12, %f28, %f60
-	fxor	%f14, %f30, %f62
-	membar	#Sync
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	stda	%f48, [%o1] %asi
-	membar	#Sync|#StoreStore|#StoreLoad
-	wr	%g1, %g0, %asi
-	retl
-	 wr	%g0, 0, %fprs
-ENDPROC(xor_vis_3)
-EXPORT_SYMBOL(xor_vis_3)
-
-ENTRY(xor_vis_4)
-	rd	%fprs, %o5
-	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
-	be,pt	%icc, 0f
-	 sethi	%hi(VISenter), %g1
-	jmpl	%g1 + %lo(VISenter), %g7
-	 add	%g7, 8, %g7
-0:	wr	%g0, FPRS_FEF, %fprs
-	rd	%asi, %g1
-	wr	%g0, ASI_BLK_P, %asi
-	membar	#LoadStore|#StoreLoad|#StoreStore
-	sub	%o0, 64, %o0
-	ldda	[%o1] %asi, %f0
-	ldda	[%o2] %asi, %f16
-
-4:	ldda	[%o3] %asi, %f32
-	fxor	%f0, %f16, %f16
-	fxor	%f2, %f18, %f18
-	add	%o1, 64, %o1
-	fxor	%f4, %f20, %f20
-	fxor	%f6, %f22, %f22
-	add	%o2, 64, %o2
-	fxor	%f8, %f24, %f24
-	fxor	%f10, %f26, %f26
-	fxor	%f12, %f28, %f28
-	fxor	%f14, %f30, %f30
-	ldda	[%o4] %asi, %f48
-	fxor	%f16, %f32, %f32
-	fxor	%f18, %f34, %f34
-	fxor	%f20, %f36, %f36
-	fxor	%f22, %f38, %f38
-	add	%o3, 64, %o3
-	fxor	%f24, %f40, %f40
-	fxor	%f26, %f42, %f42
-	fxor	%f28, %f44, %f44
-	fxor	%f30, %f46, %f46
-	ldda	[%o1] %asi, %f0
-	fxor	%f32, %f48, %f48
-	fxor	%f34, %f50, %f50
-	fxor	%f36, %f52, %f52
-	add	%o4, 64, %o4
-	fxor	%f38, %f54, %f54
-	fxor	%f40, %f56, %f56
-	fxor	%f42, %f58, %f58
-	subcc	%o0, 64, %o0
-	fxor	%f44, %f60, %f60
-	fxor	%f46, %f62, %f62
-	stda	%f48, [%o1 - 64] %asi
-	bne,pt	%xcc, 4b
-	 ldda	[%o2] %asi, %f16
-
-	ldda	[%o3] %asi, %f32
-	fxor	%f0, %f16, %f16
-	fxor	%f2, %f18, %f18
-	fxor	%f4, %f20, %f20
-	fxor	%f6, %f22, %f22
-	fxor	%f8, %f24, %f24
-	fxor	%f10, %f26, %f26
-	fxor	%f12, %f28, %f28
-	fxor	%f14, %f30, %f30
-	ldda	[%o4] %asi, %f48
-	fxor	%f16, %f32, %f32
-	fxor	%f18, %f34, %f34
-	fxor	%f20, %f36, %f36
-	fxor	%f22, %f38, %f38
-	fxor	%f24, %f40, %f40
-	fxor	%f26, %f42, %f42
-	fxor	%f28, %f44, %f44
-	fxor	%f30, %f46, %f46
-	membar	#Sync
-	fxor	%f32, %f48, %f48
-	fxor	%f34, %f50, %f50
-	fxor	%f36, %f52, %f52
-	fxor	%f38, %f54, %f54
-	fxor	%f40, %f56, %f56
-	fxor	%f42, %f58, %f58
-	fxor	%f44, %f60, %f60
-	fxor	%f46, %f62, %f62
-	stda	%f48, [%o1] %asi
-	membar	#Sync|#StoreStore|#StoreLoad
-	wr	%g1, %g0, %asi
-	retl
-	 wr	%g0, 0, %fprs
-ENDPROC(xor_vis_4)
-EXPORT_SYMBOL(xor_vis_4)
-
-ENTRY(xor_vis_5)
-	save	%sp, -192, %sp
-	rd	%fprs, %o5
-	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
-	be,pt	%icc, 0f
-	 sethi	%hi(VISenter), %g1
-	jmpl	%g1 + %lo(VISenter), %g7
-	 add	%g7, 8, %g7
-0:	wr	%g0, FPRS_FEF, %fprs
-	rd	%asi, %g1
-	wr	%g0, ASI_BLK_P, %asi
-	membar	#LoadStore|#StoreLoad|#StoreStore
-	sub	%i0, 64, %i0
-	ldda	[%i1] %asi, %f0
-	ldda	[%i2] %asi, %f16
-
-5:	ldda	[%i3] %asi, %f32
-	fxor	%f0, %f16, %f48
-	fxor	%f2, %f18, %f50
-	add	%i1, 64, %i1
-	fxor	%f4, %f20, %f52
-	fxor	%f6, %f22, %f54
-	add	%i2, 64, %i2
-	fxor	%f8, %f24, %f56
-	fxor	%f10, %f26, %f58
-	fxor	%f12, %f28, %f60
-	fxor	%f14, %f30, %f62
-	ldda	[%i4] %asi, %f16
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	add	%i3, 64, %i3
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	ldda	[%i5] %asi, %f32
-	fxor	%f48, %f16, %f48
-	fxor	%f50, %f18, %f50
-	add	%i4, 64, %i4
-	fxor	%f52, %f20, %f52
-	fxor	%f54, %f22, %f54
-	add	%i5, 64, %i5
-	fxor	%f56, %f24, %f56
-	fxor	%f58, %f26, %f58
-	fxor	%f60, %f28, %f60
-	fxor	%f62, %f30, %f62
-	ldda	[%i1] %asi, %f0
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	subcc	%i0, 64, %i0
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	stda	%f48, [%i1 - 64] %asi
-	bne,pt	%xcc, 5b
-	 ldda	[%i2] %asi, %f16
-
-	ldda	[%i3] %asi, %f32
-	fxor	%f0, %f16, %f48
-	fxor	%f2, %f18, %f50
-	fxor	%f4, %f20, %f52
-	fxor	%f6, %f22, %f54
-	fxor	%f8, %f24, %f56
-	fxor	%f10, %f26, %f58
-	fxor	%f12, %f28, %f60
-	fxor	%f14, %f30, %f62
-	ldda	[%i4] %asi, %f16
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	ldda	[%i5] %asi, %f32
-	fxor	%f48, %f16, %f48
-	fxor	%f50, %f18, %f50
-	fxor	%f52, %f20, %f52
-	fxor	%f54, %f22, %f54
-	fxor	%f56, %f24, %f56
-	fxor	%f58, %f26, %f58
-	fxor	%f60, %f28, %f60
-	fxor	%f62, %f30, %f62
-	membar	#Sync
-	fxor	%f48, %f32, %f48
-	fxor	%f50, %f34, %f50
-	fxor	%f52, %f36, %f52
-	fxor	%f54, %f38, %f54
-	fxor	%f56, %f40, %f56
-	fxor	%f58, %f42, %f58
-	fxor	%f60, %f44, %f60
-	fxor	%f62, %f46, %f62
-	stda	%f48, [%i1] %asi
-	membar	#Sync|#StoreStore|#StoreLoad
-	wr	%g1, %g0, %asi
-	wr	%g0, 0, %fprs
-	ret
-	 restore
-ENDPROC(xor_vis_5)
-EXPORT_SYMBOL(xor_vis_5)
 
 	/* Niagara versions. */
 ENTRY(xor_niagara_2) /* %o0=bytes, %o1=dest, %o2=src */
@@ -399,7 +59,6 @@ ENTRY(xor_niagara_2) /* %o0=bytes, %o1=dest, %o2=src */
 	ret
 	 restore
 ENDPROC(xor_niagara_2)
-EXPORT_SYMBOL(xor_niagara_2)
 
 ENTRY(xor_niagara_3) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2 */
 	save		%sp, -192, %sp
@@ -461,7 +120,6 @@ ENTRY(xor_niagara_3) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2 */
 	ret
 	 restore
 ENDPROC(xor_niagara_3)
-EXPORT_SYMBOL(xor_niagara_3)
 
 ENTRY(xor_niagara_4) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2, %o4=src3 */
 	save		%sp, -192, %sp
@@ -544,7 +202,6 @@ ENTRY(xor_niagara_4) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2, %o4=src3 */
 	ret
 	 restore
 ENDPROC(xor_niagara_4)
-EXPORT_SYMBOL(xor_niagara_4)
 
 ENTRY(xor_niagara_5) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2, %o4=src3, %o5=src4 */
 	save		%sp, -192, %sp
@@ -643,4 +300,3 @@ ENTRY(xor_niagara_5) /* %o0=bytes, %o1=dest, %o2=src1, %o3=src2, %o4=src3, %o5=s
 	ret
 	 restore
 ENDPROC(xor_niagara_5)
-EXPORT_SYMBOL(xor_niagara_5)
diff --git a/arch/sparc/include/asm/xor_32.h b/lib/raid/xor/sparc/xor-sparc32.c
similarity index 93%
rename from arch/sparc/include/asm/xor_32.h
rename to lib/raid/xor/sparc/xor-sparc32.c
index 8fbf0c07ec28..b65a75a6e59d 100644
--- a/arch/sparc/include/asm/xor_32.h
+++ b/lib/raid/xor/sparc/xor-sparc32.c
@@ -1,16 +1,12 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * include/asm/xor.h
- *
- * Optimized RAID-5 checksumming functions for 32-bit Sparc.
- */
-
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * High speed xor_block operation for RAID4/5 utilizing the
  * ldd/std SPARC instructions.
  *
  * Copyright (C) 1999 Jakub Jelinek (jj@ultra.linux.cz)
  */
+#include <linux/raid/xor_impl.h>
+#include <asm/xor.h>
 
 static void
 sparc_2(unsigned long bytes, unsigned long * __restrict p1,
@@ -248,21 +244,10 @@ sparc_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static struct xor_block_template xor_block_SPARC = {
+struct xor_block_template xor_block_SPARC = {
 	.name	= "SPARC",
 	.do_2	= sparc_2,
 	.do_3	= sparc_3,
 	.do_4	= sparc_4,
 	.do_5	= sparc_5,
 };
-
-/* For grins, also test the generic routines.  */
-#include <asm-generic/xor.h>
-
-#define arch_xor_init arch_xor_init
-static __always_inline void __init arch_xor_init(void)
-{
-	xor_register(&xor_block_8regs);
-	xor_register(&xor_block_32regs);
-	xor_register(&xor_block_SPARC);
-}
diff --git a/lib/raid/xor/sparc/xor-vis-glue.c b/lib/raid/xor/sparc/xor-vis-glue.c
new file mode 100644
index 000000000000..73e5b293d0c9
--- /dev/null
+++ b/lib/raid/xor/sparc/xor-vis-glue.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * High speed xor_block operation for RAID4/5 utilizing the
+ * UltraSparc Visual Instruction Set.
+ *
+ * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
+ */
+
+#include <linux/raid/xor_impl.h>
+#include <asm/xor.h>
+
+void xor_vis_2(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2);
+void xor_vis_3(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3);
+void xor_vis_4(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3,
+	       const unsigned long * __restrict p4);
+void xor_vis_5(unsigned long bytes, unsigned long * __restrict p1,
+	       const unsigned long * __restrict p2,
+	       const unsigned long * __restrict p3,
+	       const unsigned long * __restrict p4,
+	       const unsigned long * __restrict p5);
+
+/* XXX Ugh, write cheetah versions... -DaveM */
+
+struct xor_block_template xor_block_VIS = {
+        .name	= "VIS",
+        .do_2	= xor_vis_2,
+        .do_3	= xor_vis_3,
+        .do_4	= xor_vis_4,
+        .do_5	= xor_vis_5,
+};
diff --git a/lib/raid/xor/sparc/xor-vis.S b/lib/raid/xor/sparc/xor-vis.S
new file mode 100644
index 000000000000..d06e221055d9
--- /dev/null
+++ b/lib/raid/xor/sparc/xor-vis.S
@@ -0,0 +1,348 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * High speed xor_block operation for RAID4/5 utilizing the
+ * UltraSparc Visual Instruction Set.
+ *
+ * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
+ */
+
+#include <linux/export.h>
+#include <linux/linkage.h>
+#include <asm/visasm.h>
+#include <asm/asi.h>
+#include <asm/dcu.h>
+#include <asm/spitfire.h>
+
+/*
+ *	Requirements:
+ *	!(((long)dest | (long)sourceN) & (64 - 1)) &&
+ *	!(len & 127) && len >= 256
+ */
+	.text
+
+	/* VIS versions. */
+ENTRY(xor_vis_2)
+	rd	%fprs, %o5
+	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
+	be,pt	%icc, 0f
+	 sethi	%hi(VISenter), %g1
+	jmpl	%g1 + %lo(VISenter), %g7
+	 add	%g7, 8, %g7
+0:	wr	%g0, FPRS_FEF, %fprs
+	rd	%asi, %g1
+	wr	%g0, ASI_BLK_P, %asi
+	membar	#LoadStore|#StoreLoad|#StoreStore
+	sub	%o0, 128, %o0
+	ldda	[%o1] %asi, %f0
+	ldda	[%o2] %asi, %f16
+
+2:	ldda	[%o1 + 64] %asi, %f32
+	fxor	%f0, %f16, %f16
+	fxor	%f2, %f18, %f18
+	fxor	%f4, %f20, %f20
+	fxor	%f6, %f22, %f22
+	fxor	%f8, %f24, %f24
+	fxor	%f10, %f26, %f26
+	fxor	%f12, %f28, %f28
+	fxor	%f14, %f30, %f30
+	stda	%f16, [%o1] %asi
+	ldda	[%o2 + 64] %asi, %f48
+	ldda	[%o1 + 128] %asi, %f0
+	fxor	%f32, %f48, %f48
+	fxor	%f34, %f50, %f50
+	add	%o1, 128, %o1
+	fxor	%f36, %f52, %f52
+	add	%o2, 128, %o2
+	fxor	%f38, %f54, %f54
+	subcc	%o0, 128, %o0
+	fxor	%f40, %f56, %f56
+	fxor	%f42, %f58, %f58
+	fxor	%f44, %f60, %f60
+	fxor	%f46, %f62, %f62
+	stda	%f48, [%o1 - 64] %asi
+	bne,pt	%xcc, 2b
+	 ldda	[%o2] %asi, %f16
+
+	ldda	[%o1 + 64] %asi, %f32
+	fxor	%f0, %f16, %f16
+	fxor	%f2, %f18, %f18
+	fxor	%f4, %f20, %f20
+	fxor	%f6, %f22, %f22
+	fxor	%f8, %f24, %f24
+	fxor	%f10, %f26, %f26
+	fxor	%f12, %f28, %f28
+	fxor	%f14, %f30, %f30
+	stda	%f16, [%o1] %asi
+	ldda	[%o2 + 64] %asi, %f48
+	membar	#Sync
+	fxor	%f32, %f48, %f48
+	fxor	%f34, %f50, %f50
+	fxor	%f36, %f52, %f52
+	fxor	%f38, %f54, %f54
+	fxor	%f40, %f56, %f56
+	fxor	%f42, %f58, %f58
+	fxor	%f44, %f60, %f60
+	fxor	%f46, %f62, %f62
+	stda	%f48, [%o1 + 64] %asi
+	membar	#Sync|#StoreStore|#StoreLoad
+	wr	%g1, %g0, %asi
+	retl
+	  wr	%g0, 0, %fprs
+ENDPROC(xor_vis_2)
+
+ENTRY(xor_vis_3)
+	rd	%fprs, %o5
+	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
+	be,pt	%icc, 0f
+	 sethi	%hi(VISenter), %g1
+	jmpl	%g1 + %lo(VISenter), %g7
+	 add	%g7, 8, %g7
+0:	wr	%g0, FPRS_FEF, %fprs
+	rd	%asi, %g1
+	wr	%g0, ASI_BLK_P, %asi
+	membar	#LoadStore|#StoreLoad|#StoreStore
+	sub	%o0, 64, %o0
+	ldda	[%o1] %asi, %f0
+	ldda	[%o2] %asi, %f16
+
+3:	ldda	[%o3] %asi, %f32
+	fxor	%f0, %f16, %f48
+	fxor	%f2, %f18, %f50
+	add	%o1, 64, %o1
+	fxor	%f4, %f20, %f52
+	fxor	%f6, %f22, %f54
+	add	%o2, 64, %o2
+	fxor	%f8, %f24, %f56
+	fxor	%f10, %f26, %f58
+	fxor	%f12, %f28, %f60
+	fxor	%f14, %f30, %f62
+	ldda	[%o1] %asi, %f0
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	add	%o3, 64, %o3
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	subcc	%o0, 64, %o0
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	stda	%f48, [%o1 - 64] %asi
+	bne,pt	%xcc, 3b
+	 ldda	[%o2] %asi, %f16
+
+	ldda	[%o3] %asi, %f32
+	fxor	%f0, %f16, %f48
+	fxor	%f2, %f18, %f50
+	fxor	%f4, %f20, %f52
+	fxor	%f6, %f22, %f54
+	fxor	%f8, %f24, %f56
+	fxor	%f10, %f26, %f58
+	fxor	%f12, %f28, %f60
+	fxor	%f14, %f30, %f62
+	membar	#Sync
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	stda	%f48, [%o1] %asi
+	membar	#Sync|#StoreStore|#StoreLoad
+	wr	%g1, %g0, %asi
+	retl
+	 wr	%g0, 0, %fprs
+ENDPROC(xor_vis_3)
+
+ENTRY(xor_vis_4)
+	rd	%fprs, %o5
+	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
+	be,pt	%icc, 0f
+	 sethi	%hi(VISenter), %g1
+	jmpl	%g1 + %lo(VISenter), %g7
+	 add	%g7, 8, %g7
+0:	wr	%g0, FPRS_FEF, %fprs
+	rd	%asi, %g1
+	wr	%g0, ASI_BLK_P, %asi
+	membar	#LoadStore|#StoreLoad|#StoreStore
+	sub	%o0, 64, %o0
+	ldda	[%o1] %asi, %f0
+	ldda	[%o2] %asi, %f16
+
+4:	ldda	[%o3] %asi, %f32
+	fxor	%f0, %f16, %f16
+	fxor	%f2, %f18, %f18
+	add	%o1, 64, %o1
+	fxor	%f4, %f20, %f20
+	fxor	%f6, %f22, %f22
+	add	%o2, 64, %o2
+	fxor	%f8, %f24, %f24
+	fxor	%f10, %f26, %f26
+	fxor	%f12, %f28, %f28
+	fxor	%f14, %f30, %f30
+	ldda	[%o4] %asi, %f48
+	fxor	%f16, %f32, %f32
+	fxor	%f18, %f34, %f34
+	fxor	%f20, %f36, %f36
+	fxor	%f22, %f38, %f38
+	add	%o3, 64, %o3
+	fxor	%f24, %f40, %f40
+	fxor	%f26, %f42, %f42
+	fxor	%f28, %f44, %f44
+	fxor	%f30, %f46, %f46
+	ldda	[%o1] %asi, %f0
+	fxor	%f32, %f48, %f48
+	fxor	%f34, %f50, %f50
+	fxor	%f36, %f52, %f52
+	add	%o4, 64, %o4
+	fxor	%f38, %f54, %f54
+	fxor	%f40, %f56, %f56
+	fxor	%f42, %f58, %f58
+	subcc	%o0, 64, %o0
+	fxor	%f44, %f60, %f60
+	fxor	%f46, %f62, %f62
+	stda	%f48, [%o1 - 64] %asi
+	bne,pt	%xcc, 4b
+	 ldda	[%o2] %asi, %f16
+
+	ldda	[%o3] %asi, %f32
+	fxor	%f0, %f16, %f16
+	fxor	%f2, %f18, %f18
+	fxor	%f4, %f20, %f20
+	fxor	%f6, %f22, %f22
+	fxor	%f8, %f24, %f24
+	fxor	%f10, %f26, %f26
+	fxor	%f12, %f28, %f28
+	fxor	%f14, %f30, %f30
+	ldda	[%o4] %asi, %f48
+	fxor	%f16, %f32, %f32
+	fxor	%f18, %f34, %f34
+	fxor	%f20, %f36, %f36
+	fxor	%f22, %f38, %f38
+	fxor	%f24, %f40, %f40
+	fxor	%f26, %f42, %f42
+	fxor	%f28, %f44, %f44
+	fxor	%f30, %f46, %f46
+	membar	#Sync
+	fxor	%f32, %f48, %f48
+	fxor	%f34, %f50, %f50
+	fxor	%f36, %f52, %f52
+	fxor	%f38, %f54, %f54
+	fxor	%f40, %f56, %f56
+	fxor	%f42, %f58, %f58
+	fxor	%f44, %f60, %f60
+	fxor	%f46, %f62, %f62
+	stda	%f48, [%o1] %asi
+	membar	#Sync|#StoreStore|#StoreLoad
+	wr	%g1, %g0, %asi
+	retl
+	 wr	%g0, 0, %fprs
+ENDPROC(xor_vis_4)
+
+ENTRY(xor_vis_5)
+	save	%sp, -192, %sp
+	rd	%fprs, %o5
+	andcc	%o5, FPRS_FEF|FPRS_DU, %g0
+	be,pt	%icc, 0f
+	 sethi	%hi(VISenter), %g1
+	jmpl	%g1 + %lo(VISenter), %g7
+	 add	%g7, 8, %g7
+0:	wr	%g0, FPRS_FEF, %fprs
+	rd	%asi, %g1
+	wr	%g0, ASI_BLK_P, %asi
+	membar	#LoadStore|#StoreLoad|#StoreStore
+	sub	%i0, 64, %i0
+	ldda	[%i1] %asi, %f0
+	ldda	[%i2] %asi, %f16
+
+5:	ldda	[%i3] %asi, %f32
+	fxor	%f0, %f16, %f48
+	fxor	%f2, %f18, %f50
+	add	%i1, 64, %i1
+	fxor	%f4, %f20, %f52
+	fxor	%f6, %f22, %f54
+	add	%i2, 64, %i2
+	fxor	%f8, %f24, %f56
+	fxor	%f10, %f26, %f58
+	fxor	%f12, %f28, %f60
+	fxor	%f14, %f30, %f62
+	ldda	[%i4] %asi, %f16
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	add	%i3, 64, %i3
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	ldda	[%i5] %asi, %f32
+	fxor	%f48, %f16, %f48
+	fxor	%f50, %f18, %f50
+	add	%i4, 64, %i4
+	fxor	%f52, %f20, %f52
+	fxor	%f54, %f22, %f54
+	add	%i5, 64, %i5
+	fxor	%f56, %f24, %f56
+	fxor	%f58, %f26, %f58
+	fxor	%f60, %f28, %f60
+	fxor	%f62, %f30, %f62
+	ldda	[%i1] %asi, %f0
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	subcc	%i0, 64, %i0
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	stda	%f48, [%i1 - 64] %asi
+	bne,pt	%xcc, 5b
+	 ldda	[%i2] %asi, %f16
+
+	ldda	[%i3] %asi, %f32
+	fxor	%f0, %f16, %f48
+	fxor	%f2, %f18, %f50
+	fxor	%f4, %f20, %f52
+	fxor	%f6, %f22, %f54
+	fxor	%f8, %f24, %f56
+	fxor	%f10, %f26, %f58
+	fxor	%f12, %f28, %f60
+	fxor	%f14, %f30, %f62
+	ldda	[%i4] %asi, %f16
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	ldda	[%i5] %asi, %f32
+	fxor	%f48, %f16, %f48
+	fxor	%f50, %f18, %f50
+	fxor	%f52, %f20, %f52
+	fxor	%f54, %f22, %f54
+	fxor	%f56, %f24, %f56
+	fxor	%f58, %f26, %f58
+	fxor	%f60, %f28, %f60
+	fxor	%f62, %f30, %f62
+	membar	#Sync
+	fxor	%f48, %f32, %f48
+	fxor	%f50, %f34, %f50
+	fxor	%f52, %f36, %f52
+	fxor	%f54, %f38, %f54
+	fxor	%f56, %f40, %f56
+	fxor	%f58, %f42, %f58
+	fxor	%f60, %f44, %f60
+	fxor	%f62, %f46, %f62
+	stda	%f48, [%i1] %asi
+	membar	#Sync|#StoreStore|#StoreLoad
+	wr	%g1, %g0, %asi
+	wr	%g0, 0, %fprs
+	ret
+	 restore
+ENDPROC(xor_vis_5)
-- 
2.47.3


