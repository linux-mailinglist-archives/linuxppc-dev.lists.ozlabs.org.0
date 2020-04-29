Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A121BDAAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:31:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxDD3N55zDr39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bx9108ChzDqym
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:28:34 +1000 (AEST)
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5fUw-1jWX6S118k-007GOX for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr
 2020 13:28:30 +0200
Received: by mail-qt1-f181.google.com with SMTP id v26so1500511qto.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 04:28:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuYfF8GbgkxoSCr4LAZTtEV8BVtjrjRC4cvlYevGxlturyssFsns
 +biNyAh+c7z3kOoepzqGrBHU1CaBM3Wwve2E0L8=
X-Google-Smtp-Source: APiQypIa6TSw8+yjWo4LgdZcN78VVZq03VH3fd8N9jMLAVbifbgVTqRdEAU1CxrmrW/DkCSQUjz/sA0LJeq7jFPcccQ=
X-Received: by 2002:ac8:2bce:: with SMTP id n14mr33266506qtn.18.1588159707900; 
 Wed, 29 Apr 2020 04:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200428074827.GA19846@lst.de>
 <20200428195645.1365019-1-arnd@arndb.de>
 <20200429064458.GA31717@lst.de>
 <CAK8P3a1YD3RitSLLRsM+e+LwAxg+NS6F071B4zokwEpiL0WvrA@mail.gmail.com>
 <20200429094201.GA2557@lst.de>
In-Reply-To: <20200429094201.GA2557@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 13:28:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1+DU+juB_SxAAK6WAMHwi7vGQS7T_Yw0Gvo4P4M8jggg@mail.gmail.com>
Message-ID: <CAK8P3a1+DU+juB_SxAAK6WAMHwi7vGQS7T_Yw0Gvo4P4M8jggg@mail.gmail.com>
Subject: Re: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wovUTY3pIsNhYt2wvF9f87FvshLmnTC06fC2EvhgLL0GqdegauS
 LLUXS02SzScm5pY+QRTui3OGG5uo0JEcnz4ZLgWQj3/ufB/UFnzC5k2+wvpQBCXpcRx25XB
 mZG9bzakFHEnOpmqff4mZiFr1RoCWj5+wIfiq2xy0kBmS9X6tBaEwQ9MCO4PZ2/X9ZL+HrL
 Om/b4oKm8wa/t+J1T+Wyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vJFa7wj/FgU=:+oInqfUNeQZ/ROfFmYSvDa
 jMSYRDqlavn2ig8An1cwz/MWvpXs4wEiyV1xa8q7/mDMQ83c1Onm+Bh5DofO7wnkVgLlGnq+V
 /0aEy59nty4aMdE/2nU7I/pHC5bFILN/aplyXUrbX5/UcKkh1ud/GhqaUWdm3XkQNvANCyhNY
 LTRFW4jm6BwZXmyIE7KpPRad83ef7b8DlzZp0vcTAs44PbhyAfkKkTSNvVeB8utnFJ6MuQpot
 9Hc76a4+XXKZg26kUWJT+2qnc++WKFTAVCiHvZjXJrxWausN+eV2zFTaUKqUu1au3RicHrhTL
 hCauyOpLqelaz5uE1IRUOhR4c/ZVdHwyCkgJEnOuMOFzxDIqDKo4O3boSlSxsCq453KLKbAw4
 NbL7tI27GkXprZeQW/bHWojWfKOBEF3HWZEYl+Dl7JqHyXruJNmu1lMbfhIbvXfPCTvOnTIKH
 fPCc3gsLNVpwIdo/jXjjOX1kOxdbMgsXHywoK+jn6OWMd0L+4fPsYe1PzC/x3i4B54bMkHsTU
 LgmQDkmt8KuThqkhhutxlmiIL5KTFit6YTnOZLPjAFxlPaQscpObGryrkfxhJRJoZWWs1R9g/
 1Zvyj00ed/nc2g31ABp0gTwifX6y+c78KEiB82/JpYJDWg+uZLqa9inqW/azdR3qfcG8ed2SU
 L335UOSyjO48VgeamcgAtE44xjt7ezZRw3wOPAjiKGBLI7tSjKt47aeTCxrYoi8K8UJxEecp+
 uOUp/bR4wxozasCYl1aQBsnV0WyNIXVXe37QBTz75CH+xQF1YpwE8YehFm017mk4j+5Sx5iYu
 ZwWZV/7BhcjEPnF/0qRtlfaPVTYa1nUvZjk0DY8Xnw9KpvU/f8=
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
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 11:42 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Apr 29, 2020 at 10:07:11AM +0200, Arnd Bergmann wrote:
> > > What do you think of this version?  This one always overrides
> > > copy_siginfo_to_user32 for the x86 compat case to keep the churn down,
> > > and improves the copy_siginfo_to_external32 documentation a bit.
> >
> > Looks good to me. I preferred checking for X32 explicitly (so we can
> > find and kill off the #ifdef if we ever remove X32 for good), but there is
> > little difference in the end.
>
> Is there any realistic chance we'll get rid of x32?

When we discussed it last year, there were a couple of users that replied
saying they actively use it for a full system, and some others said they run
specific programs built as x32 as it results in much faster (10% to 20%)
execution of the same binaries compared to either i686 or x86_64.

I expect both of these to get less common over time as stuff bitrots
and more of the workloads that benefit most from the higher
performance (cross-compilers, hpc) run out of virtual address space.
Debian popcon numbers are too small to be reliable but they do show
a trend at https://popcon.debian.org/stat/sub-x32.png

I would just ask again every few years, and eventually we'll decide
it's not worth keeping any more. I do expect most 32-bit machines
to stop getting kernel updates before 2030 and we can probably
remove a bunch of architectures including x32 before then, though
at least armv7 users will have to get kernel updates for substantially
longer.

      Arnd
