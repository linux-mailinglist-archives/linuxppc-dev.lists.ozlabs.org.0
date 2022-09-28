Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B825EE845
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:23:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md8cq3XyKz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:23:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Psmvm7pd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bu5S5P36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=lyude@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Psmvm7pd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bu5S5P36;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md8c26Jh8z3bST
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 07:23:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664400186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZ4t2UB2lqqb9ZXGA9il9zfkqpEc6E78sSJodDNan7Y=;
	b=Psmvm7pdER3/ndjd5hNBHBE+MieQjq6wQzdxsKhtnSdAR/ga5lB/drznss3yalLl3QVXDI
	6Q24loxVhVsb3cgT43e9GCkUdtTYzT6NXReeJ6kXhT8TOtWo+RfvE/DN6EWH7uYw7y+Fd3
	CrxFGFU1yqT2fPmZ+VPg8FiJGflE4sU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664400187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZ4t2UB2lqqb9ZXGA9il9zfkqpEc6E78sSJodDNan7Y=;
	b=bu5S5P36T9Jh/ulRHoTM/f3nleWhxXiSqDat8RH/LWpw9XxsssOQTL/sVNYwixwkkyZ3kc
	1A7XZXi35pug4UBdochiQKoM0kzPrAGevDJrTm5894eLa4u8t49Vg9FIhe8/UyX7MbjBfw
	SJ0PvpDkuL8yUjjBq1YSrkoogBdMvn8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-_3c9ic8zPHKyarTJnT3q3g-1; Wed, 28 Sep 2022 17:23:05 -0400
X-MC-Unique: _3c9ic8zPHKyarTJnT3q3g-1
Received: by mail-qt1-f200.google.com with SMTP id g6-20020ac84b66000000b0035cf832dec9so9704308qts.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 14:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QZ4t2UB2lqqb9ZXGA9il9zfkqpEc6E78sSJodDNan7Y=;
        b=nOU5o9crV0vxcKn46so+sXIDars6TvLCN+g3tgGvR9oHGQp3w3ifIN0kcBoPjIONuu
         7YZWNtj0lrwNippFhviOtN/Xsy4PwaJLdgsBCH3SPjX14ns9oYNdQ1BpNgAhfJ4r3RUx
         N7MhDfhHnouizTG3rcOyN9OxK7mMMLTYC7CsuKJiUZ4uhyEZLeVZvzJThrA1YCL9PCgk
         ln8RzthJ4ADc7/EIej+Ja+/XBBiRNER0YCUkDxnm9DpV7UEUxkMJySimO/AQ5mPtIN3m
         aaf05X3qgK4shqiLQQjBrYTn2oZ8RG4hA2Bmmr5UFgLseXMJRX7vbxeVa9dgF6/beDi8
         nJWg==
X-Gm-Message-State: ACrzQf3mDg+xhyFnmrCj4S06l7gRCv8PCuJsKU25paS/LLpj5PkitocS
	tM87RCJ7iLHPEAJ8eOSUDErv3mrc91TGGtowZ4kkn81owZGzcDUUOSrR8Au+AOEwgsfWj5QR7l2
	Q5DEfs8eP0rcSy3/uIi5RBPBKXw==
X-Received: by 2002:a05:620a:1103:b0:6ce:a0f6:90da with SMTP id o3-20020a05620a110300b006cea0f690damr38543qkk.101.1664400184929;
        Wed, 28 Sep 2022 14:23:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62/QIMjRyMr/gsxyeVxkRAWCYE6jZga2+iTdsErHKnI8Gjuum9cexxu6iDiWDB1hCj2jmE6w==
X-Received: by 2002:a05:620a:1103:b0:6ce:a0f6:90da with SMTP id o3-20020a05620a110300b006cea0f690damr38505qkk.101.1664400184635;
        Wed, 28 Sep 2022 14:23:04 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
        by smtp.gmail.com with ESMTPSA id o19-20020a05622a009300b0031eebfcb369sm4431620qtw.97.2022.09.28.14.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:23:03 -0700 (PDT)
