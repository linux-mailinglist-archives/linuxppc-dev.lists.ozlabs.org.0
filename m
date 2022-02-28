Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E44C7AF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6svT5Qyrz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 07:49:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WVa5dIiq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=WVa5dIiq; 
 dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6stn4BBJz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 07:49:21 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id qa43so760204ejc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhbC6eV8gO++7ErI4p8jtmcwHU0MP2/Ov9cpdMFArow=;
 b=WVa5dIiqx38h7wrDwDC1XUsKJKiBFCag4a2cDDwm9PX3cUtT8qqZ7IT4jQUgf/P4m+
 SFGMe+WsS02R4cGzO91FNZKGdT/lUA2soxV9cxmDWvmKG61T36jSK+GypeHu4wmj47J3
 J2dEWo9WRu5EKgz1ZgjNDbSUreOeJ25KIOWY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhbC6eV8gO++7ErI4p8jtmcwHU0MP2/Ov9cpdMFArow=;
 b=C71O1XV5Zr/5Q6SF2vKFTCFnEidTOoF8NOay7QwDGJc22ri3XnpNlydOvrw/PVmdVC
 pwW3AfMQ+HrRJ9A90z4sgu07WYTK7WKs9KJAdeF1VrL9rW+GmnFXMWzeE/2fs3OVDgwc
 1wtpRmqj8U/gCuvvu7I9T+/qEtqDyGgjn6SOBp0CQNoo0VkzefEXfr9og0ef+SWxUcyP
 I+aaEkcpd1PZTvSdq5/rgg17+Ri+1JZywA9sF1oOOrhOr8vu/L0GQFaXkYcLKToeHWIY
 dKSDEGEZhqi6lPLnCa8iF23MEPOgAN/zs/apSapO8Cc6t7jBZK7A+Ap6RUam+agOE/K9
 +6IA==
X-Gm-Message-State: AOAM533Sb+O1TK8YnR4ZA1J2vdjQhUUMi8E2WcDxmyh046UPZOonL7Jt
 aZymXBQta3YJ+Gaja1xodjGGUo3KK+/EkaT5uPQ=
X-Google-Smtp-Source: ABdhPJy9jq6YDmVPF5bI+gytASAbRC0PsvYvAkIgekZ3/Zg2ywmOU3CV1Oj6Uut0LlQ1hYMREKH/jQ==
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id
 h27-20020a170906585b00b006b773bc5395mr16624048ejs.519.1646081357644; 
 Mon, 28 Feb 2022 12:49:17 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 p7-20020aa7cc87000000b00410ee30cefbsm6484033edt.71.2022.02.28.12.49.17
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:49:17 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id p14so27272022ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:49:17 -0800 (PST)
X-Received: by 2002:a05:6512:e8a:b0:443:7b8c:579a with SMTP id
 bi10-20020a0565120e8a00b004437b8c579amr13784522lfb.687.1646080877791; Mon, 28
 Feb 2022 12:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
In-Reply-To: <e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:41:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNgWNa9njuBJEoafc-cRV3SbzZfh3m5YfxcZxdCw3+XQ@mail.gmail.com>
Message-ID: <CAHk-=wjNgWNa9njuBJEoafc-cRV3SbzZfh3m5YfxcZxdCw3+XQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Johannes Berg <johannes@sipsolutions.net>
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
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
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

On Mon, Feb 28, 2022 at 12:29 PM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> If we're willing to change the API for the macro, we could do
>
>   list_for_each_entry(type, pos, head, member)
>
> and then actually take advantage of -Wshadow?

See my reply to Willy. There is no way -Wshadow will ever happen.

I considered that (type, pos, head, member) kind of thing, to the
point of trying it for one file, but it ends up as horrendous syntax.
It turns out that declaring the type separately really helps, and
avoids crazy long lines among other things.

It would be unacceptable for another reason too - the amount of churn
would just be immense. Every single use of that macro (and related
macros) would change, even the ones that really don't need it or want
it (ie the good kinds that already only use the variable inside the
loop).

So "typeof(pos) pos" may be ugly - but it's a very localized ugly.

                    Linus
