Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 111634D3186
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 16:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDG0F0lTcz3blK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 02:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.58.48; helo=6.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4631 seconds by postgrey-1.36 at boromir;
 Thu, 10 Mar 2022 02:12:19 AEDT
Received: from 6.mo548.mail-out.ovh.net (6.mo548.mail-out.ovh.net
 [188.165.58.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDFzl6cvcz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 02:12:16 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7AB62222FC;
 Wed,  9 Mar 2022 13:55:01 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 14:55:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a4eca42e-43cc-4558-92f3-bbc3be22763a,
 66B1A16360805881C0E6A53C72584B01DC44DA3E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3793f02f-f778-f2fa-42ca-eff685b30874@kaod.org>
Date: Wed, 9 Mar 2022 14:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV P9: Move cede logic out of XIVE
 escalation rearming
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20220303053315.1056880-1-npiggin@gmail.com>
 <20220303053315.1056880-4-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220303053315.1056880-4-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: de1d0b42-a1df-41db-beea-b8d4cae237c8
X-Ovh-Tracer-Id: 12805141115548961690
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/3/22 06:33, Nicholas Piggin wrote:
> Move the cede abort logic out of xive escalation rearming and into
> the caller to prepare for handling a similar case with nested guest
> entry.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

In xive_esc_irq() :

	if (vcpu->arch.ceded)
		kvmppc_fast_vcpu_kick(vcpu);

which does :

	vcpu->kvm->arch.kvm_ops->fast_vcpu_kick(vcpu);


That's a lot of indirection which are costly on PPC. May be for this case,
since we know XIVE is only supported on KVM HV, we could use directly
kvmppc_fast_vcpu_kick_hv().

Thanks,

C.

> ---
>   arch/powerpc/include/asm/kvm_ppc.h |  4 ++--
>   arch/powerpc/kvm/book3s_hv.c       | 10 ++++++++--
>   arch/powerpc/kvm/book3s_xive.c     |  9 ++++++---
>   3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index a14dbcd1b8ce..94fa5f246657 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -671,7 +671,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>   			       int level, bool line_status);
>   extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>   extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
> -extern void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
> +extern bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
>   
>   static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>   {
> @@ -709,7 +709,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>   				      int level, bool line_status) { return -ENODEV; }
>   static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>   static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
> -static inline void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { }
> +static inline bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { return true; }
>   
>   static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>   	{ return 0; }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 5df359053147..a0b674d3a2da 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4073,10 +4073,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>   			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>   
> -			/* H_CEDE has to be handled now, not later */
> +			/* H_CEDE has to be handled now */
>   			if (req == H_CEDE) {
>   				kvmppc_cede(vcpu);
> -				kvmppc_xive_rearm_escalation(vcpu); /* may un-cede */
> +				if (!kvmppc_xive_rearm_escalation(vcpu)) {
> +					/*
> +					 * Pending escalation so abort
> +					 * the cede.
> +					 */
> +					vcpu->arch.ceded = 0;
> +				}
>   				kvmppc_set_gpr(vcpu, 3, 0);
>   				trap = 0;
>   
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index e216c068075d..7b513e14cada 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -179,12 +179,13 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>   }
>   EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>   
> -void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
> +bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>   {
>   	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
> +	bool ret = true;
>   
>   	if (!esc_vaddr)
> -		return;
> +		return ret;
>   
>   	/* we are using XIVE with single escalation */
>   
> @@ -197,7 +198,7 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>   		 * we also don't want to set xive_esc_on to 1 here in
>   		 * case we race with xive_esc_irq().
>   		 */
> -		vcpu->arch.ceded = 0;
> +		ret = false;
>   		/*
>   		 * The escalation interrupts are special as we don't EOI them.
>   		 * There is no need to use the load-after-store ordering offset
> @@ -210,6 +211,8 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>   		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>   	}
>   	mb();
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
>   

