Return-Path: <linuxppc-dev+bounces-10840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B370B21D37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L731yl9z3dKb;
	Tue, 12 Aug 2025 15:44:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977487;
	cv=none; b=agEBj8DVUbXEf5YppNV8uJqMyEf8r6CQpuUWjQizd5z/AdwQif9q0IpUuM6Fzq851IkG6E/fhYF7C96arstf4/Fh8wutkQBxan8B0fMgIkFliD6Wtl4t2IuwQbDgt4pMQ9FnnJTLJlGSFhYz18VAKQfwH8ZZvZClSqPxDwVqgKRmwNSNRb8U/JiSyGAO0YzX+hpvKG5HQUv9Xu5Sa5g5eZFqiIaDOYRxKfq3tfqd/fPDCcUQapp6SAOt3WT4+/Z8pL9vTtLRie2jDsLPkTW+iFr4dHlqy14lqb0Q7iPAig9nFNcqhPAcQiAvQz11dUaWlv3E1s94WBOyy/En1L1XkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977487; c=relaxed/relaxed;
	bh=Y3jF0qEERf/r/b//jNxrrwqzIv8n6c2Hgm8bholRpoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgdqlQ/N4CEEgjR+aDr13EVQj+/V+jGv+AEbsF8tNtujx0ZYs4zQ3XgCQe6dDEX1UwSuo6CuYgv28w60ATKQ6rS9IAeQy+yau2ZCpVLQRsnt9V2La0SQ3TYsoDIDy4cjYvWtJNm3FdDCYqLa+vU6sbXXe01kM3BxQ8kibe0ofkvcb2ZalUSDXUgmL5VZdLEp+eH6adjdTJYCLSc90FDrj1Ol3gDZZOCF+WWsg0AyQmd9e2a7yeBX07S2iU+82zRxotDkVVbHvEi9t5cF5jH7AxkmAzH6cjuzBDuS2bx9WfJoe7Pn2nProovfn65ignG+njvhi0wOQWZUthwbkWX0Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ErB+zE9t; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=B801XOy+; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ErB+zE9t;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=B801XOy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L705TZJz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:44 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3jF0qEERf/r/b//jNxrrwqzIv8n6c2Hgm8bholRpoA=;
	b=ErB+zE9t6s97c8dfFdRIjPsXaRuEy6ttd7+cWE7jMexTP8o1Tj5q30Vw8cn0zXxHIyzzmi
	9KnGF4ypYWwE+iLf0ZbJNzQSwEV92sDCr5K8GKyoiTWxCz1ynyrSTZERBkHgR5tIxVVCCj
	f0m+6PnXQ5zcgqljM/Ef0YHRQ89YHoskqE7oUDK7e+ypsGUU3asVoFmPXnSxa9T2JD8a7W
	Np/Zc7H5ddfU+UXvtm1nvWYAnq/Vnn6sUTTvDGu81ePPqZK+Z2pKKd1+VnENn9rTIMnEf6
	CZY8uopy6ZRgmfvpXlW1Bh6N3kyBO9KIt6zFyUuopwnx/kU0jqBfhlqikPEBBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3jF0qEERf/r/b//jNxrrwqzIv8n6c2Hgm8bholRpoA=;
	b=B801XOy+ZR89pr5YHUtvMAU/kAxovmV90i1Ae34jdmeySzntvouYLq2ivKvR+UZj4pNsWE
	M1iRKp9uTsIQRIAA==
Date: Tue, 12 Aug 2025 07:44:23 +0200
Subject: [PATCH v4 10/24] tools headers UAPI: Sync ELF headers with the
 kernel sources
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
Message-Id: <20250812-vdso-absolute-reloc-v4-10-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=40565;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xxRJ9dMQO64iX3E7DL56qORkwCSl2r+1XVVP7FO9Wxg=;
 b=S4+3/0SEVPgMLw6PKDZP8A9TuB3otBw5IWPlaUKewY3/Ho17CN5wPj3yHF48tifR+sq/s2lWr
 bYZ6O2TPoc6Do3PIjRcVwpnD8rvrOvHqXDIrZ0/Zltqc//j/AqT+tTv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pick up changes from the UAPI ELF header files.
This picks up general changes to elf.h, elf-em.h which was forgotten
previously and the new elf-r.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/uapi/linux/elf-em.h |  71 +++++
 tools/include/uapi/linux/elf-r.h  | 620 ++++++++++++++++++++++++++++++++++++++
 tools/include/uapi/linux/elf.h    | 112 ++++++-
 3 files changed, 792 insertions(+), 11 deletions(-)

