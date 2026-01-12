Return-Path: <linuxppc-dev+bounces-15588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC78D14FEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3m5mKdz3cdy;
	Tue, 13 Jan 2026 06:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245844;
	cv=none; b=BassX7r7kPs7oP7rmLbf+TGYXr9tK8Bvz4JTsZL+tlN0yNJOOuM7X5+DOiF0NknZv9dre7NVlhnfo63n3di3cOJUQauUeCR3XNFaCEpgsPYwy+6t3MhO4Iu4LnGlVqVaHXEE94BAZlN/1IkyjCTJQRwzIELgaINZ+c3CXcDCIpnNZzirv5sE2dEOdjQN77dCGxyqg5/70Ukm18+LIqOCPgbjZcMgIo3EwHuI0VUt45nLgbU3PS266LpUntM14OKckaV48rpWHGcdQB2qbUy0M6DYofsnT47pzlkFTKN6id2S/XvhYZcMU3+HqWIbpIosAI9D3oHN9n3TXaqo1BxcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245844; c=relaxed/relaxed;
	bh=5djnNqR9mAGGTmyuSWB/iuinQG5VStfmD+eHGjn+2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V045HYKQF9dpC/PXzdRaoh89KEg/5C5Ud1MKNCN/3dY82awxSWbRWqJTYSSdetXGmmvAtCPDL88zSiAxbGl9el2RsvwIioAxcMIrgufDPAxjROcbzNC3Rx0eDzS6p0k99Hn9/wpsMn+cEYKWTLEGV5YXs+0/xL4F9viMbk5jBTHsvyieGHP0OssQFLa+s/qCYUUL2rns75X7o3cV2AUrCcRWllXqIaa3VX4R5LIAuPHfdpPIPdJrKXj+naIZ/HxChABfF8Ae0ZuWE1fFxujCLYGJ2IWTDUlyH6Zpob8Da/w75P2EG164j1m5tOX3n4q+7QEgwTfEh0+9JIYiYeXj8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1ZEk5w+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1ZEk5w+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3l2skrz3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:24:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D22354426E;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A24C19425;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245811;
	bh=DiZRFCuoZEbDmo8HTN6yQ9s1ZZanJqRCY5hLsI1JYkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f1ZEk5w+IIz3l2jxL4TbT/+wqxFESp7WOApxHSh1yfq2ClhrqTipgK8Kl1D/VDlj3
	 gOvZp+olVJPGzjxeEWDyjXMG/rqXyj7UxgXx7SM5D8Xqvzt8bpLy6tc0yn7l7Nco2f
	 mqzGsWceQ+aBGFPEPCnszH0qKOXIsquOhvtquv60h94bZ6dsdoynRnAkviLKg6FiHK
	 buh+mIgJsYnjf4ijImB5CZtIrp8Dkfcv59PjfHgMBZ3Rx0Yd6xGxjSeHfNeUJnaUvf
	 G+bobJee6RA74/qKXOApg9u/DYwOkofTekgzvZg9uvfK7XRzA0DcKQ5ValNinStCOe
	 rTMBFc/GVAbww==
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
Subject: [PATCH v2 25/35] crypto: x86/aes-gcm - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:23 -0800
Message-ID: <20260112192035.10427-26-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Since this changes the format of the AES-GCM key structures that are
used by the AES-GCM assembly code, the offsets in the assembly code had
to be updated to match.  Note that the new key structures are smaller,
since the decryption round keys are no longer unnecessarily included.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/aes-gcm-aesni-x86_64.S | 33 +++++++--------
 arch/x86/crypto/aes-gcm-vaes-avx2.S    | 21 +++++-----
 arch/x86/crypto/aes-gcm-vaes-avx512.S  | 25 ++++++-----
 arch/x86/crypto/aesni-intel_glue.c     | 57 +++++++++++---------------
 4 files changed, 67 insertions(+), 69 deletions(-)

diff --git a/arch/x86/crypto/aes-gcm-aesni-x86_64.S b/arch/x86/crypto/aes-gcm-aesni-x86_64.S
index 7c8a8a32bd3c..6b2abb76827e 100644
--- a/arch/x86/crypto/aes-gcm-aesni-x86_64.S
+++ b/arch/x86/crypto/aes-gcm-aesni-x86_64.S
@@ -141,14 +141,15 @@
 .Lzeropad_mask:
 	.octa	0xffffffffffffffffffffffffffffffff
 	.octa	0
 
 // Offsets in struct aes_gcm_key_aesni
