Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E092035654F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 09:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFbkY6qgDz3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O2cXbe0T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O2cXbe0T; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFbk63VyKz2yYg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 17:34:05 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id y2so8898881plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 00:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvZSBrH1kmgxKZKSD+pBe7YtJvXFi8yG9kfTKSmsc5Q=;
 b=O2cXbe0TlOnka3Htg7a7ktCEm4u84Apnd4pxAh+QckwGH1N5XUJxAQXGojK8urTwHW
 S6qKShLuqQpXW7czN7NSppj8uMSG1ILItUs2jRqW9KCOM0ewsGPs471AJdd9fQwkregx
 5WJsKLnvvgP9H/rO+GMThc5QqAWIM6vJUjUihrVpN1qBZ1PZrQQurpb3jy0hrvC8q/ga
 193Hbzqy2uMvrG2DBivJBITDOAFTPHgkYrA0xxTN2O5/SDYNzxk8E+F9Ofv4wPxpKtYd
 OpyTo6+F49K8x0yWEkTWuqKF3gTonWd9jxsyeBFNYymfsKPd0N1ZAJ/ruwq0yRVkpYX5
 /xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvZSBrH1kmgxKZKSD+pBe7YtJvXFi8yG9kfTKSmsc5Q=;
 b=J9DzK7wbMUCgHnLZwbO3r1fKm5xblUZbm2JnbDnYAGM1yJweJ+/nkEYJHpeTt6NQvS
 PuSz3mNoi5bkw2xWImsfOiL3C7OJ9pRegq/pEqCAlb5tQfNWRMsJiuTQLrJDzLAexoeB
 UbtCVfL7pSVi+NrCw6SEADD+TaFmUtNltpakKpBnGAP9rPmzk43ClQzutaKX0lxOFqOQ
 og9vQO5VhCOPcNe7LEOWcVxYnzca3EynhQDNjSEO/0mlx3+LGTNyLdet4T7AIewad39c
 0v8wJpLrM5y0seuyIx2beJHdEs35f/oXIKsCXLYe+CUVD4tZmdTzFWjtaWjTHJUsGtBK
 aGIg==
X-Gm-Message-State: AOAM5316XSzOdbaF0+iHDTPGWczzDUB2TjF4bd2+MoqOlLD278QIv64W
 7IISJxq2V1651wJiD42BhMdftSkLTp4nnSy1Mgk=
X-Google-Smtp-Source: ABdhPJyRMoGPnuz4MO0FmGOHIM1XSyhsQpJQrKhPLw79y8VziNPPVSJYtRew3BRLtYZwwl4H1BLduTLJZdkCaUCy8qY=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr1880447plq.17.1617780840716; Wed, 07 Apr
 2021 00:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <20210406165108.GA4332@42.do-not-panic.com>
In-Reply-To: <20210406165108.GA4332@42.do-not-panic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Apr 2021 10:33:44 +0300
Message-ID: <CAHp75Ve9vBQqSegM2-ch9NUN-MdevxxOs5ZdHkk1W7AacN+Wrw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
To: Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Apr 7, 2021 at 10:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> > diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> > new file mode 100644
> > index 000000000000..41e32483d7a7
> > --- /dev/null
> > +++ b/include/linux/panic_notifier.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_PANIC_NOTIFIERS_H
> > +#define _LINUX_PANIC_NOTIFIERS_H
> > +
> > +#include <linux/notifier.h>
> > +#include <linux/types.h>
> > +
> > +extern struct atomic_notifier_head panic_notifier_list;
> > +
> > +extern bool crash_kexec_post_notifiers;
> > +
> > +#endif       /* _LINUX_PANIC_NOTIFIERS_H */
>
> Why is it worth it to add another file just for this?

The main point is to break tons of loops that prevent having clean
headers anymore.

In this case, see bug.h, which is very important in this sense.

>  Seems like a very
> small file.

If it is an argument, it's kinda strange. We have much smaller headers.

-- 
With Best Regards,
Andy Shevchenko
