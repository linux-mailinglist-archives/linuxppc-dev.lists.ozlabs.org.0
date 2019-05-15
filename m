Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BD1FAF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 21:32:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4544T51Qs3zDqWk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 05:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=opteya.com
 (client-ip=2001:bc8:3541:100::1; helo=ou.quest-ce.net;
 envelope-from=ydroneaud@opteya.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=opteya.com
Received: from ou.quest-ce.net (unknown [IPv6:2001:bc8:3541:100::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4544PP4LpWzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 05:29:29 +1000 (AEST)
Received: from [2a01:e35:39f2:1220:2452:dd6c:fe2f:be2c] (helo=opteyam2)
 by ou.quest-ce.net with esmtpsa (TLS1.1:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <ydroneaud@opteya.com>)
 id 1hQuSD-0003J6-UX; Wed, 15 May 2019 16:00:22 +0200
Message-ID: <4c5ae46657e1931a832def5645db61eb0bf1accd.camel@opteya.com>
From: Yann Droneaud <ydroneaud@opteya.com>
To: Christian Brauner <christian@brauner.io>, jannh@google.com,
 oleg@redhat.com,  viro@zeniv.linux.org.uk, torvalds@linux-foundation.org, 
 linux-kernel@vger.kernel.org, arnd@arndb.de, dhowells@redhat.com
Date: Wed, 15 May 2019 16:00:20 +0200
In-Reply-To: <20190515100400.3450-1-christian@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
Organization: OPTEYA
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a01:e35:39f2:1220:2452:dd6c:fe2f:be2c
X-SA-Exim-Mail-From: ydroneaud@opteya.com
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on ou.quest-ce.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.2
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on ou.quest-ce.net)
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
 linux-mips@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org,
 linux-m68k@lists.linux-m68k.org, luto@kernel.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, cyphar@cyphar.com, luto@amacapital.net,
 ebiederm@xmission.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le mercredi 15 mai 2019 à 12:03 +0200, Christian Brauner a écrit :
> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 20881598bdfa..237d18d6ecb8 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -451,6 +452,53 @@ struct pid *find_ge_pid(int nr, struct
> pid_namespace *ns)
>  	return idr_get_next(&ns->idr, &nr);
>  }
>  
> +/**
> + * pidfd_open() - Open new pid file descriptor.
> + *
> + * @pid:   pid for which to retrieve a pidfd
> + * @flags: flags to pass
> + *
> + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> + * the process identified by @pid. Currently, the process identified by
> + * @pid must be a thread-group leader. This restriction currently exists
> + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> + * leaders).
> + *

Would it be possible to create file descriptor with "restricted"
operation ?

- O_RDONLY: waiting for process completion allowed (for example)
- O_WRONLY: sending process signal allowed

For example, a process could send over a Unix socket a process a pidfd,
allowing this to only wait for completion, but not sending signal ?

I see the permission check is not done in pidfd_open(), so what prevent
a user from sending a signal to another user owned process ?

If it's in pidfd_send_signal(), then, passing the socket through
SCM_RIGHT won't be useful if the target process is not owned by the
same user, or root.

> + * Return: On success, a cloexec pidfd is returned.
> + *         On error, a negative errno number will be returned.
> + */
> +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> +{
> +	int fd, ret;
> +	struct pid *p;
> +	struct task_struct *tsk;
> +
> +	if (flags)
> +		return -EINVAL;
> +
> +	if (pid <= 0)
> +		return -EINVAL;
> +
> +	p = find_get_pid(pid);
> +	if (!p)
> +		return -ESRCH;
> +
> +	rcu_read_lock();
> +	tsk = pid_task(p, PIDTYPE_PID);
> +	if (!tsk)
> +		ret = -ESRCH;
> +	else if (unlikely(!thread_group_leader(tsk)))
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	rcu_read_unlock();
> +
> +	fd = ret ?: pidfd_create(p);
> +	put_pid(p);
> +	return fd;
> +}
> +
>  void __init pid_idr_init(void)
>  {
>  	/* Verify no one has done anything silly: */

Regards.

-- 
Yann Droneaud
OPTEYA


