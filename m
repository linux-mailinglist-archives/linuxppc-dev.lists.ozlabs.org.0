Return-Path: <linuxppc-dev+bounces-15294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61CCF6F11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 07:58:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlhpS2crqz2yKr;
	Tue, 06 Jan 2026 17:58:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767682720;
	cv=none; b=SSVQ9kY63lFeNf1e8hsw7xM3Oht2ja7OKOyaFNzl9q98eHq8x/92invPvKA1heD1AtjoIbQ8cgSH1vtdB73UO36FSDeFSjltj5N89uxg9MunsnhjScGsmCoQPrtIrAbcX0DRquLenLdXoLXAb1O8qzFAkRMt6tbfzPkx5mAQAG/JCT35rLFEpXG33LQb3tF96LKO5SbT6q8ZiZvOcustX2R/0JE5Dcoz0ffrAE8Yv8WN0otNRKbvpLy1lbAm7jngLVfPiPRAeXPr7mF3fP74szgfJk4dRNOtXS0LmenuSpImtfefSR+XfkvBaqvcbQ/dtTUg2exGxpuc9QJaAxWddg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767682720; c=relaxed/relaxed;
	bh=FpitPUAOqRhHNiQu5/A59labdYmuVavqAeylGVyamP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4ZPyowAdZHasqMQ0mPkiunfLHRqSKT4dvoq0J1w9M82CVnrI8Ph6Rcte8wxuBlVI1zatdI58f7qNr5YjWKunOCBtyx0gHdAOeSe80/LncjOHR6p047RGxDLdZn5LsbwWHdnfGH7RxzIX1DGdeUThFi2+9uB/J0FS1MIJhPwW5dTIqm5LhY2YO9HNPnRIjoAshLkSJjMhccJvT4GCfMoBu51h4Bth3/s1bhz6SM+CtKIsdushHQx98+oePpeOzJv7ju2+QKNHBzk+cLZJXoLkpJLdq9gyLpnIiacSl9wQsFb1Ir+QGVGgNEHvfSWrGH4cXOtxO/dlgxu95H+6/3+1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gH/mbhwW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gH/mbhwW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlhpR1rswz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 17:58:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDCEF6011E;
	Tue,  6 Jan 2026 06:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076F4C116C6;
	Tue,  6 Jan 2026 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767682716;
	bh=QQtOk2YRE84AoYQ+kSLZyLAyg4ikVDFr3IES1pY5ozA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH/mbhwWcmbSviWB2aCXqeJKPYzexAoK01Yg6s6cLwpp5mznoR4J9YtzBX0+JaB2Q
	 RGzl1CWYt5ctBprLFLGJSvPejfop4znvHRnWwqgqpJHcHC0j9ob/Np83XrO9+Cl3TX
	 VS8m3uLgzCzbvtCwipbPzokR0Dek9Wxm/0Ippytis8vLZ/I6x2I70gfKMwQbmEhFro
	 NAdguE5T18zqwp0QS2kDwlBde/OWsN6qjyPmGKZIp7wCv7/K32g7gRemPHItu6WY9g
	 OF83QkAKrc+JLLzKj3XjbpThHQLvD4g3n1HMYbOp1iZmU15u/EOi4JVaYquL+5oCoh
	 XLNrjl71mrNfw==
Date: Mon, 5 Jan 2026 22:58:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason@zx2c4.com,
	ardb@kernel.org, dengler@linux.ibm.com, freude@linux.ibm.com,
	herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260106065817.GB2630@sol>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
 <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
 <20260105190503.53cc31dd@pumpkin>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105190503.53cc31dd@pumpkin>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 05, 2026 at 07:05:03PM +0000, David Laight wrote:
> On Mon, 5 Jan 2026 15:40:22 +0000
> Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> 
> > >  	/* Most significant octet of plaintextData corresponds to data[0] */
> > >  	swap_buf(r, data, 16);
> > >  
> > > - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data);  
> > 
> > One thing you might want to consider, which reduces the churn in the series.
> > 
> > You can use _Generic() to do type-based dispatch on the first pointer. 
> > Something like this:
> > 
> > void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
> > void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
> >              const u8 in[at_least AES_BLOCK_SIZE]);
> > 
> > #define aes_encrypt(ctx, out, in)                                       \
> >     _Generic(ctx,                                                       \
> >              const struct crypto_aes_ctx *: aes_encrypt(ctx, out, in),  \
> >              aes_encrypt_arg: aes_encrypt_new(ctx, out, in))
> > 
> > 
> > i.e. it keeps the _new()-ism in a single header, without needing to
> > change the drivers a second time.
> 
> You'll need to cast the 'ctx' argument in both calls.
> All the code in an _Generic() must compile cleanly in all the cases.
> (Totally annoying....)
> 
> 	David

It seems it would actually have to be:

#define aes_encrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 const struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key, out, in), \
	 const struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key, out, in), \
	 struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out, in))

#define aes_decrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 const struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)key, out, in), \
	 struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out, in))

Note that both const and non-const args need to be handled.

It also doesn't work for any callers passing a 'void *' or
'const void *' and relying on an implicit cast.  I didn't notice any,
but that needs to be considered too.

I guess maybe it would still be worth it to avoid the "*_new" name
temporarily leaking into too many files.  (It goes away by the end of
the series anyway.)  It's just not quite as simple as you're suggesting,
and all the callers have to be checked for compatibility with it.

- Eric

