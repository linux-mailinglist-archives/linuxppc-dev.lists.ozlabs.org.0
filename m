Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F860AE593
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:31:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJDC0kDszDqbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="bBkOZ4Wu"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJ9Z1F75zDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:29:37 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id x15so9407688pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=mLjEuW2Nfe5M00nuxF1LNdaVqZ9k8/Je2qswevi0EW4=;
 b=bBkOZ4Wuij13PimJIRNVLEV0kdvIAL6TE5nScVPy5nEN62KQN76m6e6E/sa0aeeKM1
 bsjaSFuwP7u/wC1latqV29lp8kZvzxIrxht/E67FDKMT601YGKAxVaJUPhVxwk6l+Rwx
 9O/5VHkgBfE60/iGufwSK3Yn/Ys43L0gqO9ApYRAAXoU63X0sZVpQeBzO7vWAJJEJ1Gv
 IKcl48rez87gbHpcu4dKViF/DmX+0YKWxQtE77Uh5m7vHmkJTFVfQz7XBuf8NMOGXUsC
 sU9Mffj6jSobuBEBUeCIHwx2qMkMmPOCQCRRa4NFA2B23mi/ySqmcxhTZhGzqHRaiztx
 dSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=mLjEuW2Nfe5M00nuxF1LNdaVqZ9k8/Je2qswevi0EW4=;
 b=SKlpOynPgNjmYwY2WIK6POwE9xaDPb2bb0oE/drvZ29ZKpc4Vievmtt10aVAA+52AY
 cNA6XPxsvq19Vh5vJ74MrHpg/fAOLmHayIkxj9XK1lAy3zpQsoalMr4OIeD5vug//6z9
 GhhJRWkFEHsi7WOPtDSwPflSkbepbR2NYr8i6Q8NrY1WNgmnApdzHJmibdf+pjKNuh3i
 ypTx52yb0/q7eexjjcoUfdQAgpwbjVuAY8oHj6HCOPz9VSBc1h7qTLb3Rlmp3Vww6Zst
 tl4DmZy8AgNw37T+df09DjPSwdY9uP30zJwoi8oXMfMStV828XYU3+l4ukcTz6FxVJny
 DAVw==
X-Gm-Message-State: APjAAAX+YtIeLLIasG8FJzdt/l/6zu04P2RSTSnRO1z+4L/+8AYjU3pp
 Iw/HFi/8mjKBZXECFoXaVQjgKw==
X-Google-Smtp-Source: APXvYqxKqKTmSLEQ4QjDAM7KhARdv6YijVfDU0UrJB0oi+3fq4WAvje49dU61ihMh20Wm7m4yItS4A==
X-Received: by 2002:a63:5a4d:: with SMTP id k13mr25947291pgm.174.1568104174113; 
 Tue, 10 Sep 2019 01:29:34 -0700 (PDT)
Received: from localhost ([129.41.84.64])
 by smtp.gmail.com with ESMTPSA id d10sm19818230pfh.8.2019.09.10.01.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 01:29:33 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com,
 mpe@ellerman.id.au, oohall@gmail.com
