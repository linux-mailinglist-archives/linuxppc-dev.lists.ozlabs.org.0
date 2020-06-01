Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB21EA094
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 11:12:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b8Zs4rg7zDqGk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 19:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b8XM0CwwzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 19:10:24 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id m2so5475827otr.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jun 2020 02:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTQ7pcyei2DeFkq5Sn+bdzrT7dJ5a3VXGPitkIthbGA=;
 b=dN1bQ+GMdABpOyF8kqYv9Di24yWxu9m440YdHqBcEJ4U1J6MLm6N1msYSQZ4C+BKkV
 P9CKR49IbBoZ6qpMiKwOL5Mu7hv/M0KZ42azQnnL7FGgtFF98EEfZYJLJFKWgPC0Oqiu
 m1rfMHqW86vXkUJfVR7B6CW65NFwBcNmOhHxA/4/6KSiq4N9V+jpmM1RTy/UCMZ5WYyX
 qyIjomksyg3WuRxo9iiJ7dZneC7oLtCGSbuAS1q6kNUW1xiCMUg3+qrrznw0rZxAln44
 d5fAs0SheDw+1InYVJ2rvX6u097k4+AgiwsBhyQPLDThsSqzkutjn0xAg7pXECguybRf
 T4YA==
X-Gm-Message-State: AOAM533KtNdC8U2v0QKofJKem2lefVCetdN+aj9HM8dFzzvwGk0d8fci
 SgRw1fO7I6bwR+/jaXvgNrevp6KLA+e2P/MkjxQ=
X-Google-Smtp-Source: ABdhPJyj0hf8C6yXd7U8Owgk7Y+looRYu57OLr6RWX5Hh03Ougumjcw/Di4KWKaiBUX8YQZvleFNeoDUU8BTzOzAucU=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr8837128otr.107.1591002621470;
 Mon, 01 Jun 2020 02:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
 <20200531200140.GA27809@allandria.com>
In-Reply-To: <20200531200140.GA27809@allandria.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2020 11:10:10 +0200
Message-ID: <CAMuHMdWsLH_6G3EYG=NpcMaorGnRC1uPw3O9pp=tKNYpvKe+uQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
To: Brad Boyer <flar@allandria.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Brad,

On Sun, May 31, 2020 at 10:01 PM Brad Boyer <flar@allandria.com> wrote:
> On Sun, May 31, 2020 at 10:38:04AM +0200, Geert Uytterhoeven wrote:
> > >  arch/m68k/include/asm/adb_iop.h |  1 +
> > As this header file is used by a single source file only, perhaps it should
> > just be absorbed by the latter?
> > Then you no longer need my Acked-by for future changes ;-)
>
> While I don't really feel involved in this specific change (although I
> was one of the testers when the driver was first written), I am a little
> curious about the current coding standards. This header is pretty much
> just a declaration of the hardware interface, of which there are many
> in this directory. Is it better to just define all the offsets and bits
> for hardware registers inside the driver? We used to always put them in
> headers like this, but is that not the current standard? Would it be
> cleaner to put such headers in the directory with the driver effectively
> making them private? I seem to see quite a bit of that as well.

The idea behind header files is to share definitions among multipe
source files, right? It seems there is only one user of this header
file, so no sharing is involved, and thus these definitions are
de-facto private to the driver.  Hence, the hardware declarations
could be absorbed by the driver source file.

In this case having two separate files makes maintenance more
difficult, as the two files belong to different maintainer spaces
(drivers/macintosh/ and arch/m68k/).

In general, moving header files to the driver directory is an option,
if nothing outside the driver directory needs it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
