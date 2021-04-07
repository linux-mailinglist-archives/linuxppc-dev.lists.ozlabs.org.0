Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A6357050
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFpHh1hWlz3bwB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 01:30:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.51; helo=mail-pj1-f51.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFpHK4GG9z2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 01:30:02 +1000 (AEST)
Received: by mail-pj1-f51.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3228152pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 08:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+M5ErOA6vMHXgHMo812hqipKBEarvAzxNuznNu4dPh4=;
 b=e1+clxQB/g4f+0BtEQG1H1NAAShfOPoQDUOwOyftcwd8G+FLUiYkJKofkN5Wjiw4ZI
 bFd67VovgAVm5OX7xiGmrzzOMH6hUpQEhFLTs4HVB9H9eETsTBbGtcAuw4rSZhbmLkVG
 ucoT5w4m1ZQQT5xsANtM8/wsC0rwLofTxWHIHaZO/5vQEXUj5MEzXWOG9ZyBG9EWSU71
 eGLmI6EcvMdLkpSslUoM0HUsXITrGOSg4i9ced3NX3FXXlBPLACabJjeGwDBm0b+vDjk
 S7uM9JT+FqIHgTk7kioO5PAH8am6blJozuonNMVBiZ6EwGwoWM7NwVU3K+qG3/uO74kC
 //Yw==
X-Gm-Message-State: AOAM530xxOpLaGFbxiboorMOQP1BvkgWblcaUxlZ+ZG2SsqEbO06q6Vt
 dOUL4GO2XkwisivWiteH3WY=
X-Google-Smtp-Source: ABdhPJxpL5KaAnDuQDJzuUb5KCGFxZ3YcW99M+WHBna9dnMuIO92XOsuZyqjUKOy0DftFppakeCj7Q==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id
 t16-20020a170902b210b02900e633b4cd9emr3418197plr.67.1617809399828; 
 Wed, 07 Apr 2021 08:29:59 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id f65sm22129550pgc.19.2021.04.07.08.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:29:58 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 00948402D7; Wed,  7 Apr 2021 15:29:56 +0000 (UTC)
Date: Wed, 7 Apr 2021 15:29:56 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210407152956.GE4332@42.do-not-panic.com>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <20210406165108.GA4332@42.do-not-panic.com>
 <CAHp75Ve9vBQqSegM2-ch9NUN-MdevxxOs5ZdHkk1W7AacN+Wrw@mail.gmail.com>
 <20210407143040.GB4332@42.do-not-panic.com>
 <CAHp75VeXiLa0b49eoZKVR1DSqTc9hKxpSgy294hMiaUzt0ugOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeXiLa0b49eoZKVR1DSqTc9hKxpSgy294hMiaUzt0ugOA@mail.gmail.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Iurii Zaikin <yzaikin@google.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biederman <ebiederm@xmission.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 05:59:19PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 7, 2021 at 5:30 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > On Wed, Apr 07, 2021 at 10:33:44AM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 7, 2021 at 10:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > > > On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > Why is it worth it to add another file just for this?
> > >
> > > The main point is to break tons of loops that prevent having clean
> > > headers anymore.
> > >
> > > In this case, see bug.h, which is very important in this sense.
> >
> > OK based on the commit log this was not clear, it seemed more of moving
> > panic stuff to its own file, so just cleanup.
> 
> Sorry for that. it should have mentioned the kernel folder instead of
> lib. But I think it won't clarify the above.
> 
> In any case there are several purposes in this case
>  - dropping dependency in bug.h
>  - dropping a loop by moving out panic_notifier.h
>  - unload kernel.h from something which has its own domain
> 
> I think that you are referring to the commit message describing 3rd
> one, but not 1st and 2nd.

Right!

> I will amend this for the future splits, thanks!

Don't get me wrong, I love the motivation behind just the 3rd purpose,
however I figured there might be something more when I saw panic_notifier.h.
It was just not clear.

But awesome stuff!

  Luis
