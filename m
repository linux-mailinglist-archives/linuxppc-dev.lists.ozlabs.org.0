Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB04C6B53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 12:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6dzb6bqwz30Mj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 22:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kVJjmhgT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kVJjmhgT; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6dyx2gWyz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 22:52:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33A9E61119
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 11:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F410CC36AEF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646049125;
 bh=12lEy+rZsxAbLHQ5lt0XyIX0neTrZHPLb7NInfEDMcc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kVJjmhgTkwGhssShoeuWGYqbNxv3lHquRsBE9kN49Zlo0a9fLT6teoaONvIEGwd72
 V0W6w+r+PEo6GW3cgb7A59hJAB4XGPekuWNfd29Ms+19nihjIUViOYA7oQCjXTfyea
 0VD/LLXAAPs1NHYsvfuOxVsPJosPSugFuP1g0/HAnaQQ0/SSSXUaMAtb3Khiu9LSEc
 RzZpRw4ILISQgeutLcb1OIcyE0RcL5CXlf0p/on2kOr1qnZR0TVYZ8or3nWzz00GBD
 Zh21adw4G+2LobtDyqYNqwjQrptU6uDxiW8yR58x+O94SSOCm7Tqp5NygDHQ8Pm1cp
 rlnj538An+yCw==
Received: by mail-vs1-f48.google.com with SMTP id y4so12610090vsd.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 03:52:04 -0800 (PST)
X-Gm-Message-State: AOAM531//iVgtN4lBmjrvAN/w7+OfUI1PQTnhM0m4axHZE6vZdNHb9ab
 ptrHqP752AoKCX73PDn/zmMH98W7U0OLyXr1N2U=
X-Google-Smtp-Source: ABdhPJyyPh+wlne6x5ff7JCJYWjx6kud3nRui6/1lnG2gpd2T7gIweR6o3nUA+PM6jttzlFNCgpAgO9PQ0gdkcBMjWc=
X-Received: by 2002:a05:6102:c4a:b0:31a:54e6:edb1 with SMTP id
 y10-20020a0561020c4a00b0031a54e6edb1mr6626535vss.51.1646049123736; Mon, 28
 Feb 2022 03:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
In-Reply-To: <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Feb 2022 19:51:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
Message-ID: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
Subject: Re: [PATCH V7 03/20] compat: consolidate the compat_flock{,
 64} definition
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "drew@beagleboard.org" <drew@beagleboard.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "liush@allwinnertech.com" <liush@allwinnertech.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "wefu@redhat.com" <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: guoren@kernel.org
> > Sent: 27 February 2022 16:28
> >
> > From: Christoph Hellwig <hch@lst.de>
> >
> > Provide a single common definition for the compat_flock and
> > compat_flock64 structures using the same tricks as for the native
> > variants.  Another extra define is added for the packing required on
> > x86.
> ...
> > diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
> ...
> >  /*
> > - * IA32 uses 4 byte alignment for 64 bit quantities,
> > - * so we need to pack this structure.
> > + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
> > + * compat flock64 structure.
> >   */
> ...
> > +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
> >
> >  struct compat_statfs {
> >       int             f_type;
> > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > index 1c758b0e0359..a0481fe6c5d5 100644
> > --- a/include/linux/compat.h
> > +++ b/include/linux/compat.h
> > @@ -258,6 +258,37 @@ struct compat_rlimit {
> >       compat_ulong_t  rlim_max;
> >  };
> >
> > +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > +#define __ARCH_COMPAT_FLOCK64_PACK   __attribute__((packed))
> > +#else
> > +#define __ARCH_COMPAT_FLOCK64_PACK
> > +#endif
> ...
> > +struct compat_flock64 {
> > +     short           l_type;
> > +     short           l_whence;
> > +     compat_loff_t   l_start;
> > +     compat_loff_t   l_len;
> > +     compat_pid_t    l_pid;
> > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > +     __ARCH_COMPAT_FLOCK64_PAD
> > +#endif
> > +} __ARCH_COMPAT_FLOCK64_PACK;
> > +
>
> Provided compat_loff_t are correctly defined with __aligned__(4)
See include/asm-generic/compat.h

typedef s64 compat_loff_t;

Only:
#ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
typedef s64 __attribute__((aligned(4))) compat_s64;

So how do you think compat_loff_t could be defined with __aligned__(4)?

> marking the structure packed isn't needed.
> I believe compat_u64 and compat_s64 both have aligned(4).
> It is also wrong, consider:
>
> struct foo {
>         char x;
>         struct compat_flock64 fl64;
> };
>
> There should be 3 bytes of padding after 'x'.
> But you've removed it.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
