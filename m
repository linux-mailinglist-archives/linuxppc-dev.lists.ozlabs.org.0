Return-Path: <linuxppc-dev+bounces-17287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M18G/FioGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC41A8553
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFL45lnSz3cFG;
	Fri, 27 Feb 2026 02:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118716;
	cv=none; b=fjzQ/zpKPLyAnvXmRs/BWXYD3n99cC65wTT2E4gMIf81UXp3MXZbGFyDx0pw+iPQqYfXKKEucOL2VDpn7EUPOmIT5/nPSZ+eOEUG0cGWP5AV83AHKlNMAaJaWm/Iz6AggQAIyIszRX8lKAzdbgL2r6u8BNDqOnvnSA6t4KgkLxkbMjjJWc0hS7pdYLERrjHXvvcbngP5Yaba3d2YbUtKSmal5WomL50SQ13noE2M62d1A1w1SwpqgFs8DnHg9lpY4/8D8NkXOG/UwnJt+sNjwrnh386XOU2l6F5ge5XqhGFHykXqWmxYYrUc/4w4g0WBj+YPNc5OOPwQ6I6bn3g9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118716; c=relaxed/relaxed;
	bh=ZIOXjuXhndRAAhVng/XDk+LUr70HSW+t14vf2BX5Fos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFjEGOMPI2P7bGjfKjTrIVDidzjeRUlsE3c5k3elJ6O1mI1tLnAOPXniscUaYPceP+djIoQuj2lRvdApMuJHRy9lGI1WcmCz0MjBJxgmYREOE3WVFRUYutC5uqb9Wv/zvvKD9dvqVUmdoRs/Qv1TnkszGm9wjvjbRkfIzA9kGLIvjTTtRhkAbJQFmZ//C3zRzTAqxx/coivLdP6I8vQtGMUc2O24cnMd+JvrluFh3kLCzZzum7QkP/GYBD2vqpgp4VJ51uq+Z/2XOPSADwzY1OjysjvWEVUyVVyHDOlN8YAiAJEsDePO7qxRAXncse96ISviLTpKyg3uKFFpuSyLwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EAxX0MWJ; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EAxX0MWJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFKs3Krhz2yFm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZIOXjuXhndRAAhVng/XDk+LUr70HSW+t14vf2BX5Fos=; b=EAxX0MWJLwxOzvaeUkAIR8eFqm
	Ux9w9WMFI+Ub23IMkQAsEQeNG6RI3ihr1tTi7OF1POAvpF/zXo4ixNddsRgXuQxhgS9+v19NoQerw
	PnJMESNcbqZ0VkxYmERMPLMFdkVqwUlFeZKkLbyF6QEPI8o+kXRvWeMu//an1l4jHcQniQKWPE5QA
	9sGERDdOIFRzrctGz8HH7xCGIQoOZUCN0fOO9j+Pki7x81y1P9DBlWoYFftarGhk46QglAqt2XVmI
	c/z4GgufgUUhyScknND6skAIceSYhrf5U9QjOwZnBqzhC92Wo/vXfVJ+t5MYZXlqiPraqZYMIIQUB
	qauBxtSA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1K-00000006Q2T-0dvm;
	Thu, 26 Feb 2026 15:11:18 +0000
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
Subject: [PATCH 08/25] xor: remove macro abuse for XOR implementation registrations
Date: Thu, 26 Feb 2026 07:10:20 -0800
Message-ID: <20260226151106.144735-9-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-17287-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,infradead.org:dkim]
X-Rspamd-Queue-Id: 86AC41A8553
X-Rspamd-Action: no action

