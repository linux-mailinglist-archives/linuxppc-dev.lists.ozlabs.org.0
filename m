Return-Path: <linuxppc-dev+bounces-15416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38594D0267C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 12:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn2np5WqBz2yGl;
	Thu, 08 Jan 2026 22:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767871966;
	cv=none; b=G6QtIvjhbtrOwrfm9yRsG4acCPmjtO4GuJLWzoQETgL2chamXBW5BTU8nrfuhcht0nIWdLLe30QMw4guGjvIBV2sXW0+TCSVmlwZQxJBonVF/f6E7UTl0hcfeKOUzMDglRTcyI4G2onIAFClrfwX5bDOqvR54l2CoapslNRHoKqmphHmFqECc4LgoSC5XczxXMcCCpFIeermt9/0eutpY1abjJuQqNZIk8r/W4Lk4t3mPs9eDNa1ktb21NC77hLtS+gBurPhFN5meeHxOZptzDKiW3ujJlpdYEBWyfMaMFI26g6GZElZTNW2KASmyS/k9wwGUUTZ9cdnZewrubm5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767871966; c=relaxed/relaxed;
	bh=OkEDjCTgjcG1N4pMu7OE1VqtJd5WSLxPjSWKunpWPTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WO/HrlD4YeyXxApACT2UNhdv3Cij7wfBXBZFweDm5kEw6FwzNakeACCZbFigAVJZ+RftJlytz2grrw+/xpoHtpfB0m562TSJHHmOXToJMiy8rP9OrFRXbsW17XwqD8xV7Vjva+gSzIPx5lERa5B9/vG9OMdt9pEUeQf6k5OtLN/liFsGNESCBZOaPvTFiTFogJAOIFKebO/M5uiDKA4zsklkw1arSktgmirMub/kZVURkIHwcIE9otnaumRWOpXh/ZL1V2dom+bGitauHoWiXGC71YBPjVTiVzxg1qN5lIhBfqzpQnWv1LqkCFrf4m1/TQwaQTzzdY7e5ICpMEkZug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tt8VmR3V; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tt8VmR3V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn2nn4jWcz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 22:32:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD29560143
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jan 2026 11:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6468EC19424
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jan 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871932;
	bh=pYfshooaQVx14ogaTwRBPlNZFkj/iWvrj8HN1katBFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tt8VmR3VshCgHL0sX0ZHoLqIfD0Rl3cLJfl1ZhoX+viQNalklsP3KEGhmpF2PQABL
	 i/e4fQeEWCP3E8UrGxvJAz3JuiRdFBXe9UimxMdTmRlLsZNu/U5vTUEyP7Ks+4qkxU
	 XxkejKAY6NBLbl/r1AsLAyAnuNWCjV0RjM7is+V+ou17Bcc2h2b/jwV3sTJ8RfZ0mU
	 5QCe8I5A9kvK9DS1HJ9oD7trUK76a+ekfIJRJLeJFGPYGgEycSjFxndrstt2RPdvCq
	 g0kCEYTkOBwHO0b6P+CdVWNXzaaTEiF2vxlnRRUwhG5MIv4f5YIZKepkz/7OWtnjS/
	 F/DxUh7mTqQMQ==
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c565b888dso2684654a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 03:32:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbHnSGevD2CEHkzps3zhc1hgCRhHwV9+zv1JrepABJW9D7wI6JYajs/czeu0S+dlaaV5zDk/MKIkgElMs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxus68nObj8uQ1KqkSWHT50ZJVpVkUEli7fK54dkrEOBf6NdaBU
	n806YF226GDSn2zBK81ROv3LN45O2VMtEtQ4wA7rTEQodHucTvqDqkQcRyLRpPYI6LvfaVDnGqq
	z92cTuA3mv+oKaGQeyQQbEijUm/mvNb4=
