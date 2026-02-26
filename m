Return-Path: <linuxppc-dev+bounces-17297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHDPOU1joGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 009931A85E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLG52hgz3cY7;
	Fri, 27 Feb 2026 02:12:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118726;
	cv=none; b=dfqyuP1tU76rIyiYQfc3M9RjJuCJTEevoC4AeJtbC+g/IIe/Zvn9AErGYa4aREwHg8lfyLglu3kHnUpiNyRJY6jYFq0sw6SEAn9BMjW7apeJl8WpRMPROGXtGBgF0aNnS5Lg0XmVZFfnM9xDD6Zr/tHceNNMHojwNnm6FvFebD3x8h69sernuUgRFzm8ZkTIKdWyyB/jnhpHLLSv/Z9FybRzC1LinqxU77teTpKuHaNoqfv4FrAL1XfoNjyUN7PCIHDr038+3nYUY7nFB6AYbHOWzb4SsifkzDB+u/HSSxQdCtGFFiMW4QUGX6vW20xbBd6GfZ3nhc82ZW6bWEJcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118726; c=relaxed/relaxed;
	bh=vfRQfd6HX2UIy1GEtF4WxXFvmD5740u62PQfhFgAIN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF7h4YtNgy1Trm2j2PTxOMEB6ACxxCmwLivOLZKuBDfRLsY+UfdNDIZRQpyQwk1x+mcsjE1vnk+vHZvnydpEbxxlmV/fU098yvOEON9TWQDYPDGKqFL4b/djAS5fotfuAEe5lUqWw61XqdO1YAwlAsl1mzbPOtV3qmnG0uKUZgQV66Au521oSprsaJMRnZydeKIxoeVin5QqMhVugCkNUX7ljhvWIjSN6FG/gBVLTH1wxE7o27s8DtyZO0r5wtwStQJ/QFbwtHz04UifEaly76rA4jekYQ89RfmSpOWON3SI2778ZVNTNHK+LWsGMLZPrDG4y87nftt+uWr8VIB37w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axYPDdh0; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axYPDdh0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFLF1fy1z3cQg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:12:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vfRQfd6HX2UIy1GEtF4WxXFvmD5740u62PQfhFgAIN8=; b=axYPDdh0UlU4k8LzDUOIudYBVh
	TbPnRJxIe18M9ITWaQgUGlBsyQe+hOWF1f8RffuwREO/jvkiQLUwWbX0P/ANN4KDXpTj74CD4Q6xc
	sSraeZvLv+Ob1QTNupALOxkqnq7xMx1mTThH2h8nYx6SFVuHlwiFKLLxH8tmlZr0gQje/gjE0oZ3C
	Ixcestfgvy25/rBkDc8efMzHfK2pZ3ulUhj0iaXJpezBXfEfKx3Foway9BGmW0DTP5x9nDwej/VrN
	yn+mIbL0BVHTLHYw0+tjRaaZ+5uhEwcvowJKnmnF71UCw7egmbj4X8tmrEr9f71WClpr61keKcNZo
	xgMjnArg==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1c-00000006QXP-2ZyS;
	Thu, 26 Feb 2026 15:11:36 +0000
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
Subject: [PATCH 19/25] xor: avoid indirect calls for arm64-optimized ops
Date: Thu, 26 Feb 2026 07:10:31 -0800
Message-ID: <20260226151106.144735-20-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-17297-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 009931A85E9
X-Rspamd-Action: no action

Remove the inner xor_block_templates, and instead have two separate
actual template that call into the neon-enabled compilation unit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/xor.h       | 13 ++--
 lib/raid/xor/arm64/xor-neon-glue.c | 95 +++++++++++++++---------------
 lib/raid/xor/arm64/xor-neon.c      | 73 +++++++++--------------
 lib/raid/xor/arm64/xor-neon.h      | 30 ++++++++++
 4 files changed, 114 insertions(+), 97 deletions(-)
 create mode 100644 lib/raid/xor/arm64/xor-neon.h

diff --git a/arch/arm64/include/asm/xor.h b/arch/arm64/include/asm/xor.h
index 81718f010761..4782c760bcac 100644
--- a/arch/arm64/include/asm/xor.h
+++ b/arch/arm64/include/asm/xor.h
@@ -7,15 +7,18 @@
 #include <asm-generic/xor.h>
 #include <asm/simd.h>
 
-extern struct xor_block_template xor_block_arm64;
-void __init xor_neon_init(void);
+extern struct xor_block_template xor_block_neon;
+extern struct xor_block_template xor_block_eor3;
 
 #define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
-	xor_neon_init();
 	xor_register(&xor_block_8regs);
 	xor_register(&xor_block_32regs);
-	if (cpu_has_neon())
-		xor_register(&xor_block_arm64);
+	if (cpu_has_neon()) {
+		if (cpu_have_named_feature(SHA3))
+			xor_register(&xor_block_eor3);
+		else
+			xor_register(&xor_block_neon);
+	}
 }
diff --git a/lib/raid/xor/arm64/xor-neon-glue.c b/lib/raid/xor/arm64/xor-neon-glue.c
index 067a2095659a..08c3e3573388 100644
--- a/lib/raid/xor/arm64/xor-neon-glue.c
+++ b/lib/raid/xor/arm64/xor-neon-glue.c
@@ -7,51 +7,54 @@
 #include <linux/raid/xor_impl.h>
 #include <asm/simd.h>
 #include <asm/xor.h>
+#include "xor-neon.h"
 
