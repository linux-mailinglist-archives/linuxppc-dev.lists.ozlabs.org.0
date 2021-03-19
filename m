Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 865993428E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 23:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2Jx04G0Tz3byS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 09:49:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PoDC/F7a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=drinkcat@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=PoDC/F7a; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2JwX6zyNz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 09:48:57 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id l4so4334381vsc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 15:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0Ja0Bm0pbGPbVCQFMQ5kja3rpS5JFuQnqh3OEFTkD4Q=;
 b=PoDC/F7a+9JZAGRETtRCTuh/CByXpenl8koD2/6Hh5xX7JZwYLzkYFLgq5yj4vnUUe
 Wj40+WfDascmSBDQLbtwgrrHUgKOS2DLakB95E0WOZRlG7PoOqcGWoIt00uy7pLQB8C+
 jqKXsgXWkQYjCoc8G54zX5rvXpYIPZ5us1Fk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Ja0Bm0pbGPbVCQFMQ5kja3rpS5JFuQnqh3OEFTkD4Q=;
 b=r7GCMnErueR3gMCCnd5xMGrRywO6GkGc4sQw67qy8x/S7UYiAHh/5N5l5eLelcxM1a
 dUPjTUZ9d133kWZAZSOnB/W7BDUrVQfFo8LzhOdUPNufqg+IpHPtIOd0zwJyjd9ogegF
 nr89c5N/LXKB7qz5trgRFAgYZger3L2UenuHqVEVxgwHJbHIjFx7ZgX8CvCTM/1damuS
 /K5zWy6QdM4mOEhlzKVVvK7Quhl9tXgjt4j5ukcfmkkVoH0D787VHRCQ9ZesyS1pH60f
 XcbTDgroiO6wkiL7CisHJJHUe68mR6p9sVW1LSK1IWNC1A7FVUGNH9qfukxs4VAkPBHJ
 wXZA==
X-Gm-Message-State: AOAM531SsFjWAB7eYrmHhWOeLtjBmQ1g7DDha2kSe+RiBiwsBjkRRpCX
 g0nB0oLkv9BjGR2iZhGGGAFMlh2owPtbxRba6avW3w==
X-Google-Smtp-Source: ABdhPJwrdL2VXaXsq6x7epbNTCHh5OO4DtFmNZjruWS6qG820mnUPtqOUwuccQbJt2TUaJCT/6tgUVX0Of+NZpT68HY=
X-Received: by 2002:a05:6102:3a06:: with SMTP id
 b6mr4437876vsu.21.1616194132651; 
 Fri, 19 Mar 2021 15:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210318235416.794798-1-drinkcat@chromium.org>
 <20210319075410.for-stable-4.19.1.I222f801866f71be9f7d85e5b10665cd4506d78ec@changeid>
 <YFR/fQIePjDQcO5W@kroah.com> <b5d3d0ed-953e-083d-15f6-4a1e3ed95428@oracle.com>
 <YFSRRux3FHJVgWXt@kroah.com>
In-Reply-To: <YFSRRux3FHJVgWXt@kroah.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 20 Mar 2021 06:48:41 +0800
Message-ID: <CANMq1KDsqsF2AOeY033rUj_Sit57a7O77kZ9Ob=56veGLK_H+Q@mail.gmail.com>
Subject: Re: [for-stable-4.19 PATCH 1/2] vmlinux.lds.h: Create section for
 protection against instrumentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arch@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>,
 Alexandre Chartre <alexandre.chartre@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Christopher Li <sparse@chrisli.org>,
 lkml <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-sparse@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 7:55 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 19, 2021 at 12:20:22PM +0100, Alexandre Chartre wrote:
> >
> > On 3/19/21 11:39 AM, Greg Kroah-Hartman wrote:
> > > On Fri, Mar 19, 2021 at 07:54:15AM +0800, Nicolas Boichat wrote:
> > > > From: Thomas Gleixner <tglx@linutronix.de>
> > > >
> > > > commit 6553896666433e7efec589838b400a2a652b3ffa upstream.
> > > >
> > > > Some code pathes, especially the low level entry code, must be prot=
ected
> > > > against instrumentation for various reasons:
> > > >
> > > >   - Low level entry code can be a fragile beast, especially on x86.
> > > >
> > > >   - With NO_HZ_FULL RCU state needs to be established before using =
it.
> > > >
> > > > Having a dedicated section for such code allows to validate with to=
oling
> > > > that no unsafe functions are invoked.
> > > >
> > > > Add the .noinstr.text section and the noinstr attribute to mark
> > > > functions. noinstr implies notrace. Kprobes will gain a section che=
ck
> > > > later.
> > > >
> > > > Provide also a set of markers: instrumentation_begin()/end()
> > > >
> > > > These are used to mark code inside a noinstr function which calls
> > > > into regular instrumentable text section as safe.
> > > >
> > > > The instrumentation markers are only active when CONFIG_DEBUG_ENTRY=
 is
> > > > enabled as the end marker emits a NOP to prevent the compiler from =
merging
> > > > the annotation points. This means the objtool verification requires=
 a
> > > > kernel compiled with this option.
> > > >
> > > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > > > Reviewed-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> > > > Acked-by: Peter Zijlstra <peterz@infradead.org>
> > > > Link: https://lkml.kernel.org/r/20200505134100.075416272@linutronix=
.de
> > > >
> > > > [Nicolas: context conflicts in:
> > > >   arch/powerpc/kernel/vmlinux.lds.S
> > > >   include/asm-generic/vmlinux.lds.h
> > > >   include/linux/compiler.h
> > > >   include/linux/compiler_types.h]
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > Did you build this on x86?
> > >
> > > I get the following build error:
> > >
> > > ld:./arch/x86/kernel/vmlinux.lds:20: syntax error
> > >
> > > And that line looks like:
> > >
> > >   . =3D ALIGN(8); *(.text.hot .text.hot.*) *(.text .text.fixup) *(.te=
xt.unlikely .text.unlikely.*) *(.text.unknown .text.unknown.*) . =3D ALIGN(=
8); __noinstr_text_start =3D .; *(.__attribute__((noinline)) __attribute__(=
(no_instrument_function)) __attribute((__section__(".noinstr.text"))).text)=
 __noinstr_text_end =3D .; *(.text..refcount) *(.ref.text) *(.meminit.text*=
) *(.memexit.text*)
> > >
> >
> > In the NOINSTR_TEXT macro, noinstr is expanded with the value of the no=
instr
> > macro from linux/compiler_types.h while it shouldn't.
> >
> > The problem is possibly that the noinstr macro is defined for assembly.=
 Make
> > sure that the macro is not defined for assembly e.g.:
> >
> > #ifndef __ASSEMBLY__
> >
> > /* Section for code which can't be instrumented at all */
> > #define noinstr                                                        =
       \
> >       noinline notrace __attribute((__section__(".noinstr.text")))
> >
> > #endif
>
> This implies that the backport is incorrect, so I'll wait for an updated
> version...

Yep, sorry about that. I did test on ARM64 only and these patches
happily went through our Chrome OS CQ (we don't have gcc coverage
though).

Guenter has a fixup here with explanation:
https://crrev.com/c/2776332, I'll look carefully and resubmit.

Thanks,

> thanks,
>
> greg k-h
