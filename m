Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8F495078
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 15:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jflcj1K3Xz30NW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 01:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JflcB0Mvxz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 01:43:04 +1100 (AEDT)
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MrhLw-1mY8ox41v2-00njNS for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 15:43:00 +0100
Received: by mail-oi1-f179.google.com with SMTP id y14so9143320oia.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:42:59 -0800 (PST)
X-Gm-Message-State: AOAM531qFFBZab7q6UBcfQEH4Ofix2fQqkL/m0huOUPMJ/P04sBzhszJ
 VM62K5V2MEmK8o/s3bNcrt7wRLGM9ERKDHJcnsk=
X-Google-Smtp-Source: ABdhPJx7CtRumP0QQYfXweJthBATxPSWS8llRiPfBtrUDHNd5XtCBWTkqgRw8si0X+m1xq787CRD7WnkdtRMWwwXsuo=
X-Received: by 2002:a05:6808:1490:: with SMTP id
 e16mr7781849oiw.84.1642689778452; 
 Thu, 20 Jan 2022 06:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-9-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 15:42:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
Message-ID: <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wArWYm0L+Xelosl1ZzRjtDEqRz9EH5+1SMpAcdxozSNVZ09oEb0
 rYNFlC03gDQhgjbqxC5FNEODTQJeq7XC4fwR/alghfQ5F7QRmgaKlTi4wy2SjA6jF0QPpHc
 eIphHtgLF+UK9fiqnj8N4b69nvVVnx6ZCRwcsX8L/ktX6S8+S87Vt4lffPnQ3AZ9qbaRRS1
 OcbPIOWtDTh27srlzlzcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hYm4ZHPdYnE=:bO5HEwUsrzlARO/wSuMFUK
 uZcCuRiUm4UUOqN9coka+yiSMRYHDB2kfXjLfDLyIsArjVrjZRUJyjpyeIVxU7JBWdrtCDqNu
 R9pXb5EQoYQVRsZnc8coXtmVfUhLTH33pXT33w7kYOWI6EnaefHVi8v0c1awFnZm+i8eWIwet
 Ol/yf14B5IZpw1OYdC6KElELb3RgU2jMPL2mH068Hr5fiEG1adXm2IGkjsu6cztHw5m1NkBfC
 iuwJ/0qh/ykyiQuMWDWy4JS2T2j6qZuXMlcyfFaiGBpbNyijskC/vCx+H6MuOW4ZrgKtBLaRu
 QTg6vkZ2Hqk/SteButg+oIT8rkqB8ptr5SJZrXHvjkXpG8fp6j/RGH0KVg+8CXotEXiPqCU7V
 CWUx74cJZ183+TDGV983AU9Ep0/LGyzYhck3WbSC7+hu/RtAYHTFZMSrlxutefJ6pT9S1m9J3
 NTEln2ikXki19Ge6RW4Nq1nUiwPV/rY=
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

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
>  /* The array of function pointers for syscalls. */
>  extern void * const sys_call_table[];
> +#ifdef CONFIG_COMPAT
> +extern void * const compat_sys_call_table[];
> +#endif

No need for the #ifdef, the normal convention is to just define the
extern declaration unconditionally for symbols that may or may not be defined.

> +COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
> +                      arg_u32p(length))
> +{
> +       return ksys_truncate(pathname, arg_u64(length));
> +}

Are you sure these are the right calling conventions? According to [1],
I think the 64-bit argument should be in an aligned pair of registers,
which means you need an extra pad argument as in the arm64 version
of these functions. Same for ftruncate64, pread64, pwrite64, and
readahead.

> +COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
> +{
> +       return ksys_ftruncate(fd, arg_u64(length));
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
> +                      arg_u32p(offset), arg_u32p(len))
> +{
> +       return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
> +}
> +
> +COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
> +                      size_t, count, arg_u32p(pos))
> +{
> +       return ksys_pread64(fd, buf, count, arg_u64(pos));
> +}
> +
> +COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
> +                      const char __user *, buf, size_t, count, arg_u32p(pos))
> +{
> +       return ksys_pwrite64(fd, buf, count, arg_u64(pos));
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
> +                      arg_u32p(nbytes), unsigned int, flags)
> +{
> +       return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
> +                                   flags);
> +}
> +
> +COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
> +                      size_t, count)
> +{
> +       return ksys_readahead(fd, arg_u64(offset), count);
> +}
> +
> +COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
> +                      arg_u32p(len))
> +{
> +       return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
> +}

I still feel like these should be the common implementations next to the
native handlers inside of an #ifdef CONFIG_COMPAT.

The names clash with the custom versions defined for powerpc and sparc,
but the duplicates look compatible if you can account for the padded
argument and the lo/hi order of the pairs, so could just be removed here
(all other architectures use custom function names instead).

        Arnd

[1] https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf
