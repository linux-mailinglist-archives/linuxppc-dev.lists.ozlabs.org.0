Return-Path: <linuxppc-dev+bounces-5714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF2A22FC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 15:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkLs35G9Dz30TS;
	Fri, 31 Jan 2025 01:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738247111;
	cv=none; b=U1F1sLbstyWsW23VdQXBjNZKUEj7KyU0H5O+X+rTNTZtP7udCEg7I+lGm8FiEs/t1yXjc0qyBgcJAztei+FzVboy0kKoJy8zDj8QdF5ecX3OYl+xBQzRw0DwJJvc+uJhFqonpCp14vcr7wFD0sUvmnuEEjr0qjOr+6yMQoWkm5JYmvnR5IANXgqhZelfVSUmKsUfot3vdMy6BiuQi3Yj2r/slMetz4OqJ5iBBgcrJSaeGuX7ueYj5UzESc68GvoHjUy2iaunMlT8VIvQO3O6g9KTSXTLdxTUQ5mACWLF/Q5oEPyfjqfDWKLjqJn8mE86NC/72xle04oxPlbarD3RdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738247111; c=relaxed/relaxed;
	bh=3OqrPZhmeATdEa/SarwcrPzfDvhKK4nRH2GJQ3Y2/Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJYgmMMORaU5dWvr8YXulVikA7AaHQ9R9r4RTAKo1piK7DsCVIXlpHzJNs/7bTtfCJyelpnwZcK9YPB4bgl0ANbNZnhYXrgexafEwBlBwISxP8c9fBMPdfLeCKqxMxDMriYfOPNX94OOz+vfw5hwyZGHS+VVE1lUSPQSdBdvg0usJe65RXMsNNf/9DQuMhV/xnBdDg2ZKooMmvY0riMjWNCQLHPsyHMwk/TDuNyazXBnWFwNHxnDLzfgkP56FDRW66KoB6dUNyBY9VaGkx6mAei6ThfgnzAOJEcRWBpQZfTQFgif4dqsfGC3a6AHNiXTKLFRhAUifBnqp3LtION2Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkLs15QRXz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 01:25:09 +1100 (AEDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab6ed8a3f6aso74495166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 06:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247101; x=1738851901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OqrPZhmeATdEa/SarwcrPzfDvhKK4nRH2GJQ3Y2/Ao=;
        b=Kdebu5bCaHa8v+I37KyQ9eWW+fTLaRcpUUF6HpftsxfPrzmOD9kZ7rt4Qh35XHfVOU
         7oLck/WCiE+uQv10Lj+rKYqmH400omZOLaZtQc0M5PKdlV9sSybqfjtazCjJqqQuawKO
         iZfEI+x4mwGdd035dfxV+bQnaxn16j7YJhmCROfIsTTjxNwff9H7FXjdPD/4LJA25Lmw
         GFW7c7Po5T8snPQTk0AqNIYys2+TquzI7Ns50iY6lK1AyfVcqvtCeCyngay+F5zgp19j
         iRs61GQH2jCG2mbEaEaGNU4hBTNgyEhp8OIsCMi88oBqSzu1kqwv+u94AC5b0lXGorUc
         NetA==
X-Forwarded-Encrypted: i=1; AJvYcCVTkgSJ2BsJNkkUhraqfgRtBp4mfXPX70DAv3IEOa5FewTx+HJNrYkyVFcUS/Q7CVrOjggWKexTDV8boh0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCdk0sQWNDkpn+E8eY0p8QZUPoonZOcmoJUR39ApGUyZvlWceW
	yj0OCn1pR/Cqo3Cb0wwfVKtkLEWvD87Q2W7aGWgyjgF2f+OZ/8rr/jWLUPPjIxA=
X-Gm-Gg: ASbGncst2wbdbHrjFS3QmJxhripsxvv8UHed3wMEH2+zhyxOyy5MWF39kDvKcq3jxtl
	18O2Vr96yQY3i5pndWfwLAKXZaUbGMKS28dSQSTfaMqp2I2FxREwHvEuIGC6dyBHZsE28Ugu0dA
	Vbio4v1/T6/TiJgiTcSvfIXzcCwOX6SDw8xxYudra1pAgL74zWnAfv4lU/XFR2sMIEVVbcUGizb
	Upk9P7xXokjb2DYjzsSUsLJMlkSf8HPPz9VVCFu6suyGzM3qNQhwY+GI9/PBvFeu/5WSMubzqp8
	20gdoZW8S67+CxvTYtOrY1UL/aUwd5sdE7G0fjN2ojM/iZxsLGszSA==
X-Google-Smtp-Source: AGHT+IE4oAfj8JxFq63YIiP8dQ6j9x+3Cx2z587/ZWLU6zPXqOUpw2CPovDVNnBFM3BeCc/Sb2grkg==
X-Received: by 2002:a17:907:6ea8:b0:ab6:c52c:a1cb with SMTP id a640c23a62f3a-ab6cfe12f1emr841093966b.51.1738247100745;
        Thu, 30 Jan 2025 06:25:00 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm128016066b.74.2025.01.30.06.24.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:24:59 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso1558486a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 06:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe6Mticw2zCy7FiXnrL9afA0T/Kpje0ikWd3CjI/1PLU72ccDigTRNkoaUb2yAbMhzk/ucFoquezvZF4g=@lists.ozlabs.org
X-Received: by 2002:a05:6402:40c9:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5dc5efc5baamr7107488a12.15.1738247099100; Thu, 30 Jan 2025
 06:24:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
In-Reply-To: <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:24:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
X-Gm-Features: AWEUYZmmaZQOtaNUMvBrswZCS49ixh1s35CzIVK-s4dUf7w23LLrATAr9KprGzw
Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Liam,

On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 08:26]:
> > On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > > > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.=
com> wrote:
> > > > > I've never used the kunit testing of xarray and have used the use=
rspace
> > > > > testing instead, so I can't speak to the obscure invocation as bo=
th
> > > > > commands seem insanely long and obscure to me.
> > > >
> > > > The long and obscure command line is a red herring: a simple
> > > > "modprobe test_xarray" is all it takes...
> > >
> > > That command worked before too...
> >
> > Exactly, great!
> >
> > > > > You should look at the userspace testing (that this broke) as it =
has
> > > > > been really useful in certain scenarios.
> > > >
> > > > BTW, how do I even build tools/testing/radix-tree?
> > > > "make tools/help" doesn't show the radix-tree test.
> > > > "make tools/all" doesn't seem to try to build it.
> > > > Same for "make kselftest-all".
> > >
> > > make
> >
> > Where?
> > > > BTW, how do I even build tools/testing/radix-tree?
>                                 ^^^^^^^^^^^^^^^^^^^^^^^

