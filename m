Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F188A5EEA6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 02:08:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdDGG6mhNz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 10:08:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FUpZRFN8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdDFd2Gk4z2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 10:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FUpZRFN8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdDFX0r2Xz4xGT;
	Thu, 29 Sep 2022 10:07:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664410050;
	bh=GwvU25m5bzZtcwbq1vk4klelynKDX7wZXovJlOtFPZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FUpZRFN8dZjxo35PBva+4BGvKAXME6ca06lcDrMGsOxJPhJz4Aq078U02JBUauu+x
	 TISIaYIhTpOpsSogDFXWxHEPU1hYl+Sw4wm0HLaXVowkKiBc4FpP5FCN/DAkwrKOde
	 3pHYiX3uSVUBCWSQMjpzUKBkXJPky0SFtO1b2pETuMOX3jVTE9hhKP2xsunbxgLKkf
	 3uVMzIxpjnO/+2I0MOYMk1fk1MWJzYhgQyBEAQnndRs2T6MEinUnruV7FWca1A1uk+
	 pboH/UlxEaOaFe/pn84bW0r3y2y7g9m3W+8TtLrykVymtIk+ogHgfKvl/ciucEJ9wV
	 HVxTa6eo2DNkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/7] mm/memory.c: Fix race when faulting a device
 private page
In-Reply-To: <af2ea89799b08e0a5e592df0da0dcb9a5bf8533b.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <af2ea89799b08e0a5e592df0da0dcb9a5bf8533b.1664171943.git-series.apopple@nvidia.com>
Date: Thu, 29 Sep 2022 10:07:26 +1000
Message-ID: <87fsgbf3gh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <apopple@nvidia.com> writes:
> When the CPU tries to access a device private page the migrate_to_ram()
> callback associated with the pgmap for the page is called. However no
> reference is taken on the faulting page. Therefore a concurrent
> migration of the device private page can free the page and possibly the
> underlying pgmap. This results in a race which can crash the kernel due
> to the migrate_to_ram() function pointer becoming invalid. It also means
> drivers can't reliably read the zone_device_data field because the page
> may have been freed with memunmap_pages().
>
> Close the race by getting a reference on the page while holding the ptl
> to ensure it has not been freed. Unfortunately the elevated reference
> count will cause the migration required to handle the fault to fail. To
> avoid this failure pass the faulting page into the migrate_vma functions
> so that if an elevated reference count is found it can be checked to see
> if it's expected or not.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>  include/linux/migrate.h                  |  8 ++++++-
>  lib/test_hmm.c                           |  7 ++---
>  mm/memory.c                              | 16 +++++++++++-
>  mm/migrate.c                             | 34 ++++++++++++++-----------
>  mm/migrate_device.c                      | 18 +++++++++----
>  9 files changed, 87 insertions(+), 41 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 5980063..d4eacf4 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>  static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>  		unsigned long start,
>  		unsigned long end, unsigned long page_shift,
> -		struct kvm *kvm, unsigned long gpa)
> +		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
> -	struct migrate_vma mig;
> +	struct migrate_vma mig = { 0 };
>  	struct page *dpage, *spage;
>  	struct kvmppc_uvmem_page_pvt *pvt;
>  	unsigned long pfn;
> @@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>  	mig.dst = &dst_pfn;
>  	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
>  	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +	mig.fault_page = fault_page;
>  
>  	/* The requested page is already paged-out, nothing to do */
>  	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
> @@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>  static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>  				      unsigned long start, unsigned long end,
>  				      unsigned long page_shift,
> -				      struct kvm *kvm, unsigned long gpa)
> +				      struct kvm *kvm, unsigned long gpa,
> +				      struct page *fault_page)
>  {
>  	int ret;
>  
>  	mutex_lock(&kvm->arch.uvmem_lock);
> -	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
> +	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
> +				fault_page);
>  	mutex_unlock(&kvm->arch.uvmem_lock);
>  
>  	return ret;
> @@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>  		bool pagein)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
> -	struct migrate_vma mig;
> +	struct migrate_vma mig = { 0 };
>  	struct page *spage;
>  	unsigned long pfn;
>  	struct page *dpage;
> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>  
>  	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>  				vmf->address + PAGE_SIZE, PAGE_SHIFT,
> -				pvt->kvm, pvt->gpa))
> +				pvt->kvm, pvt->gpa, vmf->page))
>  		return VM_FAULT_SIGBUS;
>  	else
>  		return 0;

I don't have a UV test system, but as-is it doesn't even compile :)

kvmppc_svm_page_out() is called via some paths other than the
migrate_to_ram callback.

I think it's correct to just pass fault_page = NULL when it's not called
from the migrate_to_ram callback?

Incremental diff below.

cheers


diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index d4eacf410956..965c9e9e500b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -637,7 +637,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 			pvt->remove_gfn = true;
 
 			if (__kvmppc_svm_page_out(vma, addr, addr + PAGE_SIZE,
-						  PAGE_SHIFT, kvm, pvt->gpa))
+						  PAGE_SHIFT, kvm, pvt->gpa, NULL))
 				pr_err("Can't page out gpa:0x%lx addr:0x%lx\n",
 				       pvt->gpa, addr);
 		} else {
@@ -1068,7 +1068,7 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out;
 
-	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa))
+	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa, NULL))
 		ret = H_SUCCESS;
 out:
 	mmap_read_unlock(kvm->mm);
