Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7BF222CA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 11:49:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455gNs53cDzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 19:49:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="jbJ+akl1"; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455gMM05kxzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 19:48:10 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y11so4862361pfm.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3iehYO9/3dGuR87aVQtHa+k708l2fZGn5LAWJUJw+bI=;
 b=jbJ+akl1Oebe/G2zixKM7D3g8/7+hvJdUcG9NJHMi65TbSXZ/qBbCGH1hwdCWFXEia
 v5u721IWYUqsCoQEJBSjN5yxaOqNgOIUlFkv4bfOYzMj0px06ZqOaLQiVXwSfSdOtkCb
 eut+PHPZD1xgK0wVWmv7MP53RNVrElPU0eYIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3iehYO9/3dGuR87aVQtHa+k708l2fZGn5LAWJUJw+bI=;
 b=U5sSo8ZSMBVYIFH3buntmyO+rbYbQ167mNNMp9hnZTvlw5mnGDRk4WSKLgzXACT6zU
 4/lgh4MWbqO27tBthOcNDHxjD8CIeFZrdM23rl3flrqpoBfqT7EXszng4XJmeesSxBXR
 K/LLV3FeNBan4GhjTjFm2TxjHAKVq++tZSI5yxh8qH6poDYQn5YXn2rzyvg9FY42FcdB
 wBUj/ym5DDbAddEAvsSNIwi3TpM72cOf4iLKuaIi9buxX8bb3lutIbGKEvLmvtEsI5Sf
 CKWDqJsRrcc521al2oBzvs3fwXhEoVG+uacxLhbb1/8e+TRJaOiAe5xj7eIi7J3gyS6r
 8gTA==
X-Gm-Message-State: APjAAAUIlPiqGU0W4EaS4oe6cgS9bzGqpy+zRxQ6FwirSa8yIm8dOGCA
 qaMdBT4oU0oJapuS+0ja68oRuA==
X-Google-Smtp-Source: APXvYqxxxsUFV7eN5OTaebnkzWDt0kd+NHIjUI5fT4y6JUXpDdAsQ8fqEFtPRx00MMYQQHacYxzw8Q==
X-Received: by 2002:a63:f813:: with SMTP id n19mr60994204pgh.273.1558172886290; 
 Sat, 18 May 2019 02:48:06 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q4sm14705283pgb.39.2019.05.18.02.48.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 May 2019 02:48:05 -0700 (PDT)
Date: Sat, 18 May 2019 05:48:03 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
Message-ID: <20190516224949.GA15401@localhost>
References: <20190516135944.7205-1-christian@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516135944.7205-1-christian@brauner.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 sparclinux@vger.kernel.org, linux-api@vger.kernel.org,
 elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, dancol@google.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, serge@hallyn.com,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 luto@kernel.org, linux-mips@vger.kernel.orgg, tglx@linutronix.de,
 surenb@google.com, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, cyphar@cyphar.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

For next revision, could you also CC surenb@google.com as well? He is also
working on the low memory killer. And also suggest CC to
kernel-team@android.com. And mentioned some comments below, thanks.

On Thu, May 16, 2019 at 03:59:42PM +0200, Christian Brauner wrote:
[snip]  
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 20881598bdfa..4afca3d6dcb8 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -38,6 +38,7 @@
>  #include <linux/syscalls.h>
>  #include <linux/proc_ns.h>
>  #include <linux/proc_fs.h>
> +#include <linux/sched/signal.h>
>  #include <linux/sched/task.h>
>  #include <linux/idr.h>
>  
> @@ -451,6 +452,55 @@ struct pid *find_ge_pid(int nr, struct pid_namespace *ns)
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
> +	ret = 0;
> +	rcu_read_lock();
> +	/*
> +	 * If this returns non-NULL the pid was used as a thread-group
> +	 * leader. Note, we race with exec here: If it changes the
> +	 * thread-group leader we might return the old leader.
> +	 */
> +	tsk = pid_task(p, PIDTYPE_TGID);

Just trying to understand the comment here. The issue is that we might either
return the new leader, or the old leader depending on the overlap with
concurrent de_thread right? In either case, we don't care though.

I suggest to remove the "Note..." part of the comment since it doesn't seem the
race is relevant here unless we are doing something else with tsk in the
function, but if you want to keep it that's also fine. Comment text should
probably should be 'return the new leader' though.

> +	if (!tsk)
> +		ret = -ESRCH;

Perhaps -EINVAL?  AFAICS, this can only happen if a CLONE_THREAD pid was
passed as argument to pidfd_open which is invalid. But let me know what you
had in mind..

thanks,

 - Joel

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
> -- 
> 2.21.0
> 
