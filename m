Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B74D6BEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 03:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFmZV62qnz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 13:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dzXW6D8a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dzXW6D8a; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFmYp0BxKz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 13:13:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D2AE616C8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 02:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BA5C340FF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 02:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647051209;
 bh=iRWRs787HfJQ4SmemjGupG5ATeZbj3chEC+s846rFUI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dzXW6D8a2fZcblys/QjCjL1M/69kjw27NQiwmxnI6v3Ty+JBSWuIwfIfHMmel2imr
 vGu03UC1vkaZOz0pVbvbaJ9VjatjyUMXrOjzw24dIgQIhPT2twm3Y7jpIEc+Sz1sZv
 xbefw+amYIJbHgLb9GrTrmKiMUF0Kh9g0oRa9QtveWDvFd6jsFRy9NIp4DXV0Ut1IQ
 qOhqK6ZRwENFgrFfhjtXN1OmpfCbVK48hQDU1kPXHAQlBTM9+QsrxqThgGkRXzKr2N
 vavIpsLAOCj0FM0mLCPoFRDvSj/f0Tjjlyok2eBV73W6cwj6H+ndb0VRdsWuF97g+/
 fjPsQcegOyixw==
Received: by mail-vs1-f41.google.com with SMTP id y20so3241606vsy.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 18:13:29 -0800 (PST)
X-Gm-Message-State: AOAM5336P3HWd2hLNV2UP0grTtFLGY+xJeaLJxQwbS13YQb6cfx5WKpv
 RKy9oIk8/+SJWdg0CgFnr1fw3myB3VOaLyQ9ds4=
X-Google-Smtp-Source: ABdhPJzCzz+Egly7/GI0fNYhw4sbiCEhUuQJ2YUO3cGoxYtVTwt+tqnmQKqPh36WSK6cQ0MJdLShbyuO/M99QnpoqW0=
X-Received: by 2002:a67:fc17:0:b0:320:b039:afc0 with SMTP id
 o23-20020a67fc17000000b00320b039afc0mr7125264vsq.2.1647051208526; Fri, 11 Mar
 2022 18:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
In-Reply-To: <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Mar 2022 10:13:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
Message-ID: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Ben Dooks <ben.dooks@codethink.co.uk>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 11/03/2022 02:38, Guo Ren wrote:
> > Hi Arnd,
> >
> > On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> >> returning userspace. We need CONFIG _COMPAT to prevent compiling
> >> errors with rv32 defconfig.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> ---
> >>   arch/riscv/kernel/process.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> >> index 03ac3aa611f5..54787ca9806a 100644
> >> --- a/arch/riscv/kernel/process.c
> >> +++ b/arch/riscv/kernel/process.c
> >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> >>          }
> >>          regs->epc = pc;
> >>          regs->sp = sp;
> >> +
> > FIxup:
> >
> > + #ifdef CONFIG_COMPAT
> >> +       if (is_compat_task())
> >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> >> +       else
> >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > + #endif
> >
> > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > set SR_UXL at all. SR_UXL is BIT[32, 33].
>
> would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> than an #ifdef here?
I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*

>
> >>   }
> >>
> >>   void flush_thread(void)
> >> --
> >> 2.25.1
> >>
> >
> >
>
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
