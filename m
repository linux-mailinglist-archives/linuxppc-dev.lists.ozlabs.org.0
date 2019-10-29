Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B0E7FC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 06:32:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472KwG3CHHzF1SD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 16:32:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="EiH/Xcim"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Kt22rhRzF1Rx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 16:30:15 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id c7so8754199otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 22:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GG2mcENYWoyxz0HNqi7Mitc9AmGpMgCrZSMeTfYnJmI=;
 b=EiH/Xcim9gHQq6PZe6LwWSymVTM+KWidfBecd0ug/41NEvs9izWgB9AVlvFKAudq4d
 106KVG/DHM0LafAJ/kHgnSUcU++L8VRa+Pl1WQNGt+jigS2UD5VpN5dJ89hE6EjpCr4h
 ex3UA6vtYDxCPlXMS5DREDB9tb/2BVpSWOP5rIQU0KUmz59/5jqbmpJ/9HonbXmcXBep
 450QC0rhm3GQ7K+59t1iIrWtTAnt2svjrD5qobiLr+PXqmEyFRerwVOjGiEWA1SNd36Q
 5yrmsYpyy7UtjrkCrHKxu6kS/rmjKp6DJU3iu2eb0tN/q+PqMo4FSiz+JxAI7JEVkHV4
 LATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GG2mcENYWoyxz0HNqi7Mitc9AmGpMgCrZSMeTfYnJmI=;
 b=t4ULDCEAyD9aKfdG65ypPrhwGM0ML6r2cxQtCCqxkzcHSJiDNR9TgQOLXu1f/TFMJM
 JbI+dSYtajoqaoRLpG3QP6eVkkZta0JjeUVNFcEJbSaKYSQqCJpyvgqsqlvRWlythHaa
 1zJXSCj4a5oJE9yW41mO9mt/wADNQ8+9/R5xi5y56HmnYvUgKu0ze9y1H+v2ACu7kGGn
 1wWPuuWF3c0yjWW5u+L0tfKtdVTyCnryuxOu9EmhozJv6Od4Ke64aOchjr5Qdx81ENCo
 oAZgMN8ImTPKYrBZ9CDym2hD3oNpTZCeMnv/OHy2AvIq0cXgC+CXyaz+zksFXHSlp246
 641g==
X-Gm-Message-State: APjAAAVciT1RE2NzuCj8iXl4dAM0QOy+qxTRYd2wUNYN2x+QTFMF4A7H
 b6Xa5LjpPKbw8SptqAkAnp4B3hKii/S80GuW11xULA==
X-Google-Smtp-Source: APXvYqw195Mv9lFqxjCruWKF+YPhN/OmmyHjafORJua6VrEG9aYz4zJdSJPSKMTJF20Ez7P/nC2GadPG/MOFax3QCic=
X-Received: by 2002:a05:6830:18d1:: with SMTP id
 v17mr2544942ote.71.1572327012510; 
 Mon, 28 Oct 2019 22:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
In-Reply-To: <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 28 Oct 2019 22:30:01 -0700
Message-ID: <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
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

