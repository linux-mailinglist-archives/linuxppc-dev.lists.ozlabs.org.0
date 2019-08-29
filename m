Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1829A122C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JtkS5HYYzDrMQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JthB50yqzDrLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:56:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T6qfuf011443
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 02:56:53 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5f5xe7n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 02:56:53 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 29 Aug 2019 07:56:50 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Aug 2019 07:56:48 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T6ukH142729478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 06:56:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D3ACA405D;
 Thu, 29 Aug 2019 06:56:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB747A404D;
 Thu, 29 Aug 2019 06:56:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.124.35.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Aug 2019 06:56:44 +0000 (GMT)
Date: Thu, 29 Aug 2019 12:26:42 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
 <20190829030219.GA17497@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829030219.GA17497@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19082906-4275-0000-0000-0000035E959B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082906-4276-0000-0000-00003870CBB1
Message-Id: <20190829065642.GA31913@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290074
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
 paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 08:02:19PM -0700, Sukadev Bhattiprolu wrote:
> Some minor comments/questions below. Overall, the patches look
> fine to me.
> 
> > +#include <linux/pagemap.h>
> > +#include <linux/migrate.h>
> > +#include <linux/kvm_host.h>
> > +#include <asm/ultravisor.h>
> > +
> > +static struct dev_pagemap kvmppc_devm_pgmap;
> > +static unsigned long *kvmppc_devm_pfn_bitmap;
> > +static DEFINE_SPINLOCK(kvmppc_devm_pfn_lock);
> 
> Is this lock protecting just the pfn_bitmap?

Yes.

