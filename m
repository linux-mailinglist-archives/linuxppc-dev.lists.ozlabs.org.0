Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40A4D6D9E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 09:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFx4J3S9jz2yxV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 19:37:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFx3s4nBCz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 19:36:40 +1100 (AEDT)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3In-1oLigO287T-00zara for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar
 2022 09:36:35 +0100
Received: by mail-wr1-f43.google.com with SMTP id i8so16240919wrr.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 00:36:34 -0800 (PST)
X-Gm-Message-State: AOAM531GLOIg7cArC7h+kmuH6tk9VpIaOQR9wKTMw+Pj4flBgIMOvfMX
 tlUVZ8KkysG+YC80uujjNrO4HEba8/4scxklX2M=
X-Google-Smtp-Source: ABdhPJwrBgijWcFmabOKnFeCHeAhHQBR3PR+3P0h6p5JQhHZX/5odIXHkxJDpCBUEOwN9ui3K5nWlIusCnBN24XocoE=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr7048966wrq.192.1647074194359; Sat, 12
 Mar 2022 00:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
 <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
In-Reply-To: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 12 Mar 2022 09:36:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
Message-ID: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:thR68cQQwbTnBcXrlrz0pm7zHmOm6rPwd5NOTT+cfYT86aLE4Nj
 0MacL7anvl7r0obqfA064nw94EuvCJ09t1LT7VC8JvG+S9cTp0ASbE0PzvHtZCDg7RK/Mv3
 ld/O0RVWJKhY5CCcU5T/rAB+rNNgUBgfpZ13tywwtAB9h8RCVQqiXs8LDsGZ6aO0sA8PfVp
 cNKxvhX+0PXwcHXPR19Fw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eX7aRXMyH5c=:iGq3vCEHJ9huivgvIGLTPj
 OYnfrp9GrnVTwm4XO3h+gRrLJQPkj0ctZEHZRFHoin+g5g0oqtiq73/zeEe6uYdsfbmfUAK9c
 c9wyTF5dTEP9BI9Ot0nEcAciR3aJp0kOKDknzVHSIIIa5CX/eMkkJub4hVFrWsNsFdGPcka5e
 +MWBhck7C3ziwUaFdVT0oR5rdD9M2HhLvWvh2BnFTFwQOV4dLR16vWTwhYiXkODLQ5YqwZKJK
 VTTq1YV5lrVl6X/xqXrdIQHz5GEY7F+s4iJG3NktH9u3PU9O9mNzBzkHPENevaYYv+CorVkYB
 JEZS0+Lj1Z0/beMci74ZtV3KQT4VsY+iy/kvoPsSLoE+8kYlEPdh1ZcoGJ8c3FrcZRiQn/3k0
 8kWW0Vz8RfO9buCCXMKDPr/rQxVb1qFtNgJPRsR5uESvX/hP3o2swD1NstNT4dUB20n3HQOuB
 HQ/y3XA1Kxi0rsMh0NBwMhjnFFhSObrSlMk7V9UZWHVAZLzLJQga2UMwEXz2hRSl2agk3Htpr
 jojuwb+QihO6ks2xwzAiEYRlDFNw1KbBHLURGW7cqOq+dQskMe2fotmODz5PrJw19gk2CvLrv
 Qe1N3Ff0tVr5upHU1h0x6gwiJWG/YBG6pU1Bwuo2ApZx8wX9JFy0d3gu1GU8YIGCNIq/W6uX5
 sMxy4nOgClNzjTVLtBDQoAzybXya5uet7n2Ja3At1Fd11O/L+vVqgyqUEERc+qW2rW+AhfPf2
 xxauCdc+cCDqXb5Z1PoOS0Yegq9gn7Mf523hQP+IBB3P+TUXqQXMwXx5NOi2IK1VeS3BuYGEh
 Ntmb4U6dO3v76bnr71fERsnutL7D0fdj+7S5vnbN+5bbnKg27U=
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 12, 2022 at 3:13 AM Guo Ren <guoren@kernel.org> wrote:
> On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > On 11/03/2022 02:38, Guo Ren wrote:
> > >> --- a/arch/riscv/kernel/process.c
> > >> +++ b/arch/riscv/kernel/process.c
> > >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> > >>          }
> > >>          regs->epc = pc;
> > >>          regs->sp = sp;
> > >> +
> > > FIxup:
> > >
> > > + #ifdef CONFIG_COMPAT
> > >> +       if (is_compat_task())
> > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> > >> +       else
> > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > > + #endif
> > >
> > > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > > set SR_UXL at all. SR_UXL is BIT[32, 33].
> >
> > would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> > than an #ifdef here?
>
> I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*

We used to require an #ifdef check around is_compat_task(), so there are
a lot of stale #ifdefs that could be removed. In general, 'if (IS_ENABLED())'
is considered more readable than #ifdef inside of a function. In this case
there are a number of better ways to write the function if you want to get
into the details:

 - firstly, you should remove the #ifdef check around the definition of
   SR_UXL, otherwise the IS_ENABLED() check does not work.

 - you can use an 'if (!IS_ENABLED(CONFIG_COMPAT)) \\ return;' ahead of the
   assignment since that is at the end of  the function.

 - you can remove the bit masking since 'regs->status' is initialized above it,
   adding in only the one bit, shortening it to

    if (IS_ENABLED(CONFIG_COMPAT))
               regs->status |= is_compat_task()) ? SR_UXL_32 : SR_UXL_64;

 - to make this more logical, I would suggest always assigning the SR_UXL
   bits regardless of CONFIG_COMPAT, and instead make it something like

  if (IS_ENABLED(CONFIG_32BIT) || is_compat_task())
            regs->status = | SR_UXL_32;
  else
            regs->status = | SR_UXL_64;

       Arnd
