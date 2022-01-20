Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C305C494EEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 14:28:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jfjxb51HRz3bSk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 00:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FV+LquNr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FV+LquNr; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfjws44dGz303n
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:27:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 828A46175A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5223C340F1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642685240;
 bh=nij2NveTxD7AFS+dy/E2mbGaK4KnuKanTl6xzPnPkQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FV+LquNrcNIM4IyWdRQJ+RvURALdqn9xfCmH3u+EPyPxG/8iNUaCslKvqNdupslBw
 QBRP2q+FNxO6+wSFKXMyFDUNcAy6V3evf7SWZUwB8rE9gCJk0lFv2usPRlA4tmXnjW
 vRGqr4TSyisCJv6r/7+ohMVsNxAxtBY3zte/1y5zEGDFC5uZXE7MNp3XDVrgmwwKCy
 AGAIguEIxRllBb8wrI5vQZ0cZFle3X27KHhHktX3rhu2eQxIiCHXn4K2loU116xQoc
 RLuRjDVXG8TasUHF/D9VQs3KiylNZRmOC3843iD+ztRTmijocFRzUI+MmuAOojOLAW
 /CrONDsZ7cwvg==
Received: by mail-vk1-f175.google.com with SMTP id z15so366951vkp.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 05:27:20 -0800 (PST)
X-Gm-Message-State: AOAM531M/S1rMce0mfnsj/QQsbS5SOyXeDxOv+qP/v7OLGkgt4osk0ZA
 cd/r7JQd3L/HTYnVI+SgNuGNSYh3jkRt4HMNVLo=
X-Google-Smtp-Source: ABdhPJwXq7rWM9TR2/dX3Ce8RNnGwk7ErUknPTqNCDOUbla5Lz39Gh+9ETVvKbMYpePGn1XdP3gT3y8Rtd9l9zviaqA=
X-Received: by 2002:ac5:cbc8:: with SMTP id h8mr12691275vkn.8.1642685239536;
 Thu, 20 Jan 2022 05:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
 <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
In-Reply-To: <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:27:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
Message-ID: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: David Laight <David.Laight@aculab.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, gregkh <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 8:53 PM David Laight <David.Laight@aculab.com> wrote:
>
> > > Limit 32-bit compatible process in 0-2GB virtual address range
> > > (which is enough for real scenarios), because it could avoid
> > > address sign extend problem when 32-bit enter 64-bit and ease
> > > software design.
>
> Eh?
> I thought nearly all the other 32bit unix ports (of any flavour)
> put the user-kernel boundary at 3GB.
No, riscv32 is about 2.4G, csky is 2G/2.5G.

> (Apart from some very old sparc ones that use 3.5GB.)
>
> 2GB is used by Windows.
>
> I think the x86-64 32bit compat code even puts the boundary at 4GB.
Yes, we could give rv32 compat for 4GB with some effort. But it's unnecessary.

There are no history issues for rv32, we use compat mode to reduce
memory footprint. eg: only 64MB memory available.

At end compat for 4GB is another topic, let's give the initial compat
for 2GB support to riscv.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
