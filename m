Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE820D00A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 18:11:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wXYP1MHPzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 02:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wXWG12mjzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 02:09:45 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD266ACDB;
 Mon, 29 Jun 2020 16:09:41 +0000 (UTC)
Date: Mon, 29 Jun 2020 18:09:40 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
Message-ID: <20200629160940.GU21462@kitsune.suse.cz>
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm@lists.01.org,
 Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Jun 29, 2020 at 07:27:20PM +0530, Aneesh Kumar K.V wrote:
> nvdimm expect the flush routines to just mark the cache clean. The barrier
> that mark the store globally visible is done in nvdimm_flush().
> 
> Update the papr_scm driver to a simplified nvdim_flush callback that do
> only the required barrier.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/lib/pmem.c                   |  6 ------
>  arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> index 5a61aaeb6930..21210fa676e5 100644
> --- a/arch/powerpc/lib/pmem.c
> +++ b/arch/powerpc/lib/pmem.c
> @@ -19,9 +19,6 @@ static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
>  
>  	for (i = 0; i < size >> shift; i++, addr += bytes)
>  		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
> -
> -
> -	asm volatile(PPC_PHWSYNC ::: "memory");
>  }
>  
>  static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
> @@ -34,9 +31,6 @@ static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
>  
>  	for (i = 0; i < size >> shift; i++, addr += bytes)
>  		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
> -
> -
> -	asm volatile(PPC_PHWSYNC ::: "memory");
>  }
>  
>  static inline void clean_pmem_range(unsigned long start, unsigned long stop)
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 9c569078a09f..9a9a0766f8b6 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -630,6 +630,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  
>  	return 0;
>  }
> +/*
> + * We have made sure the pmem writes are done such that before calling this
> + * all the caches are flushed/clean. We use dcbf/dcbfps to ensure this. Here
> + * we just need to add the necessary barrier to make sure the above flushes
> + * are have updated persistent storage before any data access or data transfer
> + * caused by subsequent instructions is initiated.
> + */
> +static int papr_scm_flush_sync(struct nd_region *nd_region, struct bio *bio)
> +{
> +	arch_pmem_flush_barrier();
> +	return 0;
> +}
>  
>  static ssize_t flags_show(struct device *dev,
>  			  struct device_attribute *attr, char *buf)
> @@ -743,6 +755,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	ndr_desc.mapping = &mapping;
>  	ndr_desc.num_mappings = 1;
>  	ndr_desc.nd_set = &p->nd_set;
> +	ndr_desc.flush = papr_scm_flush_sync;

AFAICT currently the only device that implements flush is virtio_pmem.
How does the nfit driver get away without implementing flush?
Also the flush takes arguments that are completely unused but a user of
the pmem region must assume they are used, and call flush() on the
region rather than arch_pmem_flush_barrier() directly.  This may not
work well with md as discussed with earlier iteration of the patchest.

Thanks

Michal
