Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E407081AE64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 06:31:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Oa5KSD3Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwfDV2GNSz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 16:31:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Oa5KSD3Y;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwfCd4TBZz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 16:30:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703136637;
	bh=QsEezTyTCQAUD0AgLDF0nDizcojCyPlBF2hoxWCUFoI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Oa5KSD3YWmttjXMJMZyYBQzckJiE9z02FvPwL8yiPicQmsBTCuiqTdnGE2NUYOvO7
	 CCUrUKuc5xGhRE9n9G3i0/hmDMVBoKUSqPrAalQ/1I8BDR+UqTYQy0XUPwIUGS1yM6
	 IAAklqthqJPQGnCkHqC88vZFTSdmLeJj7dpzVG3oddcCyhYUcBVqPo5lzpRGU9khA3
	 bXseDMZUU+vFJA20ymXf2fhFo+C2ahHJhsVpzyw2taHHLzEXOnmkluzQgIc7TJiI/s
	 w4Dl92e6lZh1cYVKLq8ho0NLWx4ADf1e8nawHWzZYlf6swO1Rda6OBMrJAfflL2WTt
	 aJiIcd18zBsHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwfCd2MKGz4wbr;
	Thu, 21 Dec 2023 16:30:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Very unreliable booting (WARNING: CPU: 0 PID: 1 at
 kernel/context_tracking.c:215 ct_nmi_exit+0xa0/0xc0) with
  PPC_EARLY_DEBUG_G5 set on a PowerMac G5, kernel 6.7-rc6
In-Reply-To: <20231220232006.414f77a4@yea>
References: <20231220232006.414f77a4@yea>
Date: Thu, 21 Dec 2023 16:30:34 +1100
Message-ID: <87o7ekktqd.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> Greetings!
>
> I wanted to check whether there are any changes on issue
> https://lore.kernel.org/all/20231114003721.4a9bfd37@yea/T/ on kernel
> 6.7-rc. KCSAN enabled kernels still won't boot on this G5 it seems.
>
> What I also found out is that booting with an PPC_EARLY_DEBUG_G5=y
> enabled kernel is very unreliable. It works, but only on 1 ot 10
> attemps or so. On the failed attemps the G5 freezes on the white
> screen only showing 3 lines that the kernel will be booted, no
> additional output.
>
> On a successful boot with PPC_EARLY_DEBUG_G5=y the machine boots up
> fine, showing no side effects and is perfectly usable. In this case
> the dmesg throws up this:
>
> [...]
> PowerMac SMP probe found 2 cpus

Where are you seeing this output? Is that on the screen (VGA) or the
serial console? Or do you mean you see this in dmesg after the boot?

> KeyWest i2c @0xf8001003 irq 16 /u4@0,f8000000/i2c@f8001000
>  channel 1 bus i2c-bus@1
> KeyWest i2c @0x80018000 irq 27 /ht@0,f2000000/pci@8/mac-io@7/i2c@18000
>  channel 0 bus i2c-bus@0
>  channel 0 bus i2c-bus@0
> SMU i2c /smu@0,0/smu-i2c-control@0
>  channel b bus /smu@0,0/smu-i2c-control@0/i2c-bus@b
>  channel e bus /smu@0,0/smu-i2c-control@0/i2c-bus@e
> Processor timebase sync using platform function
> mpic: requesting IPIs...
> PPC970/FX/MP performance monitor hardware support registered
> rcu: Hierarchical SRCU implementation.
> rcu: 	Max phase no-delay instances is 1000.
> smp: Bringing up secondary CPUs ...
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at kernel/context_tracking.c:215 ct_nmi_exit+0xa0/0xc0
 
I think this is just warning because we haven't set the system up enough
yet. Though I'm just guessing on that.

> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6-PMacG5 #4
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c000000000bbf320 LR: c0000000000ab040 CTR: 0000000000000000
> REGS: c000000003103300 TRAP: 0700   Not tainted  (6.7.0-rc6-PMacG5)
> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24040840  XER: 20000000
> IRQMASK: 1 
> GPR00: c0000000000ab068 c0000000031035a0 c000000000e43500 0000000000000000 
> GPR04: c00000000fffbeb0 c00000000fffbeb8 0000000000000000 000000047ef66000 
> GPR08: c00000047fe059b0 c000000000e9f9b0 c000000000e9f9c0 0000000000000000 
> GPR12: c000000000149e10 c00000000110a000 c00000000000dc10 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 c00000000108b9c8 0000000000000008 
> GPR20: 000000000000005d 0000000000000000 0000000000000000 0000000000000001 
> GPR24: c0000000010d04c4 c00000000108b900 c0000000010d04c0 000000047ef66000 
> GPR28: c000000003103650 c000000000e9a400 000000000000006e c000000003170000 
> NIP [c000000000bbf320] ct_nmi_exit+0xa0/0xc0
> LR [c0000000000ab040] irq_exit+0x90/0x110
> Call Trace:
> [c0000000031035a0] [c0000000000ab068] irq_exit+0xb8/0x110 (unreliable)
> [c0000000031035d0] [c0000000000196f0] timer_interrupt+0x1b0/0x370
> [c000000003103620] [c0000000000089f4] decrementer_common_virt+0x214/0x220
> --- interrupt: 900 at real_readb+0x44/0x68
> NIP:  c00000000001f24c LR: c000000000074258 CTR: c0000000000087c0
> REGS: c000000003103650 TRAP: 0900   Not tainted  (6.7.0-rc6-PMacG5)
> MSR:  9000000000009022 <SF,HV,EE,ME,IR,RI>  CR: 24040242  XER: 20000000
> IRQMASK: 0 
> GPR00: 9000000000009022 c0000000031038f0 c000000000e43500 0000000000000071 
> GPR04: 0000000080013030 0000011000000040 0000001000000040 9000000000009032 
> GPR08: 0000000000000000 c0000000010d3500 000000047ef66000 0000000052454753 
> GPR12: 9000000000009032 c00000000110a000 c00000000000dc10 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 c00000000108b9c8 0000000000000008 
> GPR20: 000000000000005d 0000000000000000 0000000000000000 0000000000000001 
> GPR24: c0000000010d04c4 c00000000108b900 c0000000010d04c0 0000000000000001 
> GPR28: 000000007db14ba6 0000000000000000 000000000000006e c0000000010d3b18 
> NIP [c00000000001f24c] real_readb+0x44/0x68
> LR [c000000000074258] udbg_real_scc_putc+0x38/0x80

Looks like you were spinning waiting for the serial port to become
ready, long enough that a decrementer came in.

That seems kind of odd, but then the system managed to boot, so I guess
it resolved itself.

