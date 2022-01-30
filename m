Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19BA4A349C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 06:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmgQR46gYz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 16:55:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KbqY9Ycj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KbqY9Ycj; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmgPn6K4tz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 16:54:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26941B82768
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 05:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32F6C340F0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643522071;
 bh=KTwtRKH/OVKhaNoB2dpS+9CRT5rYtiTrBbRTY58frfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KbqY9YcjYQ53gmY2dHmrpw7RqkS4V6dNNJjtLBbW8U4K47uqz0ecQoZbQwgfGmZma
 tRCWkNjivI6OGFruhAjydv25WQ48WPT8wiGKtc8VkkqRijcv4FkBddBEiA9bZ6UpWM
 I5RJVntAdZO8XAOSx+Hzslf2/jqxqMaVH/0ebTmNHQjz/YBFdn/6EIt7d+vxsPHNSZ
 ZaFIL+Fyvt5HOclTxwg6T2ZdaTD4y5Z172agNJmW87mhTO2d74ig4seQ3g/0cZwPaa
 1X8MVufLeenvPKvFey3paLO3ejlnzOfUnZP2orkztfEtq678+ZCjwp7m/wgaw/Qbsh
 4OleGJIuGH/Uw==
Received: by mail-vs1-f53.google.com with SMTP id b2so7979608vso.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 21:54:31 -0800 (PST)
X-Gm-Message-State: AOAM531tvLXRgV/9iO9NhU94NOMorrHaOkjdogLL6xfTEBf67b+svum8
 EJ3yGRDyKFe6Ubxrg4cjurE1B3LimuvSJpS773M=
X-Google-Smtp-Source: ABdhPJw3SI5w6wpfoRZZErXNv34dgmNp5eduh3H4LQwaI7qbmi+2hfTO0XEH13fEEhf3iFH2jsVqfmVsSGc5OwjgZr4=
X-Received: by 2002:a67:e0d9:: with SMTP id m25mr5857135vsl.51.1643522070834; 
 Sat, 29 Jan 2022 21:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
In-Reply-To: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 13:54:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
Message-ID: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > Implement compat sys_call_table and some system call functions:
> > truncate64, ftruncate64, fallocate, pread64, pwrite64,
> > sync_file_range, readahead, fadvise64_64 which need argument
> > translation.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> This all looks really good, but I would change one detail:
>
> > +#ifndef compat_arg_u64
> > +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> > +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> > +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> > +                                        ((u64)name##_lo & 0xffffffffUL))
> > +#endif
>
> I would make these endian-specific, and reverse them on big-endian
> architectures. That way it
> should be possible to share them across all compat architectures
> without needing the override
> option.
I hope it could be another patch. Because it's not clear to
_LITTLE_ENDIAN definition in archs.

eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN

riscv is little-endian, but no any LITTLE_ENDIAN definition.

So let's keep them in the patch, first, Thx

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
