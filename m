Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7062B2A04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 01:39:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXxLR4fz7zDr4t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 11:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Z9oKPZ57; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXxJN0lZlzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 11:37:53 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id h16so4366775pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 16:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2NjKbZuVprfurSTRWSrDJU/we/C3Nu5LpJ6PGwglq8=;
 b=Z9oKPZ575c3gDcwmpE6oh7tqhsVlvfXcKkQMjqIEyhqafJEH0arJjzt6HKxTOeKdIZ
 PJDW9MBWH0bSqoz2543b1j9wEaLcnziidUio4lVlQAKMszkkwEMUmzxaYcN3AIyy4KIJ
 tB7ZVdIpP4PJX3shsLfgYGV7OHoLGHRiPCHK0kSVOt9mIC6i0Wa8bPLJggU+L08ru9PR
 4QiNO+z93vUcvFANoWM8AruWch8OlZsBNAXXetYjh9UXbrkyxyVvTKmvdMkPmvkFkjyI
 gBEAAhWYww7IXW+H5mqqVkkbS0caX87g4Ntp4fPWB/fUaCkE6vxqGz+hfRG4hVvAVhdS
 2pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2NjKbZuVprfurSTRWSrDJU/we/C3Nu5LpJ6PGwglq8=;
 b=dyMuUQ87dUvg0Y2ZlAJXzbuTaLlLCuz5XmqvX5OyGVUl5Y1JV8PqQmL+uRKvCa1xzX
 OleI332wdXgmYaS1ku1e29ATaDk7Ir/lKxugXZu1NX7G0G13tFuP5KCK6shl9E0OUmyj
 MW6leBJ6bVC69P1fzXZq8rgulm5l/hSgW29HkikK/tWTZm7HYdQHUIXyb197RwaDlhrN
 uUFOZw5kQxEKbYMZ9qv8/8Ok/N/VE5U3eFnPNFKoJ/rPIed2lMSLj40CBwOOdJPGmv4p
 mT1dM4A/qayI0I2Ef8GCZjG047oju66VXiYZnrLS1Qc8Nc0K6gmufMduRtzJoIGGHmVe
 OpkQ==
X-Gm-Message-State: AOAM530VGGvaKRL8VG1GatSjmnijyYXvF0so17IFmHXrjxbLc2SGGa54
 KHHtBMFrwJh1vWYwYkDE25sb0wPdo0L8kq6ZVpNZ4Q==
X-Google-Smtp-Source: ABdhPJytitMVpnlRtstqvDugqyzwNtoNHgcEDb1V+JzjIwJS/H4JKIOfdjbk7bK5aRUy7ob8mKVI6yaK4ULDekZMgyo=
X-Received: by 2002:a62:75c6:0:b029:18a:d510:ff60 with SMTP id
 q189-20020a6275c60000b029018ad510ff60mr4179679pfc.35.1605314269534; Fri, 13
 Nov 2020 16:37:49 -0800 (PST)
MIME-Version: 1.0
References: <202011131146.g8dPLQDD-lkp@intel.com>
 <CAFP8O3LpSmxVnjHfQAN455k1ZRg3PbgZYhWr030evCq1T10k=Q@mail.gmail.com>
 <20201113190824.GA1477315@ubuntu-m3-large-x86>
 <CAKwvOdkEtTQhDRFRV_d66FyhQBe536vRbOW=fQjesiHz3dfeBA@mail.gmail.com>
 <20201113200444.GA1496675@ubuntu-m3-large-x86>
 <CAKwvOdkBSGPaKmQY1nERVe4_n19Q=MUtuwdond=FJAAF9N9Zhg@mail.gmail.com>
 <20201114002037.GW2672@gate.crashing.org>
In-Reply-To: <20201114002037.GW2672@gate.crashing.org>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Fri, 13 Nov 2020 16:37:38 -0800
Message-ID: <CAFP8O3+NowYwhMAywd=R23HgOYnroWV9ZRkdyAejd08qsOF=6w@mail.gmail.com>
Subject: Re: Error: invalid switch -me200
To: Alan Modra <amodra@gmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 4:23 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Nov 13, 2020 at 12:14:18PM -0800, Nick Desaulniers wrote:
> > > > > Error: invalid switch -me200
> > > > > Error: unrecognized option -me200
> > > >
> > > > 251 cpu-as-$(CONFIG_E200)   += -Wa,-me200
> > > >
> > > > Are those all broken configs, or is Kconfig messed up such that
> > > > randconfig can select these when it should not?
> > >
> > > Hmmm, looks like this flag does not exist in mainline binutils? There is
> > > a thread in 2010 about this that Segher commented on:
> > >
> > > https://lore.kernel.org/linuxppc-dev/9859E645-954D-4D07-8003-FFCD2391AB6E@kernel.crashing.org/
> > >
> > > Guess this config should be eliminated?
>
> The help text for this config options says that e200 is used in 55xx,
> and there *is* an -me5500 GAS flag (which probably does this same
> thing, too).  But is any of this tested, or useful, or wanted?
>
> Maybe Christophe knows, cc:ed.
>
>
> Segher

CC Alan Modra, a binutils global maintainer.

Alan, can the few -Wa,-m* options deleted from arch/powerpc/Makefile ?
The topic started at
http://lore.kernel.org/r/202011131146.g8dPLQDD-lkp@intel.com and
people would like to get rid of some options (if possible).
