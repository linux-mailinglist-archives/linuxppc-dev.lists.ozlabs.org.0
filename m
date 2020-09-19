Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C530B270FBB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 19:20:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtyCN6GrbzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 03:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=PDwKTi4l; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bty9k5Ln6zDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 03:19:20 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id a12so8930514eds.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=waM6UyKAxKjxaPuk1aOj7tJ5Pe/ksOuiXEzSSo1PI/U=;
 b=PDwKTi4lX9j7zg3G7WzPyBOHBiLdhmAgWRxWPWvYR/nEys9FVfUL6zNUVgG09pDixg
 o+e2DCxbAvOZN3jBhyrOMZPfygh9RU8mogp2HXrCoLkUWHRL8e1VK4NRvgzXaMsluBfo
 GR1BPuNqLZOfJqo2g/IqA9gl4eqzfpV+zOYak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waM6UyKAxKjxaPuk1aOj7tJ5Pe/ksOuiXEzSSo1PI/U=;
 b=QaSisOvJjwmMt3a0iGg9IobFgLtnaljLOFvtEG1DffARMVyZFO7KUmjOidjFHmOtch
 sMT0aCh9QVSfV8WRoZjK3w9pmE8g4jvbeq72L6xSMzspOP81ql7aSOR6qpIvE4P4QkV6
 ZAUynEIXfywfdhjl8lN8wLMiK/pcDJxI/ycXQa+r+TI52De8xIRU15/J9FNC4QqrMqNb
 rsVGcNMyxgn8LUavZk7deVlJSYPNqNSpZWNKE7FlsvMyyL1Y/PAnoJ5Kry6/e7V7qSkY
 L4cbFPqsfZZcVFkCznuStgnr7zGTriWyUG6yTIoMOQcesQ1ItpTvzwAO0LbT5kwJUQlH
 /GNA==
X-Gm-Message-State: AOAM530sevimmaPDdB1HSe8fWhk6xpnDeg9wrdt1M8o9W3/vfsy/VvTU
 IqEKlw0LOG33nACluMxoQyilA1b32a5Hpw==
X-Google-Smtp-Source: ABdhPJygqTWRRtkfd0sGne3scBefHkkXqlGWed0OBJ/qs7XqIhXbDNnpxUwXamCaUeM2XZrkJD8CxQ==
X-Received: by 2002:a05:6402:16c9:: with SMTP id
 r9mr43662005edx.27.1600535954893; 
 Sat, 19 Sep 2020 10:19:14 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47])
 by smtp.gmail.com with ESMTPSA id m19sm4911932ejj.91.2020.09.19.10.19.13
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 10:19:14 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id j11so12320000ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 10:19:13 -0700 (PDT)
X-Received: by 2002:a19:521a:: with SMTP id m26mr14134256lfb.133.1600535951025; 
 Sat, 19 Sep 2020 10:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
In-Reply-To: <20200919091751.011116649@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2020 10:18:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
Message-ID: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 2:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> this provides a preemptible variant of kmap_atomic & related
> interfaces. This is achieved by:

Ack. This looks really nice, even apart from the new capability.

The only thing I really reacted to is that the name doesn't make sense
to me: "kmap_temporary()" seems a bit odd.

Particularly for an interface that really is basically meant as a
better replacement of "kmap_atomic()" (but is perhaps also a better
replacement for "kmap()").

I think I understand how the name came about: I think the "temporary"
is there as a distinction from the "longterm" regular kmap(). So I
think it makes some sense from an internal implementation angle, but I
don't think it makes a lot of sense from an interface name.

I don't know what might be a better name, but if we want to emphasize
that it's thread-private and a one-off, maybe "local" would be a
better naming, and make it distinct from the "global" nature of the
old kmap() interface?

However, another solution might be to just use this new preemptible
"local" kmap(), and remove the old global one entirely. Yes, the old
global one caches the page table mapping and that sounds really
efficient and nice. But it's actually horribly horribly bad, because
it means that we need to use locking for them. Your new "temporary"
implementation seems to be fundamentally better locking-wise, and only
need preemption disabling as locking (and is equally fast for the
non-highmem case).

So I wonder if the single-page TLB flush isn't a better model, and
whether it wouldn't be a lot simpler to just get rid of the old
complex kmap() entirely, and replace it with this?

I agree we can't replace the kmap_atomic() version, because maybe
people depend on the preemption disabling it also implied. But what
about replacing the non-atomic kmap()?

Maybe I've missed something.  Is it because the new interface still
does "pagefault_disable()" perhaps?

But does it even need the pagefault_disable() at all? Yes, the
*atomic* one obviously needed it. But why does this new one need to
disable page faults?

[ I'm just reading the patches, I didn't try to apply them and look at
the end result, so I might have missed something ]

The only other worry I would have is just test coverage of this
change. I suspect very few developers use HIGHMEM. And I know the
various test robots don't tend to test 32-bit either.

But apart from that question about naming (and perhaps replacing
kmap() entirely), I very much like it.

                        Linus
