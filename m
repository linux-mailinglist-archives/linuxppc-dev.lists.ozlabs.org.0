Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6EA4EBFE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 13:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT4H74k57z3c1H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 22:40:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GRUkFdzV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GRUkFdzV; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT4GV41Tcz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:39:29 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id ke15so16570861qvb.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eq2J9pQtwgy02hWJGhxGaP+OuwdM8/b6vdr0Ns2JSFM=;
 b=GRUkFdzVqAZ4mlT/vLkKA8pBG2f4yzxqEgPEUTl0vXD3loOHXuNmAPwZLlytMnxXbA
 fb7EYZZSZd0XUL1v1bwC5qMPtysCtmOyw9amuRMPKrr4xddyvWzgRiONEU+69QOlBIdS
 Uhbpdi5iR4GUX0TGXJFYbV3HsMQ+1+Vym66To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eq2J9pQtwgy02hWJGhxGaP+OuwdM8/b6vdr0Ns2JSFM=;
 b=hHvpwGGMHI2HtFHYCBq/+ZSTEkie2oFofR1CwWzUT/v2AHk5ojx4NSibRaMYuK1YF2
 k0XMxVC2uh/2DXcjOoU4toAnpM/QNrGqaFcMqNyTSguHfWuoiRWi/UMLARWR2FQdK+hv
 MAZ+5LVT6ngoGtTnyOzu5SXSAkhX9FnQMuyP39dQqD145RJ7+wdFjtgernABsetsv+Y/
 ferN1Chg9HdJRzC+Whk9yEtZqQpyXtbDGlU2T2MvY2kWFUWBWuTCoFw3mi+Tr7JWWeV1
 t5q7ZberGAJkZNJfLHOZrtA8PGF2Xe+mCkWDNnNHdTaYYEWkaG//KjYWNCqrV7B+g7jo
 6wXQ==
X-Gm-Message-State: AOAM531sANTdfb82Gc3QaHmIyeBfeMswIl/1VklBTbsYyfL9RD+Z9EF9
 ud4hOIn1JEJefUkXisr5PUMCM2vcm3o1zcA+uqQ=
X-Google-Smtp-Source: ABdhPJz2soE2dViHagjwCy3HN90aF7S6RYKl0Rfwvu4i0Nh9zZLRoglgTFMbL68vWJK9jUL2fD85/ZN3Z4bXI2F5ReU=
X-Received: by 2002:ad4:4593:0:b0:441:1485:3403 with SMTP id
 x19-20020ad44593000000b0044114853403mr31147189qvu.107.1648640365924; Wed, 30
 Mar 2022 04:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220330112437.540214-1-joel@jms.id.au>
 <e0776e34-7efa-f42c-c194-1fc3fc5cf445@csgroup.eu>
In-Reply-To: <e0776e34-7efa-f42c-c194-1fc3fc5cf445@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Mar 2022 11:39:13 +0000
Message-ID: <CACPK8XdMiLFRpz7zAAVyGJzF4DiXrCK0WdKLxQ24e3KvFgdyow@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 30 Mar 2022 at 11:33, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/03/2022 =C3=A0 13:24, Joel Stanley a =C3=A9crit :
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
>
> How does that interracts with the following lines ? Isn't it an issue to
> have two -mcpu ?
>
> arch/powerpc/boot/Makefile:$(obj)/4xx.o: BOOTCFLAGS +=3D -mcpu=3D405
> arch/powerpc/boot/Makefile:$(obj)/ebony.o: BOOTCFLAGS +=3D -mcpu=3D440
> arch/powerpc/boot/Makefile:$(obj)/cuboot-hotfoot.o: BOOTCFLAGS +=3D -mcpu=
=3D405
> arch/powerpc/boot/Makefile:$(obj)/cuboot-taishan.o: BOOTCFLAGS +=3D -mcpu=
=3D440
> arch/powerpc/boot/Makefile:$(obj)/cuboot-katmai.o: BOOTCFLAGS +=3D -mcpu=
=3D440
> arch/powerpc/boot/Makefile:$(obj)/cuboot-acadia.o: BOOTCFLAGS +=3D -mcpu=
=3D405
> arch/powerpc/boot/Makefile:$(obj)/treeboot-iss4xx.o: BOOTCFLAGS +=3D -mcp=
u=3D405
> arch/powerpc/boot/Makefile:$(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D
> -mcpu=3D405
> arch/powerpc/boot/Makefile:$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D
> -mcpu=3D405

Good point, I didn't test the other wrappers.

Last one wins as far as -mcpu lines goes, from a quick test. But it
might lead to less confusion if I dropped the -mcpu=3Dpowerpc change.
