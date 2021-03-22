Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49141344A3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:04:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3znq1hJKz30Gx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:03:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3znT0HxKz2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:03:38 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8C365939D30A;
 Mon, 22 Mar 2021 17:01:58 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Mar
 2021 17:01:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b7960ad8-3c55-4ce2-9325-f3052693cc65,
 2440D31D697F0C6CF44D15E35915EFCCCC8A77EA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Nicholas Piggin <npiggin@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
 <kvm-ppc@vger.kernel.org>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com>
 <b06ebe14-a714-c882-8bdf-ac41de9a8523@ozlabs.ru>
 <1616417941.ksskhyvg3t.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cc1660a7-e81e-b7b3-a841-35fb77fb571b@kaod.org>
Date: Mon, 22 Mar 2021 17:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1616417941.ksskhyvg3t.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d8f1de64-27cc-44d0-b947-3f56170d27b2
X-Ovh-Tracer-Id: 13796214511165737952
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/22/21 2:15 PM, Nicholas Piggin wrote:
> Excerpts from Alexey Kardashevskiy's message of March 22, 2021 5:30 pm:
>>
>>
>> On 06/03/2021 02:06, Nicholas Piggin wrote:
>>> In the interest of minimising the amount of code that is run in>>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>>
>>> POWER8 and earlier are much more expensive to exit from HV real mode
>>> and switch to host mode, because on those processors HV interrupts get
>>> to the hypervisor with the MMU off, and the other threads in the core
>>> need to be pulled out of the guest, and SLBs all need to be saved,
>>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>>> in host mode. Hash guests also require a lot of hcalls to run. The
>>> XICS interrupt controller requires hcalls to run.
>>>
>>> By contrast, POWER9 has independent thread switching, and in radix mode
>>> the hypervisor is already in a host virtual memory mode when the HV
>>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>>> interrupts or manage translations.

Do we need to handle the host-is-a-P9-without-xive case ?

>>> So it's much less important to handle hcalls in real mode in P9.
>>
>> So acde25726bc6034b (which added if(kvm_is_radix(vcpu->kvm))return 
>> H_TOO_HARD) can be reverted, pretty much?
> 
> Yes. Although that calls attention to the fact I missed doing
> a P9 h_random handler in this patch. I'll fix that, then I think
> acde2572 could be reverted entirely.
> 
> [...]
> 
>>>   	} else {
>>>   		kvmppc_xive_push_vcpu(vcpu);
>>>   		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
>>> -		kvmppc_xive_pull_vcpu(vcpu);
>>> +		/* H_CEDE has to be handled now, not later */
>>> +		/* XICS hcalls must be handled before xive is pulled */
>>> +		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
>>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>>> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>>>   
>>> +			if (req == H_CEDE) {
>>> +				kvmppc_cede(vcpu);
>>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
>>> +				kvmppc_set_gpr(vcpu, 3, 0);
>>> +				trap = 0;
>>> +			}
>>> +			if (req == H_EOI || req == H_CPPR ||
>>
>> else if (req == H_EOI ... ?
> 
> Hummm, sure.

you could integrate the H_CEDE in the switch statement below.

> 
> [...]
> 
>>> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
>>> +{
>>> +	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
>>> +
>>> +	if (!esc_vaddr)
>>> +		return;
>>> +
>>> +	/* we are using XIVE with single escalation */
>>> +
>>> +	if (vcpu->arch.xive_esc_on) {
>>> +		/*
>>> +		 * If we still have a pending escalation, abort the cede,
>>> +		 * and we must set PQ to 10 rather than 00 so that we don't
>>> +		 * potentially end up with two entries for the escalation
>>> +		 * interrupt in the XIVE interrupt queue.  In that case
>>> +		 * we also don't want to set xive_esc_on to 1 here in
>>> +		 * case we race with xive_esc_irq().
>>> +		 */
>>> +		vcpu->arch.ceded = 0;
>>> +		/*
>>> +		 * The escalation interrupts are special as we don't EOI them.
>>> +		 * There is no need to use the load-after-store ordering offset
>>> +		 * to set PQ to 10 as we won't use StoreEOI.
>>> +		 */
>>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
>>> +	} else {
>>> +		vcpu->arch.xive_esc_on = true;
>>> +		mb();
>>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>>> +	}
>>> +	mb();
>>
>>
>> Uff. Thanks for cut-n-pasting the comments, helped a lot to match this c 
>> to that asm!
> 
> Glad it helped.
>>> +}

I had to do the PowerNV models in QEMU to start understanding that stuff ... 

>>> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
>>> +
>>>   /*
>>>    * This is a simple trigger for a generic XIVE IRQ. This must
>>>    * only be called for interrupts that support a trigger page
>>> @@ -2106,6 +2140,32 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>>>   	return 0;
>>>   }
>>>   
>>> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
>>> +{
>>> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>>
>>
>> Can a XIVE enabled guest issue these hcalls? Don't we want if 
>> (!kvmppc_xics_enabled(vcpu)) and
>>   if (xics_on_xive()) here, as kvmppc_rm_h_xirr() have? Some of these 
>> hcalls do write to XIVE registers but some seem to change 
>> kvmppc_xive_vcpu. Thanks,
> 
> Yes I think you're right, good catch. I'm not completely sure about all 
> the xive and xics modes but a guest certainly can make any kind of hcall 
> it likes and we have to sanity check it.

Yes. 

> We want to take the hcall here (in replacement of the real mode hcalls)
> with the same condition. So it would be:
> 
>         if (!kvmppc_xics_enabled(vcpu))
>                 return H_TOO_HARD;

Yes.

This test covers the case in which a vCPU does XICS hcalls without QEMU 
having connected the vCPU to a XICS ICP. The ICP is the KVM XICS device 
on P8 or XICS-on-XIVE on P9. It catches QEMU errors when the interrupt 
mode is negotiated, we don't want the OS to do XICS hcalls after having 
negotiated the XIVE interrupt mode. 

It's different for the XIVE hcalls (when running under XICS) because they 
are all handled in QEMU. 

>         if (!xics_on_xive())
> 		return H_TOO_HARD;

I understand that this code is only called on P9 and with translation on.

On P9, we could have xics_on_xive() == 0 if XIVE is disabled at compile 
time or with "xive=off" at boot time. But guests should be supported. 
I don't see a reason to restrict the support even if these scenarios 
are rather unusual if not very rare.

on P10, it's the same but since we don't have the XICS emulation layer 
in OPAL, the host will be pretty useless. We don't care.

Since we are trying to handle hcalls, this is L0 and it can not be called 
for nested guests, which would be another case of xics_on_xive() == 0. 
We don't care either.



C.



> 	[ ... process xive_vm_h_xirr / cppr / eoi / etc ]
> 
> Right?
> 
> Thanks,
> Nick
> 
>>
>>
>>
>>
>>> +
>>> +	switch (req) {
>>> +	case H_XIRR:
>>> +		return xive_vm_h_xirr(vcpu);
>>> +	case H_CPPR:
>>> +		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
>>> +	case H_EOI:
>>> +		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
>>> +	case H_IPI:
>>> +		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
>>> +					  kvmppc_get_gpr(vcpu, 5));
>>> +	case H_IPOLL:
>>> +		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
>>> +	case H_XIRR_X:
>>> +		xive_vm_h_xirr(vcpu);
>>> +		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
>>> +		return H_SUCCESS;
>>> +	}
>>> +
>>> +	return H_UNSUPPORTED;
>>> +}
>>> +EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
>>> +
>>>   int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
>>>   {
>>>   	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>>>
>>
>> -- 
>> Alexey
>>

