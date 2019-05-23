Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DB27FCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:34:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458sSv747gzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 00:34:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BCy6Okmk"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458sRK5007zDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 00:32:43 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id c3so5618176otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmCv77ojMXG+c1Fp7DLXkEEMvKlYSuA0abYrccWopi8=;
 b=BCy6Okmk8ktr4nwvd4MspoIxsNlhMgBNgut3lK3gji1Mo8ZK86sDQuXYRAM0aEzKt1
 l5h9Z162b8ZZvcy3+o2m7mOM8MFYONAclzGI9eGRFt+MvF5Vk7qd2XbUpuRtY3kwxigT
 TItqAHhT39/xzIdVfEVUYP6dbydvV9umwbP2vl+FxdLXFLSb9ACpWUQrIu3LG0CJGus3
 efSiM9X4tBhY2RglIlFRNgfOwB840H3gEzgClahgzgTog6Yv+6has8aNNHrrbEHD2p91
 f4b1gS1SqBJkPyuKpLmeXF29Yw4PJv/H5cHfQKgbABzZI5vn49C4VG2ZQkov7h619lB0
 cONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmCv77ojMXG+c1Fp7DLXkEEMvKlYSuA0abYrccWopi8=;
 b=mcIBbfmjRYVs6MoPjoqqfV4Lo4dmwIAQVWhswtrwBMRyYGrMAfnwp1DKdJpW/VJfOP
 gEx8msJQ3kJvWHFyPTzJHmIq72cHT/fXf/dRq/oDc0G4CNeGSZBjOfAkGvOUXqepQWVo
 b8xmunroezAfxKUy4j+pJNEfU3R97pxnjmkyRh4Y0xh3PnqcxdzuRq443DjZjovypxfu
 p6yd5OJU8M9gCrR5YKrjUFtUCzRGHwyXqts5cTCPRCncgPlEd6diTwvcOzUA4PR1ax59
 t8p4CvXS9iwtA3b5v/JbJCT9zzWlYc8OJ/NMFuLU50ufwPMcWWIvjAgquQ/0YudrPXDm
 Fr3w==
X-Gm-Message-State: APjAAAU8fq2ZV6lkbctOpDpVJcAMVOpmUPiR8PdY6Cz59I7MitiJjFft
 /rvvwp7d0oVeld1t3z5Pw3hjohtelH7UreZ42sLx8g==
X-Google-Smtp-Source: APXvYqzFh/C6cDrkSdzIHZQLhSVRwEaU4gGSzclCCpHMgWTGugVQoxN/zVlngGYGKq3CVngNXUCDkIhtZyPn6qxtEko=
X-Received: by 2002:a9d:7f8b:: with SMTP id t11mr72319otp.110.1558621960440;
 Thu, 23 May 2019 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190522155259.11174-1-christian@brauner.io>
 <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
In-Reply-To: <20190523115118.pmscbd6kaqy37dym@brauner.io>
From: Jann Horn <jannh@google.com>
Date: Thu, 23 May 2019 16:32:14 +0200
Message-ID: <CAG48ez0Uq2GQnQsuPkNrDdJVku_6GPeZ_5F_-5J3iy2CULr0_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] open: add close_range()
To: Christian Brauner <christian@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-xtensa@linux-xtensa.org,
 Todd Kjos <tkjos@android.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k@lists.linux-m68k.org, Al Viro <viro@zeniv.linux.org.uk>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Dmitry V. Levin" <ldv@altlinux.org>, linux-arm-kernel@lists.infradead.org,
 Florian Weimer <fweimer@redhat.com>, linux-parisc@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 1:51 PM Christian Brauner <christian@brauner.io> wrote:
[...]
> I kept it dumb and was about to reply that your solution introduces more
> code when it seemed we wanted to keep this very simple for now.
> But then I saw that find_next_opened_fd() already exists as
> find_next_fd(). So it's actually not bad compared to what I sent in v1.
> So - with some small tweaks (need to test it and all now) - how do we
> feel about?:
[...]
> static int __close_next_open_fd(struct files_struct *files, unsigned *curfd, unsigned maxfd)
> {
>         struct file *file = NULL;
>         unsigned fd;
>         struct fdtable *fdt;
>
>         spin_lock(&files->file_lock);
>         fdt = files_fdtable(files);
>         fd = find_next_fd(fdt, *curfd);

find_next_fd() finds free fds, not used ones.

>         if (fd >= fdt->max_fds || fd > maxfd)
>                 goto out_unlock;
>
>         file = fdt->fd[fd];
>         rcu_assign_pointer(fdt->fd[fd], NULL);
>         __put_unused_fd(files, fd);

You can't do __put_unused_fd() if the old pointer in fdt->fd[fd] was
NULL - because that means that the fd has been reserved by another
thread that is about to put a file pointer in there, and if you
release the fd here, that messes up the refcounting (or hits the
BUG_ON() in __fd_install()).

> out_unlock:
>         spin_unlock(&files->file_lock);
>
>         if (!file)
>                 return -EBADF;
>
>         *curfd = fd;
>         filp_close(file, files);
>         return 0;
> }
>
> int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> {
>         if (fd > max_fd)
>                 return -EINVAL;
>
>         while (fd <= max_fd) {

Note that with a pattern like this, you have to be careful about what
happens if someone gives you max_fd==0xffffffff - then this condition
is always true and the loop can not terminate this way.

>                 if (__close_next_fd(files, &fd, maxfd))
>                         break;

(obviously it can still terminate this way)

>                 cond_resched();
>                 fd++;
>         }
>
>         return 0;
> }
