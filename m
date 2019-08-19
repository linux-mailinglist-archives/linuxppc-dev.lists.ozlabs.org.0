Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF891C0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 06:28:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BgsG3JsjzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 14:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="nxrHN0Ys"; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BgqY3lwrzDr70
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 14:26:48 +1000 (AEST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x7J4QTkw004548
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 13:26:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7J4QTkw004548
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1566188790;
 bh=OW1zICb/Mc7eyHaJB7F+0jGSnOYmZvCIzJbFodsGuQ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nxrHN0YsNDaS/A3TzwVTJrjMWHNoxXx9++LRPbmK0e6NmQju51D+ziozFzOerTSHj
 0FDE7Q3U+qGXKj1dy2OoRArV11/pokJT/DDuaRqQ6/uC6GSUYvZ4cIgeWkKRjfoZ/1
 7DQR/dNxYCOoo+1antF+eGJc5hIAyLGd9DRoY/+678+HavcyMMW0xXZin/7ZW+f4RS
 cAaZ7IdufwJP1y9n4xREqic8O41pXY9z+pqWnkulnsfK7r0FZNm6jC0wXSLkiZY/nr
 J03R5JjXKPf01oFqRrNM6takc1awzbDl+zo67p3S9SFmy4SdNUKTVEopvwIa9JxkNY
 DdM/qsZmy8SYQ==
X-Nifty-SrcIP: [209.85.221.179]
Received: by mail-vk1-f179.google.com with SMTP id t136so123894vkt.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 21:26:29 -0700 (PDT)
X-Gm-Message-State: APjAAAU4FnYfwqk/Mi4jKsYj4cr26FgT/i0a2d401G0L1thTYQ7MIq12
 1QDo43bklPOL4lsJ+hR1XngrU2U2xqushr/ktkI=
X-Google-Smtp-Source: APXvYqyP0Fpi/HcxiJ414/X4VHQkyya1xBYajp/2fXLljetLW55Ed2rsnGbLxediWPOHVe7DHFQxGP0Mc9dQb2Dr/Bk=
X-Received: by 2002:a1f:ee81:: with SMTP id m123mr2220428vkh.74.1566188788852; 
 Sun, 18 Aug 2019 21:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
 <87pnma89ak.fsf@concordia.ellerman.id.au>
 <20190717143811.GL20882@gate.crashing.org>
 <CAK7LNATesRrJFGZQOkTY+PL7FNyub5FJ0N6NF4s6icdXdPNr+Q@mail.gmail.com>
 <20190717164628.GN20882@gate.crashing.org>
 <CAK7LNAR7jkq1fAi_=xgsANCkgP2AAej9Yv7RZB3B_cpD7C_71Q@mail.gmail.com>
 <20190718204631.GV20882@gate.crashing.org>
 <87blxq8zhf.fsf@concordia.ellerman.id.au>
In-Reply-To: <87blxq8zhf.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 13:25:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgOMhr6Fw-ge_ph4Hq-SGuvGTYHDcjd7e4+eb5_Ebw3A@mail.gmail.com>
Message-ID: <CAK7LNATgOMhr6Fw-ge_ph4Hq-SGuvGTYHDcjd7e4+eb5_Ebw3A@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
To: Michael Ellerman <mpe@ellerman.id.au>
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

Hi,

On Fri, Jul 19, 2019 at 12:43 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Thu, Jul 18, 2019 at 11:19:58AM +0900, Masahiro Yamada wrote:
> >> On Thu, Jul 18, 2019 at 1:46 AM Segher Boessenkool
> >> <segher@kernel.crashing.org> wrote:
> >> Kbuild always uses thin archives as far as vmlinux is concerned.
> >>
> >> But, there are some other call-sites.
> >>
> >> masahiro@pug:~/ref/linux$ git grep  '$(AR)' -- :^Documentation :^tools
> >> arch/powerpc/boot/Makefile:    BOOTAR := $(AR)
> >> arch/unicore32/lib/Makefile:    $(Q)$(AR) p $(GNU_LIBC_A) $(notdir $@) > $@
> >> arch/unicore32/lib/Makefile:    $(Q)$(AR) p $(GNU_LIBGCC_A) $(notdir $@) > $@
> >> lib/raid6/test/Makefile:         $(AR) cq $@ $^
> >> scripts/Kbuild.include:ar-option = $(call try-run, $(AR) rc$(1)
> >> "$$TMP",$(1),$(2))
> >> scripts/Makefile.build:      cmd_ar_builtin = rm -f $@; $(AR)
> >> rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> >> scripts/Makefile.lib:      cmd_ar = rm -f $@; $(AR)
> >> rcsTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> >>
> >> Probably, you are interested in arch/powerpc/boot/Makefile.
> >
> > That one seems fine actually.  The raid6 one I don't know.
> >
> >
> > My original commit message was
> >
> >     Without this, some versions of GNU ar fail to create
> >     an archive index if the object files it is packing
> >     together are of a different object format than ar's
> >     default format (for example, binutils compiled to
> >     default to 64-bit, with 32-bit objects).
> >
> > but I cannot reproduce the problem anymore.  Shortly after my patch the
> > thin archive code happened to binutils, and that overhauled some other
> > things, which might have fixed it already?
> >
> >> > Yes, I know.  This isn't about built-in.[oa], it is about *other*
> >> > archives we at least *used to* create.  If we *know* we do not anymore,
> >> > then this workaround can of course be removed (and good riddance).
> >>
> >> If it is not about built-in.[oa],
> >> which archive are you talking about?
> >>
> >> Can you pin-point the one?
> >
> > No, not anymore.  Lost in the mists of time, I guess?  I think we'll
> > just have to file it as "it seems to work fine now".
>
> Yeah I think so. If someone finds a case it breaks we can fix it then.
>
> > Thank you (and everyone else) for the time looking at this!
>
> Likewise.
>
> cheers


So, we agreed to apply this patch, right?

Please let me know if there is some improvement that should be get done.


-- 
Best Regards
Masahiro Yamada