Subject: Re: [PATCH 1/2] libnvdimm/altmap: Track namespace boundaries in altmap
In-Reply-To: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
Date: Tue, 10 Sep 2019 13:59:31 +0530
Message-ID: <87lfuwa710.fsf@santosiv.in.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
> area. Some architectures map the memmap area with large page size. On
> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
> This maps a namespace size of 16G.
>
> When populating memmap region with 16MB page from the device area,
> make sure the allocated space is not used to map resources outside this
> namespace. Such usage of device area will prevent a namespace destroy.
>
> Add resource end pnf in altmap and use that to check if the memmap area
> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
> to allocation from memory.
>
> This fix kernel crash reported below:
>
> [  132.034989] WARNING: CPU: 13 PID: 13719 at mm/memremap.c:133 devm_memremap_pages_release+0x2d8/0x2e0
> [  133.464754] BUG: Unable to handle kernel data access at 0xc00c00010b204000
> [  133.464760] Faulting instruction address: 0xc00000000007580c
> [  133.464766] Oops: Kernel access of bad area, sig: 11 [#1]
> [  133.464771] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> .....
> [  133.464901] NIP [c00000000007580c] vmemmap_free+0x2ac/0x3d0
> [  133.464906] LR [c0000000000757f8] vmemmap_free+0x298/0x3d0
> [  133.464910] Call Trace:
> [  133.464914] [c000007cbfd0f7b0] [c0000000000757f8] vmemmap_free+0x298/0x3d0 (unreliable)
> [  133.464921] [c000007cbfd0f8d0] [c000000000370a44] section_deactivate+0x1a4/0x240
> [  133.464928] [c000007cbfd0f980] [c000000000386270] __remove_pages+0x3a0/0x590
> [  133.464935] [c000007cbfd0fa50] [c000000000074158] arch_remove_memory+0x88/0x160
> [  133.464942] [c000007cbfd0fae0] [c0000000003be8c0] devm_memremap_pages_release+0x150/0x2e0
> [  133.464949] [c000007cbfd0fb70] [c000000000738ea0] devm_action_release+0x30/0x50
> [  133.464955] [c000007cbfd0fb90] [c00000000073a5a4] release_nodes+0x344/0x400
> [  133.464961] [c000007cbfd0fc40] [c00000000073378c] device_release_driver_internal+0x15c/0x250
> [  133.464968] [c000007cbfd0fc80] [c00000000072fd14] unbind_store+0x104/0x110
> [  133.464973] [c000007cbfd0fcd0] [c00000000072ee24] drv_attr_store+0x44/0x70
> [  133.464981] [c000007cbfd0fcf0] [c0000000004a32bc] sysfs_kf_write+0x6c/0xa0
> [  133.464987] [c000007cbfd0fd10] [c0000000004a1dfc] kernfs_fop_write+0x17c/0x250
> [  133.464993] [c000007cbfd0fd60] [c0000000003c348c] __vfs_write+0x3c/0x70
> [  133.464999] [c000007cbfd0fd80] [c0000000003c75d0] vfs_write+0xd0/0x250
>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/init_64.c | 17 ++++++++++++++++-
>  drivers/nvdimm/pfn_devs.c |  2 ++
>  include/linux/memremap.h  |  1 +
>  3 files changed, 19 insertions(+), 1 deletion(-)

Tested-by: Santosh Sivaraj <santosh@fossix.org>

>
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index a44f6281ca3a..4e08246acd79 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -172,6 +172,21 @@ static __meminit void vmemmap_list_populate(unsigned long phys,
>  	vmemmap_list = vmem_back;
>  }
>  
> +static bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
> +				unsigned long page_size)
> +{
> +	unsigned long nr_pfn = page_size / sizeof(struct page);
> +	unsigned long start_pfn = page_to_pfn((struct page *)start);
> +
> +	if ((start_pfn + nr_pfn) > altmap->end_pfn)
> +		return true;
> +
> +	if (start_pfn < altmap->base_pfn)
> +		return true;
> +
> +	return false;
> +}
> +
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap)
>  {
> @@ -194,7 +209,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		 * fail due to alignment issues when using 16MB hugepages, so
>  		 * fall back to system memory if the altmap allocation fail.
>  		 */
> -		if (altmap) {
> +		if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
>  			p = altmap_alloc_block_buf(page_size, altmap);
>  			if (!p)
>  				pr_debug("altmap block allocation failed, falling back to system memory");
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 3e7b11cf1aae..a616d69c8224 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -618,9 +618,11 @@ static int __nvdimm_setup_pfn(struct nd_pfn *nd_pfn, struct dev_pagemap *pgmap)
>  	struct nd_namespace_common *ndns = nd_pfn->ndns;
>  	struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
>  	resource_size_t base = nsio->res.start + start_pad;
> +	resource_size_t end = nsio->res.end - end_trunc;
>  	struct vmem_altmap __altmap = {
>  		.base_pfn = init_altmap_base(base),
>  		.reserve = init_altmap_reserve(base),
> +		.end_pfn = PHYS_PFN(end),
>  	};
>  
>  	memcpy(res, &nsio->res, sizeof(*res));
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index f8a5b2a19945..c70996fe48c8 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -17,6 +17,7 @@ struct device;
>   */
>  struct vmem_altmap {
>  	const unsigned long base_pfn;
> +	const unsigned long end_pfn;
>  	const unsigned long reserve;
>  	unsigned long free;
>  	unsigned long align;
> -- 
> 2.21.0
>
> _______________________________________________
> Linux-nvdimm mailing list
> Linux-nvdimm@lists.01.org
> https://lists.01.org/mailman/listinfo/linux-nvdimm
