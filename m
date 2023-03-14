Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45336B94D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 13:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbYJC51ljz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 23:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.181; helo=mail-il1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbYHd3MSLz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 23:49:00 +1100 (AEDT)
Received: by mail-il1-f181.google.com with SMTP id y12so4355282ilq.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 05:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBpmO88aubLNx5ds9k4LYpaw6LJjHZV6232nWb27C40=;
        b=8Fxs8ZR+xFg7ECbY5LRA5CRIT5UWiLszp65cINWlZx0lbBtAYn7aQfHltCJHG+O+TA
         Kxjf2HaRzFvNgz1bLEuCMKFxBMzdvrHlGFWEh49sV5DFkfk60ROBR/QzBH/Jf0087VWU
         gvA/EBWXeX3oSyHNA/oAmSUQxJZACNZTFL/a1S0E5FXpwFEJRiTuq+r9uMmZLD7TDvo4
         oJ1mE4BEXiF3mMnIHhNWQFc787gqAID2qo73RscV0Mrw7YivKimPk7xKRENmC963Ez9Q
         U6N6TblKxL5b1tGVbamXqghZJRV+id739HoMOCdU1VKfu5DJNnKdvWTdpLKUHdCeNnou
         iRRw==
X-Gm-Message-State: AO0yUKWBf6AaomRlKUwDMui6TTINY5b1FxjnItNFS4nLyCb3yO01QAnp
	bP0SBhbUoUsVA4NqIaqygCe9u4bT7bUAOA==
X-Google-Smtp-Source: AK7set/HCCLwzeDhWh5Z8OPFYZ8HxJwV6vNnukIkDaDyKlu3pNT8nJreVBhGNRngsmoxsya9xJ3GZw==
X-Received: by 2002:a05:6e02:1ca8:b0:322:fe79:8141 with SMTP id x8-20020a056e021ca800b00322fe798141mr2895125ill.1.1678798137347;
        Tue, 14 Mar 2023 05:48:57 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id r7-20020a92c5a7000000b0030314a7f039sm788257ilt.10.2023.03.14.05.48.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 05:48:56 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id bf15so6337232iob.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 05:48:55 -0700 (PDT)
X-Received: by 2002:a05:6902:1002:b0:b48:1359:4e28 with SMTP id
 w2-20020a056902100200b00b4813594e28mr461087ybt.12.1678798114483; Tue, 14 Mar
 2023 05:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230314121216.413434-1-schnelle@linux.ibm.com> <20230314121216.413434-2-schnelle@linux.ibm.com>
In-Reply-To: <20230314121216.413434-2-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Mar 2023 13:48:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9ZoB5XNiiVEG-zBzB9eN5RJSC42WMDD-RZfcg=2tr4g@mail.gmail.com>
Message-ID: <CAMuHMdV9ZoB5XNiiVEG-zBzB9eN5RJSC42WMDD-RZfcg=2tr4g@mail.gmail.com>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
To: Niklas Schnelle <schnelle@linux.ibm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.
 de>, linux-um@lists.infradead.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 1:13=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
> Port access. In a future patch HAS_IOPORT=3Dn will disable compilation of
> the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces such as s390. Also
> add dependencies on HAS_IOPORT for the ISA and HAVE_EISA config options
> as these busses always go along with HAS_IOPORT.
>
> The "depends on" relations on HAS_IOPORT in drivers as well as ifdefs
> for HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

>  arch/m68k/Kconfig       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
