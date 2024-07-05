Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E53928AA8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 16:25:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RTU3xdFK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RTU3xdFK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFwlN24yrz3cY9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 00:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RTU3xdFK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RTU3xdFK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFwkh3dCFz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 00:24:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720189462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqBTg61cVL77faXIzfdAxULAIPGMk1ZHXjVPHmfrZtE=;
	b=RTU3xdFKvMWKsvin5GushVCq3Tqxw87MFhe+ouyNOcxo/Dh8v8q7dqG2iiNqdUz47LCh+d
	wO4OjPGdo/QwA8/3xCOgkvZ0BPNYlnVlStZld0EKaUeHHF06bkXWCCEHKTgMYn1L7+MqXo
	96hO3m0lztuA1Gr/ys8ytKaKjjmH+pw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720189462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqBTg61cVL77faXIzfdAxULAIPGMk1ZHXjVPHmfrZtE=;
	b=RTU3xdFKvMWKsvin5GushVCq3Tqxw87MFhe+ouyNOcxo/Dh8v8q7dqG2iiNqdUz47LCh+d
	wO4OjPGdo/QwA8/3xCOgkvZ0BPNYlnVlStZld0EKaUeHHF06bkXWCCEHKTgMYn1L7+MqXo
	96hO3m0lztuA1Gr/ys8ytKaKjjmH+pw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-EwuTba2hOeijzXx4gRfGhQ-1; Fri, 05 Jul 2024 10:24:18 -0400
X-MC-Unique: EwuTba2hOeijzXx4gRfGhQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-444fbad91f3so3113981cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2024 07:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720189458; x=1720794258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqBTg61cVL77faXIzfdAxULAIPGMk1ZHXjVPHmfrZtE=;
        b=nNWM65F7XsRiOmbyKVg9Tsj8Ojjasv2PVdfUPcSTFmXplp0b+v9kHfocaHvQWFTKGf
         2i8X3Rt467uBqPXKhGth89VhbQgcC97iIzp93FxsjPYw9Jcn1zs48VQiKhlYQcDXnAF1
         K/9QKYl8w4dUpIYrcQ9OWb044j1sQ3QmvLvqmvgzrfpvxifridiBQaDKwI5BO7xlbE/j
         r/ojPs532o5DxbRWRp2UHLDUWE0pmWpb7ilobOHnjjtdzsApUzkJfzQ5Y0n/wZI+FyMU
         1KACHAxTD3IJb5/85+H8sKLb3XmEBgQW2eyzpj9h04u+4rUxFDQWHQzpYY+gTIoQ2i5T
         so7g==
X-Forwarded-Encrypted: i=1; AJvYcCWYKYdKYGUwF3TDvLmCIT1bJ5vd3HHwtkdKMhcyCPoiqz0Wt1cIBFAlkOefyzYymGRgnpr0AvbsMDwmGZ3urXPfm1rmCn9Bl9zMfyAqMA==
X-Gm-Message-State: AOJu0Yxeq4OpIcUvPi9Updnm6NxGYt8nFwDifTIGQkN4emJypmyDh2GW
	yAuTJ/cfNTRVhXyyaeQcnsnK/bIqPrWh2+fOICarHqBbNE9oHK7XW6i+J3TRj15lqhZev8gwuDP
	MlrXA4sQLuVUZWpPLZIwi4aBxGi1srO8kON3avWTdRbtfYI9ZxiufFd9OCTm2PXM=
X-Received: by 2002:ac8:7c4b:0:b0:446:395a:37c9 with SMTP id d75a77b69052e-447cc1cd760mr50257021cf.4.1720189458386;
        Fri, 05 Jul 2024 07:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKP4/uPX8iCeoUcNLMV3z8vBAByHvLymsXhgYIxVOYKgo8tVByPTMSYbiLBJ2KPlAF3hMSkQ==
X-Received: by 2002:ac8:7c4b:0:b0:446:395a:37c9 with SMTP id d75a77b69052e-447cc1cd760mr50256521cf.4.1720189457935;
        Fri, 05 Jul 2024 07:24:17 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465149b579sm69523231cf.75.2024.07.05.07.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:24:17 -0700 (PDT)
Date: Fri, 5 Jul 2024 10:24:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 11/13] huge_memory: Remove dead vmf_insert_pXd code
Message-ID: <ZogCDpfSyCcjVXWH@x1n>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <400a4584f6f628998a7093aee49d9f86c592754b.1719386613.git-series.apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <400a4584f6f628998a7093aee49d9f86c592754b.1719386613.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, david@redhat.com, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, linux-cxl@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, Alex Williamson <alex.williamson@redhat.com>, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, logang@deltatee.com, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Alistair,

On Thu, Jun 27, 2024 at 10:54:26AM +1000, Alistair Popple wrote:
> Now that DAX is managing page reference counts the same as normal
> pages there are no callers for vmf_insert_pXd functions so remove
> them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   2 +-
>  mm/huge_memory.c        | 165 +-----------------------------------------
>  2 files changed, 167 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 9207d8e..0fb6bff 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -37,8 +37,6 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
>  		    unsigned long cp_flags);
>  
> -vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
> -vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
>  vm_fault_t dax_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
>  vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);

There's a plan to support huge pfnmaps in VFIO, which may still make good
use of these functions.  I think it's fine to remove them but it may mean
we'll need to add them back when supporting pfnmaps with no memmap.

Is it still possible to make the old API generic to both service the new
dax refcount plan, but at the meantime working for pfn injections when
there's no page struct?

Thanks,

-- 
Peter Xu

