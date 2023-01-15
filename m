Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0566B0DA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 13:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvv4g0l9tz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 23:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pydXXibc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=sedat.dilek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pydXXibc;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvv3h2szYz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 23:05:03 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id b3so39193847lfv.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71uR/HEov5DHYjQr21uUwUAdHQnBZ2QO6kQLmE+g0jc=;
        b=pydXXibcbCfrT9nF/qicQk4EV/JNOxmm03zN03F+z/B1/ZmEEBAQdVF1nlM8iCNi4t
         e38ZvFkOxNHKr67yXbQhvV9QIDM66Vfxlgon9Rx1EhBLX5BRyIbkHxB0RowNWOSas4ry
         bi5Onq16Fvx0NSlCMXL0qQv3oXgm0i48GEUS1fjGxjA0K3WcX4ce7A8FP9ecc2zNg6TE
         B7SqMbr/Ojxp8cUse+xC1beu3taSEi2TmtL3tMOKDzngwQF0Fgh/GUl48RnTi/wOFdQ2
         h/0p3ZDmCh78wSLi4KbqxGJzNG3+xg0V/pesZNiQven6V2/epFsn+vQZdOc/cp36FL4l
         QXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71uR/HEov5DHYjQr21uUwUAdHQnBZ2QO6kQLmE+g0jc=;
        b=4gDhrF9ykhMniyNoFfhzt8Yywtg4Q2lZtJaL0N5/ifAwYz8jbekIW8xWMoQUOG1YUh
         95s5zmE4E70n2+dH2cpLoWHl5+lGm5o8NvQphvL1KBYDNQt0xbOU07wHoIBMkqZnm9Pa
         pCTcM+ODMFv8RknqV4j1p2lkb3QffcBNA7YaYpAA9q3mkmnnuryNG6Eiee4XHVmaYqEI
         fUFxMtj14y4ktPT6AVN8pXM5KojvZ3Q06a4gYSGWIzAC20pp7tlqKHd8wu2lAYQdAEg7
         9Lw9at7AceDbmYesnbvHjtDWOhkkZ0j2B4zq2WZb9glORj9Nw/leWrnUf9JM5kn6EqDj
         oKFg==
X-Gm-Message-State: AFqh2kpulchDiL7Q7Wf9XmqPAnvmHuD61dY5OydIFJNuUWuNAkV+v6vI
	T9KvgWqoQ1RWEOvCK1GOfzvy0D9vFdFKG5JfPaw=
X-Google-Smtp-Source: AMrXdXuZiMMaI6GQr60G7R1W1fg8EVNZ3MW70Kcq0hYkEwHQj7d791HP/UVwtN2jDqJDim8CfbzLgz071fchF4CvjZM=
X-Received: by 2002:a05:6512:12c8:b0:4cc:98fe:1917 with SMTP id
 p8-20020a05651212c800b004cc98fe1917mr785704lfg.650.1673784295630; Sun, 15 Jan
 2023 04:04:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
 <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com>
 <CA+icZUXEz7ZxmkV5bw5O2ORjF4bwDXBMyj3Wk_HST98gMPt97g@mail.gmail.com>
 <CA+icZUUhY7-F5Bpw-jxofhw4nMP3nzyfpt9huzeSWwUguguNsA@mail.gmail.com> <Y8NIYSMqAk7BhSv5@casper.infradead.org>
In-Reply-To: <Y8NIYSMqAk7BhSv5@casper.infradead.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 15 Jan 2023 13:04:18 +0100
Message-ID: <CA+icZUV6usk0KOsK=xQSVp0TQmrsx_ELkc3tWjCBFFnUjAO_Vw@mail.gmail.com>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs cpu_relax)
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: sedat.dilek@gmail.com
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 15, 2023 at 1:27 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, Jan 14, 2023 at 12:28:30PM +0100, Sedat Dilek wrote:
> > [ ... ]
> >
> > > Best is to ask the Debian release-team or (if there exist) maintainers
> > > or responsibles for the IA64 port - which is an ***unofficial*** port.
> > >
> >
> > Here we go:
> >
> > https://lists.debian.org/debian-ia64/
> >
> > Posting address: debian-ia64@lists.debian.org
> >
> > Found via <https://lists.debian.org/completeindex.html>
>
> More useful perhaps is to look at https://popcon.debian.org/
>
> There are three machines reporting popcon results.  It's dead.

Exactly, Debian Popularity Contest was what I was looking for yesterday.

Thanks Matthew.

[1] says in Inst (204701):

Name                              || Number  || %
==================================
binutils-x86-64-linux-gnu || 101548  || 49.61%
binutils-ia64-linux-gnu     ||          11  || 0.01%

HELP: Inst. is the number of people who installed this package (sum of
the four categories below)

There may be more popular packages than binutils.
( binutils might tell something about development happening or not. )

Anyway, I am not a popcon expert and never participated in Debian's
Popularity Contest.

-Sedat-

[1] https://qa.debian.org/popcon.php?package=binutils
