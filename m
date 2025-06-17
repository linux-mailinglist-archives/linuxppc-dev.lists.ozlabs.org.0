Return-Path: <linuxppc-dev+bounces-9411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE8ADC605
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1Y14h3Mz30GV;
	Tue, 17 Jun 2025 19:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750151989;
	cv=none; b=WAjBCazcyssf58INA7V2AfW/1qzWfHnsyQvGQtG2oK+tnQSMXoPQk+pD1ahocL6uRjDmVjlTXTHO+vvesk86u39ex3zWgAv1q78BdlY4PKhvcbqRV3J+5ydPnbzMMpKccxIfS0sFTkZpWkMrzPGPBlpTX1TUSexMVQKQieXP4BXQCz43WCnK6gEH/zHyEgIOH6S5eP8nbngAjPCh4mmeFW/4VVib4mo2jZncN5EI/VUC5rzSXUPp76RKr3h9Cy7aFVQ0hDu2TxBrniyyAv3SOQY/fPf59kKm9ICJu9KP5ZvD14C1Qx9ljxs+A0prDY/vCc9tpzxeITLoBvbaaX5/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750151989; c=relaxed/relaxed;
	bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMAbZQyPh5sJHW0x6Tn6Y3IcocaL9qDsPPMOY16Bc2b+1RWr0xRIc5hZG/jgSfA57+zEQPsaKxW1O50Uv6O45xCqNho9rckUMgxSX7C8TT5h5MBD9OYV4JUq3UBPnraCEr6lmV3GbMj9VYacHIfhgtKabnMI8Nc9nTOPs5AVQdJvCJe5mislCeWRgYfStyzuZvmdr0tdOPmhKm3bWYEKyAoM+8AhWpjKTgxR81t/vnA+JGtncClTGfDSVT3DCz9rpMyF/YESrHogNUsFx/ByD6WLxSEOtZFBpfRhv+g4X5p3J3KLbYS9MFufgw/Qzj5xOcVXpsfIvNNjVwjot6Mblg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YVFqnQ+8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YVFqnQ+8; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YVFqnQ+8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YVFqnQ+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1Y03bj8z2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:19:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750151982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
	b=YVFqnQ+860K+98gkYvI8a47Evpw9iqYsKH8KAYlGTuoI/7trIJpQpIeC5Y9Jy1JxBmrdO0
	rmppe9Bq+d36i9tyMCdFEq9t5yw+74Fj8J+26saNh/MCQ2PpcdflJLAS/+sgCcGRCnSjbI
	Jl9xuN5FT5NxYp62zYqBtKpWmGGCojc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750151982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
	b=YVFqnQ+860K+98gkYvI8a47Evpw9iqYsKH8KAYlGTuoI/7trIJpQpIeC5Y9Jy1JxBmrdO0
	rmppe9Bq+d36i9tyMCdFEq9t5yw+74Fj8J+26saNh/MCQ2PpcdflJLAS/+sgCcGRCnSjbI
	Jl9xuN5FT5NxYp62zYqBtKpWmGGCojc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-LHJGmCICMryL1UFweJx3nw-1; Tue, 17 Jun 2025 05:19:38 -0400
X-MC-Unique: LHJGmCICMryL1UFweJx3nw-1
X-Mimecast-MFC-AGG-ID: LHJGmCICMryL1UFweJx3nw_1750151977
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2265119f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151977; x=1750756777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
        b=taPovHD3KNv304NsLP30osBV/yC1THqG35z2h2JZcrVDjQ7mOQjfxcpQSV8852OxiG
         UoBaPLwRPf+3LTvzF1wlgMFnflQ2FPfP3nrjKoptwkDIFTJX55ZiDCGKEAdH85/UaLru
         +3bttqOS4SobozBZ/G6SSJC4V3s6EGOTHGuxYqv5jqb64Qe2xQ0Jz1STyZmv7Z5raCfF
         ap2XZdWNtMSJp+mrYKXKOKpCyQ4shS929+cWxH5qvvneZH9MUufjrK7/u/jsg1FOO70t
         ZjlViMAeCLwtDqtbjoOz6hD2SIK3QwfvSgDvirD1xvTaeaYAv6cMRGhy1PCIOKx+JpCM
         Rv+A==