-extern struct xor_block_template const xor_block_inner_neon;
-
-static void
-xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2)
-{
-	scoped_ksimd()
-		xor_block_inner_neon.do_2(bytes, p1, p2);
-}
-
-static void
-xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3)
-{
-	scoped_ksimd()
-		xor_block_inner_neon.do_3(bytes, p1, p2, p3);
-}
-
-static void
-xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3,
-	   const unsigned long * __restrict p4)
-{
-	scoped_ksimd()
-		xor_block_inner_neon.do_4(bytes, p1, p2, p3, p4);
-}
-
-static void
-xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3,
-	   const unsigned long * __restrict p4,
-	   const unsigned long * __restrict p5)
-{
-	scoped_ksimd()
-		xor_block_inner_neon.do_5(bytes, p1, p2, p3, p4, p5);
-}
-
-struct xor_block_template xor_block_arm64 = {
-	.name   = "arm64_neon",
-	.do_2   = xor_neon_2,
-	.do_3   = xor_neon_3,
-	.do_4   = xor_neon_4,
-	.do_5	= xor_neon_5
+#define XOR_TEMPLATE(_name)						\
+static void								\
+xor_##_name##_2(unsigned long bytes, unsigned long * __restrict p1,	\
+	   const unsigned long * __restrict p2)				\
+{									\
+	scoped_ksimd()							\
+		__xor_##_name##_2(bytes, p1, p2);			\
+}									\
+									\
+static void								\
+xor_##_name##_3(unsigned long bytes, unsigned long * __restrict p1,	\
+	   const unsigned long * __restrict p2,				\
+	   const unsigned long * __restrict p3)				\
+{									\
+	scoped_ksimd()							\
+		__xor_##_name##_3(bytes, p1, p2, p3);			\
+}									\
+									\
+static void								\
+xor_##_name##_4(unsigned long bytes, unsigned long * __restrict p1,	\
+	   const unsigned long * __restrict p2,				\
+	   const unsigned long * __restrict p3,				\
+	   const unsigned long * __restrict p4)				\
+{									\
+	scoped_ksimd()							\
+		__xor_##_name##_4(bytes, p1, p2, p3, p4);		\
+}									\
+									\
+static void								\
+xor_##_name##_5(unsigned long bytes, unsigned long * __restrict p1,	\
+	   const unsigned long * __restrict p2,				\
+	   const unsigned long * __restrict p3,				\
+	   const unsigned long * __restrict p4,				\
+	   const unsigned long * __restrict p5)				\
+{									\
+	scoped_ksimd()							\
+		__xor_##_name##_5(bytes, p1, p2, p3, p4, p5);		\
+}									\
+									\
+struct xor_block_template xor_block_##_name = {				\
+	.name   = __stringify(_name),					\
+	.do_2   = xor_##_name##_2,					\
+	.do_3   = xor_##_name##_3,					\
+	.do_4   = xor_##_name##_4,					\
+	.do_5	= xor_##_name##_5					\
 };
+
+XOR_TEMPLATE(neon);
+XOR_TEMPLATE(eor3);
diff --git a/lib/raid/xor/arm64/xor-neon.c b/lib/raid/xor/arm64/xor-neon.c
index 8d2d185090db..61194c292917 100644
--- a/lib/raid/xor/arm64/xor-neon.c
+++ b/lib/raid/xor/arm64/xor-neon.c
@@ -8,9 +8,10 @@
 #include <linux/cache.h>
 #include <asm/neon-intrinsics.h>
 #include <asm/xor.h>
+#include "xor-neon.h"
 
-static void xor_arm64_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2)
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -36,9 +37,9 @@ static void xor_arm64_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3)
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -72,10 +73,10 @@ static void xor_arm64_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4)
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -117,11 +118,11 @@ static void xor_arm64_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4,
-	const unsigned long * __restrict p5)
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -171,14 +172,6 @@ static void xor_arm64_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-struct xor_block_template xor_block_inner_neon __ro_after_init = {
-	.name	= "__inner_neon__",
-	.do_2	= xor_arm64_neon_2,
-	.do_3	= xor_arm64_neon_3,
-	.do_4	= xor_arm64_neon_4,
-	.do_5	= xor_arm64_neon_5,
-};
-
 static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 {
 	uint64x2_t res;
@@ -189,10 +182,9 @@ static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 	return res;
 }
 
-static void xor_arm64_eor3_3(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3)
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -224,11 +216,10 @@ static void xor_arm64_eor3_3(unsigned long bytes,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_eor3_4(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4)
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -268,12 +259,11 @@ static void xor_arm64_eor3_4(unsigned long bytes,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_eor3_5(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4,
-	const unsigned long * __restrict p5)
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -314,12 +304,3 @@ static void xor_arm64_eor3_5(unsigned long bytes,
 		dp5 += 8;
 	} while (--lines > 0);
 }
-
-void __init xor_neon_init(void)
-{
-	if (cpu_have_named_feature(SHA3)) {
-		xor_block_inner_neon.do_3 = xor_arm64_eor3_3;
-		xor_block_inner_neon.do_4 = xor_arm64_eor3_4;
-		xor_block_inner_neon.do_5 = xor_arm64_eor3_5;
-	}
-}
diff --git a/lib/raid/xor/arm64/xor-neon.h b/lib/raid/xor/arm64/xor-neon.h
new file mode 100644
index 000000000000..cec0ac846fea
--- /dev/null
+++ b/lib/raid/xor/arm64/xor-neon.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2);
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3);
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4);
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5);
+
+#define __xor_eor3_2	__xor_neon_2
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3);
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4);
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5);
-- 
2.47.3


