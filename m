Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD9255C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 18:38:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hKs1DVzzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 02:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hJL4Lm3zDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 02:37:38 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36C037FDEE;
 Tue, 21 May 2019 16:30:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-170.rdu2.redhat.com
 [10.10.120.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B1B95E7AF;
 Tue, 21 May 2019 16:30:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190521150006.GJ17978@ZenIV.linux.org.uk>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/2] open: add close_range()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28113.1558456227.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 May 2019 17:30:27 +0100
Message-ID: <28114.1558456227@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 21 May 2019 16:30:57 +0000 (UTC)
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
 torvalds@linux-foundation.org, Christian Brauner <christian@brauner.io>,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, tkjos@android.com,
 arnd@arndb.de, jannh@google.com, linux-m68k@lists.linux-m68k.org,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 fweimer@redhat.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Al Viro <viro@zeniv.linux.org.uk> wrote:

> Umm...  That's going to be very painful if you dup2() something to MAX_I=
NT and
> then run that; roughly 2G iterations of bouncing ->file_lock up and down=
,
> without anything that would yield CPU in process.
> =

> If anything, I would suggest something like
> =

> 	fd =3D *start_fd;
> 	grab the lock
>         fdt =3D files_fdtable(files);
> more:
> 	look for the next eviction candidate in ->open_fds, starting at fd
> 	if there's none up to max_fd
> 		drop the lock
> 		return NULL
> 	*start_fd =3D fd + 1;
> 	if the fscker is really opened and not just reserved
> 		rcu_assign_pointer(fdt->fd[fd], NULL);
> 		__put_unused_fd(files, fd);
> 		drop the lock
> 		return the file we'd got
> 	if (unlikely(need_resched()))
> 		drop lock
> 		cond_resched();
> 		grab lock
> 		fdt =3D files_fdtable(files);
> 	goto more;
> =

> with the main loop being basically
> 	while ((file =3D pick_next(files, &start_fd, max_fd)) !=3D NULL)
> 		filp_close(file, files);

If we can live with close_from(int first) rather than close_range(), then =
this
can perhaps be done a lot more efficiently by:

	new =3D alloc_fdtable(first);
	spin_lock(&files->file_lock);
	old =3D files_fdtable(files);
	copy_fds(new, old, 0, first - 1);
	rcu_assign_pointer(files->fdt, new);
	spin_unlock(&files->file_lock);
	clear_fds(old, 0, first - 1);
	close_fdt_from(old, first);
	kfree_rcu(old);

David
