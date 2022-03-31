Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E834ED325
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 07:01:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTWPJ1mWCz2yZf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 16:01:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RZVGcEIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RZVGcEIp; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTWNc1zRzz2xtJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 16:01:19 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id i4so20541370qti.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9PhOheKZBtW5gksVqb6Bt77ucBCVHEWpeEX8aYF/NYY=;
 b=RZVGcEIpfajF4EFdMg8nXeL9dBlUC9u/f4PvwoMxP2z+JMEyGIzwyH01SzOd+4EpPP
 m8/cVC/0I3wZO9Qi0FcwvjREG4JQyLeyZqL/ASSOl1K1SvtumP+rVZAAZAAUQoUhsqPq
 kwrNzI0qb2qAEmpLDrlvJN/MACANNpOiFYuQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9PhOheKZBtW5gksVqb6Bt77ucBCVHEWpeEX8aYF/NYY=;
 b=OwEAAl5hbOknAFioGuj1hXgj9wfjmR03ECnKIQpM/WHW/YrjbH9fr+ACcOHlwyCGlI
 azcc+8YbOzeYEdsScMEWbQB95u6gehjSUm3rXXLD5Cl1SBhVjsOMnAyV7adJxPmFmPco
 M44wDbMCZAy5WoxaQi45A7pY1zdG/OIi80X0cal3e0/sHLVDt8M1SbVltWGy/BlRHleW
 sPY/j/084biOiJX7tZt9fvciAw7VL+/GTiNH96614jH+onUKgormzUmOltFY+3P5upLX
 H0LXh1jatXri4QBXMPiqtG+gYoAOklaFEIomCDNv3U+KvUg10RuXR6QCtSkZxak8/ns4
 1Glg==
X-Gm-Message-State: AOAM5315h+Q1EmDN9As1YPZxL+8etDWOFS0+rd2PD01pb1Ox0kwUOOLl
 k74Q/50ZlDcg0Hy18KIhz3SirxMDKH8h3PngZUZwKIMcyM8=
X-Google-Smtp-Source: ABdhPJw14Qz2DWVwioMWV4IzCEiEOq5bbNQwRHv+QM1X4fgPIo019Gordwb08K2JbDjJKsQPFb63FmaH6FhBPETp5RI=
X-Received: by 2002:a05:622a:60c:b0:2e2:7b3:3231 with SMTP id
 z12-20020a05622a060c00b002e207b33231mr2744494qta.678.1648702873504; Wed, 30
 Mar 2022 22:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
