Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891AC283E6E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 20:38:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4q8c4Fz1zF1SW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 05:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vBtU369t; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4q7F6j7LzDsqB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 05:36:19 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id i2so2846181pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Oct 2020 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0wHD81aAh3Ob3GJ5aVvlWW4RHIkMZdoKTAx2sVZ9fTk=;
 b=vBtU369tbtM2Jid7AFMAhuTduuwSTM4AyN8H4Up07kr8IkkyV4rAC4JG1Fo3Ud/WKw
 ftULS/+AH1HaOFKMLvxqvmghjmqtP+IdxCZvtqdgAiaoW+vIQSms6DS2eDfMi3rPBtdZ
 gxXo00BFLa7vp5wCYmdO3wnLSIhAtRPM9rH4YLuuiqnFNB2xQnGdTepJdHgm70n5o19g
 La9EcHaAVaYi+XoWApK6eTv0t9Jmx2LpV8TUI+8IJk1Xr88aOnVUnTqxi1IRNLpXowOq
 HYgtVuWWJErS+krhYgKuL/+bMVWFZ3xm2/l7IpBM8VCYtnvyqkgKkzueiRKPlH110m5Z
 uIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0wHD81aAh3Ob3GJ5aVvlWW4RHIkMZdoKTAx2sVZ9fTk=;
 b=ASHS841Ss5FKdwdV3WiiIEs8tqvjJvKT5ke7pD2A0trjPsp8tsaAAcYaIZJWscF3fI
 a1NeqYwS0v6+f0DEUOCKPnqZq3NIlRSQs8vdYYhJD1PEv6NClmxFq8Jq82kn6U6InQRt
 JrXzASma9YbBF3griZ94uj+Pnh91m7liRbGJm6oNgWFBs8VTDFtm97KSwd31P/p+f4hH
 xyfBK7A4ztTlAFbxBmllMczF0ITmP8ay4ElD2lOFx77DLvffib6+dD8MDZtjbdR2x4U4
 6unXjnIlPakNGs9EWKHSStGC4Th4+4iC3pOtF4dS23wX2ofFCEq+SiNhQT4HLPjlJAsu
 uirA==
X-Gm-Message-State: AOAM531VExmYkADLPPn9xplAGGp09o3/uoiltlSUwBWsN47wSIuwIQez
 tSKlpXiojQ6sV0xAT5wvmg402a5cUbbs+pdjhHu6PQ==
X-Google-Smtp-Source: ABdhPJyVasB7vnS5oomfZBIDxakgYFf6vf6IbI/3OgIQwWM8b/4BVU4p6FTFIja4W5oPmwJ2iOgszfcF385NslzeVpg=
X-Received: by 2002:a65:6858:: with SMTP id q24mr837940pgt.10.1601922977033;
 Mon, 05 Oct 2020 11:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200929192549.501516-1-ndesaulniers@google.com>
 <CA+icZUVgfnVQ1=zjUGhGKnJAs9g3Q06sWN3ffNdrfZMZLCEkbA@mail.gmail.com>
 <133589afbe999347454dfcc46ae782897bf9e3a2.camel@perches.com>
 <46f69161e60b802488ba8c8f3f8bbf922aa3b49b.camel@perches.com>
 <CAKwvOdkhyvTpY6pHT+CLSsBFuKRWsXucjbwN_tyJAsryZXvG1A@mail.gmail.com>
 <417ffa3fd3fba5d4a481db6a0b0c9b48cbbb17c4.camel@perches.com>
 <CAKwvOd=P+j0RaQfHsXPfB0EL3oRgAu8Q0+spUOn_v-p2+3=3pw@mail.gmail.com>
 <aefe941251d5d58062d06099afb58dea1d1d4e17.camel@perches.com>
 <46040e2776a4848add06126ce1cb8f846709294f.camel@perches.com>
 <CANiq72mSjs4myQQtUoegjRggjTx9UF70nAcWoXRoTeLMOuf0xQ@mail.gmail.com>
 <20201001193937.GM28786@gate.crashing.org>
 <61445711991c2d6eb7c8fb05bed2814458e2593b.camel@perches.com>
In-Reply-To: <61445711991c2d6eb7c8fb05bed2814458e2593b.camel@perches.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 5 Oct 2020 11:36:06 -0700
Message-ID: <CAKwvOdmW4ZSo0yz9ZUjFhjzzDkNAghKYk_hxn9tvrKLBgCXx-A@mail.gmail.com>
Subject: Re: [RFC PATCH next-20200930] treewide: Convert macro and uses of
 __section(foo) to __section("foo")
To: Joe Perches <joe@perches.com>
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
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 1, 2020 at 1:19 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-10-01 at 14:39 -0500, Segher Boessenkool wrch/ote:
> > Hi!
> >
> > On Thu, Oct 01, 2020 at 12:15:39PM +0200, Miguel Ojeda wrote:
> > > > So it looks like the best option is to exclude these
> > > > 2 files from conversion.
> > >
> > > Agreed. Nevertheless, is there any reason arch/powerpc/* should not be
> > > compiling cleanly with compiler.h? (CC'ing the rest of the PowerPC
> > > reviewers and ML).
> >
> > You need to #include compiler_types.h to get this #define?
>
> Actually no, you need to add
>
> #include <linux/compiler_attributes.h>
>
> to both files and then it builds properly.
>
> Ideally though nothing should include this file directly.

That's because Kbuild injects it via command line flag `-include`.
(Well, it injects compiler_types.h which includes this).  If part of
the tree reset KBUILD_CFLAGS, that `-include` gets dropped.  I don't
think there's anything wrong with manually including it and adding `-I
<path>` (capital i) if needed.

>
> > (The twice-defined thing is a warning, not an error.  It should be fixed
> > of course, but it is less important; although it may be pointing to a
> > deeper problem.)
> >
> >
> > Segher
>


-- 
Thanks,
~Nick Desaulniers
