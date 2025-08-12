Return-Path: <linuxppc-dev+bounces-10836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58622B21D2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L704fbjz3dHw;
	Tue, 12 Aug 2025 15:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977484;
	cv=none; b=h1WxJHBgQndvPbLmvh53/NdczVw/XVujEc2f5YmJbm2553cd7IIbM9QykVSx83+DiNFUPoSjSyeSB41pfq6K0FF/V0WInE914Yw9A34euWFRM9rYVvIf8P1v/LzGx0P119oVOGCSX1QloLT2Z4go0uQTfXLd+RytM0ND+t+2PQDqZk4ig24lsyom3jANt3Gp56cxO6G+kltEP6oPwO1DbjgcYVlUR/Nch+C/uJRMuFU8amGWhd0RUwv+evD2ctPMQLSLk+E9LkhqtQ8vwt9p5ZZxNX9E8eMmJslH9UMOwD/OEruto6qlFUw/iMuL4RE7PCap3OyoMpObkBIEasK3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977484; c=relaxed/relaxed;
	bh=O/qXdYtuegbf1kl5O2TCqH5+73vhTlXMdIZfEuJ+F/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m67tI+kEVHs1FxHRuGKUiJaoVPY5IxwUyvXYPiQ9mlt7yAHMcD5O7y9cJ5wJ1GvF9zu5J/ccuWuLZooUANtn+hr1qzjpVqPBfwIe7XNH9ljk7VPnFpmnjUk5GXJNSWBiK+5OAxha0/zK165eR0sfrL10QUdrLNAAIcrdleZ6lch0i63E9+6zNCxFLzMgGAv5whhlE+AbL+f/DPN+hZZmDQbg7Ii8eateKJ+JfiLVOVn6nHIrqWZvVpsfjaLiz7u+g1hgLyQvlQJp3FR/pxu2zcKkXRyMAFxDShzyQUmZ5GMSPw0ezHKw56rTf+jqo0NEXNLbb8AxR4V0vieelnup8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=17d1f5te; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AnyzdISP; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=17d1f5te;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AnyzdISP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L6y6kTLz3dJd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:42 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/qXdYtuegbf1kl5O2TCqH5+73vhTlXMdIZfEuJ+F/k=;
	b=17d1f5te+/cYBYYWcDFI2wtdn9xCozU1IkOSYgkcb8wwg8BvllCjsWrJlWBsegHjcXWWT3
	JW7rnq6dzPdI1jfRRI4Ba8bFhvLYvh9a04yrwZlE0U9F9P1g5DfUWBM5uQTfMy6OxNdcAu
	Ezv+Cec9cudmfQ0tnoqRpOuEOQYz8/Fu29PDNf1QXEPO1wdM/PtQrsAsWDNEgSygSdMCUe
	Bhv3EbU1D2p+VZpyHFp4vo3+ifKQlo03GgriBzPwA/5lzqXv/pzM14a5dDSFK7iZBTkibz
	8j+KrfAUXszZVTX8OjrMunhc06qTDe59Yplj8hJ/hsxVmkOQjUn1TaTGGsLJtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/qXdYtuegbf1kl5O2TCqH5+73vhTlXMdIZfEuJ+F/k=;
	b=AnyzdISPaKFp+y6n7TGUqk/HejZjbkZ6cHuOvZNDIlkCerQgYuGgZsZTvKifvm6DRPWK2N
	1LTEcv+LjMlE2fAw==
Date: Tue, 12 Aug 2025 07:44:18 +0200
Subject: [PATCH v4 05/24] powerpc/elf: Move relocation constants to UAPI
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-5-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=22362;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n05how22sEnufdxrM4828i2NNT++aNc+IpUgzqX7ohk=;
 b=oI7oXoKhdlE0kZzRJI6qcV4/RnB44Z/ZCa4X/gEW6kb9109rpAZpDJ0BKApz4EG+rn/9CHAf0
 Su5Yu4Vq3eLBG8aD7k5rSdis0I/EPi+x5UmtzvVYaSHcJ1OnGDZMsF/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These constants are useful for cross-platform userspace, for example to
