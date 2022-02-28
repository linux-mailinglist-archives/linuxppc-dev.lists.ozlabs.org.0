Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B584C7C76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 22:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6vBC5p4Dz3brL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 08:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DcAOXNn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DcAOXNn/; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6v9W3Gx3z30Km;
 Tue,  1 Mar 2022 08:47:09 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id bq11so19517531edb.2;
 Mon, 28 Feb 2022 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=DcAOXNn/ViLnmA/Pl4xJfWkhBybquVghVb27ULjvzphMd1cBlP8EnT2avc3nlq8Ncp
 XU0OlwqVPcxmpQGfXIX8cDSYeDqzQFDIjUJw6vYkNcJJHsbpQaotozEaUyIGD250VuoD
 60I5wOFshLHgsaHS54p/JatmHLrrllGTo/egDJjxoeGmck3vK6ZaE0ldZN4szqLK845U
 BQNwjpOC8zhohOQR/VOEr6j/DtNOqZN6I6F48XJrq+10cNhH40s7WdjZ8f4gJpCeR9JY
 suF4D0bui+heOiMd0XjHUkKuJX/fj0a+j8l22tTUgDxT9LwW7gkDbHU26uOV2JCB+l1v
 aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=OI6YD42byaBLZc9EUhwgRkHzDfiUgCWaFIRzKmDNYo7hlCMeb3xU92FLavuLElotFT
 7JMq0kkwZ1ZPDy9yLASU9Owo0Z+k7qmukKNLIunvNge2ZIyQcoIJfEaTyxRgBLVI/7ll
 wFnF3+vVWBFAyOzVP0z+aUspIAs4dwDorYB8UqTNlRFdPBxAlO59THZJGcsso22ZIxVg
 PVBk6Zh6OqfFJvZsVAPJxLs1Hf7r3hc+DMy8zoT49QOxSDeDsOG/8rFxLbKgnmYWy8zE
 PiA9ay82T4dqJavNRocOM27tvtGMT/f5+iXespLGxbulDD2mH65VFHeWN5yTQAiWljdp
 ljZg==
X-Gm-Message-State: AOAM5302u9O2WqPtPwM3tHqy9kK92MupHXr8TOTW96/z5nSo5riNwgQF
 vfcCpDjj728h5vAD4hBZ29M=
X-Google-Smtp-Source: ABdhPJxKG2ff16tCWsK6Ck3Y2a57p3q44AgnQUgUMRZ3ajKrFkwS/Wlp6PHXO9g9MP9OhOujc97TPw==
X-Received: by 2002:a05:6402:40d0:b0:412:f86a:efd1 with SMTP id
 z16-20020a05640240d000b00412f86aefd1mr21791110edb.194.1646084823834; 
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 ce7-20020a170906b24700b006cf095c2f5bsm4701847ejb.83.2022.02.28.13.47.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Date: Mon, 28 Feb 2022 22:47:00 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
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
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 v9fs-developer@lists.sourceforge.net,
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
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28. Feb 2022, at 21:10, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>=20
>> Side note: we do need *some* way to do it.
>=20
> Ooh.
>=20
> This patch is a work of art.
>=20
> And I mean that in the worst possible way.
>=20
> We can do
>=20
>        typeof(pos) pos
>=20
> in the 'for ()' loop, and never use __iter at all.
>=20
> That means that inside the for-loop, we use a _different_ 'pos' than =
outside.
>=20
> And then the compiler will not see some "might be uninitialized", but
> the outer 'pos' *will* be uninitialized.
>=20
> Unless, of course, the outer 'pos' had that pointless explicit =
initializer.

The goal of this is to get compiler warnings right? This would indeed be =
great.

Changing the list_for_each_entry() macro first will break all of those =
cases
(e.g. the ones using 'list_entry_is_head()).
I assumed it is better to fix those cases first and then have a simple
coccinelle script changing the macro + moving the iterator into the =
scope
of the macro.

>=20
> Here - can somebody poke holes in this "work of art" patch?

With this you are no longer able to set the 'outer' pos within the list
iterator loop body or am I missing something? Like this it stays
uninitialized but you'll probably want to set it from within the loop.

You would then yet again need a variable with another name to use
after the loop.

I fail to see how this will make most of the changes in this
patch obsolete (if that was the intention).

>=20
>                     Linus
> <patch.diff>

- Jakob

