Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388C356F8F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFnck63N8z303S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 01:00:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fYy1lWNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fYy1lWNP; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFncD2cCbz300C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 00:59:39 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id q5so13077245pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/d1grSpme2mQqHlJWH4I0IMbDUguqI3gCUkY5Nr1Q4=;
 b=fYy1lWNPXiQ+yb67ebJZu+8zEC+h0pBnsXArakBNChEkh6CjoRMYl72lknBCAuRuX2
 jxuH9EpzzGDSCJWIUX2Ng7q0y9vsIP4Zr+Ek6u4yFt20hudhezjO5DOYAIxN+UZB5hMM
 FswWwQr3PpOF1lHlMFl2SjtB1/0Fx4MrlsWZAZT4dZpOxE8in8RosRGUfdrKX/M6x4Fq
 inZiwEl3DvszVRA5j32WLhIZYUUNpVuXdnve6hiU7XgFQUrk2IG/GFnBcXcqK58X9Wrd
 bbLLNR2m9dcbokFkoo+uH9b1jOTr6jOD6OdvmDZN/EImsXC0vxwvNHIMR6Dr2vU22cdq
 YTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/d1grSpme2mQqHlJWH4I0IMbDUguqI3gCUkY5Nr1Q4=;
 b=BNQi0jZIqAJZFgnk7awD/2ElrN+SJgWK/ox9avsja3YelwlZVBBfYGI72ch9nNzOo2
 +m4DJabq9hR43Pzu8fbdJUUR+H+isRegfuj7WjSM9AsCu8+J0cciS8bOWoinns587YJu
 XWTuvDxVu92Dz2aJqgylpMsevnNTP92SllnNEom5E6vflJT1+j8OezOKWdhx7bl0QMNP
 xX17AUrSibsthUkNDFTnbo8Z8dVBSjXtXJKUcBpcr/UgJnqyHkasCF+h6CfLhX3L8/bn
 albXI07R/62f6DmpP6PBgiZAlvHNdLV3cIlX69nHWhAfCN2vrMOnaUzxDihq8257VWXa
 qfYA==
X-Gm-Message-State: AOAM531axwn9jr2U+ZWbJJDQ7PX8sJ38dFtxeQFZSXoRb/iz6hJI3J4g
 tHj3BcgWx3i8JiZfj8XJcjnA50kxlL9qXFsDIxs=
X-Google-Smtp-Source: ABdhPJyU4xbKR/hTcJT3i+4AmcxOkV7rwYOr2kWTFFANFENce/N3tHTgLI14O9XHpuyAeqcD9v6uZo0Kn/Dprv2XBvs=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr3114076pfb.7.1617807575856; Wed, 07
 Apr 2021 07:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <20210406165108.GA4332@42.do-not-panic.com>
 <CAHp75Ve9vBQqSegM2-ch9NUN-MdevxxOs5ZdHkk1W7AacN+Wrw@mail.gmail.com>
 <20210407143040.GB4332@42.do-not-panic.com>
In-Reply-To: <20210407143040.GB4332@42.do-not-panic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Apr 2021 17:59:19 +0300
Message-ID: <CAHp75VeXiLa0b49eoZKVR1DSqTc9hKxpSgy294hMiaUzt0ugOA@mail.gmail.com>
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

On Wed, Apr 7, 2021 at 5:30 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> On Wed, Apr 07, 2021 at 10:33:44AM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 7, 2021 at 10:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > > On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:

...

> > > Why is it worth it to add another file just for this?
> >
> > The main point is to break tons of loops that prevent having clean
> > headers anymore.
> >
> > In this case, see bug.h, which is very important in this sense.
>
> OK based on the commit log this was not clear, it seemed more of moving
> panic stuff to its own file, so just cleanup.

Sorry for that. it should have mentioned the kernel folder instead of
lib. But I think it won't clarify the above.

In any case there are several purposes in this case
 - dropping dependency in bug.h
 - dropping a loop by moving out panic_notifier.h
 - unload kernel.h from something which has its own domain

I think that you are referring to the commit message describing 3rd
one, but not 1st and 2nd.

I will amend this for the future splits, thanks!

> > >  Seems like a very
> > > small file.
> >
> > If it is an argument, it's kinda strange. We have much smaller headers.
>
> The motivation for such separate file was just not clear on the commit
> log.

-- 
With Best Regards,
Andy Shevchenko
