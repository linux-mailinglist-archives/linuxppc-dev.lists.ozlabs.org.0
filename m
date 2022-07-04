Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F9565452
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 14:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc4M20lfzz3c68
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 22:07:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.134; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc4Lb6m1fz2yMf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 22:07:35 +1000 (AEST)
Received: from mail-yw1-f177.google.com ([209.85.128.177]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNOZO-1nwh6R3gaI-00OpKg for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul
 2022 14:07:30 +0200
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2ef5380669cso79878717b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 05:07:29 -0700 (PDT)
X-Gm-Message-State: AJIora+QeycJS9RHuz5mUf/DMgxn/cRN89LY5FHEfq6aOBGcxi5Nvm3J
	ky6s3ncFt8eDksJPozik8/tyzdKvIHkE8cVmtmw=
X-Google-Smtp-Source: AGRyM1tdip7O5ofNFtvSvIu6DpF5+51ggPWr2utiIY8JDMYNuJUtdzNgCMU5JR7wALsNdPUnX72AuB/jxqr8IHgp8Eo=
X-Received: by 2002:a81:230c:0:b0:31b:f368:d0b0 with SMTP id
 j12-20020a81230c000000b0031bf368d0b0mr32806770ywj.249.1656936448287; Mon, 04
 Jul 2022 05:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali>
In-Reply-To: <20220704103951.nm4m4kpgnus3ucqo@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 14:07:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
Message-ID: <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x4pUAonFJtj9Mns8QOIEgt+jG8ej1qsZX4UBt19tTnXfqv9S0WE
 PFg+ok6ziNKBwCytmxFCGdPWsMBLid3RGX0/kPoTjnc/t1qOlQQhiZPvR//8msCtuFrm58G
 6jDr10qpa9QyRmNe5nBBe26MPM4RNkiccTmnOMEEVqH5qWJtB1khu9nLwuk0Ux9/PynQ0lk
 rOLbMYlkGk+D5ZemqipDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9laxNryTRC0=:qHhQvwjPVOBMDR7+cmRlED
 HqEY5vDIcLQNkVMQcdfP9PFRcfLwO+CMku/efXHNRK8KjldFSBTmNIkFDmaKj4/zOmCDGo8Wo
 RysRqgcQNW7mvxmmsCOKsuJLftUT/Yd1QzCHTVJpqDcv7hq1/4FFmeoxCNposMXQf6/ACSaiu
 Ar4ue/S62CNuzfjeiJB2lH6WKMnKpSpD+H6MxMEEKTbwsyZxkz2XjN0wPDG+J/13yyyZD1vYd
 R+Df6NLcQxnJct9XFo4XWEVXYTidQehXTQ59t77J1D2deyoV112+dY2fMvQfQwYuO24035fYg
 q2CInyo4oSdvmg4A9aaYoYsxty5wQRf3iDmueCp0vFbQ+pe4rB8+c9lD0kx9dLjo7CjiBIajo
 Arn0LiyAKikMTq+PVUP93hoP4Z4k9toUQX50rHd59QSWDg17tj/tzfSU678w312cc11h5tdEI
 ZkItOMMcvKEYvEzuVdp/1lnKuM+tZ7r6Z1BCleK8DO4rWPDDmNcQsQeUqV5juXe5BuXPdoG7+
 F5YqQ+g7z/gmPpydG56uJ5f+l8y6yo6M4hkZXtAuTFI158G1A4Fbp0pQj77LQYY7Vz4rDFuF1
 BhujhckllzuEVXnLHh5bglzSW1qBOL6KhZ6Fm6jSOlNhF4krftOVR6QJdCKK+FtY+7+4xkqor
 a/LxNcgB8s6RT6EYBiqdIvNsO+egFZFQtDawx3sT5Dfdm3goFVO34NROZLAlaMDHjpZQWXnm9
 lZjfQHOMVNRMmf3iqOJtfIe0wxLa7Tix5mcD6g==
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 12:39 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Monday 04 July 2022 20:23:29 Michael Ellerman wrote:
> > On 2 July 2022 7:44:05 pm AEST, "Pali Roh=C3=A1r" <pali@kernel.org> wro=
te:
> > >On Tuesday 24 May 2022 11:39:39 Pali Roh=C3=A1r wrote:
> > >> gcc e500 compiler does not support -mcpu=3Dpowerpc option. When it i=
s
> > >> specified then gcc throws compile error:
> > >>
> > >>   gcc: error: unrecognized argument in option =E2=80=98-mcpu=3Dpower=
pc=E2=80=99
> > >>   gcc: note: valid arguments to =E2=80=98-mcpu=3D=E2=80=99 are: 8540=
 8548 native
> > >>
> > >> So do not set -mcpu=3Dpowerpc option when CONFIG_E500 is set. Correc=
t option
> > >> -mcpu=3D8540 for CONFIG_E500 is set few lines below in that Makefile=
.
> > >>
> > >> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> > >> Cc: stable@vger.kernel.org
> > >
> > >Michael, do you have any objections about this patch?
> >
> > I don't particularly like it :)
> >
> > From the discussion with Segher, it sounds like this is a problem with =
a specific build of gcc that you're using, not a general problem with gcc b=
uilt with e500 support.
>
> Well, the "full" build of gcc for e500 cores with SPE does not support
> -mcpu=3Dpowerpc option. So I think this is a general problem. I do not
> think that this is "specific build" as this is the correct build of gcc
> for these processors with e500 cores.
>
> "stripped". build of gcc without SPE support for e500 cores does not
> have this problem...

I can see a couple of problems with the CPU selection, but I don't think
this is a major one, as nobody should be using those SPE compilers for
building the kernel. Just use a modern powerpc-gcc build.

> > Keying it off CONFIG_E500 means it will fix your problem, but not anyon=
e else who has a different non-e500 compiler that also doesn't support -mcp=
u=3Dpowerpc (for whatever reason).
> >
> > So I wonder if a better fix is to use cc-option when setting -mcpu=3Dpo=
werpc.
> >
>
> Comment for that code which adds -mpcu=3Dpowerpc says:
>
>   they are needed to set a sane 32-bit cpu target for the 64-bit cross
>   compiler which may default to the wrong ISA.
>
> So I'm not sure how to handle this in other way. GCC uses -mpcu=3D8540
> option for specifying to compile code for e500 cores and seems that
> -mcpu=3D8540 is supported by all e500 compilers...
>
> Few lines below is code
>
>   CFLAGS-$(CONFIG_E500) +=3D $(call cc-option,-mcpu=3D8540 -msoft-float,-=
mcpu=3Dpowerpc)
>
> which for e500 kernel builds user either -mcpu=3D8540 or -mcpu=3Dpowerpc
> (probably as a fallback if -mcpu=3D8540 is not supported).

The -mcpu=3Dpowerpc fallback can probably be skipped here, that must have b=
een
for compilers predating the addition of -mcpu=3D8540, and even the oldest o=
nes
support that now.

> So for me it looks like that problematic code
>
>   KBUILD_CFLAGS         +=3D -mcpu=3Dpowerpc
>   KBUILD_AFLAGS         +=3D -mcpu=3Dpowerpc
>
> needs to be somehow skipped when compiling for CONFIG_E500.
>> My change which skips that code base on ifndef CONFIG_E500 should be
> fine as when CONFIG_E500 is disabled it does nothing and when it is
> enabled then code
>
>   CFLAGS-$(CONFIG_E500) +=3D $(call cc-option,-mcpu=3D8540 -msoft-float,-=
mcpu=3Dpowerpc)
>
> is called which sets -mcpu option suitable for e500.

I think this part is indeed fishy, but adding another special case for E500
seems to take it in the wrong direction.

Nick added this in 4bf4f42a2feb ("powerpc/kbuild: Set default generic
machine type
for 32-bit compile") as a compile-time fix to prevent the default target fr=
om
getting used when the compiler supports both 64-bit and 32-bit. This is the
right idea, but it's inconsistent to pass different flags depending on the =
type
of toolchain, and it loses the more specific options.

Another problem I see is that a kernel that is built for both E500 and E500=
MC
uses -mcpu=3De500mc and may not actually work on the older ones either
(even with your patch).

I think what you actually want is to set one option for each of the
possible CPU types:

CFLAGS_CPU-$(CONFIG_PPC_BOOK3S_32) :=3D -mcpu=3Dpowerpc
CFLAGS_CPU-$(CONFIG_PPC_85xx) :=3D -mcpu=3D8540
CFLAGS_CPU-$(CONFIG_PPC8xx) :=3D -mcpu=3D860
CFLAGS_CPU-$(CONFIG_PPC44x) :=3D -mcpu=3D440
CFLAGS_CPU-$(CONFIG_PPC40x) :=3D -mcpu=3D405
ifdef CONFIG_CPU_LITTLE_ENDIAN
CFLAGS_CPU-$(CONFIG_BOOK3S_64) :=3D -mcpu=3Dpower8
else
CFLAGS_CPU-$(CONFIG_BOOK3S_64) :=3D -mcpu=3Dpower5
endif
CFLAGS_CPU-$(CONFIG_BOOK3E_64) :=3D -mcpu=3Dpowerpc64

For the non-generic CPU types, there is also CONFIG_TARGET_CPU,
and the list above could just get folded into that instead.

       Arnd
