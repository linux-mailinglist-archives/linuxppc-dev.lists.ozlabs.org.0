Return-Path: <linuxppc-dev+bounces-2609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE1E9B119D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 23:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZwxF5KvXz2xxw;
	Sat, 26 Oct 2024 08:32:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729891969;
	cv=none; b=a7yPNDwCfi8U7N0LSnHLUQe5O74g8U0AwUzqDGedfbN5X04JD72mUx4b8WC31f4p5v7fZVA2HYfW4tNqabJdk4sDyFyV3PI2nkiL4+eubNYI1p8CLBTapovhDuWG68m7/CDSfs+aIF6W2S/yRXUrRGNjcIhtwovG2AYbz9Z75FJcUZaD0eEBW27U0psdo1G9lcipxmOC6Rw3THGDbfC+J2IO9zVI6Jgq8vxtVoWZtMTM2A9R6zMtgnS7dNO1gG2PYfOKDxHdI24qzIyh4LGC2XHegQgg1W2D9l9u0EqaUF2OVMQNqD5u1ZrRhlZMsPKJIdwTOgbIw2g0wEEdlkDkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729891969; c=relaxed/relaxed;
	bh=Ei0o2F0WAxmbHAc1v9cvoOiKkz6QVV2vp8sChbLZwww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLNUALK3cOfwUOH76mzBk2VRDrq20bVxIm+qd/MpCCTvKDoWHMV9cs8sqsp1seBq9tJdbcKwx+1+r+c6kluTVbzUWKrOsbrL86NFkH7vy7g53h/vq+twoxx3FLjaditA7RRA3d5ZnpdwCxDnFu7j/nXUkW/ZQUUX07qQdLfPnWGezh9zRPoSq+08VPC7cm5CuaQk9ToEJEmJrKHDAvWAgAqFqI85opaiS4OYcJaXGZGRkCGM3iS44DippWXEMulUBWPjpQQKiCZM09X1WsnYIfYmNw9qAYlPdTJElf9nc3hcSpb4rMUEllIo9Md5VdypB5l+/DQAfF5RtSPPUrNMEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ui6KR0kd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ui6KR0kd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZwxD1r0bz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 08:32:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0DAF5C5B7A;
	Fri, 25 Oct 2024 21:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6D5C4CEC3;
	Fri, 25 Oct 2024 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729891964;
	bh=karHkl1P4MymVDmMVIm5W0oSGt8WGS2RI4WaZcDwTEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ui6KR0kdPRYlpScOp15X+unLeIAbNEI3oGX0lXMaIurlD0BJ0jl9m7sv68bFBvJ8X
	 CgmQy4NmGULJhNReu42xHOOaMDZWh8rDiJMHw/GnKiiye07KV68euQMU+mVNPy6Dh5
	 q+2Nla53/DZid3rdBbpBsYfaayka1Upsz7x35RnBCM/7/4Qef0Iy4By75QnYsA9YNP
	 PwOXPfwaV3rNp69SYU+sRoFrITlEHpzt+P0+Cem8hn3H149Vz/ognobz0PrT4BXTc/
	 bchtyRCSYWd93GuJXbMaRcdctbFVLfRi2xAODovc57JIf5w8iiwde7M2cD6qqrEeer
	 AmGpk7Tij3AcQ==
Date: Fri, 25 Oct 2024 21:32:43 +0000
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
Message-ID: <20241025213243.GA2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
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
In-Reply-To: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Make the CRC32 library export some flags that indicate which CRC32
> > functions are actually executing optimized code at runtime.  Set these
> > correctly from the architectures that implement the CRC32 functions.
> >
> > This will be used to determine whether the crc32[c]-$arch shash
> > algorithms should be registered in the crypto API.  btrfs could also
> > start using these flags instead of the hack that it currently uses where
> > it parses the crypto_shash_driver_name.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> >  include/linux/crc32.h        | 15 +++++++++++++++
> >  lib/crc32.c                  |  5 +++++
> >  4 files changed, 50 insertions(+)
> >
> ...
> > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > index 58c632533b08..bf26d454b60d 100644
> > --- a/include/linux/crc32.h
> > +++ b/include/linux/crc32.h
> > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> >                 return crc32c_le_arch(crc, p, len);
> >         return crc32c_le_base(crc, p, len);
> >  }
> >
> > +/*
> > + * crc32_optimizations contains flags that indicate which CRC32 library
> > + * functions are using architecture-specific optimizations.  Unlike
> > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > + * variants and also whether any needed CPU features are available at runtime.
> > + */
> > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > +extern u32 crc32_optimizations;
> > +#else
> > +#define crc32_optimizations 0
> > +#endif
> > +
> 
> Wouldn't it be cleaner to add a new library function for this, instead
> of using a global variable?

The architecture crc32 modules need to be able to write to this.  There could be
a setter function and a getter function, but just using a variable is simpler.

- Eric