In-Reply-To: <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 05:01:00 +0000
Message-ID: <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
To: =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <mopsfelder@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 02:05, Murilo Opsfelder Ara=C3=BAjo
<mopsfelder@gmail.com> wrote:
>
> Hi, Joel.
>
> On 3/30/22 08:24, Joel Stanley wrote:
> > Currently the boot wrapper lacks a -mcpu option, so it will be built fo=
r
> > the toolchain's default cpu. This is a problem if the toolchain default=
s
> > to a cpu with newer instructions.
> >
> > We could wire in TARGET_CPU but instead use the oldest supported option
> > so the wrapper runs anywhere.
> >
> > The GCC documentation stays that -mcpu=3Dpowerpc64le will give us a
> > generic 64 bit powerpc machine:
> >
> >   -mcpu=3Dpowerpc, -mcpu=3Dpowerpc64, and -mcpu=3Dpowerpc64le specify p=
ure
> >   32-bit PowerPC (either endian), 64-bit big endian PowerPC and 64-bit
> >   little endian PowerPC architecture machine types, with an appropriate=
,
> >   generic processor model assumed for scheduling purposes.
> >
> > So do that for each of the three machines.
> >
> > This bug was found when building the kernel with a toolchain that
> > defaulted to powre10, resulting in a pcrel enabled wrapper which fails
> > to link:
> >
> >   arch/powerpc/boot/wrapper.a(crt0.o): in function `p_base':
> >   (.text+0x150): call to `platform_init' lacks nop, can't restore toc; =
(toc save/adjust stub)
> >   (.text+0x154): call to `start' lacks nop, can't restore toc; (toc sav=
e/adjust stub)
> >   powerpc64le-buildroot-linux-gnu-ld: final link failed: bad value
> >
> > Even with tha bug worked around the resulting kernel would crash on a
> > power9 box:
> >
> >   $ qemu-system-ppc64 -nographic -nodefaults -M powernv9 -kernel arch/p=
owerpc/boot/zImage.epapr -serial mon:stdio
> >   [    7.069331356,5] INIT: Starting kernel at 0x20010020, fdt at 0x306=
8c628 25694 bytes
> >   [    7.130374661,3] ***********************************************
> >   [    7.131072886,3] Fatal Exception 0xe40 at 00000000200101e4    MSR =
9000000000000001
> >   [    7.131290613,3] CFAR : 000000002001027c MSR  : 9000000000000001
> >   [    7.131433759,3] SRR0 : 0000000020010050 SRR1 : 9000000000000001
> >   [    7.131577775,3] HSRR0: 00000000200101e4 HSRR1: 9000000000000001
> >   [    7.131733687,3] DSISR: 00000000         DAR  : 0000000000000000
> >   [    7.131905162,3] LR   : 0000000020010280 CTR  : 0000000000000000
> >   [    7.132068356,3] CR   : 44002004         XER  : 00000000
> >
> > Link: https://github.com/linuxppc/issues/issues/400
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > Tested:
> >
> >   - ppc64le_defconfig
> >   - pseries and powernv qemu, for power8, power9, power10 cpus
> >   - buildroot compiler that defaults to -mcpu=3Dpower10 (gcc 10.3.0, ld=
 2.36.1)
> >   -  RHEL9 cross compilers (gcc 11.2.1-1, ld 2.35.2-17.el9)
> >
> > All decompressed and made it into the kernel ok.
> >
> > ppc64_defconfig did not work, as we've got a regression when the wrappe=
r
> > is built for big endian. It hasn't worked for zImage.pseries for a long
> > time (at least v4.14), and broke some time between v5.4 and v5.17 for
> > zImage.epapr.
> >
> >   arch/powerpc/boot/Makefile | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 9993c6256ad2..1f5cc401bfc0 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -38,9 +38,13 @@ BOOTCFLAGS    :=3D -Wall -Wundef -Wstrict-prototypes=
 -Wno-trigraphs \
> >                $(LINUXINCLUDE)
> >
> >   ifdef CONFIG_PPC64_BOOT_WRAPPER
> > -BOOTCFLAGS   +=3D -m64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BOOTCFLAGS   +=3D -m64 -mcpu=3Dpowerpc64le
> >   else
> > -BOOTCFLAGS   +=3D -m32
> > +BOOTCFLAGS   +=3D -m64 -mcpu=3Dpowerpc64
> > +endif
> > +else
> > +BOOTCFLAGS   +=3D -m32 -mcpu=3Dpowerpc
> >   endif
> >
> >   BOOTCFLAGS  +=3D -isystem $(shell $(BOOTCC) -print-file-name=3Dinclud=
e)
>
> I think it was a fortunate coincidence that the default cpu type of your =
gcc is
> compatible with your system.  If the distro gcc moves its default to a ne=
wer cpu
> type than your system, this bug would happen again.

Perhaps I needed to be clear in my commit message: that's the exact
bug I'm looking to avoid. I have a buildroot toolchain that was built
for -mcpu=3Dpower10.

I think you're suggesting the -mcpu=3Dpowerpc64 option will change it 's
behavior depending on the default. From my reading of the man page, I
don't think that's true.

I did a little test using my buildroot compiler which has
with-cpu=3Dpower10. I used the presence of PCREL relocations as evidence
that it was build for power10.

$ powerpc64le-buildroot-linux-gnu-gcc -mcpu=3Dpower10 -c test.c
$ readelf -r test.o |grep -c PCREL
24
$ powerpc64le-buildroot-linux-gnu-gcc -c test.c
$ readelf -r test.o |grep -c PCREL
24
$ powerpc64le-buildroot-linux-gnu-gcc -mcpu=3Dpowerpc64le -c test.c
$ readelf -r test.o |grep -c PCREL
0

>
> The command "gcc -v |& grep with-cpu" will show you the default cpu type =
for 32
> and 64-bit that gcc was configured.

Just a headss up: this gives me no output for the 64 bit compilers on my la=
ptop:

$ powerpc64le-linux-gnu-gcc -v |& grep  with-cpu
$ echo $?
1

$ powerpc64-linux-gnu-gcc -v |& grep  with-cpu
$ echo $?
1

It reports --with-cpu=3Ddefault32 for the 32 bit compiler.

>
> Considering the CONFIG_TARGET_CPU for BOOTCFLAGS would bring some level o=
f
> consistency between CFLAGS and BOOTCFLAGS regarding -mcpu value.
>
> We could mimic the behaviour from arch/powerpc/Makefile:

This was the inspiration for my change. I first took it verbatim, and
then did a bit of reading about what -mcpu actually sets. Reading the
GCC source it seems powerpc64le is equivalent to power8. powerpc64 is
less clear.

So I a agree with your suggestion. Hopefully my patch has the equivalent re=
sult.


>
>      166 ifdef config_ppc_book3s_64
>      167 ifdef config_cpu_little_endian
>      168 cflags-$(config_generic_cpu) +=3D -mcpu=3Dpower8
>      169 cflags-$(config_generic_cpu) +=3D $(call cc-option,-mtune=3Dpowe=
r9,-mtune=3Dpower8)
>      170 else
>      171 cflags-$(config_generic_cpu) +=3D $(call cc-option,-mtune=3Dpowe=
r7,$(call cc-option,-mtune=3Dpower5))
>      172 cflags-$(config_generic_cpu) +=3D $(call cc-option,-mcpu=3Dpower=
5,-mcpu=3Dpower4)
>      173 endif
>      174 else ifdef config_ppc_book3e_64
>      175 cflags-$(config_generic_cpu) +=3D -mcpu=3Dpowerpc64
>      176 endif
>      ...
>      185 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=3D $(call cc-option,-mcpu=3D$=
(CONFIG_TARGET_CPU))
>
> Cheers!
>
> --
> Murilo
