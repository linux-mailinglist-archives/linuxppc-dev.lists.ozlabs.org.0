Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC949F446
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 08:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlTQY5px5z3c79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 18:21:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rT9QbL1W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rT9QbL1W; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlTPq3BNQz2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 18:20:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7EA061BE2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 07:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DE6C340E6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643354423;
 bh=T5hvP6N/YDzJivdP96HpAMsEBUvVss8W1EdZxq9UDZ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rT9QbL1WnPZ2MHGbg0JvXIvyik13Be4VSHK3AZWcckQfOPTQ3p8BK92cMVnIvrzMg
 MakENSENL+JCT+fJfjBxHS6GxPMra9V8+ZT+KUn2jwKlTN9HxC166Gja/waPD3bzgq
 4JCS1G112hbc461us35r3Eed4yccGu1Em4uTf4Rw0YIYh75HZuXZZml/IpW7r4V0pG
 TtUQAhmnS1cm9v7Gs28cGhDI9GH3HtS8WlxKplc7ac/dHKfNtZW1rl5KkFkQ3HGVJ7
 x1M30Rp1WyZU5Ga8NNdFkmoINdLWHcZ4E7GPUs+o2KFHLSSPp0zGvLb9FWhLrIWM/a
 CpHO/6lgegEkw==
Received: by mail-ua1-f49.google.com with SMTP id c36so7079023uae.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 23:20:23 -0800 (PST)
X-Gm-Message-State: AOAM533O2TcmawFHFWYOqYL2Z3GAl2Ea6icrCIs8sJFTqp4HCvAYEuAh
 LZx2EIkZgSlNGwEFTmVH/PcVUbWJlwkq5oIFisU=
X-Google-Smtp-Source: ABdhPJy2RpgEjhRo6X4RJ0pAxWaXFERfP1D6JpGvXcxtvMy0oyK9vzxHewNF9PQNMbdvJh891BhmawJDHyR3Cg69bT8=
X-Received: by 2002:ab0:3565:: with SMTP id e5mr3609249uaa.97.1643354422066;
 Thu, 27 Jan 2022 23:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-4-guoren@kernel.org>
 <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
In-Reply-To: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 28 Jan 2022 15:20:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRoVaD0yrh7_Lxwvn9KdYdUeiNH4YhiaY6+G=nt04r9Yw@mail.gmail.com>
Message-ID: <CAJF2gTRoVaD0yrh7_Lxwvn9KdYdUeiNH4YhiaY6+G=nt04r9Yw@mail.gmail.com>
Subject: Re: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
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

On Thu, Jan 20, 2022 at 9:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
>   On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > There are 7 64bit architectures that support Linux COMPAT mode to
> > run 32bit applications. A lot of definitions are duplicate:
> >  - COMPAT_USER_HZ
> >  - COMPAT_RLIM_INFINITY
> >  - COMPAT_OFF_T_MAX
> >  - __compat_uid_t, __compat_uid_t
> >  - compat_dev_t
> >  - compat_ipc_pid_t
> >  - struct compat_flock
> >  - struct compat_flock64
> >  - struct compat_statfs
> >  - struct compat_ipc64_perm, compat_semid64_ds,
> >           compat_msqid64_ds, compat_shmid64_ds
> >
> > Cleanup duplicate definitions and merge them into asm-generic.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> > ---
> >  arch/arm64/include/asm/compat.h   | 108 +++-----------------------
> >  arch/mips/include/asm/compat.h    |  24 ++----
> >  arch/parisc/include/asm/compat.h  |  47 ++----------
> >  arch/powerpc/include/asm/compat.h |  47 ++----------
> >  arch/s390/include/asm/compat.h    | 109 +++-----------------------
> >  arch/sparc/include/asm/compat.h   |  39 ++++------
> >  arch/x86/include/asm/compat.h     | 114 +++-------------------------
> >  include/asm-generic/compat.h      | 122 ++++++++++++++++++++++++++++++
> >  8 files changed, 191 insertions(+), 419 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
> > index eaa6ca062d89..f54f295efae3 100644
> > --- a/arch/arm64/include/asm/compat.h
> > +++ b/arch/arm64/include/asm/compat.h
> > @@ -5,9 +5,18 @@
> >  #ifndef __ASM_COMPAT_H
> >  #define __ASM_COMPAT_H
> >
> > +#define COMPAT_RLIM_INFINITY           0xffffffff
> ...
> > +#ifndef COMPAT_RLIM_INFINITY
> > +#define COMPAT_RLIM_INFINITY   0x7fffffff
> > +#endif
>
> While this is a correct conversion, I think the default should
> be 0xffffffff, to match the asm-generic RLIM_INFINITY
> definition, with only mips and sparc getting the exception
Okay

