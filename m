Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92AA0FC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 05:04:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JnWX26NGzDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 13:04:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sukadev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JnTt3B4HzDr7q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 13:02:34 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T32PGp103937; Wed, 28 Aug 2019 23:02:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5busgbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:02:26 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7T32P1e103970;
 Wed, 28 Aug 2019 23:02:25 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5busgar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:02:25 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7T30sTe008887;
 Thu, 29 Aug 2019 03:02:23 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2umpctnxxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 03:02:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T32L9i46137752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 03:02:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89DAFBE056;
 Thu, 29 Aug 2019 03:02:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 656ACBE053;
 Thu, 29 Aug 2019 03:02:21 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 03:02:21 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id B70132E10CF; Wed, 28 Aug 2019 20:02:19 -0700 (PDT)
Date: Wed, 28 Aug 2019 20:02:19 -0700
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
Message-ID: <20190829030219.GA17497@us.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822102620.21897-2-bharata@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290032
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
 paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some minor comments/questions below. Overall, the patches look
fine to me.

> +#include <linux/pagemap.h>
> +#include <linux/migrate.h>
> +#include <linux/kvm_host.h>
> +#include <asm/ultravisor.h>
> +
> +static struct dev_pagemap kvmppc_devm_pgmap;
> +static unsigned long *kvmppc_devm_pfn_bitmap;
> +static DEFINE_SPINLOCK(kvmppc_devm_pfn_lock);

Is this lock protecting just the pfn_bitmap?

