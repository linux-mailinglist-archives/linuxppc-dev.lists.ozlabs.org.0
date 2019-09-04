Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20933A8117
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 13:32:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NhVh5x2vzDqtY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 21:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NhSk0rJ5zDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:30:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46NhSj73vXz9sDB; Wed,  4 Sep 2019 21:30:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46NhSj37NDz9s4Y;
 Wed,  4 Sep 2019 21:30:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 15/31] powernv/fadump: support copying multiple kernel
 boot memory regions
In-Reply-To: <156630275779.8896.7854485220030978790.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630275779.8896.7854485220030978790.stgit@hbathini.in.ibm.com>
Date: Wed, 04 Sep 2019 21:30:13 +1000
Message-ID: <877e6oqoxm.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Firmware uses 32-bit field for region size while copying/backing-up

Which firmware exactly is imposing that limit?

> memory during MPIPL. So, the maximum copy size for a region would
> be a page less than 4GB (aligned to pagesize) but FADump capture
> kernel usually needs more memory than that to be preserved to avoid
> running into out of memory errors.
>
> So, request firmware to copy multiple kernel boot memory regions
> instead of just one (which worked fine for pseries as 64-bit field
> was used for size there).
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-fadump.c |   35 +++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index 91fb909..a755705 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -28,6 +28,8 @@ static int opal_fadump_unregister(struct fw_dump *fadump_conf);
>  static void opal_fadump_update_config(struct fw_dump *fadump_conf,
>  				      const struct opal_fadump_mem_struct *fdm)
>  {
> +	pr_debug("Boot memory regions count: %d\n", fdm->region_cnt);
> +
>  	/*
>  	 * The destination address of the first boot memory region is the
>  	 * destination address of boot memory regions.
> @@ -50,16 +52,35 @@ static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
>  
>  static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>  {
> -	ulong addr = fadump_conf->reserve_dump_area_start;
> +	ulong src_addr, dest_addr;
> +	int max_copy_size, cur_size, size;
>  
>  	opal_fdm = __va(fadump_conf->kernel_metadata);
>  	opal_fadump_init_metadata(opal_fdm);
>  
> -	opal_fdm->region_cnt = 1;
> -	opal_fdm->rgn[0].src	= RMA_START;
> -	opal_fdm->rgn[0].dest	= addr;
> -	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
> -	addr += fadump_conf->boot_memory_size;
> +	/*
> +	 * Firmware currently supports only 32-bit value for size,

"currently" implies it could change in future?

If it does we assume it will only increase, and we're happy that old
kernels will continue to use the 32-bit limit?

> +	 * align it to pagesize and request firmware to copy multiple
> +	 * kernel boot memory regions.
> +	 */
> +	max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
> +
> +	/* Boot memory regions */
> +	src_addr = RMA_START;

I'm not convinced using RMA_START actually makes things any clearer,
given that it's #defined as 0, and we even have a BUILD_BUG_ON() to make
sure it's never anything else.

eg:

	src_addr = 0;

> +	dest_addr = fadump_conf->reserve_dump_area_start;
> +	size = fadump_conf->boot_memory_size;
> +	while (size) {
> +		cur_size = size > max_copy_size ? max_copy_size : size;
> +
> +		opal_fdm->rgn[opal_fdm->region_cnt].src  = src_addr;
> +		opal_fdm->rgn[opal_fdm->region_cnt].dest = dest_addr;
> +		opal_fdm->rgn[opal_fdm->region_cnt].size = cur_size;
> +
> +		opal_fdm->region_cnt++;
> +		dest_addr	+= cur_size;
> +		src_addr	+= cur_size;
> +		size		-= cur_size;
> +	}
>  
>  	/*
>  	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
> @@ -70,7 +91,7 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>  
>  	opal_fadump_update_config(fadump_conf, opal_fdm);
>  
> -	return addr;
> +	return dest_addr;
>  }
>  
>  static ulong opal_fadump_get_metadata_size(void)

cheers
