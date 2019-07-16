Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5776A2B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 09:17:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nsCt4PcGzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 17:17:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.83; helo=conssluserg-04.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="Pnlxllme"; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ns9x0jj4zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 17:15:32 +1000 (AEST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x6G7FBtm010097
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 16:15:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6G7FBtm010097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563261313;
 bh=QcVnV9OLob7IvgKHrnhoRO7gO5UasK9/m6KCahUPQwk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PnlxllmeJqxxA6vs4lAjBUgs+Anv5Eb756kryUMe+Wzm6rIjk8nZSInxbfdscQOdG
 as+UaeR/Cz0lQ4tlEB1hHgm1svWpEl/MlJF7F0WgohHeAlb6iX8mhuMnW5X4qOke76
 X+gg+nSWOB0hf5JrJdpHdgXPlmofJrExLOipgLUIQmWjqlzX4b+AEqUiRtDPIRNhDq
 X1CvBKsXsRyHhdg+d/g6+qPQXuBsPBxTI85pxwNvej/0uNDPEsKXXA70sKdlcHjbgh
 ZGbOGqjtual2KueHxPUzSixgn0Q6rXMoOVgWVsvpjc1a9qX+/Ei08llwP74ALYoP+C
 zAMrJLT/W81/w==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id m8so13243678vsj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 00:15:12 -0700 (PDT)
X-Gm-Message-State: APjAAAU3z21GtgOYxTWN+XMBnPWNhEdKW7+6rV0k6e2iAcLQ4l5BTNzi
 hsz10FK8dK/2BWLvoNn09d+MN7MqzhmSIA4KVgc=
X-Google-Smtp-Source: APXvYqyBAqZZbdQlYRd1vuBlPVWO5Kp2SMReNtvXaXAGRBCPnqL3qX+XdDbFkUD6YV7WD97X/AQvx6I32sekRxU8udI=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr18947906vsq.179.1563261310985; 
 Tue, 16 Jul 2019 00:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
 <CAK7LNATGEK9wxz87J3sTNOYPdtAFXaegQU9EctEBGULQL-ZC4w@mail.gmail.com>
 <20190715181618.GG20882@gate.crashing.org>
In-Reply-To: <20190715181618.GG20882@gate.crashing.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Jul 2019 16:14:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfzoHu8VvvdkNnwak5ZuP0zmJdvxMSPYGB2YsoUw59jw@mail.gmail.com>
Message-ID: <CAK7LNAQfzoHu8VvvdkNnwak5ZuP0zmJdvxMSPYGB2YsoUw59jw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 3:16 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Jul 15, 2019 at 09:03:46PM +0900, Masahiro Yamada wrote:
> > On Mon, Jul 15, 2019 at 4:30 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > >
> > > On Mon, Jul 15, 2019 at 05:05:34PM +1000, Michael Ellerman wrote:
> > > > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > > > Yes, that is why I used the environment variable, all binutils work
> > > > > with that.  There was no --target option in GNU ar before 2.22.
> >
> > I use binutils 2.30
> > It does not understand --target option.
> >
> > $ powerpc-linux-ar --version
> > GNU ar (GNU Binutils) 2.30
> > Copyright (C) 2018 Free Software Foundation, Inc.
> > This program is free software; you may redistribute it under the terms of
> > the GNU General Public License version 3 or (at your option) any later version.
> > This program has absolutely no warranty.
> >
> > If I give --target=elf$(BITS)-$(GNUTARGET) option, I see this:
> > powerpc-linux-ar: -t: No such file or directory
>
> You need to provide a valid command line, like
>
> $ powerpc-linux-ar tv smth.a --target=elf32-powerpc
>
> ar is a bit weird.


Ah, I see!

I had missed the space being required.

Since I cannot test old binutils,
I will leave this to ppc people.






--
Best Regards
Masahiro Yamada