process ELF files during kernel cross-compilation.

Move them from the kernel-private architecture-specific header to the UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/uapi/asm/elf.h | 201 ------------------------------------
 include/uapi/linux/elf-r.h          | 201 ++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+), 201 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index a5377f494fa316f62821a27ce1c32fede4c0507d..aba921b8249a2654be2a78c879c9ef236a017b57 100644
--- a/arch/powerpc/include/uapi/asm/elf.h
+++ b/arch/powerpc/include/uapi/asm/elf.h
@@ -17,78 +17,6 @@
 #include <asm/cputable.h>
 #include <asm/auxvec.h>
 
-/* PowerPC relocations defined by the ABIs */
-#define R_PPC_NONE		0
-#define R_PPC_ADDR32		1	/* 32bit absolute address */
-#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
-#define R_PPC_ADDR16		3	/* 16bit absolute address */
-#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
-#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
-#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
-#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
-#define R_PPC_ADDR14_BRTAKEN	8
-#define R_PPC_ADDR14_BRNTAKEN	9
-#define R_PPC_REL24		10	/* PC relative 26 bit */
-#define R_PPC_REL14		11	/* PC relative 16 bit */
-#define R_PPC_REL14_BRTAKEN	12
-#define R_PPC_REL14_BRNTAKEN	13
-#define R_PPC_GOT16		14
-#define R_PPC_GOT16_LO		15
-#define R_PPC_GOT16_HI		16
-#define R_PPC_GOT16_HA		17
-#define R_PPC_PLTREL24		18
-#define R_PPC_COPY		19
-#define R_PPC_GLOB_DAT		20
-#define R_PPC_JMP_SLOT		21
-#define R_PPC_RELATIVE		22
-#define R_PPC_LOCAL24PC		23
-#define R_PPC_UADDR32		24
-#define R_PPC_UADDR16		25
-#define R_PPC_REL32		26
-#define R_PPC_PLT32		27
-#define R_PPC_PLTREL32		28
-#define R_PPC_PLT16_LO		29
-#define R_PPC_PLT16_HI		30
-#define R_PPC_PLT16_HA		31
-#define R_PPC_SDAREL16		32
-#define R_PPC_SECTOFF		33
-#define R_PPC_SECTOFF_LO	34
-#define R_PPC_SECTOFF_HI	35
-#define R_PPC_SECTOFF_HA	36
-
-/* PowerPC relocations defined for the TLS access ABI.  */
-#define R_PPC_TLS		67 /* none	(sym+add)@tls */
-#define R_PPC_DTPMOD32		68 /* word32	(sym+add)@dtpmod */
-#define R_PPC_TPREL16		69 /* half16*	(sym+add)@tprel */
-#define R_PPC_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
-#define R_PPC_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
-#define R_PPC_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
-#define R_PPC_TPREL32		73 /* word32	(sym+add)@tprel */
-#define R_PPC_DTPREL16		74 /* half16*	(sym+add)@dtprel */
-#define R_PPC_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
-#define R_PPC_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
-#define R_PPC_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
-#define R_PPC_DTPREL32		78 /* word32	(sym+add)@dtprel */
-#define R_PPC_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
-#define R_PPC_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
-#define R_PPC_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
-#define R_PPC_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
-#define R_PPC_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
-#define R_PPC_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
-#define R_PPC_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
-#define R_PPC_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
-#define R_PPC_GOT_TPREL16	87 /* half16*	(sym+add)@got@tprel */
-#define R_PPC_GOT_TPREL16_LO	88 /* half16	(sym+add)@got@tprel@l */
-#define R_PPC_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
-#define R_PPC_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
-#define R_PPC_GOT_DTPREL16	91 /* half16*	(sym+add)@got@dtprel */
-#define R_PPC_GOT_DTPREL16_LO	92 /* half16*	(sym+add)@got@dtprel@l */
-#define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
-#define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
-
-/* keep this the last entry. */
-#define R_PPC_NUM		95
-
 
 #define ELF_NGREG	48	/* includes nip, msr, lr, etc. */
 #define ELF_NFPREG	33	/* includes fpscr */