On Mon, Oct 28, 2019 at 9:35 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 10/29/19 4:38 AM, Dan Williams wrote:
> > On Mon, Oct 28, 2019 at 2:48 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> The page size used to map the namespace is arch dependent. For example
> >> architectures like ppc64 use 16MB page size for direct-mapping. If the namespace
> >> size is not aligned to the mapping page size, we can observe kernel crash
> >> during namespace init and destroy.
> >>
> >> This is due to kernel doing partial map/unmap of the resource range
> >>
> >> BUG: Unable to handle kernel data access at 0xc001000406000000
> >> Faulting instruction address: 0xc000000000090790
> >> NIP [c000000000090790] arch_add_memory+0xc0/0x130
> >> LR [c000000000090744] arch_add_memory+0x74/0x130
> >> Call Trace:
> >>   arch_add_memory+0x74/0x130 (unreliable)
> >>   memremap_pages+0x74c/0xa30
> >>   devm_memremap_pages+0x3c/0xa0
> >>   pmem_attach_disk+0x188/0x770
> >>   nvdimm_bus_probe+0xd8/0x470
> >>   really_probe+0x148/0x570
> >>   driver_probe_device+0x19c/0x1d0
> >>   device_driver_attach+0xcc/0x100
> >>   bind_store+0x134/0x1c0
> >>   drv_attr_store+0x44/0x60
> >>   sysfs_kf_write+0x74/0xc0
> >>   kernfs_fop_write+0x1b4/0x290
> >>   __vfs_write+0x3c/0x70
> >>   vfs_write+0xd0/0x260
> >>   ksys_write+0xdc/0x130
> >>   system_call+0x5c/0x68
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>   arch/arm64/mm/flush.c     | 11 +++++++++++
> >>   arch/powerpc/lib/pmem.c   | 21 +++++++++++++++++++--
> >>   arch/x86/mm/pageattr.c    | 12 ++++++++++++
> >>   include/linux/libnvdimm.h |  1 +
> >>   4 files changed, 43 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
> >> index ac485163a4a7..90c54c600023 100644
> >> --- a/arch/arm64/mm/flush.c
> >> +++ b/arch/arm64/mm/flush.c
> >> @@ -91,4 +91,15 @@ void arch_invalidate_pmem(void *addr, size_t size)
> >>          __inval_dcache_area(addr, size);
> >>   }
> >>   EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> >> +
> >> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
> >> +{
> >> +       u32 remainder;
> >> +
> >> +       div_u64_rem(size, PAGE_SIZE * ndr_mappings, &remainder);
> >> +       if (remainder)
> >> +               return PAGE_SIZE * ndr_mappings;
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(arch_validate_namespace_size);
> >>   #endif
> >> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> >> index 377712e85605..2e661a08dae5 100644
> >> --- a/arch/powerpc/lib/pmem.c
> >> +++ b/arch/powerpc/lib/pmem.c
> >> @@ -17,14 +17,31 @@ void arch_wb_cache_pmem(void *addr, size_t size)
> >>          unsigned long start = (unsigned long) addr;
> >>          flush_dcache_range(start, start + size);
> >>   }
> >> -EXPORT_SYMBOL(arch_wb_cache_pmem);
> >> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
> >>
> >>   void arch_invalidate_pmem(void *addr, size_t size)
> >>   {
> >>          unsigned long start = (unsigned long) addr;
> >>          flush_dcache_range(start, start + size);
> >>   }
> >> -EXPORT_SYMBOL(arch_invalidate_pmem);
> >> +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> >> +
> >> +unsigned long arch_validate_namespace_size(unsigned int ndr_mappings, unsigned long size)
> >> +{
> >> +       u32 remainder;
> >> +       unsigned long linear_map_size;
> >> +
> >> +       if (radix_enabled())
> >> +               linear_map_size = PAGE_SIZE;
> >> +       else
> >> +               linear_map_size = (1UL << mmu_psize_defs[mmu_linear_psize].shift);
> >
> > This seems more a "supported_alignments" problem, and less a namespace
> > size or PAGE_SIZE problem, because if the starting address is
> > misaligned this size validation can still succeed when it shouldn't.
> >
>
>
> Isn't supported_alignments an indication of how user want the namespace
> to be mapped to applications?  Ie, with the above restrictions we can
> still do both 64K and 16M mapping of the namespace to userspace.

True, for the pfn device and the device-dax mapping size, but I'm
suggesting adding another instance of alignment control at the raw
namespace level. That would need to be disconnected from the
device-dax page mapping granularity.

>
> Also for supported alignment the huge page mapping is further  dependent
> on the THP feature.
>
> The restrictions here are mostly w.r.t the direct-mapping page size used
> by some architecture.

Right, that's a base requirement for the namespace that can be
independent of the user page mapping size for device-dax.
