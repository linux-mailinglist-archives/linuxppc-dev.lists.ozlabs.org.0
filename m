Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C32230E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 12:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455gmH6pD0zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 20:06:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="MzXf8JwF"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455gkz0QjgzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 20:05:13 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id n17so14783173edb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kuxvODYNXQX1UADGYTekrXKJHl9GqTdixhHyMJoLFkg=;
 b=MzXf8JwF72gJj2Pq8n12P+UywZxc2BVXTvpiVUKrEniJVb1LIFP3IbcOliQYISdvq7
 CigvtYVzwi+8s8BzhGA7JzeYEAEgELRKSJUGXkBeKo3jIoY+k+AIz1NIGNQ3IbqWFvd/
 pZcoiBfjP1G87UNeXXgpYPrDlzF+SvvAxTS1B9J01RvJsEbVREubCnWtrpwlE+W8uhC8
 abJb2p1WNSljrqCFAQH7at9A4yXrlhg+5ZrhECybT+pFDJTv4XLPhvmKoEIQriQEdsEE
 2qeWRYeIhjWVjN8Omnws0ZotrB2BKKuxhO4+QGekj7Ec6VajrUKLl5oRB10tcR/KFGxb
 SomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kuxvODYNXQX1UADGYTekrXKJHl9GqTdixhHyMJoLFkg=;
 b=NO4JMj1UiS+V6L4FhrRx5hsaDyh0Inhp1tOicX89SSbdFGrpVaH1JSRv7rDyx7IuVa
 PoVCnjtsLbFwV6eIQJaO33xgbxBDZGlzlvgp6xm0I1k3DOcvsVZo4N9qoauewEDhMSnA
 /wVbYzpEBb6vvAjRY//osSxPl/MecGp4ViMTDYYEfAZByOiOHJyQjgSgsKCT7vnHS2U/
 pMT6mfmxzVJ8HKQZ/Wf99ljTGV8dIrCb993VP97PzDFB18TrF9wPRVDCS7VkeoH7tiOI
 7RbQp5m/3/kbbpzUG53c9ufyMYw3H5Q4WsrcG8gDiHR+kTGigvcOAP6u4rsz49fQNqCd
 v2Uw==
X-Gm-Message-State: APjAAAV7gCpBSNfbfAw7dj+CEA5OEdFwd/NlA1Mq7lyXcQr8z9OHdT4n
 C0Ni0155LsukuvyYLmr2BJJYfw==
X-Google-Smtp-Source: APXvYqyJ8cSwup5T+wLOXgE4G1RIJN3Q14FiCUfotn6HCvE35vO+QFm+mQrHo4U4TisKcq8ZEYMBDQ==
X-Received: by 2002:a50:b82d:: with SMTP id j42mr63022736ede.186.1558173905455; 
 Sat, 18 May 2019 03:05:05 -0700 (PDT)
Received: from brauner.io ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id y30sm3741910edc.83.2019.05.18.03.04.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 18 May 2019 03:05:04 -0700 (PDT)
Date: Sat, 18 May 2019 12:04:46 +0200
From: Christian Brauner <christian@brauner.io>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
Message-ID: <20190518100435.c5bqpcnra53dsr6p@brauner.io>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516224949.GA15401@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190516224949.GA15401@localhost>
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
 sparclinux@vger.kernel.org, linux-api@vger.kernel.org,
 elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, dancol@google.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, kernel-team@android.com,
 serge@hallyn.com, linux-xtensa@linux-xtensa.org, keescook@chromium.org,
 arnd@arndb.de, jannh@google.com, linux-m68k@lists.linux-m68k.org,
 viro@zeniv.linux.org.uk, luto@kernel.org, linux-mips@vger.kernel.orgg,
 tglx@linutronix.de, surenb@google.com, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, cyphar@cyphar.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 18, 2019 at 05:48:03AM -0400, Joel Fernandes wrote:
> Hi Christian,
> 
> For next revision, could you also CC surenb@google.com as well? He is also
> working on the low memory killer. And also suggest CC to
> kernel-team@android.com. And mentioned some comments below, thanks.

Yip, totally. Just added them both to my Cc list. :)
(I saw you added Suren manually. I added the Android kernel team now too.)

> 
> On Thu, May 16, 2019 at 03:59:42PM +0200, Christian Brauner wrote:
> [snip]  
> > diff --git a/kernel/pid.c b/kernel/pid.c
> > index 20881598bdfa..4afca3d6dcb8 100644
> > --- a/kernel/pid.c
> > +++ b/kernel/pid.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/syscalls.h>
> >  #include <linux/proc_ns.h>
> >  #include <linux/proc_fs.h>
> > +#include <linux/sched/signal.h>
> >  #include <linux/sched/task.h>
> >  #include <linux/idr.h>
> >  
> > @@ -451,6 +452,55 @@ struct pid *find_ge_pid(int nr, struct pid_namespace *ns)
> >  	return idr_get_next(&ns->idr, &nr);
> >  }
> >  
> > +/**
> > + * pidfd_open() - Open new pid file descriptor.
> > + *
> > + * @pid:   pid for which to retrieve a pidfd
> > + * @flags: flags to pass
> > + *
> > + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> > + * the process identified by @pid. Currently, the process identified by
> > + * @pid must be a thread-group leader. This restriction currently exists
> > + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> > + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> > + * leaders).
> > + *
> > + * Return: On success, a cloexec pidfd is returned.
> > + *         On error, a negative errno number will be returned.
> > + */
> > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > +{
> > +	int fd, ret;
> > +	struct pid *p;
> > +	struct task_struct *tsk;
> > +
> > +	if (flags)
> > +		return -EINVAL;
> > +
> > +	if (pid <= 0)
> > +		return -EINVAL;
> > +
> > +	p = find_get_pid(pid);
> > +	if (!p)
> > +		return -ESRCH;
> > +
> > +	ret = 0;
> > +	rcu_read_lock();
> > +	/*
> > +	 * If this returns non-NULL the pid was used as a thread-group
> > +	 * leader. Note, we race with exec here: If it changes the
> > +	 * thread-group leader we might return the old leader.
> > +	 */
> > +	tsk = pid_task(p, PIDTYPE_TGID);
> 
> Just trying to understand the comment here. The issue is that we might either
> return the new leader, or the old leader depending on the overlap with
> concurrent de_thread right? In either case, we don't care though.
> 
> I suggest to remove the "Note..." part of the comment since it doesn't seem the
> race is relevant here unless we are doing something else with tsk in the
> function, but if you want to keep it that's also fine. Comment text should
> probably should be 'return the new leader' though.

Nah, I actually removed the comment already independently (cf. see [1]).

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=pidfd_open&id=dcfc98c2d957bf3ac14b06414cb2cf4c673fc297
> 
> > +	if (!tsk)
> > +		ret = -ESRCH;
> 
> Perhaps -EINVAL?  AFAICS, this can only happen if a CLONE_THREAD pid was
> passed as argument to pidfd_open which is invalid. But let me know what you
> had in mind..

Hm, from the kernel's perspective ESRCH is correct but I guess EINVAL is
nicer for userspace. So I don't have objections to using EINVAL. My
first version did too I think.

Thanks!
Christian
