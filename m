Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29882344ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:13:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F401C1BWpz30KR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:13:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F400t3Wgmz300J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:13:34 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BD12D939E552;
 Mon, 22 Mar 2021 17:12:40 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Mar
 2021 17:12:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005049a2ec9-afe2-4d93-8631-fcaf5ec1a2a0,
 2440D31D697F0C6CF44D15E35915EFCCCC8A77EA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, <kvm-ppc@vger.kernel.org>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com> <87o8fh21iq.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a335d4a5-9d98-9f27-cfd3-b45dd1c07c9e@kaod.org>
Date: Mon, 22 Mar 2021 17:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87o8fh21iq.fsf@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 979b522b-b67a-4713-ad78-4f41913bf3bd
X-Ovh-Tracer-Id: 13976921444696951776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeiffevteevfeeivefhudfgjeejleetgeffgfejtdejgfduvdejveekveeuudeknecuffhomhgrihhnpehrmhhhrghnughlvghrshdrshgsnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
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

On 3/17/21 5:22 PM, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
>> In the interest of minimising the amount of code that is run in
>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>
>> POWER8 and earlier are much more expensive to exit from HV real mode
>> and switch to host mode, because on those processors HV interrupts get
>> to the hypervisor with the MMU off, and the other threads in the core
>> need to be pulled out of the guest, and SLBs all need to be saved,
>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>> in host mode. Hash guests also require a lot of hcalls to run. The
>> XICS interrupt controller requires hcalls to run.
>>
>> By contrast, POWER9 has independent thread switching, and in radix mode
>> the hypervisor is already in a host virtual memory mode when the HV
>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>> interrupts or manage translations.
>>
>> So it's much less important to handle hcalls in real mode in P9.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
> 
> <snip>
> 
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 497f216ad724..1f2ba8955c6a 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1147,7 +1147,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>>   */
>> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
>> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
> 
> The comment above needs to be updated I think.
> 
>>  {
>>  	vcpu->arch.shregs.msr |= MSR_EE;
>>  	vcpu->arch.ceded = 1;
>> @@ -1403,9 +1403,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>>  		/* hcall - punt to userspace */
>>  		int i;
>>
>> -		/* hypercall with MSR_PR has already been handled in rmode,
>> -		 * and never reaches here.
>> -		 */
>> +		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			/*
>> +			 * Guest userspace executed sc 1, reflect it back as a
>> +			 * privileged program check interrupt.
>> +			 */
>> +			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
>> +			r = RESUME_GUEST;
>> +			break;
>> +		}
>>
>>  		run->papr_hcall.nr = kvmppc_get_gpr(vcpu, 3);
>>  		for (i = 0; i < 9; ++i)
>> @@ -3740,15 +3746,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>>  		/* H_CEDE has to be handled now, not later */
>>  		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>>  		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
>> -			kvmppc_nested_cede(vcpu);
>> +			kvmppc_cede(vcpu);
>>  			kvmppc_set_gpr(vcpu, 3, 0);
>>  			trap = 0;
>>  		}
>>  	} else {
>>  		kvmppc_xive_push_vcpu(vcpu);
>>  		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
>> -		kvmppc_xive_pull_vcpu(vcpu);
>> +		/* H_CEDE has to be handled now, not later */
>> +		/* XICS hcalls must be handled before xive is pulled */
>> +		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>>
>> +			if (req == H_CEDE) {
>> +				kvmppc_cede(vcpu);
>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
>> +				kvmppc_set_gpr(vcpu, 3, 0);
>> +				trap = 0;
>> +			}
>> +			if (req == H_EOI || req == H_CPPR ||
>> +			    req == H_IPI || req == H_IPOLL ||
>> +			    req == H_XIRR || req == H_XIRR_X) {
>> +				unsigned long ret;
>> +
>> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
>> +				kvmppc_set_gpr(vcpu, 3, ret);
>> +				trap = 0;
>> +			}
>> +		}
> 
> I tried running L2 with xive=off and this code slows down the boot
> considerably. I think we're missing a !vcpu->arch.nested in the
> conditional.

