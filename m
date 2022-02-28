Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD314C7BBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 22:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6tYw1C01z3br4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 08:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JpEWCU5s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=noloader@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JpEWCU5s; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6tYC2HbYz2yPj;
 Tue,  1 Mar 2022 08:19:10 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so336930pjt.0; 
 Mon, 28 Feb 2022 13:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=JpEWCU5sl0Tb/FD34RSH61Ey9dRKreZqOQa3CJ02luf0uqIT78+8GWNevF0TXmNO1k
 V82hjNGseb3oWLNgnnFwXHAFmfIF+pTCtPsXm95pt2iCzBmJFwg04njU2K1WfIC8K4PQ
 JYTCrkA4ACMCh2biL4u47uoOFfhnbmO/1jCCSOx3OESfK5+oDGNitg9s7NqsmIU5fVsE
 xsR4ABTTJUTksMDshckaPyVLHegSArBm3erCaRT01IEJkH2S1g98XNdRHKV6JZW5AanM
 gI9+nSzlxhKCRaqGLAQjGqwME5o9/K6faQyfblLD265MKP0MWlgdnuFxCRxjUTwlasET
 Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=0UKd2S9bMVLrthDnHI2cLwa7bmw7TpB0TSKnH4yRiNHYnpH3fMG7FH/uK65N2o1YtO
 WGPuUHy1YFVUTdE6VB2kRlUBvDkrL/LXl/hj7sAlJHdVZcAklwit9Pl9D23M9BXlIfnX
 ZsDShi5fjPUTq40mfu/5gHdh7n82OgfKMu32nh3Kz2418xakdQ3gE3ACnYmEBljaowIQ
 h8kltA4jbZgPhP0AfVDzzdgyUtJRWLIfLhcURGfStzfC0ltSzXK2b5vBfLoSLbnspOW2
 H6Lm/8TaRLzjo2MwVfmUqOpVhAWK2MkxCmbCgVJzxxyEjB+ojbSbt3L/B789SS9eDE0t
 mxEg==
X-Gm-Message-State: AOAM533/hLYKAKCAXXaa9JLvjY6ijP4VXRg0ZCGWt5htcrcIhT/59Dtg
 DvXgfkOO6E1Nu+eiaIjKqo1s/NkooTkMdIvrOE0=
X-Google-Smtp-Source: ABdhPJxYQDaw0FFWrTXZCk3OvnKpy6mSdQ8Z9qbCWYQ2FvSetamSp4Rz90y2uoGU7tjomvOtre1MYsL9s+rZuYttBVs=
X-Received: by 2002:a17:902:ce8a:b0:14f:fd0e:e4a4 with SMTP id
 f10-20020a170902ce8a00b0014ffd0ee4a4mr22765912plg.47.1646083147399; Mon, 28
 Feb 2022 13:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 28 Feb 2022 16:18:56 -0500
Message-ID: <CAH8yC8nwp8f3rANhCiiP_Oiw2cjfqCwAgZdTXY9OxtN9Tmm7HA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
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
Reply-To: noloader@gmail.com
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 3:45 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> ...
> > Just from skimming over the patches to change this and experience
> > with the drivers/subsystems I help to maintain I think the primary
> > pattern looks something like this:
> >
> > list_for_each_entry(entry, head, member) {
> >      if (some_condition_checking(entry))
> >          break;
> > }
> > do_something_with(entry);
>
>
> Actually, we usually have a check to see if the loop found anything,
> but in that case it should something like
>
> if (list_entry_is_head(entry, head, member)) {
>     return with error;
> }
> do_somethin_with(entry);

Borrowing from c++, perhaps an explicit end should be used:

  if (list_entry_not_end(entry))
    do_somethin_with(entry)

It is modelled after c++ and the 'while(begin != end) {}' pattern.

Jeff
