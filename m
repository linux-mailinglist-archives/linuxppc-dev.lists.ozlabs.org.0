Return-Path: <linuxppc-dev+bounces-9226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EBBAD26FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 21:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGMtv2Cwjz2xHv;
	Tue, 10 Jun 2025 05:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749498551;
	cv=none; b=SvDl8/fZTse9dBli/EqvCY0fEyiIwuS9pXIIAVgmuu16tatS5hziNZbJ2jXdZAGXm5Y9qGh5hDuU9RWmLuBuq3xNbA+ICeeu9valJLd2UJdgY3xdI7p41NM39Xr3c93UOp4syArOump5oYEEdWkM9Ch2tlz3luIul5AAwF/b/w7MaI6leZBBhbfOmb+rPme1QMk5hgxQ/QAoEbsCP6Etd8NMMcLNyPXhZgutiHuqih4PKXHUNJYxh4zcYLul93/EWqzsEkCuArTTV8waoI1nRO+6wcWd2d4Pedzcx611hZoUuw3ANl4ZkQJYMhbt9rumZ+o9b5XRYEFtbWcm9q0JbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749498551; c=relaxed/relaxed;
	bh=v1PxmnfHMdmrcyvubBDTE9y7CEshlLTBZC8ePZbGBzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n14+WXGOpzguIYsPlNrm4NhKtgbfhwbFrP8/R8YzyLLMGtM90QdNqTLpKCoFJxXZ6TVr/2EWJJ6uFe3HDRFeEAayYMANT622O1BvRCXR43tE+wORr4w7e0PBp2WhdtiNuKB6XrxZzRzefTbmzcsYyHBtldUyN4pDPokKEvzXaAT9mciGxMU5RIgGOy5MREQPR6wnBpSM17cYt6tqIplZ3F5DyNiZfEBAGmQPkclFcZsVpTyEt4/oIOdcowGLTG5hGmsYlB5rKMrzX4nNB8o4BbPQcvL1EyEL165TWttE8twoNICQCmqXdt+p2tAqc/77RkPtP30LOTb2j7GgP5P2vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QK55junN; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QK55junN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGMtt0SzXz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 05:49:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E22E629DF;
	Mon,  9 Jun 2025 19:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5945C4CEEB;
	Mon,  9 Jun 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498547;
	bh=RLgUdqwZ9jil0fkdDSzWjVe6IIMp+UtbacVJeNotnRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK55junN0VbW2TGQ60ZqBGWYViH46R3lRyu4gUydEyY+Hh3KaitiLfFEvBnWI1r1X
	 lRkAy+lEDKGHHODwZuKXmXjD3bma7Uo1p9YeuJDFpOg4S9P5g+Xcg0SSU2vvttcHI9
	 4lR9wO8MNIVxc41xXD74pTH5t5lC3rxHs3ajYv7zAHTC7u7F8taQisrWv24jWv6eEY
	 NAMjDv3elM0fob7CfJw9CVKzwDdg4KQs5dEb5YS6zjc++7S4SPPwQj4A+dAgJwJgOn
	 FVNqVUnGBa5/HSJl7pxNXInlROg8XV9V78mjoJUj00SM7blrPSGCR341rm1XL707q3
	 l5n84gNAl0U8g==
Date: Mon, 9 Jun 2025 12:48:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Julian Calaby <julian.calaby@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250609194845.GC1255@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> Hi Eric,
> 
> On Sun, Jun 8, 2025 at 6:07 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > This series is also available at:
> >
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> >
> > This series improves how lib/crc supports arch-optimized code.  First,
> > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > functions (e.g. crc32c_base()) will now be part of a single module for
> > each CRC type, allowing better inlining and dead code elimination.  The
> > second change is made possible by the first.
> >
> > As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > were already coupled together and always both got loaded together via
> > direct symbol dependency, so the separation provided no benefit.
> >
> > Note: later I'd like to apply the same design to lib/crypto/ too, where
> > often the API functions are out-of-line so this will work even better.
> > In those cases, for each algorithm we currently have 3 modules all
> > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > sha256-x86.ko.  We should have just one, inline things properly, and
> > rely on the compiler's dead code elimination to decide the inclusion of
> > the generic code instead of manually setting it via kconfig.
> >
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> 
> Quick question, and apologies if this has been covered elsewhere.
> 
> Why not just use choice blocks in Kconfig to choose the compiled-in
> crc32 variant instead of this somewhat indirect scheme?
>
> This would keep the dependencies grouped by arch and provide a single place to
> choose whether the generic or arch-specific method is used.

It's not clear exactly what you're suggesting, but it sounds like you're
complaining about this:

    config CRC32_ARCH
            bool
            depends on CRC32 && CRC_OPTIMIZATIONS
            default y if ARM && KERNEL_MODE_NEON
            default y if ARM64
            default y if LOONGARCH
            default y if MIPS && CPU_MIPSR6
            default y if PPC64 && ALTIVEC
            default y if RISCV && RISCV_ISA_ZBC
            default y if S390
            default y if SPARC64
            default y if X86

We could instead make each arch be responsible for selecting this from
lib/crc/$(SRCARCH)/Kconfig, which lib/crc/Kconfig would then have to include.
But I don't think the small bit of additional per-arch separation would be worth
the extra complexity here.  Something similar applies to lib/crc/Makefile too.

This patchset strikes a balance where the vast majority of the arch-specific CRC
code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sense,
given that we're building a single module per CRC variant.  We'd have to go
through some hoops to isolate the arch-specific Kconfig and Makefile snippets
into per-arch files, which don't seem worth it here IMO.

> It would also allow for alternatives if that ever becomes a thing and

If you mean one arch with multiple alternative implementations of a particular
CRC variant, that already exists for many of the architectures.  They just build
in as many as can be, and the best one is chosen at boot or module load time.

But that's existing behavior, unchanged by this patchset.

> compile testing of the arch-specific variants if that even offers any
> actual value.

They all use instructions specific to the corresponding arch, so I don't think
any of them would be compatible with COMPILE_TEST.

- Eric

