Return-Path: <linuxppc-dev+bounces-4302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F8F9F6418
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFB5K3vz2yP8;
	Wed, 18 Dec 2024 21:55:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519342;
	cv=none; b=VFlsO9rnCgQl1Dq4yXTKgHfi7lALf0qgKRzB1PSXIDOoS7rkJSejim3Cw4iDRYZBX7rAaTmyaOu9p/YaTFBq6N/4Dg2hwoMXU0nvC0Vvu/TTD2BAutixucFyIFZAhflxKW0kFBowFHu9WJuJYGFWHaKkeuTNkuigNOmbSNChfz/4/EvSJIGFbg7teL5TofH0DktKvJjGx3fN9UgNhwfkOlc4uDxQPUoBu/QZXZQa8Kjl1p+aGHhMZZKeEJj6zn9BVXa7smO4Olepq8z2fgTW0fj4K03toCtkiyJTir1Evs3wUbzHQuxI/bxjwNO94yTZ3KKM8hrP8Lf73HUBEPKHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519342; c=relaxed/relaxed;
	bh=CaZLUXcO9xoFwxkAg0lI5f2YMcsLoYX+vnS7lc7T6Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQFLF/WU5ZBk7pc4RIzj4v2X01OWgq9I6L+zXUTCrJqh17XhhyKZB3DE52GbSSWNDevU/8Oe9SAmkiBP5/ybnsW5julk8kP96hlg+GlmPxo6zBegKGX/2ePXtq/4e96W1yBTMpaZM6nLhQRN5Q12l1B2/UswdkXfhrwFSJhB8u/5U6nm3lGGSoifJn/bxGPu3asKC1yyvG4VhCNb80kgMSqhyqwAUv2AXA6ZuC3HHrIwmRumdz4K4HTf7XeMIhtPzhAAsPSoluRRlBoCnuGYQPrnteD5rtcAuwlYc6xWD3fiG9fw4r8GcidJuKVVB+mhgnSyehxh3Cbb7/N6kxeUHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e6f6Bpez; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e6f6Bpez;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF64lwDz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519332;
	bh=CaZLUXcO9xoFwxkAg0lI5f2YMcsLoYX+vnS7lc7T6Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6f6BpezrVISU/tvHlHh/4mrJs6Wh6Cro/t8utrIwk9Y6L5mCZg2L1vBaK5UVYiI+
	 owp8rtCvRZe0d9fwJSnfGcPh0346bMu2JVf1kRLOYn0xyyNYxiP1aJbrpCA9l40eZZ
	 OZj6DMcac822fncYNm4VZ3YVwBATgPNYUwOSga4clC15vEjUUqbQnjqvIm0dBrVTTI
	 oE0LMhCyAoN+L5/QeutL0+xCG4upuDf7aupJNZ0eal0QBCsaAt0uybuf/6iOKHzEyl
	 6KjMiuGRBKqshrysIJ9kUUBr443tVW2lvxriWT2BCnVt2mynHyDlpu/AQU5LwHfZWe
	 bV6N0MxKDXZcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF011kHz4xfJ;
	Wed, 18 Dec 2024 21:55:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 12/25] powerpc/io: Unhook MMIO accessors
Date: Wed, 18 Dec 2024 21:55:00 +1100
Message-ID: <20241218105523.416573-12-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that PPC_INDIRECT_MMIO is removed, it's not possible/necessary
to hook any of the "memory" accessors, so turn them back into regular
static inlines, and restrict the hooking mechanism to the "pio"
accessors only.

Move the #defines that signal each routine is implemented next to the
implementation, and update the out-of-date comment.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Rebase. Move the #defines that signal each routine is implemented
next to the implementation, and update the out-of-date comment.

 arch/powerpc/include/asm/io-defs.h |  70 ++----------
 arch/powerpc/include/asm/io.h      | 169 ++++++++++++++++++++++++-----
 2 files changed, 153 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/include/asm/io-defs.h b/arch/powerpc/include/asm/io-defs.h
index faf8617cc574..5c2be9b54a9d 100644
--- a/arch/powerpc/include/asm/io-defs.h
+++ b/arch/powerpc/include/asm/io-defs.h
@@ -1,61 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* This file is meant to be include multiple times by other headers */
-/* last 2 argments are used by platforms/cell/io-workarounds.[ch] */
 
