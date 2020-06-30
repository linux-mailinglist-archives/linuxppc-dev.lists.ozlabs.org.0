Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A420EAF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:34:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wn3249CFzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bb11NfHS; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wn1N3v6FzDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:33:10 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id w16so18811728ejj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5El26br7U79X9FTsBvWpGS20gRgixD5mBciJjhUv1M=;
 b=bb11NfHSu4FFKy2QuyrYfe05rVODv2164UTTfehHFGa9ozhWvY6AoJIIUQ0G8Qfm5R
 OslJLJOxrHhpW7Ky9gDdpxJ3hyhPydoCsV0DU9igvo/RifOq6QazJvkNxB3ZkQyap1Ea
 p5NMeQ+pZWGXtE1ZxRzksZaXhI9CIgvcjDC9dNTXnSZ7DkkWnPWP2HKF/sSG9WhXL3C4
 GgH/Yp4PXYTLaMEkzlAPolaCNsaO4rpGYRyB+UG1gY2382WA1GECxgCY4IO7Ce3v2mvb
 tGh22IpWS2qZos/9j/mKsMLUUDoVmrdj6eoaJRp73+9AR+xXvDz1tP3YAF5hliOU5YlY
 rgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5El26br7U79X9FTsBvWpGS20gRgixD5mBciJjhUv1M=;
 b=uhTEf4I94Uqju2Qh2CDcbIXn26VCj9cKwS+piKYM+eCuAKDgTXQL9UPsGIBjbA9ueJ
 lYp9tcF3w3oSuJBydAoleqlpzDHilsMDG2LHgR6LAuaWB70xg459nFQNK52hltryqdJm
 o9dGT39rInd1gpH6IAgC421HZdBiB+9VppvqS4ts8pFEYHS3kN/1mDBLPBg+vD8p2VBX
 iBRTJBiGFGySUjYc7nzbhzTkhrKQTOmaZSnzUY6jHY8COjXSl9wYHW5oW7pXQ1W1bDOv
 f/Dy7uBLgqsb+grKEpKGbsfnZ/jm4Xj8cCUDf/0GubU56YM2YA6mQ5qSiaH3JSGYELlh
 T1og==
X-Gm-Message-State: AOAM531egtMekQMzWyvTo13dGKjKhI1B8jOSe6RDBqQlzWfKbnG+/a9U
 uUuQdwSMXxqpGZrwdyi91aovBfOCkOR/lQdFA6IKHQ==
X-Google-Smtp-Source: ABdhPJyZu3frqYqF5fPDjIaPADdjXLw079TwMS4/EaMavTQjAYWNSCtidPM96iilj2640sUhb5M6x1LUmQaNxosHgw0=
X-Received: by 2002:a17:906:f98e:: with SMTP id
 li14mr16307856ejb.174.1593480786452; 
 Mon, 29 Jun 2020 18:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-5-aneesh.kumar@linux.ibm.com>
 <20200629202901.83516-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200629202901.83516-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Jun 2020 18:32:55 -0700
Message-ID: <CAPcyv4hgjH4We9Th2oir3NxpJEhFuLnQeCrF8auwNfF+5av8jQ@mail.gmail.com>
Subject: Re: [PATCH updated] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 1:29 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Architectures like ppc64 provide persistent memory specific barriers
> that will ensure that all stores for which the modifications are
> written to persistent storage by preceding dcbfps and dcbstps
> instructions have updated persistent storage before any data
> access or data transfer caused by subsequent instructions is initiated.
> This is in addition to the ordering done by wmb()
>
> Update nvdimm core such that architecture can use barriers other than
> wmb to ensure all previous writes are architecturally visible for
> the platform buffer flush.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/md/dm-writecache.c   | 2 +-
>  drivers/nvdimm/region_devs.c | 8 ++++----
>  include/linux/libnvdimm.h    | 4 ++++
>  3 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 74f3c506f084..8c6b6dce64e2 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -536,7 +536,7 @@ static void ssd_commit_superblock(struct dm_writecache *wc)
>  static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
>  {
>         if (WC_MODE_PMEM(wc))
> -               wmb();
> +               arch_pmem_flush_barrier();
>         else
>                 ssd_commit_flushed(wc, wait_for_ios);
>  }
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index 4502f9c4708d..b308ad09b63d 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -1206,13 +1206,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
>         idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
>
>         /*
> -        * The first wmb() is needed to 'sfence' all previous writes
> -        * such that they are architecturally visible for the platform
> -        * buffer flush.  Note that we've already arranged for pmem
> +        * The first arch_pmem_flush_barrier() is needed to 'sfence' all
> +        * previous writes such that they are architecturally visible for
> +        * the platform buffer flush. Note that we've already arranged for pmem
>          * writes to avoid the cache via memcpy_flushcache().  The final
>          * wmb() ensures ordering for the NVDIMM flush write.
>          */
> -       wmb();
> +       arch_pmem_flush_barrier();
>         for (i = 0; i < nd_region->ndr_mappings; i++)
>                 if (ndrd_get_flush_wpq(ndrd, i, 0))
>                         writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> index 18da4059be09..66f6c65bd789 100644
> --- a/include/linux/libnvdimm.h
> +++ b/include/linux/libnvdimm.h
> @@ -286,4 +286,8 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
>  }
>  #endif
>
> +#ifndef arch_pmem_flush_barrier
> +#define arch_pmem_flush_barrier() wmb()
> +#endif

I think it is out of place to define this in libnvdimm.h and it is odd
to give it such a long name. The other pmem api helpers like
arch_wb_cache_pmem() and arch_invalidate_pmem() are function calls for
libnvdimm driver operations, this barrier is just an instruction and
is closer to wmb() than the pmem api routine.

Since it is a store fence for pmem, so let's just call it pmem_wmb()
and define the generic version in include/linux/compiler.h. It should
probably also be documented alongside dma_wmb() in
Documentation/memory-barriers.txt about why code would use it over
wmb(), and why a symmetric pmem_rmb() is not needed.
