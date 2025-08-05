Return-Path: <linuxppc-dev+bounces-10682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC5B1BCD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 00:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxTFh70X9z2xgX;
	Wed,  6 Aug 2025 08:52:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754434328;
	cv=none; b=QZDQUidEXBbwSTN/EcgObG3B2CeRDHY1FEZrZfEyda8S9DQXHYEBuhS0uobgy4RV9kq7I7AXltacMGYQNVvSUWK9J0ETQt7cScToNpzgBFxl+WwNfPQskkcSDnn1YV604OtP8HSx67QSU46T6fm42YWP0CUj71g8sZs5al7Ye5I4BhP8GiMO58I4WDnbnO7Wdf0ZuqGBM1DgSixZTLnE4Cvjf+48IOSr5HqAg1QrFigikPIJNZCKUB8XfH2wYV5/QFeq2M79vnYiTT1ifcc4vlNp5Era6yMwlpAeh2RnfouR2NvLQsyOoYIH52pJoyMON6fBrT9xTfdcNk0DZdUUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754434328; c=relaxed/relaxed;
	bh=hFIzMhWWfHvgxjj5+9/yBjn3W7mupif0fgyiSJ7ByRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6ChNscyBFPIhk8UOXQmQQMnGsYol4h1dNvT1fjV+AWv2zVT4KoKYPjMoYG3eLTXdYeon/ih/qp2cBW9g7XamVNI9XZod+/9fb2Q+wBy1aqiKaeG5JSQZkn9V3xCXhA63QnY/aomJVGUBdhejCAbsvuBFASQpkgibITbs/ocQNz9PMThYNqEncLoCddQy48P2tlaw5j0PhyZlNwS/dJUtWPop6egAJYIkMuPRke7ACNP3hzzoe4FZ/dRDIFdfDXaFqW0oSfRw6wkJmmXhrqL5jNoGNm89TxqVxNck7nGv8nWHcpMTBRpekOjG/ZBmhetdSvu0CHPbmUQnyG30v2muw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UYwwNkRq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UYwwNkRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxTFh2M1Pz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 08:52:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E977453C9;
	Tue,  5 Aug 2025 22:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF55C4CEF0;
	Tue,  5 Aug 2025 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754434326;
	bh=GsZqt0tWPPDkq9+jV7UyO4mTnui6YmSZ802SMrrKP+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYwwNkRqx2F/y+hNs7BxUZUMA+MZCclC+LIaiH8KJd1jQ9+EY63br4eqj8HW2UPBK
	 s4TeyASmw68sIbCZ/YqaHyKI2Bp7JaAvJxliF2dbm0D/enTRLfx5QfSk3kXf/M2gfY
	 JvcunQemgW/z4SOBuZCmWriFhml5is2lXTKkAzJihROVprsLtnZWxY45GzUJmLc4LF
	 bvqTi3UbrEwtINTfaMEpt3dnnL2WJjw8AB3J0zSVaeJPEYpoXELtDG3zTbE1neJgF8
	 nbsayJkXBApno2SNSSH2q0lFOWzzU02ikKI3Os29druCQTWYiN5HnDnNB4LSQR1gVa
	 JDlOP+PBPYCtA==
Date: Tue, 5 Aug 2025 15:52:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 6/7] crypto: md5 - Wrap library and add HMAC support
Message-ID: <20250805225204.GA9931@quark>
References: <20250805222855.10362-1-ebiggers@kernel.org>
 <20250805222855.10362-7-ebiggers@kernel.org>
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
In-Reply-To: <20250805222855.10362-7-ebiggers@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 03:28:54PM -0700, Eric Biggers wrote:
> Reimplement crypto/md5.c on top of the new MD5 library functions.  Also
> add support for HMAC-MD5, again just wrapping the library functions.
> 
> This closely mirrors crypto/sha1.c.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  crypto/Kconfig            |   2 +-
>  crypto/md5.c              | 359 ++++++++++++++++++--------------------
>  crypto/testmgr.c          |   3 +
>  drivers/crypto/img-hash.c |   2 +-
>  4 files changed, 171 insertions(+), 195 deletions(-)
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 23bd98981ae8e..331c4fbb158b2 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -937,11 +937,11 @@ config CRYPTO_MD4
>  
>  config CRYPTO_MD5
>  	tristate "MD5"
>  	select CRYPTO_HASH
>  	help
> -	  MD5 message digest algorithm (RFC1321)
> +	  MD5 message digest algorithm (RFC1321), including HMAC support.

Correction: there needs to be 'select CRYPTO_LIB_MD5' above.

- Eric