Message-ID: <07643305900ee3a1adb7226cc98fa13defcee5a3.camel@redhat.com>
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, Felix Kuehling
	 <felix.kuehling@amd.com>
Date: Wed, 28 Sep 2022 17:23:00 -0400
In-Reply-To: <87bkr1lh3a.fsf@nvdebian.thelocal>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
	 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
	 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
	 <7ca6ec0c-7e5e-3b24-8f8d-650df357130c@amd.com>
	 <87bkr1lh3a.fsf@nvdebian.thelocal>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-09-27 at 11:39 +1000, Alistair Popple wrote:
> Felix Kuehling <felix.kuehling@amd.com> writes:
> 
> > On 2022-09-26 17:35, Lyude Paul wrote:
> > > On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
> > > > When the module is unloaded or a GPU is unbound from the module it is
> > > > possible for device private pages to be left mapped in currently running
> > > > processes. This leads to a kernel crash when the pages are either freed
> > > > or accessed from the CPU because the GPU and associated data structures
> > > > and callbacks have all been freed.
> > > > 
> > > > Fix this by migrating any mappings back to normal CPU memory prior to
> > > > freeing the GPU memory chunks and associated device private pages.
> > > > 
> > > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > > 
> > > > ---
> > > > 
> > > > I assume the AMD driver might have a similar issue. However I can't see
> > > > where device private (or coherent) pages actually get unmapped/freed
> > > > during teardown as I couldn't find any relevant calls to
> > > > devm_memunmap(), memunmap(), devm_release_mem_region() or
> > > > release_mem_region(). So it appears that ZONE_DEVICE pages are not being
> > > > properly freed during module unload, unless I'm missing something?
> > > I've got no idea, will poke Ben to see if they know the answer to this
> > 
> > I guess we're relying on devm to release the region. Isn't the whole point of
> > using devm_request_free_mem_region that we don't have to remember to explicitly
> > release it when the device gets destroyed? I believe we had an explicit free
> > call at some point by mistake, and that caused a double-free during module
> > unload. See this commit for reference:
> 
> Argh, thanks for that pointer. I was not so familiar with
> devm_request_free_mem_region()/devm_memremap_pages() as currently
> Nouveau explicitly manages that itself.

Mhm, TBH I feel like this was going to happen eventually anyway but there's
another reason for nouveau to start using the managed versions of these
functions at some point