Drop the pretty confusing historic XOR_TRY_TEMPLATES and
XOR_SELECT_TEMPLATE, and instead let the architectures provide a
arch_xor_init that calls either xor_register to register candidates
or xor_force to force a specific implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/include/asm/xor.h     | 29 ++++++++++++----------
 arch/arm/include/asm/xor.h       | 25 +++++++++----------
 arch/arm64/include/asm/xor.h     | 18 +++++++-------
 arch/loongarch/include/asm/xor.h | 42 ++++++++++++--------------------
 arch/powerpc/include/asm/xor.h   | 31 ++++++++++-------------
 arch/riscv/include/asm/xor.h     | 19 ++++++++-------
 arch/s390/include/asm/xor.h      | 12 ++++-----
 arch/sparc/include/asm/xor_32.h  | 14 +++++------
 arch/sparc/include/asm/xor_64.h  | 31 +++++++++++------------
 arch/x86/include/asm/xor.h       |  3 ---
 arch/x86/include/asm/xor_32.h    | 36 ++++++++++++++-------------
 arch/x86/include/asm/xor_64.h    | 18 ++++++++------
 arch/x86/include/asm/xor_avx.h   |  9 -------
 include/asm-generic/xor.h        |  8 ------
 include/linux/raid/xor_impl.h    |  5 ++++
 lib/raid/xor/xor-core.c          | 41 +++++++++++++++++++++++--------
 16 files changed, 168 insertions(+), 173 deletions(-)

diff --git a/arch/alpha/include/asm/xor.h b/arch/alpha/include/asm/xor.h
index e0de0c233ab9..4c8085711df1 100644
--- a/arch/alpha/include/asm/xor.h
+++ b/arch/alpha/include/asm/xor.h
@@ -851,16 +851,19 @@ static struct xor_block_template xor_block_alpha_prefetch = {
 /* For grins, also test the generic routines.  */
 #include <asm-generic/xor.h>
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-	do {						\
-		xor_speed(&xor_block_8regs);		\
-		xor_speed(&xor_block_32regs);		\
-		xor_speed(&xor_block_alpha);		\
-		xor_speed(&xor_block_alpha_prefetch);	\
-	} while (0)
-
-/* Force the use of alpha_prefetch if EV6, as it is significantly
-   faster in the cold cache case.  */
-#define XOR_SELECT_TEMPLATE(FASTEST) \
-	(implver() == IMPLVER_EV6 ? &xor_block_alpha_prefetch : FASTEST)
+/*
+ * Force the use of alpha_prefetch if EV6, as it is significantly faster in the
+ * cold cache case.
+ */
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	if (implver() == IMPLVER_EV6) {
+		xor_force(&xor_block_alpha_prefetch);
+	} else {
+		xor_register(&xor_block_8regs);
+		xor_register(&xor_block_32regs);
+		xor_register(&xor_block_alpha);
+		xor_register(&xor_block_alpha_prefetch);
+	}
+}
diff --git a/arch/arm/include/asm/xor.h b/arch/arm/include/asm/xor.h
index bca2a6514746..b2dcd49186e2 100644
--- a/arch/arm/include/asm/xor.h
+++ b/arch/arm/include/asm/xor.h
@@ -138,15 +138,6 @@ static struct xor_block_template xor_block_arm4regs = {
 	.do_5	= xor_arm4regs_5,
 };
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES			\
-	do {					\
-		xor_speed(&xor_block_arm4regs);	\
-		xor_speed(&xor_block_8regs);	\
-		xor_speed(&xor_block_32regs);	\
-		NEON_TEMPLATES;			\
-	} while (0)
-
 #ifdef CONFIG_KERNEL_MODE_NEON
 
 extern struct xor_block_template const xor_block_neon_inner;
@@ -201,8 +192,16 @@ static struct xor_block_template xor_block_neon = {
 	.do_5	= xor_neon_5
 };
 
-#define NEON_TEMPLATES	\
-	do { if (cpu_has_neon()) xor_speed(&xor_block_neon); } while (0)
-#else
-#define NEON_TEMPLATES
+#endif /* CONFIG_KERNEL_MODE_NEON */
+
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_arm4regs);
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_32regs);
+#ifdef CONFIG_KERNEL_MODE_NEON
+	if (cpu_has_neon())
+		xor_register(&xor_block_neon);
 #endif
