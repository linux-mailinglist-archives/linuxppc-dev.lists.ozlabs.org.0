Return-Path: <linuxppc-dev+bounces-2574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24299AFB47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 09:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZZSx2YGDz2xnK;
	Fri, 25 Oct 2024 18:40:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729842033;
	cv=none; b=OaWe/Xel51MYoHL+Ft+FE+xRuWkJm5HTHCPfeZHWj4xlZXBHd1vDCUBt/mMzHAjPEBjrLMyAMKyMPrrP/Q7J/jxDsNrSEXgPo3MeDJoYeSAs1O0gHn7VynYAsLjba1KmalsMcIfl1pltxLQ8qO6F2pkEWfzJ3sNO/t6FIn9vIxgPBehuWPNfZzH211ODMpoLR6Nigt/5uaWOnmAlq5S6JQs175UU84DvzRWU8HqSs8n6+dS7q7JnBdzij4bbc9nn3eI8LPzxfsN+UvzFh2e19ruZDGu69VGvlDP+ERwBCjo1t5eAtkGnn/UkPH4iFShNU8WzHazSP3qb616I2FlOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729842033; c=relaxed/relaxed;
	bh=+Z5ww8tsz14z0EpRv1r8MjOBORCOnzfSXkYCYwpD6ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8ZaypgDDLzXyVsQ42za5rOJ9IJMD6Dk6QzM3ZTr+ZZMcDna6OZqucNUs8Lgy6dCdUSWulQx3eXeDljylwfQwdMY3j7y0HBC2rxdi7b5B4P9BB/jvThQ3u5vCNXR8fFKRDy5Qg5MAqCs8kleRLUe9iO9AS1Cl2tJt6C83GX6D2HrZb17mGdT3WC24nByeEPLukHuO/hhN4YiFGfXcL6AMN0rQH/6I4n3mo3hdzOUwN3VCBlsgTwrtRMezGKcEvycuYLoPc2P6zFIH0w6SSq0Ut7CiQ8HXvFmO6+RYbAiLYrmEM67/jCNSwwB2VMbe+uR+eUp1LlKth+MfpME26182Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bns4FpYE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bns4FpYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZZSw0lqsz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 18:40:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5ED2E5C413B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 07:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447C8C4CECC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729842028;
	bh=MU0jg6+43zlNLQVd5aws5IUywfNhZ0pf6SBTcrSFP0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bns4FpYEweNUDYPWIatTemxTcPXBriNtb6rjMCIGvpZQbQ7/qRGjK2NUk57EKd8ri
	 Mk7HPhv+F7E7+ne72q/Ef8D3KErbLL714tyOI87uCXXzpqZPjXEj/i4/+9MWReDl8T
	 31XCgHFlQsFjl2p95RIKGtfYYk1e4JVgIerVkCXXYdafVkZcg3QKpbq5FXjAqZ38fM
	 DtIUhA6qC/BFjMOrnIVEq9dcd5psyxRFBFdvdxlZAU53TWdpVzWckgliF8es3kpb65
	 T8IX9T0uVRiGneDDJjNiP5c9pbh4ac6m1We4OCbuxBE3WORWLtjtdEfr9QTbaV9H3L
	 0RlKKzK9CtgkA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e59dadebso2249465e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 00:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMIF5CS61zp5aycSgAd0xlfJXujKjitjlW1EnwK8xcOfnACw5UXLDcZ3bCgrbF45pE5YZ53cd9/pEjvy0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOkNrjqjLqRi7si4xXyTYGa1uE3ZGHLaE1vYnCN7DjwjSF5lm1
	3GCoTVHqH7aR82UmgHOvx8zycsKebbRQPpCfB0tNk5TRQf7V6GB6suxOXZdnfIcWxGAXIanOoXI
	x0CjrTXxs3R1erabIwxCxoYybeZ0=