> 
> > commit 22f4f4faf337d5fb2d2750aff13215726814273e
> > Author: Philip Yang <Philip.Yang@amd.com>
> > Date:   Mon Sep 20 17:25:52 2021 -0400
> > 
> >     drm/amdkfd: fix svm_migrate_fini warning
> >          Device manager releases device-specific resources when a driver
> >     disconnects from a device, devm_memunmap_pages and
> >     devm_release_mem_region calls in svm_migrate_fini are redundant.
> >          It causes below warning trace after patch "drm/amdgpu: Split
> >     amdgpu_device_fini into early and late", so remove function
> >     svm_migrate_fini.
> >          BUG: https://gitlab.freedesktop.org/drm/amd/-/issues/1718
> >          WARNING: CPU: 1 PID: 3646 at drivers/base/devres.c:795
> >     devm_release_action+0x51/0x60
> >     Call Trace:
> >         ? memunmap_pages+0x360/0x360
> >         svm_migrate_fini+0x2d/0x60 [amdgpu]
> >         kgd2kfd_device_exit+0x23/0xa0 [amdgpu]
> >         amdgpu_amdkfd_device_fini_sw+0x1d/0x30 [amdgpu]
> >         amdgpu_device_fini_sw+0x45/0x290 [amdgpu]
> >         amdgpu_driver_release_kms+0x12/0x30 [amdgpu]
> >         drm_dev_release+0x20/0x40 [drm]
> >         release_nodes+0x196/0x1e0
> >         device_release_driver_internal+0x104/0x1d0
> >         driver_detach+0x47/0x90
> >         bus_remove_driver+0x7a/0xd0
> >         pci_unregister_driver+0x3d/0x90
> >         amdgpu_exit+0x11/0x20 [amdgpu]
> >          Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> >     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > 
> > Furthermore, I guess we are assuming that nobody is using the GPU when the
> > module is unloaded. As long as any processes have /dev/kfd open, you won't be
> > able to unload the module (except by force-unload). I suppose with ZONE_DEVICE
> > memory, we can have references to device memory pages even when user mode has
> > closed /dev/kfd. We do have a cleanup handler that runs in an MMU-free-notifier.
> > In theory that should run after all the pages in the mm_struct have been freed.
> > It releases all sorts of other device resources and needs the driver to still be
> > there. I'm not sure if there is anything preventing a module unload before the
> > free-notifier runs. I'll look into that.
> 
> Right - module unload (or device unbind) is one of the other ways we can
> hit this issue in Nouveau at least. You can end up with ZONE_DEVICE
> pages mapped in a running process after the module has unloaded.
> Although now you mention it that seems a bit wrong - the pgmap refcount
> should provide some protection against that. Will have to look into
> that too.
> 
> > Regards,
> >   Felix
> > 
> > 
> > > 
> > > > ---
> > > >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++++-
> > > >   1 file changed, 48 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > index 66ebbd4..3b247b8 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > @@ -369,6 +369,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
> > > >   	mutex_unlock(&drm->dmem->mutex);
> > > >   }
> > > >   +/*
> > > > + * Evict all pages mapping a chunk.
> > > > + */
> > > > +void
> > > > +nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
> > > > +{
> > > > +	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
> > > > +	unsigned long *src_pfns, *dst_pfns;
> > > > +	dma_addr_t *dma_addrs;
> > > > +	struct nouveau_fence *fence;
> > > > +
> > > > +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> > > > +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> > > > +	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> > > > +
> > > > +	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
> > > > +			npages);
> > > > +
> > > > +	for (i = 0; i < npages; i++) {
> > > > +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
> > > > +			struct page *dpage;
> > > > +
> > > > +			/*
> > > > +			 * _GFP_NOFAIL because the GPU is going away and there
> > > > +			 * is nothing sensible we can do if we can't copy the
> > > > +			 * data back.
> > > > +			 */
> > > You'll have to excuse me for a moment since this area of nouveau isn't one of
> > > my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
> > > retry, in the case of a GPU hotplug event I would assume we would rather just
> > > stop trying to migrate things to the GPU and just drop the data instead of
> > > hanging on infinite retries.
> > > 
> > > > +			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
> > > > +			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> > > > +			nouveau_dmem_copy_one(chunk->drm,
> > > > +					migrate_pfn_to_page(src_pfns[i]), dpage,
> > > > +					&dma_addrs[i]);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
> > > > +	migrate_device_pages(src_pfns, dst_pfns, npages);
> > > > +	nouveau_dmem_fence_done(&fence);
> > > > +	migrate_device_finalize(src_pfns, dst_pfns, npages);
> > > > +	kfree(src_pfns);
> > > > +	kfree(dst_pfns);
> > > > +	for (i = 0; i < npages; i++)
> > > > +		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
> > > > +	kfree(dma_addrs);
> > > > +}
> > > > +
> > > >   void
> > > >   nouveau_dmem_fini(struct nouveau_drm *drm)
> > > >   {
> > > > @@ -380,8 +426,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
> > > >   	mutex_lock(&drm->dmem->mutex);
> > > >     	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
> > > > +		nouveau_dmem_evict_chunk(chunk);
> > > >   		nouveau_bo_unpin(chunk->bo);
> > > >   		nouveau_bo_ref(NULL, &chunk->bo);
> > > > +		WARN_ON(chunk->callocated);
> > > >   		list_del(&chunk->list);
> > > >   		memunmap_pages(&chunk->pagemap);
> > > >   		release_mem_region(chunk->pagemap.range.start,
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

