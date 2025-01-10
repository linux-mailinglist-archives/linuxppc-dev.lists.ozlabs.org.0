Return-Path: <linuxppc-dev+bounces-4991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90588A0952E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:24:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56H5ZkPz3cYk;
	Sat, 11 Jan 2025 02:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522647;
	cv=none; b=TGRPBGgGbmILaiWrO+RWaWpTkpOKJeZD8JgPkcPmZ7SnxDS5bw4eiOrEvg1MRxxptE/CYn01OGNgK1wFHK+ChP4VHhoXPt6v1RnTKUamzmSgxXC/PSJo8ZNT1mZh8rstBWsulYvlwqLRkHHi7WtxPmyF+z/wbHLTYb/3PDftqCu/rVChMbuQzL6Q/bILC/7/3rkHQ8pioH9EXp8Ik1xvVDX8NW630kSKhpmamJd2vwVkcTH1ozRRbkMEAH8ZY1O2f1T9eSWfRGpwENEfgoS1vRi5xeLT3AO7oO5LIyz68YdvqRfq2iBDUZFT6EXhDOzxjRATpi361oTiU3A/eyZW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522647; c=relaxed/relaxed;
	bh=xNc+dMUqU+0OfyuISBhYhokWXDUFwzBNnLTiDihB+C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZOPvgv6u6PxGzR6q4aoLF8eacSr/iqp3SxO97ED5M4+KDdDiVx9LyJ/rEdHFySui3oCHzndAcoa/fqTsmMafWdCBSDYzY+obIag72Padm4dEr+mAmBLzu5wD2UwVc38aGJ3JYRht5V8dmmShawKERZx6vxMK9ThHT/9Su+1bFbXK3ufKJalyZ33EoIUo0gFepbNbLn84r1TpxhJiGmZTOZrU+Z5WBYJXZCMX+GTwP5iroU55/2no46PSRa3hSpRVGYAIxC+r+m4VY5BkObcD9vFJz7mPyXvbB0fwdGP7X6a53oueyH3pvMVNNAI2rhEtdLtXXGJVn6LUMRx7hWOcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q+xAmXPr; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/JKiVKpr; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q+xAmXPr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/JKiVKpr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56G3DGJz3cZ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:06 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNc+dMUqU+0OfyuISBhYhokWXDUFwzBNnLTiDihB+C0=;
	b=Q+xAmXPrWewn6Bu8X7bz3b1h4QUiD/E/7d2YijwHIcRIaUACxBs6RoOHn85XVlbzU3by20
	dQH+nzPGTYVi3JQKD47PbyrS2X5HtSStZqwvaenEJW5wxwqbcXSb9W/iavoQ9ubCOZKuv7
	/mUNxcENP+o3hom/VvCpH2u2GPJ8sW7yE7diJCZHhwQGnIU9/DWXqAJFaq0gNcRNK0NNns
	0YxZAzIbqQ6wo0299l8vXRMDP/PLAkQsixE2yDsGqKsrPRHUPhoFXJMEU7Jari7voCy7ak
	yTlPd+U7qmZzI3wsVBNd6Kj5QaltERxUnN4/CebFN45A2+hy3p/YpuLs0fWOgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNc+dMUqU+0OfyuISBhYhokWXDUFwzBNnLTiDihB+C0=;
	b=/JKiVKpr/OMLWwpNpTUMI+GTVmNbz3+EokbbtHzHenBMQc//InX4gKW0PgDJTbmtQgCCfu
	5r3MnFRKiCb5VLAQ==
Date: Fri, 10 Jan 2025 16:23:55 +0100
Subject: [PATCH v2 16/18] x86/vdso/vdso2c: Remove page handling
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
Message-Id: <20250110-vdso-store-rng-v2-16-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=3853;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SIYI1MFdbWBx6a80LF899krJFYHrvas9fog1PqSPSgs=;
 b=T71H4KozzpeWB2JhLOb2zm4PGOqwVUk2FIPmnD+nUthpazL+uwDXgGWwLQujn3kRfz6QHoTLp
 7CRU1LOVKN6ALLWGQQ7YKgdaecsgQELif15Wi5JS1EcABQBjC4eSgng
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The values are not used anymore.
Also the sanity checks performed by vdso2c can never trigger as they
only validate invariants already enforced by the linker script.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S |  4 ----
 arch/x86/entry/vdso/vdso2c.c          | 21 ---------------------
 arch/x86/entry/vdso/vdso2c.h          | 20 --------------------
 arch/x86/include/asm/vdso.h           |  6 ------
 4 files changed, 51 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index e5cecdb0fedf000516bb789d6aca4c952c3035e5..ec1ac191a0578e55dc72ceff7f5b5eb104042881 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,10 +24,6 @@ SECTIONS
 	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
 	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
