Return-Path: <linuxppc-dev+bounces-8496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08089AB2E1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 05:31:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwlWy2Rjzz2ySQ;
	Mon, 12 May 2025 13:31:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747020702;
	cv=none; b=SicZPhyEWMfKDf64306FHZ3lxznnikPHaqn4Xz1jiGhCCRkzZuwZuDdoqJoXoijKWVzRGggO9pKBICr06tbDDTcfHbv7E/CJJLe0Y2s+nnUoqDOZ/C3BRTUGh4+3TTaGO/4ca/VSk2K43AQE4wzuolSAnXlBIHnhTKZ55AogTnbyB/n3/TMjYYG0yDrhh9WNGIcg79SyPOv48fTY79YfBjiy7ZFrzvW7dCqru/59FfGWwryY0O88gQsTXRlfGk6H1vBnUv+RwlrOUjL7GMH2YOSyIxX/KfihGhK+mPOZyL1i/ppzP2U8/jQNFdxareTN4zgPUYGx4BpxRrKTchw2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747020702; c=relaxed/relaxed;
	bh=8gV2OF+2AsbZuPqHF4y4nM+avqClWgb5QIvmyygkJ58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oQIkgSUd/OvgTaAvsv5rxaupNshiOXkOpzF3zyAW5qgSddjI26mjrqZIzPbl+i4jGqLPL9AZP9yxDWEyNZdR+hS/eIXIjJ/ACzCT0QbhtSbhpULNlJi5SYfwEV/7IJcQVtW4CJL0uuAN2ZnimkkQLTeuUh7C0PiU8eZJgzgmGUT4npxozn8DAMzGdWZUXiYgthQDkdIyFTkmZBqWXtq7nmfGsyoDmtdseYpyh8fMOVq75cCvYh8neNGM1+shlm5BJB0PqaaL+kh14yqWwzq6dMTl8m8TBA6BZiqyIAPpjI6DEFfN+S3kbdTKVa9fZf9VUrVXrh5+/on6zUrhx/+nQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RO7iWRd3; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RO7iWRd3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwlWw39Ftz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 13:31:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1747020698;
	bh=8gV2OF+2AsbZuPqHF4y4nM+avqClWgb5QIvmyygkJ58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RO7iWRd3qmadxxG70oZioTZ2SoMJdrlY+NJkPR5wt5irnzy3qTpW4hS0SCrAF/KCZ
	 R7Aaa2ZByDQtVMqmWwhRDi4oVipr6bpN6ObLmqLiG67+GDFLYDry0Otsjg4AwyRh0D
	 7GTAMa3OLXaNm3yWaely6aMTUn0hdmSNVt/XGJ3L5Ak3L+TkZYXLfPrcyRYLE63WYE
	 OzFUtPksuQXqwxfbFyC5FwID+9jyajClUYQzGuue6uhxTQUhziZEPD7um6h3qM0uaz
	 0bqM8kzQUCtNbXfNGTjbM9Fx2GNipipc9rLJ3sM/d79C5Mz9QBHID8duBpboiqEGGo
	 cvOvgU6/CPQbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwlWt2892z4x1t;
	Mon, 12 May 2025 13:31:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Crash in __do_IRQ with gcc 15
In-Reply-To: <aB6teOoVLWkdvyBu@bruin>
References: <aB6teOoVLWkdvyBu@bruin>
Date: Mon, 12 May 2025 13:31:34 +1000
Message-ID: <87y0v2sdwp.fsf@mpe.ellerman.id.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Paul Mackerras <paulus@ozlabs.org> writes:
> Running Linux on Microwatt with a kernel compiled on an x86-64 system
> running Fedora 42 (using the packaged cross-compiler, i.e. the
> gcc-powerpcle64-linux-gnu package), I'm seeing a crash like this:
>
> [    0.141591] smp: Bringing up secondary CPUs ...
> [    0.167628] BUG: Unable to handle kernel data access on write at 0xc00a0000be8d6004
> [    0.175409] Faulting instruction address: 0xc00000000000fcb4
> cpu 0x0: Vector: 300 (Data Access) at [c0000000012f78d0]
>     pc: c00000000000fcb4: __do_IRQ+0x64/0x84
>     lr: c00000000000fccc: __do_IRQ+0x7c/0x84
>     sp: c0000000012f7b70
>    msr: 9000000000001033
>    dar: c00a0000be8d6004
>  dsisr: 42000000
>   current = 0xc0000000012de000
>   paca    = 0xc00000000135d000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 0, comm = swapper/0
> Linux version 6.15.0-rc1-00001-g72b73737d483-dirty (paulus@thinks) (powerpc64le-linux-gnu-gcc (GCC) 15.0.1 20250329 (Red Hat Cross 15.0.1-0), GNU ld version 2.44-1.fc42) #5 SMP Thu May  8 22:20:34 AEST 2025
> enter ? for help
> [c0000000012f7b70] c00000000000fd50 do_IRQ+0x7c/0x90 (unreliable)
> [c0000000012f7ba0] c000000000007db4 hardware_interrupt_common_virt+0x1c4/0x1d0
> --- Exception: 500 (Hardware Interrupt) at c00000000001c2ec arch_local_irq_restore+0x60/0xc4
> [c0000000012f7ea0] c000000000083c68 do_idle+0xd4/0xf4
> [c0000000012f7ee0] c000000000083e08 cpu_startup_entry+0x34/0x38
> [c0000000012f7f10] c00000000000cc7c kernel_init+0x0/0x144
> [c0000000012f7f40] c000000001000ecc do_one_initcall+0x0/0x160
> [c0000000012f7fe0] c00000000000ba6c start_here_common+0x1c/0x20
> 0:mon>
>
> What's happening is that gcc 15 seems to be using r2 as an ordinary
> register, and r2 has a live value in it at the point where __do_IRQ()
> calls call_do_irq().  Since r2 is not in the clobber list for the
> inline asm in call_do_irq(), it doesn't get saved and restored around
> the call to __do_irq(), and when we come back to __do_IRQ(), it has
> been modified.  Then when __do_IRQ() subsequently does a store using
> r2, it blows up like the above.

Are you building with pcrel? Otherwise r2 shouldn't be getting used as
an ordinary register.

Can you show the disassembly of where it's getting used?

There was a change to r2 handling in GCC 15, but AFAICS it was meant to
only affect pcrel code.

Still it's likely our bug because we are being weird and calling a
function inside an inline asm block.

cheers

