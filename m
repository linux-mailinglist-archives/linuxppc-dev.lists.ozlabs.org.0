Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A18A0FCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 05:06:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JnZP2Z51zDrBl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 13:06:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JnXN0XGdzDr7q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 13:04:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T32Qs8041933; Wed, 28 Aug 2019 23:04:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up31jd26b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:04:47 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7T342f7045900;
 Wed, 28 Aug 2019 23:04:47 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up31jd25q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 23:04:47 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7T34eig015241;
 Thu, 29 Aug 2019 03:04:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2ujvv6sw2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 03:04:46 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T34jWg12190494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 03:04:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABF4EB2068;
 Thu, 29 Aug 2019 03:04:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E319B205F;
 Thu, 29 Aug 2019 03:04:45 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 03:04:45 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id E9AF72E10DA; Wed, 28 Aug 2019 20:04:43 -0700 (PDT)
Date: Wed, 28 Aug 2019 20:04:43 -0700
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 2/7] kvmppc: Shared pages support for secure guests
Message-ID: <20190829030443.GB17497@us.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822102620.21897-3-bharata@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=888 adultscore=0 classifier=spam adjust=0 reason=mlx
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

> A secure guest will share some of its pages with hypervisor (Eg. virtio
> bounce buffers etc). Support sharing of pages between hypervisor and
> ultravisor.
> 
> Once a secure page is converted to shared page, the device page is
> unmapped from the HV side page tables.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h |  3 ++
>  arch/powerpc/kvm/book3s_hv_devm.c | 70 +++++++++++++++++++++++++++++--
>  2 files changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
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
> diff --git a/arch/powerpc/kvm/book3s_hv_devm.c b/arch/powerpc/kvm/book3s_hv_devm.c
> index 13722f27fa7d..6a3229b78fed 100644
> --- a/arch/powerpc/kvm/book3s_hv_devm.c
> +++ b/arch/powerpc/kvm/book3s_hv_devm.c
> @@ -46,6 +46,7 @@ struct kvmppc_devm_page_pvt {
>  	unsigned long *rmap;
>  	unsigned int lpid;
>  	unsigned long gpa;
> +	bool skip_page_out;
>  };
> 
>  /*
> @@ -139,6 +140,54 @@ kvmppc_devm_migrate_alloc_and_copy(struct migrate_vma *mig,
>  	return 0;
>  }
> 
> +/*
> + * Shares the page with HV, thus making it a normal page.
> + *
> + * - If the page is already secure, then provision a new page and share
> + * - If the page is a normal page, share the existing page
> + *
> + * In the former case, uses the dev_pagemap_ops migrate_to_ram handler
> + * to unmap the device page from QEMU's page tables.
> + */
> +static unsigned long
> +kvmppc_share_page(struct kvm *kvm, unsigned long gpa, unsigned long page_shift)
> +{
> +
> +	int ret = H_PARAMETER;
> +	struct page *devm_page;
> +	struct kvmppc_devm_page_pvt *pvt;
> +	unsigned long pfn;
> +	unsigned long *rmap;
> +	struct kvm_memory_slot *slot;
> +	unsigned long gfn = gpa >> page_shift;
> +	int srcu_idx;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slot = gfn_to_memslot(kvm, gfn);
> +	if (!slot)
> +		goto out;
> +
> +	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
> +	if (kvmppc_rmap_is_devm_pfn(*rmap)) {
> +		devm_page = pfn_to_page(*rmap & ~KVMPPC_RMAP_DEVM_PFN);
> +		pvt = (struct kvmppc_devm_page_pvt *)
> +			devm_page->zone_device_data;
> +		pvt->skip_page_out = true;
> +	}
> +
> +	pfn = gfn_to_pfn(kvm, gpa >> page_shift);

Use 'gfn'?

> +	if (is_error_noslot_pfn(pfn))
> +		goto out;
> +
> +	ret = uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0, page_shift);
> +	if (ret == U_SUCCESS)
> +		ret = H_SUCCESS;
> +	kvm_release_pfn_clean(pfn);

Nit: Blank line?
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	return ret;
> +}
> +
>  /*
>   * Move page from normal memory to secure memory.
>   */
> @@ -159,9 +208,12 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
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
>  	ret = H_PARAMETER;
>  	down_read(&kvm->mm->mmap_sem);
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
> @@ -211,7 +263,7 @@ kvmppc_devm_fault_migrate_alloc_and_copy(struct migrate_vma *mig,
>  	struct page *dpage, *spage;
>  	struct kvmppc_devm_page_pvt *pvt;
>  	unsigned long pfn;
> -	int ret;
> +	int ret = U_SUCCESS;
> 
>  	spage = migrate_pfn_to_page(*mig->src);
>  	if (!spage || !(*mig->src & MIGRATE_PFN_MIGRATE))
> @@ -226,8 +278,18 @@ kvmppc_devm_fault_migrate_alloc_and_copy(struct migrate_vma *mig,
>  	pvt = spage->zone_device_data;
> 
>  	pfn = page_to_pfn(dpage);
> -	ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
> -			  page_shift);
> +
> +	/*
> +	 * This same function is used in two cases:

Nit: s/same//

> +	 * - When HV touches a secure page, for which we do page-out

Better to qualify page-out with "uv page-out"? its kind of counterintuitive
to do a page-out on a fault!

> +	 * - When a secure page is converted to shared page, we touch
> +	 *   the page to essentially unmap the device page. In this
> +	 *   case we skip page-out.
> +	 */
> +	if (!pvt->skip_page_out)
> +		ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
> +				  page_shift);
> +
>  	if (ret == U_SUCCESS)
>  		*mig->dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
>  	else {
> -- 
> 2.21.0
