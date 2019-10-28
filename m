Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EDE7CBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 00:10:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4729S05Rp8zF0QC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 10:10:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="h5sKvzwG"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4729Pz5vBqzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 10:08:51 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id n16so5138771oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ya/hl3kSxLpkLPv5c7BeEGlhWkdu/wLTkTM0UC21b64=;
 b=h5sKvzwG18seVCu38EtLBa8XX3UEDh3zXJALKsSIPpKx30ctYy0LEmiydo2CnuPahe
 ELqGsk5TH8vpYL8/aVfVzYD3Zka2Qh9e9Wy1gkJOeRmzczxduc0z6kxJamVHrs/OQ8tw
 M3RzxVLGTwRdwd8jV9GYKb8zgU5btAT5XsEl6ODU2DqG0c3ipk+RsiDUTJdJLLQSfUjB
 eE3ieaJs7iLafKik9Mf8V54bP7Y/R/nW1OqhncnY5fHof16j1hFNmsAy3RAFj9gDFqd1
 N3MAuwhzsRdVqzZ6rrOh6cS759koUsN6YeIZRLMxGA/UNwI2oRtrmsLAudvydvULrHes
 /48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ya/hl3kSxLpkLPv5c7BeEGlhWkdu/wLTkTM0UC21b64=;
 b=njN7SeYW8WN/e7bn+Q3GG+o4T3MdFMkE++7zdOm1VZG1I946bQOqgfklh1Af+Gt1YU
 TXqkNzrvCmSJSo3Vdf9pXdk3RJEJVQIqGrZZ4LS8lnStwBAElYD3S6DLCQ9OvHL4r2Mp
 OwbRNH9AsIOkrRfIzorJxlwkECPEdop6VL0EPouybq7gd4tqvzou3qZHCTCT9ldSnvuW
 lq8A5oMkEWN1zx/AgPVnjuDkhuZC40g65BGvWk79vF4XzfhSpPZWusCUtRleyjB7Rjhi
 xXhM8DRnLLojKEHFF2RVemLvuxSzbwwWuc//EJWnHiFVhfWNQIpJLdy4MRfVHtPeeJOm
 Sijg==
X-Gm-Message-State: APjAAAXOkzKGwBomO2+76JJzTw9TWfJ63N4GQH8xC8GcWSlq1YNnQFA3
 QPvalJbAWPEi0O00N0rRNWKudn9XyXhCHxlcah/BHg==
X-Google-Smtp-Source: APXvYqzFqH80OPpGVmqK4MrGIOR9FzP/5Z5IS+6ciRSQLycC7zjZETQcpJ2/hgttcT47FsAAzUpRt6/OlgUss4UXiOU=
X-Received: by 2002:aca:620a:: with SMTP id w10mr1526488oib.0.1572304128418;
 Mon, 28 Oct 2019 16:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 28 Oct 2019 16:08:37 -0700
Message-ID: <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 2:48 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> The page size used to map the namespace is arch dependent. For example
> architectures like ppc64 use 16MB page size for direct-mapping. If the namespace
> size is not aligned to the mapping page size, we can observe kernel crash
> during namespace init and destroy.
>
> This is due to kernel doing partial map/unmap of the resource range
>
> BUG: Unable to handle kernel data access at 0xc001000406000000
> Faulting instruction address: 0xc000000000090790
> NIP [c000000000090790] arch_add_memory+0xc0/0x130
> LR [c000000000090744] arch_add_memory+0x74/0x130
> Call Trace:
>  arch_add_memory+0x74/0x130 (unreliable)
>  memremap_pages+0x74c/0xa30
>  devm_memremap_pages+0x3c/0xa0
>  pmem_attach_disk+0x188/0x770
>  nvdimm_bus_probe+0xd8/0x470
>  really_probe+0x148/0x570
>  driver_probe_device+0x19c/0x1d0
>  device_driver_attach+0xcc/0x100
>  bind_store+0x134/0x1c0
>  drv_attr_store+0x44/0x60
>  sysfs_kf_write+0x74/0xc0
>  kernfs_fop_write+0x1b4/0x290
>  __vfs_write+0x3c/0x70
>  vfs_write+0xd0/0x260
>  ksys_write+0xdc/0x130
>  system_call+0x5c/0x68
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/arm64/mm/flush.c     | 11 +++++++++++
>  arch/powerpc/lib/pmem.c   | 21 +++++++++++++++++++--
>  arch/x86/mm/pageattr.c    | 12 ++++++++++++
>  include/linux/libnvdimm.h |  1 +
>  4 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
> index ac485163a4a7..90c54c600023 100644
> --- a/arch/arm64/mm/flush.c
> +++ b/arch/arm64/mm/flush.c
> @@ -91,4 +91,15 @@ void arch_invalidate_pmem(void *addr, size_t size)
>         __inval_dcache_area(addr, size);
>  }
>  EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> +
> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
> +{
> +       u32 remainder;
> +
> +       div_u64_rem(size, PAGE_SIZE * ndr_mappings, &remainder);
> +       if (remainder)
> +               return PAGE_SIZE * ndr_mappings;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(arch_validate_namespace_size);
>  #endif
> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> index 377712e85605..2e661a08dae5 100644
> --- a/arch/powerpc/lib/pmem.c
> +++ b/arch/powerpc/lib/pmem.c
> @@ -17,14 +17,31 @@ void arch_wb_cache_pmem(void *addr, size_t size)
>         unsigned long start = (unsigned long) addr;
>         flush_dcache_range(start, start + size);
>  }
> -EXPORT_SYMBOL(arch_wb_cache_pmem);
> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>
>  void arch_invalidate_pmem(void *addr, size_t size)
>  {
>         unsigned long start = (unsigned long) addr;
>         flush_dcache_range(start, start + size);
>  }
> -EXPORT_SYMBOL(arch_invalidate_pmem);
> +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> +
> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
> +{
> +       u32 remainder;
> +       unsigned long linear_map_size;
> +
> +       if (radix_enabled())
> +               linear_map_size = PAGE_SIZE;
> +       else
> +               linear_map_size = (1UL << mmu_psize_defs[mmu_linear_psize].shift);

This seems more a "supported_alignments" problem, and less a namespace
size or PAGE_SIZE problem, because if the starting address is
misaligned this size validation can still succeed when it shouldn't.

One problem is that __size_store() does not validate the size against
the namespace alignment.

However, the next problem is that alignment is a property of the pfn
device, but not the raw namespace. I think this alignment constraint
should be captured by exposing "align" and "supported_alignments" at
the namespace level as the minimum alignment. The pfn level alignment
could then be an additional alignment constraint, but ndctl would
likely set them to the same value.

The "* ndr_mappings" constraint should be left out of the interface,
because that's a side effect of supporting namespace-type-blk aliasing
which no platform seems to do in practice. If for some strange reason
it's need in the future I'd rather expose the "aliasing" property
rather than fold it into the align / supported_aligns interface.
