Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDED2A1136
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 23:54:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNHgY4NwfzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 09:54:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=NSjEistX; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNHdc4Lx4zDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 09:52:50 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y184so7916713lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 15:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrhxrWCIONXWoPxsDWMRBR+W10EJDGZ7OkgmkAXhFNU=;
 b=NSjEistXDK7QrUisKBKyvvsUCTs8KpdALOTDGFQa3ZlxOrfYPgQ15P5Hp32THt3kZR
 cN7sjbd0KoMQ3npg9DHgup7Q9J8GXdmUQ8lIGjC/f9HFg6XaYw9GqJyObayLgtYOnfyC
 +DPogaxfsLaFCM9OrmD2eUZrIvZD8sMP/wXjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrhxrWCIONXWoPxsDWMRBR+W10EJDGZ7OkgmkAXhFNU=;
 b=LwcM+tB9KBwfFmHfq/JS1+h0VI4AoromxX/p+0ziPvcaUzKofwK2d98BDrXWHKa331
 NULLpKp0ovPXSDDj7QCtf6n8zBshZDlPni+AL4trsq5OKJ6p021c+KOGtGR6ruC/1Qnc
 VtQ8mHDQyIx/LfEQQ4D8Pd8dlX58sxAP4r5hWP6ndzJFcYznWRRdWOblvIrZ6Vfg1W/4
 V3ijawd86aku4kSZMEPtrlVaWwgQRWRKopX/l/QD/bpJvlwIagMexcjDhQCm9nADOgSf
 qF8g28J2kTiSwVitfPTYuFOpxcMiZpMvFaXBNfOZumvZE23ocpUx4GVTxRG7U6pU4z+v
 i+OQ==
X-Gm-Message-State: AOAM530DuPq9WeOmXhOE2OHYHtQM28OMx04FucEOADHSnxfh521dsNU2
 j/jo2Rs7k0bV3nEOedJQnvfCXTczurbxQg==
X-Google-Smtp-Source: ABdhPJyGhTMu23ieTXAWIkIsHJEo2x/OahwhnTma1P/OoRAeUVIEDRl36OC17t9Oeab7YeEj/m8t7g==
X-Received: by 2002:a05:6512:32a4:: with SMTP id
 q4mr1920169lfe.477.1604098364944; 
 Fri, 30 Oct 2020 15:52:44 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id g184sm747152lfd.257.2020.10.30.15.52.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 15:52:44 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id h6so9886357lfj.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 15:52:44 -0700 (PDT)
X-Received: by 2002:a19:4815:: with SMTP id v21mr1949766lfa.603.1604098002560; 
 Fri, 30 Oct 2020 15:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87sg9vl59i.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2020 15:46:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
Message-ID: <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 3:26 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> While at it I might have a look at that debug request from Willy in the
> other end of this thread. Any comment on that?
>
>  https://lore.kernel.org/r/87k0v7mrrd.fsf@nanos.tec.linutronix.de

I do think that it would be nice to have a debug mode, particularly
since over the last few years we've really lost a lot of HIGHMEM
coverage (to the point that I've wondered how worthwhile it really is
to support at all any more - I think it's Arnd who argued that it's
mainly some embedded ARM variants that will want it for the forseeable
future).

So I'm honestly somewhat torn. I think HIGHMEM is dying, and yes that
argues for "non-HIGHMEM had better have some debug coverage", but at
the same time I think it doesn't even really matter any more. At some
point those embedded ARM platforms just aren't even interesting - they
might as well use older kernels if they are the only thing really
arguing for HIGHMEM at all.

This is one reason why I'd like the new kmap_local() to be a no-op,
and I'd prefer for it to have no other side effects - because I want
to be ready to remove it entirely some day. And if we end up having
some transition where people start rewriting "kmap_atomic()" to be
"kmap_local() + explicit preemption disable", then I think that would
be a good step on that whole "kmap will eventually go away" path.

But I do *not* believe that we need to add _so_ much debug support
that we'd catch Willy's "more than one page" case. And I absolutely do
not believe for a second that we should start caring about compound
pages. NO. kmap() is almost dead already, we're not making it worse.

To me, your patch series has two big advantages:

 - more common code

 - kmap_local() becomes more of a no-op

and the last thing we want is to expand on kmap.

           Linus
