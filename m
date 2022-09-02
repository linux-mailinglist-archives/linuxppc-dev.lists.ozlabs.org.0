Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FA5AADA7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 13:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJwjV5tPRz3bWB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 21:31:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJwj23BzKz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 21:31:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJwj03fP1z4xG6;
	Fri,  2 Sep 2022 21:31:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220831131052.42250-1-mpe@ellerman.id.au>
References: <20220831131052.42250-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] Revert "powerpc/irq: Don't open code irq_soft_mask helpers"
Message-Id: <166211825329.554590.8228191731474663031.b4-ty@ellerman.id.au>
Date: Fri, 02 Sep 2022 21:30:53 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: zhouzhouyi@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Aug 2022 23:10:52 +1000, Michael Ellerman wrote:
> This reverts commit ef5b570d3700fbb8628a58da0487486ceeb713cd.
> 
> Zhouyi reported that commit is causing crashes when running rcutorture
> with KASAN enabled:
> 
>   BUG: using smp_processor_id() in preemptible [00000000] code: rcu_torture_rea/100
>   caller is rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
>   CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G        W          5.19.0-rc5-next-20220708-dirty #253
>   Call Trace:
>     dump_stack_lvl+0xbc/0x108 (unreliable)
>     check_preemption_disabled+0x154/0x160
>     rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
>     __rcu_read_unlock+0x290/0x3b0
>     rcu_torture_read_unlock+0x30/0xb0
>     rcutorture_one_extend+0x198/0x810
>     rcu_torture_one_read+0x58c/0xc90
>     rcu_torture_reader+0x12c/0x360
>     kthread+0x1e8/0x220
>     ret_from_kernel_thread+0x5c/0x64
> 
> [...]

Applied to powerpc/fixes.

[1/1] Revert "powerpc/irq: Don't open code irq_soft_mask helpers"
      https://git.kernel.org/powerpc/c/684c68d92e2e1b97fa2f31c35c1b0f7671a8618a

cheers