> +
> +struct kvmppc_devm_page_pvt {
> +	unsigned long *rmap;
> +	unsigned int lpid;
> +	unsigned long gpa;
> +};
> +
> +/*
> + * Get a free device PFN from the pool
> + *
> + * Called when a normal page is moved to secure memory (UV_PAGE_IN). Device
> + * PFN will be used to keep track of the secure page on HV side.
> + *
> + * @rmap here is the slot in the rmap array that corresponds to @gpa.
> + * Thus a non-zero rmap entry indicates that the corresponding guest
> + * page has become secure, and is not mapped on the HV side.
> + *
> + * NOTE: In this and subsequent functions, we pass around and access
> + * individual elements of kvm_memory_slot->arch.rmap[] without any
> + * protection. Should we use lock_rmap() here?
> + */
> +static struct page *kvmppc_devm_get_page(unsigned long *rmap, unsigned long gpa,
> +					 unsigned int lpid)
> +{
> +	struct page *dpage = NULL;
> +	unsigned long bit, devm_pfn;
> +	unsigned long flags;
> +	struct kvmppc_devm_page_pvt *pvt;
> +	unsigned long pfn_last, pfn_first;
> +
> +	if (kvmppc_rmap_is_devm_pfn(*rmap))
> +		return NULL;
> +
> +	pfn_first = kvmppc_devm_pgmap.res.start >> PAGE_SHIFT;
> +	pfn_last = pfn_first +
> +		   (resource_size(&kvmppc_devm_pgmap.res) >> PAGE_SHIFT);
> +	spin_lock_irqsave(&kvmppc_devm_pfn_lock, flags);

Blank lines around spin_lock() would help.

> +	bit = find_first_zero_bit(kvmppc_devm_pfn_bitmap, pfn_last - pfn_first);
> +	if (bit >= (pfn_last - pfn_first))
> +		goto out;
> +
> +	bitmap_set(kvmppc_devm_pfn_bitmap, bit, 1);
> +	devm_pfn = bit + pfn_first;

Can we drop the &kvmppc_devm_pfn_lock here or after the trylock_page()?
Or does it also protect the ->zone_device_data' assignment below as well?
If so, maybe drop the 'pfn_' from the name of the lock?

Besides, we don't seem to hold this lock when accessing ->zone_device_data
in kvmppc_share_page(). Maybe &kvmppc_devm_pfn_lock just protects the bitmap?


> +	dpage = pfn_to_page(devm_pfn);

Does this code and hence CONFIG_PPC_UV depend on a specific model like
CONFIG_SPARSEMEM_VMEMMAP?
> +
> +	if (!trylock_page(dpage))
> +		goto out_clear;
> +
> +	*rmap = devm_pfn | KVMPPC_RMAP_DEVM_PFN;
> +	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
> +	if (!pvt)
> +		goto out_unlock;
> +	pvt->rmap = rmap;
> +	pvt->gpa = gpa;
> +	pvt->lpid = lpid;
> +	dpage->zone_device_data = pvt;

->zone_device_data is set after locking the dpage here, but in
kvmppc_share_page() and kvmppc_devm_fault_migrate_alloc_and_copy()
it is accessed without locking the page?

> +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> +
> +	get_page(dpage);
> +	return dpage;
> +
> +out_unlock:
> +	unlock_page(dpage);
> +out_clear:
> +	bitmap_clear(kvmppc_devm_pfn_bitmap, devm_pfn - pfn_first, 1);
> +out:
> +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> +	return NULL;
> +}
> +
> +/*
> + * Alloc a PFN from private device memory pool and copy page from normal
> + * memory to secure memory.
> + */
> +static int
> +kvmppc_devm_migrate_alloc_and_copy(struct migrate_vma *mig,
> +				   unsigned long *rmap, unsigned long gpa,
> +				   unsigned int lpid, unsigned long page_shift)
> +{
> +	struct page *spage = migrate_pfn_to_page(*mig->src);
> +	unsigned long pfn = *mig->src >> MIGRATE_PFN_SHIFT;
> +	struct page *dpage;
> +
> +	*mig->dst = 0;
> +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> +		return 0;
> +
> +	dpage = kvmppc_devm_get_page(rmap, gpa, lpid);
> +	if (!dpage)
> +		return -EINVAL;
> +
> +	if (spage)
> +		uv_page_in(lpid, pfn << page_shift, gpa, 0, page_shift);
> +
> +	*mig->dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	return 0;
> +}
> +
> +/*
> + * Move page from normal memory to secure memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> +		     unsigned long flags, unsigned long page_shift)
> +{
> +	unsigned long addr, end;
> +	unsigned long src_pfn, dst_pfn;

These are the host frame numbers correct? Trying to distinguish them
from 'gfn' and 'gpa' used in the function.

> +	struct migrate_vma mig;
> +	struct vm_area_struct *vma;
> +	int srcu_idx;
> +	unsigned long gfn = gpa >> page_shift;
> +	struct kvm_memory_slot *slot;
> +	unsigned long *rmap;
> +	int ret;
> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	if (flags)
> +		return H_P2;
> +
> +	ret = H_PARAMETER;
> +	down_read(&kvm->mm->mmap_sem);
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slot = gfn_to_memslot(kvm, gfn);

Can slot be NULL? could be a bug in UV...

> +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);

Use 'gfn' as the second parameter? 

Nit. for consistency with gpa and gfn, maybe rename 'addr' to
'hva' or to match 'end' maybe to 'start'.

Also, can we check 'kvmppc_rmap_is_devm_pfn(*rmap)' here and bail out
if its already shared? We currently do it further down the call chain
in kvmppc_devm_get_page() after doing more work.


> +	if (kvm_is_error_hva(addr))
> +		goto out;
> +
> +	end = addr + (1UL << page_shift);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end)
> +		goto out;
> +
> +	memset(&mig, 0, sizeof(mig));
> +	mig.vma = vma;
> +	mig.start = addr;
> +	mig.end = end;
> +	mig.src = &src_pfn;
> +	mig.dst = &dst_pfn;
> +
> +	if (migrate_vma_setup(&mig))
> +		goto out;
> +
> +	if (kvmppc_devm_migrate_alloc_and_copy(&mig, rmap, gpa,
> +					       kvm->arch.lpid, page_shift))
> +		goto out_finalize;
> +
> +	migrate_vma_pages(&mig);
> +	ret = H_SUCCESS;
> +out_finalize:
> +	migrate_vma_finalize(&mig);
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +
> +/*
> + * Provision a new page on HV side and copy over the contents
> + * from secure memory.
> + */
> +static int
> +kvmppc_devm_fault_migrate_alloc_and_copy(struct migrate_vma *mig,
> +					 unsigned long page_shift)
> +{
> +	struct page *dpage, *spage;
> +	struct kvmppc_devm_page_pvt *pvt;
> +	unsigned long pfn;
> +	int ret;
> +
> +	spage = migrate_pfn_to_page(*mig->src);
> +	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> +		return 0;
> +	if (!is_zone_device_page(spage))
> +		return 0;

What does it mean if its not a zone_device page at this point? Caller
would then proceed to migrage_vma_pages() if we return 0 right?

> +
> +	dpage = alloc_page_vma(GFP_HIGHUSER, mig->vma, mig->start);
> +	if (!dpage)
> +		return -EINVAL;
> +	lock_page(dpage);
> +	pvt = spage->zone_device_data;
> +
> +	pfn = page_to_pfn(dpage);
> +	ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
> +			  page_shift);
> +	if (ret == U_SUCCESS)
> +		*mig->dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> +	else {
> +		unlock_page(dpage);
> +		__free_page(dpage);
> +	}
> +	return ret;
> +}
> +
> +/*
> + * Fault handler callback when HV touches any page that has been
> + * moved to secure memory, we ask UV to give back the page by
> + * issuing a UV_PAGE_OUT uvcall.
> + *
> + * This eventually results in dropping of device PFN and the newly
> + * provisioned page/PFN gets populated in QEMU page tables.
> + */
> +static vm_fault_t kvmppc_devm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	unsigned long src_pfn, dst_pfn = 0;
> +	struct migrate_vma mig;
> +	int ret = 0;
> +
> +	memset(&mig, 0, sizeof(mig));
> +	mig.vma = vmf->vma;
> +	mig.start = vmf->address;
> +	mig.end = vmf->address + PAGE_SIZE;
> +	mig.src = &src_pfn;
> +	mig.dst = &dst_pfn;
> +
> +	if (migrate_vma_setup(&mig)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out;
> +	}
> +
> +	if (kvmppc_devm_fault_migrate_alloc_and_copy(&mig, PAGE_SHIFT)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_finalize;
> +	}
> +
> +	migrate_vma_pages(&mig);
> +out_finalize:
> +	migrate_vma_finalize(&mig);
> +out:
> +	return ret;
> +}
> +
> +/*
> + * Release the device PFN back to the pool
> + *
> + * Gets called when secure page becomes a normal page during UV_PAGE_OUT.

Nit: Should that be H_SVM_PAGE_OUT?

> + */
> +static void kvmppc_devm_page_free(struct page *page)
> +{
> +	unsigned long pfn = page_to_pfn(page);
> +	unsigned long flags;
> +	struct kvmppc_devm_page_pvt *pvt;
> +
> +	spin_lock_irqsave(&kvmppc_devm_pfn_lock, flags);
> +	pvt = page->zone_device_data;
> +	page->zone_device_data = NULL;

If the pfn_lock only protects the bitmap, would be better to move
it here?

> +
> +	bitmap_clear(kvmppc_devm_pfn_bitmap,
> +		     pfn - (kvmppc_devm_pgmap.res.start >> PAGE_SHIFT), 1);
> +	*pvt->rmap = 0;
> +	spin_unlock_irqrestore(&kvmppc_devm_pfn_lock, flags);
> +	kfree(pvt);
> +}
> +
> +static const struct dev_pagemap_ops kvmppc_devm_ops = {
> +	.page_free = kvmppc_devm_page_free,
> +	.migrate_to_ram	= kvmppc_devm_migrate_to_ram,
> +};
> +
> +/*
> + * Move page from secure memory to normal memory.
> + */
> +unsigned long
> +kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
> +		      unsigned long flags, unsigned long page_shift)
> +{
> +	struct migrate_vma mig;
> +	unsigned long addr, end;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfn, dst_pfn = 0;
> +	int srcu_idx;
> +	int ret;

Nit: Not sure its a coding style requirement, but many functions seem
to "sort" these local variables in descending order of line length for
appearance :-)  (eg: migrate_vma* functions).

