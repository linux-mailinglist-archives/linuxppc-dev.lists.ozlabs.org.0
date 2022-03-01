Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B707B4C93A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 19:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7RKm5b8Vz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 05:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZEWbFFu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=ZEWbFFu3; 
 dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7RK805Dhz30KZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 05:55:39 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id bq11so23285667edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
 b=ZEWbFFu3eWrZxUgaaScwD4ZJ//Z7mV4SGMyACB20WwCKEMFGKIBMMEXVkM4kZXdOyd
 EokMKBVyAcoYChV/SvtOh5q5h0Yafm3wlsC3jCGOeoM0h4pn550KTbE+/sUn3z3m8p0V
 ZL0gG9ZTrYCOlyUURTCDAGrluijISoqXbB1wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
 b=hM03OSJYc0U21JRgWJJk+Dhr24lYLQMa0p+7JIQ/VocLZ4XniIsXuM1VYe6gZLyR3s
 ubNtaY+Lewhc+bZTnlTgulYdthxmczPVdUE/N6B/Nss78sG3moLxMyo3gqIIo94LmWhf
 HDv39JqIkH8Vj4lqZQpPkEFZyrt/sPxhv0JKDMRQEDfiO9222clQnZwhABagsoPdgW52
 UoWI/Y2SOBSWngl20LACV3vaK+Am9dC1rZmgvzc6pms2I876zrbjxDCyD9eIu6UjCeoQ
 k6PZ3yGdzTgTJTz2CEw7rLuoXBBny7pAS4zxLdWUlZVCfF1kN332si3EBYMt+HZQ94GI
 YNDg==
X-Gm-Message-State: AOAM5310dtDr5ShVWjyq1JizPwn9q4reYRDMul0U0Tij4EQLi4D0qOtm
 6wwx9pLw3JgydgsPy2jtMc62vAR66ate2HGCsH8=
X-Google-Smtp-Source: ABdhPJzjO0fpFX3AuE4bxqckTlEA1iIYYl7+8rZ/TBMgCmJ/eHeO5Z6tXy4/ddqcRnDII6m+WZUqSg==
X-Received: by 2002:a50:fb19:0:b0:404:eb52:62cb with SMTP id
 d25-20020a50fb19000000b00404eb5262cbmr25599491edq.363.1646160936336; 
 Tue, 01 Mar 2022 10:55:36 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 by10-20020a0564021b0a00b00412ddfc6d12sm7639261edb.0.2022.03.01.10.55.36
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:55:36 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id qx21so33329139ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 10:55:36 -0800 (PST)
X-Received: by 2002:a05:6512:2033:b0:443:3d49:dac with SMTP id
 s19-20020a056512203300b004433d490dacmr16440784lfs.52.1646160451271; Tue, 01
 Mar 2022 10:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
 <202203011008.AA0B5A2D@keescook>
In-Reply-To: <202203011008.AA0B5A2D@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 10:47:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Matthew Wilcox <willy@infradead.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 1, 2022 at 10:14 AM Kees Cook <keescook@chromium.org> wrote:
>
> The first big glitch with -Wshadow was with shadowed global variables.
> GCC 4.8 fixed that, but it still yells about shadowed functions. What
> _almost_ works is -Wshadow=local.

Heh. Yeah, I just have long memories of "-Wshadow was a disaster". You
looked into the details.

> Another way to try to catch misused shadow variables is
> -Wunused-but-set-varible, but it, too, has tons of false positives.

That on the face of it should be an easy warning to get technically
right for a compiler.

So I assume the "false positives" are simply because we end up having
various variables that really don't end up being used - and
"intentionally" so).

Or rather, they might only be used under some config option - perhaps
the use is even syntactically there and parsed, but the compiler
notices that it's turned off under some

        if (IS_ENABLED(..))

option? Because yeah, we have a lot of those.

I think that's a common theme with a lot of compiler warnings: on the
face of it they sound "obviously sane" and nobody should ever write
code like that.

A conditional that is always true? Sounds idiotic, and sounds like a
reasonable thing for a compiler to warn about, since why would you
have a conditional in the first place for that?

But then you realize that maybe the conditional is a build config
option, and "always true" suddenly makes sense. Or it's a test for
something that is always true on _that_architecture_ but not in some
general sense (ie testing "sizeof()"). Or it's a purely syntactic
conditional, like "do { } while (0)".

It's why I'm often so down on a lot of the odd warnings that are
hiding under W=1 and friends. They all may make sense in the trivial
case ("That is insane") but then in the end they happen for sane code.

And yeah, -Wshadow has had tons of history with macro nesting, and
just being badly done in the first place (eg "strlen" can be a
perfectly fine local variable).

That said, maybe people could ask the gcc and clan people for a way to
_mark_ the places where we expect to validly see shadowing. For
example, that "local variable in a macro expression statement" thing
is absolutely horrendous to fix with preprocessor tricks to try to
make for unique identifiers.

But I think it would be much more syntactically reasonable to add (for
example) a "shadow" attribute to such a variable exactly to tell the
compiler "yeah, yeah, I know this identifier could shadow an outer
one" and turn it off that way.

               Linus
