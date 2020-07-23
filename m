Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4021A22A61B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 05:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BByhb3NnFzDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BByfl4xdCzDr69
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 13:36:15 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N3XCZ1097526; Wed, 22 Jul 2020 23:36:10 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e11p0sub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 23:36:10 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N3ZEfp003764;
 Thu, 23 Jul 2020 03:36:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7npv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 03:36:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N3a5Iq47448140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 03:36:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CED85204E;
 Thu, 23 Jul 2020 03:36:05 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.75.152])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1CF1552051;
 Thu, 23 Jul 2020 03:36:02 +0000 (GMT)
Date: Thu, 23 Jul 2020 09:06:00 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] KVM: PPC: Book3S HV: rework secure mem slot
 dropping
Message-ID: <20200723033600.GS7902@in.ibm.com>
References: <20200721104202.15727-1-ldufour@linux.ibm.com>
 <20200721104202.15727-3-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721104202.15727-3-ldufour@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_17:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=5
 impostorscore=0 phishscore=0 bulkscore=0 mlxlogscore=722
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007230026
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
Cc: linuxram@us.ibm.com, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 paulus@samba.org, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 12:42:02PM +0200, Laurent Dufour wrote:
> When a secure memslot is dropped, all the pages backed in the secure device
> (aka really backed by secure memory by the Ultravisor) should be paged out
> to a normal page. Previously, this was achieved by triggering the page
> fault mechanism which is calling kvmppc_svm_page_out() on each pages.
> 
> This can't work when hot unplugging a memory slot because the memory slot
> is flagged as invalid and gfn_to_pfn() is then not trying to access the
> page, so the page fault mechanism is not triggered.
> 
> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
> simpler to directly calling it instead of triggering such a mechanism. This
> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
> memslot.
> 
> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
> the call to __kvmppc_svm_page_out() is made.
> As __kvmppc_svm_page_out needs the vma pointer to migrate the pages, the
> VMA is fetched in a lazy way, to not trigger find_vma() all the time. In
> addition, the mmap_sem is help in read mode during that time, not in write
> mode since the virual memory layout is not impacted, and
> kvm->arch.uvmem_lock prevents concurrent operation on the secure device.
> 
> Cc: Ram Pai <linuxram@us.ibm.com>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 54 ++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 5a4b02d3f651..ba5c7c77cc3a 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -624,35 +624,55 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>   * fault on them, do fault time migration to replace the device PTEs in
>   * QEMU page table with normal PTEs from newly allocated pages.
>   */
> -void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
> +void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
>  			     struct kvm *kvm, bool skip_page_out)
>  {
>  	int i;
>  	struct kvmppc_uvmem_page_pvt *pvt;
> -	unsigned long pfn, uvmem_pfn;
> -	unsigned long gfn = free->base_gfn;
> +	struct page *uvmem_page;
> +	struct vm_area_struct *vma = NULL;
> +	unsigned long uvmem_pfn, gfn;
> +	unsigned long addr, end;
> +
> +	mmap_read_lock(kvm->mm);
> +
> +	addr = slot->userspace_addr;

We typically use gfn_to_hva() for that, but that won't work for a
memslot that is already marked INVALID which is the case here.
I think it is ok to access slot->userspace_addr here of an INVALID
memslot, but just thought of explictly bringing this up.

> +	end = addr + (slot->npages * PAGE_SIZE);
>  
> -	for (i = free->npages; i; --i, ++gfn) {
> -		struct page *uvmem_page;
> +	gfn = slot->base_gfn;
> +	for (i = slot->npages; i; --i, ++gfn, addr += PAGE_SIZE) {
> +
> +		/* Fetch the VMA if addr is not in the latest fetched one */
> +		if (!vma || (addr < vma->vm_start || addr >= vma->vm_end)) {
> +			vma = find_vma_intersection(kvm->mm, addr, end);
> +			if (!vma ||
> +			    vma->vm_start > addr || vma->vm_end < end) {
> +				pr_err("Can't find VMA for gfn:0x%lx\n", gfn);
> +				break;
> +			}
> +		}

In Ram's series, kvmppc_memslot_page_merge() also walks the VMAs spanning
the memslot, but it uses a different logic for the same. Why can't these
two cases use the same method to walk the VMAs? Is there anything subtly
different between the two cases?

Regards,
Bharata.
