Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B4356EAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 16:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFmzL5Pv3z3btf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 00:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.179;
 helo=mail-pl1-f179.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFmyt315Tz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 00:30:46 +1000 (AEST)
Received: by mail-pl1-f179.google.com with SMTP id v8so9421729plz.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 07:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1vVuZ4MvRzeF+pr2v0xmBFFQwK6hdMJanVjlk9hErro=;
 b=fKj2s+Qn3TsJkgJutejZxuFn7IHa9rHiugg6XM22sZWZFQW+I6TuymurmUqaLXTjDG
 BqU6rzoFnpDTIhNBQdhRRaaLy05Jyjdzz+Wxxeff/LtN7oxdoVOqpIoo8q7n2JtuFqKo
 JsDi7E6CIwTFfMqi5BDDFenAsnrElY0EmjrY5KTfiaAEW7icGH+jy/L644toiLGr8XaL
 czJpUPdd0FJHQG6LASspNVsFPJj8bqnoNfDdjX6scasoOPZ14oRfrFElzkHTCKiCZoNk
 R0WaK8qmgrpDqRMcOc8hsqtNPNuJo77z6gGrFIhnxVDEeNOQ4X0GSJ31cXQhjgjqGJLV
 ABXA==
X-Gm-Message-State: AOAM530931e0CcPSg0T+CpoRap+Bolv9nLa9CM1cchDW2KuAOXXXcDFE
 D2YJKt4KmILR+yf+v3eYQ0s=
X-Google-Smtp-Source: ABdhPJytaBCeu/N78G2ItU1as7w8fUmjf8wbl8aAQkobTbao0e2hHv5pq8RooRp01fzv5LCBwmpFDg==
X-Received: by 2002:a17:90a:6343:: with SMTP id
 v3mr3482681pjs.153.1617805842980; 
 Wed, 07 Apr 2021 07:30:42 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id k11sm5779292pjs.1.2021.04.07.07.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:30:41 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 09D07402D7; Wed,  7 Apr 2021 14:30:41 +0000 (UTC)
Date: Wed, 7 Apr 2021 14:30:40 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210407143040.GB4332@42.do-not-panic.com>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <20210406165108.GA4332@42.do-not-panic.com>
 <CAHp75Ve9vBQqSegM2-ch9NUN-MdevxxOs5ZdHkk1W7AacN+Wrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve9vBQqSegM2-ch9NUN-MdevxxOs5ZdHkk1W7AacN+Wrw@mail.gmail.com>
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

On Wed, Apr 07, 2021 at 10:33:44AM +0300, Andy Shevchenko wrote:
> On Wed, Apr 7, 2021 at 10:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> > > diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> > > new file mode 100644
> > > index 000000000000..41e32483d7a7
> > > --- /dev/null
> > > +++ b/include/linux/panic_notifier.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _LINUX_PANIC_NOTIFIERS_H
> > > +#define _LINUX_PANIC_NOTIFIERS_H
> > > +
> > > +#include <linux/notifier.h>
> > > +#include <linux/types.h>
> > > +
> > > +extern struct atomic_notifier_head panic_notifier_list;
> > > +
> > > +extern bool crash_kexec_post_notifiers;
> > > +
> > > +#endif       /* _LINUX_PANIC_NOTIFIERS_H */
> >
> > Why is it worth it to add another file just for this?
> 
> The main point is to break tons of loops that prevent having clean
> headers anymore.
>
> In this case, see bug.h, which is very important in this sense.

OK based on the commit log this was not clear, it seemed more of moving
panic stuff to its own file, so just cleanup.

> >  Seems like a very
> > small file.
> 
> If it is an argument, it's kinda strange. We have much smaller headers.

The motivation for such separate file was just not clear on the commit
log.

  Luis
