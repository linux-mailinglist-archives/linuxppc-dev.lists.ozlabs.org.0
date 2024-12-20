Return-Path: <linuxppc-dev+bounces-4364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C619F99D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 19:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFGmQ6CnSz30XZ;
	Sat, 21 Dec 2024 05:54:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734720854;
	cv=none; b=dPNjHoB0E/biJ6yhghBYLWytvN3AvttQgIq1Dj6hT+KfRQ7ufhryrg/kDtR5bTMmoB1xm8nevxW8rS/oxfQe285KhPP4hPZuQOXeGlx0yzJ/Ifthd/1IDLjpNaOXyRM7T261Z/WIigYzHQDoHwgHymCKUKxBNJQayIRjq2zYF4pOt+2ZNyRbCD1/D8nqE/ZTO/YT+6MLEycNd0jxSfAJz4VKKo2sott2+2aMmN188840lLTEHP68BQk6b0LVUIquk3CN/d/RibWQe13GfMpwu2Jx0dZmHL3CDXIxKdzB8Fg8ee7Ei58Hc/63hSrN8JnaDQWX4g43iTmEgU8nAoWOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734720854; c=relaxed/relaxed;
	bh=dwul1B0ZjRX8XHXiw9S5GpTdynHuc37dTo3qyY+Q/Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgdDrQsHMHt2T4pXYeXXs2paTo4VrH7wwB3StzhR3b3r8sDA9VSw+f3lygJ/sf09+TM2Be+4bdzRbhYUButa83w4H6d7I1FABir4aS06lfUYISTiWG0oK8iPYpT++yznhXM4B/vhOnTXtP0PFTuCObeFJDDKIaYLB+gzXXlS/DteJw0FekKYvwt4RulFaAd0vlB4oQ7Huh8D24q34XcxxjQQHu4ZYuPBhtelGHjdAmvHYRXZbc58B1h41EP6R/rG4SsLGE7eFkLMOvSVGPvcKMxtoiN8+FuSskTeR5GNrx3S+JbeOMWDTM5whpck2mIWSlsVmL+cEIts0+T6XKnONQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X0skO7Rv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X0skO7Rv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X0skO7Rv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X0skO7Rv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFGmP5Bk8z30Wm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 05:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734720851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dwul1B0ZjRX8XHXiw9S5GpTdynHuc37dTo3qyY+Q/Ok=;
	b=X0skO7RvNjfQu/vsbPmWcy5aUgT9YJWS8sE/X1GA1w0qFHQMbBeeO2/R7G0V1kVrXBPk2E
	dfSYY3/Ao+6Na1D8bh8CFvy2artGzV1khGbe+ShdoY+R2V0GeCbxseLf539PfkLNEzYocs
	CPS2unTbTC1/re3n6oWpni6CGzZWE4g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734720851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dwul1B0ZjRX8XHXiw9S5GpTdynHuc37dTo3qyY+Q/Ok=;
	b=X0skO7RvNjfQu/vsbPmWcy5aUgT9YJWS8sE/X1GA1w0qFHQMbBeeO2/R7G0V1kVrXBPk2E
	dfSYY3/Ao+6Na1D8bh8CFvy2artGzV1khGbe+ShdoY+R2V0GeCbxseLf539PfkLNEzYocs
	CPS2unTbTC1/re3n6oWpni6CGzZWE4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-7v9eMGunPOiDPGub463tvQ-1; Fri, 20 Dec 2024 13:54:09 -0500
