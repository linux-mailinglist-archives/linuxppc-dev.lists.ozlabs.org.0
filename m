Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DE1ED8F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:12:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cl740lc7zDqdd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cl510TTHzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 09:10:44 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053N3IWK196366; Wed, 3 Jun 2020 19:10:36 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31c541w3ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 19:10:36 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053Msphb023229;
 Wed, 3 Jun 2020 23:10:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31bf47umcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 23:10:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 053NAVHm63701254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 23:10:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7656BAE055;
 Wed,  3 Jun 2020 23:10:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51232AE057;
 Wed,  3 Jun 2020 23:10:28 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.3.67])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Jun 2020 23:10:28 +0000 (GMT)
Date: Wed, 3 Jun 2020 16:10:25 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v1 3/4] KVM: PPC: Book3S HV: migrate remaining
 normal-GFNs to secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200603231025.GA5772@oc0525413822.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
 <1590892071-25549-4-git-send-email-linuxram@us.ibm.com>
 <20200601115518.GA31382@in.ibm.com>
 <20200601190535.GA6925@oc0525413822.ibm.com>
 <20200602100639.GB31382@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602100639.GB31382@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxlogscore=999 cotscore=-2147483648 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030172
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: rcampbell@nvidia.com, ldufour@linux.ibm.com, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 02, 2020 at 03:36:39PM +0530, Bharata B Rao wrote:
> On Mon, Jun 01, 2020 at 12:05:35PM -0700, Ram Pai wrote:
> > On Mon, Jun 01, 2020 at 05:25:18PM +0530, Bharata B Rao wrote:
> > > On Sat, May 30, 2020 at 07:27:50PM -0700, Ram Pai wrote:
> > > > H_SVM_INIT_DONE incorrectly assumes that the Ultravisor has explicitly
> > > > called H_SVM_PAGE_IN for all secure pages.
> > > 
> > > I don't think that is quite true. HV doesn't assume anything about
> > > secure pages by itself.
> > 
> > Yes. Currently, it does not assume anything about secure pages.  But I am
> > proposing that it should consider all pages (except the shared pages) as
> > secure pages, when H_SVM_INIT_DONE is called.
> 
> Ok, then may be also add the proposed changes to H_SVM_INIT_DONE
> documentation.

ok.

> 
> > 
> > In other words, HV should treat all pages; except shared pages, as
> > secure pages once H_SVM_INIT_DONE is called. And this includes pages
> > added subsequently through memory hotplug.
> 
> So after H_SVM_INIT_DONE, if HV touches a secure page for any
> reason and gets encrypted contents via page-out, HV drops the
> device pfn at that time. So what state we would be in that case? We
> have completed H_SVM_INIT_DONE, but still have a normal (but encrypted)
> page in HV?

Good point.

The corresponding GFN will continue to be a secure GFN. Just that its
backing PFN is not a device-PFN, but a memory-PFN. Also that backing
memory-PFN contains encrypted content.

I will clarify this in the patch; about secure-GFN state.

> 
> > 
> > Yes. the Ultravisor can explicitly request the HV to move the pages
> > individually.  But that will slow down the transition too significantly.
> > It takes above 20min to transition them, for a SVM of size 100G.
> > 
> > With this proposed enhancement, the switch completes in a few seconds.
> 
> I think, many pages during initial switch and most pages for hotplugged
> memory are zero pages, for which we don't anyway issue UV page-in calls.
> So the 20min saving you are observing is purely due to hcall overhead?

Apparently, that seems to be the case.

> 
> How about extending H_SVM_PAGE_IN interface or a new hcall to request
> multiple pages in one request?
> 
> Also, how about requesting for bigger page sizes (2M)? Ralph Campbell
> had patches that added THP support for migrate_vma_* calls.

yes. that should give further boost. I think the API does not stop us
from using that feature. Its the support on the Ultravisor side.
Hopefully we will have contributions to the ultravisor once it is
opensourced.