+}
diff --git a/arch/arm64/include/asm/xor.h b/arch/arm64/include/asm/xor.h
index c38e3d017a79..bfa6122f55ce 100644
--- a/arch/arm64/include/asm/xor.h
+++ b/arch/arm64/include/asm/xor.h
@@ -60,14 +60,14 @@ static struct xor_block_template xor_block_arm64 = {
 	.do_4   = xor_neon_4,
 	.do_5	= xor_neon_5
 };
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES           \
-	do {        \
-		xor_speed(&xor_block_8regs);    \
-		xor_speed(&xor_block_32regs);    \
-		if (cpu_has_neon()) { \
-			xor_speed(&xor_block_arm64);\
-		} \
-	} while (0)
+
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_32regs);
+	if (cpu_has_neon())
+		xor_register(&xor_block_arm64);
+}
 
 #endif /* ! CONFIG_KERNEL_MODE_NEON */
diff --git a/arch/loongarch/include/asm/xor.h b/arch/loongarch/include/asm/xor.h
index 12467fffee46..d17c0e3b047f 100644
--- a/arch/loongarch/include/asm/xor.h
+++ b/arch/loongarch/include/asm/xor.h
@@ -16,14 +16,6 @@ static struct xor_block_template xor_block_lsx = {
 	.do_4 = xor_lsx_4,
 	.do_5 = xor_lsx_5,
 };
-
-#define XOR_SPEED_LSX()					\
-	do {						\
-		if (cpu_has_lsx)			\
-			xor_speed(&xor_block_lsx);	\
-	} while (0)
-#else /* CONFIG_CPU_HAS_LSX */
-#define XOR_SPEED_LSX()
 #endif /* CONFIG_CPU_HAS_LSX */
 
 #ifdef CONFIG_CPU_HAS_LASX
@@ -34,14 +26,6 @@ static struct xor_block_template xor_block_lasx = {
 	.do_4 = xor_lasx_4,
 	.do_5 = xor_lasx_5,
 };
-
-#define XOR_SPEED_LASX()					\
-	do {							\
-		if (cpu_has_lasx)				\
-			xor_speed(&xor_block_lasx);		\
-	} while (0)
-#else /* CONFIG_CPU_HAS_LASX */
-#define XOR_SPEED_LASX()
 #endif /* CONFIG_CPU_HAS_LASX */
 
 /*
@@ -54,15 +38,21 @@ static struct xor_block_template xor_block_lasx = {
  */
 #include <asm-generic/xor.h>
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-do {							\
-	xor_speed(&xor_block_8regs);			\
-	xor_speed(&xor_block_8regs_p);			\
-	xor_speed(&xor_block_32regs);			\
-	xor_speed(&xor_block_32regs_p);			\
-	XOR_SPEED_LSX();				\
-	XOR_SPEED_LASX();				\
-} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_8regs_p);
+	xor_register(&xor_block_32regs);
+	xor_register(&xor_block_32regs_p);
+#ifdef CONFIG_CPU_HAS_LSX
+	if (cpu_has_lsx)
+		xor_register(&xor_block_lsx);
+#endif
+#ifdef CONFIG_CPU_HAS_LASX
+	if (cpu_has_lasx)
+		xor_register(&xor_block_lasx);
+#endif
+}
 
 #endif /* _ASM_LOONGARCH_XOR_H */
diff --git a/arch/powerpc/include/asm/xor.h b/arch/powerpc/include/asm/xor.h
index 37d05c11d09c..30224c5279c4 100644
--- a/arch/powerpc/include/asm/xor.h
+++ b/arch/powerpc/include/asm/xor.h
@@ -21,27 +21,22 @@ static struct xor_block_template xor_block_altivec = {
 	.do_4 = xor_altivec_4,
 	.do_5 = xor_altivec_5,
 };