X-Google-Smtp-Source: AGHT+IEDAFlBfPHEymedMPiV9v2ocdpZeEcg/F0dpwJWqR1hIRTo+DXjnmCVJHCSWsx5j4Mh2CDnA31kbRPsOrauBps=
X-Received: by 2002:a05:6512:3c8c:b0:539:8f3c:457c with SMTP id
 2adb3069b0e04-53b23e9d130mr2447127e87.53.1729842026517; Fri, 25 Oct 2024
 00:40:26 -0700 (PDT)
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
MIME-Version: 1.0
References: <20241021002935.325878-1-ebiggers@kernel.org>
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 09:40:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] Wire up CRC32 library functions to arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 21 Oct 2024 at 02:29, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
>
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
>
> This patchset fixes that so that the CRC32 library functions use the
> optimized code.  This allows users to just use the library instead of
> the crypto API.  This is much simpler and also improves performance due
> to eliminating the crypto API overhead including an indirect call.  Some
> examples of updating users are included at the end of the patchset.
>
> Note: crc32c() was a weird case.  It was a library function layered on
> top of the crypto API, which in turn is layered on top of the real
> library functions.  So while it was easy to use, it was still subject to
> the crypto API overhead.  This patchset provides CRC32C acceleration in
> the real library functions directly.
>
> The updated CRC32 library design is:
>
> - Each arch's CRC32 code (all variants) is in arch/$ARCH/lib/crc32*.
>   This adopts what arm64 and riscv already did.  Note, the crypto
>   directory is not used because CRC32 is not a cryptographic algorithm.
>
> - Weak symbols are no longer used.  Instead there are crc32*_base() and
>   crc32*_arch(), and the appropriate ones are called based on the
>   kconfig.  This is similar to how the ChaCha20 library code works.
>
> - Each arch's CRC32 code is enabled by default when CRC32 is enabled,
>   but it can now be disabled, controlled by the choice that previously
>   controlled the base implementation only.  It can also now be built as
>   a module if CRC32 is a module too.
>
> - Instead of lots of pointless glue code that wires up each CRC32
>   variant to the crypto API for each architecture, we now just rely on
>   the existing shash algorithms that use the library functions.
>
> - As before, the library functions don't provide access to off-CPU
>   crypto accelerators.  But these appear to have very little, if any,
>   real-world relevance for CRC32 which is very fast on CPUs.
>
> Future work should apply a similar cleanup to crct10dif which is a
> variant of CRC16.
>
> I tested all arches in QEMU using CONFIG_CRC32_SELFTEST and the crypto
> self-tests, except for mips which I couldn't figure out how to do.
>
> This patchset has the following dependencies on recent patches:
>
> - "crypto - move crypto_simd_disabled_for_test to lib"
>   (https://lore.kernel.org/linux-crypto/20241018235343.425758-1-ebiggers@kernel.org/)
> - "crypto: x86/crc32c - jump table elimination and other cleanups"
>   (https://lore.kernel.org/linux-crypto/20241014042447.50197-1-ebiggers@kernel.org/)
> - "arm64: Speed up CRC-32 using PMULL instructions"
>   (https://lore.kernel.org/linux-crypto/20241018075347.2821102-5-ardb+git@google.com/)
> - "crypto: Enable fuzz testing for arch code"
>   (https://lore.kernel.org/linux-crypto/20241016185722.400643-4-ardb+git@google.com/)
> - "crypto: mips/crc32 - fix the CRC32C implementation"
>   (https://lore.kernel.org/linux-crypto/20241020180258.8060-1-ebiggers@kernel.org/)
>
> Everything can be retrieved from git using the command given earlier.
>
> Since this patchset touches many areas, getting it merged may be
> difficult.  One option is a pull request with the whole patchset
> directly to Linus.  Another is to have at least patches 1-2 and the
> above dependencies taken through the crypto tree in v6.13; then the arch
> patches can land separately afterwards, followed by the rest.
>
> Eric Biggers (15):
>   lib/crc32: drop leading underscores from __crc32c_le_base
>   lib/crc32: improve support for arch-specific overrides
>   arm/crc32: expose CRC32 functions through lib
>   loongarch/crc32: expose CRC32 functions through lib
>   mips/crc32: expose CRC32 functions through lib
>   powerpc/crc32: expose CRC32 functions through lib
>   s390/crc32: expose CRC32 functions through lib
>   sparc/crc32: expose CRC32 functions through lib
>   x86/crc32: update prototype for crc_pcl()
>   x86/crc32: update prototype for crc32_pclmul_le_16()
>   x86/crc32: expose CRC32 functions through lib
>   lib/crc32: make crc32c() go directly to lib
>   ext4: switch to using the crc32c library
>   jbd2: switch to using the crc32c library
>   f2fs: switch to using the crc32 library
>
...
>  89 files changed, 1002 insertions(+), 2455 deletions(-)

Very nice cleanup!

For the series:

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

