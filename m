Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A23782ADB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2019 06:38:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45C43H1HS6zDqMv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2019 14:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=port70.net
 (client-ip=81.7.13.123; helo=port70.net; envelope-from=nsz@port70.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=port70.net
Received: from port70.net (port70.net [81.7.13.123])
 by lists.ozlabs.org (Postfix) with ESMTP id 45BzNf71BwzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 11:07:45 +1000 (AEST)
Received: by port70.net (Postfix, from userid 1002)
 id 64F7EABEC0BA; Sun, 26 May 2019 22:20:42 +0200 (CEST)
Date: Sun, 26 May 2019 22:20:42 +0200
From: Szabolcs Nagy <nsz@port70.net>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH v2 1/2] open: add close_range()
Message-ID: <20190526202041.GO16415@port70.net>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-2-christian@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523154747.15162-2-christian@brauner.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 27 May 2019 14:37:04 +1000
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
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 fweimer@redhat.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Christian Brauner <christian@brauner.io> [2019-05-23 17:47:46 +0200]:
> This adds the close_range() syscall. It allows to efficiently close a range
> of file descriptors up to all file descriptors of a calling task.
> 
> The syscall came up in a recent discussion around the new mount API and
> making new file descriptor types cloexec by default. During this
> discussion, Al suggested the close_range() syscall (cf. [1]). Note, a
> syscall in this manner has been requested by various people over time.
> 
> First, it helps to close all file descriptors of an exec()ing task. This
> can be done safely via (quoting Al's example from [1] verbatim):
> 
>         /* that exec is sensitive */
>         unshare(CLONE_FILES);
>         /* we don't want anything past stderr here */
>         close_range(3, ~0U);
>         execve(....);

this does not work in a hosted c implementation unless the libc
guarantees not to use libc internal fds (e.g. in execve).
(the libc cannot easily abstract fds, so the syscall abi layer
fd semantics is necessarily visible to user code.)

i think this is a new constraint for userspace runtimes.
(not entirely unreasonable though)

> The code snippet above is one way of working around the problem that file
> descriptors are not cloexec by default. This is aggravated by the fact that
> we can't just switch them over without massively regressing userspace. For
> a whole class of programs having an in-kernel method of closing all file
> descriptors is very helpful (e.g. demons, service managers, programming
> language standard libraries, container managers etc.).

was cloexec_range(a,b) considered?

> (Please note, unshare(CLONE_FILES) should only be needed if the calling
>  task is multi-threaded and shares the file descriptor table with another
>  thread in which case two threads could race with one thread allocating
>  file descriptors and the other one closing them via close_range(). For the
>  general case close_range() before the execve() is sufficient.)

assuming there is no unblocked signal handler that may open fds.

a syscall that tramples on fds not owned by the caller is ugly
(not generally safe to use and may break things if it gets used),
i don't have a better solution for fd leaks or missing cloexec,
but i think it needs more analysis how it can be used.
