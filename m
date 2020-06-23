Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71985205AFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:41:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rw9P3J4JzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 04:41:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iijPksou; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rw7D5v1MzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 04:39:50 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id e5so17649791ote.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z9Mv0PSZMGpAWk3UqJDbiXv8a+JYzUxjPXY8KHbS/hU=;
 b=iijPksoun5xx2rBmnB5BFGt7QhPEMrBBzcpBa53UdPi/WXfZ/RM1EwWz88xyVWE2tH
 lwdxOx87PRLPbpqxCuOOUK6r4qg2SX2F9iko4RLnrBo0FD4CvqGpwtBCey4NdL8Xjt5P
 z/NnaQi6MSAvf31tnlAtJrzALovM15et5mYRXuMhAJw5q2FITuXra+NWmr5TRqPOgM06
 KwONwYXzjSpvXwJl/mh+EL8rEG6F7w8hbInt8Fz3w705HtjRqg2g4Ksq6vSEn5IOuF0U
 cdu9ETDvCStOMf56Uap6OhWaQBZgf/egDwjw141wQrW1KNlJvmL5stDOzDwc1B7n74cA
 PUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9Mv0PSZMGpAWk3UqJDbiXv8a+JYzUxjPXY8KHbS/hU=;
 b=a5ZJfq/IzbzJu/ckvxxm3SPOFRM1YKcP176Ku6smsKYRNTDZeSrz3FOjYzMUOJDNVk
 3v+TnDwSKVGhICI4h5zyZwdXKuzHqFyzqfpK3LbYYQ7CmfW7uGvbICZjlfe7TJni9Rox
 UgtRqUsl5PlAFCC/RflQdmFqDGQwuFOEtIKyrcroK5I55YYhuQGra/8I5vNYWvi26Px9
 dJwkeZcM5YfzSJ0e/nA3Eb604Jtu6vhvCqxGZL8/P0XPH5ML55ccNW1+T9vfaZSP1u1x
 Gf3z7Vt6OPMq2DwDXssmxSb+Aid10FSAdjzJ0Ew01xAX7Fhr8nSalFo8Yb2Ow6qbyY0f
 1e8g==
X-Gm-Message-State: AOAM532CRIk+XR/ISdKHSb/wan1kt3Hs9mYh0ZZ+R9UtyhwYJiy5AqVR
 utZ8lFOI6o5aCNCNBCwHtc4Pnsou+NtrcxK+QuURig==
X-Google-Smtp-Source: ABdhPJyQWmZXSz2iX0eZ/je4eHr1g9U0vu4eNfE0+KLA5wajMcXCN1n72CVKsQtNr7QxRx1XJy83ffFOLJyXsvgaaSo=
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr20833338oth.233.1592937587368; 
 Tue, 23 Jun 2020 11:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
In-Reply-To: <20200623181232.GB4800@hirez.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 23 Jun 2020 20:39:35 +0200
Message-ID: <CANpmjNMmYYa-mVo_Ao_n+9KzwxhGYcb6B6C72yCHyD9sZudDfA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, the arch/x86 maintainers <x86@kernel.org>,
 heiko.carstens@de.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>,
 Qian Cai <cai@lca.pw>, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 at 20:13, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 23, 2020 at 07:59:57PM +0200, Marco Elver wrote:
> > On Tue, Jun 23, 2020 at 06:37PM +0200, Peter Zijlstra wrote:
> > > On Tue, Jun 23, 2020 at 06:13:21PM +0200, Ahmed S. Darwish wrote:
> > > > Well, freshly merged code is using it. For example, KCSAN:
> > > >
> > > >     => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
> > > >     => kernel/kcsan/report.c:
> > > >
> > > >     void kcsan_report(...)
> > > >     {
> > > >   ...
> > > >         /*
> > > >          * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
> > > >          * we do not turn off lockdep here; this could happen due to recursion
> > > >          * into lockdep via KCSAN if we detect a race in utilities used by
> > > >          * lockdep.
> > > >          */
> > > >         lockdep_off();
> > > >   ...
> > > >     }
> > >
> > > Marco, do you remember what exactly happened there? Because I'm about to
> > > wreck that. That is, I'm going to make TRACE_IRQFLAGS ignore
> > > lockdep_off().
> >
> > Yeah, I was trying to squash any kind of recursion:
> >
> >       lockdep -> other libs ->
> >               -> KCSAN
> >               -> print report
> >               -> dump stack, printk and friends
> >               -> lockdep -> other libs
> >                       -> KCSAN ...
> >
> > Some history:
> >
> > * Initial patch to fix:
> >       https://lore.kernel.org/lkml/20200115162512.70807-1-elver@google.com/
>
> That patch is weird; just :=n on lockdep.c should've cured that, the
> rest is massive overkill.
>
> > * KCSAN+lockdep+ftrace:
> >       https://lore.kernel.org/lkml/20200214211035.209972-1-elver@google.com/
>
> That doesn't really have anything useful..
>
> > lockdep now has KCSAN_SANITIZE := n, but we still need to ensure that
> > there are no paths out of lockdep, or the IRQ flags tracing code, that
> > might lead through other libs, through KCSAN, libs used to generate a
> > report, and back to lockdep.
> >
> > I never quite figured out the exact trace that led to corruption, but
> > avoiding any kind of potential for recursion was the only thing that
> > would avoid the check_flags() warnings.
>
> Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> anything happens.

Thanks!

This was happening with Qian Cai's (Cc'd) test cases. If the kernel or
this patch changed things around so this doesn't happen anymore
regardless, then I don't see a problem.

Thanks,
-- Marco
