Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3C454293
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 09:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvGFN6mYkz2ymg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 19:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.43; helo=mail-ua1-f43.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvGDv07Ldz2xsT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 19:24:29 +1100 (AEDT)
Received: by mail-ua1-f43.google.com with SMTP id ay21so4051151uab.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 00:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pLki4VXVNEgH7BpAr7thCy6liKqtc8dZxgXibG/LDtU=;
 b=W6/BKPCqlZhgQwXrqS415/ucyam7ufPsis/IMEXxGKOc5yvctXXNllCn3eYCKWtQHz
 PUUyjQdc5kHFLx2amPyuI6N2lvsyBiTeNM04dCDKJ3YZoNUvckHRqBAmqK0KFZAphh8p
 RPhox+Tp+UteP0XjttsG4nfPva6XiXLIZv3HVSp16IrxK3JUNfC5BWSLG8Vx50hvrylD
 2GRH1Gei5E2Ke9niRAIZzV7CtIzmpMEy6r7yisXqN4CyAyOUhDcY3MgFfjwdYMig+k3f
 v9/2zaAA24epH92lTdE7M0FerXPedoQsoSs2fUWEeJdg0m2d76/etQasSQpq1w3zvzxq
 W2kw==
X-Gm-Message-State: AOAM5327TtTegjvgmpf38rHuulGxGmVWHI0P8L45AGgFVHezPhvKEkVV
 oewxEZ+93XhidzVU8+h5H6xumzVAxb9ELg==
X-Google-Smtp-Source: ABdhPJziSL3C0ukPDmPzknG/856doUx050BqK7nO/fNpa5/cU3DnHC/FgsVCdeNwJnVpfOgjrph6Nw==
X-Received: by 2002:a67:e18e:: with SMTP id e14mr64662266vsl.49.1637137465793; 
 Wed, 17 Nov 2021 00:24:25 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id u145sm12951503vsu.25.2021.11.17.00.24.24
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:24:25 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id y5so4105538ual.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 00:24:24 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr20823663uaq.114.1637137464301; 
 Wed, 17 Nov 2021 00:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
 <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
In-Reply-To: <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Nov 2021 09:24:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgGz5FSidaGpp8YRRSnJfwdP4-wOkXdVx+mydXnMAXHQ@mail.gmail.com>
Message-ID: <CAMuHMdWgGz5FSidaGpp8YRRSnJfwdP4-wOkXdVx+mydXnMAXHQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
To: Nick Terrell <terrelln@fb.com>
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
Cc: Hector Martin <marcan@marcan.st>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

On Wed, Nov 17, 2021 at 3:20 AM Nick Terrell <terrelln@fb.com> wrote:
> > On Nov 16, 2021, at 6:05 PM, Randy Dunlap <rdunlap@infradead.org> wrote=
:
> > On 11/16/21 5:59 PM, Nick Terrell wrote:
> >> I=E2=80=99ll send the PR to Linus tomorrow. I=E2=80=99ve been informed=
 that it
> >> isn't strictly necessary to send the patches to the mailing list
> >> for bug fixes, but its already done, so I=E2=80=99ll wait and see if t=
here
> >> is any feedback.
> >
> > IMO several (or many more) people would disagree with that.
> >
> > "strictly?"  OK, it's probably possible that almost any patch
> > could be merged without being on a mailing list, but it's not
> > desirable (except in the case of "security" patches).
>
> Good to know! Thanks for the advice, I wasn=E2=80=99t really sure what
> the best practice is for sending patches to your own tree, as I
> didn't see anything about it in the maintainer guide.

All patches must be sent to public mailing lists for review.
You might get away with not doing that for a simple and trivial fix,
but be prepared to end up on people's "special" lists if you did get
it wrong.

We are Legion. We do not forgive. We do not forget ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
