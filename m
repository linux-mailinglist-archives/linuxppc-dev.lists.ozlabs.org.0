Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91D270D24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 12:39:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtnJL0gN5zDqpR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=MhdAd/ZH; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtnGk4JdyzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 20:38:06 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id e23so7825212otk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=MhdAd/ZHaFK/DWpIGeCJTSrL4TspZA8urGXmqj7eu+tNyozMPj8lsNoIYGKFEkHH3i
 tz5kIr/iJffDO0Nt2pDPL1zyk3OacLo0mtMS/oIiThW5ZZklv3HS4ydmHDNHz/bb5JWz
 njvA7YA9+16uPDZnqoPhv6tTBSjVAYTx0v+gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=kQl+6GaUADBM0LTCiH9dem0uCD5NSWiz0DgkLlBV859IvKK1S4dd6dcgrAnfsUvhP1
 Wcw09nqxj5RSy2YgQvjj85Zy6uSZ4UM2hRIREMjt8Um+NvTXFxEGEW9n+oy51K8E/7BP
 gnsXJcWM6M9iS2598QQSFn8rXLMNHdmgUiWSv+2vqU+i1n0pN3vFSKmd+ngMuYEc4pWN
 89CuDqTsG07I39kc6GFGtECrA6Nd2gO3L68YUj7aLbWlqOMK05nHAFGLZnqbCs1xsadl
 AyFZWAw9HMhk4vvPaJJQOgiXiRkvV+xIYyVe/F2XjfubX8envKyQkce0eN5yLuANodd6
 Er9Q==
X-Gm-Message-State: AOAM5309UbupKGG56B2hDGn/CelbsylQ+8N4oiZEAt4oh4GKvZ0p0M2M
 cO6rUykYB+N945KnpwgxXe9vZLvaJhVz9Y0sNhs8Jg==
X-Google-Smtp-Source: ABdhPJx5xVWJo6i2zNxAj54jCqUfintQtxPDT+BaBMGgav4MX+Ax0tqlV2axmkJLRRkUUHGKVrFmThuU1Fd1j9Iveeo=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr27032226otq.188.1600511884193; 
 Sat, 19 Sep 2020 03:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 19 Sep 2020 12:37:53 +0200
Message-ID: <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Sep 19, 2020 at 11:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > First of all, sorry for the horribly big Cc list!
> >
> > Following up to the discussion in:
> >
> >   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de
> >
> > this provides a preemptible variant of kmap_atomic & related
> > interfaces. This is achieved by:
> >
> >  - Consolidating all kmap atomic implementations in generic code
> >
> >  - Switching from per CPU storage of the kmap index to a per task storage
> >
> >  - Adding a pteval array to the per task storage which contains the ptevals
> >    of the currently active temporary kmaps
> >
> >  - Adding context switch code which checks whether the outgoing or the
> >    incoming task has active temporary kmaps. If so, the outgoing task's
> >    kmaps are removed and the incoming task's kmaps are restored.
> >
> >  - Adding new interfaces k[un]map_temporary*() which are not disabling
> >    preemption and can be called from any context (except NMI).
> >
> >    Contrary to kmap() which provides preemptible and "persistant" mappings,
> >    these interfaces are meant to replace the temporary mappings provided by
> >    kmap_atomic*() today.
> >
> > This allows to get rid of conditional mapping choices and allows to have
> > preemptible short term mappings on 64bit which are today enforced to be
> > non-preemptible due to the highmem constraints. It clearly puts overhead on
> > the highmem users, but highmem is slow anyway.
> >
> > This is not a wholesale conversion which makes kmap_atomic magically
> > preemptible because there might be usage sites which rely on the implicit
> > preempt disable. So this needs to be done on a case by case basis and the
> > call sites converted to kmap_temporary.
> >
> > Note, that this is only lightly tested on X86 and completely untested on
> > all other architectures.
> >
> > The lot is also available from
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem
>
> I think it should be the case, but I want to double check: Will
> copy_*_user be allowed within a kmap_temporary section? This would
> allow us to ditch an absolute pile of slowpaths.

(coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
page fault you get a short read/write. This looks like it would remove
the need to handle these in a slowpath, since page faults can now be
served in this new kmap_temporary sections. But this sounds too good
to be true, so I'm wondering what I'm missing.
-Daniel
>
> >
> > Thanks,
> >
> >         tglx
> > ---
> >  a/arch/arm/mm/highmem.c               |  121 ---------------------
> >  a/arch/microblaze/mm/highmem.c        |   78 -------------
> >  a/arch/nds32/mm/highmem.c             |   48 --------
> >  a/arch/powerpc/mm/highmem.c           |   67 -----------
> >  a/arch/sparc/mm/highmem.c             |  115 --------------------
> >  arch/arc/Kconfig                      |    1
> >  arch/arc/include/asm/highmem.h        |    8 +
> >  arch/arc/mm/highmem.c                 |   44 -------
> >  arch/arm/Kconfig                      |    1
> >  arch/arm/include/asm/highmem.h        |   30 +++--
> >  arch/arm/mm/Makefile                  |    1
> >  arch/csky/Kconfig                     |    1
> >  arch/csky/include/asm/highmem.h       |    4
> >  arch/csky/mm/highmem.c                |   75 -------------
> >  arch/microblaze/Kconfig               |    1
> >  arch/microblaze/include/asm/highmem.h |    6 -
> >  arch/microblaze/mm/Makefile           |    1
> >  arch/microblaze/mm/init.c             |    6 -
> >  arch/mips/Kconfig                     |    1
> >  arch/mips/include/asm/highmem.h       |    4
> >  arch/mips/mm/highmem.c                |   77 -------------
> >  arch/mips/mm/init.c                   |    3
> >  arch/nds32/Kconfig.cpu                |    1
> >  arch/nds32/include/asm/highmem.h      |   21 ++-
> >  arch/nds32/mm/Makefile                |    1
> >  arch/powerpc/Kconfig                  |    1
> >  arch/powerpc/include/asm/highmem.h    |    6 -
> >  arch/powerpc/mm/Makefile              |    1
> >  arch/powerpc/mm/mem.c                 |    7 -
> >  arch/sparc/Kconfig                    |    1
> >  arch/sparc/include/asm/highmem.h      |    7 -
> >  arch/sparc/mm/Makefile                |    3
> >  arch/sparc/mm/srmmu.c                 |    2
> >  arch/x86/include/asm/fixmap.h         |    1
> >  arch/x86/include/asm/highmem.h        |   12 +-
> >  arch/x86/include/asm/iomap.h          |   29 +++--
> >  arch/x86/mm/highmem_32.c              |   59 ----------
> >  arch/x86/mm/init_32.c                 |   15 --
> >  arch/x86/mm/iomap_32.c                |   57 ----------
> >  arch/xtensa/Kconfig                   |    1
> >  arch/xtensa/include/asm/highmem.h     |    9 +
> >  arch/xtensa/mm/highmem.c              |   44 -------
> >  b/arch/x86/Kconfig                    |    3
> >  include/linux/highmem.h               |  141 +++++++++++++++---------
> >  include/linux/io-mapping.h            |    2
> >  include/linux/sched.h                 |    9 +
> >  kernel/sched/core.c                   |   10 +
> >  mm/Kconfig                            |    3
> >  mm/highmem.c                          |  192 ++++++++++++++++++++++++++++++++--
> >  49 files changed, 422 insertions(+), 909 deletions(-)
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
