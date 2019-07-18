Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 442786C4F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 04:22:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pybG0Y6rzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 12:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="s/VtYSLz"; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pyY104S3zDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 12:20:51 +1000 (AEST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x6I2KYgN028131
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 11:20:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x6I2KYgN028131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563416435;
 bh=tkHvMLjjjDHqsY1NCUmploWB82ITvFQnTe0kWRfY618=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s/VtYSLzYI8pZl0VRgeXLT4YVj2lKkT54FPRnAHyYMnb1IwjXkrAEGQk51yYDcvZR
 ci6S670X0uREaPAWNYuRz9/dT1w0annFJIRdupnNJsZLbh/0Mz7QeDK2N9T3fpuiYN
 guzzZpu3sE/X+h5RwPN87hupPUkbKq/k2mYy+9UWJDga/JCfqv6gBfMrPPOAcy5jqg
 qBUKhs908QTECo00p7NTF4XCndSgyyr5B16nwH0nTlygEM78CNm7otDQxf95/M1pNp
 3Gc6D8tv66TbRR/waBE3GassIOWVZV++ihnyQPtYkXU0NefbrQdwcvQJ0xYSp+NieV
 sEdkVEVS6Koig==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id 34so10501689uar.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 19:20:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUVy/IbM1MEKw0sVxneyccZK6WFG+R0E+2ozzXJ4L8gx5ODx5Cv
 k9YUIIgJUUJThRE9W9s+ie6TagmdwvXkjLmiYTU=
X-Google-Smtp-Source: APXvYqyDs8leywH3J63QVoya2xfCFpz3DtNeYlTeZ0uBmpp+YteurwkLd/rG1cd0yyBPuSLAqAEd7Ze7wSrtjyiiTDM=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr3602900ual.109.1563416434430; 
 Wed, 17 Jul 2019 19:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
 <87pnma89ak.fsf@concordia.ellerman.id.au>
 <20190717143811.GL20882@gate.crashing.org>
 <CAK7LNATesRrJFGZQOkTY+PL7FNyub5FJ0N6NF4s6icdXdPNr+Q@mail.gmail.com>
 <20190717164628.GN20882@gate.crashing.org>
In-Reply-To: <20190717164628.GN20882@gate.crashing.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jul 2019 11:19:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR7jkq1fAi_=xgsANCkgP2AAej9Yv7RZB3B_cpD7C_71Q@mail.gmail.com>
Message-ID: <CAK7LNAR7jkq1fAi_=xgsANCkgP2AAej9Yv7RZB3B_cpD7C_71Q@mail.gmail.com>
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

On Thu, Jul 18, 2019 at 1:46 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Jul 18, 2019 at 12:19:36AM +0900, Masahiro Yamada wrote:
> > On Wed, Jul 17, 2019 at 11:38 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > >
> > > On Tue, Jul 16, 2019 at 10:15:47PM +1000, Michael Ellerman wrote:
> > > > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > > And it's definitely calling ar with no flags, eg:
> > > >
> > > >   rm -f init/built-in.a; powerpc-linux-ar rcSTPD init/built-in.a init/main.o init/version.o init/do_mounts.o init/do_mounts_rd.o init/do_mounts_initrd.o init/do_mounts_md.o init/initramfs.o init/init_task.o
> > >
> > > This uses thin archives.  Those will work fine.
> > >
> > > The failing case was empty files IIRC, stuff created from no inputs.
> >
> > Actually, empty files are created everywhere.
>
> >        cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@
> > $(real-prereqs)
>
> You use thin archives.
>
> Does every config use thin archives always nowadays?

Kbuild always uses thin archives as far as vmlinux is concerned.

But, there are some other call-sites.

masahiro@pug:~/ref/linux$ git grep  '$(AR)' -- :^Documentation :^tools
arch/powerpc/boot/Makefile:    BOOTAR := $(AR)
arch/unicore32/lib/Makefile:    $(Q)$(AR) p $(GNU_LIBC_A) $(notdir $@) > $@
arch/unicore32/lib/Makefile:    $(Q)$(AR) p $(GNU_LIBGCC_A) $(notdir $@) > $@
lib/raid6/test/Makefile:         $(AR) cq $@ $^
scripts/Kbuild.include:ar-option = $(call try-run, $(AR) rc$(1)
"$$TMP",$(1),$(2))
scripts/Makefile.build:      cmd_ar_builtin = rm -f $@; $(AR)
rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
scripts/Makefile.lib:      cmd_ar = rm -f $@; $(AR)
rcsTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)


Probably, you are interested in arch/powerpc/boot/Makefile.
This does not seem a thin archive.


> > BTW, your commit 8995ac8702737147115e1c75879a1a2d75627b9e
> > dates back to 2008.
> >
> > At that time, thin archive was not used.
>
> Yes, I know.  This isn't about built-in.[oa], it is about *other*
> archives we at least *used to* create.  If we *know* we do not anymore,
> then this workaround can of course be removed (and good riddance).

If it is not about built-in.[oa],
which archive are you talking about?

Can you pin-point the one?

masahiro@pug:~/ref/linux$ git log --oneline  -1
8995ac870273 (HEAD) [POWERPC] Specify GNUTARGET on $(AR) invocations
masahiro@pug:~/ref/linux$ git grep '(AR)'
Documentation/kbuild/makefiles.txt:     per-directory options to $(LD)
and $(AR).
arch/powerpc/Makefile:CROSS32AR := GNUTARGET=elf32-powerpc $(AR)
arch/powerpc/Makefile:override AR       := GNUTARGET=elf$(SZ)-powerpc $(AR)
drivers/md/raid6test/Makefile:   $(AR) cq $@ $^
scripts/Makefile.build:               rm -f $@; $(AR) rcs $@)
scripts/Makefile.build:cmd_link_l_target = rm -f $@; $(AR)
$(EXTRA_ARFLAGS) rcs $@ $(lib-y)
masahiro@pug:~/ref/linux$ git grep '(CROSS32AR)'
arch/powerpc/boot/Makefile:      cmd_bootar = $(CROSS32AR) -cr $@.$$$$
$(filter-out FORCE,$^); mv $@.$$$$ $@



> If ar creates an archive file (a real one, not a thin archive), and it
> has no input files, it uses its default object format as destination
> format, if it isn't told to use something else.  And that doesn't work,
> it needs to use some format compatible with what that archive later is
> linked with.

I compile-tested v4.10, which was before the thin-archive migration,
but I did not see any problem for building ppc32/64.

Whether or not it is a thin archive,
an empty archive is always 8-byte file.

masahiro@pug:~/ref/linux$ cat kernel/livepatch/built-in.o
!<arch>

Is there a room for caring about the under-lying architecture?


-- 
Best Regards
Masahiro Yamada
