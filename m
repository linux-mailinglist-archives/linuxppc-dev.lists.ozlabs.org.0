Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F924C0F1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:22:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Vtv5011z3bcY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:22:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvP1S9IC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fvP1S9IC; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3VtG1nyvz3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:22:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37615B81EAD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 09:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036F7C340EC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645608131;
 bh=qr8aGN/GfpzREfWWEWfy67hMxOcd5xgEZdDkbd5B0Fc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fvP1S9ICDfQF8hCsfx1j5bfZ8MyW/1rG6leAkItXfaKKhotabi5LJfUSgdtHnAs1e
 e//NBoK00IXi9zTUjPv7rNpA1RU7H3GNLpb9V1grfG21006D6HV2Tb4+Qk5tLh0HIo
 Y8xDpIW1XwC917uzpPR1esP/YuSq+XHVf/PTy1JzpDjvNBh8Jh8OysgZZO5Bjpcj+Q
 EJYwG2Z8BOyrYZNJ4iSfk1NrfuQSK+S4t7xQPNsmD2s/GQ8tcuq/JigD7ZEI9VXG1f
 eljgFZP39JEv9+yiNsBLF4dJImtQrUvYwdNENxl33kkrfAUIOs6Dsce/NuZ/ym9xNY
 WkfVAuCjEyWQw==
Received: by mail-ua1-f53.google.com with SMTP id c23so1101596uaq.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:22:10 -0800 (PST)
X-Gm-Message-State: AOAM533k/7MzY0+4HI2PWSj5bgRPmjZKFnV8rBYzEKQeYy6CRX6BLON/
 dyMF17s7UjLFfY1YsclP6cKcf/YGz7ehyi51wT0=
X-Google-Smtp-Source: ABdhPJydckZxxdHIMfr4RcZ21Y/DNoqRFXVrN4eEPW4jdar5CY+FIz7J7onmSF87bCDroUCQYiJcpWM17ymdodrxxjk=
X-Received: by 2002:ab0:5543:0:b0:33c:9e1c:a30d with SMTP id
 u3-20020ab05543000000b0033c9e1ca30dmr11349278uaa.97.1645608129880; Wed, 23
 Feb 2022 01:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-14-guoren@kernel.org>
 <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
In-Reply-To: <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Feb 2022 17:21:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQd_5Ei9RDUg5uYAAjf0+idCqUtxdemb0CEMsxq7m3+UA@mail.gmail.com>
Message-ID: <CAJF2gTQd_5Ei9RDUg5uYAAjf0+idCqUtxdemb0CEMsxq7m3+UA@mail.gmail.com>
Subject: Re: [PATCH V5 13/21] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Palmer Dabbelt <palmer@dabbelt.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 9:42 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:37 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > If the current task is in COMPAT mode, set SR_UXL_32 in status for
> > returning userspace. We need CONFIG _COMPAT to prevent compiling
> > errors with rv32 defconfig.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
> >  arch/riscv/kernel/process.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 03ac3aa611f5..1a666ad299b4 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned lon=
g pc,
> >       }
> >       regs->epc =3D pc;
> >       regs->sp =3D sp;
> > +
> > +#ifdef CONFIG_COMPAT
> > +     if (is_compat_task())
> > +             regs->status |=3D SR_UXL_32;
>
> Not sure if I'm just misunderstanding the bit ops here, but aren't we
> trying to set the UXL field to 1 (for UXL=3D32)?  That should be a bit
> field set op, not just an OR.
You are right, I would modify like this:
+     if (is_compat_task())
+             regs->status =3D =EF=BC=88regs->status & ~SR_UXL) | SR_UXL_32=
;
+     else
+.            regs->status =3D =EF=BC=88regs->status & ~SR_UXL) | SR_UXL_64=
;


>
> > +#endif
> >  }
> >
> >  void flush_thread(void)
>
> Additionally: this isn't really an issue so much with this patch, but it
> does bring up that we're relying on someone else to have set UXL=3D64 on
> CONFIG_COMPAT=3Dn systems.  I don't see that in any spec anywhere, so we
> should really be setting UXL in Linux for all systems (ie, not just those=
 with
> COMPAT=3Dy).



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