diff --git a/tools/include/uapi/linux/elf-em.h b/tools/include/uapi/linux/elf-em.h
new file mode 100644
index 0000000000000000000000000000000000000000..ef38c2bc5ab7a58ba03d309654051b25a2ac2933
--- /dev/null
+++ b/tools/include/uapi/linux/elf-em.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_ELF_EM_H
+#define _LINUX_ELF_EM_H
+
+/* These constants define the various ELF target machines */
+#define EM_NONE		0
+#define EM_M32		1
+#define EM_SPARC	2
+#define EM_386		3
+#define EM_68K		4
+#define EM_88K		5
+#define EM_486		6	/* Perhaps disused */
+#define EM_860		7
+#define EM_MIPS		8	/* MIPS R3000 (officially, big-endian only) */
+				/* Next two are historical and binaries and
+				   modules of these types will be rejected by
+				   Linux.  */
+#define EM_MIPS_RS3_LE	10	/* MIPS R3000 little-endian */
+#define EM_MIPS_RS4_BE	10	/* MIPS R4000 big-endian */
+
+#define EM_PARISC	15	/* HPPA */
+#define EM_SPARC32PLUS	18	/* Sun's "v8plus" */
+#define EM_PPC		20	/* PowerPC */
+#define EM_PPC64	21	 /* PowerPC64 */
+#define EM_SPU		23	/* Cell BE SPU */
+#define EM_ARM		40	/* ARM 32 bit */
+#define EM_SH		42	/* SuperH */
+#define EM_SPARCV9	43	/* SPARC v9 64-bit */
+#define EM_H8_300	46	/* Renesas H8/300 */
+#define EM_IA_64	50	/* HP/Intel IA-64 */
+#define EM_X86_64	62	/* AMD x86-64 */
+#define EM_S390		22	/* IBM S/390 */
+#define EM_CRIS		76	/* Axis Communications 32-bit embedded processor */
+#define EM_M32R		88	/* Renesas M32R */
+#define EM_MN10300	89	/* Panasonic/MEI MN10300, AM33 */
+#define EM_OPENRISC     92     /* OpenRISC 32-bit embedded processor */
+#define EM_ARCOMPACT	93	/* ARCompact processor */
+#define EM_XTENSA	94	/* Tensilica Xtensa Architecture */
+#define EM_BLACKFIN     106     /* ADI Blackfin Processor */
+#define EM_UNICORE	110	/* UniCore-32 */
+#define EM_ALTERA_NIOS2	113	/* Altera Nios II soft-core processor */
+#define EM_TI_C6000	140	/* TI C6X DSPs */
+#define EM_HEXAGON	164	/* QUALCOMM Hexagon */
+#define EM_NDS32	167	/* Andes Technology compact code size
+				   embedded RISC processor family */
+#define EM_AARCH64	183	/* ARM 64 bit */
+#define EM_TILEPRO	188	/* Tilera TILEPro */
+#define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
+#define EM_TILEGX	191	/* Tilera TILE-Gx */
+#define EM_ARCV2	195	/* ARCv2 Cores */
+#define EM_RISCV	243	/* RISC-V */
+#define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
+#define EM_CSKY		252	/* C-SKY */
+#define EM_LOONGARCH	258	/* LoongArch */
+#define EM_FRV		0x5441	/* Fujitsu FR-V */
+
+/*
+ * This is an interim value that we will use until the committee comes
+ * up with a final number.
+ */
+#define EM_ALPHA	0x9026
+
+/* Bogus old m32r magic number, used by old tools. */
+#define EM_CYGNUS_M32R	0x9041
+/* This is the old interim value for S/390 architecture */
+#define EM_S390_OLD	0xA390
+/* Also Panasonic/MEI MN10300, AM33 */
+#define EM_CYGNUS_MN10300 0xbeef
+
+
+#endif /* _LINUX_ELF_EM_H */
diff --git a/tools/include/uapi/linux/elf-r.h b/tools/include/uapi/linux/elf-r.h
new file mode 100644
index 0000000000000000000000000000000000000000..78085d26f4ab27a003fde65c8e981f575f411758
--- /dev/null
+++ b/tools/include/uapi/linux/elf-r.h
@@ -0,0 +1,620 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_ELF_R_H
+#define _UAPI_LINUX_ELF_R_H
+
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
+/* arm relocation types */
+#define R_ARM_NONE		0
+#define R_ARM_PC24		1
+#define R_ARM_ABS32		2
+#define R_ARM_REL32		3
+#define R_ARM_CALL		28
+#define R_ARM_JUMP24		29
+#define R_ARM_TARGET1		38
+#define R_ARM_V4BX		40
+#define R_ARM_PREL31		42
+#define R_ARM_MOVW_ABS_NC	43
+#define R_ARM_MOVT_ABS		44
+#define R_ARM_MOVW_PREL_NC	45
+#define R_ARM_MOVT_PREL		46
+#define R_ARM_ALU_PC_G0_NC	57
+#define R_ARM_ALU_PC_G1_NC	59
+#define R_ARM_LDR_PC_G2		63
+
+#define R_ARM_THM_CALL		10
+#define R_ARM_THM_JUMP24	30
+#define R_ARM_THM_MOVW_ABS_NC	47
+#define R_ARM_THM_MOVT_ABS	48
+#define R_ARM_THM_MOVW_PREL_NC	49
+#define R_ARM_THM_MOVT_PREL	50
+
+/* AArch64 static relocation types */
+
+/* Miscellaneous. */
+#define R_AARCH64_NONE			256
+
+/* Data. */
+#define R_AARCH64_ABS64			257
+#define R_AARCH64_ABS32			258
+#define R_AARCH64_ABS16			259
+#define R_AARCH64_PREL64		260
+#define R_AARCH64_PREL32		261
+#define R_AARCH64_PREL16		262
+
+/* Instructions. */
+#define R_AARCH64_MOVW_UABS_G0		263
+#define R_AARCH64_MOVW_UABS_G0_NC	264
+#define R_AARCH64_MOVW_UABS_G1		265
+#define R_AARCH64_MOVW_UABS_G1_NC	266
+#define R_AARCH64_MOVW_UABS_G2		267
+#define R_AARCH64_MOVW_UABS_G2_NC	268
+#define R_AARCH64_MOVW_UABS_G3		269
+
+#define R_AARCH64_MOVW_SABS_G0		270
+#define R_AARCH64_MOVW_SABS_G1		271
+#define R_AARCH64_MOVW_SABS_G2		272
+
+#define R_AARCH64_LD_PREL_LO19		273
+#define R_AARCH64_ADR_PREL_LO21		274
+#define R_AARCH64_ADR_PREL_PG_HI21	275
+#define R_AARCH64_ADR_PREL_PG_HI21_NC	276
+#define R_AARCH64_ADD_ABS_LO12_NC	277
+#define R_AARCH64_LDST8_ABS_LO12_NC	278
+
+#define R_AARCH64_TSTBR14		279
+#define R_AARCH64_CONDBR19		280
+#define R_AARCH64_JUMP26		282
+#define R_AARCH64_CALL26		283
+#define R_AARCH64_LDST16_ABS_LO12_NC	284
+#define R_AARCH64_LDST32_ABS_LO12_NC	285
+#define R_AARCH64_LDST64_ABS_LO12_NC	286
+#define R_AARCH64_LDST128_ABS_LO12_NC	299
+
+#define R_AARCH64_MOVW_PREL_G0		287
+#define R_AARCH64_MOVW_PREL_G0_NC	288
+#define R_AARCH64_MOVW_PREL_G1		289
+#define R_AARCH64_MOVW_PREL_G1_NC	290
+#define R_AARCH64_MOVW_PREL_G2		291
+#define R_AARCH64_MOVW_PREL_G2_NC	292
+#define R_AARCH64_MOVW_PREL_G3		293
+
+#define R_AARCH64_RELATIVE		1027
+
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
+
+/*
+ * RISC-V relocation types
+ */
+
+/* Relocation types used by the dynamic linker */
+#define R_RISCV_NONE		0
+#define R_RISCV_32		1
+#define R_RISCV_64		2
+#define R_RISCV_RELATIVE	3
+#define R_RISCV_COPY		4
+#define R_RISCV_JUMP_SLOT	5
+#define R_RISCV_TLS_DTPMOD32	6
+#define R_RISCV_TLS_DTPMOD64	7
+#define R_RISCV_TLS_DTPREL32	8
+#define R_RISCV_TLS_DTPREL64	9
+#define R_RISCV_TLS_TPREL32	10
+#define R_RISCV_TLS_TPREL64	11
+#define R_RISCV_IRELATIVE	58
+
+/* Relocation types not used by the dynamic linker */
+#define R_RISCV_BRANCH		16
+#define R_RISCV_JAL		17
+#define R_RISCV_CALL		18
+#define R_RISCV_CALL_PLT	19
+#define R_RISCV_GOT_HI20	20
+#define R_RISCV_TLS_GOT_HI20	21
+#define R_RISCV_TLS_GD_HI20	22
+#define R_RISCV_PCREL_HI20	23
+#define R_RISCV_PCREL_LO12_I	24
+#define R_RISCV_PCREL_LO12_S	25
+#define R_RISCV_HI20		26
+#define R_RISCV_LO12_I		27
+#define R_RISCV_LO12_S		28
+#define R_RISCV_TPREL_HI20	29
+#define R_RISCV_TPREL_LO12_I	30
+#define R_RISCV_TPREL_LO12_S	31
+#define R_RISCV_TPREL_ADD	32
+#define R_RISCV_ADD8		33
+#define R_RISCV_ADD16		34
+#define R_RISCV_ADD32		35
+#define R_RISCV_ADD64		36
+#define R_RISCV_SUB8		37
+#define R_RISCV_SUB16		38
+#define R_RISCV_SUB32		39
+#define R_RISCV_SUB64		40
+#define R_RISCV_GNU_VTINHERIT	41
+#define R_RISCV_GNU_VTENTRY	42
+#define R_RISCV_ALIGN		43
+#define R_RISCV_RVC_BRANCH	44
+#define R_RISCV_RVC_JUMP	45
+#define R_RISCV_GPREL_I		47
+#define R_RISCV_GPREL_S		48
+#define R_RISCV_TPREL_I		49
+#define R_RISCV_TPREL_S		50
+#define R_RISCV_RELAX		51
+#define R_RISCV_SUB6		52
+#define R_RISCV_SET6		53
+#define R_RISCV_SET8		54
+#define R_RISCV_SET16		55
+#define R_RISCV_SET32		56
+#define R_RISCV_32_PCREL	57
+#define R_RISCV_PLT32		59
+#define R_RISCV_SET_ULEB128	60
+#define R_RISCV_SUB_ULEB128	61
+
+/* LoongArch relocation types used by the dynamic linker */
+#define R_LARCH_NONE				0
+#define R_LARCH_32				1
+#define R_LARCH_64				2
+#define R_LARCH_RELATIVE			3
+#define R_LARCH_COPY				4
+#define R_LARCH_JUMP_SLOT			5
+#define R_LARCH_TLS_DTPMOD32			6
+#define R_LARCH_TLS_DTPMOD64			7
+#define R_LARCH_TLS_DTPREL32			8
+#define R_LARCH_TLS_DTPREL64			9
+#define R_LARCH_TLS_TPREL32			10
+#define R_LARCH_TLS_TPREL64			11
+#define R_LARCH_IRELATIVE			12
+#define R_LARCH_MARK_LA				20
+#define R_LARCH_MARK_PCREL			21
+#define R_LARCH_SOP_PUSH_PCREL			22
+#define R_LARCH_SOP_PUSH_ABSOLUTE		23
+#define R_LARCH_SOP_PUSH_DUP			24
+#define R_LARCH_SOP_PUSH_GPREL			25
+#define R_LARCH_SOP_PUSH_TLS_TPREL		26
+#define R_LARCH_SOP_PUSH_TLS_GOT		27
+#define R_LARCH_SOP_PUSH_TLS_GD			28
+#define R_LARCH_SOP_PUSH_PLT_PCREL		29
+#define R_LARCH_SOP_ASSERT			30
+#define R_LARCH_SOP_NOT				31
+#define R_LARCH_SOP_SUB				32
+#define R_LARCH_SOP_SL				33
+#define R_LARCH_SOP_SR				34
+#define R_LARCH_SOP_ADD				35
+#define R_LARCH_SOP_AND				36
+#define R_LARCH_SOP_IF_ELSE			37
+#define R_LARCH_SOP_POP_32_S_10_5		38
+#define R_LARCH_SOP_POP_32_U_10_12		39
+#define R_LARCH_SOP_POP_32_S_10_12		40
+#define R_LARCH_SOP_POP_32_S_10_16		41
+#define R_LARCH_SOP_POP_32_S_10_16_S2		42
+#define R_LARCH_SOP_POP_32_S_5_20		43
+#define R_LARCH_SOP_POP_32_S_0_5_10_16_S2	44
+#define R_LARCH_SOP_POP_32_S_0_10_10_16_S2	45
+#define R_LARCH_SOP_POP_32_U			46
+#define R_LARCH_ADD8				47
+#define R_LARCH_ADD16				48
+#define R_LARCH_ADD24				49
+#define R_LARCH_ADD32				50
+#define R_LARCH_ADD64				51
+#define R_LARCH_SUB8				52
+#define R_LARCH_SUB16				53
+#define R_LARCH_SUB24				54
+#define R_LARCH_SUB32				55
+#define R_LARCH_SUB64				56
+#define R_LARCH_GNU_VTINHERIT			57
+#define R_LARCH_GNU_VTENTRY			58
+#define R_LARCH_B16				64
+#define R_LARCH_B21				65
+#define R_LARCH_B26				66
+#define R_LARCH_ABS_HI20			67
+#define R_LARCH_ABS_LO12			68
+#define R_LARCH_ABS64_LO20			69
+#define R_LARCH_ABS64_HI12			70
+#define R_LARCH_PCALA_HI20			71
+#define R_LARCH_PCALA_LO12			72
+#define R_LARCH_PCALA64_LO20			73
+#define R_LARCH_PCALA64_HI12			74
+#define R_LARCH_GOT_PC_HI20			75
+#define R_LARCH_GOT_PC_LO12			76
+#define R_LARCH_GOT64_PC_LO20			77
+#define R_LARCH_GOT64_PC_HI12			78
+#define R_LARCH_GOT_HI20			79
+#define R_LARCH_GOT_LO12			80
+#define R_LARCH_GOT64_LO20			81
+#define R_LARCH_GOT64_HI12			82
+#define R_LARCH_TLS_LE_HI20			83
+#define R_LARCH_TLS_LE_LO12			84
+#define R_LARCH_TLS_LE64_LO20			85
+#define R_LARCH_TLS_LE64_HI12			86
+#define R_LARCH_TLS_IE_PC_HI20			87
+#define R_LARCH_TLS_IE_PC_LO12			88
+#define R_LARCH_TLS_IE64_PC_LO20		89
+#define R_LARCH_TLS_IE64_PC_HI12		90
+#define R_LARCH_TLS_IE_HI20			91
+#define R_LARCH_TLS_IE_LO12			92
+#define R_LARCH_TLS_IE64_LO20			93
+#define R_LARCH_TLS_IE64_HI12			94
+#define R_LARCH_TLS_LD_PC_HI20			95
+#define R_LARCH_TLS_LD_HI20			96
+#define R_LARCH_TLS_GD_PC_HI20			97
+#define R_LARCH_TLS_GD_HI20			98
+#define R_LARCH_32_PCREL			99
+#define R_LARCH_RELAX				100
+#define R_LARCH_DELETE				101
+#define R_LARCH_ALIGN				102
+#define R_LARCH_PCREL20_S2			103
+#define R_LARCH_CFA				104
+#define R_LARCH_ADD6				105
+#define R_LARCH_SUB6				106
+#define R_LARCH_ADD_ULEB128			107
+#define R_LARCH_SUB_ULEB128			108
+#define R_LARCH_64_PCREL			109
+
+/* s390 relocations defined by the ABIs */
+#define R_390_NONE		0	/* No reloc.  */
+#define R_390_8			1	/* Direct 8 bit.  */
+#define R_390_12		2	/* Direct 12 bit.  */
+#define R_390_16		3	/* Direct 16 bit.  */
+#define R_390_32		4	/* Direct 32 bit.  */
+#define R_390_PC32		5	/* PC relative 32 bit.	*/
+#define R_390_GOT12		6	/* 12 bit GOT offset.  */
+#define R_390_GOT32		7	/* 32 bit GOT offset.  */
+#define R_390_PLT32		8	/* 32 bit PC relative PLT address.  */
+#define R_390_COPY		9	/* Copy symbol at runtime.  */
+#define R_390_GLOB_DAT		10	/* Create GOT entry.  */
+#define R_390_JMP_SLOT		11	/* Create PLT entry.  */
+#define R_390_RELATIVE		12	/* Adjust by program base.  */
+#define R_390_GOTOFF32		13	/* 32 bit offset to GOT.	 */
+#define R_390_GOTPC		14	/* 32 bit PC rel. offset to GOT.  */
+#define R_390_GOT16		15	/* 16 bit GOT offset.  */
+#define R_390_PC16		16	/* PC relative 16 bit.	*/
+#define R_390_PC16DBL		17	/* PC relative 16 bit shifted by 1.  */
+#define R_390_PLT16DBL		18	/* 16 bit PC rel. PLT shifted by 1.  */
+#define R_390_PC32DBL		19	/* PC relative 32 bit shifted by 1.  */
+#define R_390_PLT32DBL		20	/* 32 bit PC rel. PLT shifted by 1.  */
+#define R_390_GOTPCDBL		21	/* 32 bit PC rel. GOT shifted by 1.  */
+#define R_390_64		22	/* Direct 64 bit.  */
+#define R_390_PC64		23	/* PC relative 64 bit.	*/
+#define R_390_GOT64		24	/* 64 bit GOT offset.  */
+#define R_390_PLT64		25	/* 64 bit PC relative PLT address.  */
+#define R_390_GOTENT		26	/* 32 bit PC rel. to GOT entry >> 1. */
+#define R_390_GOTOFF16		27	/* 16 bit offset to GOT. */
+#define R_390_GOTOFF64		28	/* 64 bit offset to GOT. */
+#define R_390_GOTPLT12		29	/* 12 bit offset to jump slot.	*/
+#define R_390_GOTPLT16		30	/* 16 bit offset to jump slot.	*/
+#define R_390_GOTPLT32		31	/* 32 bit offset to jump slot.	*/
+#define R_390_GOTPLT64		32	/* 64 bit offset to jump slot.	*/
+#define R_390_GOTPLTENT		33	/* 32 bit rel. offset to jump slot.  */
+#define R_390_PLTOFF16		34	/* 16 bit offset from GOT to PLT. */
+#define R_390_PLTOFF32		35	/* 32 bit offset from GOT to PLT. */
+#define R_390_PLTOFF64		36	/* 16 bit offset from GOT to PLT. */
+#define R_390_TLS_LOAD		37	/* Tag for load insn in TLS code. */
+#define R_390_TLS_GDCALL	38	/* Tag for function call in general
+                                           dynamic TLS code.  */
+#define R_390_TLS_LDCALL	39	/* Tag for function call in local
+                                           dynamic TLS code.  */
+#define R_390_TLS_GD32		40	/* Direct 32 bit for general dynamic
+                                           thread local data.  */
+#define R_390_TLS_GD64		41	/* Direct 64 bit for general dynamic
+                                           thread local data.  */
+#define R_390_TLS_GOTIE12	42	/* 12 bit GOT offset for static TLS
+                                           block offset.  */
+#define R_390_TLS_GOTIE32	43	/* 32 bit GOT offset for static TLS
+                                           block offset.  */
+#define R_390_TLS_GOTIE64	44	/* 64 bit GOT offset for static TLS
+                                           block offset.  */
+#define R_390_TLS_LDM32		45	/* Direct 32 bit for local dynamic
+                                           thread local data in LD code.  */
+#define R_390_TLS_LDM64		46	/* Direct 64 bit for local dynamic
+                                           thread local data in LD code.  */
+#define R_390_TLS_IE32		47	/* 32 bit address of GOT entry for
+                                           negated static TLS block offset.  */
+#define R_390_TLS_IE64		48	/* 64 bit address of GOT entry for
+                                           negated static TLS block offset.  */
+#define R_390_TLS_IEENT		49	/* 32 bit rel. offset to GOT entry for
+                                           negated static TLS block offset.  */
+#define R_390_TLS_LE32		50	/* 32 bit negated offset relative to
+                                           static TLS block.  */
+#define R_390_TLS_LE64		51	/* 64 bit negated offset relative to
+                                           static TLS block.  */
+#define R_390_TLS_LDO32		52	/* 32 bit offset relative to TLS
+                                           block.  */
+#define R_390_TLS_LDO64		53	/* 64 bit offset relative to TLS
+                                           block.  */
+#define R_390_TLS_DTPMOD	54	/* ID of module containing symbol.  */
+#define R_390_TLS_DTPOFF	55	/* Offset in TLS block.  */
+#define R_390_TLS_TPOFF		56	/* Negate offset in static TLS
+                                           block.  */
+#define R_390_20		57	/* Direct 20 bit.  */
+#define R_390_GOT20		58	/* 20 bit GOT offset.  */
+#define R_390_GOTPLT20		59	/* 20 bit offset to jump slot.  */
+#define R_390_TLS_GOTIE20	60	/* 20 bit GOT offset for static TLS
+					   block offset.  */
+/* Keep this the last entry.  */
+#define R_390_NUM	61
+
+/* MIPS relocations defined by the ABIs */
+#define R_MIPS_NONE		0
+#define R_MIPS_16		1
+#define R_MIPS_32		2
+#define R_MIPS_REL32		3
+#define R_MIPS_26		4
+#define R_MIPS_HI16		5
+#define R_MIPS_LO16		6
+#define R_MIPS_GPREL16		7
+#define R_MIPS_LITERAL		8
+#define R_MIPS_GOT16		9
+#define R_MIPS_PC16		10
+#define R_MIPS_CALL16		11
+#define R_MIPS_GPREL32		12
+/* The remaining relocs are defined on Irix, although they are not
+   in the MIPS ELF ABI.	 */
+#define R_MIPS_UNUSED1		13
+#define R_MIPS_UNUSED2		14
+#define R_MIPS_UNUSED3		15
+#define R_MIPS_SHIFT5		16
+#define R_MIPS_SHIFT6		17
+#define R_MIPS_64		18
+#define R_MIPS_GOT_DISP		19
+#define R_MIPS_GOT_PAGE		20
+#define R_MIPS_GOT_OFST		21
+/*
+ * The following two relocation types are specified in the MIPS ABI
+ * conformance guide version 1.2 but not yet in the psABI.
+ */
+#define R_MIPS_GOTHI16		22
+#define R_MIPS_GOTLO16		23
+#define R_MIPS_SUB		24
+#define R_MIPS_INSERT_A		25
+#define R_MIPS_INSERT_B		26
+#define R_MIPS_DELETE		27
+#define R_MIPS_HIGHER		28
+#define R_MIPS_HIGHEST		29
+/*
+ * The following two relocation types are specified in the MIPS ABI
+ * conformance guide version 1.2 but not yet in the psABI.
+ */
+#define R_MIPS_CALLHI16		30
+#define R_MIPS_CALLLO16		31
+/*
+ * Introduced for MIPSr6.
+ */
+#define R_MIPS_PC21_S2		60
+#define R_MIPS_PC26_S2		61
+/*
+ * This range is reserved for vendor specific relocations.
+ */
+#define R_MIPS_LOVENDOR		100
+#define R_MIPS_HIVENDOR		127
+
+#endif /* _UAPI_LINUX_ELF_R_H */
diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/elf.h
index 5834b83d7f9a41a9d824b3d788ab6ca53b52697c..88bdcbb526c169c946f8fe4a8d0cb57beef3ec0b 100644
--- a/tools/include/uapi/linux/elf.h
+++ b/tools/include/uapi/linux/elf.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/elf-em.h>
+#include <linux/elf-r.h>
 
 /* 32-bit ELF base types. */
 typedef __u32	Elf32_Addr;
