Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5DF25637
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 18:55:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hhf07YZzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 02:55:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="DVrrdj/u"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hgD5N4pzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 02:54:00 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id s17so19454966wru.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RjB7EuozO9SbpuWjY+CIL5jhjOJH/kZTishJT3qd1so=;
 b=DVrrdj/uSypBpQeJ7w1A/QlA+FyxTxrTjqgIjCbG0reYil1YwuJTymbPcq5VHJqvVz
 +ycMes6cu/p9bim38A9JdNpiuhKR9vQv7DKRlOjTKaH0aqGgcMNm9LyZRCsl86xL9T/2
 v52uCPRsGaEw7QZ8JAwWz7Kq/Yj8TlXF4sm4C/8FN/Sr2m4ymsOhSa0mlT/aKrxO9iLl
 j1mrN/7F1XvRVqFUi9infQrf5nFqVWvyb3hSIPgiuXrpPOdfJR8Np8CmTFbMGebX0RJF
 ggWVReABajaL93O9n4VuSlBrHfB9XuQYf2S00X4VsMQ9qcMjAtgT2YCUTAII0Ql7QzsL
 6EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RjB7EuozO9SbpuWjY+CIL5jhjOJH/kZTishJT3qd1so=;
 b=uE1i6xxXRV+xstqzxJ0uATnzLjXof7HKK5ltOuwiXf0OGywRRjzHHauRhdkpI0vqVw
 lIoj7V7JXyo43/hoXlqImjKeBeH223o2pCgd6prYSVQKq/f2Ko86QPWTPaBD/AqjQ3BP
 NRC0mlIlzGlDxFNbY9roDJLv1UPyNBUfD6iUaOAfB27GY7Cd5uGld5XKRRyHnIT3LKx2
 YRN5UWQcxuFr3B07Y0p12+Vc6P8Je8CuQEY9gAAIoZ+UEHBb3hd++CfD2mwNm8TARqQd
 L9g+zM8t+AiX0GtR4BUiNGa61rjzrg7z0WFPkKjO3CIxoHMf8KtSeHpfVjhoM6DgRs43
 TyGw==
X-Gm-Message-State: APjAAAWtog8AK4n6sIF846Snij8dFrkx9SoXlsAKQlX4ohI/nQ3f/eTB
 1RflMYfWOUCVWuE99pSDFRdN9w==
X-Google-Smtp-Source: APXvYqzvE8cesTA8vFkWKOJDTA1w0C5Fkm0j+9nhaMupM7B34j2tZxI4AHBlMWgH0cSYuDDVbKye1A==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr13850707wru.142.1558457632993; 
 Tue, 21 May 2019 09:53:52 -0700 (PDT)
Received: from brauner.io ([212.91.227.56])
 by smtp.gmail.com with ESMTPSA id t194sm6090599wmt.3.2019.05.21.09.53.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 09:53:52 -0700 (PDT)
Date: Tue, 21 May 2019 18:53:50 +0200
From: Christian Brauner <christian@brauner.io>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521165349.lduphxylwnfgael4@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <20190521150006.GJ17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190521150006.GJ17978@ZenIV.linux.org.uk>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, oleg@redhat.com,
 dhowells@redhat.com, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de,
 ldv@altlinux.org, linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 04:00:06PM +0100, Al Viro wrote:
