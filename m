Return-Path: <linuxppc-dev+bounces-10830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327BEB21D18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:44:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L6t3mfjz3dGr;
	Tue, 12 Aug 2025 15:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977478;
	cv=none; b=UbBMBgNZjcfJ5g72zFTrbQiIoGxSvAMKg9nHeSoBw6rL5x4wpAA2F9mgVNF5YiVSbcqMnvLDpuUUX1NwKpPlezXlxIh8U9FvSPcrfAS2JB3OHrD56v1DDyc06ckxbkGoRpPkZCpES+K29yVQ0MJ1+dLvZBdexM0p5w+RZWegKKSIa2lV58/e9ni8T3luhLw44Thk/ZUBtnPB30bAbwhE/wLCAPVNgg+RmfS3bHYdruCLMntfWra5uftjdRmQLDOR6lriqZ+B6wXmw6nByN06gWHhnHtD+WYFbWwshUeArnCK0iGdfrBGD5sM83gRTSHpHdNR6KJ6cokiNi42xNx3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977478; c=relaxed/relaxed;
	bh=1fbs+jreI++pzzR3zWEjWTxnX9u6RnqE0RQf6GOU1NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2llfsE4AVbLke+gYpdYPTrsn8ymBwBNLCJ/0W3PHm4yeVTlN6VQnm3TnOxismLS8+XqdaHEMJNupeNvjNbXGcgIvdGEOadMCxTKAQ/Wa/G/AQNKTQH6YtgmJ4Ng2MGEO7HsEBflV7TmuEJVQlr22xNsqixnD+QN7zbJIEpmP/blc4XpOGtjrTIUgtbA/xJG9fWoXzFWuUMoK4Q5IhwFbs2qXYlDwwGMuOTqwz5ogrU58ZSRcsZ2llr4ucuf2Gw9ytUtK6tRRPP15YuPW25YziuUJBRL7i/+hQju/5h/Pqplj+nSfOrjfXN4ANv3sAdnTaqpcXr6bzuS+aRgS0OjOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wFb0RLzj; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qsESN/r8; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wFb0RLzj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qsESN/r8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L6r2hrRz3cgW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:36 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fbs+jreI++pzzR3zWEjWTxnX9u6RnqE0RQf6GOU1NY=;
	b=wFb0RLzjRR+m6XuM7TOWlo2yvCJnPhA+25xIrhYVyQU7vW3qK3ogLB5/FoNBtbGXFhaQKY
	pr4aI4RliMtnnHAuihu1YwOpPa1YAFE6NNdNYTDGqtqXIgkvCGwOYClR54N7bodbqmR8ib
	3FR59W6tTyZySeu5nec68ShzfSWdVtepYdrHKuUMyY5PDvLGMSfolpeOUlC1s249oPH+6P
	/nNoPZTWkgEcLEgiFvoUsib1/knAtoR53VJtqoUm2UIq7TEvFyRcp1/WlztCfeuCCPyn1R
	c9ok2s6GcRDtHFeAJPnrNr3pTIJwl25pnQginm0asRgcm/Y3wFJdfZ+h1y1MIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fbs+jreI++pzzR3zWEjWTxnX9u6RnqE0RQf6GOU1NY=;
	b=qsESN/r84WX54Bw78PaDXL3DZH9tinqCzw/9z447eYrhrk5rauDW2NqzQLxz4cWxfapa1Y
	nlSHAbkBNOdd0fAw==
Date: Tue, 12 Aug 2025 07:44:15 +0200
Subject: [PATCH v4 02/24] x86/elf, um/x86/elf: Move relocation constants to
 UAPI
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
Message-Id: <20250812-vdso-absolute-reloc-v4-2-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=6035;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1uMAsIGnLSAarJHPAhyn1ZCQ7+laGQoWKQA2Xxq0mGY=;
 b=LSso+CtnXCvSqq7w3arcGFjj/9JO1wvGscYCVoeDZOhj/IpFN3GTrmCLD7/dVw71XSDOqEtKb
 ryK7StfnfXPByrB7+MMfsCwMUX3kib3KkE19P5uuPZjIm2SN2cxtCaS
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
 arch/x86/include/asm/elf.h | 34 ----------------------------------
 arch/x86/um/asm/elf.h      | 33 ---------------------------------
 include/uapi/linux/elf-r.h | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 67 deletions(-)

diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 6c8fdc96be7e8bd33919d9b56ae8a8a68f4b0c3f..a2538561a84b8dae0479c43238f6f297fe88924b 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -22,19 +22,6 @@ typedef struct user_i387_struct elf_fpregset_t;
 
 #ifdef __i386__
 
-#define R_386_NONE	0
-#define R_386_32	1
-#define R_386_PC32	2
-#define R_386_GOT32	3
-#define R_386_PLT32	4
-#define R_386_COPY	5
-#define R_386_GLOB_DAT	6
-#define R_386_JMP_SLOT	7
-#define R_386_RELATIVE	8
-#define R_386_GOTOFF	9
-#define R_386_GOTPC	10
-#define R_386_NUM	11
-
 /*
  * These are used to set parameters in the core dumps.
  */
@@ -44,27 +31,6 @@ typedef struct user_i387_struct elf_fpregset_t;
 
 #else
 