-DEF_PCI_AC_RET(readb, u8, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_RET(readw, u16, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_RET(readl, u32, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_RET(readw_be, u16, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_RET(readl_be, u32, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_NORET(writeb, (u8 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-DEF_PCI_AC_NORET(writew, (u16 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-DEF_PCI_AC_NORET(writel, (u32 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-DEF_PCI_AC_NORET(writew_be, (u16 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-DEF_PCI_AC_NORET(writel_be, (u32 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-
-#ifdef __powerpc64__
-DEF_PCI_AC_RET(readq, u64, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_RET(readq_be, u64, (const PCI_IO_ADDR addr), (addr), mem, addr)
-DEF_PCI_AC_NORET(writeq, (u64 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-DEF_PCI_AC_NORET(writeq_be, (u64 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
-#endif /* __powerpc64__ */
-
-DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port), pio, port)
-DEF_PCI_AC_RET(inw, u16, (unsigned long port), (port), pio, port)
-DEF_PCI_AC_RET(inl, u32, (unsigned long port), (port), pio, port)
-DEF_PCI_AC_NORET(outb, (u8 val, unsigned long port), (val, port), pio, port)
-DEF_PCI_AC_NORET(outw, (u16 val, unsigned long port), (val, port), pio, port)
-DEF_PCI_AC_NORET(outl, (u32 val, unsigned long port), (val, port), pio, port)
-
-DEF_PCI_AC_NORET(readsb, (const PCI_IO_ADDR a, void *b, unsigned long c),
-		 (a, b, c), mem, a)
-DEF_PCI_AC_NORET(readsw, (const PCI_IO_ADDR a, void *b, unsigned long c),
-		 (a, b, c), mem, a)
-DEF_PCI_AC_NORET(readsl, (const PCI_IO_ADDR a, void *b, unsigned long c),
-		 (a, b, c), mem, a)
-DEF_PCI_AC_NORET(writesb, (PCI_IO_ADDR a, const void *b, unsigned long c),
-		 (a, b, c), mem, a)
-DEF_PCI_AC_NORET(writesw, (PCI_IO_ADDR a, const void *b, unsigned long c),
-		 (a, b, c), mem, a)
-DEF_PCI_AC_NORET(writesl, (PCI_IO_ADDR a, const void *b, unsigned long c),
-		 (a, b, c), mem, a)
-
-DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
-		 (p, b, c), pio, p)
-DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
-		 (p, b, c), pio, p)
-DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
-		 (p, b, c), pio, p)
-DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
-		 (p, b, c), pio, p)
-DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
-		 (p, b, c), pio, p)
-DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
-		 (p, b, c), pio, p)
-
-DEF_PCI_AC_NORET(memset_io, (PCI_IO_ADDR a, int c, unsigned long n),
-		 (a, c, n), mem, a)
-DEF_PCI_AC_NORET(memcpy_fromio, (void *d, const PCI_IO_ADDR s, unsigned long n),
-		 (d, s, n), mem, s)
-DEF_PCI_AC_NORET(memcpy_toio, (PCI_IO_ADDR d, const void *s, unsigned long n),
-		 (d, s, n), mem, d)
+DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port))
+DEF_PCI_AC_RET(inw, u16, (unsigned long port), (port))
+DEF_PCI_AC_RET(inl, u32, (unsigned long port), (port))
+DEF_PCI_AC_NORET(outb, (u8 val, unsigned long port), (val, port))
+DEF_PCI_AC_NORET(outw, (u16 val, unsigned long port), (val, port))
+DEF_PCI_AC_NORET(outl, (u32 val, unsigned long port), (val, port))
+DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c), (p, b, c))
+DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c), (p, b, c))
+DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c), (p, b, c))
+DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c), (p, b, c))
+DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c), (p, b, c))
+DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c), (p, b, c))
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index ecc0dff82dc6..24a0ae26510f 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -580,19 +580,149 @@ __do_out_asm(_rec_outl, "stwbrx")
 				_memcpy_fromio(dst, src, n)
 #endif /* !CONFIG_EEH */
 