Things like "make -C drivers/net/ethernet/" stopped working
ca. 20y ago.

> > > Or look at the make file and stop guessing.  Considering how difficul=
t
> >
> > There is no Makefile referencing tools/testing/radix-tree or the
> > radix-tree subdir. That's why I asked...
> >
> > Oh, I am supposed to run make in tools/testing/radix-tree/?
> > What a surprise!
> >
> > Which is a pain when building in a separate output directory, as you
> > cannot just do "make -C tools/testing/radix-tree" there, but have to
> > type the full "make -C tools/testing/radix-tree O=3D..." (and optionall=
y
> > ARCH=3D... and CROSS_COMPILE=3D...; oh wait, these are ignored :-( in t=
he
> > source directory instead...
>
> I'll await your patch to link all this together.  Please Cc the authors.

I gave it a try for kselftests a few years ago.
https://lore.kernel.org/all/20190114135144.26096-1-geert+renesas@glider.be
Unfortunately only one patch was applied...

> > > it is to get m68k to build, you should probably know how to read a
> > > makefile.
> >
> > Like all other kernel cross-compilation? Usually you don't even have
> > to know where your cross-compiler is living:
> >
> >     make ARCH=3Dm68k
>
> Ignoring that I had to make a config - which asked challenging
> questions...

make ARCH=3Dm68k defconfig

> And ignoring the steps to get m68k compiler...

apt install gcc-m68k-linux-gnu?

> > > > When trying the above, and ignoring failures due to missing package=
s
> > > > on my host:
> > > >   - there are several weird build errors,
> > > >   - this doesn't play well with O=3D,
> > > >   - lots of scary warnings when building for 32-bit,
> > > >   - ...
> > > >
>
> In file included from ./include/linux/sched.h:12,
>                  from arch/m68k/kernel/asm-offsets.c:15:
> ./arch/m68k/include/asm/current.h:7:30: error: invalid register name for =
=E2=80=98current=E2=80=99
>     7 | register struct task_struct *current __asm__("%a2");

Which compiler are you using?

> > > > At least the kunit tests build (and run[1] ;-) most of the time...
> > >
> > > Do they?  How about you break something in xarray and then try to boo=
t
> > > the kunit, or try to boot to load that module.
> >
> > If you break the kernel beyond the point of booting, you can indeed
> > not run any test modules...
>
> Which is extremely easy when you are changing code that runs so early in
> the boot.
>
> My code found a compiler issue because it's the first function that
> returns a boolean.  This is stupid.

Sorry. I don't understand this comment.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

