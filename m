Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E951B2E6A01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 19:31:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4R3H0nmfzDqC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 05:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kC8erHWC; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4R1K49KYzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 05:30:06 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 23so25726250lfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 10:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QWueFoX46bASvYc3JoD/wDe6SIFvsehDB2wYLC5Qro=;
 b=kC8erHWC7LJljd/G34/JaHHsVnKmOkmodMYD6VYbi1frfV7aUiFi4ghdP5U/jRYjxy
 Tnnwz+m3WZxE/dL3rkP+C4A/veMY+6cha1JGdQaGU8Wz1F1bxwm/R2RZMdRO98LnkUBm
 cYPK1X8bqfX/mKN53uFzCwLJfQOB3+zF892PLrZTmSH8IocXMFfPvCQnYoCAfLsExCZl
 Sgm0r3NQPWN5nJkagtSh/CbGKomwwEFYDVDryUx9aRtUw95jIZf3obX3t0zci7zmGP4S
 a4ECxd5nFqgw7+mPV8Dee4cuyjkV2RBVkp4uN5wld/yuUnwFjs5Q4WB6U+KIrk84OcpQ
 gmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QWueFoX46bASvYc3JoD/wDe6SIFvsehDB2wYLC5Qro=;
 b=ooN6aO+5HzUjINuU56gfCodrnRvV3yGfu0mLYre9R5kokskH7/cCUePNfB9a1OscNi
 QK7Wj0lbonWKRRdSJYXuAXtK+GmROPJZV9P+1w3IwNgKSR6n9nQic88p+E0+3ao5drQL
 prjNqQvFXiTfVGXYKpHMBpeQyIcHoo1Suct46FrWcPP6vdgtxEvOzbmBcdWiq1JQcmd5
 Ij5soLn4Q3nmEW+XtZfcG/cViorO2rnYlCDTvXkNXbCYEPC/qJNKVW1UvMEO1xMdNtKK
 dKqqDKXLsmtCVo5/LVsmK8OFLURaZ/zBjrqBhhvndGDpyy/lAODtmpY9GXfTU0xEV7rq
 oM5Q==
X-Gm-Message-State: AOAM531b767o7TtXXoUnEXgonEReKAx+qtwI++O13iQlUUBsIiXP4Yq1
 xmr8q/3QuaNcu13c79EpvESAMsD9jWrCvC5cKwgldQ==
X-Google-Smtp-Source: ABdhPJywKGjXCnfRINymslg8vxwCZQ4aJBBOn7s5tOWzXMqifOLiV/yzFYOyqzq8yfaa/m/8xi9I99ioXvGTSrAh/F8=
X-Received: by 2002:a19:716:: with SMTP id 22mr19106749lfh.390.1609180201389; 
 Mon, 28 Dec 2020 10:30:01 -0800 (PST)
MIME-Version: 1.0
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
 <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
 <20201228102537.GG1551@shell.armlinux.org.uk>
 <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
In-Reply-To: <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 28 Dec 2020 19:29:34 +0100
Message-ID: <CAG48ez0YZ_iy6qZpdGUj38wqeg_NzLHHhU-mBCBf5hcopYGVPg@mail.gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>
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
 x86 <x86@kernel.org>, Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 stable <stable@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 6:14 PM Andy Lutomirski <luto@kernel.org> wrote:
> On Mon, Dec 28, 2020 at 2:25 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Sun, Dec 27, 2020 at 01:36:13PM -0800, Andy Lutomirski wrote:
> > > On Sun, Dec 27, 2020 at 12:18 PM Mathieu Desnoyers
> > > <mathieu.desnoyers@efficios.com> wrote:
> > > >
> > > > ----- On Dec 27, 2020, at 1:28 PM, Andy Lutomirski luto@kernel.org wrote:
> > > >
> > >
> > > > >
> > > > > I admit that I'm rather surprised that the code worked at all on arm64,
> > > > > and I'm suspicious that it has never been very well tested.  My apologies
> > > > > for not reviewing this more carefully in the first place.
> > > >
> > > > Please refer to Documentation/features/sched/membarrier-sync-core/arch-support.txt
> > > >
> > > > It clearly states that only arm, arm64, powerpc and x86 support the membarrier
> > > > sync core feature as of now:
> > >
> > > Sigh, I missed arm (32).  Russell or ARM folks, what's the right
> > > incantation to make the CPU notice instruction changes initiated by
> > > other cores on 32-bit ARM?
> >
> > You need to call flush_icache_range(), since the changes need to be
> > flushed from the data cache to the point of unification (of the Harvard
> > I and D), and the instruction cache needs to be invalidated so it can
> > then see those updated instructions. This will also take care of the
> > necessary barriers that the CPU requires for you.
>
> With what parameters?   From looking at the header, this is for the
> case in which the kernel writes some memory and then intends to
> execute it.  That's not what membarrier() does at all.  membarrier()
> works like this:
>
> User thread 1:
>
> write to RWX memory *or* write to an RW alias of an X region.
> membarrier(...);
> somehow tell thread 2 that we're ready (with a store release, perhaps,
> or even just a relaxed store.)
>
> User thread 2:
>
> wait for the indication from thread 1.
> barrier();
> jump to the code.
>
> membarrier() is, for better or for worse, not given a range of addresses.
>
> On x86, the documentation is a bit weak, but a strict reading
> indicates that thread 2 must execute a serializing instruction at some
> point after thread 1 writes the code and before thread 2 runs it.
> membarrier() does this by sending an IPI and ensuring that a
> "serializing" instruction (thanks for great terminology, Intel) is
> executed.  Note that flush_icache_range() is a no-op on x86, and I've
> asked Intel's architects to please clarify their precise rules.  No
> response yet.
>
> On arm64, flush_icache_range() seems to send an IPI, and that's not
> what I want.  membarrier() already does an IPI.

After chatting with rmk about this (but without claiming that any of
this is his opinion), based on the manpage, I think membarrier()
currently doesn't really claim to be synchronizing caches? It just
serializes cores. So arguably if userspace wants to use membarrier()
to synchronize code changes, userspace should first do the code
change, then flush icache as appropriate for the architecture, and
then do the membarrier() to ensure that the old code is unused?

For 32-bit arm, rmk pointed out that that would be the cacheflush()
syscall. That might cause you to end up with two IPIs instead of one
in total, but we probably don't care _that_ much about extra IPIs on
32-bit arm?

For arm64, I believe userspace can flush icache across the entire
system with some instructions from userspace - "DC CVAU" followed by
"DSB ISH", or something like that, I think? (See e.g.
compat_arm_syscall(), the arm64 compat code that implements the 32-bit
arm cacheflush() syscall.)
