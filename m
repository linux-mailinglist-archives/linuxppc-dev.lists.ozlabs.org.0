Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C8120525
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 13:13:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c0Xh0VwszDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 23:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c0PP0FDfzDqV4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 23:06:46 +1100 (AEDT)
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MIxBc-1iQoQs3wlO-00KOWW for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec
 2019 13:06:41 +0100
Received: by mail-qk1-f179.google.com with SMTP id r14so4516277qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 04:06:40 -0800 (PST)
X-Gm-Message-State: APjAAAXQ+FTvW+KNTCvW1Q2Mrty/00Wbmy6iTJWegxsaK2fWYMzHrPV2
 1NPh5DNyrX+v/RmGTw+4O8sL09Leu2ZRBcroAos=
X-Google-Smtp-Source: APXvYqzaldzKvuGG0VSm+NPjH2zK7pPG6M4z5r7MC0BxVjXSzaHMKlB7/FcMflcuRR66LlFgIuTrrgyX4wxlYfFrPhU=
X-Received: by 2002:a37:2f02:: with SMTP id v2mr5213363qkh.3.1576497999318;
 Mon, 16 Dec 2019 04:06:39 -0800 (PST)
MIME-Version: 1.0
References: <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
 <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
 <20191213144359.GA3826@willie-the-truck>
In-Reply-To: <20191213144359.GA3826@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 16 Dec 2019 13:06:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0qgbqKTtRWTh6c0R2E93rehKbkBcB18TL3JX_RWHsTZA@mail.gmail.com>
Message-ID: <CAK8P3a0qgbqKTtRWTh6c0R2E93rehKbkBcB18TL3JX_RWHsTZA@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TSDQJJn4NG66d3QBWWRBaMDee1S38OtP8sBuHD9JgLCqJ+Hbt34
 USfRMNLz2rabXnk/+Ns0lo1G50XrHYxPrFz0AoSKdYW23B0zsUPKhTQG55Le89VgUpUUsJl
 73n/QGPYT4qeeeNH+OQ9aK86T9uAkM/NAyeXzi2I5owK1ZfNibHTj3UncnUpNb22oZ37hMg
 JBmZnf2Os8gkG8ZOB59aw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iWkM2cbPCac=:RJuAOR6Av+94EkDGAE/r9j
 f5G2t8VkaWiqMJr4cR69P3z00Sq5xmvdUojD9Ae4m1OKTuhoRaiD0yMjZR9eAdB3WACosciPS
 Mz2mFD+IxmGX4sCT8KqCYSWKyfkW/eDoS6KgPA1O5RrArFcerveuOz/htw+Og9QBmbdYZXFz4
 6+HXjRu+Z+AAxzU9lOQOVw97it+P+QO859Wv+P39OtltdAW44ZIZjotXevk09c7KN0O04eyR1
 +7MjAdPlop/vpT4bMxeS7w6pD743oE0pBrKFkQ+3v0q/3Ly7cysqLaQRJUqkEVrnSfQdiVjoy
 yoflkz8ulHZkVXAyRY0xIQUMw/DIgDA7A9aUEFjof+T1OD7In4/hryrq0e18tlcObn6YPnXGB
 ELCMnPrpw9CdLPdgIQ6PqKwk1BZ2IEuDTLVpHxrO71yIxgwdynIOvnfYfR70VqER1iqJFvGYb
 2F/92ZERuUo7wxY0C+rqCL0C599tUI8vnD6V6yAgU1Nyan/WSa1spD7VcexIWJ/jg1xKQdXBm
 FP5gZJm6AeF1+Xy7GupCDqrrsENAV4ewPAf33qkrRlEK5th5aN5zd9It8AQSmqwngRvJzL9SR
 ib74CXj1bN8x2LvlWQe02BiDPrKc01+nJLh0W12gACv+bN5gkjjeiEL/Q+3lp63G+K1E+iOF7
 av9VE5NufbhxgKy6SPNv3BpWUfI/WtCzEonf1pDVW3FKh6TUz1i7ScbSdFG4I/GpYJXxWJ7Sg
 FyzP7TGRq58svX373aOiwUDuABx+BMxOK/IfDs6kTV4rSV54A7WJIb080ILs2i+oFuLOeKqBy
 uiy53wDm9115OjPcEUEaWsZRzV73vARY0ReWa5D6ak9qLmBdGC2XLQCDwbzDHCRcPeIFw2Ixr
 eNQtER6f0sH8Go6BTUWQ==
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 11:28 AM Will Deacon <will@kernel.org> wrote:
> On Fri, Dec 13, 2019 at 02:17:08PM +0100, Arnd Bergmann wrote:
> > On Thu, Dec 12, 2019 at 9:50 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Thu, Dec 12, 2019 at 11:34 AM Will Deacon <will@kernel.org> wrote:
> > > > The root of my concern in all of this, and what started me looking at it in
> > > > the first place, is the interaction with 'typeof()'. Inheriting 'volatile'
> > > > for a pointer means that local variables in macros declared using typeof()
> > > > suddenly start generating *hideous* code, particularly when pointless stack
> > > > spills get stackprotector all excited.
> > >
> > > Yeah, removing volatile can be a bit annoying.
> > >
> > > For the particular case of the bitops, though, it's not an issue.
> > > Since you know the type there, you can just cast it.
> > >
> > > And if we had the rule that READ_ONCE() was an arithmetic type, you could do
> > >
> > >     typeof(0+(*p)) __var;
> > >
> > > since you might as well get the integer promotion anyway (on the
> > > non-volatile result).
> > >
> > > But that doesn't work with structures or unions, of course.
> > >
> > > I'm not entirely sure we have READ_ONCE() with a struct. I do know we
> > > have it with 64-bit entities on 32-bit machines, but that's ok with
> > > the "0+" trick.
> >
> > I'll have my randconfig builder look for instances, so far I found one,
> > see below. My feeling is that it would be better to enforce at least
> > the size being a 1/2/4/8, to avoid cases where someone thinks
> > the access is atomic, but it falls back on a memcpy.
>
> I've been using something similar built on compiletime_assert_atomic_type()
> and I spotted another instance in the xdp code (xskq_validate_desc()) which
> tries to READ_ONCE() on a 128-bit descriptor, although a /very/ quick read
> of the code suggests that this probably can't be concurrently modified if
> the ring indexes are synchronised properly.