L2 by default will always use the XIVE emulation in QEMU. If you deactivate 
XIVE support in the L2, with "xive=off" in the OS, or "ic-mode=xics" in the 
L1 QEMU, it will use the legacy XICS mode, emulated in the L1 KVM-on-pseries. 

And yes, the QEMU XIVE emulation tends to be faster. I don't exactly know
why. Probably because of less exit/entries ? 

C.


> This may also be missing these checks from kvmppc_pseries_do_hcall:
> 
> 		if (kvmppc_xics_enabled(vcpu)) {
> 			if (xics_on_xive()) {
> 				ret = H_NOT_AVAILABLE;
> 				return RESUME_GUEST;
> 			}
> 			ret = kvmppc_xics_hcall(vcpu, req);
>                         (...)
> 
> For H_CEDE there might be a similar situation since we're shadowing the
> code above that runs after H_ENTER_NESTED by setting trap to 0 here.
> 
>> +		kvmppc_xive_pull_vcpu(vcpu);
>>  	}
>>
>>  	vcpu->arch.slb_max = 0;
>> @@ -4408,8 +4435,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>>  		else
>>  			r = kvmppc_run_vcpu(vcpu);
>>
>> -		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
>> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
>> +			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
>> +				r = RESUME_GUEST;
>> +				continue;
>> +			}
>>  			trace_kvm_hcall_enter(vcpu);
>>  			r = kvmppc_pseries_do_hcall(vcpu);
>>  			trace_kvm_hcall_exit(vcpu, r);
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> index c11597f815e4..2d0d14ed1d92 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  	mr	r4,r9
>>  	bge	fast_guest_return
>>  2:
>> +	/* If we came in through the P9 short path, no real mode hcalls */
>> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
>> +	cmpwi	r0, 0
>> +	bne	no_try_real
>>  	/* See if this is an hcall we can handle in real mode */
>>  	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
>>  	beq	hcall_try_real_mode
>> +no_try_real:
>>
>>  	/* Hypervisor doorbell - exit only if host IPI flag set */
>>  	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>> index 52cdb9e2660a..1e4871bbcad4 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -158,6 +158,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>>  }
>>  EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>>
>> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
>> +{
>> +	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
>> +
>> +	if (!esc_vaddr)
>> +		return;
>> +
>> +	/* we are using XIVE with single escalation */
>> +
>> +	if (vcpu->arch.xive_esc_on) {
>> +		/*
>> +		 * If we still have a pending escalation, abort the cede,
>> +		 * and we must set PQ to 10 rather than 00 so that we don't
>> +		 * potentially end up with two entries for the escalation
>> +		 * interrupt in the XIVE interrupt queue.  In that case
>> +		 * we also don't want to set xive_esc_on to 1 here in
>> +		 * case we race with xive_esc_irq().
>> +		 */
>> +		vcpu->arch.ceded = 0;
>> +		/*
>> +		 * The escalation interrupts are special as we don't EOI them.
>> +		 * There is no need to use the load-after-store ordering offset
>> +		 * to set PQ to 10 as we won't use StoreEOI.
>> +		 */
>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
>> +	} else {
>> +		vcpu->arch.xive_esc_on = true;
>> +		mb();
>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>> +	}
>> +	mb();
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
>> +
>>  /*
>>   * This is a simple trigger for a generic XIVE IRQ. This must
>>   * only be called for interrupts that support a trigger page
>> @@ -2106,6 +2140,32 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>>  	return 0;
>>  }
>>
>> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
>> +{
>> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>> +
>> +	switch (req) {
>> +	case H_XIRR:
>> +		return xive_vm_h_xirr(vcpu);
>> +	case H_CPPR:
>> +		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_EOI:
>> +		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_IPI:
>> +		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					  kvmppc_get_gpr(vcpu, 5));
>> +	case H_IPOLL:
>> +		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_XIRR_X:
>> +		xive_vm_h_xirr(vcpu);
>> +		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
>> +		return H_SUCCESS;
>> +	}
>> +
>> +	return H_UNSUPPORTED;
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
>> +
>>  int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
>>  {
>>  	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;

