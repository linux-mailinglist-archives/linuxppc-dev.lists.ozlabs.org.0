Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D722BC57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 05:06:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYy34DF0zDrJC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYtz12z7zDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 13:03:54 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O32YEn144149; Thu, 23 Jul 2020 23:03:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb9bma3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 23:03:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O2xLbH012825;
 Fri, 24 Jul 2020 03:03:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7ptq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:03:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O33gwx57409616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 03:03:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C205204F;
 Fri, 24 Jul 2020 03:03:42 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.85.193])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 574FC52050;
 Fri, 24 Jul 2020 03:03:40 +0000 (GMT)
Date: Fri, 24 Jul 2020 08:33:37 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v5 7/7] KVM: PPC: Book3S HV: rework secure mem slot
 dropping
Message-ID: <20200724030337.GC1082478@in.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
 <1595534844-16188-8-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595534844-16188-8-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_20:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=5 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240021
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 01:07:24PM -0700, Ram Pai wrote:
> From: Laurent Dufour <ldufour@linux.ibm.com>
> 
> When a secure memslot is dropped, all the pages backed in the secure
> device (aka really backed by secure memory by the Ultravisor)
> should be paged out to a normal page. Previously, this was
> achieved by triggering the page fault mechanism which is calling
> kvmppc_svm_page_out() on each pages.
> 
> This can't work when hot unplugging a memory slot because the memory
> slot is flagged as invalid and gfn_to_pfn() is then not trying to access
> the page, so the page fault mechanism is not triggered.
> 
> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
> simpler to call directly instead of triggering such a mechanism. This
> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
> memslot.
> 
> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
> the call to __kvmppc_svm_page_out() is made.  As
> __kvmppc_svm_page_out needs the vma pointer to migrate the pages,
> the VMA is fetched in a lazy way, to not trigger find_vma() all
> the time. In addition, the mmap_sem is held in read mode during
> that time, not in write mode since the virual memory layout is not
> impacted, and kvm->arch.uvmem_lock prevents concurrent operation
> on the secure device.
> 
> Cc: Ram Pai <linuxram@us.ibm.com>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> 	[modified the changelog description]
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 54 ++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index c772e92..daffa6e 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -632,35 +632,55 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
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

There is a potential issue with the boundary condition check here
which I discussed with Laurent yesterday. Guess he hasn't gotten around
to look at it yet.

Regards,
Bharata.