-#define OFFSETOF_AESKEYLEN	480
-#define OFFSETOF_H_POWERS	496
-#define OFFSETOF_H_POWERS_XORED	624
-#define OFFSETOF_H_TIMES_X64	688
+#define OFFSETOF_AESKEYLEN	0
+#define OFFSETOF_AESROUNDKEYS	16
+#define OFFSETOF_H_POWERS	272
+#define OFFSETOF_H_POWERS_XORED	400
+#define OFFSETOF_H_TIMES_X64	464
 
 .text
 
 // Do a vpclmulqdq, or fall back to a movdqa and a pclmulqdq.  The fallback
 // assumes that all operands are distinct and that any mem operand is aligned.
@@ -503,13 +504,13 @@
 	.set	H_POW1_X64,	%xmm4	// H^1 * x^64
 	.set	GFPOLY,		%xmm5
 
 	// Encrypt an all-zeroes block to get the raw hash subkey.
 	movl		OFFSETOF_AESKEYLEN(KEY), %eax
-	lea		6*16(KEY,%rax,4), RNDKEYLAST_PTR
-	movdqa		(KEY), H_POW1  // Zero-th round key XOR all-zeroes block
-	lea		16(KEY), %rax
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,%rax,4), RNDKEYLAST_PTR
+	movdqa		OFFSETOF_AESROUNDKEYS(KEY), H_POW1
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rax
 1:
 	aesenc		(%rax), H_POW1
 	add		$16, %rax
 	cmp		%rax, RNDKEYLAST_PTR
 	jne		1b
@@ -622,11 +623,11 @@
 // Increment LE_CTR eight times to generate eight little-endian counter blocks,
 // swap each to big-endian, and store them in AESDATA[0-7].  Also XOR them with
 // the zero-th AES round key.  Clobbers TMP0 and TMP1.
 .macro	_ctr_begin_8x
 	movq		.Lone(%rip), TMP0
-	movdqa		(KEY), TMP1		// zero-th round key
+	movdqa		OFFSETOF_AESROUNDKEYS(KEY), TMP1 // zero-th round key
 .irp i, 0,1,2,3,4,5,6,7
 	_vpshufb	BSWAP_MASK, LE_CTR, AESDATA\i
 	pxor		TMP1, AESDATA\i
 	paddd		TMP0, LE_CTR
 .endr
@@ -724,11 +725,11 @@
 	movdqa		.Lbswap_mask(%rip), BSWAP_MASK
 	movdqu		(GHASH_ACC_PTR), GHASH_ACC
 	movdqu		(LE_CTR_PTR), LE_CTR
 
 	movl		OFFSETOF_AESKEYLEN(KEY), AESKEYLEN
-	lea		6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
 
 	// If there are at least 8*16 bytes of data, then continue into the main
 	// loop, which processes 8*16 bytes of data per iteration.
 	//
 	// The main loop interleaves AES and GHASH to improve performance on
@@ -743,11 +744,11 @@
 	add		$-8*16, DATALEN
 	jl		.Lcrypt_loop_8x_done\@
 .if \enc
 	// Encrypt the first 8 plaintext blocks.
 	_ctr_begin_8x
-	lea		16(KEY), %rsi
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rsi
 	.p2align 4
 1:
 	movdqa		(%rsi), TMP0
 	_aesenc_8x	TMP0
 	add		$16, %rsi
@@ -765,11 +766,11 @@
 	.p2align 4
 .Lcrypt_loop_8x\@:
 
 	// Generate the next set of 8 counter blocks and start encrypting them.
 	_ctr_begin_8x
-	lea		16(KEY), %rsi
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rsi
 
 	// Do a round of AES, and start the GHASH update of 8 ciphertext blocks
 	// by doing the unreduced multiplication for the first ciphertext block.
 	movdqa		(%rsi), TMP0
 	add		$16, %rsi
@@ -867,11 +868,11 @@
 .Lcrypt_loop_1x\@:
 
 	// Encrypt the next counter block.
 	_vpshufb	BSWAP_MASK, LE_CTR, TMP0
 	paddd		ONE, LE_CTR
-	pxor		(KEY), TMP0
+	pxor		OFFSETOF_AESROUNDKEYS(KEY), TMP0
 	lea		-6*16(RNDKEYLAST_PTR), %rsi	// Reduce code size
 	cmp		$24, AESKEYLEN
 	jl		128f	// AES-128?
 	je		192f	// AES-192?
 	// AES-256
