Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37289FB3C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 16:32:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CpXP4mcNzF6Vb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 02:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CpST6tNWzF5Sv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 02:29:29 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADFJqcU074937
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:29:19 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w8kbvuxpe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:29:18 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 13 Nov 2019 15:29:16 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Nov 2019 15:29:14 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xADFTCBO11862262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 15:29:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A31F9A4069;
 Wed, 13 Nov 2019 15:29:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2FCCA4040;
 Wed, 13 Nov 2019 15:29:10 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.62.84])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Nov 2019 15:29:10 +0000 (GMT)
Date: Wed, 13 Nov 2019 20:59:08 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v10 6/8] KVM: PPC: Support reset of secure guest
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-7-bharata@linux.ibm.com>
 <20191112053434.GA10885@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112053434.GA10885@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19111315-0028-0000-0000-000003B693FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111315-0029-0000-0000-000024799CBD
Message-Id: <20191113152908.GI21634@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911130142
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
Reply-To: bharata@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 04:34:34PM +1100, Paul Mackerras wrote:
> On Mon, Nov 04, 2019 at 09:47:58AM +0530, Bharata B Rao wrote:
> [snip]
> > @@ -5442,6 +5471,64 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
> >  	return rc;
> >  }
> >  
> > +/*
> > + *  IOCTL handler to turn off secure mode of guest
> > + *
> > + * - Issue ucall to terminate the guest on the UV side
> > + * - Unpin the VPA pages (Enables these pages to be migrated back
> > + *   when VM becomes secure again)
> > + * - Recreate partition table as the guest is transitioning back to
> > + *   normal mode
> > + * - Release all device pages
> > + */
> > +static int kvmhv_svm_off(struct kvm *kvm)
> > +{
> > +	struct kvm_vcpu *vcpu;
> > +	int srcu_idx;
> > +	int ret = 0;
> > +	int i;
> > +
> > +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> > +		return ret;
> > +
> 
> A further comment on this code: it should check that no vcpus are
> running and fail if any are running, and it should prevent any vcpus
> from running until the function is finished, using code like that in
> kvmhv_configure_mmu().  That is, it should do something like this:
> 
> 	mutex_lock(&kvm->arch.mmu_setup_lock);
> 	mmu_was_ready = kvm->arch.mmu_ready;
> 	if (kvm->arch.mmu_ready) {
> 		kvm->arch.mmu_ready = 0;
> 		/* order mmu_ready vs. vcpus_running */
> 		smp_mb();
> 		if (atomic_read(&kvm->arch.vcpus_running)) {
> 			kvm->arch.mmu_ready = 1;
> 			ret = -EBUSY;
> 			goto out_unlock;
> 		}
> 	}
> 
> and then after clearing kvm->arch.secure_guest below:
> 
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > +		struct kvm_memory_slot *memslot;
> > +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> > +
> > +		if (!slots)
> > +			continue;
> > +
> > +		kvm_for_each_memslot(memslot, slots) {
> > +			kvmppc_uvmem_drop_pages(memslot, kvm, true);
> > +			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
> > +		}
> > +	}
> > +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> > +
> > +	ret = uv_svm_terminate(kvm->arch.lpid);
> > +	if (ret != U_SUCCESS) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	kvm_for_each_vcpu(i, vcpu, kvm) {
> > +		spin_lock(&vcpu->arch.vpa_update_lock);
> > +		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
> > +		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
> > +		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
> > +		spin_unlock(&vcpu->arch.vpa_update_lock);
> > +	}
> > +
> > +	ret = kvmppc_reinit_partition_table(kvm);
> > +	if (ret)
> > +		goto out;
> > +
> > +	kvm->arch.secure_guest = 0;
> 
> you need to do:
> 
> 	kvm->arch.mmu_ready = mmu_was_ready;
>  out_unlock:
> 	mutex_unlock(&kvm->arch.mmu_setup_lock);
> 
> > +out:
> > +	return ret;
> > +}
> > +
> 
> With that extra check in place, it should be safe to unpin the vpas if
> there is a good reason to do so.  ("Userspace has some bug that we
> haven't found" isn't a good reason to do so.)

QEMU indeed does set_one_reg to reset the VPAs but that only marks
the VPA update as pending. The actual unpinning happens when vcpu
gets to run after reset at which time the VPAs are updated after
any unpinning (if required)

When secure guest reboots, vpu 0 gets to run and does unpin its
VPA pages and then proceeds with switching to secure. Here UV
tries to page-in all the guest pages, including the still pinned
VPA pages corresponding to other vcpus which haven't had a chance
to run till now. They are all still pinned and hence page-in fails.

To prevent this, we have to explicitly unpin the VPA pages during
this svm off ioctl. This will ensure that SMP secure guest is able
to reboot correctly.

So I will incorporate the code chunk you have shown above to fail
if any vcpu is running and prevent any vcpu from running when
we unpin VPAs from this ioctl.

Regards,
Bharata.

