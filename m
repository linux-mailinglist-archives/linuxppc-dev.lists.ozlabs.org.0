Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41E797318
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 16:37:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhMJV5PCjz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 00:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.51; helo=mail-oa1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhMJ03q7Gz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 00:36:31 +1000 (AEST)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so704217fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 07:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694097388; x=1694702188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHLh0XIuAU9BJlqzEfpp7VQfwKfBKemsHfjkdXxbouo=;
        b=Z4LyfvsHgOUghdTEqFt7UEMxDO0ZwsL8eax3os5w33ZcsDH3JpnGkRPKaTxvGlBvpt
         6u7UwBWHCShS49mhdhSaZAxGlm9YwGJ5iKxT9TYV/WI+8OjAoHDa45AqA/RHTUcjWTgz
         +kXh3E0OBKSU6nRQY/yMkL26TWT5vZvFOmUHNHYRYlEz3UUeeI+wreo6fJTVGP1EB/x9
         jksIuCOuW6lvCpV8yJNWLosALNDf3oYWXe6OeIsOmQbj1NSSD2sCylusqt38LdO5K7ox
         dynpxIu6/1H79O3QhzIlK+LLabc2RgQ9mSv77ooSzVeF9S1TCKpruSCLpDPypwdimviU
         FD2g==
X-Gm-Message-State: AOJu0Ywm1mnTqqDe0DYstsTea9UI4Nsk4k24UcKjjRRlgVaN1fKszgLB
	e5nwNLNd4WJeXUhn1GkM5cSdWyyp9AFlCA==
X-Google-Smtp-Source: AGHT+IGeo0GIbyPRAR8sSwlYUapAr41Kvd2ZFlalJyW+msXNml8EStExtlrv2b7I2+wqTJxfQw2CcA==
X-Received: by 2002:a05:6808:1449:b0:3a7:4e0c:faa7 with SMTP id x9-20020a056808144900b003a74e0cfaa7mr27628925oiv.14.1694097386314;
        Thu, 07 Sep 2023 07:36:26 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id g127-20020a0ddd85000000b0059b17647dcbsm1241639ywe.69.2023.09.07.07.36.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 07:36:25 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7b8d2631fdso967293276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 07:36:25 -0700 (PDT)
X-Received: by 2002:a25:ad91:0:b0:d2c:32cb:c631 with SMTP id
 z17-20020a25ad91000000b00d2c32cbc631mr20648715ybi.27.1694097385344; Thu, 07
 Sep 2023 07:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694095086.git.geert@linux-m68k.org> <5c80dc63-e7d0-5d82-de83-7e35c54b8351@csgroup.eu>
In-Reply-To: <5c80dc63-e7d0-5d82-de83-7e35c54b8351@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2023 16:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzOsAa1qtnqBP0Wr_AaTGWUnxVHnWryoCDPX0d-v1EBg@mail.gmail.com>
Message-ID: <CAMuHMdWzOsAa1qtnqBP0Wr_AaTGWUnxVHnWryoCDPX0d-v1EBg@mail.gmail.com>
Subject: Re: [PATCH 0/2] m68k/powerpc: Kill references to non-existent README.legal
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux SPDX Licenses <linux-spdx@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Thu, Sep 7, 2023 at 4:25=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 07/09/2023 =C3=A0 16:21, Geert Uytterhoeven a =C3=A9crit :
> > Several source files contain license boilerplate that refers to the fil=
e
> > "README.legal", which never existed in upstream Linux.  This is a relic
> > from the early port of Linux to the m68k processor family, before it wa=
s
> > merged in v1.3.94.  Later, copies of this boilerplate ended up in the
> > PowerPC port.
> >
> > The "README.legal" file (from e.g. [1]) read:
> >
> > ---8<-----------------------------------------------------------------
> > Legal information about the Linux/68k software package
> >
> > All files contained in this archive are copyrighted by one or more
> > person.  They are not in the public domain.
> >
> > Most of the files are copyrighted by Linus Torvalds, the original
> > writer of Linux for IBM PC clone systems.  Some parts are copyrighted
> > by other IBM PC linux developers.  Other parts are copyrighted by
> > Linux/68k developers.
> >
> > This package is subject to the terms and conditions of the GNU General
> > Public License.  A copy of this license may be found in the file named
> > "COPYING" which should be in the same directory as this file.  If the
> > file has been omitted, you may obtain it by writing to the Free
> > Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> > ----------------------------------------------------------------->8---
> >
> > Note that the "COPYING" file at that time corresponded to the version
> > from upstream Linux v0.99.11 until v2.1.104, and thus predated the
> > addition of the "only valid GPL version is v2" clause in v2.4.0-test8.
> >
> > This patch series gets rid of the references to README.legal by
> > replacing the boilerplate with SPDX license identifiers.
> >
> > Thanks for your comments!
>
> As far as I know this kind of patch has to be copied to
> linux-spdx@vger.kernel.org

Thanks, added to CC.

> > [1] https://www.ibiblio.org/pub/historic-linux/ftp-archives/tsx-11.mit.=
edu/Oct-07-1996/680x0/v0.9/linux-0.9.tar.gz
> >
> > Geert Uytterhoeven (2):
> >    m68k: Replace GPL 2.0+ README.legal boilerplate by SPDX
> >    powerpc: Replace GPL 2.0+ README.legal boilerplate by SPDX
> >
> >   arch/m68k/68000/entry.S             | 7 ++-----
> >   arch/m68k/bvme6000/config.c         | 5 +----
> >   arch/m68k/coldfire/entry.S          | 7 ++-----
> >   arch/m68k/ifpsp060/Makefile         | 6 ++----
> >   arch/m68k/kernel/entry.S            | 7 ++-----
> >   arch/m68k/kernel/head.S             | 8 ++------
> >   arch/m68k/mvme147/config.c          | 5 +----
> >   arch/m68k/mvme16x/config.c          | 5 +----
> >   arch/m68k/q40/config.c              | 5 +----
> >   arch/powerpc/kernel/ptrace/ptrace.c | 5 +----
> >   arch/powerpc/kernel/signal.c        | 5 +----
> >   arch/powerpc/kernel/signal.h        | 7 ++-----
> >   12 files changed, 18 insertions(+), 54 deletions(-)

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