@@ -924,12 +925,12 @@
 
 	// Process a partial block of length 1 <= DATALEN <= 15.
 
 	// Encrypt a counter block for the last time.
 	pshufb		BSWAP_MASK, LE_CTR
-	pxor		(KEY), LE_CTR
-	lea		16(KEY), %rsi
+	pxor		OFFSETOF_AESROUNDKEYS(KEY), LE_CTR
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rsi
 1:
 	aesenc		(%rsi), LE_CTR
 	add		$16, %rsi
 	cmp		%rsi, RNDKEYLAST_PTR
 	jne		1b
@@ -1036,16 +1037,16 @@
 	movdqa		OFFSETOF_H_TIMES_X64(KEY), H_POW1_X64
 	movq		.Lgfpoly(%rip), GFPOLY
 
 	// Make %rax point to the 6th from last AES round key.  (Using signed
 	// byte offsets -7*16 through 6*16 decreases code size.)
-	lea		(KEY,AESKEYLEN64,4), %rax
+	lea		OFFSETOF_AESROUNDKEYS(KEY,AESKEYLEN64,4), %rax
 
 	// AES-encrypt the counter block and also multiply GHASH_ACC by H^1.
 	// Interleave the AES and GHASH instructions to improve performance.
 	pshufb		BSWAP_MASK, %xmm0
-	pxor		(KEY), %xmm0
+	pxor		OFFSETOF_AESROUNDKEYS(KEY), %xmm0
 	cmp		$24, AESKEYLEN
 	jl		128f	// AES-128?
 	je		192f	// AES-192?
 	// AES-256
 	aesenc		-7*16(%rax), %xmm0
diff --git a/arch/x86/crypto/aes-gcm-vaes-avx2.S b/arch/x86/crypto/aes-gcm-vaes-avx2.S
index 93c9504a488f..9cc387957fa9 100644
--- a/arch/x86/crypto/aes-gcm-vaes-avx2.S
+++ b/arch/x86/crypto/aes-gcm-vaes-avx2.S
@@ -120,12 +120,13 @@
 	// The number of AES blocks per vector, as a 128-bit value.
 .Linc_2blocks:
 	.octa	2
 
 // Offsets in struct aes_gcm_key_vaes_avx2
-#define OFFSETOF_AESKEYLEN	480
-#define OFFSETOF_H_POWERS	512
+#define OFFSETOF_AESKEYLEN	0
+#define OFFSETOF_AESROUNDKEYS	16
+#define OFFSETOF_H_POWERS	288
 #define NUM_H_POWERS		8
 #define OFFSETOFEND_H_POWERS    (OFFSETOF_H_POWERS + (NUM_H_POWERS * 16))
 #define OFFSETOF_H_POWERS_XORED	OFFSETOFEND_H_POWERS
 
 .text
@@ -238,13 +239,13 @@ SYM_FUNC_START(aes_gcm_precompute_vaes_avx2)
 	.set	GFPOLY,		%ymm6
 	.set	GFPOLY_XMM,	%xmm6
 
 	// Encrypt an all-zeroes block to get the raw hash subkey.
 	movl		OFFSETOF_AESKEYLEN(KEY), %eax
-	lea		6*16(KEY,%rax,4), RNDKEYLAST_PTR
-	vmovdqu		(KEY), H_CUR_XMM  // Zero-th round key XOR all-zeroes block
-	lea		16(KEY), %rax
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,%rax,4), RNDKEYLAST_PTR
+	vmovdqu		OFFSETOF_AESROUNDKEYS(KEY), H_CUR_XMM
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rax
 1:
 	vaesenc		(%rax), H_CUR_XMM, H_CUR_XMM
 	add		$16, %rax
 	cmp		%rax, RNDKEYLAST_PTR
 	jne		1b
@@ -633,11 +634,11 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx2)
 
 // Generate and encrypt counter blocks in the given AESDATA vectors, excluding
 // the last AES round.  Clobbers %rax and TMP0.
 .macro	_aesenc_loop	vecs:vararg
 	_ctr_begin	\vecs
-	lea		16(KEY), %rax
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rax
 .Laesenc_loop\@:
 	vbroadcasti128	(%rax), TMP0
 	_vaesenc	TMP0, \vecs
 	add		$16, %rax
 	cmp		%rax, RNDKEYLAST_PTR
