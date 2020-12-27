Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 667222E3305
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 22:38:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D3vDS0l5DzDqCs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 08:38:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AqlCdXKH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D3vBk563XzDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 08:36:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 174EC207FF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Dec 2020 21:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609104987;
 bh=xf1xhuCSbIvU6yFstK8GVJEOxP3WIu96vlXc4UxPWjg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AqlCdXKHE+ITIKKRlqblXCSPB1fZi8/UDAb1RDKCM1LvBmfFUzWwvmRaxDmO2t3hX
 Nk6pMZGldD5DaO605Rtt8TjjpOD/gSk58ws/PQ9FMfNSuHWbyzwf58epdI6g3zk8xZ
 Igbu0xStOGQWdGd9Kogu2VJnNRAWN3zsxS3vBuHZhFn096dU225m4SpqgJdSX6aMov
 EBd0pc/BjZrshn7beSWmBBUXcEIKmk+336nrsvKpQCdQceJupZ7MtSF8mohlT+MVwl
 hKrhBGpC7tm8GB4+e/xrihyvUg8Ly26YAqTnggMTfP4n7AumuBvcriGH+eaPw+YB2h
 jGdZuFrFFMGPQ==
Received: by mail-wr1-f53.google.com with SMTP id y17so8935648wrr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Dec 2020 13:36:27 -0800 (PST)
X-Gm-Message-State: AOAM530Cz5RaQlvbo95+4OzKZO8ivATUhX2j2AB1lr0Jzb4+21O2GSI3
 EYK1LCqt1sSuqMdtyL2dg+OT02TFhje38rS+QNZZUQ==
X-Google-Smtp-Source: ABdhPJwL0d4jxly4xZo1ozG4f8+9aazYql5ttlOL3TT+E+3PWhEM6R+ijPQOdmXIla5FWQwjhuFdendweCd9l/QAEJQ=
X-Received: by 2002:a5d:4905:: with SMTP id x5mr47749724wrq.75.1609104985693; 
 Sun, 27 Dec 2020 13:36:25 -0800 (PST)
MIME-Version: 1.0
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
In-Reply-To: <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 27 Dec 2020 13:36:13 -0800
X-Gmail-Original-Message-ID: <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
Message-ID: <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Russell King <linux@armlinux.org.uk>
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
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 27, 2020 at 12:18 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Dec 27, 2020, at 1:28 PM, Andy Lutomirski luto@kernel.org wrote:
>

> >
> > I admit that I'm rather surprised that the code worked at all on arm64,
> > and I'm suspicious that it has never been very well tested.  My apologies
> > for not reviewing this more carefully in the first place.
>
> Please refer to Documentation/features/sched/membarrier-sync-core/arch-support.txt
>
> It clearly states that only arm, arm64, powerpc and x86 support the membarrier
> sync core feature as of now:

Sigh, I missed arm (32).  Russell or ARM folks, what's the right
incantation to make the CPU notice instruction changes initiated by
other cores on 32-bit ARM?

>
>
> # Architecture requirements
> #
> # * arm/arm64/powerpc
> #
> # Rely on implicit context synchronization as a result of exception return
> # when returning from IPI handler, and when returning to user-space.
> #
> # * x86
> #
> # x86-32 uses IRET as return from interrupt, which takes care of the IPI.
> # However, it uses both IRET and SYSEXIT to go back to user-space. The IRET
> # instruction is core serializing, but not SYSEXIT.
> #
> # x86-64 uses IRET as return from interrupt, which takes care of the IPI.
> # However, it can return to user-space through either SYSRETL (compat code),
> # SYSRETQ, or IRET.
> #
> # Given that neither SYSRET{L,Q}, nor SYSEXIT, are core serializing, we rely
> # instead on write_cr3() performed by switch_mm() to provide core serialization
> # after changing the current mm, and deal with the special case of kthread ->
> # uthread (temporarily keeping current mm into active_mm) by issuing a
> # sync_core_before_usermode() in that specific case.
>

I need to update that document as part of my series.

> This is based on direct feedback from the architecture maintainers.
>
> You seem to have noticed odd cases on arm64 where this guarantee does not
> match reality. Where exactly can we find this in the code, and which part
> of the architecture manual can you point us to which supports your concern ?
>
> Based on the notes I have, use of `eret` on aarch64 guarantees a context synchronizing
> instruction when returning to user-space.

Based on my reading of the manual, ERET on ARM doesn't synchronize
anything at all.  I can't find any evidence that it synchronizes data
or instructions, and I've seen reports that the CPU will happily
speculate right past it.

--Andy
