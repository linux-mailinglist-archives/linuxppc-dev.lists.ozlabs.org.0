Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53A4033E0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 07:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H49x70vVMz2yJd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 15:41:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=B6jPwaSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=B6jPwaSt; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H49wQ6SwYz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 15:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631079653;
 bh=MUQ9qc/ddcqfz56EAzWnJSCFqdZqq3KoDx2oQ4pQknk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B6jPwaStjWgNk2Uzsf3ue0Xli5F3Keh0auuQm4lgHgEDLkJMSXT8UHvr4Bs9x3gHK
 xxfnD5tFPTmin/vIDwfHeWDelfXh5gTUNT5VSPsbz6DbnUKv1K5G8ELvgZFCLIQ2rV
 NDAG/EK+lD2IPTuq92+GQgiw0laIz5uwsPTNvtzAJWnjbLUYmrSKlYXfivAGVLxnen
 qDm2pBy25ag+MCGsauwl9BFtK/zKwDabk3khO/zXD5bR208r8uV0gUkP4Oi0mZAjhw
 CISc8f3NrC6TFCP++WCn1lKdkc37kBKKnoe5me3Xuz0+ipXFvcsCtzgLlLPOPohQG0
 2LI5aIeceKnHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H49wP4VRVz9sR4;
 Wed,  8 Sep 2021 15:40:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mce: Fix access error in mce handler
In-Reply-To: <f14cb57a-5ae0-f867-1e18-004f34a3b320@linux.ibm.com>
References: <20210906081823.181509-1-ganeshgr@linux.ibm.com>
 <87y289natb.fsf@mpe.ellerman.id.au>
 <f14cb57a-5ae0-f867-1e18-004f34a3b320@linux.ibm.com>