X-Google-Smtp-Source: AGHT+IGDINyxTPkhAN4b7317PDsO1QtIqu1Y45mlnouNM/WvPFlwsh7kX9R86h9783kJT5r1JA/b7Ab2jLcoi2FXZJU=
X-Received: by 2002:a17:90b:4c46:b0:34c:f92a:ad05 with SMTP id
 98e67ed59e1d1-34f68b9a0ffmr5904349a91.11.1767871931935; Thu, 08 Jan 2026
 03:32:11 -0800 (PST)
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
References: <20260105051311.1607207-1-ebiggers@kernel.org>
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Jan 2026 12:32:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
X-Gm-Features: AQt7F2osJiUBFnBRtOlALeERCnUAMf6rielCvEbX7HMdjqJIXrz86eWJVpNeDcU
Message-ID: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
Subject: Re: [PATCH 00/36] AES library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Holger Dengler <dengler@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies to libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
>
> This series makes three main improvements to the kernel's AES library:
>
>   1. Make it use the kernel's existing architecture-optimized AES code,
>      including AES instructions, when available.  Previously, only the
>      traditional crypto API gave access to the optimized AES code.
>      (As a reminder, AES instructions typically make AES over 10 times
>      as fast as the generic code.  They also make it constant-time.)
>
>   2. Support preparing an AES key for only the forward direction of the
>      block cipher, using about half as much memory.  This is a helpful
>      optimization for many common AES modes of operation.  It also helps
>      keep structs small enough to be allocated on the stack, especially
>      considering potential future library APIs for AES modes.
>
>   3. Replace the library's generic AES implementation with a much faster
>      one that is almost as fast as "aes-generic", while still keeping
>      the table size reasonably small and maintaining some constant-time
>      hardening.  This allows removing "aes-generic", unifying the
>      current two generic AES implementations in the kernel tree.
>

Architectures that support memory operands will be impacted by
dropping the pre-rotated lookup tables, especially if they have few
GPRs.

I suspect that doesn't really matter in practice: if your pre-AESNI
IA-32 workload has a bottleneck on "aes-generic", you would have
probably moved it to a different machine by now. But the performance
delta will likely be noticeable so it is something that deserves a
mention.

> (1) and (2) end up being interrelated: the existing
> 'struct crypto_aes_ctx' does not work for either one (in general).
> Thus, this series reworks the AES library to be based around new data
> types 'struct aes_key' and 'struct aes_enckey'.
>
> As has been the case for other algorithms, to achieve (1) without
> duplicating the architecture-optimized code, it had to be moved into
> lib/crypto/ rather than copied.  To allow actually removing the
> arch-specific crypto_cipher "aes" algorithms, a consolidated "aes-lib"
> crypto_cipher algorithm which simply wraps the library is also added.
> That's most easily done with it replacing "aes-generic" too, so that is
> done too.  (That's another reason for doing (3) at the same time.)
>
> As usual, care is taken to support all the existing arch-optimized code.
> This makes it possible for users of the traditional crypto API to switch
> to the library API, which is generally much easier to use, without being
> concerned about performance regressions.
>
> That being said, this series only deals with the bare (single-block) AES
> library.  Future patchsets are expected to build on this work to provide
> architecture-optimized library APIs for specific AES modes of operation.
>
> Eric Biggers (36):
>   crypto: powerpc/aes - Rename struct aes_key
>   lib/crypto: aes: Introduce improved AES library
>   crypto: arm/aes-neonbs - Use AES library for single blocks
>   crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
>   crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
>   crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
>   crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
>   crypto: aes - Remove aes-fixed-time / CONFIG_CRYPTO_AES_TI
>   crypto: aes - Replace aes-generic with wrapper around lib
>   lib/crypto: arm/aes: Migrate optimized code into library
>   lib/crypto: arm64/aes: Migrate optimized code into library
>   lib/crypto: powerpc/aes: Migrate SPE optimized code into library
>   lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library
>   lib/crypto: riscv/aes: Migrate optimized code into library
>   lib/crypto: s390/aes: Migrate optimized code into library
>   lib/crypto: sparc/aes: Migrate optimized code into library
>   lib/crypto: x86/aes: Add AES-NI optimization
>   crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
>   Bluetooth: SMP: Use new AES library API
>   chelsio: Use new AES library API
>   net: phy: mscc: macsec: Use new AES library API
>   staging: rtl8723bs: core: Use new AES library API
>   crypto: arm/ghash - Use new AES library API
>   crypto: arm64/ghash - Use new AES library API
>   crypto: x86/aes-gcm - Use new AES library API
>   crypto: ccp - Use new AES library API
>   crypto: chelsio - Use new AES library API
>   crypto: crypto4xx - Use new AES library API
>   crypto: drbg - Use new AES library API
>   crypto: inside-secure - Use new AES library API
>   crypto: omap - Use new AES library API
>   lib/crypto: aescfb: Use new AES library API
>   lib/crypto: aesgcm: Use new AES library API
>   lib/crypto: aes: Remove old AES en/decryption functions
>   lib/crypto: aes: Drop "_new" suffix from en/decryption functions
>   lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox
>

Nice cleanup

Acked-by: Ard Biesheuvel <ardb@kernel.org>

