Return-Path: <linuxppc-dev+bounces-3051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC39C1F26
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 15:25:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlLnf42Bbz3btj;
	Sat,  9 Nov 2024 01:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731075926;
	cv=none; b=VFSb2ZQAaQVWCEwncBLq12dNsAnW5x+L+vghCMhCtmIHSCJKnStlXZikeriFo2gOy3Lm9jhJd2BBtSs1mZuoiWDigHNT7xr6fZAb3HbYukyKZkQdUIhNoo5bSjJg5s9EOJ1Auib5TPZoFyJot2kXtSvPQ1dgS0OJCDfJM7HyxbfcBoNUl1475A9GxkstITk/nTrxwNk0kgjkM7qqx1KWGjAH+9v2Gk8g1K2g5PD/l4qNcJjcrZCGaIlEyifrGROsGjaJ7ny4rgpCKpQfAt9a07GAdi2OJaShte3L2AVM7CZgByT3Yotndslz/i25ksJx5gg6XFr9x+jCuoSDyAb3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731075926; c=relaxed/relaxed;
	bh=v+f+g8yyOKXMQlbG8MpvRrvh4tIxLok0rEAYYuf18pU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FN2L3PDwCFKY3vZsTAvsQS7H16IEsGEficSEGnorT/ZDVFmOSek/6rm02NGDZnFIFehpB7NGsF/ra+ngzQSjs4o602BwOq6DGoCu3H1la0wXsRir/3dccXVKyRB+fIMa1loGaHiK38e5ZNOhW0guC+kjlBGSuYVTHFtBHjkMDyPNTS+7J2O3BkzcXwmG5hEAS8HSpXq0LlFGrwt2KhyBdyX5jy8BD8Xnv/xcYz/rpQClZToInd8jJZc6ksnrCNX4HWGixSCW0RzRS7S2ARj+mFfAkd3/4aXXMMeMcLHVocF1nOWEST6AHPIozLLmp3PVhhYb8Xyu9lXPb9idlAKFjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TAmLIgJp; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jj/8EwA6; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TAmLIgJp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jj/8EwA6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlLnd3mcXz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 01:25:25 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731075911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+f+g8yyOKXMQlbG8MpvRrvh4tIxLok0rEAYYuf18pU=;
	b=TAmLIgJpFi3WYWagfHvvZLAAirgZXLul++2EA0xNzLlguNFCXkuNJTpfHNo69/tyI8iOQg
	u4vLFaU7ceFS/iJcWPNqKOQUlm2pysPD3aoU/TClqt+39Nz5Y0kWGOGhLQeX2ZKEaluvX7
	JrFFbixe2hezzdMtdwmRw+Mm/Mg0eoiw8AdWn8T0VHbVO2fBuftlG4I5TkyBjYHjxurTBW
	WPvm4i8miTfv9X6bPrBoFZRtSiKtjorssIDWzxQ/wC7gTIqCeMwplVMFDMlGu3C6JC0MYz
	3ECnyr7+hH5tijyg0p6vRJtVJ1V7xWwN+rOmq60anQwvSzqzIVmDRCYZPzF3KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731075911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+f+g8yyOKXMQlbG8MpvRrvh4tIxLok0rEAYYuf18pU=;
	b=jj/8EwA6cJ5MUQOonh7MRj4YYMI1ZD0f2sju/5TUx8FC8GyPnd68uaGGplLfknboD/bc7G
	2i/uKKIRBVnxttBA==
To: David Wang <00107082@163.com>, richard.henderson@linaro.org,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 paul.walmsley@sifive.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, David Wang
 <00107082@163.com>
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
In-Reply-To: <20241103080552.4787-1-00107082@163.com>
References: <20241103080552.4787-1-00107082@163.com>
Date: Fri, 08 Nov 2024 15:25:13 +0100
Message-ID: <87r07lol9y.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

David!

On Sun, Nov 03 2024 at 16:05, David Wang wrote:

$Subject: [PATCH] kernel/irq/proc: performance: ...

That's not a valid subsystem prefix.

> seq_printf is costy, when stress reading /proc/interrupts, profiling indicates
> seq_printf takes about ~47% of show_interrupts samples:

Also please follow the documentation for denoting functions in change
logs:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

>  arch/alpha/kernel/irq.c     |   8 +--
>  arch/arm/kernel/smp.c       |   4 +-
>  arch/arm64/kernel/smp.c     |   3 +-
>  arch/csky/kernel/smp.c      |   4 +-
>  arch/loongarch/kernel/smp.c |   2 +-
>  arch/parisc/kernel/irq.c    |  34 ++++++------
>  arch/powerpc/kernel/irq.c   |  44 ++++++++--------
>  arch/riscv/kernel/smp.c     |   3 +-
>  arch/sh/kernel/irq.c        |   4 +-
>  arch/sparc/kernel/irq_32.c  |  12 ++---
>  arch/sparc/kernel/irq_64.c  |   4 +-
>  arch/x86/kernel/irq.c       | 100 ++++++++++++++++++------------------
>  arch/xtensa/kernel/irq.c    |   2 +-
>  arch/xtensa/kernel/smp.c    |   4 +-
>  kernel/irq/proc.c           |   6 ++-

There is no dependency on these changes. So please split them up into
seperate patches for core and the individual architectures.

Thanks,

        tglx

