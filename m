Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C704C6BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6fSK28Qyz3bfg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qq1SrT75;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qq1SrT75; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6fRh2WkNz30Mj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:13:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1568761149
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36D7C340FD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646050414;
 bh=m+Mr/LSWoSX8OkgGcblK1edJYBHkvQ8ETiM4gpOKC3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qq1SrT75QEAJNuQSbtc2XWLGp+6qAmpsu3VbS/7v25xHoFrtoE0GQkQhrEwwI4CkO
 AyR9z/Yh82JeLwlSaNQhOz/GoqHvBW1ggQVIz1vsi0aNME1sf5v+i0uruZsKPv0pNJ
 X9XVrx3S7/P7UjJamFtWSmy/DpMcBDh86UhWkkg8B0ORzYdub8eIYvqRSV8Ub2dv1m
 LpF9eXPGLk1pugHTqSeQcpzdYhbgMX8a6IiqphvOw28VVn9IFY8oNTMB7S5RJqJl4e
 Cf720HFadYEKIAJOJaFSgdt7mRTOkTCfHbLOAULwzBVKXOe9Std1qDl/P08r99ECyE
 NwhOiEIAlq8OQ==
Received: by mail-vs1-f48.google.com with SMTP id g21so12695601vsp.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 04:13:33 -0800 (PST)
X-Gm-Message-State: AOAM532nuCnOWi3V41KAsgpaABvLUsUnQfwa/FgCbK3ojs/QPM+w5/ht
 I04q3uT18ceIT/SxZ+pzpASHV8iNut4ZIVMi9OY=
X-Google-Smtp-Source: ABdhPJyOu5HUo/VjwWn8/fo2A1Ybsum6GvVfDzqE4Hcq0Flfey7YjZaD85t/OqXDAvijqsqOBSTjjzgFI7EmcLKksiE=
X-Received: by 2002:a05:6102:3a12:b0:31e:6646:b3d1 with SMTP id
 b18-20020a0561023a1200b0031e6646b3d1mr4905201vsu.51.1646050412829; Mon, 28
 Feb 2022 04:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
 <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
In-Reply-To: <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Feb 2022 20:13:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
Message-ID: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
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

On Mon, Feb 28, 2022 at 8:02 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Guo Ren
> > Sent: 28 February 2022 11:52
> >
> > On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > From: guoren@kernel.org
> > > > Sent: 27 February 2022 16:28
> > > >
> > > > From: Christoph Hellwig <hch@lst.de>
> > > >
> > > > Provide a single common definition for the compat_flock and
> > > > compat_flock64 structures using the same tricks as for the native
> > > > variants.  Another extra define is added for the packing required on
> > > > x86.
> > > ...
> > > > diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
> > > ...
> > > >  /*
> > > > - * IA32 uses 4 byte alignment for 64 bit quantities,
> > > > - * so we need to pack this structure.
> > > > + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
> > > > + * compat flock64 structure.
> > > >   */
> > > ...
> > > > +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > > >
> > > >  struct compat_statfs {
> > > >       int             f_type;
> > > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > > index 1c758b0e0359..a0481fe6c5d5 100644
> > > > --- a/include/linux/compat.h
> > > > +++ b/include/linux/compat.h
> > > > @@ -258,6 +258,37 @@ struct compat_rlimit {
> > > >       compat_ulong_t  rlim_max;
> > > >  };
> > > >
> > > > +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > > > +#define __ARCH_COMPAT_FLOCK64_PACK   __attribute__((packed))
> > > > +#else
> > > > +#define __ARCH_COMPAT_FLOCK64_PACK
> > > > +#endif
> > > ...
> > > > +struct compat_flock64 {
> > > > +     short           l_type;
> > > > +     short           l_whence;
> > > > +     compat_loff_t   l_start;
> > > > +     compat_loff_t   l_len;
> > > > +     compat_pid_t    l_pid;
> > > > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > > > +     __ARCH_COMPAT_FLOCK64_PAD
> > > > +#endif
> > > > +} __ARCH_COMPAT_FLOCK64_PACK;
> > > > +
> > >
> > > Provided compat_loff_t are correctly defined with __aligned__(4)
> > See include/asm-generic/compat.h
> >
> > typedef s64 compat_loff_t;
> >
> > Only:
> > #ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
> > typedef s64 __attribute__((aligned(4))) compat_s64;
> >
> > So how do you think compat_loff_t could be defined with __aligned__(4)?
>
> compat_loff_t should be compat_s64 not s64.
>
> The same should be done for all 64bit 'compat' types.
Changing
typedef s64 compat_loff_t;
to
typedef compat_s64 compat_loff_t;

should be another patch and it affects all architectures, I don't
think we should involve it in this series.

look at kernel/power/user.c:
struct compat_resume_swap_area {
        compat_loff_t offset;
        u32 dev;
} __packed;

I thnk keep "typedef s64 compat_loff_t;" is a sensible choice for
COMPAT support patchset series.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
