Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1362DEB41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:45:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyMqV0Fm1zDqXm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 08:45:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e33;
 helo=mail-vs1-xe33.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jxyfIMje; dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyLRZ6Ly2zDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 07:43:21 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id z16so2065608vsp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 12:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l62fXWBivGwlBoP6Q6yUTArybDInvE3dJbHgou5OuB4=;
 b=jxyfIMjeU+V/pldNXEBYpau02vKGdYbw6iFBxIoxftZL9QzHL6vHuSwolxtLvA2wqH
 KzmhXUUaparUZkE+NieyArCHqLxwTTG3DcPTCbkGn0Xy7KXgP8+Z7ZKFK+uueKL/WmX2
 2D+F0jghJGSD9gPb8trOo/kpwbzZdIZsDW4eyEuUVhje15U5w4VFGJiJhTZA0xQ0jF92
 vxd86+5kYbrt9ymOlGQyhOalBC6zquGtpxQS3Okio4VIFpUmpFOyR5F5Px7nojC+MeWm
 C9dBCCHYxwmBflovDELfN0Tm2lIyloWhpqAyy2RHuLBCbhzjS1cSDF2coxs6QkQRkGCN
 cJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l62fXWBivGwlBoP6Q6yUTArybDInvE3dJbHgou5OuB4=;
 b=Z9fBj9mas1ReyFakSOZ+aAJl7Hw7KoB5ghNM68jUEw1JrkBKqSJKGN7+MtP76H6x/m
 ugGyqHf13HO2LWXwtwf/8g2GiZQu3YqeIZDeP+TybML64kAsThgbHwxiAEDrX0wcbxly
 oCseuvEjS0MhpTW1gTIP3ZGtDvVjVx+rJieq0bLuHPhasgyTu6gKFnHriaj+tDwuS5er
 bcUhrKoFwM9I92Elz6Et7TMSj0fr87E9Vmfm3GuY5DwCvvViqpbgDsmRC8jvxF5GGPyB
 c4cyFTSMCQa/jTPtwca/pk75QOGJ/+00RdAMCDTa46cjul0Vr+Hn9yP07Wvn3YFiQKj4
 iCHA==
X-Gm-Message-State: AOAM532dk1ni4HJkskHfsPlCV8Td8N9txCIhBwoFK/etzSXSYGc8W9lF
 6hWHTd77r5YL1n/0EhZXp6ub0RsrB5UD/Ajs+be70sdXrCmQBQ==
X-Google-Smtp-Source: ABdhPJwgcv8pviA1ZBB44l0qFlV7DI5XKtkmGAn3tN+l3zsJKq3EPmg2ySD9zVDcZkEm3YOe5odgyqrfotBXkCTYbIc=
X-Received: by 2002:a67:8011:: with SMTP id b17mr6838074vsd.2.1608324197703;
 Fri, 18 Dec 2020 12:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20201213183556.16976-1-ariel.marcovitch@gmail.com>
 <4716e80b-db6f-7669-684f-398971ed5f2e@csgroup.eu>
In-Reply-To: <4716e80b-db6f-7669-684f-398971ed5f2e@csgroup.eu>
From: ariel marcovitch <arielmarcovitch@gmail.com>
Date: Fri, 18 Dec 2020 22:43:06 +0200
Message-ID: <CAFGKuwoE=Mh3jEnzjfCGzMw3d+R_Z=i+HGEVR+6-PrMYL9oO1g@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix alignment bug whithin the init sections
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Dec 2020 08:42:47 +1100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 18, 2020 at 5:39 PM Christophe Leroy <
christophe.leroy@csgroup.eu> wrote:

> It can cause, or it causes ? Did you encounter the issue ?
>
Yes, in configs that result in the section layout I described, the crush is
consistent.

>
> > The init sections are ordered like this:
> >       .init.text
> >       .exit.text
> >       .init.data
> >
> > Currently, these sections aren't page aligned.
> >
> > Because the init code is mapped read-only at runtime and because the
> > .init.text section can potentially reside on the same physical page as
> > .init.data, the beginning of .init.data might be mapped read-only along
> > with .init.text.
>
> init code is mapped PAGE_KERNEL_TEXT.
>
> Whether PAGE_KERNEL_TEXT is read-only or not depends on the selected
> options.
>
You are right, of course. Should I change the commit message to 'might be
mapped' or something?

>
> > Then when the kernel tries to modify a variable in .init.data (like
> > kthreadd_done, used in kernel_init()) the kernel panics.
> >
> > To avoid this, I made these sections page aligned.
>
> Should write this unpersonal, something like "To avoid this, make these
> sections page aligned"
>
Noted, thanks.


>
> >
> > Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
> > Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>
> > ---
> >   arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> b/arch/powerpc/kernel/vmlinux.lds.S
> > index 326e113d2e45..e3a7c90c03f4 100644
> > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > @@ -179,6 +179,11 @@ SECTIONS
> >   #endif
> >       } :text
> >
> > +     /* .init.text is made RO and .exit.text is not, so we must
> > +      * ensure these sections reside in separate physical pages.
> > +      */
> > +     . = ALIGN(PAGE_SIZE);
> > +
>
> In principle, as it is text, it should be made RO as well. But what
> happens at the begining doesn't
> really matter, anyway .exit.text should never be executed and is discarded
> together with init text.
> So, I think it is OK the live with it as is for the time being.


> Making it page aligned makes sense anyway.
>
> Should we make _einittext page aligned instead, just like _etext ?

Yes, this will probably be better (because when _einittext is not aligned,
the part of the page after _einittext is mapped RO implicitly, and it's
hard to notice from the code). I suppose you mean something like this:
                _sinittext = .;
                INIT_TEXT
+
+               . = ALIGN(.);
                _einittext = .;

>       /* .exit.text is discarded at runtime, not link time,
> >        * to deal with references from __bug_table
> >        */
> > @@ -186,6 +191,8 @@ SECTIONS
> >               EXIT_TEXT
> >       }
> >
> > +     . = ALIGN(PAGE_SIZE);
> > +
>
> Here for sure, as you explain in the coming log, this needs to be
> separated from init text. So
> making it aligned is a must.


> >       .init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
> >               INIT_DATA
> >       }
> >
> > base-commit: 1398820fee515873379809a6415930ad0764b2f6
> >
>
> Christophe
>
Thanks for your time,
        Ariel Marcovitch