> 
> > 
> > > 
> > > > These GFNs continue to be
> > > > normal GFNs associated with normal PFNs; when infact, these GFNs should
> > > > have been secure GFNs associated with device PFNs.
> > > 
> > > Transition to secure state is driven by SVM/UV and HV just responds to
> > > hcalls by issuing appropriate uvcalls. SVM/UV is in the best position to
> > > determine the required pages that need to be moved into secure side.
> > > HV just responds to it and tracks such pages as device private pages.
> > > 
> > > If SVM/UV doesn't get in all the pages to secure side by the time
> > > of H_SVM_INIT_DONE, the remaining pages are just normal (shared or
> > > otherwise) pages as far as HV is concerned.  Why should HV assume that
> > > SVM/UV didn't ask for a few pages and hence push those pages during
> > > H_SVM_INIT_DONE?
> > 
> > By definition, SVM is a VM backed by secure pages.
> > Hence all pages(except shared) must turn secure when a VM switches to SVM.
> > 
> > UV is interested in only a certain pages for the VM, which it will
> > request explicitly through H_SVM_PAGE_IN.  All other pages, need not
> > be paged-in through UV_PAGE_IN.  They just need to be switched to
> > device-pages.
> > 
> > > 
> > > I think UV should drive the movement of pages into secure side both
> > > of boot-time SVM memory and hot-plugged memory. HV does memslot
> > > registration uvcall when new memory is plugged in, UV should explicitly
> > > get the required pages in at that time instead of expecting HV to drive
> > > the same.
> > > 
> > > > +static int uv_migrate_mem_slot(struct kvm *kvm,
> > > > +		const struct kvm_memory_slot *memslot)
> > > > +{
> > > > +	unsigned long gfn = memslot->base_gfn;
> > > > +	unsigned long end;
> > > > +	bool downgrade = false;
> > > > +	struct vm_area_struct *vma;
> > > > +	int i, ret = 0;
> > > > +	unsigned long start = gfn_to_hva(kvm, gfn);
> > > > +
> > > > +	if (kvm_is_error_hva(start))
> > > > +		return H_STATE;
> > > > +
> > > > +	end = start + (memslot->npages << PAGE_SHIFT);
> > > > +
> > > > +	down_write(&kvm->mm->mmap_sem);
> > > > +
> > > > +	mutex_lock(&kvm->arch.uvmem_lock);
> > > > +	vma = find_vma_intersection(kvm->mm, start, end);
> > > > +	if (!vma || vma->vm_start > start || vma->vm_end < end) {
> > > > +		ret = H_STATE;
> > > > +		goto out_unlock;
> > > > +	}
> > > > +
> > > > +	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > > > +			  MADV_UNMERGEABLE, &vma->vm_flags);
> > > > +	downgrade_write(&kvm->mm->mmap_sem);
> > > > +	downgrade = true;
> > > > +	if (ret) {
> > > > +		ret = H_STATE;
> > > > +		goto out_unlock;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < memslot->npages; i++, ++gfn) {
> > > > +		/* skip paged-in pages and shared pages */
> > > > +		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL) ||
> > > > +			kvmppc_gfn_is_uvmem_shared(gfn, kvm))
> > > > +			continue;
> > > > +
> > > > +		start = gfn_to_hva(kvm, gfn);
> > > > +		end = start + (1UL << PAGE_SHIFT);
> > > > +		ret = kvmppc_svm_migrate_page(vma, start, end,
> > > > +			(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
> > > > +
> > > > +		if (ret)
> > > > +			goto out_unlock;
> > > > +	}
> > > 
> > > Is there a guarantee that the vma you got for the start address remains
> > > valid for all the addresses till end in a memslot? If not, you should
> > > re-get the vma for the current address in each iteration I suppose.
> > 
> > 
> > mm->mmap_sem  is the semaphore that guards the vma. right?  If that
> > semaphore is held, can the vma change?
> 
> I am not sure if the vma you obtained would span the entire address range
> in the memslot.

will check.

Thanks,
RP
