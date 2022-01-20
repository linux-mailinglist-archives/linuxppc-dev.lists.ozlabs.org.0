Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565DD494E27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 13:46:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jfj261gSKz3bY6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 23:46:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfj1g19Skz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 23:46:29 +1100 (AEDT)
Received: from mail-oi1-f172.google.com ([209.85.167.172]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9Frj-1nGI8D2TNX-006S9c for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 13:46:26 +0100
Received: by mail-oi1-f172.google.com with SMTP id s9so8643391oib.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 04:46:25 -0800 (PST)
X-Gm-Message-State: AOAM531uUXwtzmrso4eMi9sLhpujVnNAC5UnJ2MuAhjsPJSYuk6Hn32b
 dTAR32rqKG2W4JW1VBC5ANjGzD8uCnmF3mdQHIU=
X-Google-Smtp-Source: ABdhPJydc5loEDqeQgQKrusgbi1aGxD+tZ0GQwF7Qc/YGyFSxdDyRJjWKaddNyUDdWoTK5tk0vBiI2MFsnHozVbpMM8=
X-Received: by 2002:a05:6808:2206:: with SMTP id
 bd6mr7227920oib.11.1642679565024; 
 Thu, 20 Jan 2022 03:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-4-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 12:52:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
Message-ID: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
Subject: Re: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:omSINcK4H3+dgqkie3lHVkKhvSc6HI72JbKQ+CplIQjnuJzvtVc
 knk4+m62qZDLP5kSH2h36y2vZQHbSNKIUpDbvhR7huAz4k8gVx1p6xCzij7+E/T2cL6a9sC
 /VJeFM9mJjJZCvI6M4DxxvbLIzvevwOvQF4coZ8+ErQARS4mI79GB9JO6yk95DtJXMSzZIp
 UG7KCSAbULiyYEPsg4XGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uhSjc0JOAD8=:ESI88QfLa9JJnGNuMu9hWx
 2Il+b2W8V/dWMVK1NIJ5fQfCpRg/+y5tb3ZXbNulK1D4p2emQHSutCmcUH0jI8YM+597FF+Lh
 jItpwHZfOJkgTKJ3QLwHudcFtBEfTIWax7LzMec3+23SU+fN0KRxenTOMDq25EQVvCQ0Mksm/
 jpK+HxJO4w8E6UXOgncfc/l9rqjS8RNEN1kD2pWPVNL02PdYbhfM0u8YnBcl7N/TFrTUlb2W8
 8EWSJTvELBzXoZd24zTyhMbmWwso2cYXi6/T/SGhixItdpvPAbPvWFG16+a3lepcNc6nWaFli
 ZPnY025q8W/pUi3qtX4XcNQ+YoMLG04R8/WgneoZN9dTLufUemsYVF/gIwytcoFdKQq2n5jQj
 eQHn630XI0+cRyXBgQXOCbwbvLKD7tpjTniZm8Laj4sXGGHKoCz+04TuAKU8ehB8ofD6Zvkz/
 bryPFhAxyEgtdigVaJGTcw2qX8dKnz21ISTDvzpVvqAbpPYZkmTYzzrQsVA5zhVrbAriw4jf/
 oM5Vzxzoa+CiRLerGvXCNTP1AUdPKA4O1crRrvJxVl7vILjN8JnN9FvTLhyBUFU5TM1Vz87wu
 onU/NaCvFphCflDrIx5dxUHunBdVFPRvgWVnMK/KkSSTmEb0n+jnGC28HMHxJIvOqjpIXx/1a
 +ooa2QbkxZnmfgAQtJkil/kgQwUoDZHcqR0s0esqV1YzdrPQcZBQRTRiBiNWoADAE80GPoxY0
 kkxs2V1e/Jh6Y8bqCKVrp641VC1Bezowbds8PoExt+8aiLgoej1t8bNH7CZ+o1GgxMHmxasf9
 QLDsa4SJKL8LFpUMTP0diurme2GkOelwU/UtH6wtyjc24i4hb0=
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

  On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
>           compat_msqid64_ds, compat_shmid64_ds
>
> Cleanup duplicate definitions and merge them into asm-generic.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

> ---
>  arch/arm64/include/asm/compat.h   | 108 +++-----------------------
>  arch/mips/include/asm/compat.h    |  24 ++----
>  arch/parisc/include/asm/compat.h  |  47 ++----------
>  arch/powerpc/include/asm/compat.h |  47 ++----------
>  arch/s390/include/asm/compat.h    | 109 +++-----------------------
>  arch/sparc/include/asm/compat.h   |  39 ++++------
>  arch/x86/include/asm/compat.h     | 114 +++-------------------------
>  include/asm-generic/compat.h      | 122 ++++++++++++++++++++++++++++++
>  8 files changed, 191 insertions(+), 419 deletions(-)
>
> diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
> index eaa6ca062d89..f54f295efae3 100644
> --- a/arch/arm64/include/asm/compat.h
> +++ b/arch/arm64/include/asm/compat.h
> @@ -5,9 +5,18 @@
>  #ifndef __ASM_COMPAT_H
>  #define __ASM_COMPAT_H
>
> +#define COMPAT_RLIM_INFINITY           0xffffffff
...
> +#ifndef COMPAT_RLIM_INFINITY
> +#define COMPAT_RLIM_INFINITY   0x7fffffff
> +#endif

While this is a correct conversion, I think the default should
be 0xffffffff, to match the asm-generic RLIM_INFINITY
definition, with only mips and sparc getting the exception

> -struct compat_flock {
> -       short           l_type;
> -       short           l_whence;
> -       compat_off_t    l_start;
> -       compat_off_t    l_len;
> -       compat_pid_t    l_pid;
> -};
...
> +#ifndef compat_flock
> +struct compat_flock {
> +       compat_short_t  l_type;
> +       compat_short_t  l_whence;
> +       compat_off_t    l_start;
> +       compat_off_t    l_len;
> +       compat_pid_t    l_pid;
> +} __attribute__((packed));
> +#endif

You are adding __attribute__((packed)) here, which I think has
no effect on the layout on the structure on any of the architectures
but it does change the alignment requirements needlessly.

Better leave it without the attribute.

> -struct compat_flock64 {
> -       short           l_type;
> -       short           l_whence;
> -       compat_loff_t   l_start;
> -       compat_loff_t   l_len;
> -       compat_pid_t    l_pid;
> -};
...
> +#ifndef compat_flock64
> +struct compat_flock64 {
> +       compat_short_t  l_type;
> +       compat_short_t  l_whence;
> +       compat_loff_t   l_start;
> +       compat_loff_t   l_len;
> +       compat_pid_t    l_pid;
> +} __attribute__((packed));
> +#endif

This one is different: on all architectures other than x86,
the added packed attribute changes the size of the
structure by removing the four padding bytes at the
end. x86 originally added the attribute here to work around
the weirdness of the x86-32 ABI that aligns 64-bit values
on a 4-byte boundary.

The easiest workaround would be to have x86 keep its
custom definition. A slightly nicer version would drop the
attribute on x86 as well but instead change the compat_loff_t
definition to use compat_s64 instead of s64, giving it the
correct alignment.

> -struct compat_statfs {
> -       int             f_type;
> -       int             f_bsize;
> -       int             f_blocks;
> -       int             f_bfree;
> -       int             f_bavail;
> -       int             f_files;
> -       int             f_ffree;
> -       compat_fsid_t   f_fsid;
> -       int             f_namelen;      /* SunOS ignores this field. */
> -       int             f_frsize;
> -       int             f_flags;
> -       int             f_spare[4];
> -};
...
> +#ifndef compat_statfs
> +struct compat_statfs {
> +       compat_uint_t   f_type;
> +       compat_uint_t   f_bsize;
> +       compat_uint_t   f_blocks;
> +       compat_uint_t   f_bfree;
> +       compat_uint_t   f_bavail;
> +       compat_uint_t   f_files;
> +       compat_uint_t   f_ffree;
> +       __kernel_fsid_t f_fsid;
> +       compat_uint_t   f_namelen;
> +       compat_uint_t   f_frsize;
> +       compat_uint_t   f_flags;
> +       compat_uint_t   f_spare[4];
> +} __attribute__((packed));
> +#endif

None of the architectures use the packed attribute at the moment,
so please don't add one here.

Changing compat_fsid_t to __kernel_fsid_t is harmless, but seems
unnecessary.

Changing the signed int to an unsigned int (regardless of notation)
may be a change in behavior. s390 is the only architecture
using unsigned members here at the moment, as of b8668fd0a7e1
("s390/uapi: change struct statfs[64] member types to unsigned
values").
The description of that patch sounds like this was changed to fix
a bug, but I don't see what the actual problem would be in the
put_compat_statfs().

For the moment I'd suggest leaving this with the signed version,
with s390 being another exception next to mips. We can follow-up
with merging s390 into the common definition using either the
signed or unsigned types, but I think that needs to be a separate
patch with a detailed explanation.

 +#ifndef compat_ipc64_perm
> +struct compat_ipc64_perm {
> +       compat_key_t key;
> +       __compat_uid32_t uid;
> +       __compat_gid32_t gid;
> +       __compat_uid32_t cuid;
> +       __compat_gid32_t cgid;
> +       compat_mode_t   mode;
> +       unsigned char   __pad1[4 - sizeof(compat_mode_t)];
> +       compat_ushort_t seq;
> +       compat_ushort_t __pad2;
> +       compat_ulong_t  unused1;
> +       compat_ulong_t  unused2;
> +} __attribute__((packed));
> +
> +struct compat_semid64_ds {
> +       struct compat_ipc64_perm sem_perm;
> +       compat_ulong_t sem_otime;
> +       compat_ulong_t sem_otime_high;
> +       compat_ulong_t sem_ctime;
> +       compat_ulong_t sem_ctime_high;
> +       compat_ulong_t sem_nsems;
> +       compat_ulong_t __unused3;
> +       compat_ulong_t __unused4;
> +} __attribute__((packed));
> +
> +struct compat_msqid64_ds {
> +       struct compat_ipc64_perm msg_perm;
> +       compat_ulong_t msg_stime;
> +       compat_ulong_t msg_stime_high;
> +       compat_ulong_t msg_rtime;
> +       compat_ulong_t msg_rtime_high;
> +       compat_ulong_t msg_ctime;
> +       compat_ulong_t msg_ctime_high;
> +       compat_ulong_t msg_cbytes;
> +       compat_ulong_t msg_qnum;
> +       compat_ulong_t msg_qbytes;
> +       compat_pid_t   msg_lspid;
> +       compat_pid_t   msg_lrpid;
> +       compat_ulong_t __unused4;
> +       compat_ulong_t __unused5;
> +} __attribute__((packed));
> +
> +struct compat_shmid64_ds {
> +       struct compat_ipc64_perm shm_perm;
> +       compat_size_t  shm_segsz;
> +       compat_ulong_t shm_atime;
> +       compat_ulong_t shm_atime_high;
> +       compat_ulong_t shm_dtime;
> +       compat_ulong_t shm_dtime_high;
> +       compat_ulong_t shm_ctime;
> +       compat_ulong_t shm_ctime_high;
> +       compat_pid_t   shm_cpid;
> +       compat_pid_t   shm_lpid;
> +       compat_ulong_t shm_nattch;
> +       compat_ulong_t __unused4;
> +       compat_ulong_t __unused5;
> +} __attribute__((packed));
> +#endif

I checked these in detail, looking at the seven architectures, and your
conversion looks exactly right (I had initially missed the part about
compat_mode_t that you got right).

As with compat_flock, the packed attribute has no impact on the layout
here, but please drop it anyway for consistency.

        Arnd
