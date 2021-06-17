Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A13AABB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5BT46TvLz3c0y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:08:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oZZoiBeV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oZZoiBeV; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5BSb2sCtz306v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:08:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5BSJ40jBz9sSn;
 Thu, 17 Jun 2021 16:08:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623910098;
 bh=hVSqDU1BBeAnmrNw6zEidn4Sen3Yd1tIwA02D0sarGQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oZZoiBeVQr61j2bwMuugaKP9gv5ITKpktufP160mgBAmaarcFH8bPXbdJ5s5ZAoT7
 68SUZpMPCycXQb4uZ+AqRADj/OQdoSYJqDG4hYoefgWjS0qZPtMny18lrv1bnWbnGs
 KBOE5Mko05q8bQdSFjqPAZizL+y7tz+XE6RsTtBK58oVtL0mWznrq5K0szKgbLprNl
 Z2mnxDi277OL/yq/XSkTEPwus9+Y6U5LpWAEUvgYl5ngSjQplmDenWM0kYCDcyyNHl
 F+wAZD7749u+k4C1USPD+m0b5eb8oHPeBRu1X7PoJNLikR6YONWawdwD8yIVLS7tIK
 85QrKv0/sir6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: nx: Fix memcpy() over-reading in nonce
In-Reply-To: <20210616203459.1248036-1-keescook@chromium.org>
References: <20210616203459.1248036-1-keescook@chromium.org>
Date: Thu, 17 Jun 2021 16:08:15 +1000
Message-ID: <87zgvpqb00.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kees Cook <keescook@chromium.org>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 Breno =?utf-8?Q?Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> Fix typo in memcpy() where size should be CTR_RFC3686_NONCE_SIZE.
>
> Fixes: 030f4e968741 ("crypto: nx - Fix reentrancy bugs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks.

> ---
>  drivers/crypto/nx/nx-aes-ctr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/nx/nx-aes-ctr.c b/drivers/crypto/nx/nx-aes-ctr.c
> index 13f518802343..6120e350ff71 100644
> --- a/drivers/crypto/nx/nx-aes-ctr.c
> +++ b/drivers/crypto/nx/nx-aes-ctr.c
> @@ -118,7 +118,7 @@ static int ctr3686_aes_nx_crypt(struct skcipher_request *req)
>  	struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
>  	u8 iv[16];
>  
> -	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_IV_SIZE);
> +	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_NONCE_SIZE);
>  	memcpy(iv + CTR_RFC3686_NONCE_SIZE, req->iv, CTR_RFC3686_IV_SIZE);
>  	iv[12] = iv[13] = iv[14] = 0;
>  	iv[15] = 1;

Where IV_SIZE is 8 and NONCE_SIZE is 4.

And iv is 16 bytes, so it's not a buffer overflow.

But priv.ctr.nonce is 4 bytes, and at the end of the struct, so it reads
4 bytes past the end of the nx_crypto_ctx, which is not good.

But then immediately overwrites whatever it read with req->iv.

So seems pretty harmless in practice?

cheers
