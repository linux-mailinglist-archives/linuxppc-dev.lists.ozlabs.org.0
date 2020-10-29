Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F12B629F909
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:22:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMhLM1mddzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=SyS4Sffx; 
 dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMhG41JhnzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 10:18:51 +1100 (AEDT)
Received: by mail-ej1-x642.google.com with SMTP id p9so6139461eji.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 16:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
 b=SyS4SffxYsNmj61H9VhYyfV30AKVcQI02I05R1QJ0WmBmFSO+bnQWo+8WU1Xmtdngw
 /WCUakc82ksJGHGKm7uLpuzRi56V0rh71ThvreQzsj4AGwhIaWOkntvIB7PKONmne7aI
 RS+5JSoq7Rynp7XqZeCI4Lh5y/aQJhenniqh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
 b=E3wfoO423u5Di3MGdY34+x3avVYZ3J0puQ4bdnxK8iJNfJIfkkKqKXj3VJIfA2kcH8
 tElOMsRoEvVVnu7b5JCG77DOczNOFJ0co+fWMDanzqMXGQvNSsNd8DNqhXVbFTdaVw67
 Cnb+pNqtzrDU8RfmfJQA6ez5K3G0UBaH2JtiTpbxhgLQQSnxbKoH1nBTa+IDP/Mmf4ew
 aTl5HEOJitdg4xMJWiweWUTZNkr+YCUPubNvzYl672ecnq/laixp5trFDzhzalQkWJot
 Xq5WJWurC61HoGE8jqNaz0Altk4d8J2Q9wao3aaD7irZkF/d9zZfpMyHivbK3r/JX7AV
 agoQ==
X-Gm-Message-State: AOAM533TAx92n6LExVOqlgO+LDRHx7ZVeZzNScxLvsGIL364e4UXLW5t
 tJVaq9lMXRZFxI0nj28fsPPWbxC/xm/Yfw==
X-Google-Smtp-Source: ABdhPJx9/L8SII7gGHiek0CALlXED4sug0G1CemvDqK1LDKYdW33g/PJOfSFAfP6XL0AUVS6F2J8MQ==
X-Received: by 2002:a17:906:cc8b:: with SMTP id
 oq11mr6859855ejb.116.1604013526478; 
 Thu, 29 Oct 2020 16:18:46 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id v1sm2195879eds.47.2020.10.29.16.18.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 16:18:46 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id i1so4577970wro.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 16:18:46 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr3018764ljh.312.1604013088281; 
 Thu, 29 Oct 2020 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
In-Reply-To: <20201029221806.189523375@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2020 16:11:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
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
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
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

On Thu, Oct 29, 2020 at 3:32 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
>
> Though I wanted to share the current state of affairs before investigating
> that further. If there is consensus in going forward with this, I'll have a
> deeper look into this issue.

Me likee. I think this looks like the right thing to do.

I didn't actually apply the patches, but just from reading them it
_looks_ to me like you do the migrate_disable() unconditionally, even
if it's not a highmem page..

That sounds like it might be a good thing for debugging, but not
necessarily great in general.

Or am I misreading things?

                Linus