@@ -166,133 +94,4 @@ typedef elf_vrreg_t elf_vrregset_t32[ELF_NVRREG32];
 typedef elf_fpreg_t elf_vsrreghalf_t32[ELF_NVSRHALFREG];
 #endif
 
-/* PowerPC64 relocations defined by the ABIs */
-#define R_PPC64_NONE    R_PPC_NONE
-#define R_PPC64_ADDR32  R_PPC_ADDR32  /* 32bit absolute address.  */
-#define R_PPC64_ADDR24  R_PPC_ADDR24  /* 26bit address, word aligned.  */
-#define R_PPC64_ADDR16  R_PPC_ADDR16  /* 16bit absolute address. */
-#define R_PPC64_ADDR16_LO R_PPC_ADDR16_LO /* lower 16bits of abs. address.  */
-#define R_PPC64_ADDR16_HI R_PPC_ADDR16_HI /* high 16bits of abs. address. */
-#define R_PPC64_ADDR16_HA R_PPC_ADDR16_HA /* adjusted high 16bits.  */
-#define R_PPC64_ADDR14 R_PPC_ADDR14   /* 16bit address, word aligned.  */
-#define R_PPC64_ADDR14_BRTAKEN  R_PPC_ADDR14_BRTAKEN
-#define R_PPC64_ADDR14_BRNTAKEN R_PPC_ADDR14_BRNTAKEN
-#define R_PPC64_REL24   R_PPC_REL24 /* PC relative 26 bit, word aligned.  */
-#define R_PPC64_REL14   R_PPC_REL14 /* PC relative 16 bit. */
-#define R_PPC64_REL14_BRTAKEN   R_PPC_REL14_BRTAKEN
-#define R_PPC64_REL14_BRNTAKEN  R_PPC_REL14_BRNTAKEN
-#define R_PPC64_GOT16     R_PPC_GOT16
-#define R_PPC64_GOT16_LO  R_PPC_GOT16_LO
-#define R_PPC64_GOT16_HI  R_PPC_GOT16_HI
-#define R_PPC64_GOT16_HA  R_PPC_GOT16_HA
-
-#define R_PPC64_COPY      R_PPC_COPY
-#define R_PPC64_GLOB_DAT  R_PPC_GLOB_DAT
-#define R_PPC64_JMP_SLOT  R_PPC_JMP_SLOT
-#define R_PPC64_RELATIVE  R_PPC_RELATIVE
-
-#define R_PPC64_UADDR32   R_PPC_UADDR32
-#define R_PPC64_UADDR16   R_PPC_UADDR16
-#define R_PPC64_REL32     R_PPC_REL32
-#define R_PPC64_PLT32     R_PPC_PLT32
-#define R_PPC64_PLTREL32  R_PPC_PLTREL32
-#define R_PPC64_PLT16_LO  R_PPC_PLT16_LO
-#define R_PPC64_PLT16_HI  R_PPC_PLT16_HI
-#define R_PPC64_PLT16_HA  R_PPC_PLT16_HA
-
-#define R_PPC64_SECTOFF     R_PPC_SECTOFF
-#define R_PPC64_SECTOFF_LO  R_PPC_SECTOFF_LO
-#define R_PPC64_SECTOFF_HI  R_PPC_SECTOFF_HI
-#define R_PPC64_SECTOFF_HA  R_PPC_SECTOFF_HA
-#define R_PPC64_ADDR30          37  /* word30 (S + A - P) >> 2.  */
-#define R_PPC64_ADDR64          38  /* doubleword64 S + A.  */
-#define R_PPC64_ADDR16_HIGHER   39  /* half16 #higher(S + A).  */
-#define R_PPC64_ADDR16_HIGHERA  40  /* half16 #highera(S + A).  */
-#define R_PPC64_ADDR16_HIGHEST  41  /* half16 #highest(S + A).  */
-#define R_PPC64_ADDR16_HIGHESTA 42  /* half16 #highesta(S + A). */
-#define R_PPC64_UADDR64     43  /* doubleword64 S + A.  */
-#define R_PPC64_REL64       44  /* doubleword64 S + A - P.  */
-#define R_PPC64_PLT64       45  /* doubleword64 L + A.  */
-#define R_PPC64_PLTREL64    46  /* doubleword64 L + A - P.  */
-#define R_PPC64_TOC16       47  /* half16* S + A - .TOC.  */
-#define R_PPC64_TOC16_LO    48  /* half16 #lo(S + A - .TOC.).  */
-#define R_PPC64_TOC16_HI    49  /* half16 #hi(S + A - .TOC.).  */
-#define R_PPC64_TOC16_HA    50  /* half16 #ha(S + A - .TOC.).  */
-#define R_PPC64_TOC         51  /* doubleword64 .TOC. */
-#define R_PPC64_PLTGOT16    52  /* half16* M + A.  */
-#define R_PPC64_PLTGOT16_LO 53  /* half16 #lo(M + A).  */
-#define R_PPC64_PLTGOT16_HI 54  /* half16 #hi(M + A).  */
-#define R_PPC64_PLTGOT16_HA 55  /* half16 #ha(M + A).  */
-
-#define R_PPC64_ADDR16_DS      56 /* half16ds* (S + A) >> 2.  */
-#define R_PPC64_ADDR16_LO_DS   57 /* half16ds  #lo(S + A) >> 2.  */
-#define R_PPC64_GOT16_DS       58 /* half16ds* (G + A) >> 2.  */
-#define R_PPC64_GOT16_LO_DS    59 /* half16ds  #lo(G + A) >> 2.  */
-#define R_PPC64_PLT16_LO_DS    60 /* half16ds  #lo(L + A) >> 2.  */
-#define R_PPC64_SECTOFF_DS     61 /* half16ds* (R + A) >> 2.  */
-#define R_PPC64_SECTOFF_LO_DS  62 /* half16ds  #lo(R + A) >> 2.  */
-#define R_PPC64_TOC16_DS       63 /* half16ds* (S + A - .TOC.) >> 2.  */
-#define R_PPC64_TOC16_LO_DS    64 /* half16ds  #lo(S + A - .TOC.) >> 2.  */
-#define R_PPC64_PLTGOT16_DS    65 /* half16ds* (M + A) >> 2.  */
-#define R_PPC64_PLTGOT16_LO_DS 66 /* half16ds  #lo(M + A) >> 2.  */
-
-/* PowerPC64 relocations defined for the TLS access ABI.  */
-#define R_PPC64_TLS		67 /* none	(sym+add)@tls */
-#define R_PPC64_DTPMOD64	68 /* doubleword64 (sym+add)@dtpmod */
-#define R_PPC64_TPREL16		69 /* half16*	(sym+add)@tprel */
-#define R_PPC64_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
-#define R_PPC64_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
-#define R_PPC64_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
-#define R_PPC64_TPREL64		73 /* doubleword64 (sym+add)@tprel */
-#define R_PPC64_DTPREL16	74 /* half16*	(sym+add)@dtprel */
-#define R_PPC64_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
-#define R_PPC64_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
-#define R_PPC64_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
-#define R_PPC64_DTPREL64	78 /* doubleword64 (sym+add)@dtprel */
-#define R_PPC64_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
-#define R_PPC64_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
-#define R_PPC64_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
-#define R_PPC64_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
-#define R_PPC64_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
-#define R_PPC64_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
-#define R_PPC64_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
-#define R_PPC64_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
-#define R_PPC64_GOT_TPREL16_DS	87 /* half16ds*	(sym+add)@got@tprel */
-#define R_PPC64_GOT_TPREL16_LO_DS 88 /* half16ds (sym+add)@got@tprel@l */
-#define R_PPC64_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
-#define R_PPC64_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
-#define R_PPC64_GOT_DTPREL16_DS	91 /* half16ds*	(sym+add)@got@dtprel */
-#define R_PPC64_GOT_DTPREL16_LO_DS 92 /* half16ds (sym+add)@got@dtprel@l */
-#define R_PPC64_GOT_DTPREL16_HI	93 /* half16	(sym+add)@got@dtprel@h */
-#define R_PPC64_GOT_DTPREL16_HA	94 /* half16	(sym+add)@got@dtprel@ha */
-#define R_PPC64_TPREL16_DS	95 /* half16ds*	(sym+add)@tprel */
-#define R_PPC64_TPREL16_LO_DS	96 /* half16ds	(sym+add)@tprel@l */
-#define R_PPC64_TPREL16_HIGHER	97 /* half16	(sym+add)@tprel@higher */
-#define R_PPC64_TPREL16_HIGHERA	98 /* half16	(sym+add)@tprel@highera */
-#define R_PPC64_TPREL16_HIGHEST	99 /* half16	(sym+add)@tprel@highest */
-#define R_PPC64_TPREL16_HIGHESTA 100 /* half16	(sym+add)@tprel@highesta */
-#define R_PPC64_DTPREL16_DS	101 /* half16ds* (sym+add)@dtprel */
-#define R_PPC64_DTPREL16_LO_DS	102 /* half16ds	(sym+add)@dtprel@l */
-#define R_PPC64_DTPREL16_HIGHER	103 /* half16	(sym+add)@dtprel@higher */
-#define R_PPC64_DTPREL16_HIGHERA 104 /* half16	(sym+add)@dtprel@highera */
-#define R_PPC64_DTPREL16_HIGHEST 105 /* half16	(sym+add)@dtprel@highest */
-#define R_PPC64_DTPREL16_HIGHESTA 106 /* half16	(sym+add)@dtprel@highesta */
-#define R_PPC64_TLSGD		107
-#define R_PPC64_TLSLD		108
-#define R_PPC64_TOCSAVE		109
-
-#define R_PPC64_REL24_NOTOC	116
-#define R_PPC64_ENTRY		118
-
-#define R_PPC64_PCREL34		132
-#define R_PPC64_GOT_PCREL34	133
-
-#define R_PPC64_REL16		249
-#define R_PPC64_REL16_LO	250
-#define R_PPC64_REL16_HI	251
-#define R_PPC64_REL16_HA	252
-
-/* Keep this the last entry.  */
-#define R_PPC64_NUM		253
-
 #endif /* _UAPI_ASM_POWERPC_ELF_H */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index cf931fc05afa1825aa9737a4e6259ec0da678d3a..0d0dfaa7c724d5f0230e5b7b9b713d8587030637 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -113,4 +113,205 @@
 
 #define R_AARCH64_RELATIVE		1027
 
