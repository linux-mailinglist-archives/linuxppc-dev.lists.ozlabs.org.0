Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C33E5047
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 02:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkCvg34fVz30J5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 10:07:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=qpeaZfj1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=qpeaZfj1; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkCtx2DZ7z2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 10:07:20 +1000 (AEST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 17A073AK021311
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 09:07:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17A073AK021311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628554023;
 bh=YHT1wdO9BJeEnVYWadet580A1QtIyBQoR9aiFtvfZGQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qpeaZfj1S52In9OqzugDwJq7LR5sf7DfsN2Ra4D4/7Mj7Sk8kVQ+Ze4SEJu9nxAWr
 zuOtjmoizVRjdYz+IQ1+0hk8/3F2IkCEiA2JrFs51NCRM2ZTqC5Oz6bzK7nbjxIe86
 Z4E0Ot1qLc47QDixlLSWr2EeR9DD9eoLOPKsiB/dE4KOQ+zO2rG8SnFmK9m//xIJyL
 IzO79wsh46l09Bdey5qYnr7xjz6Mp0DFimoh1qGoaQeyaHrOihwNammcKKBbKJDr2d
 Q0l6y+oOFPYo0z0mNu9C0TpATi4L3yAjIbTSVJ2i+uAHpW8cmyS4JrZDGyxB7uj4bb
 KYwCOXGXlc7XA==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id t3so18513225plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Aug 2021 17:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM5307GTunzEk+6SAgv4b1KQOwhooiuHYnq3X1caiZQcLHLq/UQ5XZ
 lDx5dvRwr3AFSvkA/y0DVUAdgSFbQO4/ELhUSV0=
X-Google-Smtp-Source: ABdhPJz5g2UH5l3Gvz6QSJjrySe0RZ6IE4VBgrreB7tp3UOmjppEP2ZS0P89yIPjgFj+aYeVphRC5LeTe/8xavReZBE=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr282732pgj.47.1628554022572;
 Mon, 09 Aug 2021 17:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210806172701.3993843-1-ndesaulniers@google.com>
 <YQ2TGPwjvn8w4rKs@archlinux-ax161>
In-Reply-To: <YQ2TGPwjvn8w4rKs@archlinux-ax161>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Aug 2021 09:06:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Khem Raj <raj.khem@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 7, 2021 at 4:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Aug 06, 2021 at 10:27:01AM -0700, Nick Desaulniers wrote:
> > LLVM_IAS=1 controls enabling clang's integrated assembler via
> > -integrated-as. This was an explicit opt in until we could enable
> > assembler support in Clang for more architecures. Now we have support
> > and CI coverage of LLVM_IAS=1 for all architecures except a few more
> > bugs affecting s390 and powerpc.
>
> The powerpc and s390 folks have been testing with clang, I think they
> should have been on CC for this change (done now).
>
> > This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> > LLVM_IAS=0.  CI systems or developers that were previously doing builds
> > with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> > explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> > opted-in.
> >
> > This finally shortens the command line invocation when cross compiling
> > with LLVM to simply:
> >
> > $ make ARCH=arm64 LLVM=1
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I am still not really sure how I feel about this. I would prefer not to
> break people's builds but I suppose this is inevitabile eventually.
>
> A little support matrix that I drafted up where based on ARCH and clang
> version for LLVM_IAS=1 support:
>
>              | 10.x | 11.x | 12.x | 13.x | 14.x |
> ARCH=arm     |  NO  |  NO  |  NO  |  YES |  YES |
> ARCH=arm64   |  NO  |  YES |  YES |  YES |  YES |
> ARCH=i386    |  YES |  YES |  YES |  YES |  YES |
> ARCH=mips*   |  YES |  YES |  YES |  YES |  YES |
> ARCH=powerpc |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=s390    |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=x86_64  |  NO  |  YES |  YES |  YES |  YES |
>
> The main issue that I have with this change is that all of these
> architectures work fine with CC=clang and their build commands that used
> to work fine will not with this change, as they will have to specify
> LLVM_IAS=0. I think that making this change for LLVM=1 makes sense but
> changing the default for just CC=clang feels like a bit much at this
> point in time. I would love to hear from others on this though, I am not
> going to object much further than this.
>
> Regardless of that concern, this patch does what it says so:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>


Applied to linux-kbuild.
Thanks.


-- 
Best Regards
Masahiro Yamada
