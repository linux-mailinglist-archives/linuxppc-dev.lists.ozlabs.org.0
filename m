Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3EFDA98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 05:06:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sqLX5BR3zDqPb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:06:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sCS33Wo8"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sqJy1lwkzDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 13:05:03 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id m188so7690676ioa.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dJMl90O95ELh7MccR/gotQ0iR4kxpXltz+n2rVMWVek=;
 b=sCS33Wo854rOecdEepHQFeUD38yV4m0fx8fxGIDGiFttKs1dNNsEKXEkbVeyxlSjum
 3xNFDFhJ2iF9Fh9LzN6/xoVy+YhiXgEoshszIQJUnps+YrJhuuw9lAxDcYmGEDff9HrD
 TJ6Xu79Wqbtq1Tpi2wfMrvCOrwmCbJWN+8K8iOxPa9yGhqwXJHYJPfAWhw1jyiGBSsz3
 6X4n0WUjEhAKyIGR/WesQJtN5xfG2amZp32CAU7q0+TYECzjxRQ/mdLi88A/Ti2/Vfqv
 +JnR2yMzE207qkPhJUQQMzIyz+UetNgniIOCbX3kN+O9VLWgT/dAd33CFP0gKgTqhMkH
 ZRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJMl90O95ELh7MccR/gotQ0iR4kxpXltz+n2rVMWVek=;
 b=WDnBr1GGBT+mTQJeXcJgrbPtyTt1NA9Q4FaK7XbRZcSr1hpIb4VdyUe6XujVpuHTCU
 QhHFFq0nCXVC9py+81c2HOcloIDI/zKaPaQLf1MYUip42UGgW2i7vsOaZi+hBoODl8ft
 0gxhR4fNgPhBKgyh3Rree5Vk9lgsq+akWH9oT6XZb+pU161Reai6xH8UCCxxawByds/w
 P5nmhG46SJJvsbYVtDv4XfZTL5/XYfpZlQbChi2vxUmPu6EGd/AE/YcjuvzbB2OvNNVk
 bh8qGqix1DQo/djMkZi1duktT/Xm+3DV4ZiYZANIIuq0vdUN9XjQIA+vW4dJD7jNqhQi
 Nrag==
X-Gm-Message-State: APjAAAVVODIvkvkp9gtvbnHiAM7BjZNx0E56730xX8f2FY2oV/6RtbvX
 kkI6AB8CX0jV0/PfZvy/sITxOwPIkE8rlgAyug==
X-Google-Smtp-Source: APXvYqzeszOwZP14RtOC6mV9rY3uOhFyM1yQpZi/QDojtM4wzbayqEf6L0iWYkrbUvWs9aPmzqXndCUfaebQxYOHnc8=
X-Received: by 2002:a6b:7d08:: with SMTP id c8mr3138801ioq.259.1556507100502; 
 Sun, 28 Apr 2019 20:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com>
 <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
 <20190428083710.GA11981@dhcp-128-65.nay.redhat.com>
In-Reply-To: <20190428083710.GA11981@dhcp-128-65.nay.redhat.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 29 Apr 2019 11:04:49 +0800
Message-ID: <CAFgQCTvQezGM7xgY2Q1RSUiQ7wLdxtUAeztrO3AqDfjx8f2kdg@mail.gmail.com>
Subject: Re: [PATCHv2] kernel/crash: make parse_crashkernel()'s return value
 more indicant
To: Dave Young <dyoung@redhat.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Julien Thierry <julien.thierry@arm.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Will Deacon <will.deacon@arm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Borislav Petkov <bp@alien8.de>, David Hildenbrand <david@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <mbrugger@suse.com>, Baoquan He <bhe@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Hackmann <ghackmann@android.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 28, 2019 at 4:37 PM Dave Young <dyoung@redhat.com> wrote:
>
> On 04/25/19 at 04:20pm, Pingfan Liu wrote:
> > On Wed, Apr 24, 2019 at 4:31 PM Matthias Brugger <mbrugger@suse.com> wrote:
> > >
> > >
> > [...]
> > > > @@ -139,6 +141,8 @@ static int __init parse_crashkernel_simple(char *cmdline,
> > > >               pr_warn("crashkernel: unrecognized char: %c\n", *cur);
> > > >               return -EINVAL;
> > > >       }
> > > > +     if (*crash_size == 0)
> > > > +             return -EINVAL;
> > >
> > > This covers the case where I pass an argument like "crashkernel=0M" ?
> > > Can't we fix that by using kstrtoull() in memparse and check if the return value
> > > is < 0? In that case we could return without updating the retptr and we will be
> > > fine.
> > >
> > It seems that kstrtoull() treats 0M as invalid parameter, while
> > simple_strtoull() does not.
> >
> > If changed like your suggestion, then all the callers of memparse()
> > will treats 0M as invalid parameter. This affects many components
> > besides kexec.  Not sure this can be done or not.
>
> simple_strtoull is obsolete, move to kstrtoull is the right way.
>
> $ git grep memparse|wc
>     158     950   10479
>
> Except some documentation/tools etc there are still a log of callers
> which directly use the return value as the ull number without error
> checking.
>
> So it would be good to mark memparse as obsolete as well in
> lib/cmdline.c, and introduce a new function eg. kmemparse() to use
> kstrtoull,  and return a real error code, and save the size in an
> argument like &size.  Then update X86 crashkernel code to use it.
>
Thank for your good suggestion.

Regards,
Pingfan
