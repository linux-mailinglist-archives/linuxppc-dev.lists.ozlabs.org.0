Return-Path: <linuxppc-dev+bounces-9416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1EADC69C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1tz433cz30Qb;
	Tue, 17 Jun 2025 19:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750152923;
	cv=none; b=OfdYm2T8gPrUve1YS6VEgzDN7stFf8d9CVKmvwXShJtVgQfLXrLySK9y4XGlsRk3V8hJ6IFaG0u/rOYUQABLPd/gqKhiPDHQ6+62URCpjY6on+PyXaJXFl6ZbGiW/jLngFqDnsr6pCoTo1vtEBmOkiJTmdXUCBGRFeM/nQFKjW/lWcZDrIyHxAF8S2wEM08Mn+wIm7yHugLfGHVwI2oMT49PUDkaIlo2XTR7Jf+D5y03xiVMVx0Y9upbhb3z88Hyz4yj5NnR7+gf6aZW+aRpa7dIDZ8lQA5Jj1gi5o0lsyA9/JVnLOC2eAyZ+uHvyH05KkKTDShqPFYJ8lnQhdIgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750152923; c=relaxed/relaxed;
	bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFDcgBcgV5EuAIyN9fstBrNxKxtjtHKUypGfroL+l6KZuJIz7P3Bsb61R5ZOaWCSnVQZ5JiZTmRMm1xyFuBWuoWxRyhRiiWNJZaQxI4ZdgKS0tqrV4AZghO3LvlIKYDrJV9nidFgxgM8zo3V/v8M0sNjuTYPOO1QWuLW8uc1HZQzltdR4m7t8ncsRNDIOmRClHOlHL5sNOoVE+BfDtK7O5QUa/tmORygJe0ebEIdXXuVF6CM3XHcDv3hjhiHDbjeBCnOdDkYgtgtgVXAZ4rhzwFp3IscNokysqzQNA+TZ9XM/qqlgHDdytpbcEBYIYJWTUJihttO7gPIFIQJIzt9Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvQaWm3H; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvQaWm3H; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvQaWm3H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvQaWm3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1ty5FPwz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:35:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
	b=AvQaWm3Ht43NUfF8OAsJlinLYj89bH5Eq8bxCkS4mbxA9H1BceW2396vZ1qDdy45emtXj5
	qpqEv05cJWHMFG0aICNwX9jXR1/EZt5eE5lq6cbzeoZSNA6JVBLDpPeGR17emuziG4LTJV
	MnQMM//W58fqwMoG51P8ZntcvTxrYQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
	b=AvQaWm3Ht43NUfF8OAsJlinLYj89bH5Eq8bxCkS4mbxA9H1BceW2396vZ1qDdy45emtXj5
	qpqEv05cJWHMFG0aICNwX9jXR1/EZt5eE5lq6cbzeoZSNA6JVBLDpPeGR17emuziG4LTJV
	MnQMM//W58fqwMoG51P8ZntcvTxrYQA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-RDnnJU1gNEOdTU42nEw2bw-1; Tue, 17 Jun 2025 05:35:18 -0400
X-MC-Unique: RDnnJU1gNEOdTU42nEw2bw-1
X-Mimecast-MFC-AGG-ID: RDnnJU1gNEOdTU42nEw2bw_1750152918
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso3585945e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152917; x=1750757717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
        b=Cwtt/2SY4HF/JrKlsHLYXi47vtcySS6C1T/GqXVDTui0GVJDX21Ev0/TDih0Jj1ssE
         9f9BN1pHvlRLpiXzpuJAFGNAXE1yyX3p4pUeiCes4l8fi5aQ0nM+wBfG41h/rntcvSLH
         FKSsULeqVofVqOAK1F/03lnIDOYSwRHtNcqT8QKNQGi9xSMwa+NqHJrvVf4EP7adcyd5
         aCidV3sezpNbKC0ydQiNdVNO0ZMoKi1VAm7J41VmK6cupxmrkTAa0JOOps7kWvGwcDL2
         S4PJ8MJxgWaEYKwSfAknX6EGLH31v7lCBAAXXM+k9kPa5PyJwb8P/yl4vLMJWXAl+l/j
         rkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4D/9d9oa81A4SS8n1uFYR9bPzDQUSo4xX94ZNniudIJo/429ZGyQRT8M4b/cfm0g/xvVhNS70JMshBv8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWG8ZWEn6hf9zj7d1JR+T4nqWxeQylIu75VLWaa2qql9rOV3dy
	oPVWc5K8nK3ltLL5id7HxPfJdpeakjOxsx7WvUtZIsIZg9pKPJq0O4yit505vN2I0ENJMZESJ51
	b1YwXhN+RxtBkwGlCuPZ29ArDWR3hSYbJu79lsg5tnT9FnZbmPS8guoe0jVS+likCuvM=
