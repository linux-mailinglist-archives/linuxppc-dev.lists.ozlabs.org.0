Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F498994A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 07:10:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aQClWHEo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9mlt1MkQz3vX7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 16:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aQClWHEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9ml80gMSz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 16:10:11 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a46a7208eedso244004666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 22:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712293808; x=1712898608; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlMY98BD79lBdspG+ouG7M9punegC0XfPjsulWCNnW4=;
        b=aQClWHEotftU1SeYm8ehUNoLD7kMiEKxwHG40K2zegvuiK25T7jIn/Q6J2xo+j3uQw
         GujYEoI0XvOkkP94quZQGkiuYCB/Ssaaxon38L/ya15ZkJOH/b4Z0Q/soehbHd4UoaOr
         O38JnYXcdR6GCM1rcKdBpsmbIim0Bo3kAj7t+crfrkdY0xV6n7y/Y3sb0Cvvc1mnsa4+
         XD3ufBG7RV1nAbMA0qgnf7c5t9keg3rpU7XwwXXqH8nt/+9nlzN3u/cfBN5R0tpQ38De
         s6mM3P9JWU5ygBgITsBMBrXe2LUTgp8ob6ywlYAqwjmVi0/aYtgp5eTKXvEUzQRbuq6t
         8Ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712293808; x=1712898608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlMY98BD79lBdspG+ouG7M9punegC0XfPjsulWCNnW4=;
        b=LpoWXts/Y3ilx/XViC/4aOy8u9s+R5bOB3bKm7P9PD2gNKC5q0kq54em/5vjzgXULC
         cX21Hdkm4y4OiH642KciH6xS9/vnuZ3mEVX5TiTRZ9l8l6F6/Ad7WTngEictIAbKzpTL
         xBveiyXdNxnPOPwWXbN0hH+67F5iLBIAXb5WbEf40/Bf3zN/9WIOZYIjx6VcA9a2bGr6
         eZLl7rAaET7u1QO72sHM9HKFmBoORWgQCMTAL32kxGJ73sCwdQXuWoDx+v7mgHN73VDL
         OMuhGq70fymYQupJ1/u7In3HqNKFEaD8yeLLn5ml5xVg+AMDfuve3p8c/Ps87IfvkiV6
         CFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO44wc/DkC2E1eIJnspzAE/22dlKWEjvuKQ9Mo/TTz81gXQRi74aqd98X83xKXFKDP7c502Cc4p1c7G6QERwoaLutdWj1TAtKQkSSUVw==
X-Gm-Message-State: AOJu0YzTYjkwuEEUJ2FKyiSc+OebVE3g+vLd5rO+GzaJC0BYDIAKzebP
	4txE1NZ5kGpoXYhXt0IZLukvA6OAZOsN+mhanHCFBbiXVJ/bhqRQOmZStZnLKUJYiIrfEPAedbW
	ahxF9U56pjX4qBySj2vcPeC7a794=
X-Google-Smtp-Source: AGHT+IFNALLC+cLIfNSKBkrLOWuswiELcg0iglPLHWgzh4Faj3pLvLFzDEWHz9/0AFOMJnrf3rlzgjtzvgyHYx2EFkg=
X-Received: by 2002:a17:906:cce6:b0:a4d:ffcb:1f4e with SMTP id
 ot38-20020a170906cce600b00a4dffcb1f4emr161016ejb.75.1712293807779; Thu, 04
 Apr 2024 22:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com> <87y19s7bk6.fsf@mail.lhotse>
In-Reply-To: <87y19s7bk6.fsf@mail.lhotse>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Apr 2024 08:09:31 +0300
Message-ID: <CAHp75VdM8HgvBJrN_GRXH8XGGdv3Npxg6GR13AW-70jpuU=QOw@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 5, 2024 at 6:06=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Thu, Apr 4, 2024 at 2:57=E2=80=AFAM Finn Thain <fthain@linux-m68k.or=
g> wrote:
> >> On Thu, 4 Apr 2024, Andy Shevchenko wrote:
> >
> >> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> >> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> >> > > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> >> > > Cc: linux-m68k@lists.linux-m68k.org
> >> >
> >> > Second, please move these Cc to be after the '---' line
> >>
> >> I thought they were placed above the line for audit (and signing)
> >> purposes.
> >
> > I didn't get this, sorry.
> >
> >> There are thousands of Cc lines in the mainline commit messages
> >> since v6.8.
> >
> > Having thousands of mistaken cases does not prove it's a good thing to
> > follow. I answered Jiri why it's better the way I suggested.
> >
> >> > > Link: https://github.com/vivier/qemu-m68k/issues/44
> >> > > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
> >> >
> >> > Missed Fixes tag?
> >>
> >> Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >> I have to ask because some reviewers do not like to see a Fixes tag ci=
te
> >> that commit.
> >
> > Yes, or you even may dig into the history.git from history group (see
> > git.kernel.org) for the real first patch that brought it.
> >
> >> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> >> > > ---
> >> > (here is a good location for Cc:)
> >>
> >> Documentation/process/submitting-patches.rst indicats that it should b=
e
> >> above the "---" separator together with Acked-by etc. Has this convent=
ion
> >> changed recently?
>
> The docs don't really say where to put the Cc: tags, although they are
> mentioned along with other tags which clearly are intended to go above
> the separator.

He-h... Documentation needs constant updates too, for one reason or another=
.
This is normal process and in particular Cc (rather long) lists needs to be
reconsidered.

> > I see, I will prepare a patch to discuss this aspect.
>
> FYI there was a discussion about this several years ago, where at least
> some maintainers agreed that Cc: tags don't add much value and are
> better placed below the --- separator.

Thanks, I'll definitely read this.
But I'm 100% sure the environment aspect and mobile device screen
sizes were not discussed there.

> Thread starts here: https://lore.kernel.org/all/87y31eov1l.fsf@concordia.=
ellerman.id.au/


--=20
With Best Regards,
Andy Shevchenko
