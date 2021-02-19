Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C04E31FC84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhxB92vb4z3cQd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 03:00:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=HaaRbJuh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=HaaRbJuh; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dhx9j1TB4z30Hf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 03:00:08 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id BEFE220B6C40;
 Fri, 19 Feb 2021 08:00:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BEFE220B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613750403;
 bh=gWO09POLpbRs3/EzLyGBCNzjamt7jL02WPeWTp/RZMM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HaaRbJuhrAjvvBhGOuR/dbZ7vG7nycnwhtUQrt56KCA5pjF2GLTBGeHfs/mATyroP
 1yr3MLwn6jxIxHnnz7k8hh1ZwCTMgF9I81bZ88j4NZtxr6GH0NBtAue8K0mdkJ4W7R
 cEjzn7s92rpJlEHrUZH3IWrQnSvJDkNsQJdwIPLk=
Subject: Re: [PATCH] powerpc/kexec_file: Restore FDT size estimation for kdump
 kernel
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210219142552.762608-1-bauerman@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5a28907e-9231-7a19-62ff-3ed1c0282642@linux.microsoft.com>
Date: Fri, 19 Feb 2021 08:00:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219142552.762608-1-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Rob Herring <robh@kernel.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/19/21 6:25 AM, Thiago Jung Bauermann wrote:

One small nit in the function header (please see below), but otherwise 
the change looks good.

Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

> Commit 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump
> kernel") fixed how elf64_load() estimates the FDT size needed by the
> crashdump kernel.
> 
> At the same time, commit 130b2d59cec0 ("powerpc: Use common
> of_kexec_alloc_and_setup_fdt()") changed the same code to use the generic
> function of_kexec_alloc_and_setup_fdt() to calculate the FDT size. That
> change made the code overestimate it a bit by counting twice the space
> required for the kernel command line and /chosen properties.
> 
> Therefore change kexec_fdt_totalsize_ppc64() to calculate just the extra
> space needed by the kdump kernel, and change the function name so that it
> better reflects what the function is now doing.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/kexec.h  |  2 +-
>   arch/powerpc/kexec/elf_64.c       |  2 +-
>   arch/powerpc/kexec/file_load_64.c | 26 ++++++++------------------
>   3 files changed, 10 insertions(+), 20 deletions(-)
> 
> Applies on top of next-20210219.
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index baab158e215c..5a11cc8d2350 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -128,7 +128,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
>   int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>   			  const void *fdt, unsigned long kernel_load_addr,
>   			  unsigned long fdt_load_addr);
> -unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image);
> +unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
>   int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>   			unsigned long initrd_load_addr,
>   			unsigned long initrd_len, const char *cmdline);
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 0492ca6003f3..5a569bb51349 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   
>   	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
>   					   initrd_len, cmdline,
> -					   kexec_fdt_totalsize_ppc64(image));
> +					   kexec_extra_fdt_size_ppc64(image));
>   	if (!fdt) {
>   		pr_err("Error setting up the new device tree.\n");
>   		ret = -EINVAL;
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 3609de30a170..8541ba731908 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -927,37 +927,27 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>   }
>   
>   /**
> - * kexec_fdt_totalsize_ppc64 - Return the estimated size needed to setup FDT
> - *                             for kexec/kdump kernel.
> - * @image:                     kexec image being loaded.
> + * kexec_extra_fdt_size_ppc63 - Return the estimated size needed to setup FDT

Perhaps change to

"Return the estimated additional size needed to setup FDT for 
kexec/kdump kernel"?

  -lakshmi

> + *                              for kexec/kdump kernel.
> + * @image:                      kexec image being loaded.
>    *
> - * Returns the estimated size needed for kexec/kdump kernel FDT.
> + * Returns the estimated extra size needed for kexec/kdump kernel FDT.
>    */
> -unsigned int kexec_fdt_totalsize_ppc64(struct kimage *image)
> +unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   {
> -	unsigned int fdt_size;
>   	u64 usm_entries;
>   
> -	/*
> -	 * The below estimate more than accounts for a typical kexec case where
> -	 * the additional space is to accommodate things like kexec cmdline,
> -	 * chosen node with properties for initrd start & end addresses and
> -	 * a property to indicate kexec boot..
> -	 */
> -	fdt_size = fdt_totalsize(initial_boot_params) + (2 * COMMAND_LINE_SIZE);
>   	if (image->type != KEXEC_TYPE_CRASH)
> -		return fdt_size;
> +		return 0;
>   
>   	/*
> -	 * For kdump kernel, also account for linux,usable-memory and
> +	 * For kdump kernel, account for linux,usable-memory and
>   	 * linux,drconf-usable-memory properties. Get an approximate on the
>   	 * number of usable memory entries and use for FDT size estimation.
>   	 */
>   	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>   		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
> -	fdt_size += (unsigned int)(usm_entries * sizeof(u64));
> -
> -	return fdt_size;
> +	return (unsigned int)(usm_entries * sizeof(u64));
>   }
>   
>   /**
> 

