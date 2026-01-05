Return-Path: <linuxppc-dev+bounces-15219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A77ACF1E3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YY3Qyyz30HQ;
	Mon, 05 Jan 2026 16:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590112;
	cv=none; b=JEmjHQucEfvADiwK9ZuNmrag6xhZ4+BdYW/bHyPoY3yXZTPie8yEMrThH8fS2g7X+RjzkTxoPAkmpycv8XGmOACROYJ4sA+he+sFjMNtN8qWto4mV4rJfRwbMitg0lRQ1SO7trE9qnbvWWbye7aemDmIx4l/GToOCdlcsw0GrKu+35XGwol+pleanF44u1G4zfIvgtb4OC71oyFUVqhDbk5vKm1FAN5crhjhwCsfqW8iR21XlGIqMfCWZ3Vc0ppCTNaC8S2mSKDfAdRVx6abVHzMFOxPokwDXXcjl+7XY3xB/4zkDXl6k3i/+JfwgdsL9kx52XpFJx9xenjI2B/dPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590112; c=relaxed/relaxed;
	bh=sDkuUaIO7+UaQ7vdr9M7wd85R8p30nUnda7Efvm1jD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkc1v+9yVqMKQVqxLZ4Z8Rvcsw3dmviXAtdjUUFewgaviovtCzOUzX3je6Gr1+ezsxWDEZ3JKeBVnHFIhHwLpo750a49N+Oen2eqTsgEdzkBXeI1Uk8JqC9T6VNtCZfW9cnVOw3UjmQ9CF/sv3i84bmd2z/q+W8TJfcwyJI/f+cmDMeNFwJC1wjFraRE0oC69CPh7pbVLWSTxad4sn2vnZlbuwCH+l4+XmyV2TvI/Y0CVQDfUXcrQF89EUhHIAr0Jl5HbziSaCUt+LspDJoCVfwLFxWrZBtcW6S6gJ3Sm3We+goErkz4Ak09slZE/LbZoA6UTMVMZtJNEGtQIYAM6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P+2+0vK5; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P+2+0vK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YQ4Fgvz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5645442F6;
	Mon,  5 Jan 2026 05:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051BFC2BC86;
	Mon,  5 Jan 2026 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590101;
	bh=KfDU2w1o1kSi4zTwnLVrJtVoyPSYAhLxYrroGbgktP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+2+0vK545Twua5Cy/HZADEL7QBb/ddzBijLu8wOyXjzke/0WZWlRqtiUKqvtMSiX
	 HPa7ppraCJmb5ESgzi2hc2V1nvWymaeDBOdAmZOHV950rTWKbx6jQb0BgNDdWExePa
	 3TO6hp+vtJxNg6bOFiGykGEcrvpPV0emBaZFUrcfGhNcMf7UySzADkFy+SDVP4uuUv
	 MlnEl2yjKHy6XvgPjCC61cWxqIeyxrITEag9/8O7+FhYh6kPkoQPFj9BXgIiTO+pcn
	 1c7EZTV8+31yGlmyFXx2PrK8cp5l1R3dov9LGnd8oETllxQeyb7Ruz3xRuPY5EKTrz
	 I/5wnNw1cPo8Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 17/36] lib/crypto: x86/aes: Add AES-NI optimization
Date: Sun,  4 Jan 2026 21:12:50 -0800
Message-ID: <20260105051311.1607207-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Optimize the AES library with x86 AES-NI instructions.

The relevant existing assembly functions, aesni_set_key(), aesni_enc(),
and aesni_dec(), are a bit difficult to extract into the library:

- They're coupled to the code for the AES modes.
- They operate on struct crypto_aes_ctx.  The AES library now uses
  different structs.
- They assume the key is 16-byte aligned.  The AES library only
  *prefers* 16-byte alignment; it doesn't require it.

Moreover, they're not all that great in the first place:

- They use unrolled loops, which isn't a great choice on x86.
- They use the 'aeskeygenassist' instruction, which is unnecessary, is
  slow on Intel CPUs, and forces the loop to be unrolled.
- They have special code for AES-192 key expansion, despite that being
  kind of useless.  AES-128 and AES-256 are the ones used in practice.

These are small functions anyway.

Therefore, I opted to just write replacements of these functions for the
library.  They address all the above issues.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/Kconfig         |   1 +
 lib/crypto/Makefile        |   1 +
 lib/crypto/x86/aes-aesni.S | 261 +++++++++++++++++++++++++++++++++++++
 lib/crypto/x86/aes.h       |  85 ++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 lib/crypto/x86/aes-aesni.S
 create mode 100644 lib/crypto/x86/aes.h

diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 222887c04240..e3ee31217988 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -19,10 +19,11 @@ config CRYPTO_LIB_AES_ARCH
 	default y if PPC && (SPE || (PPC64 && VSX))
 	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	default y if S390
 	default y if SPARC64
+	default y if X86
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 761d52d91f92..725eef05b758 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -50,10 +50,11 @@ OBJECT_FILES_NON_STANDARD_powerpc/aesp8-ppc.o := y
 endif # !CONFIG_SPE
 endif # CONFIG_PPC
 
 libaes-$(CONFIG_RISCV) += riscv/aes-riscv64-zvkned.o
 libaes-$(CONFIG_SPARC) += sparc/aes_asm.o
+libaes-$(CONFIG_X86) += x86/aes-aesni.o
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
new file mode 100644
index 000000000000..b8c3e104a3be
--- /dev/null
+++ b/lib/crypto/x86/aes-aesni.S
@@ -0,0 +1,261 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+//
+// AES block cipher using AES-NI instructions
+//
+// Copyright 2026 Google LLC
+//
+// The code in this file supports 32-bit and 64-bit CPUs, and it doesn't require
+// AVX.  It does use up to SSE4.1, which all CPUs with AES-NI have.
+#include <linux/linkage.h>
+
+.section .rodata
+#ifdef __x86_64__
+#define RODATA(label)	label(%rip)
+#else
+#define RODATA(label)	label
+#endif
+
+	// A mask for pshufb that extracts the last dword, rotates it right by 8
+	// bits, and copies the result to all four dwords.
+.p2align 4
+.Lmask:
+	.byte	13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15, 12
+
+	// The AES round constants, used during key expansion
+.Lrcon:
+	.long	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
+
+.text
+
+// Transform four dwords [a0, a1, a2, a3] in \a into
+// [a0, a0^a1, a0^a1^a2, a0^a1^a2^a3].  \tmp is a temporary xmm register.
+//
+// Note: this could be done in four instructions, shufps + pxor + shufps + pxor,
+// if the temporary register were zero-initialized ahead of time.  We instead do
+// it in an easier-to-understand way that doesn't require zero-initialization
+// and avoids the unusual shufps instruction.  movdqa is usually "free" anyway.
+.macro	_prefix_sum	a, tmp
+	movdqa		\a, \tmp	// [a0, a1, a2, a3]
+	pslldq		$4, \a		// [0, a0, a1, a2]
+	pxor		\tmp, \a	// [a0, a0^a1, a1^a2, a2^a3]
+	movdqa		\a, \tmp
+	pslldq		$8, \a		// [0, 0, a0, a0^a1]
+	pxor		\tmp, \a	// [a0, a0^a1, a0^a1^a2, a0^a1^a2^a3]
+.endm
+
+.macro	_gen_round_key	a, b
+	// Compute four copies of rcon[i] ^ SubBytes(ror32(w, 8)), where w is
+	// the last dword of the previous round key (given in \b).
+	//
+	// 'aesenclast src, dst' does dst = src XOR SubBytes(ShiftRows(dst)).
+	// It is used here solely for the SubBytes and the XOR.  The ShiftRows
+	// is a no-op because all four columns are the same here.
+	//
+	// Don't use the 'aeskeygenassist' instruction, since:
+	//  - On most Intel CPUs it is microcoded, making it have a much higher
+	//    latency and use more execution ports than 'aesenclast'.
+	//  - It cannot be used in a loop, since it requires an immediate.
+	//  - It doesn't do much more than 'aesenclast' in the first place.
+	movdqa		\b, %xmm2
+	pshufb		MASK, %xmm2
+	aesenclast	RCON, %xmm2
+
+	// XOR in the prefix sum of the four dwords of \a, which is the
+	// previous round key (AES-128) or the first round key in the previous
+	// pair of round keys (AES-256).  The result is the next round key.
+	_prefix_sum	\a, tmp=%xmm3
+	pxor		%xmm2, \a
+
+	// Store the next round key to memory.  Also leave it in \a.
+	movdqu		\a, (RNDKEYS)
+.endm
+
+.macro	_aes_expandkey_aesni	is_aes128
+#ifdef __x86_64__
+	// Arguments
+	.set	RNDKEYS,	%rdi
+	.set	INV_RNDKEYS,	%rsi
+	.set	IN_KEY,		%rdx
+
+	// Other local variables
+	.set	RCON_PTR,	%rcx
+	.set	COUNTER,	%eax
+#else
+	// Arguments, assuming -mregparm=3
+	.set	RNDKEYS,	%eax
+	.set	INV_RNDKEYS,	%edx
+	.set	IN_KEY,		%ecx
+
+	// Other local variables
+	.set	RCON_PTR,	%ebx
+	.set	COUNTER,	%esi
+#endif
+	.set	RCON,		%xmm6
+	.set	MASK,		%xmm7
+
+#ifdef __i386__
+	push		%ebx
+	push		%esi
+#endif
+
+.if \is_aes128
+	// AES-128: the first round key is simply a copy of the raw key.
+	movdqu		(IN_KEY), %xmm0
+	movdqu		%xmm0, (RNDKEYS)
+.else
+	// AES-256: the first two round keys are simply a copy of the raw key.
+	movdqu		(IN_KEY), %xmm0
+	movdqu		%xmm0, (RNDKEYS)
+	movdqu		16(IN_KEY), %xmm1
+	movdqu		%xmm1, 16(RNDKEYS)
+	add		$32, RNDKEYS
+.endif
+
+	// Generate the remaining round keys.
+	movdqa		RODATA(.Lmask), MASK
+.if \is_aes128
+	lea		RODATA(.Lrcon), RCON_PTR
+	mov		$10, COUNTER
+.Lgen_next_aes128_round_key:
+	add		$16, RNDKEYS
+	movd		(RCON_PTR), RCON
+	pshufd		$0x00, RCON, RCON
+	add		$4, RCON_PTR
+	_gen_round_key	%xmm0, %xmm0
+	dec		COUNTER
+	jnz		.Lgen_next_aes128_round_key
+.else
+	// AES-256: only the first 7 round constants are needed, so instead of
+	// loading each one from memory, just start by loading [1, 1, 1, 1] and
+	// then generate the rest by doubling.
+	pshufd		$0x00, RODATA(.Lrcon), RCON
+	pxor		%xmm5, %xmm5	// All-zeroes
+	mov		$7, COUNTER
+.Lgen_next_aes256_round_key_pair:
+	// Generate the next AES-256 round key: either the first of a pair of
+	// two, or the last one.
+	_gen_round_key	%xmm0, %xmm1
+
+	dec		COUNTER
+	jz		.Lgen_aes256_round_keys_done
+
+	// Generate the second AES-256 round key of the pair.  Compared to the
+	// first, there's no rotation and no XOR of a round constant.
+	pshufd		$0xff, %xmm0, %xmm2	// Get four copies of last dword
+	aesenclast	%xmm5, %xmm2		// Just does SubBytes
+	_prefix_sum	%xmm1, tmp=%xmm3
+	pxor		%xmm2, %xmm1
+	movdqu		%xmm1, 16(RNDKEYS)
+	add		$32, RNDKEYS
+	paddd		RCON, RCON		// RCON <<= 1
+	jmp		.Lgen_next_aes256_round_key_pair
+.Lgen_aes256_round_keys_done:
+.endif
+
+	// If INV_RNDKEYS is non-NULL, write the round keys for the Equivalent
+	// Inverse Cipher to it.  To do that, reverse the standard round keys,
+	// and apply aesimc (InvMixColumn) to each except the first and last.
+	test		INV_RNDKEYS, INV_RNDKEYS
+	jz		.Ldone\@
+	movdqu		(RNDKEYS), %xmm0	// Last standard round key
+	movdqu		%xmm0, (INV_RNDKEYS)	// => First inverse round key
+.if \is_aes128
+	mov		$9, COUNTER
+.else
+	mov		$13, COUNTER
+.endif
+.Lgen_next_inv_round_key\@:
+	sub		$16, RNDKEYS
+	add		$16, INV_RNDKEYS
+	movdqu		(RNDKEYS), %xmm0
+	aesimc		%xmm0, %xmm0
+	movdqu		%xmm0, (INV_RNDKEYS)
+	dec		COUNTER
+	jnz		.Lgen_next_inv_round_key\@
+	movdqu		-16(RNDKEYS), %xmm0	// First standard round key
+	movdqu		%xmm0, 16(INV_RNDKEYS)	// => Last inverse round key
+
+.Ldone\@:
+#ifdef __i386__
+	pop		%esi
+	pop		%ebx
+#endif
+	RET
+.endm
+
+// void aes128_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
+//			       const u8 in_key[AES_KEYSIZE_128]);
+SYM_FUNC_START(aes128_expandkey_aesni)
+	_aes_expandkey_aesni	1
+SYM_FUNC_END(aes128_expandkey_aesni)
+
+// void aes256_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
+//			       const u8 in_key[AES_KEYSIZE_256]);
+SYM_FUNC_START(aes256_expandkey_aesni)
+	_aes_expandkey_aesni	0
+SYM_FUNC_END(aes256_expandkey_aesni)
+
+.macro	_aes_crypt_aesni	enc
+#ifdef __x86_64__
+	.set	RNDKEYS,	%rdi
+	.set	NROUNDS,	%esi
+	.set	OUT,		%rdx
+	.set	IN,		%rcx
+#else
+	// Assuming -mregparm=3
+	.set	RNDKEYS,	%eax
+	.set	NROUNDS,	%edx
+	.set	OUT,		%ecx
+	.set	IN,		%ebx	// Passed on stack
+#endif
+
+#ifdef __i386__
+	push		%ebx
+	mov		8(%esp), %ebx
+#endif
+
+	// Zero-th round
+	movdqu		(IN), %xmm0
+	movdqu		(RNDKEYS), %xmm1
+	pxor		%xmm1, %xmm0
+
+	// Normal rounds
+	add		$16, RNDKEYS
+	dec		NROUNDS
+.Lnext_round\@:
+	movdqu		(RNDKEYS), %xmm1
+.if \enc
+	aesenc		%xmm1, %xmm0
+.else
+	aesdec		%xmm1, %xmm0
+.endif
+	add		$16, RNDKEYS
+	dec		NROUNDS
+	jne		.Lnext_round\@
+
+	// Last round
+	movdqu		(RNDKEYS), %xmm1
+.if \enc
+	aesenclast	%xmm1, %xmm0
+.else
+	aesdeclast	%xmm1, %xmm0
+.endif
+	movdqu		%xmm0, (OUT)
+
+#ifdef __i386__
+	pop		%ebx
+#endif
+	RET
+.endm
+
+// void aes_encrypt_aesni(const u32 rndkeys[], int nrounds,
+//			  u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+SYM_FUNC_START(aes_encrypt_aesni)
+	_aes_crypt_aesni	1
+SYM_FUNC_END(aes_encrypt_aesni)
+
+// void aes_decrypt_aesni(const u32 inv_rndkeys[], int nrounds,
+//			  u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+SYM_FUNC_START(aes_decrypt_aesni)
+	_aes_crypt_aesni	0
+SYM_FUNC_END(aes_decrypt_aesni)
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
new file mode 100644
index 000000000000..b047dee94f57
--- /dev/null
+++ b/lib/crypto/x86/aes.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AES block cipher using AES-NI instructions
+ *
+ * Copyright 2026 Google LLC
+ */
+
+#include <asm/fpu/api.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aes);
+
+void aes128_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
+			    const u8 in_key[AES_KEYSIZE_128]);
+void aes256_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
+			    const u8 in_key[AES_KEYSIZE_256]);
+void aes_encrypt_aesni(const u32 rndkeys[], int nrounds,
+		       u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+void aes_decrypt_aesni(const u32 inv_rndkeys[], int nrounds,
+		       u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+
+/*
+ * Expand an AES key using AES-NI if supported and usable or generic code
+ * otherwise.  The expanded key format is compatible between the two cases.  The
+ * outputs are @k->rndkeys (required) and @inv_k->inv_rndkeys (optional).
+ *
+ * We could just always use the generic key expansion code.  AES key expansion
+ * is usually less performance-critical than AES en/decryption.  However,
+ * there's still *some* value in speed here, as well as in non-key-dependent
+ * execution time which AES-NI provides.  So, do use AES-NI to expand AES-128
+ * and AES-256 keys.  (Don't bother with AES-192, as it's almost never used.)
+ */
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	u32 *rndkeys = k->rndkeys;
+	u32 *inv_rndkeys = inv_k ? inv_k->inv_rndkeys : NULL;
+
+	if (static_branch_likely(&have_aes) && key_len != AES_KEYSIZE_192 &&
+	    irq_fpu_usable()) {
+		kernel_fpu_begin();
+		if (key_len == AES_KEYSIZE_128)
+			aes128_expandkey_aesni(rndkeys, inv_rndkeys, in_key);
+		else
+			aes256_expandkey_aesni(rndkeys, inv_rndkeys, in_key);
+		kernel_fpu_end();
+	} else {
+		aes_expandkey_generic(rndkeys, inv_rndkeys, in_key, key_len);
+	}
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (static_branch_likely(&have_aes) && irq_fpu_usable()) {
+		kernel_fpu_begin();
+		aes_encrypt_aesni(key->k.rndkeys, key->nrounds, out, in);
+		kernel_fpu_end();
+	} else {
+		aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+	}
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (static_branch_likely(&have_aes) && irq_fpu_usable()) {
+		kernel_fpu_begin();
+		aes_decrypt_aesni(key->inv_k.inv_rndkeys, key->nrounds,
+				  out, in);
+		kernel_fpu_end();
+	} else {
+		aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds,
+				    out, in);
+	}
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (boot_cpu_has(X86_FEATURE_AES))
+		static_branch_enable(&have_aes);
+}
-- 
2.52.0