That's the only other one I found. I have not checked how many are structs
that are the size of a normal u8/u16/u32/u64, or if there are types that
have a lower alignment than there size, such as a __u16[2] that might
span a page boundary.

> However, enabling this for 32-bit ARM is total carnage; as Linus mentioned,
> a whole bunch of code appears to be relying on atomic 64-bit access of
> READ_ONCE(); the perf ring buffer, io_uring, the scheduler, pm_runtime,
> cpuidle, ... :(
>
> Unfortunately, at least some of these *do* look like bugs, but I can't see
> how we can fix them, not least because the first two are user ABI afaict. It
> may also be that in practice we get 2x32-bit stores, and that works out fine
> when storing a 32-bit virtual address. I'm not sure what (if anything) the
> compiler guarantees in these cases.

Would it help if 32-bit architectures use atomic64_read() and atomic64_set()
to implement a 64-bit READ_ONCE()/WRITE_ONCE(), or would that make it
worse in other ways?

On mips32, riscv32 and some minor 32-bit architectures with SMP support
(xtensa,  csky, hexagon, openrisc, parisc32, sparc32 and ppc32 AFAICT) this
ends up using a spinlock for GENERIC_ATOMIC64, but at least ARMv6+,
i586+ and most ARC should be fine.

(Side note: the ARMv7 implementation is suboptimimal for ARMv7VE+
if LPAE is disabled, I think we need to really add Kconfig options for
ARMv7VE and 32-bit ARMv8 improve this and things like integer divide).

      Arnd
