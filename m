Return-Path: <linuxppc-dev+bounces-8156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12CAA12B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 18:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn62C37Fgz30Vy;
	Wed, 30 Apr 2025 02:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745945875;
	cv=none; b=om5/TdN1csjgn+wGkl2hnZA5lpNnOzKAp1NXCv8LTLSOTLSwTbnuJ4oLyimdd5S8jvT06IfIe13are3xqthb+AIdFT4hnYo+otBBL+u9KOnrEiy9qbopTd4vIfnO/VfQl7FhDq/Buylh/K/l58dPwaKrZqurQIx2zhhFDUdrTf6L2+crgY4SdMd39zX9kFgZv4tFr5sr4qyvXRBWls5B51Qp+ym+rm9Bpem9+AkdYtVY/y1b+tQZNov73pe58zAFpJnfZGA8KegdfuCHinlP5cCIbWKlSR3LYIBfEcqHuVAGG5b0y43vwbAwg96Gwi368U4xlbesRe/4pN97WN1Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745945875; c=relaxed/relaxed;
	bh=QO/JzkFeR8Cw4Pz+qN3wV2FVMmsJPbvvbqUaPRHm5Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6KhHHI5arVRiJ/3fNAeWRtE6ExWTeyPGv+qXW0q6TDMx6jmTj2LMxAEFmnkMn+bWrS5n9XpDrAV0BsPCJRzKGtHXo8sR6ku4DnMMFOKQwLJh4TAIPvTuLf/MwJx6islNLVTSaYZt0yb75oVSbRhvDInNL6nJuT6pfEB3hr8Uys1b+AkuqmvrACCrz4BjLOabhSxo86O+NO+0ApxRa7oGu/spWLLvAcqJXiYJ74YZgLc/4pgwiQ5vR7NAeAvWhXdOucz4F6swwb4Zam33fmFyqfrjHPZUqDtld+S3bevkZsbNF7K7Tn2qhE7khJ6hoHzgpm4+SIo7k/IJeK4siapiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VfHRE0Zf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VfHRE0Zf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn62B1bHDz2yfv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 02:57:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB9BC5C136A;
	Tue, 29 Apr 2025 16:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA3CC4CEEA;
	Tue, 29 Apr 2025 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945871;
	bh=Tg1ctzwo0ak0Lwu1YWKgH+RS3fovIZ1X+v294BjOsH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfHRE0ZfOmDAVECATIVhnIIEDv8InpF/NVtbUFhMnpUd0U4Y+5b0Ww4zgRVL1MNmR
	 u8gCoUF2f9BknbD6Z34UXG4o4jeie06f9l37yhBS9hg7PyyZPh0t76hiNmFRLKGGi5
	 iEyi9z3gFBB3tX3cQpD1giyD3J3AvQz31/yIHy3BsfSa938ZSffUIHVakH6CrbbrdF
	 VDAjwRavumw/UONhO/E9zhOSkKcu9AG/KUZggezyKAUSbacO11GC7UHvJUwjFrcjyu
	 f0RJmP3EuGwQ5b0kiClDl4KQSZySaB5MQps8Q90qLLDnvzKrTossosvNsmID5DJOBH
	 TIWeglu12AohQ==
Date: Tue, 29 Apr 2025 09:57:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250429165749.GC1743@sol.localdomain>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
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
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 28, 2025 at 01:17:02PM +0800, Herbert Xu wrote:
> Changes in v3:
> - Add shash sha256-lib/sha224-lib to provide test coverage for libsha256.
> 
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957558
> 
> Original description:
> 
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.
> 
> This makes it possible to use the SHA-256 library in
> performance-critical cases.  The new design is also much simpler, with a
> negative diffstat of over 1200 lines.  Finally, this also fixes the
> longstanding issue where the arch-optimized SHA-256 was disabled by
> default, so people often forgot to enable it.
> 
> For now the SHA-256 library is well-covered by the crypto_shash
> self-tests, but I plan to add a test for the library directly later.
> I've fully tested this series on arm, arm64, riscv, and x86.  On mips,
> powerpc, s390, and sparc I've only been able to partially test it, since
> QEMU does not support the SHA-256 instructions on those platforms.  If
> anyone with access to a mips, powerpc, s390, or sparc system that has
> SHA-256 instructions can verify that the crypto self-tests still pass,
> that would be appreciated.  But I don't expect any issues, especially
> since the new code is more straightforward than the old code.
> 
> Eric Biggers (13):
>   crypto: sha256 - support arch-optimized lib and expose through shash
>   crypto: arm/sha256 - implement library instead of shash
>   crypto: arm64/sha256 - remove obsolete chunking logic
>   crypto: arm64/sha256 - implement library instead of shash
>   crypto: mips/sha256 - implement library instead of shash
>   crypto: powerpc/sha256 - implement library instead of shash
>   crypto: riscv/sha256 - implement library instead of shash
>   crypto: s390/sha256 - implement library instead of shash
>   crypto: sparc - move opcodes.h into asm directory
>   crypto: sparc/sha256 - implement library instead of shash
>   crypto: x86/sha256 - implement library instead of shash
>   crypto: sha256 - remove sha256_base.h
>   crypto: lib/sha256 - improve function prototypes

To be clear, the objections I have on your v2 patchset still hold.  Your
unsolicited changes to my patches add unnecessary complexity and redundancy,
make the crypto_shash API even harder to use correctly, and also break the build
for several architectures.  If you're going to again use your maintainer
privileges to push these out anyway over my objections, I'd appreciate it if you
at least made your dubious changes as incremental patches using your own
authorship so that they can be properly reviewed/blamed.

Please also note that I've sent a v4 which fixes the one real issue that my v1
patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org

- Eric