@@ -766,12 +767,12 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx2)
 	movl		OFFSETOF_AESKEYLEN(KEY), AESKEYLEN
 
 	// Make RNDKEYLAST_PTR point to the last AES round key.  This is the
 	// round key with index 10, 12, or 14 for AES-128, AES-192, or AES-256
 	// respectively.  Then load the zero-th and last round keys.
-	lea		6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
-	vbroadcasti128	(KEY), RNDKEY0
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
+	vbroadcasti128	OFFSETOF_AESROUNDKEYS(KEY), RNDKEY0
 	vbroadcasti128	(RNDKEYLAST_PTR), RNDKEYLAST
 
 	// Finish initializing LE_CTR by adding 1 to the second block.
 	vpaddd		.Lctr_pattern(%rip), LE_CTR, LE_CTR
 
@@ -1067,16 +1068,16 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx2)
 .if !\enc
 	movl		8(%rsp), TAGLEN
 .endif
 
 	// Make %rax point to the last AES round key for the chosen AES variant.
-	lea		6*16(KEY,AESKEYLEN64,4), %rax
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,AESKEYLEN64,4), %rax
 
 	// Start the AES encryption of the counter block by swapping the counter
 	// block to big-endian and XOR-ing it with the zero-th AES round key.
 	vpshufb		BSWAP_MASK, LE_CTR, %xmm0
-	vpxor		(KEY), %xmm0, %xmm0
+	vpxor		OFFSETOF_AESROUNDKEYS(KEY), %xmm0, %xmm0
 
 	// Complete the AES encryption and multiply GHASH_ACC by H^1.
 	// Interleave the AES and GHASH instructions to improve performance.
 	cmp		$24, AESKEYLEN
 	jl		128f	// AES-128?
diff --git a/arch/x86/crypto/aes-gcm-vaes-avx512.S b/arch/x86/crypto/aes-gcm-vaes-avx512.S
index 06b71314d65c..516747db4659 100644
--- a/arch/x86/crypto/aes-gcm-vaes-avx512.S
+++ b/arch/x86/crypto/aes-gcm-vaes-avx512.S
@@ -84,14 +84,17 @@
 // Number of powers of the hash key stored in the key struct.  The powers are
 // stored from highest (H^NUM_H_POWERS) to lowest (H^1).
 #define NUM_H_POWERS		16
 
 // Offset to AES key length (in bytes) in the key struct
-#define OFFSETOF_AESKEYLEN	480
+#define OFFSETOF_AESKEYLEN	0
+
+// Offset to AES round keys in the key struct
+#define OFFSETOF_AESROUNDKEYS	16
 
 // Offset to start of hash key powers array in the key struct
-#define OFFSETOF_H_POWERS	512
+#define OFFSETOF_H_POWERS	320
 
 // Offset to end of hash key powers array in the key struct.
 //
 // This is immediately followed by three zeroized padding blocks, which are
 // included so that partial vectors can be handled more easily.  E.g. if two
@@ -299,13 +302,13 @@ SYM_FUNC_START(aes_gcm_precompute_vaes_avx512)
 	// Get pointer to lowest set of key powers (located at end of array).
 	lea		OFFSETOFEND_H_POWERS-64(KEY), POWERS_PTR
 
 	// Encrypt an all-zeroes block to get the raw hash subkey.
 	movl		OFFSETOF_AESKEYLEN(KEY), %eax
-	lea		6*16(KEY,%rax,4), RNDKEYLAST_PTR
-	vmovdqu		(KEY), %xmm0  // Zero-th round key XOR all-zeroes block
-	add		$16, KEY
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,%rax,4), RNDKEYLAST_PTR
+	vmovdqu		OFFSETOF_AESROUNDKEYS(KEY), %xmm0
+	add		$OFFSETOF_AESROUNDKEYS+16, KEY
 1:
 	vaesenc		(KEY), %xmm0, %xmm0
 	add		$16, KEY
 	cmp		KEY, RNDKEYLAST_PTR
 	jne		1b
@@ -788,12 +791,12 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx512)
 	movl		OFFSETOF_AESKEYLEN(KEY), AESKEYLEN
 
 	// Make RNDKEYLAST_PTR point to the last AES round key.  This is the
 	// round key with index 10, 12, or 14 for AES-128, AES-192, or AES-256
 	// respectively.  Then load the zero-th and last round keys.
