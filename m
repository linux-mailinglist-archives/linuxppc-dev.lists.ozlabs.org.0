Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA21F99BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:13:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ltb95MJ6zDqKK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lsyt6zWpzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:45:10 +1000 (AEST)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MDgtl-1ja4eU0Wm7-00Alqw for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun
 2020 15:31:53 +0200
Received: by mail-qv1-f42.google.com with SMTP id ec10so7725037qvb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 06:31:52 -0700 (PDT)
X-Gm-Message-State: AOAM5307LPbnn5QPqIfpuxZKDzKSCCB5N1zr2jLxIXkVErtVZ3KraSgJ
 opu9juGj6p2rQzYSwCETAKe1Sn6ReFi3L9xV8qg=
X-Google-Smtp-Source: ABdhPJyz/mDGs74yzNIwblWPhWFapqdfcdEr4Un1uVSJ/plIiN/A4CId8Axns/qweYspANUjYrgyMPVOZOnIui2BnnA=
X-Received: by 2002:a05:6214:846:: with SMTP id
 dg6mr23541266qvb.210.1592227911673; 
 Mon, 15 Jun 2020 06:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
In-Reply-To: <20200615130032.931285-3-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jun 2020 15:31:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
Message-ID: <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:71z8YDShqbvmBMn4uCo0Bg4SCpgxqc1eXKRgA+g7bnFIGr83alq
 GLYPH7PNiTRvRW2XgT4H1KRX5OtAwZlXtTKPBv/cOw/22kKfCVUx5QNkajvE73stcBBpOUm
 kcSDnPxtsxRTURQhX4abawpach/C336AZNJASY2bDS2TYgjYNsk4VG8Vf3tX4sB2NXE21R/
 ZHqYkzOFPBYzEzEpx9jhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5bijjeh19s4=:xVwIu96Z+edgq6uESlOkDv
 qnSWr1aKvkM0Q7VskIt28ug+GKY90C7wYq2m+1Pukdc5ueJ4N5hbw8FM9LchNbbckFi2dG9bf
 Smo0sfKjX3clJKVKZm8K7d3A5nLohU3a4Zc3ks+GacOZsR/I+JpG+WOPCFM3YvOeV2ezYnoVy
 K8AXkqhLotm4jlwadxWz29TWX1H8SaIPK056JcmAhDsoY0q4hSMUlUK5BQz7r7P34Q0uXP9pb
 H2qTeLegFQte8AQeMY4wtN5HA3oXKGkCwPD+pGT6ewO7RDdPk6PfgN7qBx1rzyfKEB7PKIdZS
 9Le74MyC9dsKhz5uzj93hkcbVxIr4yY1Bob9NsLVMQTAMlTMGXRQViNS8tfY8dbXANcVf9x61
 H5rqCkjEMZVh1elB+i4r/fylVOaiUrKyrPkYF5FWr8TAq/Y6JH0eq70qhX2V4Kh/8ynoKBlyX
 GtVr0IRp0eEdg6HZiSExWZV4/D/OnXYh2SnAXLlQtVSKp+/kWK7LHhg+UR1rcUXsZddJMmqHu
 2lSZqDtSUqSwCIOIyW4oOmCSsIHM+lxyADO65hUDb8liMg5/OK9r8YnbmzXkzsH9Z1mroMOwI
 Fl8xCl+Epw0oOOnPJWvVUCHDtrjgNaHwahdTBRVr2YcAbgEvw8DHQeY0efY4HC+S260ojyAl+
 NvEWEq0gTvVtXaAj5qIV8bbc9PQONNGv3yZfWU2PM5cLFToNmcVSp+ydSEDma+HxSWcrLMpaS
 T4iaGBozrDTHJBcC/dizi8kwDdNYHQoksemquVt7CMwERq6/ZFhAtAuDnZzQd2ruMRP4G6dGc
 y5em8oZwtbQidJXvtaB6IKFuGf6NFZXTNn/VhQl6m7sKMATcj8=
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
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The only differenence betweeen the compat exec* syscalls and their
> native versions is that compat_ptr sign extension, and the fact that
> the pointer arithmetics for the two dimensional arrays needs to use
> the compat pointer size.  Instead of the compat wrappers and the
> struct user_arg_ptr machinery just use in_compat_syscall() to do the
> right thing for the compat case deep inside get_user_arg_ptr().
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice!

I have an older patch doing the same for sys_mount() somewhere,
but never got around to send that. One day we should see if we
can just do this for all of them.

> -
> -static const char __user *get_user_arg_ptr(struct user_arg_ptr argv, int nr)
> +static const char __user *
> +get_user_arg_ptr(const char __user *const __user *argv, int nr)
>  {
>         const char __user *native;
>
>  #ifdef CONFIG_COMPAT
> -       if (unlikely(argv.is_compat)) {
> +       if (in_compat_syscall()) {
> +               const compat_uptr_t __user *compat_argv =
> +                       compat_ptr((unsigned long)argv);
>                 compat_uptr_t compat;
>
> -               if (get_user(compat, argv.ptr.compat + nr))
> +               if (get_user(compat, compat_argv + nr))
>                         return ERR_PTR(-EFAULT);
>
>                 return compat_ptr(compat);
>         }
>  #endif

I would expect that the "#ifdef CONFIG_COMPAT" can be removed
now, since compat_ptr() and in_compat_syscall() are now defined
unconditionally. I have not tried that though.

> +/*
> + * x32 syscalls are listed in the same table as x86_64 ones, so we need to
> + * define compat syscalls that are exactly the same as the native version for
> + * the syscall table machinery to work.  Sigh..
> + */
> +#ifdef CONFIG_X86_X32
>  COMPAT_SYSCALL_DEFINE3(execve, const char __user *, filename,
> -       const compat_uptr_t __user *, argv,
> -       const compat_uptr_t __user *, envp)
> +                      const char __user *const __user *, argv,
> +                      const char __user *const __user *, envp)
>  {
> -       return do_compat_execve(AT_FDCWD, getname(filename), argv, envp, 0);
> +       return do_execveat(AT_FDCWD, getname(filename), argv, envp, 0, NULL);
>  }

Maybe move it to arch/x86/kernel/process_64.c or arch/x86/entry/syscall_x32.c
to keep it out of the common code if this is needed. I don't really understand
the comment, why can't this just use this?

--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -379,7 +379,7 @@
 517    x32     recvfrom                compat_sys_recvfrom
 518    x32     sendmsg                 compat_sys_sendmsg
 519    x32     recvmsg                 compat_sys_recvmsg
-520    x32     execve                  compat_sys_execve
+520    x32     execve                  sys_execve
 521    x32     ptrace                  compat_sys_ptrace
 522    x32     rt_sigpending           compat_sys_rt_sigpending
 523    x32     rt_sigtimedwait         compat_sys_rt_sigtimedwait_time64
@@ -404,7 +404,7 @@
 542    x32     getsockopt              compat_sys_getsockopt
 543    x32     io_setup                compat_sys_io_setup
 544    x32     io_submit               compat_sys_io_submit
-545    x32     execveat                compat_sys_execveat
+545    x32     execveat                sys_execveat
 546    x32     preadv2                 compat_sys_preadv64v2
 547    x32     pwritev2                compat_sys_pwritev64v2
 548    x32     process_madvise         compat_sys_process_madvise

       Arnd