>
> > -struct compat_flock {
> > -       short           l_type;
> > -       short           l_whence;
> > -       compat_off_t    l_start;
> > -       compat_off_t    l_len;
> > -       compat_pid_t    l_pid;
> > -};
> ...
> > +#ifndef compat_flock
> > +struct compat_flock {
> > +       compat_short_t  l_type;
> > +       compat_short_t  l_whence;
> > +       compat_off_t    l_start;
> > +       compat_off_t    l_len;
> > +       compat_pid_t    l_pid;
> > +} __attribute__((packed));
> > +#endif
>
> You are adding __attribute__((packed)) here, which I think has
> no effect on the layout on the structure on any of the architectures
> but it does change the alignment requirements needlessly.
>
> Better leave it without the attribute.
Okay

>
> > -struct compat_flock64 {
> > -       short           l_type;
> > -       short           l_whence;
> > -       compat_loff_t   l_start;
> > -       compat_loff_t   l_len;
> > -       compat_pid_t    l_pid;
> > -};
> ...
> > +#ifndef compat_flock64
> > +struct compat_flock64 {
> > +       compat_short_t  l_type;
> > +       compat_short_t  l_whence;
> > +       compat_loff_t   l_start;
> > +       compat_loff_t   l_len;
> > +       compat_pid_t    l_pid;
> > +} __attribute__((packed));
> > +#endif
>
> This one is different: on all architectures other than x86,
> the added packed attribute changes the size of the
> structure by removing the four padding bytes at the
> end. x86 originally added the attribute here to work around
> the weirdness of the x86-32 ABI that aligns 64-bit values
> on a 4-byte boundary.
>
> The easiest workaround would be to have x86 keep its
> custom definition. A slightly nicer version would drop the
> attribute on x86 as well but instead change the compat_loff_t
> definition to use compat_s64 instead of s64, giving it the
> correct alignment.
Okay, I would leave x86 origin first.

>
> > -struct compat_statfs {
> > -       int             f_type;
> > -       int             f_bsize;
> > -       int             f_blocks;
> > -       int             f_bfree;
> > -       int             f_bavail;
> > -       int             f_files;
> > -       int             f_ffree;
> > -       compat_fsid_t   f_fsid;
> > -       int             f_namelen;      /* SunOS ignores this field. */
> > -       int             f_frsize;
> > -       int             f_flags;
> > -       int             f_spare[4];
> > -};
> ...
> > +#ifndef compat_statfs
> > +struct compat_statfs {
> > +       compat_uint_t   f_type;
> > +       compat_uint_t   f_bsize;
> > +       compat_uint_t   f_blocks;
> > +       compat_uint_t   f_bfree;
> > +       compat_uint_t   f_bavail;
> > +       compat_uint_t   f_files;
> > +       compat_uint_t   f_ffree;
> > +       __kernel_fsid_t f_fsid;
> > +       compat_uint_t   f_namelen;
> > +       compat_uint_t   f_frsize;
> > +       compat_uint_t   f_flags;
> > +       compat_uint_t   f_spare[4];
> > +} __attribute__((packed));
> > +#endif
>
> None of the architectures use the packed attribute at the moment,
> so please don't add one here.
>
> Changing compat_fsid_t to __kernel_fsid_t is harmless, but seems
> unnecessary.
Okay. I would add another
typedef __kernel_fsid_t compat_fsid_t;
in the file.

>
> Changing the signed int to an unsigned int (regardless of notation)
> may be a change in behavior. s390 is the only architecture
> using unsigned members here at the moment, as of b8668fd0a7e1
> ("s390/uapi: change struct statfs[64] member types to unsigned
> values").
> The description of that patch sounds like this was changed to fix
> a bug, but I don't see what the actual problem would be in the
> put_compat_statfs().
>
> For the moment I'd suggest leaving this with the signed version,
> with s390 being another exception next to mips. We can follow-up
> with merging s390 into the common definition using either the
> signed or unsigned types, but I think that needs to be a separate
> patch with a detailed explanation.
Okay, I would leave s390 origin first.

>
>  +#ifndef compat_ipc64_perm
> > +struct compat_ipc64_perm {
> > +       compat_key_t key;
> > +       __compat_uid32_t uid;
> > +       __compat_gid32_t gid;
> > +       __compat_uid32_t cuid;
> > +       __compat_gid32_t cgid;
> > +       compat_mode_t   mode;
> > +       unsigned char   __pad1[4 - sizeof(compat_mode_t)];
> > +       compat_ushort_t seq;
> > +       compat_ushort_t __pad2;
> > +       compat_ulong_t  unused1;
> > +       compat_ulong_t  unused2;
> > +} __attribute__((packed));
> > +
> > +struct compat_semid64_ds {
> > +       struct compat_ipc64_perm sem_perm;
> > +       compat_ulong_t sem_otime;
> > +       compat_ulong_t sem_otime_high;
> > +       compat_ulong_t sem_ctime;
> > +       compat_ulong_t sem_ctime_high;
> > +       compat_ulong_t sem_nsems;
> > +       compat_ulong_t __unused3;
> > +       compat_ulong_t __unused4;
> > +} __attribute__((packed));
> > +
> > +struct compat_msqid64_ds {
> > +       struct compat_ipc64_perm msg_perm;
> > +       compat_ulong_t msg_stime;
> > +       compat_ulong_t msg_stime_high;
> > +       compat_ulong_t msg_rtime;
> > +       compat_ulong_t msg_rtime_high;
> > +       compat_ulong_t msg_ctime;
> > +       compat_ulong_t msg_ctime_high;
> > +       compat_ulong_t msg_cbytes;
> > +       compat_ulong_t msg_qnum;
> > +       compat_ulong_t msg_qbytes;
> > +       compat_pid_t   msg_lspid;
> > +       compat_pid_t   msg_lrpid;
> > +       compat_ulong_t __unused4;
> > +       compat_ulong_t __unused5;
> > +} __attribute__((packed));
> > +
> > +struct compat_shmid64_ds {
> > +       struct compat_ipc64_perm shm_perm;
> > +       compat_size_t  shm_segsz;
> > +       compat_ulong_t shm_atime;
> > +       compat_ulong_t shm_atime_high;
> > +       compat_ulong_t shm_dtime;
> > +       compat_ulong_t shm_dtime_high;
> > +       compat_ulong_t shm_ctime;
> > +       compat_ulong_t shm_ctime_high;
> > +       compat_pid_t   shm_cpid;
> > +       compat_pid_t   shm_lpid;
> > +       compat_ulong_t shm_nattch;
> > +       compat_ulong_t __unused4;
> > +       compat_ulong_t __unused5;
> > +} __attribute__((packed));
> > +#endif
>
> I checked these in detail, looking at the seven architectures, and your
> conversion looks exactly right (I had initially missed the part about
> compat_mode_t that you got right).
>
> As with compat_flock, the packed attribute has no impact on the layout
> here, but please drop it anyway for consistency.
>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
