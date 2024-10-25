Return-Path: <linuxppc-dev+bounces-2614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587119B1299
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 00:32:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZyFV0nLcz3bby;
	Sat, 26 Oct 2024 09:31:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729895518;
	cv=none; b=eo6NA1FAMMhkgwEJP1pKv+2L0KUgE+eHTe88qRUpiOIObUSObBcMzd/XAAxlwRAvrzADAJfO3Bk2kR+vjvLLdnYL4pJcakLJudO49nJH9tHETy+5lZnIIDIk5IRdEQhaiO3M1++T/92aXx4tuU3VdWQAD6x1ulrsgMa0VX2xah5RL3OfEUN5FKbxpFKSj6DZ0ACaHXkBh1NPhwhMUSt79mt7W4vBcdxcQSE0Hj7t+8PgWDmGxQgCwqG9pCKiyiQGWUkqU+NrdavpDjPYU8LQiFUSRrInVilk/rbDDQ4EZ5MX9Cxvz3Y0VlayDt5OchDGe882/8cwTA7GRaQS/dO+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729895518; c=relaxed/relaxed;
	bh=pmMrJRYzrtx0eulT7RJiLZMuZUhbX4LJa/Dc4U1fcrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoWu+T0h+hJ3kqHC4CMHlF4fU7SDfxZr8BmcQjv8Gfjr7V/QI9wsxzJJa29QGg1JxAvxSO7z/qfo9GQdSYrxrf/7EmJ9Lacx+KztSyVMuCflsh1PTrokagFEpH5BkYPqazA9rHuV/5BwsC3RyXenPwlGfh6w+zhWY5MgAr+3jV/H97qxeZe3f8MMKU+RF7yWv9UnCweKadiEiYHgoKnRradIyQtmSpv0Wwv+UHl5LAen7Ri7IpO9ehYROaD6r0ysQcx02UnOGhgIcjmJVbRbHr/qpCuFy71DAqCiw3lgrmL2ZgLoSMrJ+cWcVKG9C3aj/haf69FeIYrdeQ5wSwIwTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=de2ooFjp; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=de2ooFjp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZyFS45Nwz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 09:31:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D6DF5C51BA;
	Fri, 25 Oct 2024 22:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE278C4CEC3;
	Fri, 25 Oct 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729895514;
	bh=mVLVxjwpOT42Kb7f4O3vXqKoUSnuXxrku5/kKxjIyIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de2ooFjpzQqfyvs6eWpep/LU6bZMauqxFRrPPIOcoo6RLnaqtZhiBAtYfGHHWnscC
	 dF2y5c896ibxWAiYOAVTj7IgcnlKP5L75BhK0Tc8wjgHsq9xSq4k1kTDEtU1VCVpVV
	 KnGgdBnEQWIoO/2j34UM4IMNdYaajjOueVlox5Cf9Q4R746AKJSlNaQMSFchAMua3K
	 xtNbR4CRre/5BmANz4U4u0zWkBsw0zpk3Hxas9iQsUUMtnzMnCcn+DJ54uFulKs2BJ
	 SwTm/+DeTIx0AxPhIDiLCAroqEegH6HVTKiWTZ/RBPNhDys5MIq020g5RWnq0r3QWN
	 +fqhDOV967kMA==
Date: Fri, 25 Oct 2024 22:31:52 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
Message-ID: <20241025223152.GC2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
 <20241025213243.GA2637569@google.com>
 <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 11:37:45PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Make the CRC32 library export some flags that indicate which CRC32
> > > > functions are actually executing optimized code at runtime.  Set these
> > > > correctly from the architectures that implement the CRC32 functions.
> > > >
> > > > This will be used to determine whether the crc32[c]-$arch shash
> > > > algorithms should be registered in the crypto API.  btrfs could also
> > > > start using these flags instead of the hack that it currently uses where
> > > > it parses the crypto_shash_driver_name.
> > > >
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > > >  include/linux/crc32.h        | 15 +++++++++++++++
> > > >  lib/crc32.c                  |  5 +++++
> > > >  4 files changed, 50 insertions(+)
> > > >
> > > ...
> > > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > > index 58c632533b08..bf26d454b60d 100644
> > > > --- a/include/linux/crc32.h
> > > > +++ b/include/linux/crc32.h
> > > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > > >                 return crc32c_le_arch(crc, p, len);
> > > >         return crc32c_le_base(crc, p, len);
> > > >  }
> > > >
> > > > +/*
> > > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > > + * functions are using architecture-specific optimizations.  Unlike
> > > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > > + * variants and also whether any needed CPU features are available at runtime.
> > > > + */
> > > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > > +extern u32 crc32_optimizations;
> > > > +#else
> > > > +#define crc32_optimizations 0
> > > > +#endif
> > > > +
> > >
> > > Wouldn't it be cleaner to add a new library function for this, instead
> > > of using a global variable?
> >
> > The architecture crc32 modules need to be able to write to this.  There could be
> > a setter function and a getter function, but just using a variable is simpler.
> >
> 
> If we just add 'u32 crc32_optimizations()', there is no need for those
> modules to have init/exit hooks, the only thing they need to export is
> this routine.
> 
> Or perhaps it could even be a static inline, with the right plumbing
> of header files. At least on arm64,
> 
> static inline u32 crc32_optimizations() {
>   if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
>     return 0;
>   return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
> }
> 
> should be all we need.

In 7 of the 9 affected arches, I already have a module_init function that checks
the CPU features in order to set up static keys.  (arm64 and riscv already used
alternatives patching, so I kept that.)  It's slightly convenient to set these
flags at the same time, but yes the above solution would work too.

- Eric

