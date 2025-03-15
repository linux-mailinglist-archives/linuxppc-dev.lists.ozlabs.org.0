Return-Path: <linuxppc-dev+bounces-7092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D843A62B69
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 11:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCW6Hlnz3ccV;
	Sat, 15 Mar 2025 21:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036375;
	cv=none; b=cnpNBxrDAiX6zHNQo3ouJzZAATWx0uw3XQyXCExZdfcZtBSkga87Atb0MT5Vh1iu7UxJ8bhXOVoduNRqXmRITAKZciEyFCVVc/hUCD9f6OjBh0hLYG2fRQFjmmF//AX5GEamq2Zs9HVqfHVyLzM7GSq2IsuHeQXVuSfL2Ua1aewctqB855JhsIO5RB1mMUd7GeTkTIm0POg3qTOm0BdFThTGHZcxQ6lnp3fDy1ekyq+O73Cp3dDLt2bsd76c5AZEInCTPWHPB3Z+3Eb3ZtaaWsfMuADQ3UoTcToNxR4MqNvk/ZMLIiPhMePy9IHvVHdTisAcZbtfbKnEP8+z9RFVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036375; c=relaxed/relaxed;
	bh=QNYoMGWG2h+yYDmaqldiFU6pjv1XfmeaFc1i7PDIb5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XwdTU25Umj2GeESACAqCW7MFgqtZMAlynZJxvxWXCh4WGPOgP3qA5xxbV+IZMSGG+dNuT8MFMxb/eAz80jOlbxqBFiIWXhEeeSo1inRPFg00wHNayg7pNL83Pljgs2t1/T8Lz/EstTzQf+8MP3kZtlf/syeVptW1TdpA0rYIxGMsUiDFznmwwG5dk3gt2g5qb47uhdS5GkDKOVjr+W5z6I5Mv6WvXxXbD2MwDFRm3kYuF3bLZuwX/6TowYhlpG3UfFH176uAAHdPmqJvlxg7PGjQir4tmNw0p/ypFnAyNh7HA0nT/KxSUiyahpKj2SNSoEK0t5ypt04NVYODsrdszw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+bdiqGN; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+bdiqGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCW0JPlz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A48CA489D6;
	Sat, 15 Mar 2025 10:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94C1C4CEED;
	Sat, 15 Mar 2025 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036372;
	bh=/gsyKJhuoIen+vHsBslWnn/2C+BZeE5kQsZ8QckJoRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+bdiqGN8Z8XOKssQQKhRShJZpgdJU/nDmTn2ED0MtuKUnS5le08t96rPYxjBIW3W
	 EEjWDsWMb/VL49fo30BlNQ9aW1IqRkBdQPXhsa7JCcSJ1za3w9XXCKFqjVipuCYzSA
	 QLgWrS+9HVDy5DynWbyMvCZD/o2pd8i++ywdtQGNubkvh+FjQqVI8ogvKUmXVh8UIm
	 j5GRzafGvHy8Z9mU22LR87OV28V/hM7swqiMFSP+nmGB/4fJfA3M/nWf/b1J6du1xR
	 PTMFl0VGtXo0jf4htyqvc7URq4YGmmI/oIvLIHhSVmacjGt5VEU2RtCM8nbfnFi8Fx
	 tHb2HdNFzItjg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 3/6] parisc: stop using asm-generic/iomap.h
Date: Sat, 15 Mar 2025 11:59:04 +0100
Message-Id: <20250315105907.1275012-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315105907.1275012-1-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

parisc uses custom iomap helpers to map bus specific function calls into
a linear __iomem token, but it tries to use the declarations from the x86
"generic iomap" code.

Untangle the two by duplicating the required declations and dropping
the #include that pulls in more stuff that is not needed here, to
allow simplify the generic version later.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/io.h | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 3143cf29ce27..59d85d2386bb 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -227,36 +227,54 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 #define F_EXTEND(x) ((unsigned long)((x) | (0xffffffff00000000ULL)))
 
 #ifdef CONFIG_64BIT
-#define ioread64 ioread64
-#define ioread64be ioread64be
-#define iowrite64 iowrite64
-#define iowrite64be iowrite64be
 extern u64 ioread64(const void __iomem *addr);
 extern u64 ioread64be(const void __iomem *addr);
+#define ioread64 ioread64
+#define ioread64be ioread64be
+
 extern void iowrite64(u64 val, void __iomem *addr);
 extern void iowrite64be(u64 val, void __iomem *addr);
+#define iowrite64 iowrite64
+#define iowrite64be iowrite64be
 #endif
 
-#include <asm-generic/iomap.h>
-/*
- * These get provided from <asm-generic/iomap.h> since parisc does not
- * select GENERIC_IOMAP.
- */
+extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
+extern void ioport_unmap(void __iomem *);
 #define ioport_map ioport_map
 #define ioport_unmap ioport_unmap
+
+extern unsigned int ioread8(const void __iomem *);
+extern unsigned int ioread16(const void __iomem *);
+extern unsigned int ioread16be(const void __iomem *);
+extern unsigned int ioread32(const void __iomem *);
+extern unsigned int ioread32be(const void __iomem *);
 #define ioread8 ioread8
 #define ioread16 ioread16
 #define ioread32 ioread32
 #define ioread16be ioread16be
 #define ioread32be ioread32be
+
+extern void iowrite8(u8, void __iomem *);
+extern void iowrite16(u16, void __iomem *);
+extern void iowrite16be(u16, void __iomem *);
+extern void iowrite32(u32, void __iomem *);
+extern void iowrite32be(u32, void __iomem *);
 #define iowrite8 iowrite8
 #define iowrite16 iowrite16
 #define iowrite32 iowrite32
 #define iowrite16be iowrite16be
 #define iowrite32be iowrite32be
+
+extern void ioread8_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread16_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread32_rep(const void __iomem *port, void *buf, unsigned long count);
 #define ioread8_rep ioread8_rep
 #define ioread16_rep ioread16_rep
 #define ioread32_rep ioread32_rep
+
+extern void iowrite8_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite16_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite32_rep(void __iomem *port, const void *buf, unsigned long count);
 #define iowrite8_rep iowrite8_rep
 #define iowrite16_rep iowrite16_rep
 #define iowrite32_rep iowrite32_rep
-- 
2.39.5


