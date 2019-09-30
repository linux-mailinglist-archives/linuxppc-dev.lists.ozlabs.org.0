Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F715C21D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 15:23:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hjkz6Y8lzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:23:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.97.206; helo=19.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3607 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Sep 2019 23:19:44 AEST
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hjg44DsFzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 23:19:40 +1000 (AEST)
Received: from player799.ha.ovh.net (unknown [10.108.42.192])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0AC49191C92
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 14:02:11 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 6CFD2A5BCC03;
 Mon, 30 Sep 2019 12:01:58 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] KVM: PPC: Book3S HV: XIVE: Compute the VP id in a
 common helper
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
 <156958523534.1503771.7854438316257986828.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fb6accd0-f3fa-d441-5892-516ed4118d3b@kaod.org>
Date: Mon, 30 Sep 2019 14:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <156958523534.1503771.7854438316257986828.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17204595004402535284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, stable@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/09/2019 13:53, Greg Kurz wrote:
> Reduce code duplication by consolidating the checking of vCPU ids and VP
> ids to a common helper used by both legacy and native XIVE KVM devices.
> And explain the magic with a comment.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks fine. One question below,

> ---
>  arch/powerpc/kvm/book3s_xive.c        |   42 ++++++++++++++++++++++++++-------
>  arch/powerpc/kvm/book3s_xive.h        |    1 +
>  arch/powerpc/kvm/book3s_xive_native.c |   11 ++-------
>  3 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 0b7859e40f66..d84da9f6ee88 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1211,6 +1211,37 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
>  	vcpu->arch.xive_vcpu = NULL;
>  }
>  
> +static bool kvmppc_xive_vcpu_id_valid(struct kvmppc_xive *xive, u32 cpu)
> +{
> +	/* We have a block of KVM_MAX_VCPUS VPs. We just need to check
> +	 * raw vCPU ids are below the expected limit for this guest's
> +	 * core stride ; kvmppc_pack_vcpu_id() will pack them down to an
> +	 * index that can be safely used to compute a VP id that belongs
> +	 * to the VP block.
> +	 */
> +	return cpu < KVM_MAX_VCPUS * xive->kvm->arch.emul_smt_mode;
> +}
> +
> +int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp)
> +{
> +	u32 vp_id;
> +
> +	if (!kvmppc_xive_vcpu_id_valid(xive, cpu)) {
> +		pr_devel("Out of bounds !\n");
> +		return -EINVAL;
> +	}
> +
> +	vp_id = kvmppc_xive_vp(xive, cpu);
> +	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> +		pr_devel("Duplicate !\n");
> +		return -EEXIST;
> +	}
> +
> +	*vp = vp_id;
> +
> +	return 0;

why not return vp_id ? and test for a negative value in callers.


C.

> +}
> +
>  int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  			     struct kvm_vcpu *vcpu, u32 cpu)
>  {
> @@ -1229,20 +1260,13 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  		return -EPERM;
>  	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
>  		return -EBUSY;
> -	if (cpu >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
> -		pr_devel("Out of bounds !\n");
> -		return -EINVAL;
> -	}
>  
>  	/* We need to synchronize with queue provisioning */
>  	mutex_lock(&xive->lock);
>  
> -	vp_id = kvmppc_xive_vp(xive, cpu);
> -	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> -		pr_devel("Duplicate !\n");
> -		r = -EEXIST;
> +	r = kvmppc_xive_compute_vp_id(xive, cpu, &vp_id);
> +	if (r)
>  		goto bail;
> -	}
>  
>  	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
>  	if (!xc) {
> diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
> index fe3ed50e0818..90cf6ec35a68 100644
> --- a/arch/powerpc/kvm/book3s_xive.h
> +++ b/arch/powerpc/kvm/book3s_xive.h
> @@ -296,6 +296,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
>  struct kvmppc_xive *kvmppc_xive_get_device(struct kvm *kvm, u32 type);
>  void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
>  				    struct kvmppc_xive_vcpu *xc, int irq);
> +int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp);
>  
>  #endif /* CONFIG_KVM_XICS */
>  #endif /* _KVM_PPC_BOOK3S_XICS_H */
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 43a86858390a..5bb480b2aafd 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -118,19 +118,12 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  		return -EPERM;
>  	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
>  		return -EBUSY;
> -	if (server_num >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
> -		pr_devel("Out of bounds !\n");
> -		return -EINVAL;
> -	}
>  
>  	mutex_lock(&xive->lock);
>  
> -	vp_id = kvmppc_xive_vp(xive, server_num);
> -	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> -		pr_devel("Duplicate !\n");
> -		rc = -EEXIST;
> +	rc = kvmppc_xive_compute_vp_id(xive, server_num, &vp_id);
> +	if (rc)
>  		goto bail;
> -	}
>  
>  	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
>  	if (!xc) {
> 

