Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EF110301
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 17:58:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S7V24zVhzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 03:58:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="WpZaeT3v"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S7S24vc2zDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 03:56:50 +1100 (AEDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FE8C206EC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575392208;
 bh=2lYntF80jSmeqB4A/DzJDtoIs7czCONpon40J9pdHrQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WpZaeT3vOrSLGx/La/YG4mHSjjm7A1zScT2JhFKy37HwVp4dCnJpzi5ldpvaOhFkS
 1aujn56DN2oxsV5NMsvTKfrPfKurAAsxwii7C5H7F95IrBKOX0zCYF7ck8l+xwrCXr
 FapbYWeHFr1e2m4RY7m6O8HZl59y51i9LJMulFmc=
Received: by mail-qt1-f180.google.com with SMTP id d5so4497553qto.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 08:56:48 -0800 (PST)
X-Gm-Message-State: APjAAAUrZHiwBK/PwLVVlwFapr9Tb/YgtvMiIbvxVyFnePojdO7BagrT
 CF4NLQOt2ueZV62FoQ4wNpuVp6wIuaAqEQq1Zw==
X-Google-Smtp-Source: APXvYqzuIgD9VwLAeCUG8AaPW3sC2UvyTHw3WE6Wjkbwac76yQtEuRAQ7GTea2JOUFUx5bLLNGHf7iWk9TvTrFvVUko=
X-Received: by 2002:ac8:2cd0:: with SMTP id 16mr4561326qtx.136.1575392206992; 
 Tue, 03 Dec 2019 08:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
In-Reply-To: <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Dec 2019 10:56:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
Message-ID: <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Frank Rowand <frowand.list@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 10:28 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 12/2/19 10:12 PM, Michael Ellerman wrote:
> > Frank Rowand <frowand.list@gmail.com> writes:
> >> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
> >>> I've been looking at phandle_cache and noticed the following: The raw
> >>> phandle value as generated by dtc starts at zero and is incremented by
> >>> one for each phandle entry. The qemu pSeries model is using Slof (which
> >>> is probably the same thing as used on real hardware) and this looks like
> >>> a poiner value for the phandle.
> >>> With
> >>>     qemu-system-ppc64le -m 16G -machine pseries -smp 8
> >>>
> >>> I got the following output:
> >>> | entries: 64
> >>> | phandle 7e732468 slot 28 hash c
> >>> | phandle 7e732ad0 slot 10 hash 27
> >>> | phandle 7e732ee8 slot 28 hash 3a
> >>> | phandle 7e734160 slot 20 hash 36
> >>> | phandle 7e734318 slot 18 hash 3a
> >>> | phandle 7e734428 slot 28 hash 33
> >>> | phandle 7e734538 slot 38 hash 2c
> >>> | phandle 7e734850 slot 10 hash e
> >>> | phandle 7e735220 slot 20 hash 2d
> >>> | phandle 7e735bf0 slot 30 hash d
> >>> | phandle 7e7365c0 slot 0 hash 2d
> >>> | phandle 7e736f90 slot 10 hash d
> >>> | phandle 7e737960 slot 20 hash 2d
> >>> | phandle 7e738330 slot 30 hash d
> >>> | phandle 7e738d00 slot 0 hash 2d
> >>> | phandle 7e739730 slot 30 hash 38
> >>> | phandle 7e73bd08 slot 8 hash 17
> >>> | phandle 7e73c2e0 slot 20 hash 32
> >>> | phandle 7e73c7f8 slot 38 hash 37
> >>> | phandle 7e782420 slot 20 hash 13
> >>> | phandle 7e782ed8 slot 18 hash 1b
> >>> | phandle 7e73ce28 slot 28 hash 39
> >>> | phandle 7e73d390 slot 10 hash 22
> >>> | phandle 7e73d9a8 slot 28 hash 1a
> >>> | phandle 7e73dc28 slot 28 hash 37
> >>> | phandle 7e73de00 slot 0 hash a
> >>> | phandle 7e73e028 slot 28 hash 0
> >>> | phandle 7e7621a8 slot 28 hash 36
> >>> | phandle 7e73e458 slot 18 hash 1e
> >>> | phandle 7e73e608 slot 8 hash 1e
> >>> | phandle 7e740078 slot 38 hash 28
> >>> | phandle 7e740180 slot 0 hash 1d
> >>> | phandle 7e740240 slot 0 hash 33
> >>> | phandle 7e740348 slot 8 hash 29
> >>> | phandle 7e740410 slot 10 hash 2
> >>> | phandle 7e740eb0 slot 30 hash 3e
> >>> | phandle 7e745390 slot 10 hash 33
> >>> | phandle 7e747b08 slot 8 hash c
> >>> | phandle 7e748528 slot 28 hash f
> >>> | phandle 7e74a6e0 slot 20 hash 18
> >>> | phandle 7e74aab0 slot 30 hash b
> >>> | phandle 7e74f788 slot 8 hash d
> >>> | Used entries: 8, hashed: 29
> >>>
> >>> So the hash array has 64 entries out which only 8 are populated. Using
> >>> hash_32() populates 29 entries.
> >>> Could someone with real hardware verify this?
> >>> I'm not sure how important this performance wise, it looks just like a
> >>> waste using only 1/8 of the array.
> >>
> >> The hash used is based on the assumptions you noted, and as stated in the
> >> code, that phandle property values are in a contiguous range of 1..n
> >> (not starting from zero), which is what dtc generates.
> >
> >> We knew that for systems that do not match the assumptions that the hash
> >> will not be optimal.
> >
> > If we're going to have the phandle cache it should at least make some
> > attempt to work across the systems that Linux supports.
> >
> >> Unless there is a serious performance problem for
> >> such systems, I do not want to make the phandle hash code more complicated
> >> to optimize for these cases.  And the pseries have been performing ok
> >> without phandle related performance issues that I remember hearing since
> >> before the cache was added, which could have only helped the performance.
> >> Yes, if your observations are correct, some memory is being wasted, but
> >> a 64 entry cache is not very large on a pseries.
> >
> > A single line change to use an actual hash function is hardly
> > complicating it, compared to the amount of code already there.
>
> With a dtc generated devicetree, the hash is perfect, with no
> misses.  That single line change then makes the hash bad for
> dtc generated devicetrees.

To quantify that, I did some tests with the hash algo and it's about a
10% collision rate using phandle values of 1-$cache_size. There's
never more than 2 phandles colliding in a slot. The actual impact
would be less given 100% thrashing seems unlikely.

> The cache was added to address a problem with a system with a
> dtc generated devicetree.

The cache was added to address a problem with a system with a large
number of nodes and phandles (814 phandles in the reported case). dtc
happens to be used in that case.

> I had not heard of any phandle
> lookup performance issues on ppc systems.  An imperfect hash
> for ppc should not make the ppc performance worse (unless
> every single phandle value hashes to a single bucket).  So
> the ppc performance is likely better than it was before
> the hash was added, even without an optimal hash algorithm.
>
> So the change would not be a single line change.  It would
> be a change to use different hash algorithms for dtc
> generated device trees versus other device trees.
>
> Another possibility would be to make the cache be dependent
> upon not CONFIG_PPC.  It might be possible to disable the
> cache with a minimal code change.

I'd rather not do that.

And yes, as mentioned earlier I don't like the complexity. I didn't
from the start and I'm  I'm still of the opinion we should have a
fixed or 1 time sized true cache (i.e. smaller than total # of
phandles). That would solve the RT memory allocation and locking issue
too.

For reference, the performance difference between the current
implementation (assuming fixes haven't regressed it) was ~400ms vs. a
~340ms improvement with a 64 entry cache (using a mask, not a hash).
IMO, 340ms improvement was good enough.

Rob
