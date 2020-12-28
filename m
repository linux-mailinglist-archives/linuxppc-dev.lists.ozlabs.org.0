Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3592E69F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 19:11:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4Qc82pGhzDqBr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 05:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NtSbNU38; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4QZM0DMnzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 05:10:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14ED922B2C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 18:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609179016;
 bh=UU5ZJ7wo09eeQJfHCA8zAN6QsAu7KkQNIOEasIFeWmg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NtSbNU38MzOGGEZybmJrqVrXIkZ7riOP6KLyDWXdcKOzPn2oBkVpWfP68WXcUvTXw
 QPCvxMa9V7U58EGvYn028q8tNODv/ggjHZYdRKTszI+dI2VtLCOS/w4qSKGYw3UIh0
 bYN14vc0bpBVomQt5g8Pobew4A1eaZjEyh7ugB5j3AJXzki4F6GHeV/cJ6tzgGs3Xi
 jccf0pLuMoDyHVDChw9mxOzf/70bEUpgqc8fLJvWl/A0AJV94HAAkLYtXrSnTSxJ9R
 Voqz0zee4pqZj7x4dfz/8/WNsBT6+tgi33/b34do1ws/GbSSgdpVtXhVSGrPvVgBLL
 xHvCEkW1rbJ7A==
Received: by mail-wr1-f42.google.com with SMTP id d13so12043332wrc.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 10:10:16 -0800 (PST)
X-Gm-Message-State: AOAM530qqMRoeVtC7dHLMcsybLnM/GVvgkMyGV90heouC59/eFnzHt96
 O8IBLO8Ld0wS2WM/5SmFHDF0vsxclSLQAmO+pFkRmg==
X-Google-Smtp-Source: ABdhPJxHP2b6pFiKrTNQ13geWSURUQyXlKEfQlURiSpdu2+ttGMTvrMYL94o5eJg5g/pfdfXcAWB78Wu9XbAQX8kJ/o=
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr336085wrv.257.1609179014608;
 Mon, 28 Dec 2020 10:10:14 -0800 (PST)
MIME-Version: 1.0
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
 <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
 <20201228102537.GG1551@shell.armlinux.org.uk>
 <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
 <20201228172301.GH1551@shell.armlinux.org.uk>
In-Reply-To: <20201228172301.GH1551@shell.armlinux.org.uk>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 28 Dec 2020 10:10:02 -0800
X-Gmail-Original-Message-ID: <CALCETrWn+LMgnTmrGFf7g_XJAe3MbuWWNhMT6VrujAY0sf-wmw@mail.gmail.com>
Message-ID: <CALCETrWn+LMgnTmrGFf7g_XJAe3MbuWWNhMT6VrujAY0sf-wmw@mail.gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 stable <stable@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 9:23 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Dec 28, 2020 at 09:14:23AM -0800, Andy Lutomirski wrote:
> > On Mon, Dec 28, 2020 at 2:25 AM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Sun, Dec 27, 2020 at 01:36:13PM -0800, Andy Lutomirski wrote:
> > > > On Sun, Dec 27, 2020 at 12:18 PM Mathieu Desnoyers
> > > > <mathieu.desnoyers@efficios.com> wrote:
> > > > >
> > > > > ----- On Dec 27, 2020, at 1:28 PM, Andy Lutomirski luto@kernel.org wrote:
> > > > >
> > > >
> > > > > >
> > > > > > I admit that I'm rather surprised that the code worked at all on arm64,
> > > > > > and I'm suspicious that it has never been very well tested.  My apologies
> > > > > > for not reviewing this more carefully in the first place.
> > > > >
> > > > > Please refer to Documentation/features/sched/membarrier-sync-core/arch-support.txt
> > > > >
> > > > > It clearly states that only arm, arm64, powerpc and x86 support the membarrier
> > > > > sync core feature as of now:
> > > >
> > > > Sigh, I missed arm (32).  Russell or ARM folks, what's the right
> > > > incantation to make the CPU notice instruction changes initiated by
> > > > other cores on 32-bit ARM?
> > >
> > > You need to call flush_icache_range(), since the changes need to be
> > > flushed from the data cache to the point of unification (of the Harvard
> > > I and D), and the instruction cache needs to be invalidated so it can
> > > then see those updated instructions. This will also take care of the
> > > necessary barriers that the CPU requires for you.
> >
> > With what parameters?   From looking at the header, this is for the
> > case in which the kernel writes some memory and then intends to
> > execute it.  That's not what membarrier() does at all.  membarrier()
> > works like this:
>
> You didn't specify that you weren't looking at kernel memory.
>
> If you're talking about userspace, then the interface you require
> is flush_icache_user_range(), which does the same as
> flush_icache_range() but takes userspace addresses. Note that this
> requires that the memory is currently mapped at those userspace
> addresses.
>
> If that doesn't fit your needs, there isn't an interface to do what
> you require, and it basically means creating something brand new
> on every architecture.
>
> What you are asking for is not "just a matter of a few instructions".
> I have stated the required steps to achieve what you require above;
> that is the minimum when you have non-snooping harvard caches, which
> the majority of 32-bit ARMs have.
>
> > User thread 1:
> >
> > write to RWX memory *or* write to an RW alias of an X region.
> > membarrier(...);
> > somehow tell thread 2 that we're ready (with a store release, perhaps,
> > or even just a relaxed store.)
> >
> > User thread 2:
> >
> > wait for the indication from thread 1.
> > barrier();
> > jump to the code.
> >
> > membarrier() is, for better or for worse, not given a range of addresses.
>
> Then, I'm sorry, it can't work on 32-bit ARM.

Is there a way to flush the *entire* user icache?  If so, and if it
has reasonable performance, then it could probably be used here.
Otherwise I'll just send a revert for this whole mechanism on 32-bit
ARM.

--Andy
