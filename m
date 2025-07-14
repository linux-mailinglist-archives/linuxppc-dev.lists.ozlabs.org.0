Return-Path: <linuxppc-dev+bounces-10240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41033B0358F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 07:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgW0j2R4Mz3br3;
	Mon, 14 Jul 2025 15:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752470549;
	cv=none; b=kwpNKScLuLHe/495c5b7bMSAmb/vrVvmIEv2V3h+uq3PoVf3DfvQqbuWfBqRXF4Gz6K+qM4bO4NRjwzZlJu9/tD8PAFDWqgkMFmX0nPXmenHpEfq3A+cxYE0IXIUurI1H/zUs/zNb1u/AEWHaS0vgibDdxq6lo5+nip/cjV1GkskvTPM04QPskLL2TXtqDcH6E5a9WgP1sJnsPlu/dphBB3pz23XYlKzSjCZ1rrJ/Xg9+kuF5YgxPwwNSmT5hSqVgr8lGy0PFtQMTwdshTvr+CyEd77cPmrE1+Sa3HKhgCJDRQ6CzFrtEBKyhSBIlo0yp8qykt8NhS3Ka0HKphW6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752470549; c=relaxed/relaxed;
	bh=8rgSRmRXZEE26X8vSLtT6PrIru0MhRBWz1OoeGzH61U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7kFEDCRuf4jC4/7ELEpIC0JWqMC86IN9q0wTU9vG++02GZoh7SJqE4p3eU7vplrp29tkgHu7S2QM8xEP5wEc3G+f9VBHdW0mpKkvkOemv+mYIRoNm5j2KRdQ2+YBEpP1p7chVamYiCZWq8VcHwTf5VTfQW61qvY3fHlqNROok9ESSsZ4zkeAsjGSCiA92zIoJOpnyRYQCr+2x5CcExeHRflr7VqTULw0dzlpWz9TWm/OJNvzJkTjjuKqX0sEQy9i0Obbhf8B3brL51hLCzdS9bapQNOmLnjK/XSpCm0bdy6PvJQSo2R9SjxLfyWhMeoPYKdCZ72hberfi2lVNGOhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lzd55PdU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lzd55PdU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgW0h3dLVz3bqQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 15:22:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA6935C595C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773EDC4CEF7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752470545;
	bh=pAb5wRbhQET+kmUSyBJ7QX6Te7INTWO7qdGK9VkXql0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lzd55PdUdq+c+mAd5uySwMSoUH+kaA4A1+lO4Bp2rWjPOuURmtFTKJqiu8+7oHe/2
	 IWd04Cz6zEMUQGxVCULy4y7Pt258a8kqHbqQ9KRbbYTL89XmaCBSNKFzrQ4lSDmxz6
	 Tn1fhnyzKHfp0lVx3oVYAYX0CFijcSHtacycMNx1oM1cSeYl06AGSSe68K4TL24j/q
	 SndjW3Hf+al+rTdChZ/5v3b+HTWeEzWXggdgAGknnrTSFiaHT1uky0a6o1NuEQsFmJ
	 hO719WuReX0D1U/zm/1TrSO2KoWdJXzHoRvgs2M7wj2fT/zaF4pcbrq0ecVLli1GES
	 XIeDW4bt8QHAg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so48453571fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 22:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8Y8O8/zKImo4DNRtmFoM2c0BoRWopD05/d5EDHE+mdYTKVS6vnEjPvWk8brwiHMIyOv2RFX3nrZANf+k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJJKM3Fjm5ByEu862uXBQWzEOFVrXYkCCn2QuRzBX4EVaJW0iX
	nok1xJnqc9dzv8zqjrD87CECDgUf6kOujK0NGyLRXxVb8DqQbTRzuJaW03XOdehgkfNl8ws5FUh
	/blwzHitDTAaKxhQPBjVbOHWGMnpDoMM=
