Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1A49E175
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 12:47:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkzNQ4kGfz3bck
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:47:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JkzN017HLz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 22:47:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C491FB;
 Thu, 27 Jan 2022 03:47:06 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CE773F7D8;
 Thu, 27 Jan 2022 03:47:05 -0800 (PST)
Date: Thu, 27 Jan 2022 11:46:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Yinan Liu <yinan@linux.alibaba.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFclROd+0/61q2d@FVFF77S0Q05N>
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[adding LKML so this is easier for others to find]

If anyone wants to follow the thread from the start, it's at:

  https://lore.kernel.org/linuxppc-dev/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com/

Ard, I was under the impression that the 32-bit arm kernel was (virtually)
relocatable, but I couldn't spot where, and suspect I'm mistaken. Do you know
whether it currently does any boot-time dynamic relocation?

Kees, there's an x86_64 relocation question for you at the end.

On Wed, Jan 26, 2022 at 02:37:16PM +0000, Mark Rutland wrote:
> Hi,
> 
> Steve pointed me at this thread over IRC -- I'm not subscribed to this list so
> grabbed a copy of the thread thus far via b4.
> 
> On Tue, Jan 25, 2022 at 11:20:27AM +0800, Yinan Liu wrote:
> > > Yeah, I think it's time to opt in, instead of opting out.
> 
> I agree this must be opt-in rather than opt-out.
> 
> However, I think most architectures were broken (in at least some
> configurations) by commit:
> 
>   72b3942a173c387b ("scripts: ftrace - move the sort-processing in ftrace_init")
> 
> ... and so I don't think this fix is correct as-is, and we might want to revert
> that or at least mark is as BROKEN for now.

Steve asked for a bit more detail on IRC, so the below is an attempt to explain
what's actually going on here.

The short answer is that relocatable kernels (e.g. those with KASLR support)
need to handle the kernel being loaded at (somewhat) arbitrary virtual
addresses. Even where code can be position-independent, any pointers in the
kernel image (e.g. the contents of the mcount_loc table) need to be updated to
account for the specific VA the kernel was loaded at -- arch code does this
early at boot time by applying dynamic (ELF) relocations.

Walking through how we get there, considering arm64 specifically:

1) When an object is created with traceable functions:

   The compiler records the addresses of the callsites into a section. Those
   are absolute virtual addresses, but the final virtual addresses are not yet
   known, so the compiler generates ELF relocations to tell the linker how to
   fill these in later.

   On arm64, since the compiler doesn't know the final value yet, it fills the
   actual values with zero for now. Other architectures might do differently.

   For example, per `objdump -r init/main.o`:

   | RELOCATION RECORDS FOR [__patchable_function_entries]:
   | OFFSET           TYPE              VALUE 
   | 0000000000000000 R_AARCH64_ABS64   .text+0x0000000000000028
   | 0000000000000008 R_AARCH64_ABS64   .text+0x0000000000000088
   | 0000000000000010 R_AARCH64_ABS64   .text+0x00000000000000e8

