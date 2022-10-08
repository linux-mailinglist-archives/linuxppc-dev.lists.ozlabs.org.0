Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD445F87A7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 23:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlJsv28mgz3dsd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:56:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EumsjgKw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EumsjgKw;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlJYq0v5Jz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 08:42:36 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id i3so4847926qkl.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
        b=EumsjgKwMc2Jw8Mczz4R6dcA2SGR+dlJiih8Ckk15eXQbl1ssNNcUUrPo+6xLg3PJJ
         ACJZlZtsMQ8qHF+g94jmQvqwnd0JN02OtmaV0630S04pQ33UTiRtB3d/9RZxV3IEWRUS
         2r7jZGZp8PRabENWrLu/RcNXt+h8W/EQbCXY+rIwGHkU8CMyznzvzkw9HGkZzTxMPx8w
         xr6afYXFnKmA95gCiWV/Ff4HwGyaoBIjl31rvLZlakhTDvtM9Lwa0DyWxf0sryHaK1o0
         LvM2pyhtabu/3Ucoe1BChll32HfoeeOvRbBxpmidXxDJ1YSjQ/R5moFvf8yAnsYhmD4z
         nBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
        b=sXkE2VdQmo8gI8VunGj7kTZnHD2ocTsZ1qv1S2IeXeNXI6loU5AJ8QMfyxer/ZEwx2
         hFSPORTX/I1ekZILgrKbzQ+ngquFva4VpTG73uAyNb94JLC8DFlv0DcczdLdaas8odIk
         YfgpkoxstbFGpm+s20Z8wuqQGJx6iZ0WjzkGnBlQLzf9wibiRAnAu0L0IYCUIeIZ/CpK
         cPgiWErt0dbZOxRW0j47/XREAS4CokOQTbPbcNsO9SqOsJ2K/TMD13rIw5BrX2NJR6bH
         V2l4K+2gNf6L6jUkBklvWjlrGS8bemPAXg/VYg+zPW5hKPp1SfI6Y1ZvhfuuebtW0qbq
         LFmg==
X-Gm-Message-State: ACrzQf1i5HpcuP+LNbdKXQdy5jGJV67VuWmsGgPP6M4o/mzenf2rC2A8
	CXbRFnWAiCXMfLFcq+p3zfA=
X-Google-Smtp-Source: AMsMyM7nAvlv/cx8tIjuG0BzVtQBP7E1oOPDn/AxmQr3oNkBQsYkcM4WMSw6/AtojLZMWFu7HL2rZw==
X-Received: by 2002:a05:620a:46a4:b0:6ce:c4af:5a54 with SMTP id bq36-20020a05620a46a400b006cec4af5a54mr8239989qkb.377.1665265351668;
        Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:4fea:6b67:9485:addd])
        by smtp.gmail.com with ESMTPSA id j1-20020a05620a410100b006cfaee39ccesm5821626qko.114.2022.10.08.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Date: Sat, 8 Oct 2022 14:42:30 -0700
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v5 0/7] treewide cleanup of random integer usage
Message-ID: <Y0HuxsLysThhsaTl@yury-laptop>
References: <20221008055359.286426-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221008055359.286426-1-Jason@zx2c4.com>
X-Mailman-Approved-At: Sun, 09 Oct 2022 08:55:48 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai C
 hen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore 
 Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 11:53:52PM -0600, Jason A. Donenfeld wrote:
> Changes v4->v5:
> - Coccinelle is now used for as much mechanical aspects as possible,
>   with mechanical parts split off from non-mechanical parts. This should
>   drastically reduce the amount of code that needs to be reviewed
>   carefully. Each commit mentions now if it was done by hand or is
>   mechanical.
> 
> Hi folks,
> 
> This is a five part treewide cleanup of random integer handling. The
> rules for random integers are:
> 
> - If you want a secure or an insecure random u64, use get_random_u64().
> - If you want a secure or an insecure random u32, use get_random_u32().
>   * The old function prandom_u32() has been deprecated for a while now
>     and is just a wrapper around get_random_u32(). Same for
>     get_random_int().
> - If you want a secure or an insecure random u16, use get_random_u16().
> - If you want a secure or an insecure random u8, use get_random_u8().
> - If you want secure or insecure random bytes, use get_random_bytes().
>   * The old function prandom_bytes() has been deprecated for a while now
>     and has long been a wrapper around get_random_bytes().
> - If you want a non-uniform random u32, u16, or u8 bounded by a certain
>   open interval maximum, use prandom_u32_max().
>   * I say "non-uniform", because it doesn't do any rejection sampling or
>     divisions. Hence, it stays within the prandom_* namespace.
> 
> These rules ought to be applied uniformly, so that we can clean up the
> deprecated functions, and earn the benefits of using the modern
> functions. In particular, in addition to the boring substitutions, this
> patchset accomplishes a few nice effects:
> 
> - By using prandom_u32_max() with an upper-bound that the compiler can
>   prove at compile-time is ≤65536 or ≤256, internally get_random_u16()
>   or get_random_u8() is used, which wastes fewer batched random bytes,
>   and hence has higher throughput.
> 
> - By using prandom_u32_max() instead of %, when the upper-bound is not a
>   constant, division is still avoided, because prandom_u32_max() uses
>   a faster multiplication-based trick instead.
> 
> - By using get_random_u16() or get_random_u8() in cases where the return
>   value is intended to indeed be a u16 or a u8, we waste fewer batched
>   random bytes, and hence have higher throughput.
> 
> So, based on those rules and benefits from following them, this patchset
> breaks down into the following five steps:
> 
> 1) Replace `prandom_u32() % max` and variants thereof with
>    prandom_u32_max(max).
> 
>    * Part 1 is done with Coccinelle. Part 2 is done by hand.
> 
> 2) Replace `(type)get_random_u32()` and variants thereof with
>    get_random_u16() or get_random_u8(). I took the pains to actually
>    look and see what every lvalue type was across the entire tree.
> 
>    * Part 1 is done with Coccinelle. Part 2 is done by hand.
> 
> 3) Replace remaining deprecated uses of prandom_u32() and
>    get_random_int() with get_random_u32(). 
> 
>    * A boring search and replace operation.
> 
> 4) Replace remaining deprecated uses of prandom_bytes() with
>    get_random_bytes().
> 
>    * A boring search and replace operation.
> 
> 5) Remove the deprecated and now-unused prandom_u32() and
>    prandom_bytes() inline wrapper functions.
> 
>    * Just deleting code and updating comments.
> 
> I was thinking of taking this through my random.git tree (on which this
> series is currently based) and submitting it near the end of the merge
> window, or waiting for the very end of the 6.1 cycle when there will be
> the fewest new patches brewing. If somebody with some treewide-cleanup
> experience might share some wisdom about what the best timing usually
> winds up being, I'm all ears.
> 
> Please take a look! The number of lines touched is quite small, so this
> should be reviewable, and as much as is possible has been pushed into
> Coccinelle scripts.

For the series:
Reviewed-by: Yury Norov <yury.norov@gmail.com>

Although, looking at it, I have a feeling that kernel needs to drop all
fixed-size random APIs like get_random_uXX() or get_random_int(), because
people will continue using the 'get_random_int() % num' carelessly.

Thanks,
Yury
