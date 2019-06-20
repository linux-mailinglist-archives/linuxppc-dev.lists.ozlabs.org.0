Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC64C958
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 10:22:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tvtb1y67zDrB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 18:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.36.149; helo=4.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo179.mail-out.ovh.net (4.mo179.mail-out.ovh.net
 [46.105.36.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TvrN2gXdzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 18:20:00 +1000 (AEST)
Received: from player758.ha.ovh.net (unknown [10.108.35.240])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B97D01365EA
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 10:19:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 50490713A45D;
 Thu, 20 Jun 2019 08:19:49 +0000 (UTC)
Subject: Re: [PATCH 3/3] KVM: PPC: Book3S HV: Clear pending decr exceptions on
 nested guest entry
To: Laurent Vivier <lvivier@redhat.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190620014651.7645-1-sjitindarsingh@gmail.com>
 <20190620014651.7645-3-sjitindarsingh@gmail.com>
 <30c02f09-8376-3dd0-e463-94d396df0240@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <31d62ffd-2d29-f314-dcff-0cc27919c58a@kaod.org>
Date: Thu, 20 Jun 2019 10:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <30c02f09-8376-3dd0-e463-94d396df0240@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4731031409092824023
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeggddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/06/2019 09:57, Laurent Vivier wrote:
> On 20/06/2019 03:46, Suraj Jitindar Singh wrote:
>> If we enter an L1 guest with a pending decrementer exception then this
>> is cleared on guest exit if the guest has writtien a positive value into
>> the decrementer (indicating that it handled the decrementer exception)
>> since there is no other way to detect that the guest has handled the
>> pending exception and that it should be dequeued. In the event that the
>> L1 guest tries to run a nested (L2) guest immediately after this and the
>> L2 guest decrementer is negative (which is loaded by L1 before making
>> the H_ENTER_NESTED hcall), then the pending decrementer exception
>> isn't cleared and the L2 entry is blocked since L1 has a pending
>> exception, even though L1 may have already handled the exception and
>> written a positive value for it's decrementer. This results in a loop of
>> L1 trying to enter the L2 guest and L0 blocking the entry since L1 has
>> an interrupt pending with the outcome being that L2 never gets to run
>> and hangs.
>>
>> Fix this by clearing any pending decrementer exceptions when L1 makes
>> the H_ENTER_NESTED hcall since it won't do this if it's decrementer has
>> gone negative, and anyway it's decrementer has been communicated to L0
>> in the hdec_expires field and L0 will return control to L1 when this
>> goes negative by delivering an H_DECREMENTER exception.
>>
>> Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"
>>
>> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 719fd2529eec..4a5eb29b952f 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -4128,8 +4128,15 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>>  
>>  	preempt_enable();
>>  
>> -	/* cancel pending decrementer exception if DEC is now positive */
>> -	if (get_tb() < vcpu->arch.dec_expires && kvmppc_core_pending_dec(vcpu))
>> +	/*
>> +	 * cancel pending decrementer exception if DEC is now positive, or if
>> +	 * entering a nested guest in which case the decrementer is now owned
>> +	 * by L2 and the L1 decrementer is provided in hdec_expires
>> +	 */
>> +	if (kvmppc_core_pending_dec(vcpu) &&
>> +			((get_tb() < vcpu->arch.dec_expires) ||
>> +			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
>> +			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
>>  		kvmppc_core_dequeue_dec(vcpu);
>>  
>>  	trace_kvm_guest_exit(vcpu);
>>
> 
> Patches 2 and 3: tested I can boot and run an L2 nested guest with qemu
> v4.0.0 and caps-large-decr=on in the case we have had a hang previously.
> 
> Tested-by: Laurent Vivier <lvivier@redhat.com>

You beat me to it. All works fine on L0, L1, L2.

  Tested-by: Cédric Le Goater <clg@kaod.org>

With a QEMU-4.1. In this configuration, L2 runs with the XIVE (emulated) 
interrupt mode by default now (kernel_irqchip=allowed, ic-mode=dual).

Thanks,

C.


