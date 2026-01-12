Return-Path: <linuxppc-dev+bounces-15577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A432D14F7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3Y0XfWz3bp0;
	Tue, 13 Jan 2026 06:23:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245832;
	cv=none; b=A/5srSlTdSYO6rX6JPKRuNT9ZIekc4KnbQLscqcr8cS8+XhSa2Ss6weeildKIJG9G1OkuyT/EBxfhloockEM3ZW3KHJtnrL+WL1Se+QjMc1uerKwhe8bd3to1VAz2bbwB6Y3dKP8oJVgZZcrnQJipXaLnTq0LGdtG+pB2I75zgtR8pQ1U2glISrR/8njtuPjuTMeJQkXcSwg+Ix3WLPbsiRXBlL4o0CjhmqQ+9hQhLPAjyGX119CI+zEVHUyblm9X+e3Zfg8LfJwXgL9iEwB3IptLBMkGhZM2BdHUESyLW3CKzN7LSKlnlMIF5nJT/XAXuh64otvMI4gJ9clbZSAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245832; c=relaxed/relaxed;
	bh=AA1NCVt2V0rpl6BaqB7EoiD0n8ZmsE2SaLK3XFGW9XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSscXdNJZ59Rr+Iy/s4CyK8jy/nh0NtHdRBBANodGCs/fbbBnArVwleiRq2M6kuSgwgXUqwhkT60HBg7Mk2Dwqx3LGfQhE/u0TlgJ+mHIBZTxrP2YEB7zljJBVtRLyoYQDN5htTQr14SN48q+Hl8ak0im66NpSROy0vYsrKpTi95zW6Kp6gzf9vEUbX7gofPdcCvMDGR/7RSpxAxhI3MFd+4Fwj4gUgCRuehG2vd6wORGEdfx7yqg5qdJ3TuPPfbpK1MXYeGv2+akp0hg2gj6ClobTJO3Ryaea8O6MwU3/yj98dWKEhzfokfFXP9HHJc2Rvnt8xtry7I0Qun2YG6ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpvdVmF4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpvdVmF4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3W2vLKz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3102060051;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CE5C2BC86;
	Mon, 12 Jan 2026 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245798;
	bh=p4ecLxqGxoblVFXBlv9wFmcXn8PSYdygfhvo28J5HNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LpvdVmF4/0I/ZapvM7HXcdj05jDaK/5jl0+SfjKEqSmqfQD2+Xoj8e9xriX6QrYkq
	 G8+JZbTAP+PBjAP1AMV6vScHocdx29CZEasqSMiZW53Om5nU6UnWAPyEtKkMpTR4lm
	 /LQKQFFLld1V2mtM2Rt8C6aAuB5+tE4vd8DUoWL7UvhCtXcyHODyRL/bVQJtnTzGMa
	 OlBIRzm8UJGC4ZLUolUrYdD0ua35nxoPkhVhF8MeCjDCNf9sHMx3nyQUqC+WUumj8F
	 t1v3sdNpOaA4wVqOo76Xwizw5aHp8PJNqBPCNvMtbcd5zBcYfw01TAcu4LmD4Ld0HF
	 Ms9I5yGZebxxw==
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
Subject: [PATCH v2 02/35] lib/crypto: aes: Introduce improved AES library
Date: Mon, 12 Jan 2026 11:20:00 -0800
Message-ID: <20260112192035.10427-3-ebiggers@kernel.org>
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

The kernel's AES library currently has the following issues:

- It doesn't take advantage of the architecture-optimized AES code,
  including the implementations using AES instructions.

- It's much slower than even the other software AES implementations: 2-4
  times slower than "aes-generic", "aes-arm", and "aes-arm64".

- It requires that both the encryption and decryption round keys be
  computed and cached.  This is wasteful for users that need only the
  forward (encryption) direction of the cipher: the key struct is 484
  bytes when only 244 are actually needed.  This missed optimization is
  very common, as many AES modes (e.g. GCM, CFB, CTR, CMAC, and even the
  tweak key in XTS) use the cipher only in the forward (encryption)
  direction even when doing decryption.

- It doesn't provide the flexibility to customize the prepared key
  format.  The API is defined to do key expansion, and several callers
  in drivers/crypto/ use it specifically to expand the key.  This is an
  issue when integrating the existing powerpc, s390, and sparc code,
  which is necessary to provide full parity with the traditional API.

To resolve these issues, I'm proposing the following changes:

