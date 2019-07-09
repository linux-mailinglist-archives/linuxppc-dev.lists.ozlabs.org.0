Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC863BF8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 21:34:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jsvk6FyJzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 05:34:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jssk1KQ6zDqSs;
 Wed, 10 Jul 2019 05:32:40 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69JVdNh029136; Tue, 9 Jul 2019 15:32:37 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmy5dcykc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2019 15:32:37 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x69JTtWu004783;
 Tue, 9 Jul 2019 19:32:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 2tjk96f7gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2019 19:32:36 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69JWYFc53019068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 19:32:34 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D99B136053;
 Tue,  9 Jul 2019 19:32:34 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B3313604F;
 Tue,  9 Jul 2019 19:32:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 19:32:34 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Jul 2019 14:35:02 -0500
From: janani <janani@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 2/7] kvmppc: Shared pages support for secure guests
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190709102545.9187-3-bharata@linux.ibm.com>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-3-bharata@linux.ibm.com>
Message-ID: <e73fbe2bb6617da8245c1164aa7c8b57@linux.vnet.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090231
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
Reply-To: janani@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-09 05:25, Bharata B Rao wrote:
> A secure guest will share some of its pages with hypervisor (Eg. virtio
> bounce buffers etc). Support shared pages in HMM driver.
> 
> Once a secure page is converted to shared page, HMM driver will stop
> tracking that page.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h |  3 ++
>  arch/powerpc/kvm/book3s_hv_hmm.c  | 66 +++++++++++++++++++++++++++++--
>  2 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h
> b/arch/powerpc/include/asm/hvcall.h
> index 2f6b952deb0f..05b8536f6653 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -337,6 +337,9 @@
>  #define H_TLB_INVALIDATE	0xF808
>  #define H_COPY_TOFROM_GUEST	0xF80C
> 
> +/* Flags for H_SVM_PAGE_IN */
> +#define H_PAGE_IN_SHARED        0x1
> +
>  /* Platform-specific hcalls used by the Ultravisor */
>  #define H_SVM_PAGE_IN		0xEF00
>  #define H_SVM_PAGE_OUT		0xEF04
> diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c 
> b/arch/powerpc/kvm/book3s_hv_hmm.c
> index cd34323888b6..36562b382e70 100644
> --- a/arch/powerpc/kvm/book3s_hv_hmm.c
> +++ b/arch/powerpc/kvm/book3s_hv_hmm.c
> @@ -52,6 +52,7 @@ struct kvmppc_hmm_page_pvt {
>  	unsigned long *rmap;
>  	unsigned int lpid;
>  	unsigned long gpa;
> +	bool skip_page_out;
>  };
> 
>  struct kvmppc_hmm_migrate_args {
> @@ -215,6 +216,53 @@ static const struct migrate_vma_ops
> kvmppc_hmm_migrate_ops = {
>  	.finalize_and_map = kvmppc_hmm_migrate_finalize_and_map,
>  };
> 
> +/*
> + * Shares the page with HV, thus making it a normal page.
> + *
> + * - If the page is already secure, then provision a new page and 
> share
> + * - If the page is a normal page, share the existing page
> + *
> + * In the former case, uses the HMM fault handler to release the HMM 
> page.
> + */
> +static unsigned long
> +kvmppc_share_page(struct kvm *kvm, unsigned long gpa, unsigned long 
> page_shift)
> +{
> +
> +	int ret;
> +	struct page *hmm_page;
> +	struct kvmppc_hmm_page_pvt *pvt;
> +	unsigned long pfn;
> +	unsigned long *rmap;
> +	struct kvm_memory_slot *slot;
> +	unsigned long gfn = gpa >> page_shift;
> +	int srcu_idx;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slot = gfn_to_memslot(kvm, gfn);
> +	if (!slot) {
> +		srcu_read_unlock(&kvm->srcu, srcu_idx);
> +		return H_PARAMETER;
> +	}
> +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +
> +	if (kvmppc_is_hmm_pfn(*rmap)) {
> +		hmm_page = pfn_to_page(*rmap & ~KVMPPC_PFN_HMM);
> +		pvt = (struct kvmppc_hmm_page_pvt *)
> +			hmm_devmem_page_get_drvdata(hmm_page);
> +		pvt->skip_page_out = true;
> +	}
> +
> +	pfn = gfn_to_pfn(kvm, gpa >> page_shift);
> +	if (is_error_noslot_pfn(pfn))
> +		return H_PARAMETER;
> +
> +	ret = uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0, 
> page_shift);
> +	kvm_release_pfn_clean(pfn);
> +
> +	return (ret == U_SUCCESS) ? H_SUCCESS : H_PARAMETER;
> +}
> +
>  /*
>   * Move page from normal memory to secure memory.
>   */
> @@ -235,9 +283,12 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned 
> long gpa,
>  	if (page_shift != PAGE_SHIFT)
>  		return H_P3;
> 
> -	if (flags)
> +	if (flags & ~H_PAGE_IN_SHARED)
>  		return H_P2;
> 
> +	if (flags & H_PAGE_IN_SHARED)
> +		return kvmppc_share_page(kvm, gpa, page_shift);
> +
>  	down_read(&kvm->mm->mmap_sem);
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
>  	slot = gfn_to_memslot(kvm, gfn);
> @@ -299,8 +350,17 @@ kvmppc_hmm_fault_migrate_alloc_and_copy(struct
> vm_area_struct *vma,
>  	       hmm_devmem_page_get_drvdata(spage);
> 
>  	pfn = page_to_pfn(dpage);
> -	ret = uv_page_out(pvt->lpid, pfn << PAGE_SHIFT,
> -			  pvt->gpa, 0, PAGE_SHIFT);
> +
> +	/*
> +	 * This same alloc_and_copy() callback is used in two cases:
> +	 * - When HV touches a secure page, for which we do page-out
> +	 * - When a secure page is converted to shared page, we touch
> +	 *   the page to essentially discard the HMM page. In this case we
> +	 *   skip page-out.
> +	 */
> +	if (!pvt->skip_page_out)
> +		ret = uv_page_out(pvt->lpid, pfn << PAGE_SHIFT,
> +				  pvt->gpa, 0, PAGE_SHIFT);
>  	if (ret == U_SUCCESS)
>  		*dst_pfn = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
>  }
