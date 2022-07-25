Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7657FA92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 09:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrsm61CTkz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YeOdbcpb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrslT1nrTz305M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 17:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YeOdbcpb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LrslR0DBfz4x1m;
	Mon, 25 Jul 2022 17:54:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658735701;
	bh=kfMv139CeGprLEOUlo0T6IDnCb2WFfwtwCE1JhOhq1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YeOdbcpbhGuVhZFMiOzh00EVlLpZH55kzPtMe3tBwlEnUdmgbkYgP/PzPAuEdZa8F
	 afbTbjlyjZwWyCq1NhYgk7i42OYzki1l7MYRi2HxtPS3budKyWuVwrMAjnEupXQieV
	 QjwBnrGhgxEV/RoBGc6uZPRTfCYFKJA0aCM5qV9jtIqgtiWNTzqu11wujigFUI7xtL
	 iTuNZm0NAOcUh0dvhnmZwYDyKNcffgeUE5xX8yWD/iKSQuSBT82QgGY69AGs9b1p8d
	 NJWGDi/UtvJC18YAprwtvns44Hmrz1s4wJgSc0EWbQajLIEWhZmeHzUtuDGFjURU7Y
	 Dzg7JumpG4mQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: zhouzhouyi@gmail.com, john.ogness@linutronix.de,
 benh@kernel.crashing.org, paulus@samba.org, akpm@linux-foundation.org,
 christophe.leroy@csgroup.eu, wangkefeng.wang@huawei.com,
 npiggin@gmail.com, rppt@kernel.org, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lance@osuosl.org, paulmck@kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH linux-next] powerpc: init jump label early in ppc 64
In-Reply-To: <20220724010221.17371-1-zhouzhouyi@gmail.com>
References: <20220724010221.17371-1-zhouzhouyi@gmail.com>
Date: Mon, 25 Jul 2022 17:54:55 +1000
Message-ID: <878rohd3u8.fsf@mpe.ellerman.id.au>
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