X-Gm-Gg: ASbGncsLEIw9DOLtxRrr0JDKq7LxztC9OHBWs+1phqMe5Uo4rgvkQbhPIGffcAa9lKd
	vOCMq73XKT7HYx7ZppKUSwsBx3a3MfB5xu6X1VQ8idyrMBQV93nZTi3R1reO1t9kOE1sa1rQU2E
	a3c9xWuO/KSKg1n/ZapIbUW/i7zY/2hCF0szq01g1fIkR/zTK1ZUddwqVe9RtBtv6kiA8TLxkrx
	TD7j5mExsQ1cLXwVUNiYHCKrp/Q3sTO/mH4TePbp3Ka3eJBI8KB+H2+TwRUXm35j0ek3PheEn7b
	7E5uCyFVWCk4BvkVIBlcwgtNyPOuiD8dN7ZGTquyTNopJncOuzKdbK5aS9m1aJoQcPC2Kt/r+73
	PG8E2Tids7MN+v3CW48Su3U1zR+Ea88ch62ego8qhdayWT3U=
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4533c92e02dmr116197025e9.9.1750152917441;
        Tue, 17 Jun 2025 02:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEit+yPVLJbHP2/NKoMhgu9bHwQKBDL8e7RYDOzVbEtAUjPvQmNHH9hZ4psmoetdsF5NGVCyg==
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4533c92e02dmr116195515e9.9.1750152915523;
        Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b15015fsm7801901f8f.95.2025.06.17.02.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Message-ID: <69bea6b9-e9e7-4d17-843c-001029d4f2c2@redhat.com>
Date: Tue, 17 Jun 2025 11:35:13 +0200
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
Subject: Re: [PATCH v2 13/14] mm: Remove callers of pfn_t functionality
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
 <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9IFFcMZDUr8OTY-kaS0irgT_NuxNNhd8-BgGB9ToSDs_1750152918
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
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - Rebased on David's cleanup[1]
> 
> [1] https://lore.kernel.org/linux-mm/20250611120654.545963-1-david@redhat.com/
> ---
>   arch/x86/mm/pat/memtype.c                |  1 +-
>   drivers/dax/device.c                     | 23 +++----
>   drivers/dax/hmem/hmem.c                  |  1 +-
>   drivers/dax/kmem.c                       |  1 +-
>   drivers/dax/pmem.c                       |  1 +-
>   drivers/dax/super.c                      |  3 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c  |  1 +-
>   drivers/gpu/drm/gma500/fbdev.c           |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  1 +-
>   drivers/gpu/drm/msm/msm_gem.c            |  1 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c       |  6 +--
>   drivers/gpu/drm/v3d/v3d_bo.c             |  1 +-
>   drivers/hwtracing/intel_th/msu.c         |  3 +-
>   drivers/md/dm-linear.c                   |  2 +-
>   drivers/md/dm-log-writes.c               |  2 +-
>   drivers/md/dm-stripe.c                   |  2 +-
>   drivers/md/dm-target.c                   |  2 +-
>   drivers/md/dm-writecache.c               | 11 +--
>   drivers/md/dm.c                          |  2 +-
>   drivers/nvdimm/pmem.c                    |  8 +--
>   drivers/nvdimm/pmem.h                    |  4 +-
>   drivers/s390/block/dcssblk.c             |  9 +--
>   drivers/vfio/pci/vfio_pci_core.c         |  5 +-
>   fs/cramfs/inode.c                        |  5 +-
>   fs/dax.c                                 | 50 +++++++--------
>   fs/ext4/file.c                           |  2 +-
>   fs/fuse/dax.c                            |  3 +-
>   fs/fuse/virtio_fs.c                      |  5 +-
>   fs/xfs/xfs_file.c                        |  2 +-
>   include/linux/dax.h                      |  9 +--
>   include/linux/device-mapper.h            |  2 +-
>   include/linux/huge_mm.h                  |  6 +-
>   include/linux/mm.h                       |  4 +-
>   include/linux/pfn.h                      |  9 +---
>   include/linux/pfn_t.h                    | 85 +-------------------------
>   mm/debug_vm_pgtable.c                    |  1 +-
>   mm/huge_memory.c                         | 21 +++---
>   mm/memory.c                              | 31 ++++-----
>   mm/memremap.c                            |  1 +-
>   mm/migrate.c                             |  1 +-
>   tools/testing/nvdimm/pmem-dax.c          |  6 +-
>   tools/testing/nvdimm/test/iomap.c        |  7 +--
>   tools/testing/nvdimm/test/nfit_test.h    |  1 +-
>   43 files changed, 109 insertions(+), 235 deletions(-)
>   delete mode 100644 include/linux/pfn_t.h
> 

Lovely

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


