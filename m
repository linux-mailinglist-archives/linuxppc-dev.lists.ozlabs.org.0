Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63F20B0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 17:24:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Zw2752xzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 01:24:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454ZtZ6psSzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 01:23:02 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6D1B81F0D;
 Thu, 16 May 2019 15:23:00 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.159])
 by smtp.corp.redhat.com (Postfix) with SMTP id CF52210027B9;
 Thu, 16 May 2019 15:22:54 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 16 May 2019 17:22:59 +0200 (CEST)
Date: Thu, 16 May 2019 17:22:53 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
Message-ID: <20190516152252.GD22564@redhat.com>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516142659.GB22564@redhat.com>
 <20190516145607.j43xyj26k6l5vmbd@yavin>
 <20190516150611.GC22564@redhat.com>
 <20190516151202.hrawrx7hxllmz2di@yavin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516151202.hrawrx7hxllmz2di@yavin>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 16 May 2019 15:23:01 +0000 (UTC)
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
 linux-mips@vger.kernel.org, dhowells@redhat.com, joel@joelfernandes.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dancol@google.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian@brauner.io>, serge@hallyn.com,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 luto@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/17, Aleksa Sarai wrote:
>
> On 2019-05-16, Oleg Nesterov <oleg@redhat.com> wrote:
> > On 05/17, Aleksa Sarai wrote:
> > > On 2019-05-16, Oleg Nesterov <oleg@redhat.com> wrote:
> > > > On 05/16, Christian Brauner wrote:
> > > > > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > > > > created pidfds at process creation time.
> > > >
> > > > Now I am wondering why do we need CLONE_PIDFD, you can just do
> > > >
> > > > 	pid = fork();
> > > > 	pidfd_open(pid);
> > >
> > > While the race window would be exceptionally short, there is the
> > > possibility that the child will die
> >
> > Yes,
> >
> > > and their pid will be recycled
> > > before you do pidfd_open().
> >
> > No.
> >
> > Unless the caller's sub-thread does wait() before pidfd_open(), of course.
> > Or unless you do signal(SIGCHILD, SIG_IGN).
>
> What about CLONE_PARENT?

I should have mentioned CLONE_PARENT ;)

Of course in this case the child can be reaped before pidfd_open(). But how often
do you or other people use clone(CLONE_PARENT) ? not to mention you can trivially
eliminate/detect this race if you really need this.

Don't get me wrong, I am not trying to say that CLONE_PIDFD is a bad idea.

But to me pidfd_open() is much more useful. Say, as a perl programmer I can easily
use pidfd_open(), but not CLONE_PIDFD.

Oleg.