X-MC-Unique: 7v9eMGunPOiDPGub463tvQ-1
X-Mimecast-MFC-AGG-ID: 7v9eMGunPOiDPGub463tvQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so12975515e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 10:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734720848; x=1735325648;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dwul1B0ZjRX8XHXiw9S5GpTdynHuc37dTo3qyY+Q/Ok=;
        b=ftDlqkrQyMTYSv28bEdaJvJPVuX/JKLuwng2XgxRP3Sdt3EjlS1TA8YQhNtozYhLuF
         IhmjXulANKErjvGb+qdMK7LKDWdUDrkIO2rafEkxLbFeb+GxLsrzwjEjn1gFa09DmDKu
         pn9Cy5OK18ZUsCHm8y+NcLbDEdYWjE1zl+KpDcYpE/ZDsySNbUBqrybJ76io3xgL3qoq
         tqocQ2Srl/bNZGBW+kHvyX+wl53+kBfIb0/xROjfSfz+2DKtWjEpl/ukPH1ZfEMHZp9Q
         pWHqKOAlJOLs0LCJHStTP5j/JhklWkEyaKymeBxLF3RihJr9nM0NY+rpq26GiOuNEO1/
         wp1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2IANVHNZW3MT1sfk8vRgZJ7nz50VGBVmQrUSZLHJhjh01q3Q7JG0YXiBlfuOLUF8Waqk8hPsjFPWWvzE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWAI7N1Z8K0mXQYAE/xBPILvcPZC7x0gAoBbZ4qCxmXwVBvDCN
	dKgiw9Td+rWClVQ+JT77Ktu6V6OidMFXrjZCjSsfsIiDXC8Bej+ntrQz071ZdC1Nnb3B2VAahne
	C9URI9Spl71RqRHasyQZf6esy0wHMRRLKd+Ru5JJn5omBOKVb+WYzXVR4alenw9A=
X-Gm-Gg: ASbGnct4grfFwcZAlUeGLjRaYlvXPar3bSi4a2IT5mFv4Sr0riq1xow62xDkwQcy3mT
	Ry0JzzkBYhhsES7n5ntQzTPcZHwTR2I41tDvgnIXmm7z5vKql9eH/xma+kTa+eLL07u1pPUusTv
	mP6UtcDYTpx3mYtPGpMtFtrGr0CptnDLnaAYPKoC+P9sYNtixUALxyyueAqf5ps3ELPGSBr2BAQ
	OCkh/QKkjCBIVGj+HPCTDsMWiUypQWzFSaeWysBEMw9D1se88aMxkYKsW2Bhky7YQukTmT8z25W
	cmZqPEYWzRljAKvePhBe56RvH9kQBZq4jk3pw1J/seyiV+pG3q7E8fnmuEj1XUcN7u3C11urzLf
	XKOviBgep
X-Received: by 2002:a05:600c:468f:b0:434:f335:855 with SMTP id 5b1f17b1804b1-43668b78324mr30167615e9.28.1734720847734;
        Fri, 20 Dec 2024 10:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+mu6LGdXIB0NGv4yM1Fr/+Tla9eI5H7TAKe928/ZkOL89O5OYg43H9k6wobb3o6UoxzSHnA==
X-Received: by 2002:a05:600c:468f:b0:434:f335:855 with SMTP id 5b1f17b1804b1-43668b78324mr30167405e9.28.1734720847387;
        Fri, 20 Dec 2024 10:54:07 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm4757808f8f.71.2024.12.20.10.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 10:54:06 -0800 (PST)
Message-ID: <d20b0078-afda-4a20-ad9e-b3694a43ba33@redhat.com>
Date: Fri, 20 Dec 2024 19:54:03 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/25] huge_memory: Add vmf_insert_folio_pmd()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <b1c1e92f29094d6d5b78c6f87dc8ac81a9cbd7aa.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b1c1e92f29094d6d5b78c6f87dc8ac81a9cbd7aa.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pO--uzcNKA4T92_DYEW95UEoI7sk3n4UuAqU8sKn71Q_1734720848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


> +vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	unsigned long addr = vmf->address & PMD_MASK;
> +	pfn_t pfn = pfn_to_pfn_t(folio_pfn(folio));
> +	struct mm_struct *mm = vma->vm_mm;
> +	spinlock_t *ptl;
> +	pgtable_t pgtable = NULL;
> +	struct page *page;
> +
> +	if (addr < vma->vm_start || addr >= vma->vm_end)
> +		return VM_FAULT_SIGBUS;
> +
> +	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
> +		return VM_FAULT_SIGBUS;
> +
> +	if (arch_needs_pgtable_deposit()) {
> +		pgtable = pte_alloc_one(vma->vm_mm);
> +		if (!pgtable)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	track_pfn_insert(vma, &vma->vm_page_prot, pfn);
> +
> +	ptl = pmd_lock(mm, vmf->pmd);
> +	if (pmd_none(*vmf->pmd)) {
> +		page = pfn_t_to_page(pfn);
> +		folio = page_folio(page);
> +		folio_get(folio);
> +		folio_add_file_rmap_pmd(folio, page, vma);
> +		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
> +	}

Same comments as for the PUD variant, apart from that nothing jumped at me.

-- 
Cheers,

David / dhildenb


