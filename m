Return-Path: <linuxppc-dev+bounces-5004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1539A09571
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56V3jFlz3ccX;
	Sat, 11 Jan 2025 02:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522658;
	cv=none; b=aJ5sRBdSK5eMvDtvSuxgPUGv7pILxzi6PKB6GUpIfCqqg69+V4CUjAw+KR3mHgiZrkWQR+Z7qKjidOCmqhVSKVDOXhfWjx358cxEzwiio+vHL/3CAnFtcw1GtbxjKDRsQM010kRva5SRGw4swaFiQ+ubZ8H7/gj9rO4u7kfmpIS3eWp3pAwUgu8sDtiTAiTOqTsWOHujf+zA0BHyGLhfgHTZ5sl3RBBjdzQcKtyoXH5r2dHpTvXbuEZBweBx1NzNn4iiXWTVZx07ehEIIsNlXOVv+7lOujWnQwOgUOffECcjLK041b/hoE+pYHkSsHXfNA4OZD0nRZei5PCuhBgvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522658; c=relaxed/relaxed;
	bh=2hF0doQ8ABpgn/aNZsNNVwp/0/3UT02lIHINaA5tvUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuP0QbPv94Zb+U2VBD8cqYl2iksYEzF4kadgHYqYlwCdwV8MJWoCVOUR9z3UWd8Ckdv7DweKc0q7heRvvcuEYW4GncClx9EieNnkYGnMTSV82m0sOLjMZy/MwmVObh+zrBaQKC3/FCRsxaVh14gULdR7e8ULrqde3aJN4BmQoaXNkmPCMAaZbEHciKLo7B02MPD8iQ5FGlS+BIX9rpvZ7zBu1jiyl8wr3C0RFghJO5idD6Z3cF1Ap01cTPl2HdLoZRdNYVtVDX497hqdFYuAvK7sk2z+XfLOjoxDipd5uCRJLT/Stijd1d865TTr/sdJeZL09DC2bqrHatY3AmkpIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4QuV6WLv; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6C/eB/zj; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4QuV6WLv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6C/eB/zj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56T29Y6z3cfm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hF0doQ8ABpgn/aNZsNNVwp/0/3UT02lIHINaA5tvUM=;
	b=4QuV6WLv+qM0NFq/bU50gvu9jHJbGQqi8ZhB1pWOJo78K7X8EMY2cqzf+A0eJ3euP6AoM0
	3ZgoB397PR5qBYy4Ji2YF5V5UlQDbEFyfk4u8GXDBtnxZE2qjnL+2jmv4vuaIsaezwXOSZ
	hwdc3Iqa+1S91NJqKlHixWQY9bBHOG+dGCoc8F1rFRxxvjDF5+usOvgWMbZs+TZP/R8CjB
	c5zeenPso/iK5Muu0FVxXZzMwgvBPwh6VwzXRiz9M+2AobY70sdWEN9azGRgZEoT3kGFN5
	GE1kIR8fbyssrgwer81DVIhdrwGGYCCC0p5dNAeLcv8MU05MrLi78ZR4Qu9StA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hF0doQ8ABpgn/aNZsNNVwp/0/3UT02lIHINaA5tvUM=;
	b=6C/eB/zjdtEzQvYPxdxc0wgWqNTengxBY22KHhSipUPGZt0oE+VYTtMiCbpmEs2qO3htJ6
	bAtCMpTjfRigOvCQ==
Date: Fri, 10 Jan 2025 16:23:46 +0100
Subject: [PATCH v2 07/18] vdso: Add generic architecture-specific data
 storage
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-vdso-store-rng-v2-7-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=4823;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2OGLOTIn3mrK94nEr9eCVL0nPgn4S3w/pFtDFpXzfrI=;
 b=BWqHXYbHF2N14HCyKEALbacHP4B4k0Olfuqv1Ny6/4qxq5QHetPRa9vRN0DxHlVRIYSAWu+an
 Ie7iC4RpCs5CHpDT8JL7bXGs/W4j5ZDMEXMmBF0IlVo9oyq1D256JK5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some architectures need to architecture-specific data to the vDSO.
Enable the generic vDSO storage mechanism to both store and map this
data. Some architectures require more than a single page, like
LoongArch, so prepare for that usecase, too.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/Kconfig            |  4 ++++
 include/vdso/datapage.h | 25 +++++++++++++++++++++++++
 lib/vdso/datastore.c    | 14 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 6682b2a53e342cbacc05b70ef99cb1c47efe55e8..48f37e6c00674f433a0d6e6e05ce72c27cf000b7 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1576,6 +1576,10 @@ config HAVE_SPARSE_SYSCALL_NR
 	  entries at 4000, 5000 and 6000 locations. This option turns on syscall
 	  related optimizations for a given architecture.
 
