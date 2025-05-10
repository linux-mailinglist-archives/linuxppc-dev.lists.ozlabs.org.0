Return-Path: <linuxppc-dev+bounces-8482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B33AB20CE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 03:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvT3M34Wqz3bb2;
	Sat, 10 May 2025 11:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746840959;
	cv=none; b=oyqM8PvW+t0fjzs4AxfK1CLZDdRUyjnemdUeM3Q5lN0tIbN9iuGen6nHwB7Qjvkxz5Z8BhhYk00XJhbDA6vIF+HmpZI48YkcaIoozhAgnV8L9cwpUrkAMPJRmdF8ZygoGgfLeoTUSbuD/KoxlDNzaflX68vjwR6F/2EuikLKmSCLyeV2ea+qojpXMG+u0qdKm8jBp8UvgUAjXPQvosMP06xgaVm3xbZ/q+9tujEbqcpQqG7wU7rKZVO2mz+1sEqo6N1p5kKloCW+GepagiHym/O0d0g9aD0buOGz18je6Ewm1D7oKZq25TZHNSPqPXKVDnPBFc7XoNAmxltkQUcdug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746840959; c=relaxed/relaxed;
	bh=clr+oir1N8op24mbDyJwk/ssTZqxg40bgPf0hiAHq8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXOdwtNph6tCqmEJqBfEvJpu3aydEh+v26gDChoSNxqdukDTdIHELjv4xD38H9u81Y+64dDhMB7xxdp43TPNayVT2wfwwSH4A376/uxGzdu7puPBbRrYzC2VlKcQuCLKM8ui20BWO2NGBcycoP/ZTT6JGfkUboXGW6xKHftGZIh+4kJkpHdjTDBqd0NgGz5VaVk62G8X5stdL1ow2LUaoNStwvFMUCgq8Lf/tP8Rm4RTALyHOX9A/OwKXUpd38YrrzKwnwpwP8okFPjDqq6ZGOrDfy/Z8OUdtjbayi9uuC9NiC1BPMTvkA+f+qqJ808pqZ7qtfASJsYJC+RJMOjcaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Pw/kaTNx; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Pw/kaTNx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gandalf.ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvT3K413Fz2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 11:35:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1746840956;
	bh=clr+oir1N8op24mbDyJwk/ssTZqxg40bgPf0hiAHq8g=;
	h=Date:From:To:Cc:Subject:From;
	b=Pw/kaTNxOT2chPQlvsfWcaEfjMK9EQ0UiWUozFfWmcXeG1UoP4AVWcRz3B882jeWo
	 Vl8sM0DNKDSbl2joncWPCHsvoaIghYu0uqkbVKjZOTHvAATYyqUw0R0kxJbWO2YcUD
	 uqsQLbkAuncR68he4SwWmU1MiAjD/atbEwVwSFO8BICkfhzeSFoMqF58a0LoS6PWkd
	 YTnRMegX8oEDdw4AI3b6rP7dGbHO8BxqO0Q7Hca0IFdXjpwOnfHASiOTplvblfQjz6
	 G2/c6ZHpV1W+LCMfHZV3VDsshLA+V0SK6Jux0mo/4DPlNtPKhyPUYp1jrdBaWPeLDK
	 3KGDWgcln7rsA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4ZvT3J5ZwHz4wvb; Sat, 10 May 2025 11:35:56 +1000 (AEST)
Date: Sat, 10 May 2025 11:35:52 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: Crash in __do_IRQ with gcc 15
Message-ID: <aB6teOoVLWkdvyBu@bruin>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Running Linux on Microwatt with a kernel compiled on an x86-64 system
running Fedora 42 (using the packaged cross-compiler, i.e. the
gcc-powerpcle64-linux-gnu package), I'm seeing a crash like this:

[    0.141591] smp: Bringing up secondary CPUs ...
[    0.167628] BUG: Unable to handle kernel data access on write at 0xc00a0000be8d6004
[    0.175409] Faulting instruction address: 0xc00000000000fcb4
cpu 0x0: Vector: 300 (Data Access) at [c0000000012f78d0]
    pc: c00000000000fcb4: __do_IRQ+0x64/0x84
    lr: c00000000000fccc: __do_IRQ+0x7c/0x84
    sp: c0000000012f7b70
   msr: 9000000000001033
   dar: c00a0000be8d6004
 dsisr: 42000000
  current = 0xc0000000012de000
  paca    = 0xc00000000135d000   irqmask: 0x03   irq_happened: 0x01
    pid   = 0, comm = swapper/0
Linux version 6.15.0-rc1-00001-g72b73737d483-dirty (paulus@thinks) (powerpc64le-linux-gnu-gcc (GCC) 15.0.1 20250329 (Red Hat Cross 15.0.1-0), GNU ld version 2.44-1.fc42) #5 SMP Thu May  8 22:20:34 AEST 2025
enter ? for help
[c0000000012f7b70] c00000000000fd50 do_IRQ+0x7c/0x90 (unreliable)
[c0000000012f7ba0] c000000000007db4 hardware_interrupt_common_virt+0x1c4/0x1d0
--- Exception: 500 (Hardware Interrupt) at c00000000001c2ec arch_local_irq_restore+0x60/0xc4
[c0000000012f7ea0] c000000000083c68 do_idle+0xd4/0xf4
[c0000000012f7ee0] c000000000083e08 cpu_startup_entry+0x34/0x38
[c0000000012f7f10] c00000000000cc7c kernel_init+0x0/0x144
[c0000000012f7f40] c000000001000ecc do_one_initcall+0x0/0x160
[c0000000012f7fe0] c00000000000ba6c start_here_common+0x1c/0x20
0:mon>

What's happening is that gcc 15 seems to be using r2 as an ordinary
register, and r2 has a live value in it at the point where __do_IRQ()
calls call_do_irq().  Since r2 is not in the clobber list for the
inline asm in call_do_irq(), it doesn't get saved and restored around
the call to __do_irq(), and when we come back to __do_IRQ(), it has
been modified.  Then when __do_IRQ() subsequently does a store using
r2, it blows up like the above.

Adding r2 to the clobber list in call_do_irq() fixes it.  Does this
seem like the right fix?  Does it need to be conditional on the gcc
version?  Or is there a better way to fix the problem?

Thanks,
Paul.

