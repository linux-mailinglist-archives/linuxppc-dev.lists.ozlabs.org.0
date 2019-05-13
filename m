Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C0D1B791
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 15:58:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452j8S03YvzDq75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 23:58:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.82; helo=conssluserg-03.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="A2NezLU4"; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452j630Pp6zDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 23:56:26 +1000 (AEST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x4DDtr5N017776
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 22:55:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4DDtr5N017776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557755754;
 bh=GKa0/XhA2V5agnSr1M250vRxQ9JoLrHwFQTBlihVHZw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A2NezLU4rB7LoX8IMRZd2m4BP0V8uI1kRfoMdC14R5xIeo5PitG+FrU3NdRQpOew4
 9RqK5eITEAmv+/ekZOiGVA0u+P6qg981h6T0XX2IE8gouF/9FwkHPmGINxhW9RRi59
 8igcdRh/1CeXnNQnvTZQ4/QaowmQnDTh53o/AWkwePAnoB2U+ffQsC5O9+pvTkc4M7
 x0ztU8EE9u1u2/cfVZUSUgtYAbI1uFcglHX1ulypEwr+I19g0eaVb6iSEzqvyEwZ+g
 yD9veq4FAbafhgsFs1ViB7ZA2PmtdubjqjrVg+H1AD4aC0a8cLyYrcbE6IUjhrq/ox
 5vxIOpiqNB1Ow==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id o5so1764338vsq.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 06:55:54 -0700 (PDT)
X-Gm-Message-State: APjAAAW+bEhaAXebDBYvvJDOT9aGe8fe3et1IwEeN/2h5ew4qq0y8Ymy
 fI/kZqTwKeYGcea9OubhYCU5N59NsChlTzf5B3Q=
X-Google-Smtp-Source: APXvYqxIyOecTEYmuZ9dJbhMFII02Kz7kZc+p8l16ixv3t6b/99y+iYBwzuOVT/a/uU4pr8i+3oANjnFqABcTGA/Q6Y=
X-Received: by 2002:a67:f443:: with SMTP id r3mr13613203vsn.179.1557755753123; 
 Mon, 13 May 2019 06:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112254.22534-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190513112254.22534-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 22:55:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQjukukcfz9-SyFhqZOZ1v18CJDVA8Zmn5RL92Q=73ZxA@mail.gmail.com>
Message-ID: <CAK7LNAQjukukcfz9-SyFhqZOZ1v18CJDVA8Zmn5RL92Q=73ZxA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: fix broken way to pass CONFIG options
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
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
 "Rodrigo R. Galvao" <rosattig@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 9:33 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> with -j 1") was also wrong.
>
> Check-in source files never ever depend on build artifacts.
>
> The correct dependency is:
>
>   $(obj)/serial.o: $(obj)/autoconf.h
>
> However, copying autoconf.h to arch/power/boot/ is questionable
> in the first place.
>
> arch/powerpc/Makefile adopted multiple ways to pass CONFIG options.
>
> arch/powerpc/boot/decompress.c references CONFIG_KERNEL_GZIP and
> CONFIG_KERNEL_XZ, which are passed via the command line.
>
> arch/powerpc/boot/serial.c includes the copied autoconf.h to
> reference a couple of CONFIG options.
>
> Do not do this.
>
> We should have already learned that including autoconf.h from each
> source file is really fragile.
>
> In fact, it is already broken.
>
> arch/powerpc/boot/ppc_asm.h references CONFIG_PPC_8xx, but
> arch/powerpc/boot/utils.S is not given any way to access CONFIG
> options. So, CONFIG_PPC_8xx is never defined here.
>
> Just pass $(LINUXINCLUDE) and remove all broken code.
>
> I also removed the -traditional flag to make include/linux/kconfig.h
> work. I do not understand why it needs to imitate the behavior of
> pre-standard C preprocessors.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


I re-read my commit log, and I thought it was needlessly
too offensive. Sorry about that.

I will reword the commit log and send v2.




-- 
Best Regards
Masahiro Yamada
