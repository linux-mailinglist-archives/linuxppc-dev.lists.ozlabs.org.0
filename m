Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B11F0056
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 21:15:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dsmh6jg5zDr0l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 05:15:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=bVtxxK21; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dsc33Sd0zDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 05:07:59 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id x22so6462519lfd.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcezGontWez8pNBdgQEac8VyYkNUk3H4r/f/qgUnO2g=;
 b=bVtxxK21u8dFZ9y31drF87QSfC9BKTKsr0QMyL11UqoPm2rvFF7BO1to+YkhbH9K8w
 FAPjZj+mG/ocCBLoRw2vDGFIpRTeL5h7SNors+NuUGyYuGvDUO6BWjXJVACFmpJqoK0t
 HOXqsiJN6v4QGn38rZPSZWveRUy/PbCeGcbzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcezGontWez8pNBdgQEac8VyYkNUk3H4r/f/qgUnO2g=;
 b=iS2I951ckcqjS4YMeysSEIXluzzI9r4lP64o5onmGw22XBCGay+FDBY4927BNYbugb
 DQCIqQ/kT4zrl4WL+Fn9LXqcE7B7kqUM2aBmSoliLDIpwQLafF8BWwwSu7JRviQXBwuk
 idM3Tg/hEv2Vmy2aa+nso921ybHlHnjcMvgyvzh//kUWdHGrmHN9k+QXEMmXB4eYZbK/
 TF0KegORxMolmHSN7XbGJhXC/jOpyuJqjHMePJ4FTqm8K2PO+JbCfKB5KnWab0UPoalk
 FBpk+qo7PDCJZ/iXYPcS57UkEdCWDG2LGidZHtw8iDBi17neUeEd3zRurqY1uSHBwID8
 RjlQ==
X-Gm-Message-State: AOAM531ZJqRmnr0i3s6v9qLVWXqvhtuXNnxiYZqgHku4WP5+6/uqkaS3
 lxnZHkkr4//QuEWlEqO1ORt6NxysM7I=
X-Google-Smtp-Source: ABdhPJyz2dPzG44ACUembDNJpFvO0qZIVp86dEkoC5J4KjmE6t+E//POF2slcwahlZKlwle973yCjg==
X-Received: by 2002:ac2:5cac:: with SMTP id e12mr6161627lfq.92.1591384075230; 
 Fri, 05 Jun 2020 12:07:55 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id t19sm1297890lft.47.2020.06.05.12.07.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 12:07:55 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id c17so13021495lji.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 12:07:54 -0700 (PDT)
X-Received: by 2002:a05:651c:2c6:: with SMTP id
 f6mr5235749ljo.371.1591383681430; 
 Fri, 05 Jun 2020 12:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <87eeqth3hi.fsf@mpe.ellerman.id.au>
In-Reply-To: <87eeqth3hi.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Jun 2020 12:01:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5vSwYqF=YiKOOGBHE=hCwnes_ndbP4QOyjPK_Xocz7w@mail.gmail.com>
Message-ID: <CAHk-=wh5vSwYqF=YiKOOGBHE=hCwnes_ndbP4QOyjPK_Xocz7w@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-1 tag
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
Cc: ego@linux.vnet.ibm.com, emmanuel.nicolet@gmail.com, chenzhou10@huawei.com,
 jniethe5@gmail.com, linuxram@us.ibm.com, kernelfans@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, st5pub@yandex.ru,
 Oliver O'Halloran <oohall@gmail.com>, huhai@tj.kylinos.cn,
 Markus Elfring <elfring@users.sourceforge.net>, rzinsly@linux.ibm.com,
 leobras.c@gmail.com, mikey@neuling.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, haren@linux.ibm.com,
 michal.simek@xilinx.com, mahesh@linux.ibm.com, Takashi Iwai <tiwai@suse.de>,
 kjain@linux.ibm.com, leonardo@linux.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, ajd@linux.ibm.com,
 Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 alistair@popple.id.au, Nick Piggin <npiggin@gmail.com>,
 wangxiongfeng2@huawei.com, Qian Cai <cai@lca.pw>, clg@kaod.org,
 Nathan Chancellor <natechancellor@gmail.com>, hbathini@linux.ibm.com,
 Christophe Leroy <christophe.leroy@c-s.fr>, geoff@infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, wsa@kernel.org,
 sbobroff@linux.ibm.com, fbarrat@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020 at 9:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> I've pushed the result of my resolution of the conflicts to the powerpc/merge
> branch, if you want to look at that, though I've also tried to describe it in
> full below.

I ended up doing the machine_check_exception() differently, because I
felt the code itself was done wrong and I wanted to add a note about
that.

Having the same function have completely different semantics depending
on a platform issue is just fundamentally wrong, and makes not just
for fragile code, but also means that you can't do single image
kernels.

It should be two different functions, possibly just

   non_nmi_fn() { ... }

   nmi_fn() { nmi_enter(); non_nmi_fn(); nmi_exit(); }

and now you don't have odd rules for the same function that depends on
how the platform happens to call it.

I didn't do the above. I did something that looked like the old code,
but had a comment. Oh well.

But thanks for describing the merge, I'd have missed the place where
there was a new use of pgd_oiffset().

..and then when I actually compared whether I otherwise got the same
result as you, I realized that this all depends on the module tree.

I'll go merge that first, and then re-do this all. Oh well.

               Linus