> +
> +	if (page_shift != PAGE_SHIFT)
> +		return H_P3;
> +
> +	if (flags)
> +		return H_P2;
> +
> +	ret = H_PARAMETER;
> +	down_read(&kvm->mm->mmap_sem);
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	addr = gfn_to_hva(kvm, gpa >> page_shift);
> +	if (kvm_is_error_hva(addr))
> +		goto out;
> +
> +	end = addr + (1UL << page_shift);
> +	vma = find_vma_intersection(kvm->mm, addr, end);
> +	if (!vma || vma->vm_start > addr || vma->vm_end < end)
> +		goto out;
> +
> +	memset(&mig, 0, sizeof(mig));
> +	mig.vma = vma;
> +	mig.start = addr;
> +	mig.end = end;
> +	mig.src = &src_pfn;
> +	mig.dst = &dst_pfn;
> +	if (migrate_vma_setup(&mig))
> +		goto out;
> +
> +	ret = kvmppc_devm_fault_migrate_alloc_and_copy(&mig, page_shift);
> +	if (ret)
> +		goto out_finalize;
> +
> +	migrate_vma_pages(&mig);
> +	ret = H_SUCCESS;

Nit: Blank line here?

> +out_finalize:
> +	migrate_vma_finalize(&mig);
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	up_read(&kvm->mm->mmap_sem);
> +	return ret;
> +}
> +
> +static u64 kvmppc_get_secmem_size(void)
> +{
> +	struct device_node *np;
> +	int i, len;
> +	const __be32 *prop;
> +	u64 size = 0;
> +
> +	np = of_find_compatible_node(NULL, NULL, "ibm,uv-firmware");
> +	if (!np)
> +		goto out;
> +
> +	prop = of_get_property(np, "secure-memory-ranges", &len);
> +	if (!prop)
> +		goto out_put;
> +
> +	for (i = 0; i < len / (sizeof(*prop) * 4); i++)
> +		size += of_read_number(prop + (i * 4) + 2, 2);
> +
> +out_put:
> +	of_node_put(np);
> +out:
> +	return size;
> +}
> +
> +int kvmppc_devm_init(void)
> +{
> +	int ret = 0;
> +	unsigned long size;
> +	struct resource *res;
> +	void *addr;
> +	unsigned long pfn_last, pfn_first;
> +
> +	size = kvmppc_get_secmem_size();
> +	if (!size) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	res = request_free_mem_region(&iomem_resource, size, "kvmppc_devm");
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		goto out;
> +	}
> +
> +	kvmppc_devm_pgmap.type = MEMORY_DEVICE_PRIVATE;
> +	kvmppc_devm_pgmap.res = *res;
> +	kvmppc_devm_pgmap.ops = &kvmppc_devm_ops;
> +	addr = memremap_pages(&kvmppc_devm_pgmap, -1);
> +	if (IS_ERR(addr)) {
> +		ret = PTR_ERR(addr);
> +		goto out_free_region;
> +	}
> +
> +	pfn_first = res->start >> PAGE_SHIFT;
> +	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
> +	kvmppc_devm_pfn_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
> +					 sizeof(unsigned long), GFP_KERNEL);
> +	if (!kvmppc_devm_pfn_bitmap) {
> +		ret = -ENOMEM;
> +		goto out_unmap;
> +	}
> +
> +	pr_info("KVMPPC-DEVM: Secure Memory size 0x%lx\n", size);
> +	return ret;

Nit: Blank line here?

> +out_unmap:
> +	memunmap_pages(&kvmppc_devm_pgmap);
> +out_free_region:
> +	release_mem_region(res->start, size);
> +out:
> +	return ret;
> +}
> +
> +void kvmppc_devm_free(void)
> +{
> +	memunmap_pages(&kvmppc_devm_pgmap);
> +	release_mem_region(kvmppc_devm_pgmap.res.start,
> +			   resource_size(&kvmppc_devm_pgmap.res));
> +	kfree(kvmppc_devm_pfn_bitmap);
> +}
> -- 
> 2.21.0
