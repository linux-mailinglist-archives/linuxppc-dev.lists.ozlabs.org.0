Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0320EEFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 09:08:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wwSJ1JSvzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 17:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aRWUx2W8; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wwQP2lW4zDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 17:06:48 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id d18so9487613edv.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOHXLXiPy8R00NgKysJaWWFjmzNtcYqNK+mi1WdOutw=;
 b=aRWUx2W81NNcrchgMPll/Z7N2hiMDPfuHGV9bFT7lw9HAU4Rm66GPks+xoAPap2QZt
 wr56Gn8IbHgdrIt9pRD4szoAXosVUOU1rgpO1L6Vltf9UJyu+Cm4PrWHZVMlB8pdV9X7
 M+zW1k7xdETjKEd3Wbep2yOhCpxwhKuEwpUi50KDwRuWKjtkwsIwhTEZ6bK6RWTGtZFT
 KzpzcOTc4p8I/Q9BT32CtRZ3ASsgtcJj3UVzsrRrOXRFpkzTus4TIg91v1XPxBrJCtsx
 7NkLzFOAjRIWN9XKmmLQip7AaAjkDjTRIJLOUVDruEgGYyesmmD4qAT66RaS8iMG7m2u
 hnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOHXLXiPy8R00NgKysJaWWFjmzNtcYqNK+mi1WdOutw=;
 b=K0Q/wjKoNvCDm6nIVuW1I8MEgD5sdvckI6zFSEJ2M0pqEijUAEQpAO/aaMHJbP7a+x
 93GdQY+lO45EEeFTB/HNTXErsOqc3jT6NoD1JX9dBiGXuEXNiQ+QvIsMhEGHfQP7IROV
 vjsPRU0tRvAAAIMDJG0D6PTYdHjjgWZdzzJuvy4AGngu/TSIW0BX6m7MCNhczwpo1l6L
 wE6MtxEG8E4E0yeLjAmmOI8dsRIWLyh4vCBU/hR/f5vfbB+Su6i+iFKqIOMhnHS+TqAP
 dM+TBWAkjUHPZcAvLPcJWB+jRkWt0KPAWRxf4uBkg+X94SkPwpkG2QdnOa7e/25uYRtS
 9uRw==
X-Gm-Message-State: AOAM531PBwjqTc7JxR5Wvze+5KQGsX9+P0/FrEltgO6GsdAAYWBeAsEQ
 5zes0jvvHdrKNg6pNZzBlEvJBZIzSWhZOrLE2WHiSw==
X-Google-Smtp-Source: ABdhPJyuHGY9zwKGPDOA6NV90cpDF4b3zYZQr6SyNJ+RT6kLD+iNzRlS/wOL8rXK0My8BzuqXE9HTJl//ThhTvvYSE0=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr2080246edb.154.1593500804741; 
 Tue, 30 Jun 2020 00:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-5-aneesh.kumar@linux.ibm.com>
 <20200629202901.83516-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hgjH4We9Th2oir3NxpJEhFuLnQeCrF8auwNfF+5av8jQ@mail.gmail.com>
 <87imf9gn9w.fsf@linux.ibm.com>
In-Reply-To: <87imf9gn9w.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jun 2020 00:06:33 -0700
Message-ID: <CAPcyv4hbECX+7cvX+eT97jvDFUTjQbUEqExZKpV_moDWMFzJ6A@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 10:02 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Mon, Jun 29, 2020 at 1:29 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Architectures like ppc64 provide persistent memory specific barriers
> >> that will ensure that all stores for which the modifications are
> >> written to persistent storage by preceding dcbfps and dcbstps
> >> instructions have updated persistent storage before any data
> >> access or data transfer caused by subsequent instructions is initiated.
> >> This is in addition to the ordering done by wmb()
> >>
> >> Update nvdimm core such that architecture can use barriers other than
> >> wmb to ensure all previous writes are architecturally visible for
> >> the platform buffer flush.
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  drivers/md/dm-writecache.c   | 2 +-
> >>  drivers/nvdimm/region_devs.c | 8 ++++----
> >>  include/linux/libnvdimm.h    | 4 ++++
> >>  3 files changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> >> index 74f3c506f084..8c6b6dce64e2 100644
> >> --- a/drivers/md/dm-writecache.c
> >> +++ b/drivers/md/dm-writecache.c
> >> @@ -536,7 +536,7 @@ static void ssd_commit_superblock(struct dm_writecache *wc)
> >>  static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
> >>  {
> >>         if (WC_MODE_PMEM(wc))
> >> -               wmb();
> >> +               arch_pmem_flush_barrier();
> >>         else
> >>                 ssd_commit_flushed(wc, wait_for_ios);
> >>  }
> >> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> >> index 4502f9c4708d..b308ad09b63d 100644
> >> --- a/drivers/nvdimm/region_devs.c
> >> +++ b/drivers/nvdimm/region_devs.c
> >> @@ -1206,13 +1206,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
> >>         idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
> >>
> >>         /*
> >> -        * The first wmb() is needed to 'sfence' all previous writes
> >> -        * such that they are architecturally visible for the platform
> >> -        * buffer flush.  Note that we've already arranged for pmem
> >> +        * The first arch_pmem_flush_barrier() is needed to 'sfence' all
> >> +        * previous writes such that they are architecturally visible for
> >> +        * the platform buffer flush. Note that we've already arranged for pmem
> >>          * writes to avoid the cache via memcpy_flushcache().  The final
> >>          * wmb() ensures ordering for the NVDIMM flush write.
> >>          */
> >> -       wmb();
> >> +       arch_pmem_flush_barrier();
> >>         for (i = 0; i < nd_region->ndr_mappings; i++)
> >>                 if (ndrd_get_flush_wpq(ndrd, i, 0))
> >>                         writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> >> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> >> index 18da4059be09..66f6c65bd789 100644
> >> --- a/include/linux/libnvdimm.h
> >> +++ b/include/linux/libnvdimm.h
> >> @@ -286,4 +286,8 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
> >>  }
> >>  #endif
> >>
> >> +#ifndef arch_pmem_flush_barrier
> >> +#define arch_pmem_flush_barrier() wmb()
> >> +#endif
> >
> > I think it is out of place to define this in libnvdimm.h and it is odd
> > to give it such a long name. The other pmem api helpers like
> > arch_wb_cache_pmem() and arch_invalidate_pmem() are function calls for
> > libnvdimm driver operations, this barrier is just an instruction and
> > is closer to wmb() than the pmem api routine.
> >
> > Since it is a store fence for pmem, so let's just call it pmem_wmb()
> > and define the generic version in include/linux/compiler.h. It should
> > probably also be documented alongside dma_wmb() in
> > Documentation/memory-barriers.txt about why code would use it over
> > wmb(), and why a symmetric pmem_rmb() is not needed.
>
> How about the below? I used pmem_barrier() instead of pmem_wmb().

