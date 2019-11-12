Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F309F8824
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:42:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BxT44jhBzF54d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 16:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BxPD55KqzDrJw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:38:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="t7gFTQAh"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47BxPD2KHWz9sPF; Tue, 12 Nov 2019 16:38:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573537120; bh=YxgI2NrQO1fN9SK0O7nd/Xw8TdmEeaUYksXgOTKsyYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t7gFTQAhnZMZsDrZIfOpcYRXjyHw0N39ty70Py9TKQwrwhiPKuLkF72wWSqxYnWgg
 Ji9Cq02gQTiLqCvS0BTgheJ8q7C4NmhXeWIMz1vqh7MaddsWkhPr7PF91alVTS+8vr
 FMicWxglSyuv+rxWpqcMSjdP8U2t0DawgA+E55FFOIIbj3jO85UQbkmHmky+Vb4UFv
 Bb8maDKhDMBBkNPSW+42a/YvkPlYVxo2jEOgdOY85yCu2VcJE3Fyi5lPAggkb/KbnG
 2Yn0u/4uzBaCDsms/2eIpvgeM7ZP4RK+AbF43z1o9mRhYk67N5+Ek4sQBdZ+rcUYtB
 wtly9nROU6n1Q==
Date: Tue, 12 Nov 2019 16:34:34 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 6/8] KVM: PPC: Support reset of secure guest
Message-ID: <20191112053434.GA10885@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-7-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104041800.24527-7-bharata@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 09:47:58AM +0530, Bharata B Rao wrote:
[snip]
> @@ -5442,6 +5471,64 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
>  	return rc;
>  }
>  
> +/*
> + *  IOCTL handler to turn off secure mode of guest
> + *
> + * - Issue ucall to terminate the guest on the UV side
> + * - Unpin the VPA pages (Enables these pages to be migrated back
> + *   when VM becomes secure again)
> + * - Recreate partition table as the guest is transitioning back to
> + *   normal mode
> + * - Release all device pages
> + */
> +static int kvmhv_svm_off(struct kvm *kvm)
> +{
> +	struct kvm_vcpu *vcpu;
> +	int srcu_idx;
> +	int ret = 0;
> +	int i;
> +
> +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> +		return ret;
> +

A further comment on this code: it should check that no vcpus are
running and fail if any are running, and it should prevent any vcpus
from running until the function is finished, using code like that in
kvmhv_configure_mmu().  That is, it should do something like this:

	mutex_lock(&kvm->arch.mmu_setup_lock);
	mmu_was_ready = kvm->arch.mmu_ready;
	if (kvm->arch.mmu_ready) {
		kvm->arch.mmu_ready = 0;
		/* order mmu_ready vs. vcpus_running */
		smp_mb();
		if (atomic_read(&kvm->arch.vcpus_running)) {
			kvm->arch.mmu_ready = 1;
			ret = -EBUSY;
			goto out_unlock;
		}
	}

and then after clearing kvm->arch.secure_guest below:

> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		struct kvm_memory_slot *memslot;
> +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> +
> +		if (!slots)
> +			continue;
> +
> +		kvm_for_each_memslot(memslot, slots) {
> +			kvmppc_uvmem_drop_pages(memslot, kvm, true);
> +			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
> +		}
> +	}
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +
> +	ret = uv_svm_terminate(kvm->arch.lpid);
> +	if (ret != U_SUCCESS) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		spin_lock(&vcpu->arch.vpa_update_lock);
> +		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
> +		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
> +		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
> +		spin_unlock(&vcpu->arch.vpa_update_lock);
> +	}
> +
> +	ret = kvmppc_reinit_partition_table(kvm);
> +	if (ret)
> +		goto out;
> +
> +	kvm->arch.secure_guest = 0;

you need to do:

	kvm->arch.mmu_ready = mmu_was_ready;
 out_unlock:
	mutex_unlock(&kvm->arch.mmu_setup_lock);

> +out:
> +	return ret;
> +}
> +

With that extra check in place, it should be safe to unpin the vpas if
there is a good reason to do so.  ("Userspace has some bug that we
haven't found" isn't a good reason to do so.)

Paul.

