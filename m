Return-Path: <linuxppc-dev+bounces-15575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D921ED14F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3W3dlXz30Gm;
	Tue, 13 Jan 2026 06:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245831;
	cv=none; b=eH7HaP9S6ZR2kCvxVF3dE2QyHZMIvke7wUg7FfG6mWx6wopw2Ur1a31IFTor+LKy3ADMw6ZrEcOWlPUu4tchAf4LWrCMy4WEAgsbItIxEvpkRx2ZAq9d0YI5U3Mmf1xYY6NAlymihztkKjk8Ec8ORk7A96JhAr7ViqTmOSeGe5JndtpzymNwDUP3WjKBTTCOpXR4GyljweHjOiB2wILn376/p2j6cv69X9rAcAKQ+/AmrccAhCO3pvP1jpDQthLDQ81S038iIXXe5NfymbVSXN2qjL3IteDqkDvrkyiSh6W2R9Gg20V5Yw1w+NnR6XLI2UYbKKw7VfTQVsY33JzRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245831; c=relaxed/relaxed;
	bh=e593l6dZYweWWJZwnbJS7ovWKpa7rdp0PhFnwfXn1jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4GoeEDTNRbrb7Ww3bhyayNtFZKlkrWafb/w4qzP5MfJmccZOe5QDsoLW1GscesrVRH1CwcgVOKombWyPxbjsw/6enhmqHTt5fBYFk8KsRb3DRsYZTQZj5sgl6jGfx6iyOCIjhAYHsHIrY4OzX8xYEHEmF1xKGvDwuEhg7N2gPQv5TFqho8emN7pjJL8vg2rLODtjtNIXEPqXLeVfKTG6DfLCfud97idWfgyqQAIL50vh+IrQqdq7I2OCV82C5DfUApj4wXPXm8eGZmjmpJXrt+Kh8hoegyv/I93V4gXXAmAnrllyTHYkMQiRBbvdth4RfkPw6DaVzI5pmdR8kJFuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQ/vnJyk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQ/vnJyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3V4WQwz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AF51600AA;
	Mon, 12 Jan 2026 19:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39F0C19424;
	Mon, 12 Jan 2026 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245798;
	bh=JV1M038y5fd1Fii+AIq80mfwW2VT2ZAZq/Qain419Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ/vnJyka/X0XFbjFkcVN6G/B0jLA5ZQ6lT1j0NV1HnrydwRrKx6ievF5NaNQeFK2
	 En2/0NauYq26MK+TbhehCCIBL3ds60TW5Z1dCEMkqmaoNscKya6DAA88yY7Jnmi6ZD
	 wy86VZQvANV8MRWkR2lAJ7tChvw8hFgI/EgSn9xhjw+0tOcGU1Vwqi5Hu2bsZIMIeE
	 XLUzLjcQo5a4UFcXXFXdNcf9t+790gS1lKaLfIw7kKI/bp3v3HsnlyJg8MPxluIoS+
	 N7CgjSk/kPaDpOljRew2l7Ub+WjkD5a94TMHmF9gjmdLXkxvz22UlUSwiS8x2WPWD9
	 OYTzunf4AtPOg==
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
Subject: [PATCH v2 01/35] crypto: powerpc/aes - Rename struct aes_key
Date: Mon, 12 Jan 2026 11:19:59 -0800
Message-ID: <20260112192035.10427-2-ebiggers@kernel.org>
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

Rename struct aes_key in aesp8-ppc.h and aes-gcm-p10-glue.c to
p8_aes_key and p10_aes_key, respectively.  This frees up the name to use
in the library API in <crypto/aes.h>.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c |  4 ++--
 arch/powerpc/crypto/aes.c              |  4 ++--
 arch/powerpc/crypto/aes_cbc.c          |  4 ++--
 arch/powerpc/crypto/aes_ctr.c          |  2 +-
 arch/powerpc/crypto/aes_xts.c          |  6 +++---
 arch/powerpc/crypto/aesp8-ppc.h        | 23 ++++++++++++-----------
 6 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index 85f4fd4b1bdc..f3417436d3f7 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -42,11 +42,11 @@ asmlinkage void aes_p10_gcm_decrypt(const u8 *in, u8 *out, size_t len,
 asmlinkage void gcm_init_htable(unsigned char htable[], unsigned char Xi[]);
 asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
 			      unsigned char *aad, unsigned int alen);
 asmlinkage void gcm_update(u8 *iv, void *Xi);
 
