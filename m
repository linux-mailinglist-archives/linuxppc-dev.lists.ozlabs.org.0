Return-Path: <linuxppc-dev+bounces-8069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BBBA9E763
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 07:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmBX81LQHz2yqm;
	Mon, 28 Apr 2025 15:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745817432;
	cv=none; b=iHN+04/yh6XubFrruPSU7HXUbiHQzr7d6QzBsnaQ6ojFWbFVaWQpe+T2ednpX2FjwsOGbJYY00h5WNVNUKflq/3ZXW890MoTHUxLa55mS9pXKXsdhKeH6SIFe+vxrNeIWZdpo0QlLck7nMzQGag3KYiGyr5EEjwY5xG/gj4Pj993YGH+nwd2EHlQiOVUwWcF9yl+6pyHt6n4MKxb6UUYuH/Re/dNte0seu57KksYkbdqyzi0Yl/o+wK0jXE5eXNSZlVcocpAKVZBNKhQ8PNdN+9YDRPuQA/Dg606VmAzuTSETlqf7AqaJvafYSmmn5RLnIAnP+gRLMSFlcF3QTCojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745817432; c=relaxed/relaxed;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=Jl14iAmkiAh5Ck0z/OFrE8RaooPtal7lUGSpntVzsZVnaBKip5oHch+76wALy21PAeFzNcRyCGqooQ4zOn5J4tgWnx4WrXj95C1zR/WllZgB0sYEOjWm3e6Ll3z1JPWXqDcNbLSimhZHfD4FwMp68kAVhWAW+9nS97yA+tGJ2kTEPyeMfBuSV9TwYdBA6XSCwzYP6340tsidbQIhXElyj5Od+IBs+E3TgIkRHBRIIIM+qNtQbOCOaowzOYLo0bzaWD8yqtVrRuP8NH4CIsIxM8Ckf5xQ4WOrDmGCHVBGAyvHBNKCU7WcMe+RY+5p0eM/8sBSPHk8Y33fa60s+TOiLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Em6RC+92; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Em6RC+92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmBX74GlBz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 15:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=; b=Em6RC+92ZIhGDWZJ3ftfwdpBUp
	cBsK1u3fX8WJoEver0IK/pFnsxoZIkzRB8ooW7so3bQ48jQ2kw4fT30Gcrzbp8E1IQNHP4IKCG+S5
	vuy0wB5fM0FMpDtTw/lJG7n0GiBle4Q9x4MnOCnQRFgCLYtDwpbr+Bq5E0c84QLsmCLzSQJzikyW3
	WQwMa/GZCK+Tlpvice0t0wCAtCrCcORjVApCQogTcWMXnm8+vHSMq++V9GASeO/3nE+Fy1SAZnFNq
	JiEUsFKd/Jkx68DhGPmOHUMKa0oWcHSL1AtY6ggG14Y/Qwuw7fZ/fAcprY3n1d0pHiE5lVBSRyEVn
	SqSF+8pQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Grd-001WRY-04;
	Mon, 28 Apr 2025 13:17:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 13:17:09 +0800
Date: Mon, 28 Apr 2025 13:17:09 +0800
Message-Id: <5787872fd00f3f761beb2f6e3ee3f5bddd8f2c3a.1745816372.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v3 PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking
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