+config ARCH_HAS_VDSO_ARCH_DATA
+	depends on GENERIC_VDSO_DATA_STORE
+	bool
+
 config ARCH_HAS_VDSO_TIME_DATA
 	bool
 
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 7dbc8797e3b8923c06f4b6b34790766e68b2abd2..46658b39c28250e977f5a3454224c3ed0fb4c81d 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -9,11 +9,13 @@
 #include <uapi/linux/types.h>
 #include <uapi/asm-generic/errno-base.h>
 
+#include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/clocksource.h>
 #include <vdso/ktime.h>
 #include <vdso/limits.h>
 #include <vdso/math64.h>
+#include <vdso/page.h>
 #include <vdso/processor.h>
 #include <vdso/time.h>
 #include <vdso/time32.h>
@@ -25,6 +27,15 @@
 struct arch_vdso_time_data {};
 #endif
 
+#if defined(CONFIG_ARCH_HAS_VDSO_ARCH_DATA)
+#include <asm/vdso/arch_data.h>
+#elif defined(CONFIG_GENERIC_VDSO_DATA_STORE)
+struct vdso_arch_data {
+	/* Needed for the generic code, never actually used at runtime */
+	char __unused;
+};
+#endif
+
 #define VDSO_BASES	(CLOCK_TAI + 1)
 #define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
 			 BIT(CLOCK_MONOTONIC)		| \
@@ -145,9 +156,11 @@ extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")))
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));
+extern struct vdso_arch_data vdso_u_arch_data __attribute__((visibility("hidden")));
 
 extern struct vdso_time_data *vdso_k_time_data;
 extern struct vdso_rng_data *vdso_k_rng_data;
+extern struct vdso_arch_data *vdso_k_arch_data;
 #endif
 
 /**
@@ -160,10 +173,15 @@ union vdso_data_store {
 
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
 
+#define VDSO_ARCH_DATA_SIZE ALIGN(sizeof(struct vdso_arch_data), PAGE_SIZE)
+#define VDSO_ARCH_DATA_PAGES (VDSO_ARCH_DATA_SIZE >> PAGE_SHIFT)
+
 enum vdso_pages {
 	VDSO_TIME_PAGE_OFFSET,
 	VDSO_TIMENS_PAGE_OFFSET,
 	VDSO_RNG_PAGE_OFFSET,
+	VDSO_ARCH_PAGES_START,
+	VDSO_ARCH_PAGES_END = VDSO_ARCH_PAGES_START + VDSO_ARCH_DATA_PAGES - 1,
 	VDSO_NR_PAGES
 };
 
@@ -193,10 +211,17 @@ enum vdso_pages {
 #define __vdso_u_rng_data
 #endif
 
+#ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
+#define __vdso_u_arch_data	PROVIDE(vdso_u_arch_data = vdso_u_data + 3 * PAGE_SIZE);
+#else
+#define __vdso_u_arch_data
+#endif
+
 #define VDSO_VVAR_SYMS						\
 	PROVIDE(vdso_u_data = . - __VDSO_PAGES * PAGE_SIZE);	\
 	PROVIDE(vdso_u_time_data = vdso_u_data);		\
 	__vdso_u_rng_data					\
+	__vdso_u_arch_data					\
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 9260b00dc8520af109bd9dd05ac7f7504eafbea0..0959d62d78586ef458eb5f7c1e152f6b5d4cbf85 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -26,6 +26,14 @@ struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
 static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
 #endif /* CONFIG_VDSO_GETRANDOM */
 
+#ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
+static union {
+	struct vdso_arch_data	data;
+	u8			page[VDSO_ARCH_DATA_SIZE];
+} vdso_arch_data_store __page_aligned_data;
+struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
+#endif /* CONFIG_ARCH_HAS_VDSO_ARCH_DATA */
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
@@ -67,6 +75,12 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			return VM_FAULT_SIGBUS;
 		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
 		break;
+	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
+		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
+			return VM_FAULT_SIGBUS;
+		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
+			vmf->pgoff - VDSO_ARCH_PAGES_START;
+		break;
 	default:
 		return VM_FAULT_SIGBUS;
 	}

-- 
2.47.1