> 
> > +
> > +struct kvmppc_devm_page_pvt {
> > +	unsigned long *rmap;
> > +	unsigned int lpid;
> > +	unsigned long gpa;
> > +};
> > +
> > +/*
> > + * Get a free device PFN from the pool
> > + *
> > + * Called when a normal page is moved to secure memory (UV_PAGE_IN). Device
> > + * PFN will be used to keep track of the secure page on HV side.
> > + *
> > + * @rmap here is the slot in the rmap array that corresponds to @gpa.
> > + * Thus a non-zero rmap entry indicates that the corresponding guest
> > + * page has become secure, and is not mapped on the HV side.
> > + *
> > + * NOTE: In this and subsequent functions, we pass around and access
> > + * individual elements of kvm_memory_slot->arch.rmap[] without any
> > + * protection. Should we use lock_rmap() here?
> > + */
> > +static struct page *kvmppc_devm_get_page(unsigned long *rmap, unsigned long gpa,
> > +					 unsigned int lpid)
> > +{
> > +	struct page *dpage = NULL;
> > +	unsigned long bit, devm_pfn;
> > +	unsigned long flags;
> > +	struct kvmppc_devm_page_pvt *pvt;
> > +	unsigned long pfn_last, pfn_first;
> > +
> > +	if (kvmppc_rmap_is_devm_pfn(*rmap))
> > +		return NULL;
> > +
> > +	pfn_first = kvmppc_devm_pgmap.res.start >> PAGE_SHIFT;
> > +	pfn_last = pfn_first +
> > +		   (resource_size(&kvmppc_devm_pgmap.res) >> PAGE_SHIFT);
> > +	spin_lock_irqsave(&kvmppc_devm_pfn_lock, flags);
> 
> Blank lines around spin_lock() would help.

You mean blank line before lock and after unlock to clearly see
where the lock starts and ends?

> 
> > +	bit = find_first_zero_bit(kvmppc_devm_pfn_bitmap, pfn_last - pfn_first);
> > +	if (bit >= (pfn_last - pfn_first))
> > +		goto out;
> > +
> > +	bitmap_set(kvmppc_devm_pfn_bitmap, bit, 1);
> > +	devm_pfn = bit + pfn_first;
> 
> Can we drop the &kvmppc_devm_pfn_lock here or after the trylock_page()?
> Or does it also protect the ->zone_device_data' assignment below as well?
> If so, maybe drop the 'pfn_' from the name of the lock?
> 
> Besides, we don't seem to hold this lock when accessing ->zone_device_data
> in kvmppc_share_page(). Maybe &kvmppc_devm_pfn_lock just protects the bitmap?

Will move the unlock to appropriately.

> 
> 
> > +	dpage = pfn_to_page(devm_pfn);
> 
> Does this code and hence CONFIG_PPC_UV depend on a specific model like
> CONFIG_SPARSEMEM_VMEMMAP?

I don't think so. Irrespective of that pfn_to_page() should just work
for us.

> > +
> > +	if (!trylock_page(dpage))
> > +		goto out_clear;
> > +
> > +	*rmap = devm_pfn | KVMPPC_RMAP_DEVM_PFN;
> > +	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
> > +	if (!pvt)
> > +		goto out_unlock;
> > +	pvt->rmap = rmap;
> > +	pvt->gpa = gpa;
> > +	pvt->lpid = lpid;
> > +	dpage->zone_device_data = pvt;
> 
> ->zone_device_data is set after locking the dpage here, but in
> kvmppc_share_page() and kvmppc_devm_fault_migrate_alloc_and_copy()
> it is accessed without locking the page?
> 
> > +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> > +
> > +	get_page(dpage);
> > +	return dpage;
> > +
> > +out_unlock:
> > +	unlock_page(dpage);
> > +out_clear:
> > +	bitmap_clear(kvmppc_devm_pfn_bitmap, devm_pfn - pfn_first, 1);
> > +out:
> > +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> > +	return NULL;
> > +}
> > +
> > +/*
> > + * Alloc a PFN from private device memory pool and copy page from normal
> > + * memory to secure memory.
> > + */
> > +static int
> > +kvmppc_devm_migrate_alloc_and_copy(struct migrate_vma *mig,
> > +				   unsigned long *rmap, unsigned long gpa,
> > +				   unsigned int lpid, unsigned long page_shift)
> > +{
> > +	struct page *spage = migrate_pfn_to_page(*mig->src);
> > +	unsigned long pfn = *mig->src >> MIGRATE_PFN_SHIFT;
> > +	struct page *dpage;
> > +
> > +	*mig->dst = 0;
> > +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> > +		return 0;
> > +
> > +	dpage = kvmppc_devm_get_page(rmap, gpa, lpid);
> > +	if (!dpage)
> > +		return -EINVAL;
> > +
> > +	if (spage)
> > +		uv_page_in(lpid, pfn << page_shift, gpa, 0, page_shift);
> > +
> > +	*mig->dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Move page from normal memory to secure memory.
> > + */
> > +unsigned long
> > +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> > +		     unsigned long flags, unsigned long page_shift)
> > +{
> > +	unsigned long addr, end;
> > +	unsigned long src_pfn, dst_pfn;
> 
> These are the host frame numbers correct? Trying to distinguish them
> from 'gfn' and 'gpa' used in the function.

Yes host pfns.

> 
> > +	struct migrate_vma mig;
> > +	struct vm_area_struct *vma;
> > +	int srcu_idx;
> > +	unsigned long gfn = gpa >> page_shift;
> > +	struct kvm_memory_slot *slot;
> > +	unsigned long *rmap;
> > +	int ret;
> > +
> > +	if (page_shift != PAGE_SHIFT)
> > +		return H_P3;
> > +
> > +	if (flags)
> > +		return H_P2;
> > +
> > +	ret = H_PARAMETER;
> > +	down_read(&kvm->mm->mmap_sem);
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	slot = gfn_to_memslot(kvm, gfn);
> 
> Can slot be NULL? could be a bug in UV...

Will add a check to test this failure.

> 
> > +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> > +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> 
> Use 'gfn' as the second parameter? 

Yes.

> 
> Nit. for consistency with gpa and gfn, maybe rename 'addr' to
> 'hva' or to match 'end' maybe to 'start'.

Guess using hva improves readability, sure.

> 
> Also, can we check 'kvmppc_rmap_is_devm_pfn(*rmap)' here and bail out
> if its already shared? We currently do it further down the call chain
> in kvmppc_devm_get_page() after doing more work.

If the page is already shared, we just give the same back to UV if
UV indeed asks for it to be re-shared.

That said, I think we can have kvmppc_rmap_is_devm_pfn early in
regular page-in (non-shared case) path so that we don't even setup
anything required for migrate_vma_pages.

> 
> 
> > +	if (kvm_is_error_hva(addr))
> > +		goto out;
> > +
> > +	end = addr + (1UL << page_shift);
> > +	vma = find_vma_intersection(kvm->mm, addr, end);
> > +	if (!vma || vma->vm_start > addr || vma->vm_end < end)
> > +		goto out;
> > +
> > +	memset(&mig, 0, sizeof(mig));
> > +	mig.vma = vma;
> > +	mig.start = addr;
> > +	mig.end = end;
> > +	mig.src = &src_pfn;
> > +	mig.dst = &dst_pfn;
> > +
> > +	if (migrate_vma_setup(&mig))
> > +		goto out;
> > +
> > +	if (kvmppc_devm_migrate_alloc_and_copy(&mig, rmap, gpa,
> > +					       kvm->arch.lpid, page_shift))
> > +		goto out_finalize;
> > +
> > +	migrate_vma_pages(&mig);
> > +	ret = H_SUCCESS;
> > +out_finalize:
> > +	migrate_vma_finalize(&mig);
> > +out:
> > +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> > +	up_read(&kvm->mm->mmap_sem);
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Provision a new page on HV side and copy over the contents
> > + * from secure memory.
> > + */
> > +static int
> > +kvmppc_devm_fault_migrate_alloc_and_copy(struct migrate_vma *mig,
> > +					 unsigned long page_shift)
> > +{
> > +	struct page *dpage, *spage;
> > +	struct kvmppc_devm_page_pvt *pvt;
> > +	unsigned long pfn;
> > +	int ret;
> > +
> > +	spage = migrate_pfn_to_page(*mig->src);
> > +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> > +		return 0;
> > +	if (!is_zone_device_page(spage))
> > +		return 0;
> 
> What does it mean if its not a zone_device page at this point? Caller
> would then proceed to migrage_vma_pages() if we return 0 right?

kvmppc_devm_fault_migrate_alloc_and_copy() can be called from two paths:

1. Fault path when HV touches the secure page. In this case the page
has to be a device page.

2. When page-out is issued for a page that is already paged-in. In this
case also it has be a device page.

For both the above cases, that check is redundant.

There is a 3rd case which is possible. If UV ever issues a page-out
for a shared page, this check will result in page-out hcall silently
succeeding w/o doing any migration (as we don't populate the dst_pfn)

> 
> > +
> > +	dpage = alloc_page_vma(GFP_HIGHUSER, mig->vma, mig->start);
> > +	if (!dpage)
> > +		return -EINVAL;
> > +	lock_page(dpage);
> > +	pvt = spage->zone_device_data;
> > +
> > +	pfn = page_to_pfn(dpage);
> > +	ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
> > +			  page_shift);
> > +	if (ret == U_SUCCESS)
> > +		*mig->dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> > +	else {
> > +		unlock_page(dpage);
> > +		__free_page(dpage);
> > +	}
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Fault handler callback when HV touches any page that has been
> > + * moved to secure memory, we ask UV to give back the page by
> > + * issuing a UV_PAGE_OUT uvcall.
> > + *
> > + * This eventually results in dropping of device PFN and the newly
> > + * provisioned page/PFN gets populated in QEMU page tables.
> > + */
> > +static vm_fault_t kvmppc_devm_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	unsigned long src_pfn, dst_pfn = 0;
> > +	struct migrate_vma mig;
> > +	int ret = 0;
> > +
> > +	memset(&mig, 0, sizeof(mig));
> > +	mig.vma = vmf->vma;
> > +	mig.start = vmf->address;
> > +	mig.end = vmf->address + PAGE_SIZE;
> > +	mig.src = &src_pfn;
> > +	mig.dst = &dst_pfn;
> > +
> > +	if (migrate_vma_setup(&mig)) {
> > +		ret = VM_FAULT_SIGBUS;
> > +		goto out;
> > +	}
> > +
> > +	if (kvmppc_devm_fault_migrate_alloc_and_copy(&mig, PAGE_SHIFT)) {
> > +		ret = VM_FAULT_SIGBUS;
> > +		goto out_finalize;
> > +	}
> > +
> > +	migrate_vma_pages(&mig);
> > +out_finalize:
> > +	migrate_vma_finalize(&mig);
> > +out:
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Release the device PFN back to the pool
> > + *
> > + * Gets called when secure page becomes a normal page during UV_PAGE_OUT.
> 
> Nit: Should that be H_SVM_PAGE_OUT?

Yes, will reword.

> 
> > + */
> > +static void kvmppc_devm_page_free(struct page *page)
> > +{
> > +	unsigned long pfn = page_to_pfn(page);
> > +	unsigned long flags;
> > +	struct kvmppc_devm_page_pvt *pvt;
> > +
> > +	spin_lock_irqsave(&kvmppc_devm_pfn_lock, flags);
> > +	pvt = page->zone_device_data;
> > +	page->zone_device_data = NULL;
> 
> If the pfn_lock only protects the bitmap, would be better to move
> it here?

Yes.

> 
> > +
> > +	bitmap_clear(kvmppc_devm_pfn_bitmap,
> > +		     pfn - (kvmppc_devm_pgmap.res.start >> PAGE_SHIFT), 1);
> > +	*pvt->rmap = 0;
> > +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> > +	kfree(pvt);
> > +}
> > +
> > +static const struct dev_pagemap_ops kvmppc_devm_ops = {
> > +	.page_free = kvmppc_devm_page_free,
> > +	.migrate_to_ram	= kvmppc_devm_migrate_to_ram,
> > +};
> > +
> > +/*
> > + * Move page from secure memory to normal memory.
> > + */
> > +unsigned long
> > +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
> > +		      unsigned long flags, unsigned long page_shift)
> > +{
> > +	struct migrate_vma mig;
> > +	unsigned long addr, end;
> > +	struct vm_area_struct *vma;
> > +	unsigned long src_pfn, dst_pfn = 0;
> > +	int srcu_idx;
> > +	int ret;
> 
> Nit: Not sure its a coding style requirement, but many functions seem
> to "sort" these local variables in descending order of line length for
> appearance :-)  (eg: migrate_vma* functions).

It has ended up like this over multiple versions when variables got added,
moved and re-added.

> 
> > +
> > +	if (page_shift != PAGE_SHIFT)
> > +		return H_P3;
> > +
> > +	if (flags)
> > +		return H_P2;
> > +
> > +	ret = H_PARAMETER;
> > +	down_read(&kvm->mm->mmap_sem);
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> > +	if (kvm_is_error_hva(addr))
> > +		goto out;
> > +
> > +	end = addr + (1UL << page_shift);
> > +	vma = find_vma_intersection(kvm->mm, addr, end);
> > +	if (!vma || vma->vm_start > addr || vma->vm_end < end)
> > +		goto out;
> > +
> > +	memset(&mig, 0, sizeof(mig));
> > +	mig.vma = vma;
> > +	mig.start = addr;
> > +	mig.end = end;
> > +	mig.src = &src_pfn;
> > +	mig.dst = &dst_pfn;
> > +	if (migrate_vma_setup(&mig))
> > +		goto out;
> > +
> > +	ret = kvmppc_devm_fault_migrate_alloc_and_copy(&mig, page_shift);
> > +	if (ret)
> > +		goto out_finalize;
> > +
> > +	migrate_vma_pages(&mig);
> > +	ret = H_SUCCESS;
> 
> Nit: Blank line here?

With a blank like above the label line (which is blank for the most part),
it looks a bit too much of blank to me :)

However I do have blank line at a few other places. I have been removing
them whenever I touch the surrounding lines.

Thanks for your review.

Christoph - You did review this patch in the last iteration. Do you have
any additional comments?

Regards,
Bharata.