-	lea		6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
-	vbroadcasti32x4	(KEY), RNDKEY0
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,AESKEYLEN64,4), RNDKEYLAST_PTR
+	vbroadcasti32x4	OFFSETOF_AESROUNDKEYS(KEY), RNDKEY0
 	vbroadcasti32x4	(RNDKEYLAST_PTR), RNDKEYLAST
 
 	// Finish initializing LE_CTR by adding [0, 1, ...] to its low words.
 	vpaddd		.Lctr_pattern(%rip), LE_CTR, LE_CTR
 
@@ -832,11 +835,11 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx512)
 
 .if \enc
 	// Encrypt the first 4 vectors of plaintext blocks.  Leave the resulting
 	// ciphertext in GHASHDATA[0-3] for GHASH.
 	_ctr_begin_4x
-	lea		16(KEY), %rax
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rax
 1:
 	vbroadcasti32x4	(%rax), RNDKEY
 	_vaesenc_4x	RNDKEY
 	add		$16, %rax
 	cmp		%rax, RNDKEYLAST_PTR
@@ -955,11 +958,11 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx512)
 
 	// Encrypt a vector of counter blocks.  This does not need to be masked.
 	vpshufb		BSWAP_MASK, LE_CTR, %zmm0
 	vpaddd		LE_CTR_INC, LE_CTR, LE_CTR
 	vpxord		RNDKEY0, %zmm0, %zmm0
-	lea		16(KEY), %rax
+	lea		OFFSETOF_AESROUNDKEYS+16(KEY), %rax
 1:
 	vbroadcasti32x4	(%rax), RNDKEY
 	vaesenc		RNDKEY, %zmm0, %zmm0
 	add		$16, %rax
 	cmp		%rax, RNDKEYLAST_PTR
@@ -1085,16 +1088,16 @@ SYM_FUNC_END(aes_gcm_aad_update_vaes_avx512)
 	bzhi		TAGLEN, %eax, %eax
 	kmovd		%eax, %k1
 .endif
 
 	// Make %rax point to the last AES round key for the chosen AES variant.
-	lea		6*16(KEY,AESKEYLEN64,4), %rax
+	lea		OFFSETOF_AESROUNDKEYS+6*16(KEY,AESKEYLEN64,4), %rax
 
 	// Start the AES encryption of the counter block by swapping the counter
 	// block to big-endian and XOR-ing it with the zero-th AES round key.
 	vpshufb		BSWAP_MASK, LE_CTR, %xmm0
