Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69527BB92D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 18:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTnx43VhzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 02:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.136; helo=1.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo6.mail-out.ovh.net (1.mo6.mail-out.ovh.net [46.105.56.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTlD3MPtzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:08:36 +1000 (AEST)
Received: from player158.ha.ovh.net (unknown [10.109.143.238])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1BAD91E26F5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 17:52:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 5974BA07B859;
 Mon, 23 Sep 2019 15:52:22 +0000 (UTC)
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in
 use
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925342885.974393.4930571278578115883.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2f772bd3-8ebe-214d-1d89-31eeb59df456@kaod.org>
Date: Mon, 23 Sep 2019 17:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <156925342885.974393.4930571278578115883.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16879491406414777277
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
 kvm-ppc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/09/2019 17:43, Greg Kurz wrote:
> We currently prevent userspace to connect a new vCPU if we already have
> one with the same vCPU id. This is good but unfortunately not enough,
> because VP ids derive from the packed vCPU ids, and kvmppc_pack_vcpu_id()
> can return colliding values. For examples, 348 stays unchanged since it
> is < KVM_MAX_VCPUS, but it is also the packed value of 2392 when the
> guest's core stride is 8. Nothing currently prevents userspace to connect
> vCPUs with forged ids, that end up being associated to the same VP. This
> confuses the irq layer and likely crashes the kernel:
> 
> [96631.670454] genirq: Flags mismatch irq 4161. 00010000 (kvm-1-2392) vs. 00010000 (kvm-1-348)
> 
> Check the VP id instead of the vCPU id when a new vCPU is connected.
> The allocation of the XIVE CPU structure in kvmppc_xive_connect_vcpu()
> is moved after the check to avoid the need for rollback.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.


> ---
>  arch/powerpc/kvm/book3s_xive.c        |   24 ++++++++++++++++--------
>  arch/powerpc/kvm/book3s_xive.h        |   12 ++++++++++++
>  arch/powerpc/kvm/book3s_xive_native.c |    6 ++++--
>  3 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 2ef43d037a4f..01bff7befc9f 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1217,6 +1217,7 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  	struct kvmppc_xive *xive = dev->private;
>  	struct kvmppc_xive_vcpu *xc;
>  	int i, r = -EBUSY;
> +	u32 vp_id;
>  
>  	pr_devel("connect_vcpu(cpu=%d)\n", cpu);
>  
> @@ -1228,25 +1229,32 @@ int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
>  		return -EPERM;
>  	if (vcpu->arch.irq_type != KVMPPC_IRQ_DEFAULT)
>  		return -EBUSY;
> -	if (kvmppc_xive_find_server(vcpu->kvm, cpu)) {
> -		pr_devel("Duplicate !\n");
> -		return -EEXIST;
> -	}
>  	if (cpu >= (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
>  		pr_devel("Out of bounds !\n");
>  		return -EINVAL;
>  	}
> -	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
> -	if (!xc)
> -		return -ENOMEM;
>  
>  	/* We need to synchronize with queue provisioning */
>  	mutex_lock(&xive->lock);
> +
> +	vp_id = kvmppc_xive_vp(xive, cpu);
> +	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> +		pr_devel("Duplicate !\n");
> +		r = -EEXIST;
> +		goto bail;
> +	}
> +
> +	xc = kzalloc(sizeof(*xc), GFP_KERNEL);
> +	if (!xc) {
> +		r = -ENOMEM;
> +		goto bail;
> +	}
> +
>  	vcpu->arch.xive_vcpu = xc;
>  	xc->xive = xive;
>  	xc->vcpu = vcpu;
>  	xc->server_num = cpu;
> -	xc->vp_id = kvmppc_xive_vp(xive, cpu);
> +	xc->vp_id = vp_id;
>  	xc->mfrr = 0xff;
>  	xc->valid = true;
>  
> diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
> index 955b820ffd6d..fe3ed50e0818 100644
> --- a/arch/powerpc/kvm/book3s_xive.h
> +++ b/arch/powerpc/kvm/book3s_xive.h
> @@ -220,6 +220,18 @@ static inline u32 kvmppc_xive_vp(struct kvmppc_xive *xive, u32 server)
>  	return xive->vp_base + kvmppc_pack_vcpu_id(xive->kvm, server);
>  }
>  
> +static inline bool kvmppc_xive_vp_in_use(struct kvm *kvm, u32 vp_id)
> +{
> +	struct kvm_vcpu *vcpu = NULL;
> +	int i;
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		if (vcpu->arch.xive_vcpu && vp_id == vcpu->arch.xive_vcpu->vp_id)
> +			return true;
> +	}
> +	return false;
> +}
> +
>  /*
>   * Mapping between guest priorities and host priorities
>   * is as follow.
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 84a354b90f60..53a22771908c 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -106,6 +106,7 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  	struct kvmppc_xive *xive = dev->private;
>  	struct kvmppc_xive_vcpu *xc = NULL;
>  	int rc;
> +	u32 vp_id;
>  
>  	pr_devel("native_connect_vcpu(server=%d)\n", server_num);
>  
> @@ -124,7 +125,8 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  
>  	mutex_lock(&xive->lock);
>  
> -	if (kvmppc_xive_find_server(vcpu->kvm, server_num)) {
> +	vp_id = kvmppc_xive_vp(xive, server_num);
> +	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
>  		pr_devel("Duplicate !\n");
>  		rc = -EEXIST;
>  		goto bail;
> @@ -141,7 +143,7 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
>  	xc->vcpu = vcpu;
>  	xc->server_num = server_num;
>  
> -	xc->vp_id = kvmppc_xive_vp(xive, server_num);
> +	xc->vp_id = vp_id;
>  	xc->valid = true;
>  	vcpu->arch.irq_type = KVMPPC_IRQ_XIVE;
>  
> 

