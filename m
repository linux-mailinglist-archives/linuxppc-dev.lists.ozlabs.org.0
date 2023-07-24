Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62EF75F5AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 14:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8f7x2YvWz3bTb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 22:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.179; helo=mail-oi1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8f7S0DZKz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 22:08:03 +1000 (AEST)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a412653335so2549354b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 05:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690200479; x=1690805279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nNGOJzgymf6gQYpdxd2UIkw90HSJ+oAIVzOwuAShWk=;
        b=Uc9UL+s4rkz4xnkvNh6TRYxhbvm0b3lH6KcfGdn5oTMT3+57AsxsyUsmqFT6GTtqrS
         AxzK+ezIxliz3LjAo3TR7ud7igixl7fyeIyVJT260vtZMuWRshujPZUeQ8d1tQ7nK43+
         3Zf+/VsHuhTIW6er58na3M0O4JQYnQQj707noTbxZxKKWENGQy5ON3JPg0RxZZK3pQer
         SVvxi3LkFsH66Wyi2zzOf5+cjxFLGtxvok6qZZLo/qPwDbDSUisyG4rhEITPTxrIIWDH
         c+QMouJyv2Rxe8m2w3mrueJBO139MnyZedImkc3yjUif0CqwEeGtNX68VRxgf4kUE4zP
         SQmw==
X-Gm-Message-State: ABy/qLaZlolsi9G/3HxRJAh4nOcbTP0GAfS7VlvAFmf0mh++QlhuEWFa
	UqgrFIYM2OfevFdcEoYHGMT4XPfoNRboeg==
X-Google-Smtp-Source: APBJJlEmgZbLG5IaugsFEGpqAs4yisXCj/hbYmhR8QIN8MmDbHf+3M7Q4PNwbQH0eNELiR3tHdhzaA==
X-Received: by 2002:a05:6808:99:b0:39e:c615:949f with SMTP id s25-20020a056808009900b0039ec615949fmr10184238oic.24.1690200478721;
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id c7-20020a544e87000000b003a5a976791fsm1964200oiy.45.2023.07.24.05.07.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a3fbfb616dso2543279b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
X-Received: by 2002:a25:238e:0:b0:d05:abaf:9933 with SMTP id
 j136-20020a25238e000000b00d05abaf9933mr7019302ybj.36.1690200457350; Mon, 24
 Jul 2023 05:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230719123944.3438363-1-arnd@kernel.org> <20230719123944.3438363-2-arnd@kernel.org>
 <87pm4lj1w3.fsf@mail.lhotse> <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
In-Reply-To: <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jul 2023 14:07:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>, linux-efi@vger.kernel.org, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, Dave Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Thomas 
 Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Arnd Bergmann <arnd@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Fri, Jul 21, 2023 at 10:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Fri, Jul 21, 2023, at 06:59, Michael Ellerman wrote:
> > Arnd Bergmann <arnd@kernel.org> writes:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> The list of dependencies here is phrased as an opt-out, but this is mi=
ssing
> >> a lot of architectures that don't actually support VGA consoles, and s=
ome
> >> of the entries are stale:
> >>
> >>  - powerpc used to support VGA consoles in the old arch/ppc codebase, =
but
> >>    the merged arch/powerpc never did
> >
> > Not disputing this, but how did you come to that conclusion? I grepped
> > around and couldn't convince myself whether it can work on powerpc or
> > not. ie. currently it's possible to enable CONFIG_VGA_CONSOLE and
> > powerpc does have a struct screen_info defined which seems like it woul=
d
> > allow vgacon_startup() to complete.
>
> The VGA console needs both screen_info and vga_con to work. In arch/ppc
> we had both, but in arch/powerpc we only retained the screen_info:
>
> $ git grep vga_con v2.6.26 -- arch/ppc arch/ppc64 arch/powerpc
> v2.6.26:arch/ppc/platforms/pplus.c:     conswitchp =3D &vga_con;
> v2.6.26:arch/ppc/platforms/prep_setup.c:        conswitchp =3D &vga_con;
>
> so after arch/ppc was removed, this became impossible to use on both
> pplus and prep. These two platforms were also (as far as I can tell)
> the only ones to support vga16fb as an alternative to vgacon, but
> both platforms were removed later on.

I did use vgacon and vga16fb on CHRP on a second video card
(initialized using Gabriel Paubert's x86 BIOS emulator), but that was
definitely before the advent of arch/powerpc/.

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
