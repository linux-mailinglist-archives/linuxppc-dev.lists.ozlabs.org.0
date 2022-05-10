Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF345521A5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 15:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyKLz51gvz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 23:55:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=UauZq89L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=UauZq89L; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyKLM1DBwz3bYF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:55:22 +1000 (AEST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 24ADsq3H007243
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:54:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 24ADsq3H007243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652190892;
 bh=GhyJd382a/wS1zL1PdRPTSc5dz0OmScabiVrpCKaIOA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UauZq89LrkM/cBmL1IrYEN9SfUuhjvaGe24+hHUTCr6S1DeVhg6gB6xE3NmQVWVBj
 6DbqE9knamXjVI5te5FZFczDJTT7rQh6QEpZGNweYCbuimKgjSP/aGE47BFaaWV7QP
 nWQxXCsVVeDV23zU0WTiLibA+WIGOjBJTHCjF4SPElVzM4LAreMHLGulclrOMvYw5E
 qm1qnxBibkRLJhddDsUy2bW1mf7U3O4hZWjTWyZEgCdTAJ2UZWyhO6iXkwbD01KF5z
 Z5XKrZ5vubGXCeK8VoNsMtnTLZZswrdolQP0koNBf4Nj8MTqic3HFt8425yBdlzD20
 yW/2Fl9yu/nuQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso2120230pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:54:52 -0700 (PDT)
X-Gm-Message-State: AOAM5326sia/UMxw3gXd88Tr1UpfIfYWvMFI+B10ZEhTrJsCeoEfMF3D
 2Pk+3DjOSsDqOOMBBmAt7dFetM7MXoHseuFB/zI=
X-Google-Smtp-Source: ABdhPJzh5Xg40qnHgjRxAy+2yZ4xm+X8+in8r4zEytwaErju3Iipi+xTG2cJwA+7X0E5U7wpLUUa0KgN+U0NnVHMv0g=
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr21001207pll.136.1652190891612; Tue, 10
 May 2022 06:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-11-masahiroy@kernel.org>
 <CAKwvOdkhcJB8Bnrt51siRefWe+ZSvHagCs2G011PzkkrD3cxQw@mail.gmail.com>
In-Reply-To: <CAKwvOdkhcJB8Bnrt51siRefWe+ZSvHagCs2G011PzkkrD3cxQw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 May 2022 22:53:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMaW34NP+=0UF=aJ=Z7h0QSuzV2F1QjYjru9nFooG9tQ@mail.gmail.com>
Message-ID: <CAK7LNATMaW34NP+=0UF=aJ=Z7h0QSuzV2F1QjYjru9nFooG9tQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 3:05 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > diff --git a/scripts/check-local-export b/scripts/check-local-export
> > new file mode 100755
> > index 000000000000..d1721fa63057
> > --- /dev/null
> > +++ b/scripts/check-local-export
> > @@ -0,0 +1,48 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Copyright (C) 2022 Masahiro Yamada
> > +
> > +set -e
> > +set -o pipefail
> > +
> > +declare -A symbol_types
> > +declare -a export_symbols
> > +
> > +exit_code=0
> > +
> > +while read value type name
> > +do
> > +       # to avoid error for clang LTO; $name may be empty
> > +       if [[ $value = -* && -z $name ]]; then
> > +               continue
> > +       fi
> > +
> > +       # The first field (value) may be empty. If so, fix it up.
> > +       if [[ -z $name ]]; then
> > +          name=${type}
> > +          type=${value}
> > +       fi
>
> Consider adding examples of output from NM as comments where you're
> handling special cases.
>
> Aren't BOTH from LTO?  The first case is:
>
> ---------------- T strncpy


For LTO, I see

---------------- t

in the llvm-nm output.



>
> while the second is
>
>                  U strncpy

Right, this happens for all unresolved symbols.
The address part is empty.


I will add the output example in the comment block.





> IIUC?
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkhcJB8Bnrt51siRefWe%2BZSvHagCs2G011PzkkrD3cxQw%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
