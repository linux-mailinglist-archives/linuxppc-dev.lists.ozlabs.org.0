Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067E401B3E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 14:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H379k0Ym7z2yP3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 22:33:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o5TYITBa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o5TYITBa; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H379352mNz2yHN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 22:33:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630931589;
 bh=/smZUmuGNe2IlwNNrAxF6f+YLIIHuDJ5EMF7z2sv5eg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o5TYITBaxTAxndR7UAFEssUIJjrasWREPCI4w9ehnDd8iXJkrSbFirQ5CyFl366qL
 eR0OnhF5OQ39QUiMMJE+rDfUEP02jcXcpZ5wSIT72ew63rU56JwLrrkaG7XiRaVSQj
 eai03Jt9q2cTWhum9Af+Otty5J11G4+H1+OhsqYSvb7Z0Mjmo0q2YWzT10O2TH+w/d
 4EXF6OoYtbByzj1QKaKnBE8f5Z8pPQ/OeZfT19pllBiRVj8T/goKUvDGPAPqTAPPcz
 W1GxrlH3yUGqf2gcsnfo9sRf3qPmiALmidHSIA1Svt5tWt3VhbfQETbaviREmDddyG
 h0ayhc3xzCuMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H37906Zg7z9sW4;
 Mon,  6 Sep 2021 22:33:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mce: Fix access error in mce handler
In-Reply-To: <20210906081823.181509-1-ganeshgr@linux.ibm.com>
References: <20210906081823.181509-1-ganeshgr@linux.ibm.com>
Date: Mon, 06 Sep 2021 22:33:04 +1000
Message-ID: <87y289natb.fsf@mpe.ellerman.id.au>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> We queue an irq work for deferred processing of mce event
> in realmode mce handler, where translation is disabled.
> Queuing of the work may result in accessing memory outside
> RMO region, such access needs the translation to be enabled
> for an LPAR running with hash mmu else the kernel crashes.
>
> So enable the translation before queuing the work.
>
> Without this change following trace is seen on injecting machine
> check error in an LPAR running with hash mmu.

What type of error are you injecting?

> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> CPU: 5 PID: 1883 Comm: insmod Tainted: G        OE     5.14.0-mce+ #137
> NIP:  c000000000735d60 LR: c000000000318640 CTR: 0000000000000000
> REGS: c00000001ebff9a0 TRAP: 0300   Tainted: G       OE      (5.14.0-mce+)
> MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008228  XER: 00000001
> CFAR: c00000000031863c DAR: c00000027fa8fe08 DSISR: 40000000 IRQMASK: 0
> GPR00: c0000000003186d0 c00000001ebffc40 c000000001b0df00 c0000000016337e8
> GPR04: c0000000016337e8 c00000027fa8fe08 0000000000000023 c0000000016337f0
> GPR08: 0000000000000023 c0000000012ffe08 0000000000000000 c008000001460240
> GPR12: 0000000000000000 c00000001ec9a900 c00000002ac4bd00 0000000000000000
> GPR16: 00000000000005a0 c0080000006b0000 c0080000006b05a0 c000000000ff3068
> GPR20: c00000002ac4bbc0 0000000000000001 c00000002ac4bbc0 c008000001490298
> GPR24: c008000001490108 c000000001636198 c008000001470090 c008000001470058
> GPR28: 0000000000000510 c008000001000000 c008000008000019 0000000000000019
> NIP [c000000000735d60] llist_add_batch+0x0/0x40
> LR [c000000000318640] __irq_work_queue_local+0x70/0xc0
> Call Trace:
> [c00000001ebffc40] [c00000001ebffc0c] 0xc00000001ebffc0c (unreliable)
> [c00000001ebffc60] [c0000000003186d0] irq_work_queue+0x40/0x70
> [c00000001ebffc80] [c00000000004425c] machine_check_queue_event+0xbc/0xd0
> [c00000001ebffcf0] [c00000000000838c] machine_check_early_common+0x16c/0x1f4
>
> Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")

Please explain in more detail why that commit caused this breakage.

> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 47a683cd00d2..9d1e39d42e3e 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -249,6 +249,7 @@ void machine_check_queue_event(void)
>  {
>  	int index;
>  	struct machine_check_event evt;
> +	unsigned long msr;
>  
>  	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
>  		return;
> @@ -262,8 +263,19 @@ void machine_check_queue_event(void)
>  	memcpy(&local_paca->mce_info->mce_event_queue[index],
>  	       &evt, sizeof(evt));
>  
> -	/* Queue irq work to process this event later. */
> -	irq_work_queue(&mce_event_process_work);
> +	/* Queue irq work to process this event later. Before
> +	 * queuing the work enable translation for non radix LPAR,
> +	 * as irq_work_queue may try to access memory outside RMO
> +	 * region.
> +	 */
> +	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
> +		msr = mfmsr();
> +		mtmsr(msr | MSR_IR | MSR_DR);
> +		irq_work_queue(&mce_event_process_work);
> +		mtmsr(msr);
> +	} else {
> +		irq_work_queue(&mce_event_process_work);
> +	}
>  }

We already went to virtual mode and queued (different) irq work in
arch/powerpc/platforms/pseries/ras.c:mce_handle_error()

We also called save_mce_event() which also might have queued irq work,
via machine_check_ue_event().

So it really feels like something about the design is wrong if we have
to go to virtual mode again and queue more irq work here.

I guess we can probably merge this as a backportable fix, doing anything
else would be a bigger change.

Looking at ras.c there's the comment:

	 * Enable translation as we will be accessing per-cpu variables
	 * in save_mce_event() which may fall outside RMO region, also

But AFAICS it's only irq_work_queue() that touches anything percpu?

So maybe we should just not be using irq_work_queue(). It's a pretty
thin wrapper around set_dec(1), perhaps we just need to hand-roll some
real-mode friendly way of doing that.

cheers
