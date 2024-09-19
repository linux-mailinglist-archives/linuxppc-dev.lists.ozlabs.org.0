Return-Path: <linuxppc-dev+bounces-1450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF297C3B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 06:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8NWV5lM1z2yDT;
	Thu, 19 Sep 2024 14:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726721750;
	cv=none; b=MPnJqmw2IClSplrCrWiDgYq25a/qUwXqWsJgiPZmKTZRe+w2+WvL5yEnRs+dy7YY+tPwxYBNWuKF0euZg1pyHCLOfrSj9GlI0ZUlaHYECDpMeIY33wjDNvUUQiODDCDNcy6QoLlIk9XXmH3h7H5ZZb+hfHI3Yp8EXWaCELIHUOAxnOZflShcQiuMQCWI/PKM0pN12boZYgGXGazxlPC1yI6IsTI7Nd95d3yIfYUGq0lLnQkSiXSEwIGeozjxw9sEAfQrEdy/kK0/P3s5swg0KtCxBDEsfe3dW0YvmUGPy+Db5H2TbjdQXXdkuDLAdp+buqHaK+KcZLEynsYJo2FRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726721750; c=relaxed/relaxed;
	bh=MUErbNaxrktoTpPsP7kf+5jpJMqTd7jZyOeBef4Dt5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MFkUYkFueNKN89y/XGR/oFPUPAnzxV9y5nzQOAM0nFzRvBc3T8Wa8FASq9spe1hrwkNWFdnVRTk5zyBTD53+BNFSxm3/q9HBoHCUSExhs70VdP6Xy4b/dJ9IB6ggPUGfBpWcLiVxgEtYq5IWifYw1eNMl8t6MO/DAF0nY4QiXQpZfq+ao0gFs+QF8YdJtWrnKI2RqACJU8R3GB/AxxxR5QNjtGpRJhgte4+EqllQZmLHqs5FA8NMkZRxCDX0roDGkf05dCLB0DAplLre2uCi5FLp9AYUH1w4+CfQYUIKh8OTYFj9kiXT1OT2BGMjQVHfoLgEx97ynZQfVaHrMKtioQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VU5t/152; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VU5t/152;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8NWT3YGxz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 14:55:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726721748;
	bh=MUErbNaxrktoTpPsP7kf+5jpJMqTd7jZyOeBef4Dt5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VU5t/152fmhMt0CYkNKVCVGLcCp6XHTDmv/VwV4yScPxg/LAYyqzs85wvHc0X2JWK
	 9kgkbrGiZXoyB6ksDVdM9I5vEXfJoAWMv+fw6T5w3TWmn9P4fqhxnk4zKwacDKEGoa
	 yc2nyUeiOH8T3qpJjSMBn+l1yDUvP1jsmoMZZjFKRwFRgjfzlr2vYOOyucnu+avrvh
	 HuwB8n/UrTN5tg3DSiwyCRMlPW5rKUiuwkbFOdYkTOE9Y4XOtTCrTKvQ5vS1Kj+4GS
	 Y9jpQcR+zgsjYA+H3OYm0LP/b4KBP0/KlXJDJTDRVcBOXmGwOfP5uiMx+HbDB/oNoN
	 WSa3ymoHYee8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8NWS0mLJz4x6l;
	Thu, 19 Sep 2024 14:55:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
 appro@cryptogams.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, ltcgcw@linux.vnet.ibm.com,
 dtsen@us.ibm.com, Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH] crypto: Removing CRYPTO_AES_GCM_P10.
In-Reply-To: <20240913123043.1636183-1-dtsen@linux.ibm.com>
References: <20240913123043.1636183-1-dtsen@linux.ibm.com>
Date: Thu, 19 Sep 2024 14:55:47 +1000
Message-ID: <87r09gp7ho.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Danny Tsen <dtsen@linux.ibm.com> writes:
> Removing CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
> subsequent patches to fix data mismatch over ipsec tunnel.

This change log needs to stand on its own. ie. it needs to explain what
the problem is and why the feature is being disabled, without reference
to subsequent patches (which will probably be merged separately).

It should also have a Fixes/stable tag.

And as Christophe said, just adding a dependency on BROKEN is
sufficient.

cheers


> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
> index 09ebcbdfb34f..96ca2c4c8827 100644
> --- a/arch/powerpc/crypto/Kconfig
> +++ b/arch/powerpc/crypto/Kconfig
> @@ -105,22 +105,22 @@ config CRYPTO_AES_PPC_SPE
>  	  architecture specific assembler implementations that work on 1KB
>  	  tables or 256 bytes S-boxes.
>  
> -config CRYPTO_AES_GCM_P10
> -	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
> -	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
> -	select CRYPTO_LIB_AES
> -	select CRYPTO_ALGAPI
> -	select CRYPTO_AEAD
> -	select CRYPTO_SKCIPHER
> -	help
> -	  AEAD cipher: AES cipher algorithms (FIPS-197)
> -	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
> -	  Architecture: powerpc64 using:
> -	    - little-endian
> -	    - Power10 or later features
> -
> -	  Support for cryptographic acceleration instructions on Power10 or
> -	  later CPU. This module supports stitched acceleration for AES/GCM.
> +#config CRYPTO_AES_GCM_P10
> +#	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
> +#	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
> +#	select CRYPTO_LIB_AES
> +#	select CRYPTO_ALGAPI
> +#	select CRYPTO_AEAD
> +#	select CRYPTO_SKCIPHER
> +#	help
> +#	  AEAD cipher: AES cipher algorithms (FIPS-197)
> +#	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
> +#	  Architecture: powerpc64 using:
> +#	    - little-endian
> +#	    - Power10 or later features
> +#
> +#	  Support for cryptographic acceleration instructions on Power10 or
> +#	  later CPU. This module supports stitched acceleration for AES/GCM.
>  
>  config CRYPTO_CHACHA20_P10
>  	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
> -- 
> 2.43.0