-	vpxor		(KEY), %xmm0, %xmm0
+	vpxor		OFFSETOF_AESROUNDKEYS(KEY), %xmm0, %xmm0
 
 	// Complete the AES encryption and multiply GHASH_ACC by H^1.
 	// Interleave the AES and GHASH instructions to improve performance.
 	cmp		$24, AESKEYLEN
 	jl		128f	// AES-128?
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 453e0e890041..e6c38d1d8a92 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -778,24 +778,23 @@ DEFINE_AVX_SKCIPHER_ALGS(vaes_avx2, "vaes-avx2", 600);
 DEFINE_AVX_SKCIPHER_ALGS(vaes_avx512, "vaes-avx512", 800);
 
 /* The common part of the x86_64 AES-GCM key struct */
 struct aes_gcm_key {
 	/* Expanded AES key and the AES key length in bytes */
-	struct crypto_aes_ctx aes_key;
+	struct aes_enckey aes_key;
 
 	/* RFC4106 nonce (used only by the rfc4106 algorithms) */
 	u32 rfc4106_nonce;
 };
 
 /* Key struct used by the AES-NI implementations of AES-GCM */
 struct aes_gcm_key_aesni {
 	/*
-	 * Common part of the key.  The assembly code requires 16-byte alignment
-	 * for the round keys; we get this by them being located at the start of
-	 * the struct and the whole struct being 16-byte aligned.
+	 * Common part of the key.  16-byte alignment is required by the
+	 * assembly code.
 	 */
-	struct aes_gcm_key base;
+	struct aes_gcm_key base __aligned(16);
 
 	/*
 	 * Powers of the hash key H^8 through H^1.  These are 128-bit values.
 	 * They all have an extra factor of x^-1 and are byte-reversed.  16-byte
 	 * alignment is required by the assembly code.
@@ -822,14 +821,13 @@ struct aes_gcm_key_aesni {
 
 /* Key struct used by the VAES + AVX2 implementation of AES-GCM */
 struct aes_gcm_key_vaes_avx2 {
 	/*
 	 * Common part of the key.  The assembly code prefers 16-byte alignment
-	 * for the round keys; we get this by them being located at the start of
-	 * the struct and the whole struct being 32-byte aligned.
+	 * for this.
 	 */
-	struct aes_gcm_key base;
+	struct aes_gcm_key base __aligned(16);
 
 	/*
 	 * Powers of the hash key H^8 through H^1.  These are 128-bit values.
 	 * They all have an extra factor of x^-1 and are byte-reversed.
 	 * The assembly code prefers 32-byte alignment for this.
@@ -852,14 +850,13 @@ struct aes_gcm_key_vaes_avx2 {
 
 /* Key struct used by the VAES + AVX512 implementation of AES-GCM */
 struct aes_gcm_key_vaes_avx512 {
 	/*
 	 * Common part of the key.  The assembly code prefers 16-byte alignment
-	 * for the round keys; we get this by them being located at the start of
-	 * the struct and the whole struct being 64-byte aligned.
+	 * for this.
 	 */
-	struct aes_gcm_key base;
+	struct aes_gcm_key base __aligned(16);
 
 	/*
 	 * Powers of the hash key H^16 through H^1.  These are 128-bit values.
 	 * They all have an extra factor of x^-1 and are byte-reversed.  This
 	 * array is aligned to a 64-byte boundary to make it naturally aligned
@@ -1180,30 +1177,30 @@ static int gcm_setkey(struct crypto_aead *tfm, const u8 *raw_key,
 		keylen -= 4;
 		key->rfc4106_nonce = get_unaligned_be32(raw_key + keylen);
 	}
 
 	/* The assembly code assumes the following offsets. */
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, base.aes_key.key_enc) != 0);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, base.aes_key.key_length) != 480);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_powers) != 496);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_powers_xored) != 624);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_aesni, h_times_x64) != 688);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx2, base.aes_key.key_enc) != 0);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx2, base.aes_key.key_length) != 480);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx2, h_powers) != 512);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx2, h_powers_xored) != 640);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx512, base.aes_key.key_enc) != 0);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx512, base.aes_key.key_length) != 480);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx512, h_powers) != 512);
-	BUILD_BUG_ON(offsetof(struct aes_gcm_key_vaes_avx512, padding) != 768);
+	static_assert(offsetof(struct aes_gcm_key_aesni, base.aes_key.len) == 0);
+	static_assert(offsetof(struct aes_gcm_key_aesni, base.aes_key.k.rndkeys) == 16);
+	static_assert(offsetof(struct aes_gcm_key_aesni, h_powers) == 272);
+	static_assert(offsetof(struct aes_gcm_key_aesni, h_powers_xored) == 400);
+	static_assert(offsetof(struct aes_gcm_key_aesni, h_times_x64) == 464);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx2, base.aes_key.len) == 0);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx2, base.aes_key.k.rndkeys) == 16);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx2, h_powers) == 288);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx2, h_powers_xored) == 416);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx512, base.aes_key.len) == 0);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx512, base.aes_key.k.rndkeys) == 16);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx512, h_powers) == 320);
+	static_assert(offsetof(struct aes_gcm_key_vaes_avx512, padding) == 576);
+
+	err = aes_prepareenckey(&key->aes_key, raw_key, keylen);
+	if (err)
+		return err;
 
 	if (likely(crypto_simd_usable())) {
-		err = aes_check_keylen(keylen);
-		if (err)
-			return err;
 		kernel_fpu_begin();
-		aesni_set_key(&key->aes_key, raw_key, keylen);
 		aes_gcm_precompute(key, flags);
 		kernel_fpu_end();
 	} else {
 		static const u8 x_to_the_minus1[16] __aligned(__alignof__(be128)) = {
 			[0] = 0xc2, [15] = 1
@@ -1213,14 +1210,10 @@ static int gcm_setkey(struct crypto_aead *tfm, const u8 *raw_key,
 		};
 		be128 h1 = {};
 		be128 h;
 		int i;
 
-		err = aes_expandkey(&key->aes_key, raw_key, keylen);
-		if (err)
-			return err;
-
 		/* Encrypt the all-zeroes block to get the hash key H^1 */
 		aes_encrypt(&key->aes_key, (u8 *)&h1, (u8 *)&h1);
 
 		/* Compute H^1 * x^-1 */
 		h = h1;
-- 
2.52.0