Date: Wed, 08 Sep 2021 15:40:53 +1000
Message-ID: <87mtonmxp6.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 9/6/21 6:03 PM, Michael Ellerman wrote:
>
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>> We queue an irq work for deferred processing of mce event
>>> in realmode mce handler, where translation is disabled.
>>> Queuing of the work may result in accessing memory outside
>>> RMO region, such access needs the translation to be enabled
>>> for an LPAR running with hash mmu else the kernel crashes.
>>>
>>> So enable the translation before queuing the work.
>>>
>>> Without this change following trace is seen on injecting machine
>>> check error in an LPAR running with hash mmu.
>> What type of error are you injecting?
>
> SLB multihit in kernel mode.
>
>>
>>> Oops: Kernel access of bad area, sig: 11 [#1]
>>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>>> CPU: 5 PID: 1883 Comm: insmod Tainted: G        OE     5.14.0-mce+ #137
>>> NIP:  c000000000735d60 LR: c000000000318640 CTR: 0000000000000000
>>> REGS: c00000001ebff9a0 TRAP: 0300   Tainted: G       OE      (5.14.0-mce+)
>>> MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008228  XER: 00000001
>>> CFAR: c00000000031863c DAR: c00000027fa8fe08 DSISR: 40000000 IRQMASK: 0
>>> GPR00: c0000000003186d0 c00000001ebffc40 c000000001b0df00 c0000000016337e8
>>> GPR04: c0000000016337e8 c00000027fa8fe08 0000000000000023 c0000000016337f0
>>> GPR08: 0000000000000023 c0000000012ffe08 0000000000000000 c008000001460240
>>> GPR12: 0000000000000000 c00000001ec9a900 c00000002ac4bd00 0000000000000000
>>> GPR16: 00000000000005a0 c0080000006b0000 c0080000006b05a0 c000000000ff3068
>>> GPR20: c00000002ac4bbc0 0000000000000001 c00000002ac4bbc0 c008000001490298
>>> GPR24: c008000001490108 c000000001636198 c008000001470090 c008000001470058
>>> GPR28: 0000000000000510 c008000001000000 c008000008000019 0000000000000019
>>> NIP [c000000000735d60] llist_add_batch+0x0/0x40
>>> LR [c000000000318640] __irq_work_queue_local+0x70/0xc0
>>> Call Trace:
>>> [c00000001ebffc40] [c00000001ebffc0c] 0xc00000001ebffc0c (unreliable)
>>> [c00000001ebffc60] [c0000000003186d0] irq_work_queue+0x40/0x70
>>> [c00000001ebffc80] [c00000000004425c] machine_check_queue_event+0xbc/0xd0
>>> [c00000001ebffcf0] [c00000000000838c] machine_check_early_common+0x16c/0x1f4
>>>
>>> Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
>> Please explain in more detail why that commit caused this breakage.
>
> After enabling translation in mce_handle_error() we used to leave it enabled to avoid
> crashing here, but now with this commit we are restoring the MSR to disable translation.

Are you sure we left the MMU enabled to avoid crashing there, or we just
left it enabled by accident?

But yeah, previously the MMU was enabled when we got here whereas now
it's not, because of that change.

> Missed to mention it in commit log, I will add it.

Thanks.

>>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>>> index 47a683cd00d2..9d1e39d42e3e 100644
>>> --- a/arch/powerpc/kernel/mce.c
>>> +++ b/arch/powerpc/kernel/mce.c
>>> @@ -249,6 +249,7 @@ void machine_check_queue_event(void)
>>>   {
>>>   	int index;
>>>   	struct machine_check_event evt;
>>> +	unsigned long msr;
>>>   
>>>   	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
>>>   		return;
>>> @@ -262,8 +263,19 @@ void machine_check_queue_event(void)
>>>   	memcpy(&local_paca->mce_info->mce_event_queue[index],
>>>   	       &evt, sizeof(evt));
>>>   
>>> -	/* Queue irq work to process this event later. */
>>> -	irq_work_queue(&mce_event_process_work);
>>> +	/* Queue irq work to process this event later. Before
>>> +	 * queuing the work enable translation for non radix LPAR,
>>> +	 * as irq_work_queue may try to access memory outside RMO
>>> +	 * region.
>>> +	 */
>>> +	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
>>> +		msr = mfmsr();
>>> +		mtmsr(msr | MSR_IR | MSR_DR);
>>> +		irq_work_queue(&mce_event_process_work);
>>> +		mtmsr(msr);
>>> +	} else {
>>> +		irq_work_queue(&mce_event_process_work);
>>> +	}
>>>   }
>> We already went to virtual mode and queued (different) irq work in
>> arch/powerpc/platforms/pseries/ras.c:mce_handle_error()
>>
>> We also called save_mce_event() which also might have queued irq work,
>> via machine_check_ue_event().
>>
>> So it really feels like something about the design is wrong if we have
>> to go to virtual mode again and queue more irq work here.
>>
>> I guess we can probably merge this as a backportable fix, doing anything
>> else would be a bigger change.
>
> I agree.
>
>>
>> Looking at ras.c there's the comment:
>>
>> 	 * Enable translation as we will be accessing per-cpu variables
>> 	 * in save_mce_event() which may fall outside RMO region, also
>>
>> But AFAICS it's only irq_work_queue() that touches anything percpu?
>
> Yeah, we left the comment unchanged after doing some modifications around it,
> It needs to be updated, ill send a separate patch for it.

Thanks.

I see some other comments that look out of date, ie. the one above
machine_check_process_queued_event() mentions syscall exit, which is no
longer true.

There's also comments in pseries/ras.c about fwnmi_release_errinfo()
crashing in real mode, but we call it in real mode now so that must be
fixed?

>> So maybe we should just not be using irq_work_queue(). It's a pretty
>> thin wrapper around set_dec(1), perhaps we just need to hand-roll some
>> real-mode friendly way of doing that.
>
> You mean, have separate queue and run the work from timer handler?

Yeah something like that.

We don't even need a queue, we already have local_paca->mce_info->mce_queue_count.

So it could just be:

  if (local_paca->mce_info->mce_queue_count)
  	machine_check_process_queued_event();

Though it would need a wrapper because local_paca only exists for 64-bit.

cheers