2) When vmlinux is linked:

   The linker script accumulates the callsite pointers from all the object
   files into the mcount_loc table. Since the kernel is relocatable, the
   runtime absolute addresses are still not yet known, but the offset relative
   to the kernel base is known, and so the linker consumes the absolute
   relocations created by the compiler and generates new relocations relative
   to the kernel's default load address so that these can be adjusted at boot
   time.

   On arm64, those are RELA and/or RELR relocations, which our vmlinux.lds.S
   accumulates those into a location in the initdata section that the kernel
   can find at boot time:

     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/vmlinux.lds.S?h=v5.17-rc1#n252
 
   For example, per `objdump -s vmlinux -j .rela.dyn`:

   | vmlinux:     file format elf64-littleaarch64
   | 
   | Contents of section .rela.dyn:
   |  ffff800009beb0d0 b01a0b09 0080ffff 03040000 00000000  ................
   |  ffff800009beb0e0 00600b09 0080ffff b81a0b09 0080ffff  .`..............
   |  ffff800009beb0f0 03040000 00000000 80710b09 0080ffff  .........q......
   |  ffff800009beb100 e8670b09 0080ffff 03040000 00000000  .g..............
   |  ffff800009beb110 48e60809 0080ffff f0670b09 0080ffff  H........g......
   |  ffff800009beb120 03040000 00000000 ec190b09 0080ffff  ................

   Each of the relocations in .rela.dyn consists of 3 64-bit little-endian
   values:

   * The first (e.g. 0xffff8000090b1ab0) is the VA of the pointer to write to,
     assuming the kernel's default load address (e.g. 0xffff800008000000). An
     offset must be applied to this depending on where the kernel was actually
     loaded relative to that default load address.

   * The second (e.g. 0x0000000000000403) is the ELF relocation type (1027, AKA
     R_AARCH64_RELATIVE).

   * The third, (e.g. 0xffff8000090b6000) is the VA to write to the pointer,
     assuming the kernel's default load address (e.g. 0xffff800008000000). An
     offset must be applied to this depending on where the kernel was actually
     loaded relative to that default load address.

   The AArch64 ELF spec defines our relocations, e.g.

     https://github.com/ARM-software/abi-aa/blob/main/aaelf64/aaelf64.rst#5712dynamic-relocations

   In general, relocations might depend on the default value that was
   initialized (e.g. OR-ing in high bits assuming the low bits are already
   correct). I'm not sure if any of the architectures we support uses such
   relocations for relocatable kernels, but they could in theory.

3) When the vmlinux mcount_loc table is sorted:

   The sorttable code sorts the data values within the mcount_loc table, but it
   doesn't read the relocations to resolve the VA of each entry, nor does it
   update the relocations when it swaps entries.

   For arm64, where entries were all initialized to zero at compile time and
   have not been updated since, the sort does nothing. When the relocations are
   applied later, the result will be an unsorted table.

   In general, where sorting *does* swap entries, it doesn't update the
   corresponding relocations. Where entries A and B get swapped by the sort,
   any relocation(s) for entry A will apply to the location of entry B, and
   vice-versa. Depending on the specific relocation used, that may or may not
   be a problem (e.g. the example of OR-ing in high bits would be broken).

4) When relocations are applied at boot time:

   On arm64, to account for KASLR or any other virtual offset we might have to
   account for, we apply the relocations early in boot in the
   __relocate_kernel() assembly function:

     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/head.S?h=v5.17-rc1#n753

   Since we didn't update the relocations during the build-time sort, and the
   mcount_loc table was not sorted to begin with, applying all the relocations
   for the mcount_loc table results in an unsorted table. Hence things go
   wrong later for any code relying on this having been sorted already.

IIUC the s390 and powerpc cases are structurally similar, though the fine
detail might differ a bit.

I'm not sure how x86 works here; AFAICT the relocations are performed during
decompression, but it looks like there's some special build-time processing
associated with that, and the vmlinux doesn't contain standard ELF relocations.

Kees, IIUC you added the x86_64 support there, can you shed any light on if/how
this works on x86?



In practice, building v5.17-rc1 with CONFIG_FTRACE_SORT_STARTUP_TEST=y I see
the following splat:

| ------------[ cut here ]------------
| [14] unknown_bootoption+0x4/0x1c8 at ffffa1a861200738 is not sorted with trace_initcall_finish_cb+0x4/0x6c at ffffa1a85f8130b8
| WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:6403 ftrace_process_locs.isra.0+0x370/0x440
| Modules linked in:
| CPU: 0 PID: 0 Comm: swapper Not tainted 5.17.0-rc1 #2
| Hardware name: linux,dummy-virt (DT)
| pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : ftrace_process_locs.isra.0+0x370/0x440
| lr : ftrace_process_locs.isra.0+0x370/0x440
| sp : ffffa1a861b23d90
| x29: ffffa1a861b23d90 x28: 0000000000000000 x27: 0000000000000000
| x26: 0000000000000000 x25: 0000000000000000 x24: ffffa1a8612c0008
| x23: ffffa1a861302ea8 x22: ffffa1a861374320 x21: 0000000000000001
| x20: 000000000000e28f x19: 000000000000000e x18: ffffffffffffffff
| x17: 726f7320746f6e20 x16: 7369203833373030 x15: 3231363861316166
| x14: 6666662074612038 x13: 3862303331386635 x12: 3861316166666666
| x11: 2074612063367830 x10: ffffa1a861b4b1d0 x9 : ffffa1a861b4b1d0
| x8 : 00000000ffffefff x7 : ffffa1a861ba31d0 x6 : ffffa1a861ba31d0
| x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 0000000000000000
| x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffa1a861b33e80
| Call trace:
|  ftrace_process_locs.isra.0+0x370/0x440
|  ftrace_init+0xb4/0x15c
|  start_kernel+0x40c/0x6d4
|  __primary_switched+0xc0/0xc8
| ---[ end trace 0000000000000000 ]---

Where those symbol adddresses are:

| [mark@lakrids:~/src/linux]% usekorg 11.1.0 aarch64-linux-objdump -t vmlinux | grep -w unknown_bootoption
| ffff800009a00734 l     F .init.text     00000000000001c8 unknown_bootoption
| [mark@lakrids:~/src/linux]% usekorg 11.1.0 aarch64-linux-objdump -t vmlinux | grep -w trace_initcall_finish_cb
| ffff8000080130b4 l     F .text  0000000000000064 trace_initcall_finish_cb

... and are obviously not sorted.

Further, the ftrace tests fail quite horribly, e.g.

| # ./ftracetest
| === Ftrace unit tests ===
| [1] Basic trace file check      [PASS]
| [2] Basic test for tracers[   38.979280] ------------[ ftrace bug ]------------
| [   38.980225] ftrace faulted on modifying
| [   38.980227] [<ffffa8ebbe6003fc>] set_reset_devices+0x8/0x24
| [   38.982078] Setting ftrace call site to call ftrace function
| [   38.983160] ftrace record flags: 80000001
| [   38.983921]  (1)
| [   38.983921]  expected tramp: ffffa8ebbcc2ba20
| [   38.985132] ------------[ cut here ]------------
| [   38.986013] WARNING: CPU: 3 PID: 265 at kernel/trace/ftrace.c:2068 ftrace_bug+0x284/0x2b4
| [   38.987649] Modules linked in:
| [   38.988275] CPU: 3 PID: 265 Comm: ftracetest Tainted: G        W         5.17.0-rc1-dirty #4
| [   38.989979] Hardware name: linux,dummy-virt (DT)
| [   38.990916] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| [   38.992318] pc : ftrace_bug+0x284/0x2b4
| [   38.993111] lr : ftrace_bug+0x284/0x2b4
| [   38.993893] sp : ffff80000888bb00
| [   38.994566] x29: ffff80000888bb00 x28: 0000000000000020 x27: ffffa8ebbefcaa70
| [   38.996002] x26: ffffa8ebbefcb7e0 x25: ffffa8ebbf36723c x24: ffffa8ebbf364000
| [   38.997447] x23: 00000000fffffff2 x22: ffffa8ebbe38f6e8 x21: ffffa8ebbef29c78
| [   38.998885] x20: ffff5ec380080030 x19: ffffa8ebbef29000 x18: ffffffffffffffff
| [   39.000316] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008888b827
| [   39.001758] x14: 0000000000000000 x13: 3032616232636362 x12: 6265386166666666
| [   39.003202] x11: 203a706d61727420 x10: ffffa8ebbef4b1d0 x9 : ffffa8ebbcd0dff0
| [   39.004645] x8 : 00000000ffffefff x7 : ffffa8ebbefa31d0 x6 : ffffa8ebbefa31d0
| [   39.006092] x5 : ffff5ec4befa29d8 x4 : 0000000000000000 x3 : 0000000000000000
| [   39.007538] x2 : 0000000000000000 x1 : ffff5ec380cf5580 x0 : 0000000000000022
| [   39.008982] Call trace:
| [   39.009495]  ftrace_bug+0x284/0x2b4
| [   39.010212]  ftrace_replace_code+0x9c/0xa4
| [   39.011054]  ftrace_modify_all_code+0xe4/0x14c
| [   39.011964]  arch_ftrace_update_code+0x18/0x24
| [   39.012874]  ftrace_run_update_code+0x24/0x7c
| [   39.013770]  ftrace_startup+0xf8/0x1b0
| [   39.014541]  register_ftrace_graph+0x2dc/0x324
| [   39.015449]  graph_trace_init+0x6c/0x74
| [   39.016232]  tracing_set_tracer+0xec/0x17c
| [   39.017071]  tracing_set_trace_write+0xe8/0x150
| [   39.017989]  vfs_write+0xfc/0x2a0
| [   39.018671]  ksys_write+0x74/0x100
| [   39.019370]  __arm64_sys_write+0x28/0x3c
| [   39.020172]  invoke_syscall+0x50/0x120
| [   39.020947]  el0_svc_common.constprop.0+0xdc/0x100
| [   39.021935]  do_el0_svc+0x34/0xa0
| [   39.022620]  el0_svc+0x28/0x80
| [   39.023253]  el0t_64_sync_handler+0xa8/0x130
| [   39.024121]  el0t_64_sync+0x1a0/0x1a4
| [   39.024874] ---[ end trace 0000000000000000 ]---
|         [PASS]
| [3] Basic trace clock test      [FAIL]
| [4] Basic event tracing check   [FAIL]
| [5] Change the ringbuffer size  [FAIL]

Thanks,
Mark.

> 
> More on that below.
> 
> > > 
> > > Something like this:
> > > 
> > > -- Steve
> > > 
> > > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > > index c2724d986fa0..5256ebe57451 100644
> > > --- a/arch/arm/Kconfig
> > > +++ b/arch/arm/Kconfig
> > > @@ -82,6 +82,7 @@ config ARM
> > >   	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
> > >   	select HAVE_CONTEXT_TRACKING
> > >   	select HAVE_C_RECORDMCOUNT
> > > +	select HAVE_BUILDTIME_MCOUNT_SORT
> > >   	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
> > >   	select HAVE_DMA_CONTIGUOUS if MMU
> > >   	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> 
> IIUC the 32-bit arm kernel can be relocated at boot time, so I don't believe
> this is correct, and I believe any relocatable arm kernel has been broken since
> htat was introduced.
> 
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index c4207cf9bb17..7996548b2b27 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -166,6 +166,7 @@ config ARM64
> > >   	select HAVE_ASM_MODVERSIONS
> > >   	select HAVE_EBPF_JIT
> > >   	select HAVE_C_RECORDMCOUNT
> > > +	select HAVE_BUILDTIME_MCOUNT_SORT
> > >   	select HAVE_CMPXCHG_DOUBLE
> > >   	select HAVE_CMPXCHG_LOCAL
> > >   	select HAVE_CONTEXT_TRACKING
> 
> The arm64 kernel is relocatable by default, and has been broken since the
> build-time sort was introduced -- I see ftrace test failures, and the
> CONFIG_FTRACE_SORT_STARTUP_TEST screams at boot time.
> 
> > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > > index 7399327d1eff..46080dea5dba 100644
> > > --- a/arch/x86/Kconfig
> > > +++ b/arch/x86/Kconfig
> > > @@ -186,6 +186,7 @@ config X86
> > >   	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
> > >   	select HAVE_C_RECORDMCOUNT
> > >   	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
> > > +	select HAVE_BUILDTIME_MCOUNT_SORT
> 
> Isn't x86 relocatable in some configurations (e.g. for KASLR)?
> 
> I can't see how the sort works for those cases, because the mcount_loc entries
> are absolute, and either:
> 
> * The sorted entries will get overwritten by the unsorted relocation entries,
>   and won't be sorted.
> 
> * The sorted entries won't get overwritten, but then the absolute address will
>   be wrong since they hadn't been relocated.
> 
> How does that work?
> 
> Thanks,
> Mark.
> 
> > >   	select HAVE_DEBUG_KMEMLEAK
> > >   	select HAVE_DMA_CONTIGUOUS
> > >   	select HAVE_DYNAMIC_FTRACE
> > > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > > index 752ed89a293b..7e5b92090faa 100644
> > > --- a/kernel/trace/Kconfig
> > > +++ b/kernel/trace/Kconfig
> > > @@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
> > >   	help
> > >   	  C version of recordmcount available?
> > > +config HAVE_BUILDTIME_MCOUNT_SORT
> > > +       bool
> > > +       help
> > > +         An architecture selects this if it sorts the mcount_loc section
> > > +	 at build time.
> > > +
> > >   config BUILDTIME_MCOUNT_SORT
> > >          bool
> > >          default y
> > > -       depends on BUILDTIME_TABLE_SORT && !S390
> > > +       depends on HAVE_BUILDTIME_MCOUNT_SORT
> > >          help
> > >            Sort the mcount_loc section at build time.
> > 
> > LGTM. This will no longer destroy ftrace on other architectures.
> > Those arches that we are not sure about can test and enable this function by
> > themselves.
> > 
> > 
> > Best regards
> > --yinan
> > 
