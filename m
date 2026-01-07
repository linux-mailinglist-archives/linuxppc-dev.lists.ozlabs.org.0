Return-Path: <linuxppc-dev+bounces-15348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01960CFBE94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 05:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmDr04ZV6z2yFh;
	Wed, 07 Jan 2026 15:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767758512;
	cv=none; b=FwQSU0rU5CNZih2mD9gRst51Orda7aIrDXmVFPYk6XYWqJqaFIkiqMj/VtOZ5tJJlWwF3ptPcM2vIJIvT2nbg3M/ZeBY2rmikwkx8DBOc4pKkAcP83/cVzjxzt96ExiW3sS3ma9w3+hrA+H6FlzHR9mA6npQySt+0CjpSiPIqruBaKHXo0e+plYODvnHHlWEkh0kpr4ob2KoKl3rrAIYt7/fUbQzi7ai0SB7JcCxY4zPxwf2DOXuQpyqOHexxOpioTe7bX6JJ21AF5XeXTaX6gmrvokTaIdwjdIw4xKM5xAzPLZS/5ZSQ/JAuRF5qUJYnVjHYiMdZEAJpA/rsgbqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767758512; c=relaxed/relaxed;
	bh=+Dp7GbOzUhbexvyJfL3KW8K7vitNAwAEQvbG+47gD00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBHbytjuaxk/dqbiOaQ2rnb5wtDbc7/F363Xv6egGT/9V2Ad5Y9hIRF8Vaep0nM6o7gCaEXHArQH3fwlNBQtttXoLUBjFdrD1m5Gf3TdEanBgzhtGmKLN4xgZlPZCQiK4ScvnL7kHv5BM3eyYGZOJmoVp0GO+Z/I70v/ZsysMVCz971v4e0CNOimJhwjyQQ8Vy4gPT40G9rwE69sD/t8lx9snCUcxbI6rkw2Kq0X2GF5uNzy0UygVvehrVgzyl8XK69ghojuN+RjB2flZklat3XiV3tKvSOeDS/uDpA1My7UcmI2bKgEU9HIb2kgMtPj9xSm7Vqk5eRyUoYIcuQfug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N7u/AAYT; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N7u/AAYT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmDqz3wrNz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 15:01:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38EF960007;
	Wed,  7 Jan 2026 04:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3E2C4CEF7;
	Wed,  7 Jan 2026 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767758508;
	bh=pzuDTI1gGeG5Smd+gX1gaxHlzMDNl358rd8Qrwf1tqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7u/AAYT3DDEUXzlTMGjqZuODkOKrqMuB9CcWWnECwJA8nhYty4M3NEe4VKElptV2
	 eGGGvgXAHnfGpC43Cofx6mA0tHqObs3mTQeRxkriecrKIxi1mBUL8I2Kfpo6FR+fnX
	 BeqLvKAFPHraFwq3GT2AswyWHkWVv/KYfbBi6xqXwW3+AwM/XCLWXwk3sM4kkY13CZ
	 1UnjB+Z2DT2LjzeUvp14Siz8RA606HwynIlEGPAWB5gSeTXswi5YEYTKJZXUhzUohP
	 KTTtdS4vQ8wiIHUbm6MfVPEndmvnAyhVGNc5aQQ77O+H8+/xB0DWa/LbwJOpZ7Ae/v
	 wkVi0bNORnAoQ==
Date: Tue, 6 Jan 2026 20:01:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 30/36] crypto: inside-secure - Use new AES library API
Message-ID: <20260107040128.GC2283@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-31-ebiggers@kernel.org>
 <20260107034834.1447-1-dqfext@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107034834.1447-1-dqfext@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 11:48:33AM +0800, Qingfang Deng wrote:
> On Sun,  4 Jan 2026 21:13:03 -0800, Eric Biggers wrote:
> > --- a/drivers/crypto/inside-secure/safexcel_cipher.c
> > +++ b/drivers/crypto/inside-secure/safexcel_cipher.c
> > @@ -2505,37 +2505,35 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
> >  				    unsigned int len)
> >  {
> >  	struct crypto_tfm *tfm = crypto_aead_tfm(ctfm);
> >  	struct safexcel_cipher_ctx *ctx = crypto_tfm_ctx(tfm);
> >  	struct safexcel_crypto_priv *priv = ctx->base.priv;
> > -	struct crypto_aes_ctx aes;
> > +	struct aes_enckey aes;
> >  	u32 hashkey[AES_BLOCK_SIZE >> 2];
> >  	int ret, i;
> >  
> > -	ret = aes_expandkey(&aes, key, len);
> > -	if (ret) {
> > -		memzero_explicit(&aes, sizeof(aes));
> > +	ret = aes_prepareenckey(&aes, key, len);
> > +	if (ret)
> >  		return ret;
> > -	}
> >  
> >  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
> >  		for (i = 0; i < len / sizeof(u32); i++) {
> > -			if (le32_to_cpu(ctx->key[i]) != aes.key_enc[i]) {
> > +			if (ctx->key[i] != get_unaligned((__le32 *)key + i)) {
> 
> "key" is big-endian. Casting it to __le32 does not seem correct.
> Did you mean "get_unaligned_le32", which also convert the endianness?

No.  Previously, in this driver the 32-bit words of the AES key went
from little endian in their original byte array in 'key', to CPU endian
in 'aes.key_enc' (via the get_unaligned_le32() in aes_expandkey()), to
little endian in 'ctx->key' (via the cpu_to_le32() in this function).
Note that ctx->key is an array of __le32.

Those two conversions canceled out.  So I've simplified it to just grab
the little endian words of the key directly.

- Eric