-
-#define XOR_SPEED_ALTIVEC()				\
-	do {						\
-		if (cpu_has_feature(CPU_FTR_ALTIVEC))	\
-			xor_speed(&xor_block_altivec);	\
-	} while (0)
-#else
-#define XOR_SPEED_ALTIVEC()
-#endif
+#endif /* CONFIG_ALTIVEC */
 
 /* Also try the generic routines. */
 #include <asm-generic/xor.h>
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-do {							\
-	xor_speed(&xor_block_8regs);			\
-	xor_speed(&xor_block_8regs_p);			\
-	xor_speed(&xor_block_32regs);			\
-	xor_speed(&xor_block_32regs_p);			\
-	XOR_SPEED_ALTIVEC();				\
-} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_8regs_p);
+	xor_register(&xor_block_32regs);
+	xor_register(&xor_block_32regs_p);
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		xor_register(&xor_block_altivec);
+#endif
+}
 
 #endif /* _ASM_POWERPC_XOR_H */
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
index 96011861e46b..ed5f27903efc 100644
--- a/arch/riscv/include/asm/xor.h
+++ b/arch/riscv/include/asm/xor.h
@@ -55,14 +55,15 @@ static struct xor_block_template xor_block_rvv = {
 	.do_4 = xor_vector_4,
 	.do_5 = xor_vector_5
 };
+#endif /* CONFIG_RISCV_ISA_V */
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES           \
-	do {        \
-		xor_speed(&xor_block_8regs);    \
-		xor_speed(&xor_block_32regs);    \
-		if (has_vector()) { \
-			xor_speed(&xor_block_rvv);\
-		} \
-	} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_32regs);
+#ifdef CONFIG_RISCV_ISA_V
+	if (has_vector())
+		xor_register(&xor_block_rvv);
 #endif
+}
diff --git a/arch/s390/include/asm/xor.h b/arch/s390/include/asm/xor.h
index 857d6759b67f..4e2233f64da9 100644
--- a/arch/s390/include/asm/xor.h
+++ b/arch/s390/include/asm/xor.h
@@ -10,12 +10,10 @@
 
 extern struct xor_block_template xor_block_xc;
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-do {							\
-	xor_speed(&xor_block_xc);			\
-} while (0)
-
-#define XOR_SELECT_TEMPLATE(FASTEST)	(&xor_block_xc)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_force(&xor_block_xc);
+}
 
 #endif /* _ASM_S390_XOR_H */