> On Tue, May 21, 2019 at 01:34:47PM +0200, Christian Brauner wrote:
> 
> > This adds the close_range() syscall. It allows to efficiently close a range
> > of file descriptors up to all file descriptors of a calling task.
> > 
> > The syscall came up in a recent discussion around the new mount API and
> > making new file descriptor types cloexec by default. During this
> > discussion, Al suggested the close_range() syscall (cf. [1]). Note, a
> > syscall in this manner has been requested by various people over time.
> > 
> > First, it helps to close all file descriptors of an exec()ing task. This
> > can be done safely via (quoting Al's example from [1] verbatim):
> > 
> >         /* that exec is sensitive */
> >         unshare(CLONE_FILES);
> >         /* we don't want anything past stderr here */
> >         close_range(3, ~0U);
> >         execve(....);
> > 
> > The code snippet above is one way of working around the problem that file
> > descriptors are not cloexec by default. This is aggravated by the fact that
> > we can't just switch them over without massively regressing userspace. For
> > a whole class of programs having an in-kernel method of closing all file
> > descriptors is very helpful (e.g. demons, service managers, programming
> > language standard libraries, container managers etc.).
> > (Please note, unshare(CLONE_FILES) should only be needed if the calling
> >  task is multi-threaded and shares the file descriptor table with another
> >  thread in which case two threads could race with one thread allocating
> >  file descriptors and the other one closing them via close_range(). For the
> >  general case close_range() before the execve() is sufficient.)
> > 
> > Second, it allows userspace to avoid implementing closing all file
> > descriptors by parsing through /proc/<pid>/fd/* and calling close() on each
> > file descriptor. From looking at various large(ish) userspace code bases
> > this or similar patterns are very common in:
> > - service managers (cf. [4])
> > - libcs (cf. [6])
> > - container runtimes (cf. [5])
> > - programming language runtimes/standard libraries
> >   - Python (cf. [2])
> >   - Rust (cf. [7], [8])
> > As Dmitry pointed out there's even a long-standing glibc bug about missing
> > kernel support for this task (cf. [3]).
> > In addition, the syscall will also work for tasks that do not have procfs
> > mounted and on kernels that do not have procfs support compiled in. In such
> > situations the only way to make sure that all file descriptors are closed
> > is to call close() on each file descriptor up to UINT_MAX or RLIMIT_NOFILE,
> > OPEN_MAX trickery (cf. comment [8] on Rust).
> > 
> > The performance is striking. For good measure, comparing the following
> > simple close_all_fds() userspace implementation that is essentially just
> > glibc's version in [6]:
> > 
> > static int close_all_fds(void)
> > {
> >         DIR *dir;
> >         struct dirent *direntp;
> > 
> >         dir = opendir("/proc/self/fd");
> >         if (!dir)
> >                 return -1;
> > 
> >         while ((direntp = readdir(dir))) {
> >                 int fd;
> >                 if (strcmp(direntp->d_name, ".") == 0)
> >                         continue;
> >                 if (strcmp(direntp->d_name, "..") == 0)
> >                         continue;
> >                 fd = atoi(direntp->d_name);
> >                 if (fd == 0 || fd == 1 || fd == 2)
> >                         continue;
> >                 close(fd);
> >         }
> > 
> >         closedir(dir); /* cannot fail */
> >         return 0;
> > }
> > 
> > to close_range() yields:
> > 1. closing 4 open files:
> >    - close_all_fds(): ~280 us
> >    - close_range():    ~24 us
> > 
> > 2. closing 1000 open files:
> >    - close_all_fds(): ~5000 us
> >    - close_range():   ~800 us
> > 
> > close_range() is designed to allow for some flexibility. Specifically, it
> > does not simply always close all open file descriptors of a task. Instead,
> > callers can specify an upper bound.
> > This is e.g. useful for scenarios where specific file descriptors are
> > created with well-known numbers that are supposed to be excluded from
> > getting closed.
> > For extra paranoia close_range() comes with a flags argument. This can e.g.
> > be used to implement extension. Once can imagine userspace wanting to stop
> > at the first error instead of ignoring errors under certain circumstances.
> > There might be other valid ideas in the future. In any case, a flag
> > argument doesn't hurt and keeps us on the safe side.
> > 
> > >From an implementation side this is kept rather dumb. It saw some input
> > from David and Jann but all nonsense is obviously my own!
> > - Errors to close file descriptors are currently ignored. (Could be changed
> >   by setting a flag in the future if needed.)
> > - __close_range() is a rather simplistic wrapper around __close_fd().
> >   My reasoning behind this is based on the nature of how __close_fd() needs
> >   to release an fd. But maybe I misunderstood specifics:
> >   We take the files_lock and rcu-dereference the fdtable of the calling
> >   task, we find the entry in the fdtable, get the file and need to release
> >   files_lock before calling filp_close().
> >   In the meantime the fdtable might have been altered so we can't just
> >   retake the spinlock and keep the old rcu-reference of the fdtable
> >   around. Instead we need to grab a fresh reference to the fdtable.
> >   If my reasoning is correct then there's really no point in fancyfying
> >   __close_range(): We just need to rcu-dereference the fdtable of the
> >   calling task once to cap the max_fd value correctly and then go on
> >   calling __close_fd() in a loop.
> 
> > +/**
> > + * __close_range() - Close all file descriptors in a given range.
> > + *
> > + * @fd:     starting file descriptor to close
> > + * @max_fd: last file descriptor to close
> > + *
> > + * This closes a range of file descriptors. All file descriptors
> > + * from @fd up to and including @max_fd are closed.
> > + */
> > +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > +{
> > +	unsigned int cur_max;
> > +
> > +	if (fd > max_fd)
> > +		return -EINVAL;
> > +
> > +	rcu_read_lock();
> > +	cur_max = files_fdtable(files)->max_fds;
> > +	rcu_read_unlock();
> > +
> > +	/* cap to last valid index into fdtable */
> > +	if (max_fd >= cur_max)
> > +		max_fd = cur_max - 1;
> > +
> > +	while (fd <= max_fd)
> > +		__close_fd(files, fd++);
> > +
> > +	return 0;
> > +}
> 
> Umm...  That's going to be very painful if you dup2() something to MAX_INT and
> then run that; roughly 2G iterations of bouncing ->file_lock up and down,
> without anything that would yield CPU in process.
> 
> If anything, I would suggest something like
> 
> 	fd = *start_fd;
> 	grab the lock
>         fdt = files_fdtable(files);
> more:
> 	look for the next eviction candidate in ->open_fds, starting at fd
> 	if there's none up to max_fd
> 		drop the lock
> 		return NULL
> 	*start_fd = fd + 1;
> 	if the fscker is really opened and not just reserved
> 		rcu_assign_pointer(fdt->fd[fd], NULL);
> 		__put_unused_fd(files, fd);
> 		drop the lock
> 		return the file we'd got
> 	if (unlikely(need_resched()))
> 		drop lock
> 		cond_resched();
> 		grab lock
> 		fdt = files_fdtable(files);
> 	goto more;
> 
> with the main loop being basically
> 	while ((file = pick_next(files, &start_fd, max_fd)) != NULL)
> 		filp_close(file, files);

That's obviously much more clever than what I had.
I honestly have never thought about using open_fds before this. Seemed
extremely localized to file.c
Thanks for the pointers!

Christian
