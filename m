Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC334C7AD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6snz2dwmz3bqZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 07:45:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JCfpf2Ek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=JCfpf2Ek; 
 dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6snL4hBgz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 07:44:36 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id b11so23415420lfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=JCfpf2EkV0u8p2DIwI3SoZoRhHthQMEAy9/7LEkowc8JnTmPgsFXHlzh4U3t+Q6SEk
 Lc7ftzGO2kIrejoWkV3dzzd0jpx1zu67BigJ1Dmt6MH2aSREOTU5VOooJKZjMGKU+kco
 F0IyOo2hDxkf3WtcbllN4ffR7kqC0AZqO0I4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=ul0OJ+IDF6smtRlx3MtGHQTdE5GKmUtEP48rq+wI0iOw+7XQatImTa5OVwbiNNjODA
 +nBCF4c13NPUc+YbRaTZux7bpAK/bPh/dyzXSCBKhlazCFJQe1atHBsFHAs+IbN/wdZ7
 cg/t3KogUIH4ONWeKigEIovyBO0vZL7NVq1UbMbnVGI+JtDY20m6rN26qmf+lUbSF7IL
 2404GhAJVeyll4uWiMBZXIHcNNLCkVS15ycD2jD3cxrUxXrtYliE9SUkC8rpp+Fwvatk
 NA1pKOhaFcP8yg7ndkOY41aHki+6Z8SfVEeW9VBqFMudrUN38SJexZhQr+HOgv/U+kY7
 7ORQ==
X-Gm-Message-State: AOAM532S1Wn05+PgLvl+mtc2xLnKPGa1BEqFQY53ndTI4zduYhHUUFJB
 mDARS7xQk0AxLStLApD+wJ+o9Z33/hiJfmbIypQ=
X-Google-Smtp-Source: ABdhPJwDzWD5FWzJ3RV4vThOXgHyg/GZ2NSltUDrCm5HY7DlC0cTwpQOcS90rbvfxbSxV7eQWO0zKg==
X-Received: by 2002:ac2:4a66:0:b0:432:b605:1676 with SMTP id
 q6-20020ac24a66000000b00432b6051676mr14142057lfp.115.1646081074147; 
 Mon, 28 Feb 2022 12:44:34 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 bq30-20020a056512151e00b0044313dc8e74sm1126533lfb.197.2022.02.28.12.44.33
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:44:33 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id bu29so23570809lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 12:44:33 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15158756ljg.358.1646080652034; Mon, 28
 Feb 2022 12:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:37:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Mon, Feb 28, 2022 at 12:16 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.

Oh, we already can never use -Wshadow regardless of things like this.
That bridge hasn't just been burned, it never existed in the first
place.

The whole '-Wshadow' thing simply cannot work with local variables in
macros - something that we've used since day 1.

Try this (as a "p.c" file):

        #define min(a,b) ({                     \
                typeof(a) __a = (a);            \
                typeof(b) __b = (b);            \
                __a < __b ? __a : __b; })

        int min3(int a, int b, int c)
        {
                return min(a,min(b,c));
        }

and now do "gcc -O2 -S t.c".

Then try it with -Wshadow.

In other words, -Wshadow is simply not acceptable. Never has been,
never will be, and that has nothing to do with the

        typeof(pos) pos

kind of thing.

Your argument just isn't an argument.

              Linus
