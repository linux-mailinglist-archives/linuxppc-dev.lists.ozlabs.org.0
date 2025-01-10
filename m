Return-Path: <linuxppc-dev+bounces-4988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D3A09520
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:24:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56G0FFMz3cYm;
	Sat, 11 Jan 2025 02:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522645;
	cv=none; b=C8e4Lw/1EzrafgPqWrgCAXeXBpOyl9rpbdK2ENwoWST2OFMn71ebGD9+LNZBQRlI+maYqgHPwK2I5Vub9Dh0OnwgQDObwk2l0b6zbzY2WiBVUciA3E3vyx1AMpqu6ZMPkctg3hhGxsHxl01LAmU51dXsR6RXzR4yaJFOCnVyxj50gVDs6uiitJr74LTxcDYSVc3jWNp4ROdXrom55rYpopBoaQBebpZhyfCvMO5500POup7PmVCx5sSlP0gOVqfdxb8jKcvtIHET7usP5G1oXiSt4xx+ZNby1wq6bLukIG6E5jpPxSLALRNJd4aY6quQuNm959s6Ck5WnSxga+JWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522645; c=relaxed/relaxed;
	bh=wiMr/7r350FDztI+yfZ4NjY6nn3Y/Nl0egJSTBaRpLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oN+ubsIy9G2kwBobuNTcG8ZvfiihwJpxP9Xh5R3wdSTq37W5YOCk1prICu908T8EqKAHoP++fbWOIDTIHM509ixsDFh+X5fuxtc8ox/AqRlatRWK/RnaqANq/hZRMa7EO4hHK/ZxHHErJwtsvcUywZVXTC946XwFqIBVxKZmxAmp2FbsdYwXA5dRVD3btyiAF8xOIk2dlQoztBdwETjqixjYj/bISLFNm45sfBAfc7i7i7sJ1Eb2B+j98b/SLbdZTE6Mu1nOOZoJRYA19Ny7kbjdl2ly3h1AYKm+HGsWXwlNTsNeRlAkE1HJFHaocNgf8ywG6vfOIPzteH5M4ciqhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nU7XbmRI; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2HokUJVx; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nU7XbmRI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2HokUJVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56D66vvz3cYB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:04 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiMr/7r350FDztI+yfZ4NjY6nn3Y/Nl0egJSTBaRpLs=;
	b=nU7XbmRIRbhhK3BkvK5wfJIUOzyhNhYr4+SxVEuPhBTWH94wR20ECLrVBsQjZPzYkf27Hq
	p2rG+NUsuOEuqR7htHgrqBwxFzrcQEcKmXRDAqJtMFlnHplhWows76OHkWiLGjUd08m92b
	mBpT0EMoBlt3Kcl9d2OqDlpFbIhDxvId+27k2ovO7ZNYxchvunKinis62iQU34Q24aickE
	Zp1+OCGdsAbDvg6R+vfXDrFRhw0YZiwZCJy8jWZ+U3+mKI4jRBU8/yYHtS33aEoGTPZrA3
	zA8A6xvDiBGOWZRlQbnPxPfKh7N3BF7e0X/cHC/0YyvsM+THVaYj5xz5Tuu37w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiMr/7r350FDztI+yfZ4NjY6nn3Y/Nl0egJSTBaRpLs=;
	b=2HokUJVxbHn8F785G0CHjr9RFD9ifVK8x4g4TuI0POw2FWzUOAxJJbiw3xjwoD7htuVi2G
	QcErSkg3qE8OauDA==
Date: Fri, 10 Jan 2025 16:23:40 +0100
Subject: [PATCH v2 01/18] x86/vdso: Fix latent bug in vclock_pages
 calculation
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
Message-Id: <20250110-vdso-store-rng-v2-1-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=2531;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mrCwYwONHFoKf8BOecbFCAndYakgmDivYb/K3zc9HyU=;
 b=5bbXPNT2cixA+c9v6k3mfkn19z8uqdUaa+GjcugpIz/DlZVc7ni5HOahVN4GdNyeokUKqBUiu
 28329iUY//8CtJtkaCSEgQyd+P1Xi7/4bXcZMBPdBToJqyU81Gwpxz1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vclock pages are *after* the non-vclock pages.
Currently there are both two vclock and two non-vclock pages so the
existing logic works by accident.
As soon as the number of pages changes it will break however.
This will be the case with the introduction of the generic vDSO data
storage.

Use a macro to keep the calculation understandable and in sync between
the linker script and mapping code.

Fixes: e93d2521b27f ("x86/vdso: Split virtual clock pages into dedicated mapping")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 2 +-
 arch/x86/entry/vdso/vma.c             | 2 +-
 arch/x86/include/asm/vdso/vsyscall.h  | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 872947c1004c35c006f7508eac7dff251c286aeb..918606ff92a988b14f5e64f984750ae04b3b6ede 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,7 +24,7 @@ SECTIONS
 
 	timens_page  = vvar_start + PAGE_SIZE;
 
-	vclock_pages = vvar_start + VDSO_NR_VCLOCK_PAGES * PAGE_SIZE;
+	vclock_pages = VDSO_VCLOCK_PAGES_START(vvar_start);
 	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
 	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 39e6efc1a9cab760b8a65e4b02c624e8c75244b5..aa62949335ecec3765d3b46eac7f7b83be5efdda 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -290,7 +290,7 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 	}
 
 	vma = _install_special_mapping(mm,
-				       addr + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
+				       VDSO_VCLOCK_PAGES_START(addr),
 				       VDSO_NR_VCLOCK_PAGES * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
 				       VM_PFNMAP,
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 37b4a70559a8228601203fe7b99b9ddfc3d94f1b..88b31d4cdfaf331d2d597981d3f8ee0c5a339085 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -6,6 +6,7 @@
 #define __VVAR_PAGES	4
 
 #define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE)
 #define VDSO_PAGE_PVCLOCK_OFFSET	0
 #define VDSO_PAGE_HVCLOCK_OFFSET	1
 

-- 
2.47.1


