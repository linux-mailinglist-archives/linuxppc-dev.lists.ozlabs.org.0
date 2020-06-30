Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53E20FCB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 21:23:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xDmf5k0RzDqnx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 05:23:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xWLO35/y; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xDkS5fkRzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 05:21:45 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id d18so11621444edv.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WDWjFuo2aOkZOY1ZGe7doLco0wns6mMkfz03xEpmifg=;
 b=xWLO35/yg26+kdxUsrYHTQL6K3zVldhtYUPjSOyszohWugfGdSvylFV0Mr+ezsFUTg
 6/E8ksTtih00DXi2eAJ9yFSaT26tKz13dKfjZ3hbdhvPcmiVkjn0JMxPhlS5QE6Ygqro
 8t289HYwrLWB6woifs927H+xl2SrEO2h0noUuPOAorzlukQbIyNuwQaSwqCyQnU/IKRX
 RfGnJRgoLwfVkkFvmwEnsdd9hagwWr0I0T+/mWziQ7Zh6VzaceaC1xS6+YwYcHcuTA+4
 cDJgmQ+EJ1Nl1YVfFQYg74mVGpuF2Z26sXT0YZwokMYj9HEstPgjg3F+0fcPXC2sZmlT
 4WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDWjFuo2aOkZOY1ZGe7doLco0wns6mMkfz03xEpmifg=;
 b=qQSzis/bhlnXtKPKPXoidlnMLmjTeFb+xDkfLIHTRXokNfPPgnOek4CjpJ+/MEaWC6
 0QCftvqD2y+wJJwl++H75D6Es4OjorWQaVsoTn4WRo24Svrl8jyf5EfshxwFSf+Q/TQc
 F4YCyDaoaNK7UaVxM68VJ/Y1ydPr9YzjS/tzt8ccnikc2ynDP5CPT87AqVlLJqdkTEuy
 3xioXEXn3bfyNV+VWRgo0lajPgOF9gTH+RTvoXyhmA9jtpaTSAEIc1rnSSQenzTxmXJm
 3PwOjTzVQdexgTx6aRtbLBhw0ZKEF3GO6Szg6h4mcXt8lEj9UQ0MLNEcykrRgsUBPMTV
 6erw==
X-Gm-Message-State: AOAM530MB92wqix4HpOkuVv+/fYBou7e4+VY/aXx5/WVOum7Su5+wgQb
 YXMURBT7b09PvfA9MTRR6IgwL/atpKYKKBl/tHywgQ==
X-Google-Smtp-Source: ABdhPJyhSrwK4CR021aEYPPvdNRkgAK4t99TaVUK9PKyiHPUczetV1NQ3PR78r7W0/4Z+4ctV0hlkj6DKH+Et+qIcAQ=
X-Received: by 2002:aa7:c24d:: with SMTP id y13mr25877146edo.123.1593544901310; 
 Tue, 30 Jun 2020 12:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-5-aneesh.kumar@linux.ibm.com>
 <20200629202901.83516-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hgjH4We9Th2oir3NxpJEhFuLnQeCrF8auwNfF+5av8jQ@mail.gmail.com>
 <87imf9gn9w.fsf@linux.ibm.com>
 <CAPcyv4hbECX+7cvX+eT97jvDFUTjQbUEqExZKpV_moDWMFzJ6A@mail.gmail.com>
 <03cf6d12-544f-154d-18da-a6cd204998ee@linux.ibm.com>
 <871rlwhg87.fsf@linux.ibm.com>
In-Reply-To: <871rlwhg87.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jun 2020 12:21:30 -0700
Message-ID: <CAPcyv4i_B==LxcxQE9PuhUEGUQCNkECCtVzHiXvggLEgnMfTBA@mail.gmail.com>
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

On Tue, Jun 30, 2020 at 5:48 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Update patch.
>
> From 1e6aa6c4182e14ec5d6bf878ae44c3f69ebff745 Mon Sep 17 00:00:00 2001
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Date: Tue, 12 May 2020 20:58:33 +0530
> Subject: [PATCH] libnvdimm/nvdimm/flush: Allow architecture to override the
>  flush barrier
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

Looks good, after a few minor fixups below you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

I'm expecting that these will be merged through the powerpc tree since
they mostly impact powerpc with only minor touches to libnvdimm.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  Documentation/memory-barriers.txt | 14 ++++++++++++++
>  drivers/md/dm-writecache.c        |  2 +-
>  drivers/nvdimm/region_devs.c      |  8 ++++----
>  include/asm-generic/barrier.h     | 10 ++++++++++
>  4 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index eaabc3134294..340273a6b18e 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -1935,6 +1935,20 @@ There are some more advanced barrier functions:
>       relaxed I/O accessors and the Documentation/DMA-API.txt file for more
>       information on consistent memory.
>
> + (*) pmem_wmb();
> +
> +     This is for use with persistent memory to ensure that stores for which
> +     modifications are written to persistent storage have updated the persistent
> +     storage.

I think this should be:

s/updated the persistent storage/reached a platform durability domain/

> +
> +     For example, after a non-temporal write to pmem region, we use pmem_wmb()
> +     to ensures that stores have updated the persistent storage. This ensures

s/ensures/ensure/

...and the same comment about "persistent storage" because pmem_wmb()
as implemented on x86 does not guarantee that the writes have reached
storage it ensures that writes have reached buffers / queues that are
within the ADR (platform persistence / durability) domain.

> +     that stores have updated persistent storage before any data access or
> +     data transfer caused by subsequent instructions is initiated. This is
> +     in addition to the ordering done by wmb().
> +
> +     For load from persistent memory, existing read memory barriers are sufficient
> +     to ensure read ordering.
>
>  ===============================
>  IMPLICIT KERNEL MEMORY BARRIERS
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 74f3c506f084..00534fa4a384 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -536,7 +536,7 @@ static void ssd_commit_superblock(struct dm_writecache *wc)
>  static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
>  {
>         if (WC_MODE_PMEM(wc))
> -               wmb();
> +               pmem_wmb();
>         else
>                 ssd_commit_flushed(wc, wait_for_ios);
>  }
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index 4502f9c4708d..2333b290bdcf 100644
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

One missed arch_pmem_flush_barrier() rename.

> +        * previous writes such that they are architecturally visible for
> +        * the platform buffer flush. Note that we've already arranged for pmem
>          * writes to avoid the cache via memcpy_flushcache().  The final
>          * wmb() ensures ordering for the NVDIMM flush write.
>          */
> -       wmb();
> +       pmem_wmb();
>         for (i = 0; i < nd_region->ndr_mappings; i++)
>                 if (ndrd_get_flush_wpq(ndrd, i, 0))
>                         writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index 2eacaf7d62f6..879d68faec1d 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -257,5 +257,15 @@ do {                                                                       \
>  })
>  #endif
>
> +/*
> + * pmem_barrier() ensures that all stores for which the modification

One missed pmem_barrier() conversion.

> + * are written to persistent storage by preceding instructions have
> + * updated persistent storage before any data  access or data transfer
> + * caused by subsequent instructions is initiated.
> + */
> +#ifndef pmem_wmb
> +#define pmem_wmb()     wmb()
> +#endif
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __ASM_GENERIC_BARRIER_H */
> --
> 2.26.2
>
