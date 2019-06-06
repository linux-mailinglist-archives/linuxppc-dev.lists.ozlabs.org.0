Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0C36F5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 11:02:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KKRm4Hr6zDqbG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.82; helo=conssluserg-03.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="HkBsTD/3"; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KKQ22Px8zDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 19:00:56 +1000 (AEST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x5690cqk014240
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 18:00:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x5690cqk014240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559811639;
 bh=TBwtdfm16uGyBAXSj/TNuY/KhFKFlouLYXyh5UH4Y40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HkBsTD/3/zEHkWM6YjcHqGb3w+fG6fM/QTrm8zVmkTQpS1uP/MX8uLFAGaH5BRBqv
 479JGjYak62hFetyOPDQKAXzjOkjlaDAIESCVNCAG/6/5ATZ8lo4HucdAx1gg4tW5z
 oB8bnEaOnSMxHw022av+Rw68BLpsvbUB1ogH+4VbyUgwvHl4tBbaSTLcf7fpIQCmYw
 PovOIeyN3vwVrOboM1cY1LI+PrvHYGsF9Wx0CWHwSo4SwF2wso91scl9pbAYDsdwto
 vlwEzBk44PI6PRHnvYTqHOG26jLy4127V8xryRcN+BzyjYMz/tipekIl2nJWMjDq4k
 zl4mDgNCMa+ZQ==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id g24so754222vso.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 02:00:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXhI50aRZxnDhVVoUx8lzVGPfy/S0VjrcrXzwETu9lwxUYEt6Ur
 RmxHXw2Vv56PnQ1pKGahs+N7W54i8eJAkBGzc+E=
X-Google-Smtp-Source: APXvYqwb6RbzmXpl729o6DP9QlUu6snm+nAvBpVaX/mpqeH8Au7h14UR5ZfnVhlceWVEmWYfPAR6PjkdLjEHX/TcxMU=
X-Received: by 2002:a67:ed04:: with SMTP id l4mr6217862vsp.179.1559811638421; 
 Thu, 06 Jun 2019 02:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111632.22479-1-yamada.masahiro@socionext.com>
 <90aa6d91-7592-17b0-17fd-e33676bd0a46@linux.ibm.com>
 <CAK7LNASV9Chjd+o3+2ZbA0WHu=dVBFf2AC1dT=eLSf3_2pe12Q@mail.gmail.com>
 <ab22b27e-dd07-1c83-af60-19403c98c6a2@linux.ibm.com>
In-Reply-To: <ab22b27e-dd07-1c83-af60-19403c98c6a2@linux.ibm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 6 Jun 2019 18:00:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2eurVdK=uu=ysExjpbXPY+SaPatad-SGv8T4JfDmXew@mail.gmail.com>
Message-ID: <CAK7LNAQ2eurVdK=uu=ysExjpbXPY+SaPatad-SGv8T4JfDmXew@mail.gmail.com>
Subject: Re: [PATCH] ocxl: do not use C++ style comments in uapi header
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
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
 Joe Perches <joe@perches.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, Jun 5, 2019 at 3:18 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
>
> On 4/6/19 10:12 pm, Masahiro Yamada wrote:
> > On Tue, Jun 4, 2019 at 8:54 PM Frederic Barrat <fbarrat@linux.ibm.com> =
wrote:
> >>
> >>
> >>
> >> Le 04/06/2019 =C3=A0 13:16, Masahiro Yamada a =C3=A9crit :
> >>> Linux kernel tolerates C++ style comments these days. Actually, the
> >>> SPDX License tags for .c files start with //.
> >>>
> >>> On the other hand, uapi headers are written in more strict C, where
> >>> the C++ comment style is forbidden.
> >>>
> >>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> ---
> >>
> >> Thanks!
> >> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> >>
> >
> > Please hold on this patch until
> > we get consensus about the C++ comment style.
> >
> > Discussion just started here:
> > https://lore.kernel.org/patchwork/patch/1083801/
>
> If you choose to proceed with this patch:
>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

After some discussion,
the other one was applied to the media subsystem.

Please pick up this one with Frederic and Andrew's Ack.

Thanks.



--=20
Best Regards
Masahiro Yamada
