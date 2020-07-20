Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB2225596
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 03:48:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B94PV0zjVzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 11:48:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B94M423mrzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 11:46:07 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 054172A113;
 Sun, 19 Jul 2020 21:45:59 -0400 (EDT)
Date: Mon, 20 Jul 2020 11:46:01 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 13/16] scripts/kallsyms: move ignored symbol types to
 is_ignored_symbol()
In-Reply-To: <20191123160444.11251-14-yamada.masahiro@socionext.com>
Message-ID: <alpine.LNX.2.23.453.2007201132240.8@nippy.intranet>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
 <20191123160444.11251-14-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 24 Nov 2019, Masahiro Yamada wrote:

> Collect the ignored patterns to is_ignored_symbol().
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This commit (887df76de67f5) caused a regression in my powerpc builds as it 
causes symbol names to disappear from backtraces:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/smp.c:433 _einittext+0x3f9e5120/0x3feb71b8
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.0-rc7-pmac-00055-g887df76de67f5 #18
NIP:  c00aef68 LR: c00af114 CTR: c001272c
REGS: c0705c40 TRAP: 0700   Not tainted  (5.4.0-rc7-pmac-00055-g887df76de67f5)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42000044  XER: 00000000

GPR00: 001f0100 c0705cf8 c06dc300 c070af1c c001258c 00000000 00000000 ef7fb5bc 
GPR08: 08800000 00000100 00000001 00000100 42000044 00000000 c0709040 00000004 
GPR16: 00000001 c06022b4 c058297c 00200002 ffff8cb9 00000000 c06d84a0 c0710000 
GPR24: c0710000 00000000 00000000 c070af1c c070af1c 00000000 c001258c 00000000 
NIP [c00aef68] _einittext+0x3f9e5120/0x3feb71b8
LR [c00af114] _einittext+0x3f9e52cc/0x3feb71b8
Call Trace:
[c0705cf8] [ef006320] 0xef006320 (unreliable)
[c0705d38] [c00af114] _einittext+0x3f9e52cc/0x3feb71b8
[c0705d48] [c00af158] _einittext+0x3f9e5310/0x3feb71b8
[c0705d68] [c0012768] _einittext+0x3f948920/0x3feb71b8
[c0705d78] [c0092c04] _einittext+0x3f9c8dbc/0x3feb71b8
[c0705d88] [c0092d18] _einittext+0x3f9c8ed0/0x3feb71b8
[c0705da8] [c0093a2c] _einittext+0x3f9c9be4/0x3feb71b8
[c0705de8] [c0580224] _einittext+0x3feb63dc/0x3feb71b8
[c0705e48] [c00382ec] _einittext+0x3f96e4a4/0x3feb71b8
[c0705e58] [c000d2a0] _einittext+0x3f943458/0x3feb71b8
[c0705e88] [c001353c] _einittext+0x3f9496f4/0x3feb71b8
--- interrupt: 901 at _einittext+0x3f941058/0x3feb71b8
    LR = _einittext+0x3f941058/0x3feb71b8
[c0705f50] [c06cc214] 0xc06cc214 (unreliable)
[c0705f60] [c057fa20] _einittext+0x3feb5bd8/0x3feb71b8
[c0705f70] [c005de48] _einittext+0x3f994000/0x3feb71b8
[c0705f90] [c005e050] _einittext+0x3f994208/0x3feb71b8
[c0705fa0] [c0004cc8] _einittext+0x3f93ae80/0x3feb71b8
[c0705fb0] [c069a36c] _einittext+0x3ffd0524/0x40000000
[c0705ff0] [00003500] 0x3500
Instruction dump:
7c0803a6 7fa5eb78 7d808120 7ea6ab78 baa10014 38210040 4bfffbb0 7f64db78 
7f85e378 484b31b1 7c601b78 4bfffdf4 <0fe00000> 4bfffd60 9421ffe0 7c0802a6 
---[ end trace a06fef4788747c72 ]---


Prior to that (e.g. 97261e1e2240f), I get backtraces like this:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/smp.c:433 smp_call_function_many+0x318/0x320
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.0-rc7-pmac-00054-g97261e1e2240f #20
NIP:  c00aef68 LR: c00af114 CTR: c001272c
REGS: c075dc40 TRAP: 0700   Not tainted  (5.4.0-rc7-pmac-00054-g97261e1e2240f)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42000044  XER: 00000000

GPR00: 001f0100 c075dcf8 c0733300 c0762f1c c001258c 00000000 00000000 ef7fb5bc 
GPR08: 04800000 00000100 00000001 00000100 42000044 00000000 c0761040 00000004 
GPR16: 00000001 c0658e58 c058297c 00200002 ffff8cb9 00000000 c072f4a0 c0760000 
GPR24: c0760000 00000000 00000000 c0762f1c c0762f1c 00000000 c001258c 00000000 
NIP [c00aef68] smp_call_function_many+0x318/0x320
LR [c00af114] smp_call_function+0x34/0x44
Call Trace:
[c075dcf8] [ef006320] 0xef006320 (unreliable)
[c075dd38] [c00af114] smp_call_function+0x34/0x44
[c075dd48] [c00af158] on_each_cpu+0x1c/0x4c
[c075dd68] [c0012768] tau_timeout_smp+0x3c/0x4c
[c075dd78] [c0092c04] call_timer_fn.isra.26+0x20/0x84
[c075dd88] [c0092d18] expire_timers+0xb0/0xc0
[c075dda8] [c0093a2c] run_timer_softirq+0xa4/0x1a4
[c075dde8] [c0580224] __do_softirq+0x11c/0x280
[c075de48] [c00382ec] irq_exit+0xc0/0xd4
[c075de58] [c000d2a0] timer_interrupt+0x154/0x260
[c075de88] [c001353c] ret_from_except+0x0/0x14
--- interrupt: 901 at arch_cpu_idle+0x24/0x78
    LR = arch_cpu_idle+0x24/0x78
[c075df50] [c0723214] 0xc0723214 (unreliable)
[c075df60] [c057fa20] default_idle_call+0x38/0x58
[c075df70] [c005de48] do_idle+0xd4/0x17c
[c075df90] [c005e054] cpu_startup_entry+0x24/0x28
[c075dfa0] [c0004cc8] rest_init+0xa8/0xbc
[c075dfb0] [c06f136c] start_kernel+0x40c/0x420
[c075dff0] [00003500] 0x3500
Instruction dump:
7c0803a6 7fa5eb78 7d808120 7ea6ab78 baa10014 38210040 4bfffbb0 7f64db78 
7f85e378 484b31b1 7c601b78 4bfffdf4 <0fe00000> 4bfffd60 9421ffe0 7c0802a6 
---[ end trace 784c7f15ecd23941 ]---

Has anyone else observed these problems (either the WARNING from 
smp_call_function_many() or the missing symbol names)?

What is the best way to fix this? Should I upgrade binutils?
