Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1627102E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 21:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv0w02NzmzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 05:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=SNvzyY/D; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv0tQ6VTczDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 05:21:18 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id w3so7782493ljo.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
 b=SNvzyY/D28nrQ/9in1B6Dzi002SQEpeIWQ8e1hzmI9hVRDCDcHjzeJE8AlbYJKjj8B
 G7NnpY7h0luEeygyoDxqLDk2AWGbQCdyloo3Y9XIxWLvxZdXjZ/NeK2kaD/mL0YWoior
 T+0jhpZUK76WT2Sz7na41qAPiBNog2OUpnoIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
 b=N05qmUchVh5kcm4PfeOKgCTac1OkobuTDMhnj+nfOwdaiq+uRzhni3hTHDwgGR5ANE
 pEeKqxYgJN9HUoWedUNP6XZSHVa9zHuWwD4LC7pRtwMSN3fxPwDeYnc6i7XHwBKQo0Jj
 4ZJ+QkIZcdYSaG+rrUUxiiP8CDIEMaepY6DyQqYMy285ChBCz3J3gtEcmGd32X4GGVMU
 E2z+d7XYt1yS2385/6JPPvZ1ai7pMbc7XVsKA3e80tlXsLa/LfxQy5urVJiih3Cam4+U
 WU1Fq7z/qRce77zx1zCxrGzBPS3VGWp/wkoV0VWHe2vD8rINoG6Hhz9W5tL//AeKnrpO
 PAGQ==
X-Gm-Message-State: AOAM530/fYCKzLzWoVnvL2EOAOjIZ3d0G7riGJJgUOTQYkDMW9TCU6ov
 cjGmIxE2wuidFYmNOixx4FFNwG58KWcVxA==
X-Google-Smtp-Source: ABdhPJw+TnDYrJ8e/dHsOLwQh9DPlLrbiPB1EHk/O4hF413/JDmF1HjqtyaBljl6kk5yELa8ii/fZQ==
X-Received: by 2002:a2e:8257:: with SMTP id j23mr13566958ljh.49.1600543273187; 
 Sat, 19 Sep 2020 12:21:13 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id a192sm1396292lfd.51.2020.09.19.12.21.12
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 12:21:12 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id k25so7802170ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 12:21:12 -0700 (PDT)
X-Received: by 2002:a19:8907:: with SMTP id l7mr12464193lfd.105.1600542797553; 
 Sat, 19 Sep 2020 12:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <20200919173906.GQ32101@casper.infradead.org>
In-Reply-To: <20200919173906.GQ32101@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2020 12:13:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Matthew Wilcox <willy@infradead.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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

On Sat, Sep 19, 2020 at 10:39 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> My concern with that is people might use kmap() and then pass the address
> to a different task.  So we need to audit the current users of kmap()
> and convert any that do that into using vmap() instead.

Ahh. Yes, I guess they might do that. It sounds strange, but not
entirely crazy - I could imagine some "PIO thread" that does IO to a
page that has been set up by somebody else using kmap(). Or similar.

                Linus