X-Google-Smtp-Source: AGHT+IF8eKcSow8wXiBWe1ZtHXBbfzA+mJh/QYc9UT+26PKpYbp48jE/SYcyCuO5sRz/aNI8XoUCHiEWvfP2lMj1cew=
X-Received: by 2002:a2e:b894:0:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-330520af931mr41229641fa.7.1752470543799; Sun, 13 Jul 2025
 22:22:23 -0700 (PDT)
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
References: <20250712232329.818226-1-ebiggers@kernel.org>
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 15:22:12 +1000
X-Gmail-Original-Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
X-Gm-Features: Ac12FXyawDsE4qmZuudtL0JGLEW7eYqwCyaWBTQgeIZfWtrJNQHxtUbS816vJ3g
Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
Subject: Re: [PATCH 00/26] SHA-1 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 13 Jul 2025 at 09:26, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha1-lib-v1
>
> Patches 1-14 reorganize the kernel's SHA-1 code to be consistent with
> the way the SHA-2 code is now organized:
>
> - Add SHA-1 and HMAC-SHA1 library functions.
> - Make the SHA-1 (and HMAC-SHA1) library functions use the existing
>   architecture-optimized SHA-1 code, which is moved into lib/crypto/.
> - Reimplement the old-school crypto API's "sha1" and "hmac(sha1)"
>   algorithms on top of the SHA-1 and HMAC-SHA1 library functions.
>
> The diffstat for that part is:
>
>     65 files changed, 1052 insertions(+), 1582 deletions(-)
>
> This hopefully should look quite boring and familiar by now, as
> essentially the same cleanup was already applied to SHA-2.
>
> Patch 15 adds sha1_kunit.
>
> Note that while SHA-1 is a legacy algorithm, it still has many in-kernel
> users for legacy protocols.  So it's not like we'll be able to remove
> the SHA-1 code from the kernel anytime soon.  And some of these users
> are currently having to jump through some *major* hoops to work around
> the limitations of the old-school crypto API.  The library API greatly
> simplifies things, and it makes the SHA-1 code consistent with the SHA-2
> code.  So, IMO it's well worth doing this reorganization of the SHA-1
> code, even though SHA-1 is a legacy algorithm.
>
> To show this even more clearly, patches 16-26 convert various users to
> use the SHA-1 library API (or both SHA-1 and SHA-2, in the case of some
> users that use both algorithms).  The diffstat for that part is:
>
>     27 files changed, 169 insertions(+), 903 deletions(-)
>
> For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
> would be for later, and I'll probably resend them individually later for
> subsystem maintainers to take.
>
> Eric Biggers (26):
>   crypto: x86/sha1 - Rename conflicting symbol
>   lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
>   lib/crypto: sha1: Add SHA-1 library functions
>   lib/crypto: sha1: Add HMAC support
>   crypto: sha1 - Wrap library and add HMAC support
>   crypto: sha1 - Use same state format as legacy drivers
>   lib/crypto: arm/sha1: Migrate optimized code into library
>   lib/crypto: arm64/sha1: Migrate optimized code into library
>   lib/crypto: mips/sha1: Migrate optimized code into library
>   lib/crypto: powerpc/sha1: Migrate optimized code into library
>   lib/crypto: s390/sha1: Migrate optimized code into library
>   lib/crypto: sparc/sha1: Migrate optimized code into library
>   lib/crypto: x86/sha1: Migrate optimized code into library
>   crypto: sha1 - Remove sha1_base.h
>   lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1
>   bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
>   sctp: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   ipv6: sr: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   tee: Use SHA-1 library instead of crypto_shash
>   lib/digsig: Use SHA-1 library instead of crypto_shash
>   drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
>   nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
>   ppp: mppe: Use SHA-1 library instead of crypto_shash
>   KEYS: trusted_tpm1: Use SHA-1 library instead of crypto_shash
>   ipv6: Switch to higher-level SHA-1 functions
>   lib/crypto: sha1: Remove low-level functions from API
>
...
>  92 files changed, 1472 insertions(+), 2474 deletions(-)

Again, the diffstat speaks for itself.

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

