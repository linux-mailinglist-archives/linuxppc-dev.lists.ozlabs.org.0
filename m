Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AB1ABB83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:43:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492t6M0Pz2zDrNS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:43:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.75.45; helo=9.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 9.mo178.mail-out.ovh.net (9.mo178.mail-out.ovh.net
 [46.105.75.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492shk6BVXzDrQw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:24:34 +1000 (AEST)
Received: from player699.ha.ovh.net (unknown [10.108.57.141])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 2E8069A9BF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 10:07:56 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 5E029116DD815;
 Thu, 16 Apr 2020 08:07:49 +0000 (UTC)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Handle non-present PTEs in page
 fault functions
To: Paul Mackerras <paulus@ozlabs.org>, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org
References: <20200416050335.GB10545@blackberry>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a4e1bf29-af52-232e-d0d2-06206fa05fbe@kaod.org>
Date: Thu, 16 Apr 2020 10:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416050335.GB10545@blackberry>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1322932392823262182
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/16/20 7:03 AM, Paul Mackerras wrote:
> Since cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT
> page fault handler", it's been possible in fairly rare circumstances to
> load a non-present PTE in kvmppc_book3s_hv_page_fault() when running a
> guest on a POWER8 host.
> 
> Because that case wasn't checked for, we could misinterpret the non-present
> PTE as being a cache-inhibited PTE.  That could mismatch with the
> corresponding hash PTE, which would cause the function to fail with -EFAULT
> a little further down.  That would propagate up to the KVM_RUN ioctl()
> generally causing the KVM userspace (usually qemu) to fall over.
> 
> This addresses the problem by catching that case and returning to the guest
> instead, letting it fault again, and retrying the whole page fault from
> the beginning.
> 
> For completeness, this fixes the radix page fault handler in the same
> way.  For radix this didn't cause any obvious misbehaviour, because we
> ended up putting the non-present PTE into the guest's partition-scoped
> page tables, leading immediately to another hypervisor data/instruction
> storage interrupt, which would go through the page fault path again
> and fix things up.
> 
> Fixes: cd758a9b57ee "KVM: PPC: Book3S HV: Use __gfn_to_pfn_memslot in HPT page fault handler"
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1820402
> Reported-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

I didn't see the reported issue with the current 5.7-rc1. Anyhow I gave
this patch a try on a P8 host and a P9 host with a radix guest and a hash 
guest (using rhel6). Passthrough is fine also.

Tested-by: Cédric Le Goater <clg@kaod.org>

The code looks correct,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 


> ---
> This is a reworked version of the patch David Gibson sent recently,
> with the fix applied to the radix case as well. The commit message
> is mostly stolen from David's patch.
> 
>  arch/powerpc/kvm/book3s_64_mmu_hv.c    | 9 +++++----
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 9 +++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 3aecec8..20b7dce 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -604,18 +604,19 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
>  	 */
>  	local_irq_disable();
>  	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
> +	pte = __pte(0);
> +	if (ptep)
> +		pte = *ptep;
> +	local_irq_enable();
>  	/*
>  	 * If the PTE disappeared temporarily due to a THP
>  	 * collapse, just return and let the guest try again.
>  	 */
> -	if (!ptep) {
> -		local_irq_enable();
> +	if (!pte_present(pte)) {
>  		if (page)
>  			put_page(page);
>  		return RESUME_GUEST;
>  	}
> -	pte = *ptep;
> -	local_irq_enable();
>  	hpa = pte_pfn(pte) << PAGE_SHIFT;
>  	pte_size = PAGE_SIZE;
>  	if (shift)
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index 134fbc1..7bf94ba 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -815,18 +815,19 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
>  	 */
>  	local_irq_disable();
>  	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
> +	pte = __pte(0);
> +	if (ptep)
> +		pte = *ptep;
> +	local_irq_enable();
>  	/*
>  	 * If the PTE disappeared temporarily due to a THP
>  	 * collapse, just return and let the guest try again.
>  	 */
> -	if (!ptep) {
> -		local_irq_enable();
> +	if (!pte_present(pte)) {
>  		if (page)
>  			put_page(page);
>  		return RESUME_GUEST;
>  	}
> -	pte = *ptep;
> -	local_irq_enable();
>  
>  	/* If we're logging dirty pages, always map single pages */
>  	large_enable = !(memslot->flags & KVM_MEM_LOG_DIRTY_PAGES);
> 

