Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8407E8566
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:21:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472SL80V1DzF0Yb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:21:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472S8N62syzF2P4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 21:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="cs2hdJYz"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 472S8M3QkSz9sP3;
 Tue, 29 Oct 2019 21:13:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572343987;
 bh=uI8deBIoQAH9dUj+VilXBuXzEDBg9aiumzk3Bni0Y5s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cs2hdJYzsR8uXUBkRv/tii8mwkG/u3ntLr9XeIv/GVCulY5K0myfhD63CT1ARYAm3
 leqp1px0zmE8Z1tGttSZCGrJyVj7LG5pa14zT16FkVfXVKQL7SQdgNC+AS32l2M8C3
 W+e5YDcEY72Dss36tAHgvk5I9WnH8gSrUBbD4aC/KUmuTC52fWaXogDrOKaW2moXUj
 MYpc90/cBzm/B48Y79HGAhDoch3Ws3Z4CQebyUJAsgFOX2AhpOLmVQahjn/bbKTZUN
 2oZYGaqyA1ZhciSOcD91Fxp+gw5pD1EG4WprDTBTEz/0KfCDRwdH1ZzMF+efT7gZli
 BVWizJI5ZFyrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] powerpc/powernv/smp: fix a warning at CPU hotplug
In-Reply-To: <1572295467-14686-1-git-send-email-cai@lca.pw>
References: <1572295467-14686-1-git-send-email-cai@lca.pw>
Date: Tue, 29 Oct 2019 21:13:02 +1100
Message-ID: <875zk7hnbl.fsf@mpe.ellerman.id.au>
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org, Qian Cai <cai@lca.pw>, paulmck@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
> The commit e78a7614f387 ("idle: Prevent late-arriving interrupts from
> disrupting offline") introduced a warning on powerpc with CPU hotplug,
>
> WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160
> pnv_smp_cpu_kill_self+0x5c/0x330
> Call Trace:
>  cpu_die+0x48/0x64
>  arch_cpu_idle_dead+0x30/0x50
>  do_idle+0x2e4/0x460
>  cpu_startup_entry+0x3c/0x40
>  start_secondary+0x7a8/0xa80
>  start_secondary_resume+0x10/0x14
>
> because it calls local_irq_disable() before arch_cpu_idle_dead().
>
> Fixes: e78a7614f387 ("idle: Prevent late-arriving interrupts from disrupting offline")
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/platforms/powernv/smp.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks.

But Nick already sent a fix for this, I just need to review/test it and
get it merged, see:
  https://patchwork.ozlabs.org/patch/1181275/


cheers

> diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
> index fbd6e6b7bbf2..51f4e07b9168 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -157,7 +157,6 @@ static void pnv_smp_cpu_kill_self(void)
>  	 * This hard disables local interurpts, ensuring we have no lazy
>  	 * irqs pending.
>  	 */
> -	WARN_ON(irqs_disabled());
>  	hard_irq_disable();
>  	WARN_ON(lazy_irq_pending());
>  
> -- 
> 1.8.3.1
