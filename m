Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4349757206
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:55:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fg8cGryI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4k8T5M0Qz3c0T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:55:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fg8cGryI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4k7b1gLSz2y1h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:54:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689648869;
	bh=VUBhKbYdbAVOLMnxuW+b/oEXRReg3ZgXfEO8D47/BnI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fg8cGryIKnITB9nhW1YRf5HhzPxGCpMzUsWCY48wnPeTBFYlpFzUH384d92MoXlXk
	 CBf5/ZvPsJWLXPOewu5tSVDETYrcqZXU4ph9fqva0tcDoHhW7pE14+yZWDxwAlwWPx
	 7KcL4g3GbNmg1mc/+o6CLorlN+3jS/wUxCJxKsyZuUOA9xRuNYz9+i4GZEzaUH6Tw0
	 w+5El9i5GRHYuLEA+45kd7GuyMkAEAso6jKjhJaJ14JTNR9ndzmnLMJHOtwbmovKW1
	 EqxOn5o1uLOjVjN+qm5BiRteN4AeZPtQG7FC54/sb2glhXK3cOtBylR1eYcsOXK8rw
	 ybjPdNNT2HHyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R4k7T2Nkkz4wZJ;
	Tue, 18 Jul 2023 12:54:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/64s/radix: combine final TLB flush and lazy
 tlb mm shootdown IPIs
In-Reply-To: <20230524060821.148015-5-npiggin@gmail.com>
References: <20230524060821.148015-1-npiggin@gmail.com>
 <20230524060821.148015-5-npiggin@gmail.com>
Date: Tue, 18 Jul 2023 12:54:23 +1000
Message-ID: <877cqyj5eo.fsf@mail.lhotse>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This performs lazy tlb mm shootdown when doing the exit TLB flush when
> all mm users go away and user mappings are removed, which avoids having
> to do the lazy tlb mm shootdown IPIs on the final mmput when all kernel
> references disappear.
>
> powerpc/64s uses a broadcast TLBIE for the exit TLB flush if remote CPUs
> need to be invalidated (unless TLBIE is disabled), so this doesn't
> necessarily save IPIs but it does avoid a broadcast TLBIE which is quite
> expensive.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

This gives me:

