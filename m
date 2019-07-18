Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 572FB6D0C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 17:12:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qHgG37M2zDqXq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 01:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qHdH54hkzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 01:10:41 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id s145so20722135qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 08:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XVWuLALNboPCBpMHvtA7g3CoUrKrF0vBnrtFanWPT4=;
 b=IgcHGKdFUCHb39kd6zVLCV/Gf8YyGFESx1dqlYEHCWOhszabGgEkR802RaQP0cMxaa
 2nGBZW5Yf0p/X5WDqYGfU9yd57jqOxhFoX43glMJScAtsHj70/ORILMFjqohRekNLKhV
 nb1SOpSelIRCE2UjqUj+p5oZFbi2+fezOdcOFBzMefMlZJm56/Gg0JOqUosxMJT/8AR/
 Qvfm+7bEH3KK5HUC0jau70Ooa7VTXaJSqyC9gU+3HrmPIKX+vXWakVgMxnqUUfxg2Btj
 NLUukT4nnqblfweh2rQV+Q4an5Z+SR00FNo0aDgvD4muqweA4BHjWZXkM1deWJKakDbt
 xgpA==
X-Gm-Message-State: APjAAAW56PczrHobA/0PcuP/TlDRtAibyO9r0wlFrPMjkjOQfFgVVOef
 gCiIFyYL8wHI34xWhD9Uo+QfLFfSpZ2VB1KLC40=
X-Google-Smtp-Source: APXvYqz91qO2K9L71FiuX0Gt08O/27FhYjsXqzcDsg9SyRt3LsdEPpT+LHh0f5YfOz5Tbuae6UqhheF6pLTx7yCHlYU=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr30435448qkm.3.1563462638194; 
 Thu, 18 Jul 2019 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-9-cyphar@cyphar.com>
In-Reply-To: <20190706145737.5299-9-cyphar@cyphar.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jul 2019 17:10:21 +0200
Message-ID: <CAK8P3a33rGhPDFfRBAQyLTMG_WoEgX_toDgWR2O7rSwxKsZG+w@mail.gmail.com>
Subject: Re: [PATCH v9 08/10] open: openat2(2) syscall
To: Aleksa Sarai <cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 6, 2019 at 5:00 PM Aleksa Sarai <cyphar@cyphar.com> wrote:

> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
> index 9e7704e44f6d..1703d048c141 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -461,6 +461,7 @@
>  530    common  getegid                         sys_getegid
>  531    common  geteuid                         sys_geteuid
>  532    common  getppid                         sys_getppid
> +533    common  openat2                         sys_openat2
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
>  534    common  pidfd_send_signal               sys_pidfd_send_signal

My plan here was to add new syscalls in the same order as everwhere else,
just with the number 110 higher. In the long run, I hope we can automate
this.

> diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
> index aaf479a9e92d..4ad262698396 100644
> --- a/arch/arm/tools/syscall.tbl
> +++ b/arch/arm/tools/syscall.tbl
> @@ -447,3 +447,4 @@
>  431    common  fsconfig                        sys_fsconfig
>  432    common  fsmount                         sys_fsmount
>  433    common  fspick                          sys_fspick
> +434    common  openat2                         sys_openat2

434 is already used in linux-next, I suggest you use 437 (Palmer
just submitted fchmodat4, which could become 436).

> +/**
> + * Arguments for how openat2(2) should open the target path. If @extra is zero,
> + * then openat2(2) is identical to openat(2).
> + *
> + * @flags: O_* flags (unknown flags ignored).
> + * @mode: O_CREAT file mode (ignored otherwise).
> + * @upgrade_mask: restrict how the O_PATH may be re-opened (ignored otherwise).
> + * @resolve: RESOLVE_* flags (-EINVAL on unknown flags).
> + * @reserved: reserved for future extensions, must be zeroed.
> + */
> +struct open_how {
> +       __u32 flags;
> +       union {
> +               __u16 mode;
> +               __u16 upgrade_mask;
> +       };
> +       __u16 resolve;
> +       __u64 reserved[7]; /* must be zeroed */
> +};

We can have system calls with up to six arguments on all architectures, so
this could still be done more conventionally without the indirection: like

long openat2(int dfd, const char __user * filename, int flags, mode_t
mode_mask, __u16 resolve);

In fact, that seems similar enough to the existing openat() that I think
you could also just add the fifth argument to the existing call when
a newly defined flag is set, similarly to how we only use the 'mode'
argument when O_CREAT or O_TMPFILE are set.

> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h

This file seems to lack a declaration for the system call, which means it
will cause a build failure on some architectures, e.g. arch/arc/kernel/sys.c:

#define __SYSCALL(nr, call) [nr] = (call),
void *sys_call_table[NR_syscalls] = {
        [0 ... NR_syscalls-1] = sys_ni_syscall,
#include <asm/unistd.h>
};

        Arnd