diff --git a/arch/sparc/include/asm/xor_32.h b/arch/sparc/include/asm/xor_32.h
index 0351813cf3af..8fbf0c07ec28 100644
--- a/arch/sparc/include/asm/xor_32.h
+++ b/arch/sparc/include/asm/xor_32.h
@@ -259,10 +259,10 @@ static struct xor_block_template xor_block_SPARC = {
 /* For grins, also test the generic routines.  */
 #include <asm-generic/xor.h>
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-	do {						\
-		xor_speed(&xor_block_8regs);		\
-		xor_speed(&xor_block_32regs);		\
-		xor_speed(&xor_block_SPARC);		\
-	} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_32regs);
+	xor_register(&xor_block_SPARC);
+}
diff --git a/arch/sparc/include/asm/xor_64.h b/arch/sparc/include/asm/xor_64.h
index caaddea8ad79..e0482ecc0a68 100644
--- a/arch/sparc/include/asm/xor_64.h
+++ b/arch/sparc/include/asm/xor_64.h
@@ -60,20 +60,17 @@ static struct xor_block_template xor_block_niagara = {
         .do_5	= xor_niagara_5,
 };
 
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-	do {						\
-		xor_speed(&xor_block_VIS);		\
-		xor_speed(&xor_block_niagara);		\
-	} while (0)
-
-/* For VIS for everything except Niagara.  */
-#define XOR_SELECT_TEMPLATE(FASTEST) \
-	((tlb_type == hypervisor && \
-	  (sun4v_chip_type == SUN4V_CHIP_NIAGARA1 || \
-	   sun4v_chip_type == SUN4V_CHIP_NIAGARA2 || \
-	   sun4v_chip_type == SUN4V_CHIP_NIAGARA3 || \
-	   sun4v_chip_type == SUN4V_CHIP_NIAGARA4 || \
-	   sun4v_chip_type == SUN4V_CHIP_NIAGARA5)) ? \
-	 &xor_block_niagara : \
-	 &xor_block_VIS)
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
diff --git a/arch/x86/include/asm/xor.h b/arch/x86/include/asm/xor.h
index 7b0307acc410..33f5620d8d69 100644
--- a/arch/x86/include/asm/xor.h
+++ b/arch/x86/include/asm/xor.h
@@ -496,7 +496,4 @@ static struct xor_block_template xor_block_sse_pf64 = {
 # include <asm/xor_64.h>
 #endif
 
-#define XOR_SELECT_TEMPLATE(FASTEST) \
-	AVX_SELECT(FASTEST)
-
 #endif /* _ASM_X86_XOR_H */
diff --git a/arch/x86/include/asm/xor_32.h b/arch/x86/include/asm/xor_32.h
index 7a6b9474591e..ee32d08c27bc 100644
--- a/arch/x86/include/asm/xor_32.h
+++ b/arch/x86/include/asm/xor_32.h
@@ -552,22 +552,24 @@ static struct xor_block_template xor_block_pIII_sse = {
 /* We force the use of the SSE xor block because it can write around L2.
    We may also be able to load into the L1 only depending on how the cpu
    deals with a load to a line that is being prefetched.  */
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES				\
-do {							\
-	AVX_XOR_SPEED;					\
-	if (boot_cpu_has(X86_FEATURE_XMM)) {				\
-		xor_speed(&xor_block_pIII_sse);		\
-		xor_speed(&xor_block_sse_pf64);		\
-	} else if (boot_cpu_has(X86_FEATURE_MMX)) {	\
-		xor_speed(&xor_block_pII_mmx);		\
-		xor_speed(&xor_block_p5_mmx);		\
-	} else {					\
-		xor_speed(&xor_block_8regs);		\
-		xor_speed(&xor_block_8regs_p);		\
-		xor_speed(&xor_block_32regs);		\
-		xor_speed(&xor_block_32regs_p);		\
-	}						\
-} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+		xor_force(&xor_block_avx);
+	} else if (boot_cpu_has(X86_FEATURE_XMM)) {
+		xor_register(&xor_block_pIII_sse);
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
+}
 
 #endif /* _ASM_X86_XOR_32_H */
diff --git a/arch/x86/include/asm/xor_64.h b/arch/x86/include/asm/xor_64.h
index 0307e4ec5044..2d2ceb241866 100644
--- a/arch/x86/include/asm/xor_64.h
+++ b/arch/x86/include/asm/xor_64.h
@@ -17,12 +17,16 @@ static struct xor_block_template xor_block_sse = {
 /* We force the use of the SSE xor block because it can write around L2.
    We may also be able to load into the L1 only depending on how the cpu
    deals with a load to a line that is being prefetched.  */
-#undef XOR_TRY_TEMPLATES
-#define XOR_TRY_TEMPLATES			\
-do {						\
-	AVX_XOR_SPEED;				\
-	xor_speed(&xor_block_sse_pf64);		\
-	xor_speed(&xor_block_sse);		\
-} while (0)
+#define arch_xor_init arch_xor_init
+static __always_inline void __init arch_xor_init(void)
+{
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+		xor_force(&xor_block_avx);
+	} else {
+		xor_register(&xor_block_sse_pf64);
+		xor_register(&xor_block_sse);
+	}
+}
 
 #endif /* _ASM_X86_XOR_64_H */
diff --git a/arch/x86/include/asm/xor_avx.h b/arch/x86/include/asm/xor_avx.h
index 7f81dd5897f4..c600888436bb 100644
--- a/arch/x86/include/asm/xor_avx.h
+++ b/arch/x86/include/asm/xor_avx.h
@@ -166,13 +166,4 @@ static struct xor_block_template xor_block_avx = {
 	.do_5 = xor_avx_5,
 };
 
-#define AVX_XOR_SPEED \
-do { \
-	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_OSXSAVE)) \
-		xor_speed(&xor_block_avx); \
-} while (0)
-
-#define AVX_SELECT(FASTEST) \
-	(boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_OSXSAVE) ? &xor_block_avx : FASTEST)
-
 #endif
diff --git a/include/asm-generic/xor.h b/include/asm-generic/xor.h
index 44509d48fca2..79c0096aa9d9 100644
--- a/include/asm-generic/xor.h
+++ b/include/asm-generic/xor.h
@@ -728,11 +728,3 @@ static struct xor_block_template xor_block_32regs_p __maybe_unused = {
 	.do_4 = xor_32regs_p_4,
 	.do_5 = xor_32regs_p_5,
 };