[    1.438910][    T1] Run /init as init process
[    1.442759][   T96] ------------[ cut here ]------------
[    1.442836][   T96] WARNING: CPU: 0 PID: 96 at kernel/smp.c:748 smp_call_function_many_cond+0xe0/0xad0
[    1.442920][   T96] Modules linked in:
[    1.442960][   T96] CPU: 0 PID: 96 Comm: init Not tainted 6.5.0-rc2-g1954d181ea09 #168
[    1.443028][   T96] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,git-6b6c16 hv:linux,kvm pSeries
[    1.443126][   T96] NIP:  c0000000002aab20 LR: c0000000000a5fc4 CTR: 0000000000000000
[    1.443199][   T96] REGS: c00000000c36f5b0 TRAP: 0700   Not tainted  (6.5.0-rc2-g1954d181ea09)
[    1.443280][   T96] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44008244  XER: 20040000
[    1.443382][   T96] CFAR: c0000000002ab524 IRQMASK: 0
[    1.443382][   T96] GPR00: c0000000000a5fc4 c00000000c36f850 c0000000017f9000 c00000000617c580
[    1.443382][   T96] GPR04: c0000000000a55b0 c00000000617bd00 0000000000000001 0000000000000001
[    1.443382][   T96] GPR08: c0000000029fc88c c00000000c25aa00 0000000000000000 0000000044008244
[    1.443382][   T96] GPR12: 00000000fd780000 c0000000036c0000 0000000000000000 c000000004042a00
[    1.443382][   T96] GPR16: 0000000000000001 0000000000000000 0000000000000000 0000000000000000
[    1.443382][   T96] GPR20: ffffffffffffffff c0000000000a5fc4 0000000000000000 c0000000029f85d0
[    1.443382][   T96] GPR24: c00000000c25b518 0000000000000000 c00000000617be60 c00000000617bd00
[    1.443382][   T96] GPR28: c00000000617c580 c0000000000a55b0 0000000000000000 0000000000000000
[    1.443994][   T96] NIP [c0000000002aab20] smp_call_function_many_cond+0xe0/0xad0
[    1.444069][   T96] LR [c0000000000a5fc4] radix__tlb_flush+0xf4/0x190
[    1.444133][   T96] Call Trace:
[    1.444172][   T96] [c00000000c36f850] [ffffffffffffffff] 0xffffffffffffffff (unreliable)
[    1.444250][   T96] [c00000000c36f920] [c0000000029f7fe0] __cpu_possible_mask+0x0/0x100
[    1.444326][   T96] [c00000000c36f950] [c0000000004f346c] tlb_finish_mmu+0x16c/0x220
[    1.444402][   T96] [c00000000c36f980] [c0000000004ee894] exit_mmap+0x1b4/0x580
[    1.444474][   T96] [c00000000c36faa0] [c00000000014c140] __mmput+0x60/0x1c0
[    1.444546][   T96] [c00000000c36fae0] [c0000000005cf014] begin_new_exec+0x5d4/0xec0
[    1.444622][   T96] [c00000000c36fb60] [c00000000066c6e8] load_elf_binary+0x4a8/0x1cf0
[    1.444697][   T96] [c00000000c36fc60] [c0000000005cc410] bprm_execve+0x3b0/0xa60
[    1.444773][   T96] [c00000000c36fd30] [c0000000005ce3a0] do_execveat_common+0x1d0/0x300
[    1.444852][   T96] [c00000000c36fde0] [c0000000005ce524] sys_execve+0x54/0x70
[    1.444928][   T96] [c00000000c36fe10] [c000000000031c24] system_call_exception+0x134/0x360
[    1.445000][   T96] [c00000000c36fe50] [c00000000000d6a0] system_call_common+0x160/0x2c4
[    1.445070][   T96] --- interrupt: c00 at 0x7fffb664cc98
[    1.445119][   T96] NIP:  00007fffb664cc98 LR: 000000001004bcb0 CTR: 0000000000000000
[    1.445189][   T96] REGS: c00000000c36fe80 TRAP: 0c00   Not tainted  (6.5.0-rc2-g1954d181ea09)
[    1.445271][   T96] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22004842  XER: 00000000
[    1.445390][   T96] IRQMASK: 0
[    1.445390][   T96] GPR00: 000000000000000b 00007fffd9d11ec0 00007fffb6767300 000000002b3f06e8
[    1.445390][   T96] GPR04: 000000002b3f0780 000000002b3f07b0 0000000000000000 0000000000000000
[    1.445390][   T96] GPR08: 000000002b3f06e8 0000000000000000 0000000000000000 0000000000000000
[    1.445390][   T96] GPR12: 0000000000000000 00007fffb683a930 00000000100f0ff8 0000000000000000
[    1.445390][   T96] GPR16: 0000000000000000 00007fffd9d12020 000000002b3f0780 0000000000000000
[    1.445390][   T96] GPR20: 000000002b3f0778 000000002b3f1330 0000000000000000 00000000100c6cb0
[    1.445390][   T96] GPR24: 0000000000000000 0000000000000000 ffffffffffffffff ffffffffffffffff
[    1.445390][   T96] GPR28: 00000000100d34ae 00000000100c6cf8 000000002b3f0780 000000002b3f06e8
[    1.446042][   T96] NIP [00007fffb664cc98] 0x7fffb664cc98
[    1.446095][   T96] LR [000000001004bcb0] 0x1004bcb0
[    1.446147][   T96] --- interrupt: c00
[    1.446186][   T96] Code: 81490000 394a0001 91490000 e8ed0030 3d420097 394ae900 7cea382e 81490000 2c070000 394affff 91490000 41820044 <0fe00000> faa100e0 f8410018 f9c10040
[    1.446356][   T96] irq event stamp: 458
[    1.446395][   T96] hardirqs last  enabled at (457): [<c000000000568638>] __slab_free+0x228/0x560
[    1.446481][   T96] hardirqs last disabled at (458): [<c00000000002a6a0>] interrupt_enter_prepare+0x90/0x220
[    1.446577][   T96] softirqs last  enabled at (0): [<c00000000014f658>] copy_process+0x9f8/0x20b0
[    1.446661][   T96] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    1.446723][   T96] ---[ end trace 0000000000000000 ]---

Which is:

static void smp_call_function_many_cond(const struct cpumask *mask,
					smp_call_func_t func, void *info,
					unsigned int scf_flags,
					smp_cond_func_t cond_func)
{
	int cpu, last_cpu, this_cpu = smp_processor_id();
	struct call_function_data *cfd;
	bool wait = scf_flags & SCF_WAIT;
	int nr_cpus = 0;
	bool run_remote = false;
	bool run_local = false;

	lockdep_assert_preemption_disabled();

Called from exit_flush_lazy_tlbs().

cheers
