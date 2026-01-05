Return-Path: <linuxppc-dev+bounces-15241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACABCF1ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2ZH0fQTz3dKL;
	Mon, 05 Jan 2026 16:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590150;
	cv=none; b=LudXhDbF1b5AW3zBeSut6U8OftiS5yNr2eOf+5TBduS7z1VD6BgQ52BbuXJURk5BkKXYRvbDxJsTaG+jyGplSU00+8NCmymXl4GKhWV6CA1AEnjCuhOy+DZ2Kx13X8Zs5/M2C+fgh0wI9ImSf0MB8lDreh65uzYQSMRxSaKhr0+FcrBeSSQ/BRiq4EXvwwg9WH4zWUqG0Y2yn1UM6HKU6NDeaj4JKk/h3olnnuxoMmME09A0bHzH+e9iEfDC9dyuvm3KDTF3ZTs0dKGzaZXrfeBWpbyNQHlQLgln8fqtD5RJdHKLOwveBdgwZjA68MlRM0qHbUgsm/NTC3oD6p5Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590150; c=relaxed/relaxed;
	bh=5EgHCXMOz5gRh7eMughW4cZ4zBOrTNxJx4cu/aaTqL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kaou8VYWo7o8iP73l6Yq0u/V6908L6McCBrFbKxAnp0hgcodpDF7gKyMl9Q/x3/FaYP99tuiLXpczbTbVSmDnQcomUGnkmE22z9qF5/eR+stPjlrPXrbNaC02KKg4V2PWEF+P6219yD6DLJTbibtZiSSHm/bSjeLM0vn+hdzZ623ZLQFeBapW1TNKCB4A0lGLw/hdUcV0KlJ9DZ7nM3kkxhze9Z1f6VGB8N3v13rKFoWT7Li27BatXASV8XsIBcEJguOlu1liqQKplU1/rWBEqTis5jXv4r2XOcW2X3KXzIqTa8L4DzBjVS6TXEpaTBFQ8Aa3tETjidj1J/G3aftgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rOAhnKYR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rOAhnKYR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2ZG15pSz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF5760150;
	Mon,  5 Jan 2026 05:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF948C19421;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590114;
	bh=0EBUEmVTe0e4bzKdqvPELWwoIgTHdjzdDZHfkwljOsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOAhnKYROQMEoMD81Em7mWQ61HyLgE3WDv40a+uauy0zXQQ0mHHhwqwczGz06JzjM
	 BdNHtV7nIaURBKsF+oSa2rFdIAEXQ7LByXqGJRKmIrdfOf6QiEc5WT1lC9vh/BhW9a
	 IQ9OEsk+eGFsSOCFKi5iDvmfEmKDGx5jd+GTG1pUfu7myy1vVeHI3pUsbThA4X2oyu
	 lJCDZSbKqwRYYUw6a5frOfQp/Jv2FxRovn8kxjvrIGakLOdH6Z1+7/6yA/2TAaFePp
	 BbafT19y5VWI6JSqqbcyOypU34Iu6dDnPvbkNn++RQT2plgft3r939P/tX35BnbGzF
	 L9/mowQabouBA==
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
Subject: [PATCH 36/36] lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox
Date: Sun,  4 Jan 2026 21:13:09 -0800
Message-ID: <20260105051311.1607207-37-ebiggers@kernel.org>
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

The volatile keyword is no longer necessary or useful on aes_sbox and
aes_inv_sbox, since the table prefetching is now done using a helper
function that casts to volatile itself and also includes an optimization
barrier.  Since it prevents some compiler optimizations, remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/aes.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 98ade1758735..e85c905296f1 100644
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
-static volatile const u8 __cacheline_aligned aes_sbox[] = {
+static const u8 __cacheline_aligned aes_sbox[] = {
 	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
 	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
 	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
 	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
 	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
@@ -48,11 +44,11 @@ static volatile const u8 __cacheline_aligned aes_sbox[] = {
 	0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
 	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
 	0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16,
 };
 
-static volatile const u8 __cacheline_aligned aes_inv_sbox[] = {
+static const u8 __cacheline_aligned aes_inv_sbox[] = {
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


