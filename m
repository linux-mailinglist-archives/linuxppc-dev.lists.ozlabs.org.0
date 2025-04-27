Return-Path: <linuxppc-dev+bounces-8042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE8A9DF93
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcCb6Rsgz2yrt;
	Sun, 27 Apr 2025 16:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735451;
	cv=none; b=QnlXAHmwCdc8sMqwDJVTyf0KSASgJE6fvYWswkv0KIUOZc1T91pgAPjTQQw0g6wMW+rTvwL+mK2ovPcvwlvr7JuMWeXMqeJZmw8E45mRlpLBAmoNSSmBZl6jMtsMJiQYUlwIpWs96MfiTsLKSCKApNqnjKSho3MqWz0epu/oYQdA9vN9Y8kJLy3iYTudWCxUaCaGqDLC/EXu8dUJnmlUJMaCnJ1KLdDNIn/xXNqP88C3+9boM/J9juDe63blfbhxTKS9g+glfOhl8JwH+ZgUz3ogRuzhjMtmT1eT+cwaRGj1sRAFfrD57OLK/6Bt3IC1Qs5UK1AoO1gaDK5jCG1QUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735451; c=relaxed/relaxed;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=O6rVZjuToxWvgc220oJU9Gm3loWGeOp8suUqitVVRJ8GPdULhHVaHZh/7vS09C3B9OwwQgnCQcyAi0C8uqvKxUQIZU0xqBAtH6xoWC0sM03zaEpTLrMD9JDGbQDIgwER3mZwrWen/8naM3ZSZFFsvPDlypGDA8IUzm4Lh4CzXp8Ch/yEWdERoKvaLZdJfKHzngLg06CQ0jDRZPP+K5bGE2g3fhJ1AnebHWGoOsDjH3yhpb/O5h5xxtijA3Hw5UtiPrCcL/dl/RHS48dU3MWOa56n58YODUyFxBjc+ZOV/qpbnH+PnaQdFC6vODOB3gywEPwbPyHO+rU5apteNbT2+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=mkhMP3Ax; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=mkhMP3Ax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcCb0WZfz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:30:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=; b=mkhMP3AxtvFlFxmVVxvE3IyWC0
	XSSWkxGPYe0zF9LKiHqJkwM5KszOtHejtG/f2uSPI7y6uatkG2c+OmmK0K0eTCeA3D599m3t2lhN9
	Eice0UMQQTLjYo1/+oTh0tKbsMf+0DCwkizLHCtiB4LszQYwJT4IYEAAEPD7+mFTSPGMkD7yjhzym
	4v8j1K+PBuTlpSRJwCM2QMpdeacDlwh9sx+azggc5F8vifhhohYMqgLiyfyQhQetv95jji7fDt9Ew
	kgfv/hM02UQ8X3Fb76u9T3RYjn8XYeSzVloIzJ6FEjP2V22ugwQy1fnJNQypGOdAFbnciVW/gIJWv
	O2wT9ubA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXM-001LV1-2Z;
	Sun, 27 Apr 2025 14:30:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:30:48 +0800
Date: Sun, 27 Apr 2025 14:30:48 +0800
Message-Id: <446cd85436213218103874cdd102d154d47492f5.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking
 logic
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

From: Eric Biggers <ebiggers@google.com>

Since kernel-mode NEON sections are now preemptible on arm64, there is
no longer any need to limit the length of them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 26f9fdfae87b..d63ea82e1374 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -86,23 +86,8 @@ static struct shash_alg algs[] = { {
 static int sha256_update_neon(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	do {
-		unsigned int chunk = len;
-
-		/*
-		 * Don't hog the CPU for the entire time it takes to process all
-		 * input when running on a preemptible kernel, but process the
-		 * data block by block instead.
-		 */
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			chunk = SHA256_BLOCK_SIZE;
-
-		chunk -= sha256_base_do_update_blocks(desc, data, chunk,
-						      sha256_neon_transform);
-		data += chunk;
-		len -= chunk;
-	} while (len >= SHA256_BLOCK_SIZE);
-	return len;
+	return sha256_base_do_update_blocks(desc, data, len,
+					    sha256_neon_transform);
 }
 
 static int sha256_finup_neon(struct shash_desc *desc, const u8 *data,
-- 
2.39.5


