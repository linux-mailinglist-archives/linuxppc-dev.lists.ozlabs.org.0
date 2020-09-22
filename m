Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1BB273E14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 11:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwb8545d7zDr0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 19:08:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwb6Q5WbWzDqpM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 19:07:09 +1000 (AEST)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKKhF-1k2HPk1QGF-00LrLD for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep
 2020 11:01:51 +0200
Received: by mail-qk1-f178.google.com with SMTP id w12so18281951qki.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 02:01:50 -0700 (PDT)
X-Gm-Message-State: AOAM532lKqxaA5x1+TGDosDDeMxjawiWI+jQFgC7P+0m1JrZoU/FcfUq
 YopsNrC8xQFT8F2ZTO5ABx0T8rM9kIhjqrl6WCM=
X-Google-Smtp-Source: ABdhPJyRqkNrv5vljO58DCgwZZgH8gYzn8Pg1f10DkzXAekHvwLoBvZT9T4MCMOwP2QMtNaCPo1tGJEV8E4gZYbkeUE=
X-Received: by 2002:ae9:c30d:: with SMTP id n13mr3794670qkg.138.1600765309262; 
 Tue, 22 Sep 2020 02:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
 <D0791499-1190-4C3F-A984-0A313ECA81C7@amacapital.net>
 <563138b5-7073-74bc-f0c5-b2bad6277e87@gmail.com>
 <486c92d0-0f2e-bd61-1ab8-302524af5e08@gmail.com>
 <CALCETrW3rwGsgfLNnu_0JAcL5jvrPVTLTWM3JpbB5P9Hye6Fdw@mail.gmail.com>
 <d5c6736a-2cb4-4e22-78da-a667bda5c05a@gmail.com>
 <CALCETrUEC81va8-fuUXG1uA5rbKxnKDYsDOXC70_HtKD4LAeAg@mail.gmail.com>
 <e0a1b4d1-ff47-18d1-d535-c62812cb3105@gmail.com>
 <CAK8P3a2-6JNS38EbZcLrk=cTT526oP=Rf0aoqWNSJ-k4XTYehQ@mail.gmail.com>
 <f25b4708-eba6-78d6-03f9-5bfb04e07627@gmail.com>
In-Reply-To: <f25b4708-eba6-78d6-03f9-5bfb04e07627@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Sep 2020 11:01:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a39jN+t2hhLg0oKZnbYATQXmYE2-Z1JkmFyc1EPdg1HXw@mail.gmail.com>
Message-ID: <CAK8P3a39jN+t2hhLg0oKZnbYATQXmYE2-Z1JkmFyc1EPdg1HXw@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gAQ1Y/mITghx9Y1c+QHOM4ohb4boJHNSmRxI7CIo79NB9sB8gza
 MfY0pR8r8waqbEJ4C4risb5B7isbfULIHJhavRpn4pEsop37LO7XTc/GpYAXPBwZPGlhxXB
 8GR8CAkAxT0r1DN+D669ltaNSLBupSFv0HiLfRUJu9sZlmc6zNvR91xtgH81lU94VAto9iu
 nDdCzOaItxN4Tl7YuVZJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tWkwR6ibpd0=:YMOcy4Ql4EJBWaEn045qrO
 3SR0y2MJXF/hF+4bvT0POKLuUmlsQFPLsWi6UzCtQYt0amfUzHoftO0q1KGVUc8M72mIl1oeg
 bscb9Yg0A3UTNC/vOh5pJ2NTuGDkrNu8hQipCoTC5jueQ4ebhGe/WvqVzd87laaVWkhQtgW/q
 49maF2ByyXbjHYTIG74DvZPQN+8EAMjC81s84YmIKBYoMWcU4S50vl57Ky9Ms7goRWwgwvqYI
 i84vdL85eXOpqoMtKZrM+ER5l5BuGMk94C26OOFtkFkbMVU3Cm2VnLR6Hj3GL38YQ6wknIF+r
 85w+24xlniBLvcQkYZXTN6iqUdd6xyFVpc/2CieLC6lm4WQl+NTK6nwmPt+MbtRkXMqFgN9Rn
 eER87yjU9dg9B41gsddh8DBjKYS2vvebfcof8vvRo2N84aK4CJi7Oa/eYGDjY4bzxHoCQUj9m
 tuMD2HKMS3y2YymuNzJAsUJB8rPKk/CEYuZP+blOllLV/Qu1FbcNfOmAOyzrQcdginchT6H2T
 wOo79RoD0W2I8JXbPSr3D25z3N81ZUvzljA0oxvQVBEyjTRmRDbgaiSzWZF3/Sr1jOQhcJN7A
 1jPvrMR4MXp/3HkVm7zd+z893ItczlD2ORhZjhijXhp/4KMC2wUw9eu8BvbBEn2fl43XkZac6
 h5+x1/YE5bRpjy8D9zEhVJO4l0js4IAi8p0Asoz6gJuU6xtaTXvoVvp+60dxqBF7htc1fMNbJ
 brfuFTTvDr3aiQVwjXM+eOLKXMouMrJXAvpv/uAS76KcB3/FK5xlGaFu6ICAT+IFDffnFp41N
 HJLbLm3Y+mC8/zjE7SZGkfRvuDppI1d1fPYrHsZGedUYPGUY0bw95fX+W9e0LrUdEHKUxpTSQ
 2e8lJJW5574qP6Ats8p3R0qle7f8OzatntITFI8ApOeVgrERqKGH72Gv8PyXCuIOwZjxS6Jor
 SyQPPaokH57qXkC9VoVgREhdY0tX76DcVNQpXZJxk+2S66rI248Rg
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 9:59 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> On 22/09/2020 10:23, Arnd Bergmann wrote:
> > On Tue, Sep 22, 2020 at 8:32 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> >> On 22/09/2020 03:58, Andy Lutomirski wrote:
> >>> On Mon, Sep 21, 2020 at 5:24 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
> >>> I may be looking at a different kernel than you, but aren't you
> >>> preventing creating an io_uring regardless of whether SQPOLL is
> >>> requested?
> >>
> >> I diffed a not-saved file on a sleepy head, thanks for noticing.
> >> As you said, there should be an SQPOLL check.
> >>
> >> ...
> >> if (ctx->compat && (p->flags & IORING_SETUP_SQPOLL))
> >>         goto err;
> >
> > Wouldn't that mean that now 32-bit containers behave differently
> > between compat and native execution?
> >
> > I think if you want to prevent 32-bit applications from using SQPOLL,
> > it needs to be done the same way on both to be consistent:
>
> The intention was to disable only compat not native 32-bit.

I'm not following why that would be considered a valid option,
as that clearly breaks existing users that update from a 32-bit
kernel to a 64-bit one.

Taking away the features from users that are still on 32-bit kernels
already seems questionable to me, but being inconsistent
about it seems much worse, in particular when the regression
is on the upgrade path.

> > Can we expect all existing and future user space to have a sane
> > fallback when IORING_SETUP_SQPOLL fails?
>
> SQPOLL has a few differences with non-SQPOLL modes, but it's easy
> to convert between them. Anyway, SQPOLL is a privileged special
> case that's here for performance/latency reasons, I don't think
> there will be any non-accidental users of it.

Ok, so the behavior of 32-bit tasks would be the same as running
the same application as unprivileged 64-bit tasks, with applications
already having to implement that fallback, right?

      Arnd
