Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9582E4AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 01:24:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K9fQ7lH6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDVB70DZWz3bmq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 11:24:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K9fQ7lH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDV9K4WYWz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 11:23:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 415E3CE18D0;
	Tue, 16 Jan 2024 00:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C94C43390;
	Tue, 16 Jan 2024 00:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364611;
	bh=My/GFt1IQOVLc+gYzB6g6/sg0L7W9/aHk/58FNKbkTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9fQ7lH6Tl3wjSjAR4E0Dwv/W14r6wDvLKF8wRjP3U31fOOfTjVQJyi5GRorqcUo0
	 9wND1fKyjfsjSmVnPH90XjcFtXSISofRJHyqNOzRJhMQuytPZT7yY9xiaKiC/v1RtM
	 lOIUm0Fhh+6+lnzebnkhCIOpVYT0DWpoPbjp+6jVe4F2PemwWKe/JsWIG53ncBREzc
	 8kBQeNswbITkNB5A3ke5WKr5sGWwCFhY/fpy33ddM7EEjeK9UJMUzskmiTV85pr6Y6
	 jDiwjeyI5lida3yiwSVPAVjxNoED1vWzc5QlO4uwq/KtB1mtwQK3j/kUvtvlj71RyE
	 kypLEq7l4UWvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 08/19] crypto: p10-aes-gcm - Avoid -Wstringop-overflow warnings
Date: Mon, 15 Jan 2024 19:22:44 -0500
Message-ID: <20240116002311.214705-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002311.214705-1-sashal@kernel.org>
References: <20240116002311.214705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gustavo A. R. Silva" <gustavoars@kernel.org>

[ Upstream commit aaa03fdb56c781db4a4831dd5d6ec8817918c726 ]

The compiler doesn't know that `32` is an offset into the Hash table:

 56 struct Hash_ctx {
 57         u8 H[16];       /* subkey */
 58         u8 Htable[256]; /* Xi, Hash table(offset 32) */
 59 };

So, it legitimately complains about a potential out-of-bounds issue
if `256 bytes` are accessed in `htable` (this implies going
`32 bytes` beyond the boundaries of `Htable`):

arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: error: 'gcm_init_htable' accessing 256 bytes in a region of size 224 [-Werror=stringop-overflow=]
  120 |         gcm_init_htable(hash->Htable+32, hash->H);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 1 of type 'unsigned char[256]'
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 2 of type 'unsigned char[16]'
arch/powerpc/crypto/aes-gcm-p10-glue.c:40:17: note: in a call to function 'gcm_init_htable'
   40 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
      |                 ^~~~~~~~~~~~~~~

Address this by avoiding specifying the size of `htable` in the function
prototype; and just for consistency, do the same for parameter `Xi`.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20231121131903.68a37932@canb.auug.org.au/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index 4b6e899895e7..f62ee54076c0 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -37,7 +37,7 @@ asmlinkage void aes_p10_gcm_encrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
 asmlinkage void aes_p10_gcm_decrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
-asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
+asmlinkage void gcm_init_htable(unsigned char htable[], unsigned char Xi[]);
 asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
 		unsigned char *aad, unsigned int alen);
 
-- 
2.43.0