@@ -32,9 +33,9 @@ typedef __u16	Elf64_Versym;
 #define PT_NOTE    4
 #define PT_SHLIB   5
 #define PT_PHDR    6
-#define PT_TLS     7		/* Thread local storage segment */
-#define PT_LOOS    0x60000000	/* OS-specific */
-#define PT_HIOS    0x6fffffff	/* OS-specific */
+#define PT_TLS     7               /* Thread local storage segment */
+#define PT_LOOS    0x60000000      /* OS-specific */
+#define PT_HIOS    0x6fffffff      /* OS-specific */
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 #define PT_GNU_EH_FRAME	(PT_LOOS + 0x474e550)
@@ -95,7 +96,7 @@ typedef __u16	Elf64_Versym;
 #define DT_SONAME	14
 #define DT_RPATH	15
 #define DT_SYMBOLIC	16
-#define DT_REL		17
+#define DT_REL	        17
 #define DT_RELSZ	18
 #define DT_RELENT	19
 #define DT_PLTREL	20
@@ -299,8 +300,18 @@ typedef struct elf64_phdr {
 #define SHF_WRITE		0x1
 #define SHF_ALLOC		0x2
 #define SHF_EXECINSTR		0x4
+#define SHF_MERGE		0x10
+#define SHF_STRINGS		0x20
+#define SHF_INFO_LINK		0x40
+#define SHF_LINK_ORDER		0x80
+#define SHF_OS_NONCONFORMING	0x100
+#define SHF_GROUP		0x200
+#define SHF_TLS			0x400
 #define SHF_RELA_LIVEPATCH	0x00100000
 #define SHF_RO_AFTER_INIT	0x00200000
+#define SHF_ORDERED		0x04000000
+#define SHF_EXCLUDE		0x08000000
+#define SHF_MASKOS		0x0ff00000
 #define SHF_MASKPROC		0xf0000000
 
 /* special section indexes */
@@ -312,7 +323,7 @@ typedef struct elf64_phdr {
 #define SHN_ABS		0xfff1
 #define SHN_COMMON	0xfff2
 #define SHN_HIRESERVE	0xffff
-
+ 
 typedef struct elf32_shdr {
   Elf32_Word	sh_name;
   Elf32_Word	sh_type;
@@ -376,101 +387,180 @@ typedef struct elf64_shdr {
 #define ELF_OSABI ELFOSABI_NONE
 #endif
 
+/* Note definitions: NN_ defines names. NT_ defines types. */
+
+#define NN_GNU_PROPERTY_TYPE_0	"GNU"
+#define NT_GNU_PROPERTY_TYPE_0	5
+
 /*
  * Notes used in ET_CORE. Architectures export some of the arch register sets
  * using the corresponding note types via the PTRACE_GETREGSET and
  * PTRACE_SETREGSET requests.
- * The note name for these types is "LINUX", except NT_PRFPREG that is named
- * "CORE".
  */
+#define NN_PRSTATUS	"CORE"
 #define NT_PRSTATUS	1
+#define NN_PRFPREG	"CORE"
 #define NT_PRFPREG	2
+#define NN_PRPSINFO	"CORE"
 #define NT_PRPSINFO	3
+#define NN_TASKSTRUCT	"CORE"
 #define NT_TASKSTRUCT	4
+#define NN_AUXV		"CORE"
 #define NT_AUXV		6
 /*
  * Note to userspace developers: size of NT_SIGINFO note may increase
  * in the future to accomodate more fields, don't assume it is fixed!
  */
+#define NN_SIGINFO      "CORE"
 #define NT_SIGINFO      0x53494749
-#define NT_FILE		0x46494c45
+#define NN_FILE         "CORE"
+#define NT_FILE         0x46494c45
+#define NN_PRXFPREG     "LINUX"
 #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
+#define NN_PPC_VMX	"LINUX"
 #define NT_PPC_VMX	0x100		/* PowerPC Altivec/VMX registers */
+#define NN_PPC_SPE	"LINUX"
 #define NT_PPC_SPE	0x101		/* PowerPC SPE/EVR registers */
+#define NN_PPC_VSX	"LINUX"
 #define NT_PPC_VSX	0x102		/* PowerPC VSX registers */
+#define NN_PPC_TAR	"LINUX"
 #define NT_PPC_TAR	0x103		/* Target Address Register */
+#define NN_PPC_PPR	"LINUX"
 #define NT_PPC_PPR	0x104		/* Program Priority Register */
+#define NN_PPC_DSCR	"LINUX"
 #define NT_PPC_DSCR	0x105		/* Data Stream Control Register */
+#define NN_PPC_EBB	"LINUX"
 #define NT_PPC_EBB	0x106		/* Event Based Branch Registers */
+#define NN_PPC_PMU	"LINUX"
 #define NT_PPC_PMU	0x107		/* Performance Monitor Registers */
+#define NN_PPC_TM_CGPR	"LINUX"
 #define NT_PPC_TM_CGPR	0x108		/* TM checkpointed GPR Registers */
+#define NN_PPC_TM_CFPR	"LINUX"
 #define NT_PPC_TM_CFPR	0x109		/* TM checkpointed FPR Registers */
+#define NN_PPC_TM_CVMX	"LINUX"
 #define NT_PPC_TM_CVMX	0x10a		/* TM checkpointed VMX Registers */
+#define NN_PPC_TM_CVSX	"LINUX"
 #define NT_PPC_TM_CVSX	0x10b		/* TM checkpointed VSX Registers */
+#define NN_PPC_TM_SPR	"LINUX"
 #define NT_PPC_TM_SPR	0x10c		/* TM Special Purpose Registers */
+#define NN_PPC_TM_CTAR	"LINUX"
 #define NT_PPC_TM_CTAR	0x10d		/* TM checkpointed Target Address Register */
+#define NN_PPC_TM_CPPR	"LINUX"
 #define NT_PPC_TM_CPPR	0x10e		/* TM checkpointed Program Priority Register */
+#define NN_PPC_TM_CDSCR	"LINUX"
 #define NT_PPC_TM_CDSCR	0x10f		/* TM checkpointed Data Stream Control Register */
+#define NN_PPC_PKEY	"LINUX"
 #define NT_PPC_PKEY	0x110		/* Memory Protection Keys registers */
+#define NN_PPC_DEXCR	"LINUX"
 #define NT_PPC_DEXCR	0x111		/* PowerPC DEXCR registers */
+#define NN_PPC_HASHKEYR	"LINUX"
 #define NT_PPC_HASHKEYR	0x112		/* PowerPC HASHKEYR register */
+#define NN_386_TLS	"LINUX"
 #define NT_386_TLS	0x200		/* i386 TLS slots (struct user_desc) */
+#define NN_386_IOPERM	"LINUX"
 #define NT_386_IOPERM	0x201		/* x86 io permission bitmap (1=deny) */
+#define NN_X86_XSTATE	"LINUX"
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
 /* Old binutils treats 0x203 as a CET state */
+#define NN_X86_SHSTK	"LINUX"
 #define NT_X86_SHSTK	0x204		/* x86 SHSTK state */
+#define NN_X86_XSAVE_LAYOUT	"LINUX"
 #define NT_X86_XSAVE_LAYOUT	0x205	/* XSAVE layout description */
+#define NN_S390_HIGH_GPRS	"LINUX"
 #define NT_S390_HIGH_GPRS	0x300	/* s390 upper register halves */
+#define NN_S390_TIMER	"LINUX"
 #define NT_S390_TIMER	0x301		/* s390 timer register */
+#define NN_S390_TODCMP	"LINUX"
 #define NT_S390_TODCMP	0x302		/* s390 TOD clock comparator register */
+#define NN_S390_TODPREG	"LINUX"
 #define NT_S390_TODPREG	0x303		/* s390 TOD programmable register */
+#define NN_S390_CTRS	"LINUX"
 #define NT_S390_CTRS	0x304		/* s390 control registers */
+#define NN_S390_PREFIX	"LINUX"
 #define NT_S390_PREFIX	0x305		/* s390 prefix register */
+#define NN_S390_LAST_BREAK	"LINUX"
 #define NT_S390_LAST_BREAK	0x306	/* s390 breaking event address */
+#define NN_S390_SYSTEM_CALL	"LINUX"
 #define NT_S390_SYSTEM_CALL	0x307	/* s390 system call restart data */
+#define NN_S390_TDB	"LINUX"
 #define NT_S390_TDB	0x308		/* s390 transaction diagnostic block */
+#define NN_S390_VXRS_LOW	"LINUX"
 #define NT_S390_VXRS_LOW	0x309	/* s390 vector registers 0-15 upper half */
+#define NN_S390_VXRS_HIGH	"LINUX"
 #define NT_S390_VXRS_HIGH	0x30a	/* s390 vector registers 16-31 */
+#define NN_S390_GS_CB	"LINUX"
 #define NT_S390_GS_CB	0x30b		/* s390 guarded storage registers */
+#define NN_S390_GS_BC	"LINUX"
 #define NT_S390_GS_BC	0x30c		/* s390 guarded storage broadcast control block */
+#define NN_S390_RI_CB	"LINUX"
 #define NT_S390_RI_CB	0x30d		/* s390 runtime instrumentation */
+#define NN_S390_PV_CPU_DATA	"LINUX"
 #define NT_S390_PV_CPU_DATA	0x30e	/* s390 protvirt cpu dump data */
+#define NN_ARM_VFP	"LINUX"
 #define NT_ARM_VFP	0x400		/* ARM VFP/NEON registers */
+#define NN_ARM_TLS	"LINUX"
 #define NT_ARM_TLS	0x401		/* ARM TLS register */
+#define NN_ARM_HW_BREAK	"LINUX"
 #define NT_ARM_HW_BREAK	0x402		/* ARM hardware breakpoint registers */
+#define NN_ARM_HW_WATCH	"LINUX"
 #define NT_ARM_HW_WATCH	0x403		/* ARM hardware watchpoint registers */
+#define NN_ARM_SYSTEM_CALL	"LINUX"
 #define NT_ARM_SYSTEM_CALL	0x404	/* ARM system call number */
+#define NN_ARM_SVE	"LINUX"
 #define NT_ARM_SVE	0x405		/* ARM Scalable Vector Extension registers */
+#define NN_ARM_PAC_MASK		"LINUX"
 #define NT_ARM_PAC_MASK		0x406	/* ARM pointer authentication code masks */
+#define NN_ARM_PACA_KEYS	"LINUX"
 #define NT_ARM_PACA_KEYS	0x407	/* ARM pointer authentication address keys */
+#define NN_ARM_PACG_KEYS	"LINUX"
 #define NT_ARM_PACG_KEYS	0x408	/* ARM pointer authentication generic key */
+#define NN_ARM_TAGGED_ADDR_CTRL	"LINUX"
 #define NT_ARM_TAGGED_ADDR_CTRL	0x409	/* arm64 tagged address control (prctl()) */
+#define NN_ARM_PAC_ENABLED_KEYS	"LINUX"
 #define NT_ARM_PAC_ENABLED_KEYS	0x40a	/* arm64 ptr auth enabled keys (prctl()) */
+#define NN_ARM_SSVE	"LINUX"
 #define NT_ARM_SSVE	0x40b		/* ARM Streaming SVE registers */
+#define NN_ARM_ZA	"LINUX"
 #define NT_ARM_ZA	0x40c		/* ARM SME ZA registers */
+#define NN_ARM_ZT	"LINUX"
 #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
+#define NN_ARM_FPMR	"LINUX"
 #define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
+#define NN_ARM_POE	"LINUX"
 #define NT_ARM_POE	0x40f		/* ARM POE registers */
+#define NN_ARM_GCS	"LINUX"
 #define NT_ARM_GCS	0x410		/* ARM GCS state */
+#define NN_ARC_V2	"LINUX"
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
+#define NN_VMCOREDD	"LINUX"
 #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
+#define NN_MIPS_DSP	"LINUX"
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
+#define NN_MIPS_FP_MODE	"LINUX"
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
+#define NN_MIPS_MSA	"LINUX"
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NN_RISCV_CSR	"LINUX"
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
+#define NN_RISCV_VECTOR	"LINUX"
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
+#define NN_RISCV_TAGGED_ADDR_CTRL "LINUX"
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NN_LOONGARCH_CPUCFG	"LINUX"
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
+#define NN_LOONGARCH_CSR	"LINUX"
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
+#define NN_LOONGARCH_LSX	"LINUX"
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
+#define NN_LOONGARCH_LASX	"LINUX"
 #define NT_LOONGARCH_LASX	0xa03	/* LoongArch Loongson Advanced SIMD Extension registers */
+#define NN_LOONGARCH_LBT	"LINUX"
 #define NT_LOONGARCH_LBT	0xa04	/* LoongArch Loongson Binary Translation registers */
+#define NN_LOONGARCH_HW_BREAK	"LINUX"
 #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
+#define NN_LOONGARCH_HW_WATCH	"LINUX"
 #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
 
-/* Note types with note name "GNU" */
-#define NT_GNU_PROPERTY_TYPE_0	5
-
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
   Elf32_Word	n_namesz;	/* Name size */

-- 
2.50.1