+/* PowerPC relocations defined by the ABIs */
+#define R_PPC_NONE		0
+#define R_PPC_ADDR32		1	/* 32bit absolute address */
+#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
+#define R_PPC_ADDR16		3	/* 16bit absolute address */
+#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
+#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
+#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
+#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
+#define R_PPC_ADDR14_BRTAKEN	8
+#define R_PPC_ADDR14_BRNTAKEN	9
+#define R_PPC_REL24		10	/* PC relative 26 bit */
+#define R_PPC_REL14		11	/* PC relative 16 bit */
+#define R_PPC_REL14_BRTAKEN	12
+#define R_PPC_REL14_BRNTAKEN	13
+#define R_PPC_GOT16		14
+#define R_PPC_GOT16_LO		15
+#define R_PPC_GOT16_HI		16
+#define R_PPC_GOT16_HA		17
+#define R_PPC_PLTREL24		18
+#define R_PPC_COPY		19
+#define R_PPC_GLOB_DAT		20
+#define R_PPC_JMP_SLOT		21
+#define R_PPC_RELATIVE		22
+#define R_PPC_LOCAL24PC		23
+#define R_PPC_UADDR32		24
+#define R_PPC_UADDR16		25
+#define R_PPC_REL32		26
+#define R_PPC_PLT32		27
+#define R_PPC_PLTREL32		28
+#define R_PPC_PLT16_LO		29
+#define R_PPC_PLT16_HI		30
+#define R_PPC_PLT16_HA		31
+#define R_PPC_SDAREL16		32
+#define R_PPC_SECTOFF		33
+#define R_PPC_SECTOFF_LO	34
+#define R_PPC_SECTOFF_HI	35
+#define R_PPC_SECTOFF_HA	36
+
+/* PowerPC relocations defined for the TLS access ABI.  */
+#define R_PPC_TLS		67 /* none	(sym+add)@tls */
+#define R_PPC_DTPMOD32		68 /* word32	(sym+add)@dtpmod */
+#define R_PPC_TPREL16		69 /* half16*	(sym+add)@tprel */
+#define R_PPC_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
+#define R_PPC_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
+#define R_PPC_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
+#define R_PPC_TPREL32		73 /* word32	(sym+add)@tprel */
+#define R_PPC_DTPREL16		74 /* half16*	(sym+add)@dtprel */
+#define R_PPC_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
+#define R_PPC_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
+#define R_PPC_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
+#define R_PPC_DTPREL32		78 /* word32	(sym+add)@dtprel */
+#define R_PPC_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
+#define R_PPC_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
+#define R_PPC_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
+#define R_PPC_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
+#define R_PPC_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
+#define R_PPC_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
+#define R_PPC_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
+#define R_PPC_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
+#define R_PPC_GOT_TPREL16	87 /* half16*	(sym+add)@got@tprel */
+#define R_PPC_GOT_TPREL16_LO	88 /* half16	(sym+add)@got@tprel@l */
+#define R_PPC_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
+#define R_PPC_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
+#define R_PPC_GOT_DTPREL16	91 /* half16*	(sym+add)@got@dtprel */
+#define R_PPC_GOT_DTPREL16_LO	92 /* half16*	(sym+add)@got@dtprel@l */
+#define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
+#define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
+
+/* keep this the last entry. */
+#define R_PPC_NUM		95
+
+/* PowerPC64 relocations defined by the ABIs */
+#define R_PPC64_NONE    R_PPC_NONE
+#define R_PPC64_ADDR32  R_PPC_ADDR32  /* 32bit absolute address.  */
+#define R_PPC64_ADDR24  R_PPC_ADDR24  /* 26bit address, word aligned.  */
+#define R_PPC64_ADDR16  R_PPC_ADDR16  /* 16bit absolute address. */
+#define R_PPC64_ADDR16_LO R_PPC_ADDR16_LO /* lower 16bits of abs. address.  */
+#define R_PPC64_ADDR16_HI R_PPC_ADDR16_HI /* high 16bits of abs. address. */
+#define R_PPC64_ADDR16_HA R_PPC_ADDR16_HA /* adjusted high 16bits.  */
+#define R_PPC64_ADDR14 R_PPC_ADDR14   /* 16bit address, word aligned.  */
+#define R_PPC64_ADDR14_BRTAKEN  R_PPC_ADDR14_BRTAKEN
+#define R_PPC64_ADDR14_BRNTAKEN R_PPC_ADDR14_BRNTAKEN
+#define R_PPC64_REL24   R_PPC_REL24 /* PC relative 26 bit, word aligned.  */
+#define R_PPC64_REL14   R_PPC_REL14 /* PC relative 16 bit. */
+#define R_PPC64_REL14_BRTAKEN   R_PPC_REL14_BRTAKEN
+#define R_PPC64_REL14_BRNTAKEN  R_PPC_REL14_BRNTAKEN
+#define R_PPC64_GOT16     R_PPC_GOT16
+#define R_PPC64_GOT16_LO  R_PPC_GOT16_LO
+#define R_PPC64_GOT16_HI  R_PPC_GOT16_HI
+#define R_PPC64_GOT16_HA  R_PPC_GOT16_HA
+
+#define R_PPC64_COPY      R_PPC_COPY
+#define R_PPC64_GLOB_DAT  R_PPC_GLOB_DAT
+#define R_PPC64_JMP_SLOT  R_PPC_JMP_SLOT
+#define R_PPC64_RELATIVE  R_PPC_RELATIVE
+
+#define R_PPC64_UADDR32   R_PPC_UADDR32
+#define R_PPC64_UADDR16   R_PPC_UADDR16
+#define R_PPC64_REL32     R_PPC_REL32
+#define R_PPC64_PLT32     R_PPC_PLT32
+#define R_PPC64_PLTREL32  R_PPC_PLTREL32
+#define R_PPC64_PLT16_LO  R_PPC_PLT16_LO
+#define R_PPC64_PLT16_HI  R_PPC_PLT16_HI
+#define R_PPC64_PLT16_HA  R_PPC_PLT16_HA
+
+#define R_PPC64_SECTOFF     R_PPC_SECTOFF
+#define R_PPC64_SECTOFF_LO  R_PPC_SECTOFF_LO
+#define R_PPC64_SECTOFF_HI  R_PPC_SECTOFF_HI
+#define R_PPC64_SECTOFF_HA  R_PPC_SECTOFF_HA
+#define R_PPC64_ADDR30          37  /* word30 (S + A - P) >> 2.  */
+#define R_PPC64_ADDR64          38  /* doubleword64 S + A.  */
+#define R_PPC64_ADDR16_HIGHER   39  /* half16 #higher(S + A).  */
+#define R_PPC64_ADDR16_HIGHERA  40  /* half16 #highera(S + A).  */
+#define R_PPC64_ADDR16_HIGHEST  41  /* half16 #highest(S + A).  */
+#define R_PPC64_ADDR16_HIGHESTA 42  /* half16 #highesta(S + A). */
+#define R_PPC64_UADDR64     43  /* doubleword64 S + A.  */
+#define R_PPC64_REL64       44  /* doubleword64 S + A - P.  */
+#define R_PPC64_PLT64       45  /* doubleword64 L + A.  */
+#define R_PPC64_PLTREL64    46  /* doubleword64 L + A - P.  */
+#define R_PPC64_TOC16       47  /* half16* S + A - .TOC.  */
+#define R_PPC64_TOC16_LO    48  /* half16 #lo(S + A - .TOC.).  */
+#define R_PPC64_TOC16_HI    49  /* half16 #hi(S + A - .TOC.).  */
+#define R_PPC64_TOC16_HA    50  /* half16 #ha(S + A - .TOC.).  */
+#define R_PPC64_TOC         51  /* doubleword64 .TOC. */
+#define R_PPC64_PLTGOT16    52  /* half16* M + A.  */
+#define R_PPC64_PLTGOT16_LO 53  /* half16 #lo(M + A).  */
+#define R_PPC64_PLTGOT16_HI 54  /* half16 #hi(M + A).  */
+#define R_PPC64_PLTGOT16_HA 55  /* half16 #ha(M + A).  */
+
+#define R_PPC64_ADDR16_DS      56 /* half16ds* (S + A) >> 2.  */
+#define R_PPC64_ADDR16_LO_DS   57 /* half16ds  #lo(S + A) >> 2.  */
+#define R_PPC64_GOT16_DS       58 /* half16ds* (G + A) >> 2.  */
+#define R_PPC64_GOT16_LO_DS    59 /* half16ds  #lo(G + A) >> 2.  */
+#define R_PPC64_PLT16_LO_DS    60 /* half16ds  #lo(L + A) >> 2.  */
+#define R_PPC64_SECTOFF_DS     61 /* half16ds* (R + A) >> 2.  */
+#define R_PPC64_SECTOFF_LO_DS  62 /* half16ds  #lo(R + A) >> 2.  */
+#define R_PPC64_TOC16_DS       63 /* half16ds* (S + A - .TOC.) >> 2.  */
+#define R_PPC64_TOC16_LO_DS    64 /* half16ds  #lo(S + A - .TOC.) >> 2.  */
+#define R_PPC64_PLTGOT16_DS    65 /* half16ds* (M + A) >> 2.  */
+#define R_PPC64_PLTGOT16_LO_DS 66 /* half16ds  #lo(M + A) >> 2.  */
+
+/* PowerPC64 relocations defined for the TLS access ABI.  */
+#define R_PPC64_TLS		67 /* none	(sym+add)@tls */
+#define R_PPC64_DTPMOD64	68 /* doubleword64 (sym+add)@dtpmod */
+#define R_PPC64_TPREL16		69 /* half16*	(sym+add)@tprel */
+#define R_PPC64_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
+#define R_PPC64_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
+#define R_PPC64_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
+#define R_PPC64_TPREL64		73 /* doubleword64 (sym+add)@tprel */
+#define R_PPC64_DTPREL16	74 /* half16*	(sym+add)@dtprel */
+#define R_PPC64_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
+#define R_PPC64_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
+#define R_PPC64_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
+#define R_PPC64_DTPREL64	78 /* doubleword64 (sym+add)@dtprel */
+#define R_PPC64_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
+#define R_PPC64_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
+#define R_PPC64_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
+#define R_PPC64_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
+#define R_PPC64_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
+#define R_PPC64_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
+#define R_PPC64_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
+#define R_PPC64_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
+#define R_PPC64_GOT_TPREL16_DS	87 /* half16ds*	(sym+add)@got@tprel */
+#define R_PPC64_GOT_TPREL16_LO_DS 88 /* half16ds (sym+add)@got@tprel@l */
+#define R_PPC64_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
+#define R_PPC64_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
+#define R_PPC64_GOT_DTPREL16_DS	91 /* half16ds*	(sym+add)@got@dtprel */
+#define R_PPC64_GOT_DTPREL16_LO_DS 92 /* half16ds (sym+add)@got@dtprel@l */
+#define R_PPC64_GOT_DTPREL16_HI	93 /* half16	(sym+add)@got@dtprel@h */
+#define R_PPC64_GOT_DTPREL16_HA	94 /* half16	(sym+add)@got@dtprel@ha */
+#define R_PPC64_TPREL16_DS	95 /* half16ds*	(sym+add)@tprel */
+#define R_PPC64_TPREL16_LO_DS	96 /* half16ds	(sym+add)@tprel@l */
+#define R_PPC64_TPREL16_HIGHER	97 /* half16	(sym+add)@tprel@higher */
+#define R_PPC64_TPREL16_HIGHERA	98 /* half16	(sym+add)@tprel@highera */
+#define R_PPC64_TPREL16_HIGHEST	99 /* half16	(sym+add)@tprel@highest */
+#define R_PPC64_TPREL16_HIGHESTA 100 /* half16	(sym+add)@tprel@highesta */
+#define R_PPC64_DTPREL16_DS	101 /* half16ds* (sym+add)@dtprel */
+#define R_PPC64_DTPREL16_LO_DS	102 /* half16ds	(sym+add)@dtprel@l */
+#define R_PPC64_DTPREL16_HIGHER	103 /* half16	(sym+add)@dtprel@higher */
+#define R_PPC64_DTPREL16_HIGHERA 104 /* half16	(sym+add)@dtprel@highera */
+#define R_PPC64_DTPREL16_HIGHEST 105 /* half16	(sym+add)@dtprel@highest */
+#define R_PPC64_DTPREL16_HIGHESTA 106 /* half16	(sym+add)@dtprel@highesta */
+#define R_PPC64_TLSGD		107
+#define R_PPC64_TLSLD		108
+#define R_PPC64_TOCSAVE		109
+
+#define R_PPC64_REL24_NOTOC	116
+#define R_PPC64_ENTRY		118
+
+#define R_PPC64_PCREL34		132
+#define R_PPC64_GOT_PCREL34	133
+
+#define R_PPC64_REL16		249
+#define R_PPC64_REL16_LO	250
+#define R_PPC64_REL16_HI	251
+#define R_PPC64_REL16_HA	252
+
+/* Keep this the last entry.  */
+#define R_PPC64_NUM		253
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


