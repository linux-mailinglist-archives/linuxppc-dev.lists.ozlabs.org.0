Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E80117D5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 02:53:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X34b4c2yzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 12:53:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="QBgmp/WE"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X32m727TzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 12:52:00 +1100 (AEDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59C7D20836
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 01:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575942718;
 bh=KqCQz2weAnWR65cLCGRNYV4K/BKWlkR6zSJV8noJl4M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QBgmp/WEA/kWCJ+4xxowtAUKnN7lo0ioXQ/+OOBkTk1JJx82ejS9Gx5IkuMVffNK5
 A/oWw39pC4eXUgKjtWuKzJ6tQcB8unMbzlia/VBBLlj/zZJyPshovwKZPVQ9Khm33b
 Z7umV8SC/cUEMGahh9sdVfDfQF5ds9i66FLMKNn4=
Received: by mail-qt1-f181.google.com with SMTP id 5so1304654qtz.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 17:51:58 -0800 (PST)
X-Gm-Message-State: APjAAAXF+5f9QHj59lB1YLde3PHixFiYnLY1lgevwDawek9LL3JXDviA
 U+iS5arI4gKC7KPrqulNoxw7IgvYr/Crg1Gu2g==
X-Google-Smtp-Source: APXvYqyEad6fm0J91b5vxJUTlpqjK/RvfkA5xA4LXrcK/moCxuOeAy2ZOwDen6GRbDeesm2MP0X1u0al1BP2jaCfYXc=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr27887071qtp.224.1575942717416; 
 Mon, 09 Dec 2019 17:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
 <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
 <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
In-Reply-To: <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 9 Dec 2019 19:51:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
Message-ID: <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 9, 2019 at 7:35 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
> > Is there a memory usage issue for the systems that led to this thread?
>
> No, no memory issue led to this thread. I was just testing my patch and
> I assumed that I did something wrong in the counting/lock drop/lock
> acquire/allocate path because the array was hardly used. So I started to
> look deeper=E2=80=A6
> Once I figured out everything was fine, I was curious if everyone is
> aware of the different phandle creation by dtc vs POWER. And I posted
> the mail in the thread.
> Once you confirmed that everything is "known / not an issue" I was ready
> to take off [0].
>
> Later more replies came in such as one mail [1] from Rob describing the
> original reason with 814 phandles. _Here_ I was just surprised that 1024
> were used over 64 entries for a benefit of 60ms. I understand that this
> is low concern for you because that memory is released if modules are
> not enabled. I usually see that module support is left enabled.
>
> However, Rob suggested / asked about the fixed size array (this is how I
> understood it):
> |And yes, as mentioned earlier I don't like the complexity. I didn't
> |from the start and I'm  I'm still of the opinion we should have a
> |fixed or 1 time sized true cache (i.e. smaller than total # of
> |phandles). That would solve the RT memory allocation and locking issue
> |too.
>
> so I attempted to ask if we should have the fixed size array maybe
> with the hash_32() instead the mask. This would make my other patch
> obsolete because the fixed size array should not have a RT issue. The
> hash_32() part here would address the POWER issue where the cache is
> currently not used efficiently.
>
> If you want instead to keep things as-is then this is okay from my side.
> If you want to keep this cache off on POWER then I could contribute a
> patch doing so.

It turns out there's actually a bug in the current implementation. If
we have multiple phandles with the same mask, then we leak node
references if we miss in the cache and re-assign the cache entry.
Easily fixed I suppose, but holding a ref count for a cached entry
seems wrong. That means we never have a ref count of 0 on every node
with a phandle.

I've done some more experiments with the performance. I've come to the
conclusion that just measuring boot time is not a good way at least if
the time is not a significant percentage of the total. I couldn't get
any measurable data. I'm using a RK3399 Rock960 board. It has 190
phandles. I get about 1500 calls to of_find_node_by_phandle() during
boot. Note that about the first 300 are before we have any timekeeping
(the prior measurements also would not account for this). Those calls
have no cache in the current implementation and are cached in my
implementation.

no cache:  20124 us
current cache: 819 us

new cache (64 entry): 4342 us
new cache (128 entry): 2875 us
new cache (256 entry): 1235 us

To get some idea on the time spent before timekeeping is up, if we
take the avg miss time is ~17us (20124/1200), then we're spending
about ~5ms on lookups before the cache is enabled. I'd estimate the
new cache takes ~400us before timekeeping is up as there's 11 misses
early.

From these numbers, it seems the miss rate has a significant impact on
performance for the different sizes. But taken from the original 20+
ms, they all look like good improvement.

Rob