> --- interrupt: 900
> [c0000000031038f0] [c000000002611294] 0xc000000002611294 (unreliable)
> [c000000003103920] [c0000000000743c0] udbg_adb_putc+0x30/0x50
> [c000000003103940] [c00000000001e7d4] udbg_puts+0x64/0xb0
> [c000000003103970] [c000000000e46124] udbg_progress+0x18/0x30
> [c000000003103990] [c000000000075a20] smp_core99_kick_cpu+0x140/0x180
> [c000000003103a10] [c00000000003371c] __cpu_up+0x12c/0x3c0
> [c000000003103ad0] [c0000000000a3068] bringup_cpu+0x68/0x200
> [c000000003103b30] [c0000000000a1bd0] cpuhp_invoke_callback+0x170/0x300
> [c000000003103b80] [c0000000000a4598] _cpu_up.constprop.0+0x308/0x730
> [c000000003103c10] [c0000000000a4aec] cpu_up+0x12c/0x180
> [c000000003103ca0] [c000000000e5371c] bringup_nonboot_cpus+0x7c/0xec
> [c000000003103cf0] [c000000000e5a30c] smp_init+0x40/0xa4
> [c000000003103d50] [c000000000e41300] kernel_init_freeable+0x188/0x358
> [c000000003103de0] [c00000000000dc38] kernel_init+0x30/0x158
> [c000000003103e50] [c00000000000bf94] ret_from_kernel_user_thread+0x14/0x1c
> --- interrupt: 0 at 0x0
> Code: 39200000 38600004 f9280010 4bfffd4d e92d0128 38210020 81290000 e8010010 7c0803a6 4e800020 60000000 60000000 <0fe00000> 4bffff9c 60000000 60000000 
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0xc0/0xd0
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.7.0-rc6-PMacG5 #4
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c000000000bbf260 LR: c000000000bbf594 CTR: c0000000001541a0
> REGS: c00000000107fb70 TRAP: 0700   Tainted: G        W           (6.7.0-rc6-PMacG5)
> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 48000284  XER: 00000000
> IRQMASK: 1 
> GPR00: c0000000000feb2c c00000000107fe10 c000000000e43500 0000000000000000 
> GPR04: c00000047fe04f50 00000000ffffffff 0000000196e6aa55 c00000000110a000 
> GPR08: c000000000e9f9b0 c000000000e9f9b0 ffffffffffffffe8 0000000000002200 
> GPR12: c0000000001541a0 c00000000110a000 000000000014aa88 0000000000000000 
> GPR16: 00000000ff9aac70 0000000002117cd8 0000000002118040 0000000002117da0 
> GPR20: 00000000021182d0 00000000021a5b08 00000000021182f8 00000000024b3500 
> GPR24: 00000000024b3500 c000000000d4bd78 c00000000108ba88 0000000000000001 
> GPR28: c000000001062b00 c000000001062a80 c00000000108ba38 c00000047fe059b0 
> NIP [c000000000bbf260] ct_kernel_exit.constprop.0+0xc0/0xd0
> LR [c000000000bbf594] default_idle_call+0x44/0x74
> Call Trace:
> [c00000000107fe10] [c00000000107fe60] 0xc00000000107fe60 (unreliable)
> [c00000000107fe40] [c00000000108ba38] 0xc00000000108ba38
> [c00000000107fe60] [c0000000000feb2c] do_idle+0x10c/0x1d0
> [c00000000107feb0] [c0000000000fee54] cpu_startup_entry+0x44/0x50
> [c00000000107fee0] [c00000000000dc04] rest_init+0xe4/0xe8
> [c00000000107ff10] [c000000000e4094c] arch_post_acpi_subsys_init+0x0/0x4
> [c00000000107ff30] [c000000000e410e0] start_kernel+0x780/0x784
> [c00000000107ffe0] [c00000000000cb18] start_here_common+0x1c/0x20
> Code: 4b579829 60000000 fbdf0008 38600005 e8010040 38210030 ebc1fff0 ebe1fff8 7c0803a6 4bfffdf4 60000000 60000000 <0fe00000> 4bffff7c 60000000 60000000 
> ---[ end trace 0000000000000000 ]---
> smp: Brought up 1 node, 2 CPUs
>
>
> Looks like SMP or cpu bringup is messing around with early G5 debug
> console. Hopefully this output is of some help to get insight what the
> problem may be.

I don't see any obvious clues to why it's booting sometimes and not
others. Maybe when it doesn't boot it's getting stuck forever in that
real_readb() loop? We could try adding a maximum retry count, eg
something like:

diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c b/arch/powerpc/platforms/powermac/udbg_scc.c
index 1b7c39e841ee..b28c9a729fbf 100644
--- a/arch/powerpc/platforms/powermac/udbg_scc.c
+++ b/arch/powerpc/platforms/powermac/udbg_scc.c
@@ -165,8 +165,11 @@ void __init udbg_scc_init(int force_scc)
 #ifdef CONFIG_PPC64
 static void udbg_real_scc_putc(char c)
 {
-	while ((real_readb(sccc) & SCC_TXRDY) == 0)
-		;
+	int i = 0;
+	
+	while (((real_readb(sccc) & SCC_TXRDY) == 0) && i < 10000)
+		i++;
+
 	real_writeb(c, sccd);
 	if (c == '\n')
 		udbg_real_scc_putc('\r');


But that's just a total stab in the dark :)

cheers
