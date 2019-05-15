Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B515E1F6E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:50:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453yCr1zStzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 00:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="gbthNhor"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453yBR0wkFzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 00:49:34 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id f37so143988edb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oKULkZSRwqaiQxP7TL4UYPkN+uTDZlr88Vcbz3QuA1I=;
 b=gbthNhordMIYVnTy317gMGg6f/dfC5iQgBxjq6Pg3jScMLdLI0Vq4OcwB79UHvgEgC
 U1AgURPKc8JVgJXOo0PlK1NBODmUH4LG0c3iQOkHAxHOhxIV3lZFFgtryVL471yH2yaW
 C3klxUr1MKghIvHXbdcitmAziIPiCtbEw5zo2mlbo+BrqzIdRMNr8g8Hd8yvC+RFkoND
 3U7iWRnczi1gGSuo/hShIfYUEndn7uxrlNKw8BfZPzT5nVaY90n0JScdqCfYtxsar1cX
 tdmjNXgvyrjanexmF/91CzUGx8XsXtV3i+hqAVIqFgPvc7YR3o00EzVeVZB9N4qN/XJl
 yDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oKULkZSRwqaiQxP7TL4UYPkN+uTDZlr88Vcbz3QuA1I=;
 b=HduKI+3ognm4SIKU+RVa4Cyp+RiSnrmGzsgHBCYHD6HHpqcsD1dhIz4PHI6vZbeeHx
 SA10/pvPKMNekmMGjBXiVSiXa7SWqGs77ss57oA7s69ijT+B9KUyCypYHR0GVSTPy0gD
 eNkEF/imJZrY0pKYh5N04wEotEIWL+U3hxGjXdPzhwE1QGipqrCmsUf3ENFgso2sdzDq
 vg1defPmeOu1V7Tk9dvarEf8tAC9br9jkppsKrAgCqZ/5O9Eaw/u/AW7fb++8tY90PXR
 LxpPTLbNrIy95eCc2tFxLifkwhG4UVAREqKo981EeHnFSQwdPs+e5wEp6HjECjkjDYWi
 nPdg==
X-Gm-Message-State: APjAAAVO4uhjk+lXdHrWvklk3EViEkad7lv0xcjoH8jZykPPiPYEqQf/
 zZOZgdqgadcAaK5oACWFTDMKEQ==
X-Google-Smtp-Source: APXvYqwtuLZTJzieEZtQQr5tQJZGg6NHI/b45QGiYK/CmzqPYIKTHEi4eYHx8oYap2x4c/tmYGlpdA==
X-Received: by 2002:a50:8eb6:: with SMTP id w51mr43141017edw.34.1557931770356; 
 Wed, 15 May 2019 07:49:30 -0700 (PDT)
Received: from brauner.io ([178.19.218.101])
 by smtp.gmail.com with ESMTPSA id a32sm873557ede.76.2019.05.15.07.49.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 15 May 2019 07:49:29 -0700 (PDT)
Date: Wed, 15 May 2019 16:49:28 +0200
From: Christian Brauner <christian@brauner.io>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
Message-ID: <20190515144927.f2yxyi6w6lhn3xx7@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <20190515143857.GB18892@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515143857.GB18892@redhat.com>
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
 linux-mips@vger.kernel.org, dhowells@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 luto@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, cyphar@cyphar.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 04:38:58PM +0200, Oleg Nesterov wrote:
> On 05/15, Christian Brauner wrote:
> >
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
> > +	rcu_read_lock();
> > +	tsk = pid_task(p, PIDTYPE_PID);
> 
> You do not need find_get_pid() before rcu_lock and put_pid() at the end.
> You can just do find_vpid() under rcu_read_lock().

Will do.

> 
> > +	if (!tsk)
> > +		ret = -ESRCH;
> > +	else if (unlikely(!thread_group_leader(tsk)))
> > +		ret = -EINVAL;
> 
> it seems that you can do a single check
> 
> 	tsk = pid_task(p, PIDTYPE_TGID);
> 	if (!tsk)
> 		ret = -ESRCH;
> 
> this even looks more correct if we race with exec changing the leader.

The logic here being that you can only reach the thread_group leader
from struct pid if PIDTYPE_PID == PIDTYPE_TGID for this struct pid?

Thanks, Oleg.
Christian