X-Forwarded-Encrypted: i=1; AJvYcCXdA1HuikVUvSV+dMLkzBoUpeuyrjY+aGxZK37VFd3Av3gdu+1lLD00eBaY5ZJaIZvIl95o9DHxXqnOEws=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZ1xSOapHhPwOSvfeu058CEhk8fc0CrhiY9RaIdchMCwwZ9BKt
	KjpFWHt63O8Kz2KtoHyRUGWv086if6tAJK5muBYkmn22Q/v97awKLogoNAl2oB7qMlYt0X0Fin/
	0eLrfsWiG6Q4p4W/+nEgtyi8ckY5MUsu4Qu0ZeDIyfZmbMYMjbq+cPlF8QnR3PxeIkOw=
X-Gm-Gg: ASbGncs4RYd1t/55gNJvWSWF4fRlualdP6FstwXdnNtF2W9VYUNWjLTzoK8ECNrXJQe
	QtX6p1eljrtn5SNr1bgdk6Cg7Bvt5slGKq3ggv/LGpe1kkRODwRMsN33tbh6oCS5GqS3J+Nx+AG
	vqC+6NylaMv4BoVaOiXHRBl42gbjsClEEYabC2uSGEfuKQFrXlQ3hq7BzffNkC8ecRsVARYVjxj
	IxOruTKLAmuL8a0mpM4t0BiW86O3uJxNId3vbS4ueIIkDaHv7FdGoMuzFRdRbHjqOuhMNdXtvrg
	clzViBhmvrcJYgr6AVOewoqoHG3gzUPLI+vCJOEenUkOly0BMgXeglctZD1MsXq4odc+3aMwvtY
	vNdFJMQPRVVWw4I+CIy7ktSnN8ojRkmpHitydcfKrXnfAAKE=
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr11265690f8f.9.1750151977237;
        Tue, 17 Jun 2025 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt8iXJvJT0W2e4sI8GT6VcpVG8jxrePAU09oM8r6xnq4XSbjmN3FC6k4gXR+D2djVSpIQQtw==
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr11265656f8f.9.1750151976687;
        Tue, 17 Jun 2025 02:19:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm13528866f8f.52.2025.06.17.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:19:36 -0700 (PDT)
Message-ID: <bf855ce0-d0ba-4bd6-bfc1-8be2fdbdfe70@redhat.com>
Date: Tue, 17 Jun 2025 11:19:34 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] mm: Convert pXd_devmap checks to vma_is_dax
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <361009510f346090fad328c53ec228d99bb955ee.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <361009510f346090fad328c53ec228d99bb955ee.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7WhImQUu9M_6TExpgCYEYMCPo8UOANO7TI-T0vpaNg_1750151977
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16.06.25 13:58, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
 > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
> 
> Changes from v1:
> 
>   - Remove vma_is_dax() check from mm/userfaultfd.c as
>     validate_move_areas() will already skip DAX VMA's on account of them
>     not being anonymous.

This should be documented in the patch description above.

> ---
>   fs/userfaultfd.c | 2 +-
>   mm/hmm.c         | 2 +-
>   mm/userfaultfd.c | 6 ------
>   3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index ef054b3..a886750 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -304,7 +304,7 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>   		goto out;
>   
>   	ret = false;
> -	if (!pmd_present(_pmd) || pmd_devmap(_pmd))
> +	if (!pmd_present(_pmd) || vma_is_dax(vmf->vma))
>   		goto out;

VMA checks should be done before doing any page table walk.

>   
>   	if (pmd_trans_huge(_pmd)) {
> diff --git a/mm/hmm.c b/mm/hmm.c
> index feac861..5311753 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -441,7 +441,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   		return hmm_vma_walk_hole(start, end, -1, walk);
>   	}
>   
> -	if (pud_leaf(pud) && pud_devmap(pud)) {
> +	if (pud_leaf(pud) && vma_is_dax(walk->vma)) {
>   		unsigned long i, npages, pfn;
>   		unsigned int required_fault;
>   		unsigned long *hmm_pfns;

Dito.

> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 58b3ad6..8395db2 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1818,12 +1818,6 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
>   
>   		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
>   		if (ptl) {
> -			if (pmd_devmap(*src_pmd)) {
> -				spin_unlock(ptl);
> -				err = -ENOENT;
> -				break;
> -			}
> -
>   			/* Check if we can move the pmd without splitting it. */
>   			if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
>   			    !pmd_none(dst_pmdval)) {


-- 
Cheers,

David / dhildenb