1. New structs 'aes_key' and 'aes_enckey' are introduced, with
   corresponding functions aes_preparekey() and aes_prepareenckey().

   Generally these structs will include the encryption+decryption round
   keys and the encryption round keys, respectively.  However, the exact
   format will be under control of the architecture-specific AES code.

   (The verb "prepare" is chosen over "expand" since key expansion isn't
   necessarily done.  It's also consistent with hmac*_preparekey().)

2. aes_encrypt() and aes_decrypt() will be changed to operate on the new
   structs instead of struct crypto_aes_ctx.

3. aes_encrypt() and aes_decrypt() will use architecture-optimized code
   when available, or else fall back to a new generic AES implementation
   that unifies the existing two fragmented generic AES implementations.

   The new generic AES implementation uses tables for both SubBytes and
   MixColumns, making it almost as fast as "aes-generic".  However,
   instead of aes-generic's huge 8192-byte tables per direction, it uses
   only 1024 bytes for encryption and 1280 bytes for decryption (similar
   to "aes-arm").  The cost is just some extra rotations.

   The new generic AES implementation also includes table prefetching,
   making it have some "constant-time hardening".  That's an improvement
   from aes-generic which has no constant-time hardening.

   It does slightly regress in constant-time hardening vs. the old
   lib/crypto/aes.c which had smaller tables, and from aes-fixed-time
   which disabled IRQs on top of that.  But I think this is tolerable.
   The real solutions for constant-time AES are AES instructions or
   bit-slicing.  The table-based code remains a best-effort fallback for
   the increasingly-rare case where a real solution is unavailable.

4. crypto_aes_ctx and aes_expandkey() will remain for now, but only for
   callers that are using them specifically for the AES key expansion
   (as opposed to en/decrypting data with the AES library).

This commit begins the migration process by introducing the new structs
and functions, backed by the new generic AES implementation.

To allow callers to be incrementally converted, aes_encrypt() and
aes_decrypt() are temporarily changed into macros that use a _Generic
expression to call either the old functions (which take crypto_aes_ctx)
or the new functions (which take the new types).  Once all callers have
been updated, these macros will go away, the old functions will be
removed, and the "_new" suffix will be dropped from the new functions.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/aes.h | 157 +++++++++++++++--
 lib/crypto/Kconfig   |   4 +
 lib/crypto/Makefile  |  11 +-
 lib/crypto/aes.c     | 399 ++++++++++++++++++++++++++++++++++++-------
 4 files changed, 501 insertions(+), 70 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 9339da7c20a8..e8b83d4849fe 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -16,10 +16,64 @@
 #define AES_KEYSIZE_256		32
 #define AES_BLOCK_SIZE		16
 #define AES_MAX_KEYLENGTH	(15 * 16)
 #define AES_MAX_KEYLENGTH_U32	(AES_MAX_KEYLENGTH / sizeof(u32))
 
+union aes_enckey_arch {
+	u32 rndkeys[AES_MAX_KEYLENGTH_U32];
+};
+
+union aes_invkey_arch {
+	u32 inv_rndkeys[AES_MAX_KEYLENGTH_U32];
+};
+
+/**
+ * struct aes_enckey - An AES key prepared for encryption
+ * @len: Key length in bytes: 16 for AES-128, 24 for AES-192, 32 for AES-256.
+ * @nrounds: Number of rounds: 10 for AES-128, 12 for AES-192, 14 for AES-256.
+ *	     This is '6 + @len / 4' and is cached so that AES implementations
+ *	     that need it don't have to recompute it for each en/decryption.
+ * @padding: Padding to make offsetof(@k) be a multiple of 16, so that aligning
+ *	     this struct to a 16-byte boundary results in @k also being 16-byte
+ *	     aligned.  Users aren't required to align this struct to 16 bytes,
+ *	     but it may slightly improve performance.
+ * @k: This typically contains the AES round keys as an array of '@nrounds + 1'
+ *     groups of four u32 words.  However, architecture-specific implementations
+ *     of AES may store something else here, e.g. just the raw key if it's all
+ *     they need.
+ *
+ * Note that this struct is about half the size of struct aes_key.  This is
+ * separate from struct aes_key so that modes that need only AES encryption
+ * (e.g. AES-GCM, AES-CTR, AES-CMAC, tweak key in AES-XTS) don't incur the time
+ * and space overhead of computing and caching the decryption round keys.
+ *
+ * Note that there's no decryption-only equivalent (i.e. "struct aes_deckey"),
+ * since (a) it's rare that modes need decryption-only, and (b) some AES
+ * implementations use the same @k for both encryption and decryption, either
+ * always or conditionally; in the latter case both @k and @inv_k are needed.
+ */
+struct aes_enckey {
+	u32 len;
+	u32 nrounds;
+	u32 padding[2];
+	union aes_enckey_arch k;
+};
+
+/**
+ * struct aes_key - An AES key prepared for encryption and decryption
+ * @aes_enckey: Common fields and the key prepared for encryption
+ * @inv_k: This generally contains the round keys for the AES Equivalent
+ *	   Inverse Cipher, as an array of '@nrounds + 1' groups of four u32
+ *	   words.  However, architecture-specific implementations of AES may
+ *	   store something else here.  For example, they may leave this field
+ *	   uninitialized if they use @k for both encryption and decryption.
+ */
+struct aes_key {
+	struct aes_enckey; /* Include all fields of aes_enckey. */
+	union aes_invkey_arch inv_k;
+};
+
 /*
  * Please ensure that the first two fields are 16-byte aligned
  * relative to the start of the structure, i.e., don't move them!
  */
 struct crypto_aes_ctx {
@@ -32,11 +86,11 @@ extern const u32 crypto_ft_tab[4][256] ____cacheline_aligned;
 extern const u32 crypto_it_tab[4][256] ____cacheline_aligned;
 
 /*
  * validate key length for AES algorithms
  */
-static inline int aes_check_keylen(unsigned int keylen)
+static inline int aes_check_keylen(size_t keylen)
 {
 	switch (keylen) {
 	case AES_KEYSIZE_128:
 	case AES_KEYSIZE_192:
 	case AES_KEYSIZE_256:
@@ -67,27 +121,108 @@ int crypto_aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
  */
 int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 		  unsigned int key_len);
 
 /**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
+ * aes_preparekey() - Prepare an AES key for encryption and decryption
+ * @key: (output) The key structure to initialize
+ * @in_key: The raw AES key
+ * @key_len: Length of the raw key in bytes.  Should be either AES_KEYSIZE_128,
+ *	     AES_KEYSIZE_192, or AES_KEYSIZE_256.
+ *
+ * This prepares an AES key for both the encryption and decryption directions of
+ * the block cipher.  Typically this involves expanding the raw key into both
+ * the standard round keys and the Equivalent Inverse Cipher round keys, but
+ * some architecture-specific implementations don't do the full expansion here.
+ *
+ * The caller is responsible for zeroizing both the struct aes_key and the raw
+ * key once they are no longer needed.
+ *
+ * If you don't need decryption support, use aes_prepareenckey() instead.
+ *
+ * Return: 0 on success or -EINVAL if the given key length is invalid.  No other
+ *	   errors are possible, so callers that always pass a valid key length
+ *	   don't need to check for errors.
+ *
+ * Context: Any context.
+ */
+int aes_preparekey(struct aes_key *key, const u8 *in_key, size_t key_len);
+
+/**
+ * aes_prepareenckey() - Prepare an AES key for encryption-only
+ * @key: (output) The key structure to initialize
+ * @in_key: The raw AES key
+ * @key_len: Length of the raw key in bytes.  Should be either AES_KEYSIZE_128,
+ *	     AES_KEYSIZE_192, or AES_KEYSIZE_256.
+ *
+ * This prepares an AES key for only the encryption direction of the block
+ * cipher.  Typically this involves expanding the raw key into only the standard
+ * round keys, resulting in a struct about half the size of struct aes_key.
+ *
+ * The caller is responsible for zeroizing both the struct aes_enckey and the
+ * raw key once they are no longer needed.
+ *
+ * Note that while the resulting prepared key supports only AES encryption, it
+ * can still be used for decrypting in a mode of operation that uses AES in only
+ * the encryption (forward) direction, for example counter mode.
+ *
+ * Return: 0 on success or -EINVAL if the given key length is invalid.  No other
+ *	   errors are possible, so callers that always pass a valid key length
+ *	   don't need to check for errors.
+ *
+ * Context: Any context.
+ */
+int aes_prepareenckey(struct aes_enckey *key, const u8 *in_key, size_t key_len);
+
+typedef union {
+	const struct aes_enckey *enc_key;
+	const struct aes_key *full_key;
+} aes_encrypt_arg __attribute__ ((__transparent_union__));
+
+/**
+ * aes_encrypt() - Encrypt a single AES block
+ * @key: The AES key, as a pointer to either an encryption-only key
+ *	 (struct aes_enckey) or a full, bidirectional key (struct aes_key).
+ * @out: Buffer to store the ciphertext block
+ * @in: Buffer containing the plaintext block
+ *
+ * Context: Any context.
  */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
+#define aes_encrypt(key, out, in) \
+	_Generic((key), \
+		 struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)(key), (out), (in)), \
+		 const struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)(key), (out), (in)), \
+		 struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)(key), (out), (in)), \
+		 const struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)(key), (out), (in)), \
+		 struct aes_key *: aes_encrypt_new((const struct aes_key *)(key), (out), (in)), \
+		 const struct aes_key *: aes_encrypt_new((const struct aes_key *)(key), (out), (in)))
+void aes_encrypt_old(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
+void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
+		     const u8 in[at_least AES_BLOCK_SIZE]);
 
 /**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
+ * aes_decrypt() - Decrypt a single AES block
+ * @key: The AES key, previously initialized by aes_preparekey()
+ * @out: Buffer to store the plaintext block
+ * @in: Buffer containing the ciphertext block
+ *
+ * Context: Any context.
  */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