-/* x86-64 relocation types */
-#define R_X86_64_NONE		0	/* No reloc */
-#define R_X86_64_64		1	/* Direct 64 bit  */
-#define R_X86_64_PC32		2	/* PC relative 32 bit signed */
-#define R_X86_64_GOT32		3	/* 32 bit GOT entry */
-#define R_X86_64_PLT32		4	/* 32 bit PLT address */
-#define R_X86_64_COPY		5	/* Copy symbol at runtime */
-#define R_X86_64_GLOB_DAT	6	/* Create GOT entry */
-#define R_X86_64_JUMP_SLOT	7	/* Create PLT entry */
-#define R_X86_64_RELATIVE	8	/* Adjust by program base */
-#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative offset to GOT */
-#define R_X86_64_GOTPCRELX	41
-#define R_X86_64_REX_GOTPCRELX	42
-#define R_X86_64_32		10	/* Direct 32 bit zero extended */
-#define R_X86_64_32S		11	/* Direct 32 bit sign extended */
-#define R_X86_64_16		12	/* Direct 16 bit zero extended */
-#define R_X86_64_PC16		13	/* 16 bit sign extended pc relative */
-#define R_X86_64_8		14	/* Direct 8 bit sign extended  */
-#define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
-#define R_X86_64_PC64		24	/* Place relative 64-bit signed */
-
 /*
  * These are used to set parameters in the core dumps.
  */
diff --git a/arch/x86/um/asm/elf.h b/arch/x86/um/asm/elf.h
index 62ed5d68a9788ffbf9dd0b4ebbe2caad4ac7a7c6..2e79193f396cda854ab4f17af2cd5b15c1e078cd 100644
--- a/arch/x86/um/asm/elf.h
+++ b/arch/x86/um/asm/elf.h
@@ -12,19 +12,6 @@
 
 #ifdef CONFIG_X86_32
 
-#define R_386_NONE	0
-#define R_386_32	1
-#define R_386_PC32	2
-#define R_386_GOT32	3
-#define R_386_PLT32	4
-#define R_386_COPY	5
-#define R_386_GLOB_DAT	6
-#define R_386_JMP_SLOT	7
-#define R_386_RELATIVE	8
-#define R_386_GOTOFF	9
-#define R_386_GOTPC	10
-#define R_386_NUM	11
-
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
@@ -100,26 +87,6 @@ do {								\
 
 #else
 
-/* x86-64 relocation types, taken from asm-x86_64/elf.h */
-#define R_X86_64_NONE		0	/* No reloc */
-#define R_X86_64_64		1	/* Direct 64 bit  */
-#define R_X86_64_PC32		2	/* PC relative 32 bit signed */
-#define R_X86_64_GOT32		3	/* 32 bit GOT entry */
-#define R_X86_64_PLT32		4	/* 32 bit PLT address */
-#define R_X86_64_COPY		5	/* Copy symbol at runtime */
-#define R_X86_64_GLOB_DAT	6	/* Create GOT entry */
-#define R_X86_64_JUMP_SLOT	7	/* Create PLT entry */
-#define R_X86_64_RELATIVE	8	/* Adjust by program base */
-#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative
-					   offset to GOT */
-#define R_X86_64_32		10	/* Direct 32 bit zero extended */
-#define R_X86_64_32S		11	/* Direct 32 bit sign extended */
-#define R_X86_64_16		12	/* Direct 16 bit zero extended */
-#define R_X86_64_PC16		13	/* 16 bit sign extended pc relative */
-#define R_X86_64_8		14	/* Direct 8 bit sign extended  */
-#define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
-#define R_X86_64_PC64		24	/* Place relative 64-bit signed */
-
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index 2c382c8a4807f394a3ccabf39a81e9e9b6f7ea45..45a160ecf40570f3ac916344be363d7e74908ea6 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -2,4 +2,38 @@
 #ifndef _UAPI_LINUX_ELF_R_H
 #define _UAPI_LINUX_ELF_R_H
 
+/* i386 relocation types */
+#define R_386_NONE	0
+#define R_386_32	1
+#define R_386_PC32	2
+#define R_386_GOT32	3
+#define R_386_PLT32	4
+#define R_386_COPY	5
+#define R_386_GLOB_DAT	6
+#define R_386_JMP_SLOT	7
+#define R_386_RELATIVE	8
+#define R_386_GOTOFF	9
+#define R_386_GOTPC	10
+#define R_386_NUM	11
+
+/* x86-64 relocation types */
+#define R_X86_64_NONE		0	/* No reloc */
+#define R_X86_64_64		1	/* Direct 64 bit  */
+#define R_X86_64_PC32		2	/* PC relative 32 bit signed */
+#define R_X86_64_GOT32		3	/* 32 bit GOT entry */
+#define R_X86_64_PLT32		4	/* 32 bit PLT address */
+#define R_X86_64_COPY		5	/* Copy symbol at runtime */
+#define R_X86_64_GLOB_DAT	6	/* Create GOT entry */
+#define R_X86_64_JUMP_SLOT	7	/* Create PLT entry */
+#define R_X86_64_RELATIVE	8	/* Adjust by program base */
+#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative
+					   offset to GOT */
+#define R_X86_64_32		10	/* Direct 32 bit zero extended */
+#define R_X86_64_32S		11	/* Direct 32 bit sign extended */
+#define R_X86_64_16		12	/* Direct 16 bit zero extended */
+#define R_X86_64_PC16		13	/* 16 bit sign extended pc relative */
+#define R_X86_64_8		14	/* Direct 8 bit sign extended  */
+#define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
+#define R_X86_64_PC64		24	/* Place relative 64-bit signed */
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


