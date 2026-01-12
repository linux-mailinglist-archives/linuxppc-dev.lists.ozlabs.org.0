Return-Path: <linuxppc-dev+bounces-15574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B610D14F5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3J1D8dz3bl5;
	Tue, 13 Jan 2026 06:23:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245820;
	cv=none; b=gtlTgzXHwkgQuNX9lhBEERbJzbsmA/pKK8OkphBDmpzlP0wrNYfHK5G0893nv2gMlf/Cn7VbBVnKUsKQoSiVzgkIT4xOlZNb2nv6iFixN9H/r4E9KlgycEbS6pQbmrxZhMp+XnkmgyLs5RjWY0hSQVrL7MwTXQtpDW/jGUD4Iyq7Sl7yZH0QVHe6ejGY6TBnMy2LZIPkxtlX8vSI1GRFVCk6BvZ2UbDvulhZaLN8kvHfRHFahMj5dVJReFqhcB553exRxRRM8pNkbhSvr2BzClM39BeVhZSwcBHo52lyuVHZpwwCjPCrUlzxEv//7uCruSlZTZc3BjDDekiNKy/eWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245820; c=relaxed/relaxed;
	bh=0SA0X29mU5F0+X6H2Q6w5W2EIk3MslJYeRMNLAqdogo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/ZgoUMKJU42fxxV2iXnN++VXXSjdRu/BbopIGtYC46FDIviMNLgvoevSAHzi0wCNQefgLtI300DR9Fj25lPsIu8UUs817fHjy2jtM6TKK4+0w8Gi/AgAYqAzQMJvrUHeXxULKj3xMnlvXbTTyVwfphydGr8ZJJZacJWkftcde64m4Fo4qiAlHEySryaBykwNmRjaud9wPt+V/4B4RuWR3Kx5zLKM/nESKZzk0xofWxpKpK3FqUrRhiO1CJwz6W3wUf2qMhUQP6GNdQsEkPSBVQ30vEZHxdGc6OuIBok2DqtjXCcipNDrx5vDfSrroKwotnYOlN1k+cB0xPfEQIW4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a0KxQKZz; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a0KxQKZz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3H2Ck4z3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B91260130;
	Mon, 12 Jan 2026 19:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6FEC2BC87;
	Mon, 12 Jan 2026 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245817;
	bh=b8+2isc/mWUmlO/3JdSbmkX86zq1F/K7GlRJMz6JOGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a0KxQKZz4i1RsOIjwLOOJXRfsPl591C6xVTDsyPT/wulXI86KQAv8RU2kd7ep/SaL
	 zQvgA1Gym7fI7zoT+USMG//U9qE9UXwwME2vdvVHXKVdXjAtx54Ohch2D7CMbhkA5/
	 X6C0SH88Al9aHufVFNgjnGM96SggfDltB7624aEEJGCeq/fizRgyG19Oi5XUMRgsY3
	 N5+7hHLYL3IuXtC2+uvsqfw8e5vT743c3gn+zrczsKCTpxZzMemonA8zrSunSiIagR
	 D96qKtgMHNtpzT799tZxr8HGA0htwIxkqmMFBRFAiCEHlUA9gxLwDwC6SW2U2VaUuN
	 x3lQpzaJ9SoXw==
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
Subject: [PATCH v2 35/35] lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox
Date: Mon, 12 Jan 2026 11:20:33 -0800
Message-ID: <20260112192035.10427-36-ebiggers@kernel.org>
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

The volatile keyword is no longer necessary or useful on aes_sbox and
aes_inv_sbox, since the table prefetching is now done using a helper
function that casts to volatile itself and also includes an optimization
barrier.  Since it prevents some compiler optimizations, remove it.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/aes.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index b7ab2d0c4e59..b73e19f1bb95 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -9,15 +9,11 @@
 #include <linux/crypto.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
 
-/*
- * Emit the sbox as volatile const to prevent the compiler from doing
- * constant folding on sbox references involving fixed indexes.
- */
-static volatile const u8 ____cacheline_aligned aes_sbox[] = {
+static const u8 ____cacheline_aligned aes_sbox[] = {
 	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
 	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
 	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
 	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
 	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
@@ -48,11 +44,11 @@ static volatile const u8 ____cacheline_aligned aes_sbox[] = {
 	0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
 	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
 	0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16,
 };
 
-static volatile const u8 ____cacheline_aligned aes_inv_sbox[] = {
+static const u8 ____cacheline_aligned aes_inv_sbox[] = {
 	0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38,
 	0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
 	0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87,
 	0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
 	0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d,
@@ -428,11 +424,11 @@ static void __maybe_unused aes_decrypt_generic(const u32 inv_rndkeys[],
 		w[1] = w1;
 		w[2] = w2;
 		w[3] = w3;
 	} while (--n);
 
-	aes_prefetch((const void *)aes_inv_sbox, sizeof(aes_inv_sbox));
+	aes_prefetch(aes_inv_sbox, sizeof(aes_inv_sbox));
 	put_unaligned_le32(declast_quarterround(w, 0, *rkp++), &out[0]);
 	put_unaligned_le32(declast_quarterround(w, 1, *rkp++), &out[4]);
 	put_unaligned_le32(declast_quarterround(w, 2, *rkp++), &out[8]);
 	put_unaligned_le32(declast_quarterround(w, 3, *rkp++), &out[12]);
 }
-- 
2.52.0