zhouzhouyi@gmail.com writes:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> In ppc 64, invoke jump_label_init in setup_feature_keys is too late
> because static key will be used in subroutine of early_init_devtree.
>
> So we can invoke jump_label_init earlier in early_setup.
> We can not move setup_feature_keys backward because its subroutine
> cpu_feature_keys_init depend on data structures initialized in
> early_init_devtree.
>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Dear PPC developers
>
> I found this bug when trying to do rcutorture tests in ppc VM of
> Open Source Lab of Oregon State University.
>
> qemu-system-ppc64 -nographic -smp cores=8,threads=1 -net none -M pseries -nodefaults -device spapr-vscsi -serial file:/home/ubuntu/linux-next/tools/testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-rcutorture/TREE03/console.log -m 512 -kernel /home/ubuntu/linux-next/tools/testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-rcutorture/TREE03/vmlinux -append "debug_boot_weak_hash panic=-1 console=ttyS0 rcupdate.rcu_cpu_stall_suppress_at_boot=1 torture.disable_onoff_at_boot rcupdate.rcu_task_stall_timeout=30000 rcutorture.onoff_interval=200 rcutorture.onoff_holdoff=30 rcutree.gp_preinit_delay=12 rcutree.gp_init_delay=3 rcutree.gp_cleanup_delay=3 rcutree.kthread_prio=2 threadirqs tree.use_softirq=0 rcutorture.n_barrier_cbs=4 rcutorture.stat_interval=15 rcutorture.shutdown_secs=420 rcutorture.test_no_idle_hz=1 rcutorture.verbose=1"
>
> console.log report following WARN:
> [    0.000000][    T0] static_key_enable_cpuslocked(): static key '0xc000000002953260' used before call to jump_label_init()^M
> [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:166 static_key_enable_cpuslocked+0xfc/0x120^M
> [    0.000000][    T0] Modules linked in:^M
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc5-next-20220708-dirty #131^M
> [    0.000000][    T0] NIP:  c00000000038068c LR: c000000000380688 CTR: c000000000186ac0^M
> [    0.000000][    T0] REGS: c000000002867930 TRAP: 0700   Not tainted  (5.19.0-rc5-next-20220708-dirty)^M
> [    0.000000][    T0] MSR:  8000000000022003 <SF,FP,RI,LE>  CR: 24282224  XER: 20040000^M
> [    0.000000][    T0] CFAR: 0000000000000730 IRQMASK: 1 ^M
> [    0.000000][    T0] GPR00: c000000000380688 c000000002867bd0 c000000002868d00 0000000000000065 ^M
> [    0.000000][    T0] GPR04: 0000000000000001 0000000000000000 0000000000000080 000000000000000d ^M
> [    0.000000][    T0] GPR08: 0000000000000000 0000000000000000 c0000000027fd000 000000000000000f ^M
> [    0.000000][    T0] GPR12: c000000000186ac0 c000000002082280 0000000000000003 000000000000000d ^M
> [    0.000000][    T0] GPR16: 0000000002cc00d0 0000000000000000 c000000002082280 0000000000000001 ^M
> [    0.000000][    T0] GPR20: c000000002080942 0000000000000000 0000000000000000 0000000000000000 ^M
> [    0.000000][    T0] GPR24: 0000000000000000 c0000000010d6168 0000000000000000 c0000000020034c8 ^M
> [    0.000000][    T0] GPR28: 0000002800000000 0000000000000000 c000000002080942 c000000002953260 ^M
> [    0.000000][    T0] NIP [c00000000038068c] static_key_enable_cpuslocked+0xfc/0x120^M
> [    0.000000][    T0] LR [c000000000380688] static_key_enable_cpuslocked+0xf8/0x120^M
> [    0.000000][    T0] Call Trace:^M
> [    0.000000][    T0] [c000000002867bd0] [c000000000380688] static_key_enable_cpuslocked+0xf8/0x120 (unreliable)^M
> [    0.000000][    T0] [c000000002867c40] [c000000000380810] static_key_enable+0x30/0x50^M
> [    0.000000][    T0] [c000000002867c70] [c000000002030314] setup_forced_irqthreads+0x28/0x40^M
> [    0.000000][    T0] [c000000002867c90] [c000000002003568] do_early_param+0xa0/0x108^M
> [    0.000000][    T0] [c000000002867d10] [c000000000175340] parse_args+0x290/0x4e0^M
> [    0.000000][    T0] [c000000002867e10] [c000000002003c74] parse_early_options+0x48/0x5c^M
> [    0.000000][    T0] [c000000002867e30] [c000000002003ce0] parse_early_param+0x58/0x84^M
> [    0.000000][    T0] [c000000002867e60] [c000000002009878] early_init_devtree+0xd4/0x518^M
> [    0.000000][    T0] [c000000002867f10] [c00000000200aee0] early_setup+0xb4/0x214^M
>
> After this fix, the WARN does not show again.

Hi Zhouyi,

We have hit something like this previously, see the stack trace in
commit e7eb919057c3 ("powerpc/64s: Handle program checks in wrong endian
during early boot").

That was fixed incidentally/accidentally by the page_poison code
changing to not use static keys so early.

There was a similar case recently in the random code too, see
60e5b2886b92 ("random: do not use jump labels before they are
initialized").

But I guess this will keep happening, as generic code authors expect to
be able to use static keys in early_param() handlers.

I think the ideal solution would be to move most early param parsing
later. There's only a few parameters that need to be parsed that early
in early_init_devtree(). That would be a complex and error-prone change
though, so I won't ask you to do that :)

But I think it would be better if you moved the call to
jump_label_init() into early_init_devtree(), just before we call
parse_early_param(), with a comment saying that it's required to call it
before parsing early params.

And ...

> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 2b2d0b0fbb30..bf2fb76221da 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -365,6 +365,9 @@ void __init early_setup(unsigned long dt_ptr)
>  
>  	udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
>  
> +	/* Initialise jump label because subsequent calls need it */
> +	jump_label_init();
> +
>  	/*
>  	 * Do early initialization using the flattened device
>  	 * tree, such as retrieving the physical memory map or
> @@ -394,8 +397,15 @@ void __init early_setup(unsigned long dt_ptr)
>  
>  	/* Apply all the dynamic patching */
>  	apply_feature_fixups();
> -	setup_feature_keys();

I think you can just leave this as-is, it's fine to call
jump_label_init() more than once.

> +
> +	/*
> +	 * All the cpu/mmu_has_feature() checks take on their correct polarity
> +	 * based on the current set of CPU/MMU features. These should be done
> +	 * only after early_init_devtree.
> +	 */
> +	cpu_feature_keys_init();
> +	mmu_feature_keys_init();
> +
>  
>  	/* Initialize the hash table or TLB handling */
>  	early_init_mmu();
> -- 
> 2.25.1

cheers