+#define aes_decrypt(key, out, in) \
+	_Generic((key), \
+		 struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)(key), (out), (in)), \
+		 const struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)(key), (out), (in)), \
+		 struct aes_key *: aes_decrypt_new((const struct aes_key *)(key), (out), (in)), \
+		 const struct aes_key *: aes_decrypt_new((const struct aes_key *)(key), (out), (in)))
+void aes_decrypt_old(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
+void aes_decrypt_new(const struct aes_key *key, u8 out[at_least AES_BLOCK_SIZE],
+		     const u8 in[at_least AES_BLOCK_SIZE]);
 
 extern const u8 crypto_aes_sbox[];
 extern const u8 crypto_aes_inv_sbox[];
+extern const u32 aes_enc_tab[256];
+extern const u32 aes_dec_tab[256];
 
 void aescfb_encrypt(const struct crypto_aes_ctx *ctx, u8 *dst, const u8 *src,
 		    int len, const u8 iv[AES_BLOCK_SIZE]);
 void aescfb_decrypt(const struct crypto_aes_ctx *ctx, u8 *dst, const u8 *src,
 		    int len, const u8 iv[AES_BLOCK_SIZE]);
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 781a42c5c572..4efad77daa24 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -9,10 +9,14 @@ config CRYPTO_LIB_UTILS
 	tristate
 
 config CRYPTO_LIB_AES
 	tristate
 
+config CRYPTO_LIB_AES_ARCH
+	bool
+	depends on CRYPTO_LIB_AES && !UML && !KMSAN
+
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
 
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 45128eccedef..01193b3f47ba 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -13,12 +13,19 @@ obj-$(CONFIG_KUNIT)				+= tests/
 obj-$(CONFIG_CRYPTO_HASH_INFO)			+= hash_info.o
 
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
-obj-$(CONFIG_CRYPTO_LIB_AES)			+= libaes.o
-libaes-y					:= aes.o
+################################################################################
+
+obj-$(CONFIG_CRYPTO_LIB_AES) += libaes.o
+libaes-y := aes.o
+ifeq ($(CONFIG_CRYPTO_LIB_AES_ARCH),y)
+CFLAGS_aes.o += -I$(src)/$(SRCARCH)
+endif # CONFIG_CRYPTO_LIB_AES_ARCH
+
+################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
 libaescfb-y					:= aescfb.o
 
 obj-$(CONFIG_CRYPTO_LIB_AESGCM)			+= libaesgcm.o
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 102aaa76bc8d..88da68dcf5a8 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017-2019 Linaro Ltd <ard.biesheuvel@linaro.org>
+ * Copyright 2026 Google LLC
  */
 
 #include <crypto/aes.h>
+#include <linux/cache.h>
 #include <linux/crypto.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
 
@@ -87,10 +89,114 @@ extern const u8 crypto_aes_sbox[256] __alias(aes_sbox);
 extern const u8 crypto_aes_inv_sbox[256] __alias(aes_inv_sbox);
 
 EXPORT_SYMBOL(crypto_aes_sbox);
 EXPORT_SYMBOL(crypto_aes_inv_sbox);
 
+/* aes_enc_tab[i] contains MixColumn([SubByte(i), 0, 0, 0]). */
+const u32 ____cacheline_aligned aes_enc_tab[256] = {
+	0xa56363c6, 0x847c7cf8, 0x997777ee, 0x8d7b7bf6, 0x0df2f2ff, 0xbd6b6bd6,
+	0xb16f6fde, 0x54c5c591, 0x50303060, 0x03010102, 0xa96767ce, 0x7d2b2b56,
+	0x19fefee7, 0x62d7d7b5, 0xe6abab4d, 0x9a7676ec, 0x45caca8f, 0x9d82821f,
+	0x40c9c989, 0x877d7dfa, 0x15fafaef, 0xeb5959b2, 0xc947478e, 0x0bf0f0fb,
+	0xecadad41, 0x67d4d4b3, 0xfda2a25f, 0xeaafaf45, 0xbf9c9c23, 0xf7a4a453,
+	0x967272e4, 0x5bc0c09b, 0xc2b7b775, 0x1cfdfde1, 0xae93933d, 0x6a26264c,
+	0x5a36366c, 0x413f3f7e, 0x02f7f7f5, 0x4fcccc83, 0x5c343468, 0xf4a5a551,
+	0x34e5e5d1, 0x08f1f1f9, 0x937171e2, 0x73d8d8ab, 0x53313162, 0x3f15152a,
+	0x0c040408, 0x52c7c795, 0x65232346, 0x5ec3c39d, 0x28181830, 0xa1969637,
+	0x0f05050a, 0xb59a9a2f, 0x0907070e, 0x36121224, 0x9b80801b, 0x3de2e2df,
+	0x26ebebcd, 0x6927274e, 0xcdb2b27f, 0x9f7575ea, 0x1b090912, 0x9e83831d,
+	0x742c2c58, 0x2e1a1a34, 0x2d1b1b36, 0xb26e6edc, 0xee5a5ab4, 0xfba0a05b,
+	0xf65252a4, 0x4d3b3b76, 0x61d6d6b7, 0xceb3b37d, 0x7b292952, 0x3ee3e3dd,
+	0x712f2f5e, 0x97848413, 0xf55353a6, 0x68d1d1b9, 0x00000000, 0x2cededc1,
+	0x60202040, 0x1ffcfce3, 0xc8b1b179, 0xed5b5bb6, 0xbe6a6ad4, 0x46cbcb8d,
+	0xd9bebe67, 0x4b393972, 0xde4a4a94, 0xd44c4c98, 0xe85858b0, 0x4acfcf85,
+	0x6bd0d0bb, 0x2aefefc5, 0xe5aaaa4f, 0x16fbfbed, 0xc5434386, 0xd74d4d9a,
+	0x55333366, 0x94858511, 0xcf45458a, 0x10f9f9e9, 0x06020204, 0x817f7ffe,
+	0xf05050a0, 0x443c3c78, 0xba9f9f25, 0xe3a8a84b, 0xf35151a2, 0xfea3a35d,
+	0xc0404080, 0x8a8f8f05, 0xad92923f, 0xbc9d9d21, 0x48383870, 0x04f5f5f1,
+	0xdfbcbc63, 0xc1b6b677, 0x75dadaaf, 0x63212142, 0x30101020, 0x1affffe5,
+	0x0ef3f3fd, 0x6dd2d2bf, 0x4ccdcd81, 0x140c0c18, 0x35131326, 0x2fececc3,
+	0xe15f5fbe, 0xa2979735, 0xcc444488, 0x3917172e, 0x57c4c493, 0xf2a7a755,
+	0x827e7efc, 0x473d3d7a, 0xac6464c8, 0xe75d5dba, 0x2b191932, 0x957373e6,
+	0xa06060c0, 0x98818119, 0xd14f4f9e, 0x7fdcdca3, 0x66222244, 0x7e2a2a54,
+	0xab90903b, 0x8388880b, 0xca46468c, 0x29eeeec7, 0xd3b8b86b, 0x3c141428,
+	0x79dedea7, 0xe25e5ebc, 0x1d0b0b16, 0x76dbdbad, 0x3be0e0db, 0x56323264,
+	0x4e3a3a74, 0x1e0a0a14, 0xdb494992, 0x0a06060c, 0x6c242448, 0xe45c5cb8,
+	0x5dc2c29f, 0x6ed3d3bd, 0xefacac43, 0xa66262c4, 0xa8919139, 0xa4959531,
+	0x37e4e4d3, 0x8b7979f2, 0x32e7e7d5, 0x43c8c88b, 0x5937376e, 0xb76d6dda,
+	0x8c8d8d01, 0x64d5d5b1, 0xd24e4e9c, 0xe0a9a949, 0xb46c6cd8, 0xfa5656ac,
+	0x07f4f4f3, 0x25eaeacf, 0xaf6565ca, 0x8e7a7af4, 0xe9aeae47, 0x18080810,
+	0xd5baba6f, 0x887878f0, 0x6f25254a, 0x722e2e5c, 0x241c1c38, 0xf1a6a657,
+	0xc7b4b473, 0x51c6c697, 0x23e8e8cb, 0x7cdddda1, 0x9c7474e8, 0x211f1f3e,
+	0xdd4b4b96, 0xdcbdbd61, 0x868b8b0d, 0x858a8a0f, 0x907070e0, 0x423e3e7c,
+	0xc4b5b571, 0xaa6666cc, 0xd8484890, 0x05030306, 0x01f6f6f7, 0x120e0e1c,
+	0xa36161c2, 0x5f35356a, 0xf95757ae, 0xd0b9b969, 0x91868617, 0x58c1c199,
+	0x271d1d3a, 0xb99e9e27, 0x38e1e1d9, 0x13f8f8eb, 0xb398982b, 0x33111122,
+	0xbb6969d2, 0x70d9d9a9, 0x898e8e07, 0xa7949433, 0xb69b9b2d, 0x221e1e3c,
+	0x92878715, 0x20e9e9c9, 0x49cece87, 0xff5555aa, 0x78282850, 0x7adfdfa5,
+	0x8f8c8c03, 0xf8a1a159, 0x80898909, 0x170d0d1a, 0xdabfbf65, 0x31e6e6d7,
+	0xc6424284, 0xb86868d0, 0xc3414182, 0xb0999929, 0x772d2d5a, 0x110f0f1e,
+	0xcbb0b07b, 0xfc5454a8, 0xd6bbbb6d, 0x3a16162c,
+};
+EXPORT_SYMBOL(aes_enc_tab);
+
+/* aes_dec_tab[i] contains InvMixColumn([InvSubByte(i), 0, 0, 0]). */
+const u32 ____cacheline_aligned aes_dec_tab[256] = {
+	0x50a7f451, 0x5365417e, 0xc3a4171a, 0x965e273a, 0xcb6bab3b, 0xf1459d1f,
+	0xab58faac, 0x9303e34b, 0x55fa3020, 0xf66d76ad, 0x9176cc88, 0x254c02f5,
+	0xfcd7e54f, 0xd7cb2ac5, 0x80443526, 0x8fa362b5, 0x495ab1de, 0x671bba25,
+	0x980eea45, 0xe1c0fe5d, 0x02752fc3, 0x12f04c81, 0xa397468d, 0xc6f9d36b,
+	0xe75f8f03, 0x959c9215, 0xeb7a6dbf, 0xda595295, 0x2d83bed4, 0xd3217458,
+	0x2969e049, 0x44c8c98e, 0x6a89c275, 0x78798ef4, 0x6b3e5899, 0xdd71b927,
+	0xb64fe1be, 0x17ad88f0, 0x66ac20c9, 0xb43ace7d, 0x184adf63, 0x82311ae5,
+	0x60335197, 0x457f5362, 0xe07764b1, 0x84ae6bbb, 0x1ca081fe, 0x942b08f9,
+	0x58684870, 0x19fd458f, 0x876cde94, 0xb7f87b52, 0x23d373ab, 0xe2024b72,
+	0x578f1fe3, 0x2aab5566, 0x0728ebb2, 0x03c2b52f, 0x9a7bc586, 0xa50837d3,
+	0xf2872830, 0xb2a5bf23, 0xba6a0302, 0x5c8216ed, 0x2b1ccf8a, 0x92b479a7,
+	0xf0f207f3, 0xa1e2694e, 0xcdf4da65, 0xd5be0506, 0x1f6234d1, 0x8afea6c4,
+	0x9d532e34, 0xa055f3a2, 0x32e18a05, 0x75ebf6a4, 0x39ec830b, 0xaaef6040,
+	0x069f715e, 0x51106ebd, 0xf98a213e, 0x3d06dd96, 0xae053edd, 0x46bde64d,
+	0xb58d5491, 0x055dc471, 0x6fd40604, 0xff155060, 0x24fb9819, 0x97e9bdd6,
+	0xcc434089, 0x779ed967, 0xbd42e8b0, 0x888b8907, 0x385b19e7, 0xdbeec879,
+	0x470a7ca1, 0xe90f427c, 0xc91e84f8, 0x00000000, 0x83868009, 0x48ed2b32,
+	0xac70111e, 0x4e725a6c, 0xfbff0efd, 0x5638850f, 0x1ed5ae3d, 0x27392d36,
+	0x64d90f0a, 0x21a65c68, 0xd1545b9b, 0x3a2e3624, 0xb1670a0c, 0x0fe75793,
+	0xd296eeb4, 0x9e919b1b, 0x4fc5c080, 0xa220dc61, 0x694b775a, 0x161a121c,
+	0x0aba93e2, 0xe52aa0c0, 0x43e0223c, 0x1d171b12, 0x0b0d090e, 0xadc78bf2,
+	0xb9a8b62d, 0xc8a91e14, 0x8519f157, 0x4c0775af, 0xbbdd99ee, 0xfd607fa3,
+	0x9f2601f7, 0xbcf5725c, 0xc53b6644, 0x347efb5b, 0x7629438b, 0xdcc623cb,
+	0x68fcedb6, 0x63f1e4b8, 0xcadc31d7, 0x10856342, 0x40229713, 0x2011c684,
+	0x7d244a85, 0xf83dbbd2, 0x1132f9ae, 0x6da129c7, 0x4b2f9e1d, 0xf330b2dc,
+	0xec52860d, 0xd0e3c177, 0x6c16b32b, 0x99b970a9, 0xfa489411, 0x2264e947,
+	0xc48cfca8, 0x1a3ff0a0, 0xd82c7d56, 0xef903322, 0xc74e4987, 0xc1d138d9,
+	0xfea2ca8c, 0x360bd498, 0xcf81f5a6, 0x28de7aa5, 0x268eb7da, 0xa4bfad3f,
+	0xe49d3a2c, 0x0d927850, 0x9bcc5f6a, 0x62467e54, 0xc2138df6, 0xe8b8d890,
+	0x5ef7392e, 0xf5afc382, 0xbe805d9f, 0x7c93d069, 0xa92dd56f, 0xb31225cf,
+	0x3b99acc8, 0xa77d1810, 0x6e639ce8, 0x7bbb3bdb, 0x097826cd, 0xf418596e,
+	0x01b79aec, 0xa89a4f83, 0x656e95e6, 0x7ee6ffaa, 0x08cfbc21, 0xe6e815ef,
+	0xd99be7ba, 0xce366f4a, 0xd4099fea, 0xd67cb029, 0xafb2a431, 0x31233f2a,
+	0x3094a5c6, 0xc066a235, 0x37bc4e74, 0xa6ca82fc, 0xb0d090e0, 0x15d8a733,
+	0x4a9804f1, 0xf7daec41, 0x0e50cd7f, 0x2ff69117, 0x8dd64d76, 0x4db0ef43,
+	0x544daacc, 0xdf0496e4, 0xe3b5d19e, 0x1b886a4c, 0xb81f2cc1, 0x7f516546,
+	0x04ea5e9d, 0x5d358c01, 0x737487fa, 0x2e410bfb, 0x5a1d67b3, 0x52d2db92,
+	0x335610e9, 0x1347d66d, 0x8c61d79a, 0x7a0ca137, 0x8e14f859, 0x893c13eb,
+	0xee27a9ce, 0x35c961b7, 0xede51ce1, 0x3cb1477a, 0x59dfd29c, 0x3f73f255,
+	0x79ce1418, 0xbf37c773, 0xeacdf753, 0x5baafd5f, 0x146f3ddf, 0x86db4478,
+	0x81f3afca, 0x3ec468b9, 0x2c342438, 0x5f40a3c2, 0x72c31d16, 0x0c25e2bc,
+	0x8b493c28, 0x41950dff, 0x7101a839, 0xdeb30c08, 0x9ce4b4d8, 0x90c15664,
+	0x6184cb7b, 0x70b632d5, 0x745c6c48, 0x4257b8d0,
+};
+EXPORT_SYMBOL(aes_dec_tab);
+
+/* Prefetch data into L1 cache.  @mem should be cacheline-aligned. */
+static __always_inline void aes_prefetch(const void *mem, size_t len)
+{
+	for (size_t i = 0; i < len; i += L1_CACHE_BYTES)
+		*(volatile const u8 *)(mem + i);
+	barrier();
+}
+
 static u32 mul_by_x(u32 w)
 {
 	u32 x = w & 0x7f7f7f7f;
 	u32 y = w & 0x80808080;
 
@@ -167,42 +273,21 @@ static u32 subw(u32 in)
 	       (aes_sbox[(in >>  8) & 0xff] <<  8) ^
 	       (aes_sbox[(in >> 16) & 0xff] << 16) ^
 	       (aes_sbox[(in >> 24) & 0xff] << 24);
 }
 
-/**
- * aes_expandkey - Expands the AES key as described in FIPS-197
- * @ctx:	The location where the computed key will be stored.
- * @in_key:	The supplied key.
- * @key_len:	The length of the supplied key.
- *
- * Returns 0 on success. The function fails only if an invalid key size (or
- * pointer) is supplied.
- * The expanded key size is 240 bytes (max of 14 rounds with a unique 16 bytes
- * key schedule plus a 16 bytes key which is used before the first round).
- * The decryption key is prepared for the "Equivalent Inverse Cipher" as
- * described in FIPS-197. The first slot (16 bytes) of each key (enc or dec) is
- * for the initial combination, the second slot for the first round and so on.
- */
-int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
-		  unsigned int key_len)
+static void aes_expandkey_generic(u32 rndkeys[], u32 *inv_rndkeys,
+				  const u8 *in_key, int key_len)
 {
 	u32 kwords = key_len / sizeof(u32);
 	u32 rc, i, j;
-	int err;
-
-	err = aes_check_keylen(key_len);
-	if (err)
-		return err;
-
-	ctx->key_length = key_len;
 
 	for (i = 0; i < kwords; i++)
-		ctx->key_enc[i] = get_unaligned_le32(in_key + i * sizeof(u32));
+		rndkeys[i] = get_unaligned_le32(&in_key[i * sizeof(u32)]);
 
 	for (i = 0, rc = 1; i < 10; i++, rc = mul_by_x(rc)) {
-		u32 *rki = ctx->key_enc + (i * kwords);
+		u32 *rki = &rndkeys[i * kwords];
 		u32 *rko = rki + kwords;
 
 		rko[0] = ror32(subw(rki[kwords - 1]), 8) ^ rc ^ rki[0];
 		rko[1] = rko[0] ^ rki[1];
 		rko[2] = rko[1] ^ rki[2];
@@ -227,38 +312,42 @@ int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 	 * Generate the decryption keys for the Equivalent Inverse Cipher.
 	 * This involves reversing the order of the round keys, and applying
 	 * the Inverse Mix Columns transformation to all but the first and
 	 * the last one.
 	 */
-	ctx->key_dec[0] = ctx->key_enc[key_len + 24];
-	ctx->key_dec[1] = ctx->key_enc[key_len + 25];
-	ctx->key_dec[2] = ctx->key_enc[key_len + 26];
-	ctx->key_dec[3] = ctx->key_enc[key_len + 27];
-
-	for (i = 4, j = key_len + 20; j > 0; i += 4, j -= 4) {
-		ctx->key_dec[i]     = inv_mix_columns(ctx->key_enc[j]);
-		ctx->key_dec[i + 1] = inv_mix_columns(ctx->key_enc[j + 1]);
-		ctx->key_dec[i + 2] = inv_mix_columns(ctx->key_enc[j + 2]);
-		ctx->key_dec[i + 3] = inv_mix_columns(ctx->key_enc[j + 3]);
-	}
+	if (inv_rndkeys) {
+		inv_rndkeys[0] = rndkeys[key_len + 24];
+		inv_rndkeys[1] = rndkeys[key_len + 25];
+		inv_rndkeys[2] = rndkeys[key_len + 26];
+		inv_rndkeys[3] = rndkeys[key_len + 27];
+
+		for (i = 4, j = key_len + 20; j > 0; i += 4, j -= 4) {
+			inv_rndkeys[i]     = inv_mix_columns(rndkeys[j]);
+			inv_rndkeys[i + 1] = inv_mix_columns(rndkeys[j + 1]);
+			inv_rndkeys[i + 2] = inv_mix_columns(rndkeys[j + 2]);
+			inv_rndkeys[i + 3] = inv_mix_columns(rndkeys[j + 3]);
+		}
 
-	ctx->key_dec[i]     = ctx->key_enc[0];
-	ctx->key_dec[i + 1] = ctx->key_enc[1];
-	ctx->key_dec[i + 2] = ctx->key_enc[2];
-	ctx->key_dec[i + 3] = ctx->key_enc[3];
+		inv_rndkeys[i]     = rndkeys[0];
+		inv_rndkeys[i + 1] = rndkeys[1];
+		inv_rndkeys[i + 2] = rndkeys[2];
+		inv_rndkeys[i + 3] = rndkeys[3];
+	}
+}
 
+int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
+		  unsigned int key_len)
+{
+	if (aes_check_keylen(key_len) != 0)
+		return -EINVAL;
+	ctx->key_length = key_len;
+	aes_expandkey_generic(ctx->key_enc, ctx->key_dec, in_key, key_len);
 	return 0;
 }
 EXPORT_SYMBOL(aes_expandkey);
 
