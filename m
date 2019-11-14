Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.auug.org.au [203.11.71.3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B998FBEFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:10:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8gb6mhVzF3Sy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8dS1gTVzF71c
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="BqT3vL+O"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47D8dR2cqzz9sNT; Thu, 14 Nov 2019 16:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573708107; bh=p6shdsFGA+Mt3rC6QY+JMFnpJ9Vvy/PGW13T7kQhVR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqT3vL+OGTmVG6XcYOfXIpYiUGAB6LUw9xl8knY5g0RdwHx30L63ZNHk/kZWUgD4p
 J78EBD2MyFT1VED9gkZBYsgZWC+w7+ZREdpYYwUAIKxerBCRXFgqurYysFjkZeeVI7
 08jKM0dD44HBrVqwGsuV/f7V3iMP8I99eW0WDLzgvdVQdPwNksLrN+QYE/3ISBMPPQ
 9+9opeM+Uj4C18nJgb5h4oNSmqTYo+CGI3G0vxy/fmnnF677FIGIzJYVMkmbQQN1hf
 fVorjDiCin49KFVIQ8nvBBM7Xlq40hwfYw+bRCQpTnl0g0/6ScnhYux315VHTK2pyX
 BhU5b88eC4kTQ==
Date: Thu, 14 Nov 2019 16:07:38 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 6/8] KVM: PPC: Support reset of secure guest
Message-ID: <20191114050738.GA28382@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-7-bharata@linux.ibm.com>
 <20191112053434.GA10885@oak.ozlabs.ibm.com>
 <20191113152908.GI21634@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113152908.GI21634@in.ibm.com>
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

On Wed, Nov 13, 2019 at 08:59:08PM +0530, Bharata B Rao wrote:
> On Tue, Nov 12, 2019 at 04:34:34PM +1100, Paul Mackerras wrote:
> > On Mon, Nov 04, 2019 at 09:47:58AM +0530, Bharata B Rao wrote:
> > [snip]
> > > @@ -5442,6 +5471,64 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
> > >  	return rc;
> > >  }
> > >  
> > > +/*
> > > + *  IOCTL handler to turn off secure mode of guest
> > > + *
> > > + * - Issue ucall to terminate the guest on the UV side
> > > + * - Unpin the VPA pages (Enables these pages to be migrated back
> > > + *   when VM becomes secure again)
> > > + * - Recreate partition table as the guest is transitioning back to
> > > + *   normal mode
> > > + * - Release all device pages
> > > + */
> > > +static int kvmhv_svm_off(struct kvm *kvm)
> > > +{
> > > +	struct kvm_vcpu *vcpu;
> > > +	int srcu_idx;
> > > +	int ret = 0;
> > > +	int i;
> > > +
> > > +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> > > +		return ret;
> > > +
> > 
> > A further comment on this code: it should check that no vcpus are
> > running and fail if any are running, and it should prevent any vcpus
> > from running until the function is finished, using code like that in
> > kvmhv_configure_mmu().  That is, it should do something like this:
> > 
> > 	mutex_lock(&kvm->arch.mmu_setup_lock);
> > 	mmu_was_ready = kvm->arch.mmu_ready;
> > 	if (kvm->arch.mmu_ready) {
> > 		kvm->arch.mmu_ready = 0;
> > 		/* order mmu_ready vs. vcpus_running */
> > 		smp_mb();
> > 		if (atomic_read(&kvm->arch.vcpus_running)) {
> > 			kvm->arch.mmu_ready = 1;
> > 			ret = -EBUSY;
> > 			goto out_unlock;
> > 		}
> > 	}
> > 
> > and then after clearing kvm->arch.secure_guest below:
> > 
> > > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > > +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > > +		struct kvm_memory_slot *memslot;
> > > +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> > > +
> > > +		if (!slots)
> > > +			continue;
> > > +
> > > +		kvm_for_each_memslot(memslot, slots) {
> > > +			kvmppc_uvmem_drop_pages(memslot, kvm, true);
> > > +			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
> > > +		}
> > > +	}
> > > +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> > > +
> > > +	ret = uv_svm_terminate(kvm->arch.lpid);
> > > +	if (ret != U_SUCCESS) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	kvm_for_each_vcpu(i, vcpu, kvm) {
> > > +		spin_lock(&vcpu->arch.vpa_update_lock);
> > > +		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
> > > +		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
> > > +		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
> > > +		spin_unlock(&vcpu->arch.vpa_update_lock);
> > > +	}
> > > +
> > > +	ret = kvmppc_reinit_partition_table(kvm);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	kvm->arch.secure_guest = 0;
> > 
> > you need to do:
> > 
> > 	kvm->arch.mmu_ready = mmu_was_ready;
> >  out_unlock:
> > 	mutex_unlock(&kvm->arch.mmu_setup_lock);
> > 
> > > +out:
> > > +	return ret;
> > > +}
> > > +
> > 
> > With that extra check in place, it should be safe to unpin the vpas if
> > there is a good reason to do so.  ("Userspace has some bug that we
> > haven't found" isn't a good reason to do so.)
> 
> QEMU indeed does set_one_reg to reset the VPAs but that only marks
> the VPA update as pending. The actual unpinning happens when vcpu
> gets to run after reset at which time the VPAs are updated after
> any unpinning (if required)
> 
> When secure guest reboots, vpu 0 gets to run and does unpin its
> VPA pages and then proceeds with switching to secure. Here UV
> tries to page-in all the guest pages, including the still pinned
> VPA pages corresponding to other vcpus which haven't had a chance
> to run till now. They are all still pinned and hence page-in fails.
> 
> To prevent this, we have to explicitly unpin the VPA pages during
> this svm off ioctl. This will ensure that SMP secure guest is able
> to reboot correctly.

OK, that makes sense.  Please put a comment in the code explaining
this briefly.

> So I will incorporate the code chunk you have shown above to fail
> if any vcpu is running and prevent any vcpu from running when
> we unpin VPAs from this ioctl.

Sounds good.

Paul.
