Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2599620924
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 16:09:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454YFT1HP7zDqWF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 00:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="MhjOHc+1"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Y8p33yrzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:05:13 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id w11so5454601edl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bYyJnADr9ubhW5oaXdh9WlhTHjyzAGu0DQI2eQ+pHaE=;
 b=MhjOHc+12NO1kjqTg26hcfpFarWJK6UO4uKen3mnBZiVvgNz65ljzXS/ZRyK+jjEzc
 /JF15wWLnH7LRgIqtY0MD+nIanFGFyFhIksGgTJWi2bGoTMD18BMjjca67gxxRvxi8+0
 yQTTRxRIh7g2VDxBQ0zKZz1vXg1chuW2SN2qbepgb4FeuGMxhGooqxVI7+7FHAOj9N1M
 FHodeukkhZGpge8teMzG2zc9TJCjzMji+6KCaGF81DZdV6StlcqORhINQ4uQjbmc8vco
 TjK91z8PkXrFbRk1vdkCD5WKK6krFwmTdVA0wTPdFmhQ9BFoHPYiofHEVgNBJZi0CYJz
 Lvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bYyJnADr9ubhW5oaXdh9WlhTHjyzAGu0DQI2eQ+pHaE=;
 b=Fwib0nxfQnjxiQn0wYEqGuVzadBrTMHvz0nazvaEExceiySGkTbZbHmgIKzURhL5/f
 /cY9tB32nw7NWe6woV+0JmjsOZ57/3OttV5gAQHAvOjh7lMkwc4zVCLDA4OK2YoeAbxH
 Z8OTbtYBwEIvxw823OsvKfVswNayPSVOslHcS4t4ITwxqwnUVbrthc/WJiGORvlCxX4e
 Qvv/IYBEWfKB5QhQ9Dr+pZfnlEb1siX/QV9kLPpy7kjTItJ2aZ04LyGdhSDlabS3oxo2
 oi3GN9qyUk3Q3cIaxvElN97S/hiduUI1v81NDoPa+6nk26mCmal4bsku7HQaaIQ0Oe7A
 QV5g==
X-Gm-Message-State: APjAAAVwecUcNjT/P1k5HcFZK9BWC9o7mqSoHjlzV8TzRBy4oaIn2luj
 /aFWHquLXeahk5cQTeJds6GBWw==
X-Google-Smtp-Source: APXvYqy/zkegU6awCybVYKMai3zZjnS7ZHStCqrWAP9elvrkEbm/ZCiD/6p0jcTly9aqPNEwI1KvNw==
X-Received: by 2002:a17:906:65d2:: with SMTP id
 z18mr20105763ejn.68.1558015510995; 
 Thu, 16 May 2019 07:05:10 -0700 (PDT)
Received: from brauner.io ([193.96.224.243])
 by smtp.gmail.com with ESMTPSA id b53sm1120044edd.89.2019.05.16.07.05.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 07:05:10 -0700 (PDT)
Date: Thu, 16 May 2019 16:05:08 +0200
From: Christian Brauner <christian@brauner.io>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
Message-ID: <20190516140507.75crjbaulasw6mj6@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <CAKOZuesPF+ftwqsNDMBy1LpwJgWTNuQm9-E=C90sSTBYEEsDww@mail.gmail.com>
 <20190516130813.i66ujfzftbgpqhnh@brauner.io>
 <CAG48ez05OtBi_yX+071TrrfK3zKOn9h1kFyPr5rttiqQAZ0sEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG48ez05OtBi_yX+071TrrfK3zKOn9h1kFyPr5rttiqQAZ0sEA@mail.gmail.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Linux API <linux-api@vger.kernel.org>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Daniel Colascione <dancol@google.com>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Aleksa Sarai <cyphar@cyphar.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 04:03:27PM +0200, Jann Horn wrote:
> On Thu, May 16, 2019 at 3:08 PM Christian Brauner <christian@brauner.io> wrote:
> > On Wed, May 15, 2019 at 10:45:06AM -0700, Daniel Colascione wrote:
> > > On Wed, May 15, 2019 at 3:04 AM Christian Brauner <christian@brauner.io> wrote:
> > > >
> > > > This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> > > > pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> > > > process that is created via traditional fork()/clone() calls that is only
> > > > referenced by a PID:
> [...]
> > > > +/**
> > > > + * pidfd_open() - Open new pid file descriptor.
> > > > + *
> > > > + * @pid:   pid for which to retrieve a pidfd
> > > > + * @flags: flags to pass
> > > > + *
> > > > + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> > > > + * the process identified by @pid. Currently, the process identified by
> > > > + * @pid must be a thread-group leader. This restriction currently exists
> > > > + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> > > > + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> > > > + * leaders).
> > > > + *
> > > > + * Return: On success, a cloexec pidfd is returned.
> > > > + *         On error, a negative errno number will be returned.
> > > > + */
> > > > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > > > +{
> [...]
> > > > +       if (pid <= 0)
> > > > +               return -EINVAL;
> > >
> > > WDYT of defining pid == 0 to mean "open myself"?
> >
> > I'm torn. It be a nice shortcut of course but pid being 0 is usually an
> > indicator for child processes. So unless the getpid() before
> > pidfd_open() is an issue I'd say let's leave it as is. If you really
> > want the shortcut might -1 be better?
> 
> Joining the bikeshed painting club: Please don't allow either 0 or -1
> as shortcut for "self". James Forshaw found an Android security bug a
> while back (https://bugs.chromium.org/p/project-zero/issues/detail?id=727)
> that passed a PID to getpidcon(), except that the PID was 0
> (placeholder for oneway binder transactions), and then the service
> thought it was talking to itself. You could pick some other number and
> provide a #define for that, but I think pidfd_open(getpid(), ...)
> makes more sense.

Yes, I agree. I left it as is for v1, i.e. no shortcut; getpid() should
do.

Christian
