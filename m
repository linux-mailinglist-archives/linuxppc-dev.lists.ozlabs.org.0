Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A5603BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 12:01:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g9Nt1Ks1zDqd3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 20:01:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.90; helo=conssluserg-05.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="drq8MaMb"; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g9M05KRKzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 20:00:10 +1000 (AEST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x659xmLi010239
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Jul 2019 18:59:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x659xmLi010239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1562320788;
 bh=7vo4tVVjFp2kF3CCv5uSappoveKorG1+DyG5PCqC1mo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=drq8MaMbdGESVV4jgCedEiZm6fgkjP+o5bmM0K9cOYi9ZwIVTd+iZfK2wFELQfdFC
 3WQ9Y8bSjaL3K4DNSYE6U+9pH49/yvNX4Wc5fFfUeFsnUexvpwQ/4XvMLvMduoD3QJ
 80IumNwsZg1SARySsPtcLCMlEsm6IYzLRHDS8Or9zOxzUtHowKUe235BAQ9JnhmB4y
 dq+fUaULEbCGZx5p6TgacoqjHJQfOVua4lVbFd6Vcohdo9tK5QaBp9SuyiU+Ybatqg
 31zCY2tAq3x8JrUrvXukE1b3C3R67GWUjZ2MwW5aBdZst2q4mn4Mim98GGVKVYkgRS
 Vr/OBAbNQlICw==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id j26so3487342vsn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 02:59:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWvKpuh9RHBWbnPEV2knRezUD2AB/JPrpwXsz5xX7ofLbkVM+XS
 MHEFnrTHvpEClZagss5IuIqDmV+ujym+Hs9KTrk=
X-Google-Smtp-Source: APXvYqw/AUFCUUd5jXpPkprJCwIFt7JAmja2F/erzSFp296eLvhPJ66gWzHHWXgUX0GCg6HvO6LlFAxsNEuazgKizc0=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr1635301vsq.179.1562320787446; 
 Fri, 05 Jul 2019 02:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
 <87v9wibq5z.fsf@concordia.ellerman.id.au>
In-Reply-To: <87v9wibq5z.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jul 2019 18:59:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNASK=z68pqPcPw8OGM1Y9SGSHOAMDygsbmNvOW1oOsQFRA@mail.gmail.com>
Message-ID: <CAK7LNASK=z68pqPcPw8OGM1Y9SGSHOAMDygsbmNvOW1oOsQFRA@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/boot: pass CONFIG options in a simpler and
 more robust way
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
Cc: Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 4, 2019 at 9:26 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
> > Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> > was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> > with -j 1") was also wrong.
> >
> > The correct dependency is:
> >
> >   $(obj)/serial.o: $(obj)/autoconf.h
> >
> > However, I do not see the reason why we need to copy autoconf.h to
> > arch/power/boot/. Nor do I see consistency in the way of passing
> > CONFIG options.
> >
> > decompress.c references CONFIG_KERNEL_GZIP and CONFIG_KERNEL_XZ, which
> > are passed via the command line.
> >
> > serial.c includes autoconf.h to reference a couple of CONFIG options,
> > but this is fragile because we often forget to include "autoconf.h"
> > from source files.
> >
> > In fact, it is already broken.
> >
> > ppc_asm.h references CONFIG_PPC_8xx, but utils.S is not given any way
> > to access CONFIG options. So, CONFIG_PPC_8xx is never defined here.
> >
> > Pass $(LINUXINCLUDE) to make sure CONFIG options are accessible from
> > all .c and .S files in arch/powerpc/boot/.
>
> This breaks our skiroot_defconfig, I don't know why yet:
>
>   In file included from /kisskb/src/arch/powerpc/boot/../../../lib/decompress_unxz.c:236:0,
>                    from /kisskb/src/arch/powerpc/boot/decompress.c:42:
>   /kisskb/src/arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c: In function 'bcj_powerpc':
>   /kisskb/src/arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c:166:11: warning: implicit declaration of function 'get_unaligned_be32' [-Wimplicit-function-declaration]
>      instr = get_unaligned_be32(buf + i);


OK, now I see the cause of the error.

I will insert a new patch in v3.

Thanks.


>
> http://kisskb.ellerman.id.au/kisskb/buildresult/13862914/
>
> cheers



-- 
Best Regards
Masahiro Yamada
