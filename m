Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 271311EAF7C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 21:16:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bPzN69VwzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 05:16:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bPld1f0KzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 05:06:04 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051J3o24102833; Mon, 1 Jun 2020 15:05:46 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bk5a6ybb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 15:05:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051J007R029204;
 Mon, 1 Jun 2020 19:05:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf47vkrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 19:05:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051J5eJ315335634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 19:05:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD389A405B;
 Mon,  1 Jun 2020 19:05:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44BB8A405F;
 Mon,  1 Jun 2020 19:05:38 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.66.157])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  1 Jun 2020 19:05:38 +0000 (GMT)
Date: Mon, 1 Jun 2020 12:05:35 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v1 3/4] KVM: PPC: Book3S HV: migrate remaining
 normal-GFNs to secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200601190535.GA6925@oc0525413822.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
 <1590892071-25549-4-git-send-email-linuxram@us.ibm.com>
 <20200601115518.GA31382@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601115518.GA31382@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_12:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 cotscore=-2147483648 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010140
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 01, 2020 at 05:25:18PM +0530, Bharata B Rao wrote:
> On Sat, May 30, 2020 at 07:27:50PM -0700, Ram Pai wrote:
> > H_SVM_INIT_DONE incorrectly assumes that the Ultravisor has explicitly
> > called H_SVM_PAGE_IN for all secure pages.
> 
> I don't think that is quite true. HV doesn't assume anything about
> secure pages by itself.

Yes. Currently, it does not assume anything about secure pages.  But I am
proposing that it should consider all pages (except the shared pages) as
secure pages, when H_SVM_INIT_DONE is called.

In other words, HV should treat all pages; except shared pages, as
secure pages once H_SVM_INIT_DONE is called. And this includes pages
added subsequently through memory hotplug.

Yes. the Ultravisor can explicitly request the HV to move the pages
individually.  But that will slow down the transition too significantly.
It takes above 20min to transition them, for a SVM of size 100G.

With this proposed enhancement, the switch completes in a few seconds.

> 
> > These GFNs continue to be
> > normal GFNs associated with normal PFNs; when infact, these GFNs should
> > have been secure GFNs associated with device PFNs.
> 
> Transition to secure state is driven by SVM/UV and HV just responds to
> hcalls by issuing appropriate uvcalls. SVM/UV is in the best position to
> determine the required pages that need to be moved into secure side.
> HV just responds to it and tracks such pages as device private pages.
> 
> If SVM/UV doesn't get in all the pages to secure side by the time
> of H_SVM_INIT_DONE, the remaining pages are just normal (shared or
> otherwise) pages as far as HV is concerned.  Why should HV assume that
> SVM/UV didn't ask for a few pages and hence push those pages during
> H_SVM_INIT_DONE?

By definition, SVM is a VM backed by secure pages.
Hence all pages(except shared) must turn secure when a VM switches to SVM.

UV is interested in only a certain pages for the VM, which it will
request explicitly through H_SVM_PAGE_IN.  All other pages, need not
be paged-in through UV_PAGE_IN.  They just need to be switched to
device-pages.

> 
> I think UV should drive the movement of pages into secure side both
> of boot-time SVM memory and hot-plugged memory. HV does memslot
> registration uvcall when new memory is plugged in, UV should explicitly
> get the required pages in at that time instead of expecting HV to drive
> the same.
> 
> > +static int uv_migrate_mem_slot(struct kvm *kvm,
> > +		const struct kvm_memory_slot *memslot)
> > +{
> > +	unsigned long gfn = memslot->base_gfn;
> > +	unsigned long end;
> > +	bool downgrade = false;
> > +	struct vm_area_struct *vma;
> > +	int i, ret = 0;
> > +	unsigned long start = gfn_to_hva(kvm, gfn);
> > +
> > +	if (kvm_is_error_hva(start))
> > +		return H_STATE;
> > +
> > +	end = start + (memslot->npages << PAGE_SHIFT);
> > +
> > +	down_write(&kvm->mm->mmap_sem);
> > +
> > +	mutex_lock(&kvm->arch.uvmem_lock);
> > +	vma = find_vma_intersection(kvm->mm, start, end);
> > +	if (!vma || vma->vm_start > start || vma->vm_end < end) {
> > +		ret = H_STATE;
> > +		goto out_unlock;
> > +	}
> > +
> > +	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > +			  MADV_UNMERGEABLE, &vma->vm_flags);
> > +	downgrade_write(&kvm->mm->mmap_sem);
> > +	downgrade = true;
> > +	if (ret) {
> > +		ret = H_STATE;
> > +		goto out_unlock;
> > +	}
> > +
> > +	for (i = 0; i < memslot->npages; i++, ++gfn) {
> > +		/* skip paged-in pages and shared pages */
> > +		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL) ||
> > +			kvmppc_gfn_is_uvmem_shared(gfn, kvm))
> > +			continue;
> > +
> > +		start = gfn_to_hva(kvm, gfn);
> > +		end = start + (1UL << PAGE_SHIFT);
> > +		ret = kvmppc_svm_migrate_page(vma, start, end,
> > +			(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
> > +
> > +		if (ret)
> > +			goto out_unlock;
> > +	}
> 
> Is there a guarantee that the vma you got for the start address remains
> valid for all the addresses till end in a memslot? If not, you should
> re-get the vma for the current address in each iteration I suppose.


mm->mmap_sem  is the semaphore that guards the vma. right?  If that
semaphore is held, can the vma change?


Thanks for your comments,
RP
