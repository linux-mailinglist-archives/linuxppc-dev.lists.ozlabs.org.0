Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC4780645
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 09:23:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YQPZTf1I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRtd72Bltz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YQPZTf1I;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRtcG4tyWz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 17:22:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692343342;
	bh=015QYjFFLOXVXqRjbnXpZsuq4KN9W6ebQx2wJB1AJjI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YQPZTf1I3ODYtn+csq5jA+m4hjJ3hn4w2DO9X9KZ2Voxv6H9krgTgSalO9pTBTUlD
	 JEqlNb1GDD+G+mMWuJzAc0WxSdx/g3lD1LQWaKovXqDCPhPhy3qVmYxBpOefYuvIId
	 +wELr9jYwa93bd9QCFq67p3krFUt0pZXd6UyFuv7/EAhQSuefvxgVU2MWWTUwxIW6H
	 /oafolFeXTJb8+0R5zkAZOxiU0s5J7tqG+LiEthv0weKlSnurbh/sTDD9XWsUzZyoR
	 jHtw2Ki6p/g/3EcDlpp0T0iUS9DhWZfb5MzB5y1Bzr87mfhT7YTo1tSbGIhyQpvBuE
	 2FLVPxv46/TgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRtcG3s95z4wZx;
	Fri, 18 Aug 2023 17:22:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/4] powerpc: Add mm_cpumask warning when context switching
In-Reply-To: <20230524060821.148015-4-npiggin@gmail.com>
References: <20230524060821.148015-1-npiggin@gmail.com>
 <20230524060821.148015-4-npiggin@gmail.com>
Date: Fri, 18 Aug 2023 17:22:19 +1000
Message-ID: <878ra8x1as.fsf@mail.lhotse>
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
> When context switching away from an mm, add a CONFIG_DEBUG_VM warning
> check to ensure this CPU is still set in the mask. This could catch
> bugs where the mask is improperly trimmed while the CPU is still using
> the mm.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/mm/mmu_context.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
> index 894468975a44..b24c19078eb1 100644
> --- a/arch/powerpc/mm/mmu_context.c
> +++ b/arch/powerpc/mm/mmu_context.c
> @@ -101,6 +102,8 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
>  	 * sub architectures. Out of line for now
>  	 */
>  	switch_mmu_context(prev, next, tsk);
> +
> +	VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu, mm_cpumask(prev)));

This is popping during CPU hotunplug. I guess some confusion about when
the mask is cleared.

cheers


[  145.150374][    T0] ------------[ cut here ]------------
[  145.150459][    T0] WARNING: CPU: 5 PID: 0 at arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x320/0x340
[  145.150519][    T0] Modules linked in: bonding pseries_rng rng_core binfmt_misc aes_gcm_p10_crypto zram vmx_crypto gf128mul crc32c_vpmsum papr_scm ip6_tables ip_tables x_tables fuse autofs4
[  145.150588][    T0] CPU: 5 PID: 0 Comm: swapper/5 Not tainted 6.5.0-rc3-00084-g01477eb5e323 #47
[  145.150592][    T0] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00 (NH1030_019) hv:phyp pSeries
[  145.150595][    T0] NIP:  c0000000000cbc30 LR: c0000000000cbab0 CTR: c000000000181a40
[  145.150598][    T0] REGS: c00000000985fb10 TRAP: 0700   Not tainted  (6.5.0-rc3-00084-g01477eb5e323)
[  145.150602][    T0] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000208  XER: 0000011e
[  145.150625][    T0] CFAR: c0000000000cbae4 IRQMASK: 1 
[  145.150625][    T0] GPR00: c0000000000cbab0 c00000000985fdb0 c0000000027aaf00 c000000b02955f00 
[  145.150625][    T0] GPR04: c0000000043e0b00 c0000000067c7000 0000000000000000 0000000000030e2d 
[  145.150625][    T0] GPR08: c00000000451af00 0000000000000001 c00000000451af00 c00000000451af00 
[  145.150625][    T0] GPR12: c000000000181a40 c00000050fffa300 0000000000000000 000000001eed51a0 
[  145.150625][    T0] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[  145.150625][    T0] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[  145.150625][    T0] GPR24: 0000000000000005 000000000000dedc c000000004468470 0000000000000001 
[  145.150625][    T0] GPR28: c0000000067c7000 0000000000000000 0000000000000005 c000000b02956780 
[  145.150711][    T0] NIP [c0000000000cbc30] switch_mm_irqs_off+0x320/0x340
[  145.150716][    T0] LR [c0000000000cbab0] switch_mm_irqs_off+0x1a0/0x340
[  145.150721][    T0] Call Trace:
[  145.150724][    T0] [c00000000985fdb0] [c000000000448688] __smp_call_single_queue+0x198/0x1f0 (unreliable)
[  145.150732][    T0] [c00000000985fdf0] [c0000000002af958] idle_task_exit+0xf8/0x230
[  145.150740][    T0] [c00000000985fe40] [c000000000181aac] pseries_cpu_offline_self+0x6c/0x230
[  145.150748][    T0] [c00000000985feb0] [c000000000092bb4] arch_cpu_idle_dead+0x64/0x90
[  145.150755][    T0] [c00000000985fee0] [c0000000002fc09c] do_idle+0x25c/0x740
[  145.150761][    T0] [c00000000985ff60] [c0000000002fcd14] cpu_startup_entry+0x84/0xa0
[  145.150765][    T0] [c00000000985ff90] [c000000000092500] start_secondary+0x4e0/0x510
[  145.150772][    T0] [c00000000985ffe0] [c00000000000e258] start_secondary_prolog+0x10/0x14
[  145.150788][    T0] Code: 0fe00000 3ce201d7 e947a198 394a0001 f947a198 4bfffd70 60000000 60420000 3d4201d7 e92aa210 39290001 f92aa210 <0fe00000> 3d4201d7 e8010050 e92aa218 
[  145.150828][    T0] irq event stamp: 49758
[  145.150831][    T0] hardirqs last  enabled at (49757): [<c0000000004330c8>] tick_nohz_idle_enter+0x118/0x2b0
[  145.150836][    T0] hardirqs last disabled at (49758): [<c0000000002fc038>] do_idle+0x1f8/0x740
[  145.150839][    T0] softirqs last  enabled at (49724): [<c000000001f66398>] __do_softirq+0x5c8/0x7f4
[  145.150847][    T0] softirqs last disabled at (49703): [<c00000000001bc90>] do_softirq_own_stack+0x50/0x80
[  145.150852][    T0] ---[ end trace 0000000000000000 ]---
