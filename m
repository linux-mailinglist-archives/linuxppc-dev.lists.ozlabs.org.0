Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD94959E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 07:26:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg8XZ4WLLz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QGovHoz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QGovHoz1; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg8Ws4Hk0z3050
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 17:25:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4DB3DB81F10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772B0C340EA
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642746341;
 bh=Isi0LP5N8Hd28Ba/kM6pY+YaZm5nWrdB7apzNizLGkI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QGovHoz1oiofsdeaaXvjyotkiuHEDH0/CO+SlieoWuLCgx5KtV+Ai2Csju6ecvcNn
 xTbsrzAaDUp9BLR9AyNzODSTM1WIjQcjd/vxArKlUGwNgK09W1bVBsghi+Zm7UWemM
 uEtNuhsOXX8Ugo1Y4qHLm4MRe1sX1QcTL2nYe/FfR+RV6+/ofNF6GmJUNEvEHvHK+e
 w1SoJRREbXxjcdQQSlT7aN2dH/O/U5TVCUyEr9r+jtwrROIzQilSGVx4QeQK9dZVSh
 d1xgfZJVGsxLsNdaiWOd+utFZwUfcRwN3wT3+g6qcQI0ranll2u6k7n00Y/woKgW8j
 jDKVRZ3MkFA6w==
Received: by mail-ua1-f48.google.com with SMTP id c36so15087164uae.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:25:41 -0800 (PST)
X-Gm-Message-State: AOAM533t26T+14fOahNeRSm7cNqmUE6e7UiTIVI6Ot4+DfMBJw3d9dgb
 SdB+MelY9ozY5nppUyu2VJ/i6e2jbQx9XmOGWbc=
X-Google-Smtp-Source: ABdhPJwB7ga72MDOno+HFBeeiGH/FKsBJy+/4qpm4/UjbqnmBZuKa8XMIWL0JsmA8KTM5bJQlsAjrV4ffWb0zfo7B4M=
X-Received: by 2002:a67:e016:: with SMTP id c22mr1147085vsl.51.1642746340414; 
 Thu, 20 Jan 2022 22:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
 <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
In-Reply-To: <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 14:25:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
Message-ID: <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
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

On Thu, Jan 20, 2022 at 10:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> >
> >  /* The array of function pointers for syscalls. */
> >  extern void * const sys_call_table[];
> > +#ifdef CONFIG_COMPAT
> > +extern void * const compat_sys_call_table[];
> > +#endif
>
> No need for the #ifdef, the normal convention is to just define the
> extern declaration unconditionally for symbols that may or may not be defined.
Okay

>
> > +COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
> > +                      arg_u32p(length))
> > +{
> > +       return ksys_truncate(pathname, arg_u64(length));
> > +}
>
> Are you sure these are the right calling conventions? According to [1],
> I think the 64-bit argument should be in an aligned pair of registers,
> which means you need an extra pad argument as in the arm64 version
> of these functions. Same for ftruncate64, pread64, pwrite64, and
> readahead.

[1] has abandoned.

See:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc

Ltp test results:

ftruncate01                                        PASS       0
ftruncate01_64                                     PASS       0
ftruncate03                                        PASS       0
ftruncate03_64                                     PASS       0
ftruncate04                                        CONF       32
ftruncate04_64                                     CONF       32

truncate02                                         PASS       0
truncate02_64                                      PASS       0
truncate03                                         PASS       0
truncate03_64                                      PASS       0

pread01                                            PASS       0
pread01_64                                         PASS       0
pread02                                            PASS       0
pread02_64                                         PASS       0
pread03                                            PASS       0
pread03_64                                         PASS       0

pwrite01_64                                        PASS       0
pwrite02_64                                        PASS       0
pwrite03_64                                        PASS       0
pwrite04_64                                        PASS       0

readahead01                                        PASS       0
readahead02                                        CONF       32


>
> > +COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
> > +{
> > +       return ksys_ftruncate(fd, arg_u64(length));
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
> > +                      arg_u32p(offset), arg_u32p(len))
> > +{
> > +       return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
> > +                      size_t, count, arg_u32p(pos))
> > +{
> > +       return ksys_pread64(fd, buf, count, arg_u64(pos));
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
> > +                      const char __user *, buf, size_t, count, arg_u32p(pos))
> > +{
> > +       return ksys_pwrite64(fd, buf, count, arg_u64(pos));
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
> > +                      arg_u32p(nbytes), unsigned int, flags)
> > +{
> > +       return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
> > +                                   flags);
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
> > +                      size_t, count)
> > +{
> > +       return ksys_readahead(fd, arg_u64(offset), count);
> > +}
> > +
> > +COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
> > +                      arg_u32p(len))
> > +{
> > +       return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
> > +}
>
> I still feel like these should be the common implementations next to the
> native handlers inside of an #ifdef CONFIG_COMPAT.
>
> The names clash with the custom versions defined for powerpc and sparc,
> but the duplicates look compatible if you can account for the padded
> argument and the lo/hi order of the pairs, so could just be removed here
> (all other architectures use custom function names instead).
I would try it later.

>
>         Arnd
>
> [1] https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