-	/* For compatibility with vdso2c */
-	vvar_page = vdso_u_data;
-	vvar_start = vdso_u_data;
-
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/x86/entry/vdso/vdso2c.c b/arch/x86/entry/vdso/vdso2c.c
index 90d15f2a72055e37f2ef4292096dd780a051bc84..f84e8f8fa5fe6d1bc680895dfef28fe9251a7fe3 100644
--- a/arch/x86/entry/vdso/vdso2c.c
+++ b/arch/x86/entry/vdso/vdso2c.c
@@ -69,33 +69,12 @@
 
 const char *outfilename;
 
-/* Symbols that we need in vdso2c. */
-enum {
-	sym_vvar_start,
-	sym_vvar_page,
-	sym_pvclock_page,
-	sym_hvclock_page,
-	sym_timens_page,
-};
-
-const int special_pages[] = {
-	sym_vvar_page,
-	sym_pvclock_page,
-	sym_hvclock_page,
-	sym_timens_page,
-};
-
 struct vdso_sym {
 	const char *name;
 	bool export;
 };
 
 struct vdso_sym required_syms[] = {
-	[sym_vvar_start] = {"vvar_start", true},
-	[sym_vvar_page] = {"vvar_page", true},
-	[sym_pvclock_page] = {"pvclock_page", true},
-	[sym_hvclock_page] = {"hvclock_page", true},
-	[sym_timens_page] = {"timens_page", true},
 	{"VDSO32_NOTE_MASK", true},
 	{"__kernel_vsyscall", true},
 	{"__kernel_sigreturn", true},
diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
index 67b3e37576a64a29ecbdc6fd75e410fc52a82e58..78ed1c1f28b92b97973f57d3f65b9c4d4694f462 100644
--- a/arch/x86/entry/vdso/vdso2c.h
+++ b/arch/x86/entry/vdso/vdso2c.h
@@ -150,26 +150,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		}
 	}
 
-	/* Validate mapping addresses. */
-	for (i = 0; i < sizeof(special_pages) / sizeof(special_pages[0]); i++) {
-		INT_BITS symval = syms[special_pages[i]];
-
-		if (!symval)
-			continue;  /* The mapping isn't used; ignore it. */
-
-		if (symval % 4096)
-			fail("%s must be a multiple of 4096\n",
-			     required_syms[i].name);
-		if (symval + 4096 < syms[sym_vvar_start])
-			fail("%s underruns vvar_start\n",
-			     required_syms[i].name);
-		if (symval + 4096 > 0)
-			fail("%s is on the wrong side of the vdso text\n",
-			     required_syms[i].name);
-	}
-	if (syms[sym_vvar_start] % 4096)
-		fail("vvar_begin must be a multiple of 4096\n");
-
 	if (!image_name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;
diff --git a/arch/x86/include/asm/vdso.h b/arch/x86/include/asm/vdso.h
index d7f6592b74a94f6fecba59ce8f23eb3990843db4..80be0da733df43de7520bef69ad120ce05d37994 100644
--- a/arch/x86/include/asm/vdso.h
+++ b/arch/x86/include/asm/vdso.h
@@ -18,12 +18,6 @@ struct vdso_image {
 	unsigned long extable_base, extable_len;
 	const void *extable;
 
-	long sym_vvar_start;  /* Negative offset to the vvar area */
-
-	long sym_vvar_page;
-	long sym_pvclock_page;
-	long sym_hvclock_page;
-	long sym_timens_page;
 	long sym_VDSO32_NOTE_MASK;
 	long sym___kernel_sigreturn;
 	long sym___kernel_rt_sigreturn;

-- 
2.47.1


