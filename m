Return-Path: <linuxppc-dev+bounces-2610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535D9B11B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 23:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZx3G230gz2y6G;
	Sat, 26 Oct 2024 08:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729892282;
	cv=none; b=Gt5D1mNzDjzb75UZgPCR15cSqkmYsIBGdrqhu0TSSYC/gE+m0JuYxSrHpgpe/ZCLY+zXmzF/2U/ApFd8k0/R2YEc0bMyyN5zOuN+AvNLyftJjz//gVWf61CKbnRHOiw+CQpvgywwyZiNDbBBmuBPjz7fGK++y+9pLmZ0fkpOzvlmgxiAvcKXrBSQYRhxMtZ5dzQFlmxDyZeeH2xJAn3FLHHyZzAsOFMgYBLqgUk5QsnCYlga4CsbJLL/U7rx+TqPBsGOkHKibYWXvJS1rPnNK7q4oiNx6TcqZnxD4waFzNK8IzIiYe6EoQBkkeEneWdyy3JD1RUIw/v95ifPMyy7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729892282; c=relaxed/relaxed;
	bh=brjCYgcFGdH/pd/f/d70iIVu+Wxfm2XE3Qa70/tryVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjKMIUziB5xcRjnvRfdCUJrFoUZyak6N12z6XLD7Mf+lXim7/HCT2RWwnj5FR1fZ5hm+wlFhXTdzThQqiGUrtKZYGKSKT4J6U+9YD7bhbkv1lYM2t7pDcnpTHwpMpsX5JmgRj39sOy8AzG57M2lkXZW6VEujN3MAaSYk/TrGZvB9d9IOyltIqBb0X2RW3cTeEbXnUGVsA3mWyg2xIznx7QNcRT8m7rHNwK8hzIoRqHDkauo0J+GH0QqUwmrlCrxlQKfESZSjLdVwKegIyRZ9sX0XiwKyJi+TXXt5FPgPSTD70fy8JRJNCvltGeYwT+TZ4jJDumUD4b7sj1DIvIBB9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9TEdB8N; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9TEdB8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZx3F1T8Tz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 08:38:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6E165C5C2D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 21:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43CDC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729892278;
	bh=Q8vC22irZ2uA8WYYvmBwW1+2Pm2qVwYkLgdZ6/sItmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X9TEdB8NtoLsaY6w4tD051jPTNAuoCaCbQQHkiIzKo7oiJT9AWcwt+FyzmJhovWAp
	 2pb0msYmVONirDKwQIfh5V3wPV0dcbDz2pSpVcpHIdMk9tXuPDZ5e6Az8xORI991cm
	 xqLA6sL3m9DoZGlSNnVohRg6luGL7923xAU3nr5tH7OjWBmXsAW7KgEF+MDVfsK2ne
	 duqlO61GagzVxkZD2Axh5Nb172IRQrUPy3AWEhn1+6vZ+0EOpP8QflDhFwNd3ZyyP/
	 h1jEpYwivxBADQX2gGh2Yha+akgPxJ0n7Q8ruu2ds379qCqEjs553wHkorArIKfS4N
	 Vw2SZPUxwQngA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so38999571fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 14:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcqt5QXLBux/e5Ugjw9gqyL9+lDJTHgwcuMVtDBfZBN0NoCR3B9vhk/mJYo+YqnS5PXiDMbW3ml1QTQEM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwRhVg8h4zAzqZ12zTQFZZMfZi5IkpQLyXWg7F8CoOwzId07qn
	rED7uOQw2ENUfapxx96Pz8kHeE5BE45NOWu4nLnT8mSoR/AwPCCB7n8e3ABAIR1OPKs7vKw1BJb
	L5CqRsgDkQzrTEdm1IGpFyHK6U8c=
X-Google-Smtp-Source: AGHT+IEQWINSviRss911g3zsmM49RILDHJN+Ssrcrwx15J0k6BAeeRwcNFxqZbNLbvjIoCqISV0e2QKpM5PEk7ZnG3k=
X-Received: by 2002:a05:651c:b0d:b0:2fa:d604:e519 with SMTP id
 38308e7fff4ca-2fcbdf7db48mr5607491fa.11.1729892277115; Fri, 25 Oct 2024
 14:37:57 -0700 (PDT)
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
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com> <20241025213243.GA2637569@google.com>
In-Reply-To: <20241025213243.GA2637569@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 23:37:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Make the CRC32 library export some flags that indicate which CRC32
> > > functions are actually executing optimized code at runtime.  Set these
> > > correctly from the architectures that implement the CRC32 functions.
> > >
> > > This will be used to determine whether the crc32[c]-$arch shash
> > > algorithms should be registered in the crypto API.  btrfs could also
> > > start using these flags instead of the hack that it currently uses where
> > > it parses the crypto_shash_driver_name.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > >  include/linux/crc32.h        | 15 +++++++++++++++
> > >  lib/crc32.c                  |  5 +++++
> > >  4 files changed, 50 insertions(+)
> > >
> > ...
> > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > index 58c632533b08..bf26d454b60d 100644
> > > --- a/include/linux/crc32.h
> > > +++ b/include/linux/crc32.h
> > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > >                 return crc32c_le_arch(crc, p, len);
> > >         return crc32c_le_base(crc, p, len);
> > >  }
> > >
> > > +/*
> > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > + * functions are using architecture-specific optimizations.  Unlike
> > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > + * variants and also whether any needed CPU features are available at runtime.
> > > + */
> > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > +extern u32 crc32_optimizations;
> > > +#else
> > > +#define crc32_optimizations 0
> > > +#endif
> > > +
> >
> > Wouldn't it be cleaner to add a new library function for this, instead
> > of using a global variable?
>
> The architecture crc32 modules need to be able to write to this.  There could be
> a setter function and a getter function, but just using a variable is simpler.
>

If we just add 'u32 crc32_optimizations()', there is no need for those
modules to have init/exit hooks, the only thing they need to export is
this routine.

Or perhaps it could even be a static inline, with the right plumbing
of header files. At least on arm64,

static inline u32 crc32_optimizations() {
  if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
    return 0;
  return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
}

should be all we need.

