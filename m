Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCB495CC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 10:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgDSc1tRcz3cCJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:23:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rect2n4o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rect2n4o; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgDRy50r3z2x9D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 20:22:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16BC5619A3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 09:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166D6C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642756954;
 bh=DoEBSYVdhxCk2hRPozcTctknq4n34sTJPxtSYV1nfhs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rect2n4o+iX3RzSuMqm7blYH7Jp/hn6KvYVHNZi4gBL8iFIvMsCmxh1McTEwDN7si
 Jp36PSgZTxLoEYXNkuZPZHbuOSaCX325CmGEKFE7qdL/bJYrG4zQFtGn5SCOJLFLuv
 L3sc4NOwY7+X2UWdBb2ueG0AClbmiy7IwW458aaaf3XIv3BTv/IAj4XAqFCgdH7ih5
 t6ToBIUrsVsbMOObBDp9gxf4Mq/Pzd4XB1xuRpofrh2pf52fyeSpwwMuzAAf2V+eki
 7yzqCn4T+d70ueboR1lGAMbTJ8dL8zQnETPkZDzy+/H5QLqca4OHltjQ5kVikRSe2h
 DVpmSiH6xAKgg==
Received: by mail-ua1-f48.google.com with SMTP id r15so15797588uao.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 01:22:34 -0800 (PST)
X-Gm-Message-State: AOAM531GtipopwYWbgvkvnaiAQKNCDEFy4gleRnWTMtU59osggaDeXwR
 0LmdjJCFKZOFS8CW/HO7OiSxnU7F5ufzP6map6Q=
X-Google-Smtp-Source: ABdhPJy/0MHzL1Lj83ABpPKlmasRjxPdpSw7edTfCXcU+fXON/ztRB09l8EfH009hsjqC4mDy1GaKsQom5NTP4rqtk4=
X-Received: by 2002:a05:6102:34ec:: with SMTP id
 bi12mr1057047vsb.51.1642756953041; 
 Fri, 21 Jan 2022 01:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
 <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
 <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
 <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
In-Reply-To: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 17:22:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSzMym_PS36JgpWLQUdAO3nq+z7mdDWRT=EzQq+waPSpA@mail.gmail.com>
Message-ID: <CAJF2gTSzMym_PS36JgpWLQUdAO3nq+z7mdDWRT=EzQq+waPSpA@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
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
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 4:57 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jan 21, 2022 at 7:25 AM Guo Ren <guoren@kernel.org> wrote:
> > On Thu, Jan 20, 2022 at 10:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> > > Are you sure these are the right calling conventions? According to [1],
> > > I think the 64-bit argument should be in an aligned pair of registers,
> > > which means you need an extra pad argument as in the arm64 version
> > > of these functions. Same for ftruncate64, pread64, pwrite64, and
> > > readahead.
> >
> > [1] has abandoned.
> >
> > See:
> > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc
>
> Ok, thanks for the reference, I picked the first one that came up in
> a google search and didn't expect this to ever have changed.
>
> > > I still feel like these should be the common implementations next to the
> > > native handlers inside of an #ifdef CONFIG_COMPAT.
> > >
> > > The names clash with the custom versions defined for powerpc and sparc,
> > > but the duplicates look compatible if you can account for the padded
> > > argument and the lo/hi order of the pairs, so could just be removed here
> > > (all other architectures use custom function names instead).
> > I would try it later.
>
> This becomes easier then, as powerpc and sparc already have the non-padded
> calling conventions, so you could just generalize those without looking at
> the other architectures or adding the padding. The powerpc version already
> has the dual-endian version, so using that will work on big-endian sparc and
> on little-endian riscv as well, though we may need to come up with a better name
> for the arg_u32/arg_u64/merge_64 macros in order to put that into a global
> header without namespace collisions.
Sounds good, thanks!

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