-/**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
- */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
+void aes_encrypt_old(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
 {
 	const u32 *rkp = ctx->key_enc + 4;
 	int rounds = 6 + ctx->key_length / 4;
 	u32 st0[4], st1[4];
 	int round;
@@ -297,19 +386,121 @@ void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
 	put_unaligned_le32(subshift(st1, 0) ^ rkp[4], out);
 	put_unaligned_le32(subshift(st1, 1) ^ rkp[5], out + 4);
 	put_unaligned_le32(subshift(st1, 2) ^ rkp[6], out + 8);
 	put_unaligned_le32(subshift(st1, 3) ^ rkp[7], out + 12);
 }
-EXPORT_SYMBOL(aes_encrypt);
+EXPORT_SYMBOL(aes_encrypt_old);
 
-/**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
- */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
+static __always_inline u32 enc_quarterround(const u32 w[4], int i, u32 rk)
+{
+	return rk ^ aes_enc_tab[(u8)w[i]] ^
+	       rol32(aes_enc_tab[(u8)(w[(i + 1) % 4] >> 8)], 8) ^
+	       rol32(aes_enc_tab[(u8)(w[(i + 2) % 4] >> 16)], 16) ^
+	       rol32(aes_enc_tab[(u8)(w[(i + 3) % 4] >> 24)], 24);
+}
+
+static __always_inline u32 enclast_quarterround(const u32 w[4], int i, u32 rk)
+{
+	return rk ^ ((aes_enc_tab[(u8)w[i]] & 0x0000ff00) >> 8) ^
+	       (aes_enc_tab[(u8)(w[(i + 1) % 4] >> 8)] & 0x0000ff00) ^
+	       ((aes_enc_tab[(u8)(w[(i + 2) % 4] >> 16)] & 0x0000ff00) << 8) ^
+	       ((aes_enc_tab[(u8)(w[(i + 3) % 4] >> 24)] & 0x0000ff00) << 16);
+}
+
+static void __maybe_unused aes_encrypt_generic(const u32 rndkeys[], int nrounds,
+					       u8 out[AES_BLOCK_SIZE],
+					       const u8 in[AES_BLOCK_SIZE])
+{
+	const u32 *rkp = rndkeys;
+	int n = nrounds - 1;
+	u32 w[4];
+
+	w[0] = get_unaligned_le32(&in[0]) ^ *rkp++;
+	w[1] = get_unaligned_le32(&in[4]) ^ *rkp++;
+	w[2] = get_unaligned_le32(&in[8]) ^ *rkp++;
+	w[3] = get_unaligned_le32(&in[12]) ^ *rkp++;
+
+	/*
+	 * Prefetch the table before doing data and key-dependent loads from it.
+	 *
+	 * This is intended only as a basic constant-time hardening measure that
+	 * avoids interfering with performance too much.  Its effectiveness is
+	 * not guaranteed.  For proper constant-time AES, a CPU that supports
+	 * AES instructions should be used instead.
+	 */
+	aes_prefetch(aes_enc_tab, sizeof(aes_enc_tab));
+
+	do {
+		u32 w0 = enc_quarterround(w, 0, *rkp++);
+		u32 w1 = enc_quarterround(w, 1, *rkp++);
+		u32 w2 = enc_quarterround(w, 2, *rkp++);
+		u32 w3 = enc_quarterround(w, 3, *rkp++);
+
+		w[0] = w0;
+		w[1] = w1;
+		w[2] = w2;
+		w[3] = w3;
+	} while (--n);
+
+	put_unaligned_le32(enclast_quarterround(w, 0, *rkp++), &out[0]);
+	put_unaligned_le32(enclast_quarterround(w, 1, *rkp++), &out[4]);
+	put_unaligned_le32(enclast_quarterround(w, 2, *rkp++), &out[8]);
+	put_unaligned_le32(enclast_quarterround(w, 3, *rkp++), &out[12]);
+}
+
+static __always_inline u32 dec_quarterround(const u32 w[4], int i, u32 rk)
+{
+	return rk ^ aes_dec_tab[(u8)w[i]] ^
+	       rol32(aes_dec_tab[(u8)(w[(i + 3) % 4] >> 8)], 8) ^
+	       rol32(aes_dec_tab[(u8)(w[(i + 2) % 4] >> 16)], 16) ^
+	       rol32(aes_dec_tab[(u8)(w[(i + 1) % 4] >> 24)], 24);
+}
+
+static __always_inline u32 declast_quarterround(const u32 w[4], int i, u32 rk)
+{
+	return rk ^ aes_inv_sbox[(u8)w[i]] ^
+	       ((u32)aes_inv_sbox[(u8)(w[(i + 3) % 4] >> 8)] << 8) ^
+	       ((u32)aes_inv_sbox[(u8)(w[(i + 2) % 4] >> 16)] << 16) ^
+	       ((u32)aes_inv_sbox[(u8)(w[(i + 1) % 4] >> 24)] << 24);
+}
+
+static void __maybe_unused aes_decrypt_generic(const u32 inv_rndkeys[],
+					       int nrounds,
+					       u8 out[AES_BLOCK_SIZE],
+					       const u8 in[AES_BLOCK_SIZE])
+{
+	const u32 *rkp = inv_rndkeys;
+	int n = nrounds - 1;
+	u32 w[4];
+
+	w[0] = get_unaligned_le32(&in[0]) ^ *rkp++;
+	w[1] = get_unaligned_le32(&in[4]) ^ *rkp++;
+	w[2] = get_unaligned_le32(&in[8]) ^ *rkp++;
+	w[3] = get_unaligned_le32(&in[12]) ^ *rkp++;
+
+	aes_prefetch(aes_dec_tab, sizeof(aes_dec_tab));
+
+	do {
+		u32 w0 = dec_quarterround(w, 0, *rkp++);
+		u32 w1 = dec_quarterround(w, 1, *rkp++);
+		u32 w2 = dec_quarterround(w, 2, *rkp++);
+		u32 w3 = dec_quarterround(w, 3, *rkp++);
+
+		w[0] = w0;
+		w[1] = w1;
+		w[2] = w2;
+		w[3] = w3;
+	} while (--n);
+
+	aes_prefetch((const void *)aes_inv_sbox, sizeof(aes_inv_sbox));
+	put_unaligned_le32(declast_quarterround(w, 0, *rkp++), &out[0]);
+	put_unaligned_le32(declast_quarterround(w, 1, *rkp++), &out[4]);
+	put_unaligned_le32(declast_quarterround(w, 2, *rkp++), &out[8]);
+	put_unaligned_le32(declast_quarterround(w, 3, *rkp++), &out[12]);
+}
+
+void aes_decrypt_old(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
 {
 	const u32 *rkp = ctx->key_dec + 4;
 	int rounds = 6 + ctx->key_length / 4;
 	u32 st0[4], st1[4];
 	int round;
@@ -348,10 +539,104 @@ void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
 	put_unaligned_le32(inv_subshift(st1, 0) ^ rkp[4], out);
 	put_unaligned_le32(inv_subshift(st1, 1) ^ rkp[5], out + 4);
 	put_unaligned_le32(inv_subshift(st1, 2) ^ rkp[6], out + 8);
 	put_unaligned_le32(inv_subshift(st1, 3) ^ rkp[7], out + 12);
 }
-EXPORT_SYMBOL(aes_decrypt);
+EXPORT_SYMBOL(aes_decrypt_old);
+
+/*
+ * Note: the aes_prepare*key_* names reflect the fact that the implementation
+ * might not actually expand the key.  (The s390 code for example doesn't.)
+ * Where the key is expanded we use the more specific names aes_expandkey_*.
+ *
+ * aes_preparekey_arch() is passed an optional pointer 'inv_k' which points to
+ * the area to store the prepared decryption key.  It will be NULL if the user
+ * is requesting encryption-only.  aes_preparekey_arch() is also passed a valid
+ * 'key_len' and 'nrounds', corresponding to AES-128, AES-192, or AES-256.
+ */
+#ifdef CONFIG_CRYPTO_LIB_AES_ARCH
+/* An arch-specific implementation of AES is available.  Include it. */
+#include "aes.h" /* $(SRCARCH)/aes.h */
+#else
+/* No arch-specific implementation of AES is available.  Use generic code. */
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	aes_expandkey_generic(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			      in_key, key_len);
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds, out, in);
+}
+#endif
+
+static int __aes_preparekey(struct aes_enckey *enc_key,
+			    union aes_invkey_arch *inv_k,
+			    const u8 *in_key, size_t key_len)
+{
+	if (aes_check_keylen(key_len) != 0)
+		return -EINVAL;
+	enc_key->len = key_len;
+	enc_key->nrounds = 6 + key_len / 4;
+	aes_preparekey_arch(&enc_key->k, inv_k, in_key, key_len,
+			    enc_key->nrounds);
+	return 0;
+}
+
+int aes_preparekey(struct aes_key *key, const u8 *in_key, size_t key_len)
+{
+	return __aes_preparekey((struct aes_enckey *)key, &key->inv_k,
+				in_key, key_len);
+}
+EXPORT_SYMBOL(aes_preparekey);
+
+int aes_prepareenckey(struct aes_enckey *key, const u8 *in_key, size_t key_len)
+{
+	return __aes_preparekey(key, NULL, in_key, key_len);
+}
+EXPORT_SYMBOL(aes_prepareenckey);
+
+void aes_encrypt_new(aes_encrypt_arg key, u8 out[AES_BLOCK_SIZE],
+		     const u8 in[AES_BLOCK_SIZE])
+{
+	aes_encrypt_arch(key.enc_key, out, in);
+}
+EXPORT_SYMBOL(aes_encrypt_new);
+
+void aes_decrypt_new(const struct aes_key *key, u8 out[AES_BLOCK_SIZE],
+		     const u8 in[AES_BLOCK_SIZE])
+{
+	aes_decrypt_arch(key, out, in);
+}
+EXPORT_SYMBOL(aes_decrypt_new);
+
+#ifdef aes_mod_init_arch
+static int __init aes_mod_init(void)
+{
+	aes_mod_init_arch();
+	return 0;
+}
+subsys_initcall(aes_mod_init);
+
+static void __exit aes_mod_exit(void)
+{
+}
+module_exit(aes_mod_exit);
+#endif
 
-MODULE_DESCRIPTION("Generic AES library");
+MODULE_DESCRIPTION("AES block cipher");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
+MODULE_AUTHOR("Eric Biggers <ebiggers@kernel.org>");
 MODULE_LICENSE("GPL v2");
-- 
2.52.0


