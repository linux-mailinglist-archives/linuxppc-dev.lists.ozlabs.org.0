Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1E24ED7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 14:18:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457ZYV6rZwzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 22:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=fweimer@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457ZWB2D2DzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 22:16:38 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAE443179162;
 Tue, 21 May 2019 12:09:38 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (dhcp-192-219.str.redhat.com
 [10.33.192.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8854750A63;
 Tue, 21 May 2019 12:09:30 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 1/2] open: add close_range()
References: <20190521113448.20654-1-christian@brauner.io>
Date: Tue, 21 May 2019 14:09:29 +0200
In-Reply-To: <20190521113448.20654-1-christian@brauner.io> (Christian
 Brauner's message of "Tue, 21 May 2019 13:34:47 +0200")
Message-ID: <87tvdoau12.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 21 May 2019 12:09:49 +0000 (UTC)
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
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu,
 x86@kernel.org, torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, oleg@redhat.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Christian Brauner:

> +/**
> + * __close_range() - Close all file descriptors in a given range.
> + *
> + * @fd:     starting file descriptor to close
> + * @max_fd: last file descriptor to close
> + *
> + * This closes a range of file descriptors. All file descriptors
> + * from @fd up to and including @max_fd are closed.
> + */
> +int __close_range(struct files_struct *files, unsigned fd, unsigned max_=
fd)
> +{
> +	unsigned int cur_max;
> +
> +	if (fd > max_fd)
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	cur_max =3D files_fdtable(files)->max_fds;
> +	rcu_read_unlock();
> +
> +	/* cap to last valid index into fdtable */
> +	if (max_fd >=3D cur_max)
> +		max_fd =3D cur_max - 1;
> +
> +	while (fd <=3D max_fd)
> +		__close_fd(files, fd++);
> +
> +	return 0;
> +}

This seems rather drastic.  How long does this block in kernel mode?
Maybe it's okay as long as the maximum possible value for cur_max stays
around 4 million or so.

Solaris has an fdwalk function:

  <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>

So a different way to implement this would expose a nextfd system call
to userspace, so that we can use that to implement both fdwalk and
closefrom.  But maybe fdwalk is just too obscure, given the existence of
/proc.

I'll happily implement closefrom on top of close_range in glibc (plus
fallback for older kernels based on /proc=E2=80=94with an abort in case that
doesn't work because the RLIMIT_NOFILE hack is unreliable
unfortunately).

Thanks,
Florian
