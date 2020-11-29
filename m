Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E822C7B24
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 21:18:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkfnM5cW1zDrR8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 07:18:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zoQ5Lxgc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkflZ3CsSzDr3L
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 07:16:42 +1100 (AEDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A396C206F1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606680999;
 bh=N/5rjQqJanCNkJazZn/cQ2aPW49EUqzYQDUy+Xdcge0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zoQ5Lxgc6zNAHdi1TxRNlYE1X9icdqUIKZ0Lyn5G4krXiUrbOlTHCMFgyRZ1wP5H9
 lCFb/GRSgJQ4mzU+2E/e2BdLvn2acE5gSykZgvwLENgB2fOJLRfgm5+YUeagEG4208
 EKPPM7B1BAsYdx57oNqWODG7gFgzdyHtVFafmQak=
Received: by mail-wr1-f50.google.com with SMTP id 64so12521640wra.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 12:16:39 -0800 (PST)
X-Gm-Message-State: AOAM5312sXMbytAgOGEVwdy1eJ8bIUlQue/xr42keJ3cRSm6gWXRGt0f
 ZuV32aR0tEfgi2FR+rar8M0DoOMbsDf4QMCXyjnvFA==
X-Google-Smtp-Source: ABdhPJwYikNyF98Tybzh36itlesMK1rlfrvxImOMUWZkk0NuWSWbLwn6lWsiusLeR7vr43/6ZfjVImZ+tuEfqHGf3aM=
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr24072262wrs.75.1606680998232; 
 Sun, 29 Nov 2020 12:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
In-Reply-To: <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 29 Nov 2020 12:16:26 -0800
X-Gmail-Original-Message-ID: <CALCETrWBtCfD+jZ3S+O8FK-HFPODuhbDEbbfWvS=-iPATNFAOA@mail.gmail.com>
Message-ID: <CALCETrWBtCfD+jZ3S+O8FK-HFPODuhbDEbbfWvS=-iPATNFAOA@mail.gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
To: Andy Lutomirski <luto@kernel.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 28, 2020 at 7:54 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > On big systems, the mm refcount can become highly contented when doing
> > a lot of context switching with threaded applications (particularly
> > switching between the idle thread and an application thread).
> >
> > Abandoning lazy tlb slows switching down quite a bit in the important
> > user->idle->user cases, so so instead implement a non-refcounted scheme
> > that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
> > any remaining lazy ones.
> >
> > Shootdown IPIs are some concern, but they have not been observed to be
> > a big problem with this scheme (the powerpc implementation generated
> > 314 additional interrupts on a 144 CPU system during a kernel compile).
> > There are a number of strategies that could be employed to reduce IPIs
> > if they turn out to be a problem for some workload.
>
> I'm still wondering whether we can do even better.
>

Hold on a sec.. __mmput() unmaps VMAs, frees pagetables, and flushes
the TLB.  On x86, this will shoot down all lazies as long as even a
single pagetable was freed.  (Or at least it will if we don't have a
serious bug, but the code seems okay.  We'll hit pmd_free_tlb, which
sets tlb->freed_tables, which will trigger the IPI.)  So, on
architectures like x86, the shootdown approach should be free.  The
only way it ought to have any excess IPIs is if we have CPUs in
mm_cpumask() that don't need IPI to free pagetables, which could
happen on paravirt.

Can you try to figure out why you saw any increase in IPIs?  It would
be nice if we can make the new code unconditional.
