Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E627FF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:39:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458sbW13HjzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 00:39:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="YbCZESmb"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458sY12322zDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 00:37:39 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id m3so10104448itl.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DahHECUK2AF1J12XBLs2bKF9FH9rjTuzkU7KMfzCZKg=;
 b=YbCZESmbvCwAQCtgJ5vNBW4fzZ0rmez/RQRMkvQ2gBf8m2vQZ7pZbh6Bnf/yhxyKVI
 53LigfqSgxhhyV3cJwQAxeBYmchcYj4+L6sb6hM6ANhJ3YzqD5nVaV8VUWyXmRfwM0Js
 s0qbXNd2fPwKrwA6FMsqrbW+O3oe4jc4dfMVogKbtgea8qKxT3IcnEz6YQoGlNR0pY3m
 WBeNhDCmn5OB53HQT4TWeQ+Gay0cWaoJ8RQtor16rRwite01Brwb3BNAlCJ/+wg1v28J
 HJ9HsyrSvI8gu0Uy/czVhZ9L/NkkHH+hj2hN0LXZm7YA7qWQlzwpnrEcctNdcL7rOP5V
 pe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DahHECUK2AF1J12XBLs2bKF9FH9rjTuzkU7KMfzCZKg=;
 b=ZoFCzabKZHQkqugo5riA+RJ5p4mEvNSKUAWYYNLX5kRkERR/xRpyvG9rAbVd6P/XMQ
 XE7QIABiALjkSLIpEYo5/eyZiGNnm7AJ0JIwlChpCP69f2YLrVrJ/HFNDiaWRTpDTw+/
 UlzTcILGy3z926FnmUYS5oAEmaCV9t7YeVplN8ASpCD90008GiRW6yAC5MKHUAss1pkf
 BOqt9Pc1SIVnKvBmwpNgzbKALn5elfr/fe5uX81aOTbuw1JRgsA8WuV4APSqaIUy5lBG
 NwVl47aOBOEjDaYTExYW3Sw/gpi4qYQmsMw31N3LBjlHkzVp+dPmf3OLs+28yiozh+F0
 NjPQ==
X-Gm-Message-State: APjAAAXPjOMdlX32a83DC/YKMDClWA13hqqCxmkl8eUvYzRbnFL8kPWb
 AQLDU4eHBsDbh7US7s3nyOMCCA==
X-Google-Smtp-Source: APXvYqxCsu1nKhbS62harFEpfvgZRg7+s7a4b8LII1alkH5yuzE7xzETotobVwglIakCJJls3jgHwg==
X-Received: by 2002:a02:9381:: with SMTP id z1mr24471487jah.130.1558622256966; 
 Thu, 23 May 2019 07:37:36 -0700 (PDT)
Received: from brauner.io ([172.56.12.187])
 by smtp.gmail.com with ESMTPSA id l186sm4603784itb.5.2019.05.23.07.37.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 23 May 2019 07:37:36 -0700 (PDT)
Date: Thu, 23 May 2019 16:37:26 +0200
From: Christian Brauner <christian@brauner.io>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH v1 1/2] open: add close_range()
Message-ID: <20190523143725.y67czx4jxsy6yqrj@brauner.io>
References: <20190522155259.11174-1-christian@brauner.io>
 <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
 <CAG48ez0Uq2GQnQsuPkNrDdJVku_6GPeZ_5F_-5J3iy2CULr0_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG48ez0Uq2GQnQsuPkNrDdJVku_6GPeZ_5F_-5J3iy2CULr0_Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
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

On Thu, May 23, 2019 at 04:32:14PM +0200, Jann Horn wrote:
> On Thu, May 23, 2019 at 1:51 PM Christian Brauner <christian@brauner.io> wrote:
> [...]
> > I kept it dumb and was about to reply that your solution introduces more
> > code when it seemed we wanted to keep this very simple for now.
> > But then I saw that find_next_opened_fd() already exists as
> > find_next_fd(). So it's actually not bad compared to what I sent in v1.
> > So - with some small tweaks (need to test it and all now) - how do we
> > feel about?:
> [...]
> > static int __close_next_open_fd(struct files_struct *files, unsigned *curfd, unsigned maxfd)
> > {
> >         struct file *file = NULL;
> >         unsigned fd;
> >         struct fdtable *fdt;
> >
> >         spin_lock(&files->file_lock);
> >         fdt = files_fdtable(files);
> >         fd = find_next_fd(fdt, *curfd);
> 
> find_next_fd() finds free fds, not used ones.
> 
> >         if (fd >= fdt->max_fds || fd > maxfd)
> >                 goto out_unlock;
> >
> >         file = fdt->fd[fd];
> >         rcu_assign_pointer(fdt->fd[fd], NULL);
> >         __put_unused_fd(files, fd);
> 
> You can't do __put_unused_fd() if the old pointer in fdt->fd[fd] was
> NULL - because that means that the fd has been reserved by another
> thread that is about to put a file pointer in there, and if you
> release the fd here, that messes up the refcounting (or hits the
> BUG_ON() in __fd_install()).
> 
> > out_unlock:
> >         spin_unlock(&files->file_lock);
> >
> >         if (!file)
> >                 return -EBADF;
> >
> >         *curfd = fd;
> >         filp_close(file, files);
> >         return 0;
> > }
> >
> > int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > {
> >         if (fd > max_fd)
> >                 return -EINVAL;
> >
> >         while (fd <= max_fd) {
> 
> Note that with a pattern like this, you have to be careful about what
> happens if someone gives you max_fd==0xffffffff - then this condition
> is always true and the loop can not terminate this way.
> 
> >                 if (__close_next_fd(files, &fd, maxfd))
> >                         break;
> 
> (obviously it can still terminate this way)

Yup, this was only a quick draft.
I think the dumb simple thing that I did before was the best way to do
it for now.
I first thought that the find_next_open_fd() function already exists but
when I went to write a POC for testing realized it doesn't anyway.
