Return-Path: <linuxppc-dev+bounces-9600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE77AE2425
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 23:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bP9qK1F3wz30Pn;
	Sat, 21 Jun 2025 07:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750455581;
	cv=none; b=npHaNzPDSwdoUPTbVULVdf2KtH043PTxnAOiXmWgexiCS9Gx7BeaVHBLP0X1E8xuqpJdCiOqDSklNumlNI09rlgib8eEwVD75uRoadaKtH0iizl95SnJFtY40NR7Z69D5sPOjTadBWnJUQFABwfR46uwDH9spsFtY8rXOy1OLaqCltXYB5Q0rENws3bopxm2/tHgXffYtlCoOC+QGcZInfhPW1NAPFq3phlZtgX9MpOhauOdMh5lnzzLFCZ+g0s3DktHVXnX0rT4LobeHnFksTXXOTARoLPWTU5/hP743o9b1E1LZh/QR2c3U8ktTKB1/tc5nd8KQnlRl0vryeV0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750455581; c=relaxed/relaxed;
	bh=VlZH0l+Wf1bVanJ4bbEfo9R/bk9uY0/tSUsiGui4YeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv77dNtLbPInn1pab5Y+8MlLl1cvp5tCSTJkB4wGVO1Y9rhmMNzk4F9w0Me/G/wB19mOCU356RgByh34q/rACN8q3cuL8KjxM49+8CDdISfo2mID5LPAE9oXRyGytPis0+xKvvFIUqoe2eenSOJCDSVL7Ze+uZW5nSi0QvAdv18GQkCzohuEfhrOlfQaqwfzY/G3kW1fyvCbL30ii/JUuLdwVPfN50NVHwsWD7GIATpAr2UUHfH24FTCDnW07J7tNMPpcQJcSAt9JCGWQ7+80OrDiEyJBx7wH19hUIlhhZvoUgTcOIgFqtdjpv3xeZAaGlas/XObqfGwKyHqxa1Tng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jJfZU4Vl; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jJfZU4Vl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP9qJ16Fpz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 07:39:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08767615ED
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 21:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FB2C4CEF8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750455577;
	bh=HvoFMsnVPaebNolXyEd0amy4ilKaPCQCYOjaJT3HRfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jJfZU4Vlyv60JLf4iYDzXyYj/nNjhRcuRyHNx/9hf1bvjOsD/F3//RsHPhpBnMvu1
	 sHOuMaZNHrm1NP/OmRnsAsoiIfuN6NQdHRux1JYZKklSHFNo3QRkWEmGXQhA9bQ1Pt
	 7Je39+LmoAGcqvDoPPqBsDnIYV9O0mez0OCndPDKcLPSYZm4s9atUB+OzHNXTpIsWk
	 BFDevwltARm0TQJUc0KDj4xt99mrgD5pveawyhxsuMTTJtSOfhBaUXVRX8RtDN+haj
	 5jImxo/vKcxFVFTcWmRi9pN5JK/XeV0v4p2sCz/ECpyw8qTB0/Oo9ixY3eo5cEIrfp
	 Ycg1/VMY7bIYw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so2345125e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA8RWwtLy0ZPsZtB2dydhkU0w4Bw9+Tjjpdlj2/ayiLcWkkeQoNhgnlXgRA3AVXlPK5QlIFHRE2RjuSbk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbtfjMpJEPjWIf6EF2GtSncBtq0Yldxn2ARFI4asUdcT1O8AvZ
	z5HuSqiLveU8sd5WHGe7GNaCxa1Fn8NHCsLNXEpoimyrx4Hy6r+4w/7ryVZsuNDX/03K0S/DA0v
	5bnxNM0J+A1gmfY+PXrNH549S261jMFo=
X-Google-Smtp-Source: AGHT+IFlzPdW/TAjB41pWNx+EWn0IQNKfWjtbAPkCDzwR/Cmxb5FPmWfpoRjKRGa+GebEYrhPkOrWG7ilfOzIslgaJA=
X-Received: by 2002:a05:6512:15a2:b0:553:510d:f464 with SMTP id
 2adb3069b0e04-553e3be0118mr1238378e87.25.1750455576146; Fri, 20 Jun 2025
 14:39:36 -0700 (PDT)
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
References: <20250619191908.134235-1-ebiggers@kernel.org>
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 20 Jun 2025 23:39:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
X-Gm-Features: AX0GCFsPzv-r5KhW4GCiBgsxcKQ8jDKA8HBlXZ_WU75HnhkUOj_Q-bl9RCm5Y74
Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 19 Jun 2025 at 21:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2
>
> This series moves the contents of arch/$(ARCH)/lib/crypto/ into
> lib/crypto/$(ARCH)/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory series, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later patch series will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Changed in v2:
>    - Instead of keeping arch/*/lib/crypto/.gitignore, instead add entry
>      for now-removed crypto directory to arch/*/lib/.gitignore.
>    - Adjusted commit messages and titles.
>    - Added Reviewed-by.
>
> Eric Biggers (9):
>   lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
>   lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
>   lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
>   lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
>   lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
>   lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
>   lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
>   lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
>   MAINTAINERS: drop arch/*/lib/crypto/ pattern
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

