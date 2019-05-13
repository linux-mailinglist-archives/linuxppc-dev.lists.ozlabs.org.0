Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6241B7CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 16:07:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452jM63MdpzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 00:07:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q/HsSNKc"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452jG43DklzDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:03:24 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id i63so13684619ita.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0K1jdRqTpq5tDrpDekYObvydSm3rzMfeKGFkCtyf2M=;
 b=q/HsSNKcCdUmLvEpsJCqo/hbWvJI4lyWG49TCPP3b3L+gOOE0Paf9Qmx/2u7TUJjwl
 VOOHlLIZymsqnFlrL+9E3NH4Eemu36AaukySLP+9pcxfKO+DP8KR/vgp3YPUWQ57sjIG
 UMMT437BHEsmP0tNnbl9Xv+C+tFDTz8pIpX41APF4Ocxh1sTwfzTX3JAUE9bc2yPdQPk
 QZOPZhrQkW5Gu54Qh1wxuSAqi/J7oduLetIm/TkoYykymf/eJcp5Y9+f6bXBkbZGEKVW
 ZMfa6zqH7QazGyHFM7wT9f6Ve6i6PCVZaYRYs0wpJXAU/Yzw7SLTAs4QVg8BzcBaXuG1
 0x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0K1jdRqTpq5tDrpDekYObvydSm3rzMfeKGFkCtyf2M=;
 b=JF2YD2KX7khZ+fPWx3KDWKE1TZzC4+Udl8D7+HWiOqI01WAQzrMOwZXDvhfu3uUjYR
 M5ujPMkhKWHhssyZ6/rplSGUXYKtIrSwG5XY3UdimddDxV+ztJCjTCzlN++sGH1Z0Nin
 XpjNt1cLPXjLV6cNA7XUFIXlnfs9Aakwlumd/ZGbL8N7U6sLjfAsaHjYl1kddJRMaROs
 ZEeoxbDFARoYzePIRA4roz5R0gueRRo5HpJipdn0nzIeoNkiqblO9Q6zVivii7Xb4rod
 A6V8eeudWvMeT+h+R0Aa6W3bl3G5kTwj92ZEbwSmhW7tKTONMEitHMbAH2R1gx4n1zkt
 QvGQ==
X-Gm-Message-State: APjAAAWmql+DnrIIJmSOZjtGoET6K/kfFUcPCivVepvS5uaDEJKVtMdi
 OcQLKHxW6V8565Eqcv/xYkeMTaAEsq4qgTY0GYs=
X-Google-Smtp-Source: APXvYqyFUYOaKp/BwZkd9IwhAZafexR5iBDf2i/HPirvmIJEVvzAwxsNHaQ73Ig2B5P0Sn3pdeM3/SV2YHd0taZhFAc=
X-Received: by 2002:a24:d45:: with SMTP id 66mr19242619itx.9.1557756201465;
 Mon, 13 May 2019 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112254.22534-1-yamada.masahiro@socionext.com>
 <CAK7LNAQjukukcfz9-SyFhqZOZ1v18CJDVA8Zmn5RL92Q=73ZxA@mail.gmail.com>
In-Reply-To: <CAK7LNAQjukukcfz9-SyFhqZOZ1v18CJDVA8Zmn5RL92Q=73ZxA@mail.gmail.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 14 May 2019 00:03:10 +1000
Message-ID: <CAOSf1CHJ1iAdJjGA+2xFmNFLen4WJ_-468tqTSnod7C=LWUq9Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: fix broken way to pass CONFIG options
To: Masahiro Yamada <yamada.masahiro@socionext.com>
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
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 11:56 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Mon, May 13, 2019 at 9:33 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> > was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> > with -j 1") was also wrong.
> >
> > Check-in source files never ever depend on build artifacts.
> >
> > The correct dependency is:
> >
> >   $(obj)/serial.o: $(obj)/autoconf.h
> >
> > However, copying autoconf.h to arch/power/boot/ is questionable
> > in the first place.
> >
> > arch/powerpc/Makefile adopted multiple ways to pass CONFIG options.
> >
> > arch/powerpc/boot/decompress.c references CONFIG_KERNEL_GZIP and
> > CONFIG_KERNEL_XZ, which are passed via the command line.
> >
> > arch/powerpc/boot/serial.c includes the copied autoconf.h to
> > reference a couple of CONFIG options.
> >
> > Do not do this.
> >
> > We should have already learned that including autoconf.h from each
> > source file is really fragile.
> >
> > In fact, it is already broken.
> >
> > arch/powerpc/boot/ppc_asm.h references CONFIG_PPC_8xx, but
> > arch/powerpc/boot/utils.S is not given any way to access CONFIG
> > options. So, CONFIG_PPC_8xx is never defined here.
> >
> > Just pass $(LINUXINCLUDE) and remove all broken code.
> >
> > I also removed the -traditional flag to make include/linux/kconfig.h
> > work. I do not understand why it needs to imitate the behavior of
> > pre-standard C preprocessors.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
>
> I re-read my commit log, and I thought it was needlessly
> too offensive. Sorry about that.
>
> I will reword the commit log and send v2.
>

No worries. We know the bootwrapper is... not great.

>
>
>
> --
> Best Regards
> Masahiro Yamada