+static inline u8 readb(const PCI_IO_ADDR addr)
+{
+	return __do_readb(addr);
+}
+#define readb readb
+
+static inline u16 readw(const PCI_IO_ADDR addr)
+{
+	return __do_readw(addr);
+}
+#define readw readw
+
+static inline u32 readl(const PCI_IO_ADDR addr)
+{
+	return __do_readl(addr);
+}
+#define readl readl
+
+static inline u16 readw_be(const PCI_IO_ADDR addr)
+{
+	return __do_readw_be(addr);
+}
+
+static inline u32 readl_be(const PCI_IO_ADDR addr)
+{
+	return __do_readl_be(addr);
+}
+
+static inline void writeb(u8 val, PCI_IO_ADDR addr)
+{
+	__do_writeb(val, addr);
+}
+#define writeb writeb
+
+static inline void writew(u16 val, PCI_IO_ADDR addr)
+{
+	__do_writew(val, addr);
+}
+#define writew writew
+
+static inline void writel(u32 val, PCI_IO_ADDR addr)
+{
+	__do_writel(val, addr);
+}
+#define writel writel
+
+static inline void writew_be(u16 val, PCI_IO_ADDR addr)
+{
+	__do_writew_be(val, addr);
+}
+
+static inline void writel_be(u32 val, PCI_IO_ADDR addr)
+{
+	__do_writel_be(val, addr);
+}
+
+static inline void readsb(const PCI_IO_ADDR a, void *b, unsigned long c)
+{
+	__do_readsb(a, b, c);
+}
+#define readsb readsb
+
+static inline void readsw(const PCI_IO_ADDR a, void *b, unsigned long c)
+{
+	__do_readsw(a, b, c);
+}
+#define readsw readsw
+
+static inline void readsl(const PCI_IO_ADDR a, void *b, unsigned long c)
+{
+	__do_readsl(a, b, c);
+}
+#define readsl readsl
+
+static inline void writesb(PCI_IO_ADDR a, const void *b, unsigned long c)
+{
+	__do_writesb(a, b, c);
+}
+#define writesb writesb
+
+static inline void writesw(PCI_IO_ADDR a, const void *b, unsigned long c)
+{
+	__do_writesw(a, b, c);
+}
+#define writesw writesw
+
+static inline void writesl(PCI_IO_ADDR a, const void *b, unsigned long c)
+{
+	__do_writesl(a, b, c);
+}
+#define writesl writesl
+
+static inline void memset_io(PCI_IO_ADDR a, int c, unsigned long n)
+{
+	__do_memset_io(a, c, n);
+}
+#define memset_io memset_io
+
+static inline void memcpy_fromio(void *d, const PCI_IO_ADDR s, unsigned long n)
+{
+	__do_memcpy_fromio(d, s, n);
+}
+#define memcpy_fromio memcpy_fromio
+
+static inline void memcpy_toio(PCI_IO_ADDR d, const void *s, unsigned long n)
+{
+	__do_memcpy_toio(d, s, n);
+}
+#define memcpy_toio memcpy_toio
+
+#ifdef __powerpc64__
+static inline u64 readq(const PCI_IO_ADDR addr)
+{
+	return __do_readq(addr);
+}
+
+static inline u64 readq_be(const PCI_IO_ADDR addr)
+{
+	return __do_readq_be(addr);
+}
+
+static inline void writeq(u64 val, PCI_IO_ADDR addr)
+{
+	__do_writeq(val, addr);
+}
+
+static inline void writeq_be(u64 val, PCI_IO_ADDR addr)
+{
+	__do_writeq_be(val, addr);
+}
+#endif /* __powerpc64__ */
+
 #ifdef CONFIG_PPC_INDIRECT_PIO
-#define DEF_PCI_HOOK_pio(x)	x
+#define DEF_PCI_HOOK(x)	x
 #else
-#define DEF_PCI_HOOK_pio(x)	NULL
+#define DEF_PCI_HOOK(x)	NULL
 #endif
 
-#define DEF_PCI_HOOK_mem(x)	NULL
-
 /* Structure containing all the hooks */
 extern struct ppc_pci_io {
 
-#define DEF_PCI_AC_RET(name, ret, at, al, space, aa)	ret (*name) at;
-#define DEF_PCI_AC_NORET(name, at, al, space, aa)	void (*name) at;
+#define DEF_PCI_AC_RET(name, ret, at, al)	ret (*name) at;
+#define DEF_PCI_AC_NORET(name, at, al)		void (*name) at;
 
 #include <asm/io-defs.h>
 
@@ -602,18 +732,18 @@ extern struct ppc_pci_io {
 } ppc_pci_io;
 
 /* The inline wrappers */
-#define DEF_PCI_AC_RET(name, ret, at, al, space, aa)		\
+#define DEF_PCI_AC_RET(name, ret, at, al)			\
 static inline ret name at					\
 {								\
-	if (DEF_PCI_HOOK_##space(ppc_pci_io.name) != NULL)	\
+	if (DEF_PCI_HOOK(ppc_pci_io.name) != NULL)		\
 		return ppc_pci_io.name al;			\
 	return __do_##name al;					\
 }
 
-#define DEF_PCI_AC_NORET(name, at, al, space, aa)		\
+#define DEF_PCI_AC_NORET(name, at, al)		\
 static inline void name at					\
 {								\
-	if (DEF_PCI_HOOK_##space(ppc_pci_io.name) != NULL)		\
+	if (DEF_PCI_HOOK(ppc_pci_io.name) != NULL)		\
 		ppc_pci_io.name al;				\
 	else							\
 		__do_##name al;					\
@@ -624,21 +754,7 @@ static inline void name at					\
 #undef DEF_PCI_AC_RET
 #undef DEF_PCI_AC_NORET
 
-/* Some drivers check for the presence of readq & writeq with
- * a #ifdef, so we make them happy here.
- */
-#define readb readb
-#define readw readw
-#define readl readl
-#define writeb writeb
-#define writew writew
-#define writel writel
-#define readsb readsb
-#define readsw readsw
-#define readsl readsl
-#define writesb writesb
-#define writesw writesw
-#define writesl writesl
+// Signal to asm-generic/io.h that we have implemented these.
 #define inb inb
 #define inw inw
 #define inl inl
@@ -655,9 +771,6 @@ static inline void name at					\
 #define readq	readq
 #define writeq	writeq
 #endif
-#define memset_io memset_io
-#define memcpy_fromio memcpy_fromio
-#define memcpy_toio memcpy_toio
 
 /*
  * We don't do relaxed operations yet, at least not with this semantic
-- 
2.47.1


