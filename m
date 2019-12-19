Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F57126291
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 13:48:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dsB31JWVzDqs6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 23:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ds6k3mY9zDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 23:45:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="eTbQtcgw"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47ds6f6H0Yz9sPc;
 Thu, 19 Dec 2019 23:45:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576759533;
 bh=jqSSNZ2x3Ae7SanGxA7yrVCJmusexd2AG8aWU/XIPV0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eTbQtcgwPKDQEVhT4uxaN3HBQoaHb4cEklMvNiUm6jH1ARNC1K8wAz1RZt0gLO+Qu
 0KIqGMgD7O0IUxZLT952XO9ci2vye+ZkmL5wBLkvWSbg8MGxcH5CPSBcXU+/tmTKDo
 qVKsyvC34jYdcZrH2RWEm7OR7E1S3fSEcFc13Ab3uKBVOIoxHKR2gG8gJyyFfU6Hty
 +HngKO2OEg9Znmlfs8hIjlSl2FffwVUuklQ7VaHJ2lcYVoXa1qf5lmoswEcbxEsSFW
 0z9hlq+1lgn1RMHKq8Bex93DHL5QWPOIMFUmRIq9X2V7bRkRilrEmk9xzI3ERAPmfM
 czBPmygP3POlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
In-Reply-To: <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
References: <20190327123615.rwhk6h3ayfurvapf@linutronix.de>
 <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com> <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir> <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
Date: Thu, 19 Dec 2019 23:45:26 +1100
Message-ID: <871rt0mql5.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, tglx@linutronix.de,
 David? Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> Hi folks,
>
> I'm actually still experiencing this sporadically in the WireGuard test 
> suite, which you can see being run on https://build.wireguard.com/ . 

Fancy dashboard you got there :)

> About 50% of the time the powerpc64 build will fail at a place like this:
>
> [   65.147823] Oops: Exception in kernel mode, sig: 4 [#1]
> [   65.149198] LE PAGE_SIZE=4K MMU=Hash PREEMPT SMP NR_CPUS=4 NUMA pSeries
> [   65.149595] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.5.0-rc1+ #1
> [   65.149745] NIP:  c000000000033330 LR: c00000000007eda0 CTR: c00000000007ed80
> [   65.149934] REGS: c000000000a47970 TRAP: 0700   Not tainted  (5.5.0-rc1+)
> [   65.150032] MSR:  800000000288b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> > CR: 48008288  XER: 00000000
> [   65.150352] CFAR: c0000000000332bc IRQMASK: 1
> [   65.150352] GPR00: c000000000036508 c000000000a47c00 c000000000a4c100 0000000000000001
> [   65.150352] GPR04: c000000000a50998 0000000000000000 c000000000a50908 000000000f509000
> [   65.150352] GPR08: 0000000028000000 0000000000000000 0000000000000000 c00000000ff24f00
> [   65.150352] GPR12: c00000000007ed80 c000000000ad9000 0000000000000000 0000000000000000
> [   65.150352] GPR16: 00000000008c9190 00000000008c94a8 00000000008c92f8 00000000008c98b0
> [   65.150352] GPR20: 00000000008f2f88 fffffffffffffffd 0000000000000014 0000000000e6c100
> [   65.150352] GPR24: 0000000000e6c100 0000000000000001 0000000000000000 c000000000a50998
> [   65.150352] GPR28: c000000000a9e280 c000000000a50aa4 0000000000000002 0000000000000000
> [   65.151591] NIP [c000000000033330] doorbell_try_core_ipi+0xd0/0xf0
> [   65.151750] LR [c00000000007eda0] smp_pseries_cause_ipi+0x20/0x70
> [   65.151913] Call Trace:
> [   65.152109] [c000000000a47c00] [c0000000000c7c9c] _nohz_idle_balance+0xbc/0x300 (unreliable)
> [   65.152370] [c000000000a47c30] [c000000000036508] smp_send_reschedule+0x98/0xb0
> [   65.152711] [c000000000a47c50] [c0000000000c1634] kick_ilb+0x114/0x140
> [   65.152962] [c000000000a47ca0] [c0000000000c86d8] newidle_balance+0x4e8/0x500
> [   65.153213] [c000000000a47d20] [c0000000000c8788] pick_next_task_fair+0x48/0x3a0
> [   65.153424] [c000000000a47d80] [c000000000466620] __schedule+0xf0/0x430
> [   65.153612] [c000000000a47de0] [c000000000466b04] schedule_idle+0x34/0x70
> [   65.153786] [c000000000a47e10] [c0000000000c0bc8] do_idle+0x1a8/0x220
> [   65.154121] [c000000000a47e70] [c0000000000c0e94] cpu_startup_entry+0x34/0x40
> [   65.154313] [c000000000a47ea0] [c00000000000ef1c] rest_init+0x10c/0x124
> [   65.154414] [c000000000a47ee0] [c000000000500004] start_kernel+0x568/0x594
> [   65.154585] [c000000000a47f90] [c00000000000a7cc] start_here_common+0x1c/0x330
> [   65.154854] Instruction dump:
> [   65.155191] 38210030 e8010010 7c0803a6 4e800020 3d220004 39295228 81290000 3929ffff
> [   65.155498] 7d284038 7c0004ac 5508017e 65082800 <7c00411c> e94d0178 812a0000 3929ffff
                                                      ^
Again the faulting instruction there is "msgsndp r8"

> [   65.156155] ---[ end trace 6180d12e268ffdaf ]---
> [   65.185452]
> [   66.187490] Kernel panic - not syncing: Fatal exception
>
> This is with "qemu-system-ppc64 -smp 4 -machine pseries" on QEMU 4.0.0.
>
> I'm not totally sure what's going on here. I'm emulating a pseries, and 
> using that with qemu's pseries model, and I see that selecting the 
> pseries forces the selection of 'config PPC_DOORBELL' (twice in the same 
> section, actually).

Noted.

> Then inside the kernel there appears to be some runtime CPU check for
> doorbell support.

Not really. The kernel looks at the CPU revision (PVR) and decides that
it has doorbell support.

> Is this a case in which QEMU is advertising doorbell support that TCG
> doesn't have? Or is something else happening here?

It's a gap in the emulation I guess. qemu doesn't emulate msgsndp, but
it really should because that's a supported instruction since Power8.

I suspect msgsndp wasn't implemented for TCG because TCG doesn't support
more than one thread per core, and you can only send doorbells to other
threads in the same core, and therefore there is no reason to ever use
msgsndp.

That's the message Suraj mentioned up thread, eg:

  $ qemu-system-ppc64 -nographic -vga none -M pseries -smp 2,threads=2 -cpu POWER8 -kernel build~/vmlinux
  qemu-system-ppc64: TCG cannot support more than 1 thread/core on a pseries machine


But I guess we've hit another case of a CPU sending itself an IPI, and
the way the sibling masks are done, CPUs are siblings of themselves, so
the sibling test passes, eg:

int doorbell_try_core_ipi(int cpu)
{
	int this_cpu = get_cpu();
	int ret = 0;

	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
		doorbell_core_ipi(cpu);



In which case this patch should fix it.

diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index f17ff1200eaa..e45cb9bba193 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -63,7 +63,7 @@ int doorbell_try_core_ipi(int cpu)
 	int this_cpu = get_cpu();
 	int ret = 0;
 
-	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
+	if (cpu != this_cpu && cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
 		doorbell_core_ipi(cpu);
 		ret = 1;
 	}


The other option would be we disable CPU_FTR_DBELL if we detect we're
running under TCG. But I'm not sure we have a particularly clean way to
detect that.

cheers