-struct aes_key {
+struct p10_aes_key {
 	u8 key[AES_MAX_KEYLENGTH];
 	u64 rounds;
 };
 
 struct gcm_ctx {
@@ -61,11 +61,11 @@ struct Hash_ctx {
 	u8 H[16];	/* subkey */
 	u8 Htable[256];	/* Xi, Hash table(offset 32) */
 };
 
 struct p10_aes_gcm_ctx {
-	struct aes_key enc_key;
+	struct p10_aes_key enc_key;
 	u8 nonce[RFC4106_NONCE_SIZE];
 };
 
 static void vsx_begin(void)
 {
diff --git a/arch/powerpc/crypto/aes.c b/arch/powerpc/crypto/aes.c
index 3f1e5e894902..b7192ee719fc 100644
--- a/arch/powerpc/crypto/aes.c
+++ b/arch/powerpc/crypto/aes.c
@@ -19,12 +19,12 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_ctx {
 	struct crypto_cipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
 };
 
 static int p8_aes_init(struct crypto_tfm *tfm)
 {
 	const char *alg = crypto_tfm_alg_name(tfm);
diff --git a/arch/powerpc/crypto/aes_cbc.c b/arch/powerpc/crypto/aes_cbc.c
index 5f2a4f375eef..4a9f285f0970 100644
--- a/arch/powerpc/crypto/aes_cbc.c
+++ b/arch/powerpc/crypto/aes_cbc.c
@@ -19,12 +19,12 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_cbc_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
 };
 
 static int p8_aes_cbc_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aes_ctr.c b/arch/powerpc/crypto/aes_ctr.c
index e27c4036e711..7dbd06f442db 100644
--- a/arch/powerpc/crypto/aes_ctr.c
+++ b/arch/powerpc/crypto/aes_ctr.c
@@ -19,11 +19,11 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_ctr_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
+	struct p8_aes_key enc_key;
 };
 
 static int p8_aes_ctr_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aes_xts.c b/arch/powerpc/crypto/aes_xts.c
index 9440e771cede..b4c760e465ea 100644
--- a/arch/powerpc/crypto/aes_xts.c
+++ b/arch/powerpc/crypto/aes_xts.c
@@ -20,13 +20,13 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_xts_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
-	struct aes_key tweak_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
+	struct p8_aes_key tweak_key;
 };
 
 static int p8_aes_xts_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aesp8-ppc.h b/arch/powerpc/crypto/aesp8-ppc.h
index 5764d4438388..0bea010128cb 100644
--- a/arch/powerpc/crypto/aesp8-ppc.h
+++ b/arch/powerpc/crypto/aesp8-ppc.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/types.h>
 #include <crypto/aes.h>
 
-struct aes_key {
+struct p8_aes_key {
 	u8 key[AES_MAX_KEYLENGTH];
 	int rounds;
 };
 
 extern struct shash_alg p8_ghash_alg;
@@ -12,19 +12,20 @@ extern struct crypto_alg p8_aes_alg;
 extern struct skcipher_alg p8_aes_cbc_alg;
 extern struct skcipher_alg p8_aes_ctr_alg;
 extern struct skcipher_alg p8_aes_xts_alg;
 
 int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
-			   struct aes_key *key);
+			   struct p8_aes_key *key);
 int aes_p8_set_decrypt_key(const u8 *userKey, const int bits,
-			   struct aes_key *key);
-void aes_p8_encrypt(const u8 *in, u8 *out, const struct aes_key *key);
-void aes_p8_decrypt(const u8 *in, u8 *out, const struct aes_key *key);
+			   struct p8_aes_key *key);
+void aes_p8_encrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
+void aes_p8_decrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
 void aes_p8_cbc_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key, u8 *iv, const int enc);
-void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out,
-				 size_t len, const struct aes_key *key,
-				 const u8 *iv);
+			const struct p8_aes_key *key, u8 *iv, const int enc);
+void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out, size_t len,
+				 const struct p8_aes_key *key, const u8 *iv);
 void aes_p8_xts_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key1, const struct aes_key *key2, u8 *iv);
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);
 void aes_p8_xts_decrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key1, const struct aes_key *key2, u8 *iv);
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);
-- 
2.52.0


