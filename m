Return-Path: <linuxppc-dev+bounces-2075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A030E99966E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 02:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPn9r6rMmz3bfR;
	Fri, 11 Oct 2024 11:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728605520;
	cv=none; b=HKVriZ8eVcZkyiMJFt/RrZKOzAUjgW6LN3T2TQ+G0yjltjZrV1IstDw1ybl5dphlKZE14gW01UuCESiXN/tf8m2ZjJo8Eg6t21VU7H9bk9dHpFmT3PPMsZh060P8slIGhSAlyrIKI5GcPAUVC4NDggEQytpnkQAKi3B1xStMMxcOiL+8lfu4yhrcF1L2exOLP+gY0jR5VzBSlUozLmiuaDqmqSbxGe64KwQcb02fMxxfmKaUnoqZuHzgrjQFC9xvtpjY7rt9SIHYRdvNHV7+pAVAV8mrWbj8PpTbnn0LSagn3CYIQz3cjqgHk2c1gDhh2MsR/FhkEHoPcbeicM3ISg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728605520; c=relaxed/relaxed;
	bh=UvRhhxa/P6kUhZMsun7DjFMKqxX3NGt5tLH0F7hxgfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBhVS1fSQnHHeWyUTS5LSHdiobdKvAc4KZ/CU0yVGj7SmSGHvBvvkEROW2xsDocpxhwhRK2jvhL8y9KuozosUyk6BpTlwBn1vWc6grzhVMiNvMiIo6YmyQjEPzx+qgviaRqLDHbWcbCNhoTR88fGNf/qfwYz60CT0Y2srbV2oNdNLnKxtgGkfslUol+LDoW+v4F4lQ76sCe4RL6vhaxv8FVxEPiq2jpgpXsj3FVvSIyGdrCAQWovqmPvh+5fTc7py+kUdKc3q9zc4P/Utp/JkPeTAKwnVVse1KeOcc6mmZzUQO6ryjExNjv0RKoYrAMSLclS0RCC0WyNa7lQVm7eMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=csxu=rh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=csxu=rh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPn9p4kLGz3bdX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 11:11:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6A15C5AB4;
	Fri, 11 Oct 2024 00:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F66DC4CECD;
	Fri, 11 Oct 2024 00:11:52 +0000 (UTC)
Date: Thu, 10 Oct 2024 20:12:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241010201200.729d4fcb@gandalf.local.home>
In-Reply-To: <202410110707.uHvgl9S7-lkp@intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
	<202410110707.uHvgl9S7-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 11 Oct 2024 08:00:21 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Steven,
> 
> kernel test robot noticed the following build errors:

Hmm,

I wonder if we can not waste resources if a v2 version of a patch is sent
out. Not sure when this was picked up, but I sent out an updated version
with this fixed yesterday.

  https://lore.kernel.org/all/20241008230628.958778821@goodmis.org/

-- Steve


> 
> [auto build test ERROR on next-20241004]
> [cannot apply to s390/features arm64/for-next/core powerpc/next powerpc/fixes linus/master v6.12-rc2 v6.12-rc1 v6.11 v6.12-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Make-ftrace_regs-abstract-from-direct-use/20241008-084930
> base:   next-20241004
> patch link:    https://lore.kernel.org/r/20241007204743.41314f1d%40gandalf.local.home
> patch subject: [PATCH] ftrace: Make ftrace_regs abstract from direct use
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410110707.uHvgl9S7-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110707.uHvgl9S7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410110707.uHvgl9S7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    In file included from kernel/time/time.c:33:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:10:
>    In file included from include/linux/perf_event.h:52:
>    In file included from include/linux/ftrace.h:23:
>    In file included from ./arch/um/include/generated/asm/ftrace.h:1:
> >> include/asm-generic/ftrace.h:5:2: error: unterminated conditional directive  
>        5 | #ifndef __ASM_GENERIC_FTRACE_H__
>          |  ^
>    12 warnings and 1 error generated.
> --
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:10:
>    In file included from include/linux/perf_event.h:52:
>    In file included from include/linux/ftrace.h:23:
>    In file included from ./arch/um/include/generated/asm/ftrace.h:1:
> >> include/asm-generic/ftrace.h:5:2: error: unterminated conditional directive  
>        5 | #ifndef __ASM_GENERIC_FTRACE_H__
>          |  ^
>    kernel/time/hrtimer.c:121:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:122:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:123:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:124:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
>          |                                   ^~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    16 warnings and 1 error generated.
> 
> 
> vim +5 include/asm-generic/ftrace.h
> 
> 38f5bf84bd588a GuanXuetao 2011-01-15 @5  #ifndef __ASM_GENERIC_FTRACE_H__
> 38f5bf84bd588a GuanXuetao 2011-01-15  6  #define __ASM_GENERIC_FTRACE_H__
> 38f5bf84bd588a GuanXuetao 2011-01-15  7  
> 


