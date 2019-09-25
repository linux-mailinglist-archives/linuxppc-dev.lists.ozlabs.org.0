Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9DBDA2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 10:49:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dWvV4XKdzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 18:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.75.26; helo=8.mo179.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 75442 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 18:47:38 AEST
Received: from 8.mo179.mail-out.ovh.net (8.mo179.mail-out.ovh.net
 [46.105.75.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dWsQ6W1WzDqjZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 18:47:35 +1000 (AEST)
Received: from player732.ha.ovh.net (unknown [10.108.35.185])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 438AC143800
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 10:47:31 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 27BE5A1841BF;
 Wed, 25 Sep 2019 08:47:20 +0000 (UTC)
Date: Wed, 25 Sep 2019 10:47:18 +0200
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 5/6] KVM: PPC: Book3S HV: XIVE: Make VP block size
 configurable
Message-ID: <20190925104718.67a46fbb@bahia.lan>
In-Reply-To: <156925344032.974393.7608316579545874447.stgit@bahia.lan>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925344032.974393.7608316579545874447.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2999960302418762171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Sep 2019 17:44:00 +0200
Greg Kurz <groug@kaod.org> wrote:

> The XIVE VP is an internal structure which allow the XIVE interrupt
> controller to maintain the interrupt context state of vCPUs non
> dispatched on HW threads.
> 
> When a guest is started, the XIVE KVM device allocates a block of
> XIVE VPs in OPAL, enough to accommodate the highest possible vCPU
> id KVM_MAX_VCPU_ID (16384) packed down to KVM_MAX_VCPUS (2048).
> With a guest's core stride of 8 and a threading mode of 1 (QEMU's
> default), a VM must run at least 256 vCPUs to actually need such a
> range of VPs.
> 
> A POWER9 system has a limited XIVE VP space : 512k and KVM is
> currently wasting this HW resource with large VP allocations,
> especially since a typical VM likely runs with a lot less vCPUs.
> 
> Make the size of the VP block configurable. Add an nr_servers
> field to the XIVE structure and a function to set it for this
> purpose.
> 
> Split VP allocation out of the device create function. Since the
> VP block isn't used before the first vCPU connects to the XIVE KVM
> device, allocation is now performed by kvmppc_xive_connect_vcpu().
> This gives the opportunity to set nr_servers in between:
> 
>           kvmppc_xive_create() / kvmppc_xive_native_create()
>                                .
>                                .
>                      kvmppc_xive_set_nr_servers()
>                                .
>                                .
>     kvmppc_xive_connect_vcpu() / kvmppc_xive_native_connect_vcpu()
> 
> The connect_vcpu() functions check that the vCPU id is below nr_servers
> and if it is the first vCPU they allocate the VP block. This is protected
> against a concurrent update of nr_servers by kvmppc_xive_set_nr_servers()
> with the xive->lock mutex.
> 
> Also, the block is allocated once for the device lifetime: nr_servers
> should stay constant otherwise connect_vcpu() could generate a boggus
> VP id and likely crash OPAL. It is thus forbidden to update nr_servers
> once the block is allocated.
> 
> If the VP allocation fail, return ENOSPC which seems more appropriate to
> report the depletion of system wide HW resource than ENOMEM or ENXIO.
> 
> A VM using a stride of 8 and 1 thread per core with 32 vCPUs would hence
> only need 256 VPs instead of 2048. If the stride is set to match the number
> of threads per core, this goes further down to 32.
> 
> This will be exposed to userspace by a subsequent patch.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  arch/powerpc/kvm/book3s_xive.c        |   59 ++++++++++++++++++++++++++-------
>  arch/powerpc/kvm/book3s_xive.h        |    4 ++
>  arch/powerpc/kvm/book3s_xive_native.c |   18 +++-------
>  3 files changed, 56 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 9ac6315fb9ae..4a333dcfddd8 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1213,13 +1213,13 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
>  
>  static bool kvmppc_xive_vcpu_id_valid(struct kvmppc_xive *xive, u32 cpu)
>  {
> -	/* We have a block of KVM_MAX_VCPUS VPs. We just need to check
> +	/* We have a block of xive->nr_servers VPs. We just need to check
>  	 * raw vCPU ids are below the expected limit for this guest's
>  	 * core stride ; kvmppc_pack_vcpu_id() will pack them down to an
>  	 * index that can be safely used to compute a VP id that belongs
>  	 * to the VP block.
>  	 */
> -	return cpu < KVM_MAX_VCPUS * xive->kvm->arch.emul_smt_mode;
> +	return cpu < xive->nr_servers * xive->kvm->arch.emul_smt_mode;
>  }
>  
>  int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp)
> @@ -1231,6 +1231,14 @@ int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp)
>  		return -EINVAL;
>  	}
>  
> +	if (xive->vp_base == XIVE_INVALID_VP) {
> +		xive->vp_base = xive_native_alloc_vp_block(xive->nr_servers);
> +		pr_devel("VP_Base=%x nr_servers=%d\n", xive->vp_base, xive->nr_servers);
> +
> +		if (xive->vp_base == XIVE_INVALID_VP)
> +			return -ENOSPC;
> +	}
> +
>  	vp_id = kvmppc_xive_vp(xive, cpu);
>  	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
>  		pr_devel("Duplicate !\n");
> @@ -1858,6 +1866,37 @@ int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq, int level,
>  	return 0;
>  }
>  
> +int kvmppc_xive_set_nr_servers(struct kvmppc_xive *xive, u64 addr)
> +{
> +	u32 __user *ubufp = (u32 __user *) addr;
> +	u32 nr_servers;
> +	int rc = 0;
> +
> +	if (get_user(nr_servers, ubufp))
> +		return -EFAULT;
> +
> +	pr_devel("%s nr_servers=%u\n", __func__, nr_servers);
> +
> +	if (nr_servers > KVM_MAX_VCPUS)

Drat, this is wrong since QEMU can generate higher vCPU ids (which
is why we need to pack them in the first place). We should check
against KVM_MAX_VCPU_ID here...

> +		return -EINVAL;
> +
> +	mutex_lock(&xive->lock);
> +	/* The VP block is allocated once and freed when the device is
> +	 * released. Better not allow to change its size since its used
> +	 * by connect_vcpu to validate vCPU ids are valid (eg, setting
> +	 * it back to a higher value could allow connect_vcpu to come
> +	 * up with a VP id that goes beyond the VP block, which is likely
> +	 * to cause a crash in OPAL).
> +	 */
> +	if (xive->vp_base != XIVE_INVALID_VP)
> +		rc = -EBUSY;
> +	else
> +		xive->nr_servers = nr_servers;

... and clip down to KVM_MAX_VCPUS here.

I'll fix this in v2.

> +	mutex_unlock(&xive->lock);
> +
> +	return rc;
> +}
> +
>  static int xive_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>  {
>  	struct kvmppc_xive *xive = dev->private;
> @@ -2034,7 +2073,6 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  {
>  	struct kvmppc_xive *xive;
>  	struct kvm *kvm = dev->kvm;
> -	int ret = 0;
>  
>  	pr_devel("Creating xive for partition\n");
>  
> @@ -2057,18 +2095,15 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  	else
>  		xive->q_page_order = xive->q_order - PAGE_SHIFT;
>  
> -	/* Allocate a bunch of VPs */
> -	xive->vp_base = xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> -	pr_devel("VP_Base=%x\n", xive->vp_base);
> -
> -	if (xive->vp_base == XIVE_INVALID_VP)
> -		ret = -ENOMEM;
> +	/* VP allocation is delayed to the first call to connect_vcpu */
> +	xive->vp_base = XIVE_INVALID_VP;
> +	/* KVM_MAX_VCPUS limits the number of VMs to roughly 64 per sockets
> +	 * on a POWER9 system.
> +	 */
> +	xive->nr_servers = KVM_MAX_VCPUS;
>  
>  	xive->single_escalation = xive_native_has_single_escalation();
>  
> -	if (ret)
> -		return ret;
> -
>  	dev->private = xive;
>  	kvm->arch.xive = xive;
>  	return 0;
> diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
> index 90cf6ec35a68..382e3a56e789 100644
> --- a/arch/powerpc/kvm/book3s_xive.h
> +++ b/arch/powerpc/kvm/book3s_xive.h
> @@ -135,6 +135,9 @@ struct kvmppc_xive {
>  	/* Flags */
>  	u8	single_escalation;
>  
> +	/* Number of entries in the VP block */
> +	u32	nr_servers;
> +
>  	struct kvmppc_xive_ops *ops;
>  	struct address_space   *mapping;
>  	struct mutex mapping_lock;
> @@ -297,6 +300,7 @@ struct kvmppc_xive *kvmppc_xive_get_device(struct kvm *kvm, u32 type);
>  void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
>  				    struct kvmppc_xive_vcpu *xc, int irq);
>  int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp);
> +int kvmppc_xive_set_nr_servers(struct kvmppc_xive *xive, u64 addr);
>  
>  #endif /* CONFIG_KVM_XICS */
>  #endif /* _KVM_PPC_BOOK3S_XICS_H */
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 6902319c5ee9..5e18364d52a9 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1069,7 +1069,6 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
>  {
>  	struct kvmppc_xive *xive;
>  	struct kvm *kvm = dev->kvm;
> -	int ret = 0;
>  
>  	pr_devel("Creating xive native device\n");
>  
> @@ -1085,23 +1084,16 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
>  	mutex_init(&xive->mapping_lock);
>  	mutex_init(&xive->lock);
>  
> -	/*
> -	 * Allocate a bunch of VPs. KVM_MAX_VCPUS is a large value for
> -	 * a default. Getting the max number of CPUs the VM was
> -	 * configured with would improve our usage of the XIVE VP space.
> +	/* VP allocation is delayed to the first call to connect_vcpu */
> +	xive->vp_base = XIVE_INVALID_VP;
> +	/* KVM_MAX_VCPUS limits the number of VMs to roughly 64 per sockets
> +	 * on a POWER9 system.
>  	 */
> -	xive->vp_base = xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> -	pr_devel("VP_Base=%x\n", xive->vp_base);
> -
> -	if (xive->vp_base == XIVE_INVALID_VP)
> -		ret = -ENXIO;
> +	xive->nr_servers = KVM_MAX_VCPUS;
>  
>  	xive->single_escalation = xive_native_has_single_escalation();
>  	xive->ops = &kvmppc_xive_native_ops;
>  
> -	if (ret)
> -		return ret;
> -
>  	dev->private = xive;
>  	kvm->arch.xive = xive;
>  	return 0;
> 