-
-#define XOR_TRY_TEMPLATES			\
-	do {					\
-		xor_speed(&xor_block_8regs);	\
-		xor_speed(&xor_block_8regs_p);	\
-		xor_speed(&xor_block_32regs);	\
-		xor_speed(&xor_block_32regs_p);	\
-	} while (0)
diff --git a/include/linux/raid/xor_impl.h b/include/linux/raid/xor_impl.h
index a1890cd66812..6ed4c445ab24 100644
--- a/include/linux/raid/xor_impl.h
+++ b/include/linux/raid/xor_impl.h
@@ -2,6 +2,8 @@
 #ifndef _XOR_IMPL_H
 #define _XOR_IMPL_H
 
+#include <linux/init.h>
+
 struct xor_block_template {
 	struct xor_block_template *next;
 	const char *name;
@@ -22,4 +24,7 @@ struct xor_block_template {
 		     const unsigned long * __restrict);
 };
 
+void __init xor_register(struct xor_block_template *tmpl);
+void __init xor_force(struct xor_block_template *tmpl);
+
 #endif /* _XOR_IMPL_H */
diff --git a/lib/raid/xor/xor-core.c b/lib/raid/xor/xor-core.c
index ddb39dca1026..3b53c70ba615 100644
--- a/lib/raid/xor/xor-core.c
+++ b/lib/raid/xor/xor-core.c
@@ -14,10 +14,6 @@
 #include <linux/preempt.h>
 #include <asm/xor.h>
 
-#ifndef XOR_SELECT_TEMPLATE
-#define XOR_SELECT_TEMPLATE(x) (x)
-#endif
-
 /* The xor routines to use.  */
 static struct xor_block_template *active_template;
 
@@ -55,12 +51,33 @@ EXPORT_SYMBOL(xor_blocks);
 static struct xor_block_template *__initdata template_list;
 static int __initdata xor_forced = false;
 
-static void __init do_xor_register(struct xor_block_template *tmpl)
+/**
+ * xor_register - register a XOR template
+ * @tmpl:	template to register
+ *
+ * Register a XOR implementation with the core.  Registered implementations
+ * will be measured by a trivial benchmark, and the fastest one is chosen
+ * unless an implementation is forced using xor_force().
+ */
+void __init xor_register(struct xor_block_template *tmpl)
 {
 	tmpl->next = template_list;
 	template_list = tmpl;
 }
 
+/**
+ * xor_force - force use of a XOR template
+ * @tmpl:	template to register
+ *
+ * Register a XOR implementation with the core and force using it.  Forcing
+ * an implementation will make the core ignore any template registered using
+ * xor_register(), or any previous implementation forced using xor_force().
+ */
+void __init xor_force(struct xor_block_template *tmpl)
+{
+	active_template = tmpl;
+}
+
 #define BENCH_SIZE	4096
 #define REPS		800U
 
@@ -126,11 +143,19 @@ static int __init calibrate_xor_blocks(void)
 
 static int __init xor_init(void)
 {
+#ifdef arch_xor_init
+	arch_xor_init();
+#else
+	xor_register(&xor_block_8regs);
+	xor_register(&xor_block_8regs_p);
+	xor_register(&xor_block_32regs);
+	xor_register(&xor_block_32regs_p);
+#endif
+
 	/*
 	 * If this arch/cpu has a short-circuited selection, don't loop through
 	 * all the possible functions, just use the best one.
 	 */
-	active_template = XOR_SELECT_TEMPLATE(NULL);
 	if (active_template) {
 		pr_info("xor: automatically using best checksumming function   %-10s\n",
 			active_template->name);
@@ -138,10 +163,6 @@ static int __init xor_init(void)
 		return 0;
 	}
 
-#define xor_speed	do_xor_register
-	XOR_TRY_TEMPLATES;
-#undef xor_speed
-
 #ifdef MODULE
 	return calibrate_xor_blocks();
 #else
-- 
2.47.3


