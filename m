Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6823465E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 14:15:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J9pt6gbMzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 22:15:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="m3lilr1b"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J9n96qz0zDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 22:13:33 +1000 (AEST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x54CDEHc015990
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 21:13:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x54CDEHc015990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559650395;
 bh=j4ooK2TXA9XEPYH9036qD0m6269InPrHu8MiGbjtEI8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m3lilr1biUthCuT3Fwb+7h7x3OjfKAVGp2bE9jsxFdz480cpK4zWyzWgX0dKePLGR
 mZgdShIwhX49q0ci93vDu4QMpb3zu1PBaoyEXspH1/tGh9Yz05fmjmiw+H54h3mvG9
 CE27QOl3GpPGUyGx+EyypLmb9OnDengqyh6NLeeKlWpSL8p0ZCExPOJnWOY93Eb+eC
 xIBTysqsJhGAJnIDOBGDroEPy+9ky7qW+3FlZs0wDfGb/P/BHjgju6X+QjLBL1Fu5n
 c6EHM0wI2SdESGglwNFIbv6slL+rSBQrDZt2ch3jhU1JHtuRD1pOtBlpkeOLQ1L8Ya
 W12YaCpqjT5DQ==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id p5so1959675uar.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 05:13:15 -0700 (PDT)
X-Gm-Message-State: APjAAAXcB/rKRtHO4hlX4EP8jtv6vsp3znNcqQaMZXBNY9OZPoWhKU0l
 CwzU850Ki+JOiQvfDhh6/wWm3ghErSvz2IvWNHI=
X-Google-Smtp-Source: APXvYqz4S65tSxS052C5ndvPnTtlUmiHYxC0T11Z+OAFLZHKhv7vZjxFm8n9N1K3MCaX2SBo2i2B1jVPvSDV1C8QIe0=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr392723uaf.95.1559650393956;
 Tue, 04 Jun 2019 05:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111632.22479-1-yamada.masahiro@socionext.com>
 <90aa6d91-7592-17b0-17fd-e33676bd0a46@linux.ibm.com>
In-Reply-To: <90aa6d91-7592-17b0-17fd-e33676bd0a46@linux.ibm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Jun 2019 21:12:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASV9Chjd+o3+2ZbA0WHu=dVBFf2AC1dT=eLSf3_2pe12Q@mail.gmail.com>
Message-ID: <CAK7LNASV9Chjd+o3+2ZbA0WHu=dVBFf2AC1dT=eLSf3_2pe12Q@mail.gmail.com>
Subject: Re: [PATCH] ocxl: do not use C++ style comments in uapi header
To: Frederic Barrat <fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 8:54 PM Frederic Barrat <fbarrat@linux.ibm.com> wrot=
e:
>
>
>
> Le 04/06/2019 =C3=A0 13:16, Masahiro Yamada a =C3=A9crit :
> > Linux kernel tolerates C++ style comments these days. Actually, the
> > SPDX License tags for .c files start with //.
> >
> > On the other hand, uapi headers are written in more strict C, where
> > the C++ comment style is forbidden.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> Thanks!
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
>

Please hold on this patch until
we get consensus about the C++ comment style.

Discussion just started here:
https://lore.kernel.org/patchwork/patch/1083801/


--=20
Best Regards
Masahiro Yamada