Why? A barrier() is a bi-directional ordering mechanic for reads and
writes, and the proposed semantics mechanism only orders writes +
persistence. Otherwise the default fallback to wmb() on archs that
don't override it does not make sense.

> I
> guess we wanted this to order() any data access not jus the following
> stores to persistent storage?

Why?

> W.r.t why a symmetric pmem_rmb() is not
> needed I was not sure how to explain that. Are you suggesting to explain
> why a read/load from persistent storage don't want to wait for
> pmem_barrier() ?

I would expect that the explanation is that a typical rmb() is
sufficient and that there is nothing pmem specific semantic for read
ordering for pmem vs normal read-barrier semantics.

>
> modified   Documentation/memory-barriers.txt
> @@ -1935,6 +1935,16 @@ There are some more advanced barrier functions:
>       relaxed I/O accessors and the Documentation/DMA-API.txt file for more
>       information on consistent memory.
>
> + (*) pmem_barrier();
> +
> +     These are for use with persistent memory to esure the ordering of stores
> +     to persistent memory region.

If it was just ordering I would expect a typical wmb() to be
sufficient, why is the pmem-specific instruction needed? I thought it
was handshaking with hardware to ensure acceptance into a persistence
domain *in addition* to ordering the stores.

> +     For example, after a non temporal write to persistent storage we use pmem_barrier()
> +     to ensures that stores have updated the persistent storage before
> +     any data access or data transfer caused by subsequent instructions is initiated.

Isn't the ordering aspect is irrelevant relative to traditional wmb()?
For example if you used the wrong sync instruction the store ordering
will still be correct it would just not persist at the same time as
barrier completes. Or am I misunderstanding how these new instructions
are distinct?

> +
>
>  ===============================
>  IMPLICIT KERNEL MEMORY BARRIERS
> modified   arch/powerpc/include/asm/barrier.h
> @@ -97,6 +97,19 @@ do {                                                                 \
>  #define barrier_nospec()
>  #endif /* CONFIG_PPC_BARRIER_NOSPEC */
>
> +/*
> + * pmem_barrier() ensures that all stores for which the modification
> + * are written to persistent storage by preceding dcbfps/dcbstps
> + * instructions have updated persistent storage before any data
> + * access or data transfer caused by subsequent instructions is
> + * initiated.
> + */
> +#define pmem_barrier pmem_barrier
> +static inline void pmem_barrier(void)
> +{
> +       asm volatile(PPC_PHWSYNC ::: "memory");
> +}
> +
>  #include <asm-generic/barrier.h>
>
>  #endif /* _ASM_POWERPC_BARRIER_H */
> modified   include/asm-generic/barrier.h
> @@ -257,5 +257,16 @@ do {                                                                       \
>  })
>  #endif
>
> +/*
> + * pmem_barrier() ensures that all stores for which the modification
> + * are written to persistent storage by preceding instructions have
> + * updated persistent storage before any data  access or data transfer
> + * caused by subsequent instructions is
> + * initiated.
> + */
> +#ifndef pmem_barrier
> +#define pmem_barrier  wmb()
> +#endif
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __ASM_GENERIC_BARRIER_H */
>
