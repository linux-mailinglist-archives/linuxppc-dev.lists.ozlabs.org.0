Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E14A5903
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 10:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnzlR3yTmz30jP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 20:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=osid9LTe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=osid9LTe; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnzkn0JDnz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 20:13:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38039B82CE9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 09:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7FBC340EB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643706828;
 bh=hnac9oX2VXGbCvTtbNqKOCdN7oRwr6SWdV4YiEu9kyM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=osid9LTeTz41TprB3lECyF7yxevcSe3lIV4ZL99JzOMfl72MojScFC3KFSuxo0GG6
 70X7q6bsJNhjiYW4eYtM9zavsWFzGHmX86k9Ml9HGuOJ1orLTwnnB/8IKA1zhgYXgW
 hSlvL+cQdKAdDBSohj3VnNdOp8d4C22kdbe4qC69gelcFnJI7j5B49J5FTE04dedNl
 P/ryvvU3GDEs/ZJtT4weo0WgAKGCjVclvJKH46nYcgccaUjSCHheiE5OG55xQ15AO6
 Knswca+0CXvzLPDMd7M6D20RiLGupntu6utpPUX04UUDdi0VLzhoKrW0Nxf/6moTC0
 fgmqq3tGL2XIA==
Received: by mail-vk1-f176.google.com with SMTP id bi36so6764906vkb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 01:13:48 -0800 (PST)
X-Gm-Message-State: AOAM5313mpX7YiXq25wZ84rpqgX+6pOJFYnwkbvAUGDTydeOnR9kMirq
 w7salRc9AQPYx4OFuFI5duW8gUsSdziwvvBuWtg=
X-Google-Smtp-Source: ABdhPJz8fzguZPbFnae5j7V9pl/dv5oQGM4hOb4aA5V9NpHM4cr9OW86mUtht2VbhtSN0zWJb+F+yH9GTu4P2KsI3X0=
X-Received: by 2002:a05:6122:1c5:: with SMTP id h5mr9895590vko.2.1643706827991; 
 Tue, 01 Feb 2022 01:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
In-Reply-To: <20220201074457.GC29119@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 17:13:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
Message-ID: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Christoph Hellwig <hch@lst.de>
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
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 3:45 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jan 31, 2022 at 09:50:58PM +0800, Guo Ren wrote:
> > On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > Given that most rv64 implementations can't run in rv32 mode, what is the
> > > failure mode if someone tries it with the compat mode enabled?
> > A static linked simple hello_world could still run on a non-compat
> > support hardware. But most rv32 apps would meet different userspace
> > segment faults.
> >
> > Current code would let the machine try the rv32 apps without detecting
> > whether hw support or not.
>
> Hmm, we probably want some kind of check for not even offer running
> rv32 binaries.  I guess trying to write UXL some time during early
> boot and catching the resulting exception would be the way to go?

Emm... I think it's unnecessary. Free rv32 app running won't cause
system problem, just as a wrong elf running. They are U-mode
privileged.
>
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> ---end quoted text---



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
