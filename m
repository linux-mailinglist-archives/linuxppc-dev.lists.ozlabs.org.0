Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1FB32065D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 18:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjZm86QxKz30Q6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 04:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DAQJ+2zQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DAQJ+2zQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjZlk0PHDz30NJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 04:13:21 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11KH4X30110456; Sat, 20 Feb 2021 12:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5h/r7cKUsp0cobrNKkVCw6WpdLp0rAxXksScajR9jyU=;
 b=DAQJ+2zQD81YMcC7xIKvsYIPUAJDxRrOUn6cJn4+KQGkeioHFvx5kollsE3bvckz0/p5
 hj9pa4Q0KltOPsMWH5KbxGk7pujB46Mo1FK9eRRK971vS2KvLRoNBNooxZGvyXgN8vhj
 J2/8dLxPUUgybgh3gSptPxKwFHkuOiDPdbK+mDLNsbPxFRmxcUw7/ZjTJJzxeqCuUDzL
 hb6DTDgaGtuVCE6wXU524J5jGKqrJATd+Sgl30LoJ15+N8pF1TLhJj5kU00PKhWGiYrC
 +cdfGdDDLDoObTM6lmIv65UT6jnT6LsmTmgCgIXebSE+YqS3EVgCoiD7kxOTJf7apvdA 9A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36u6gq88gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Feb 2021 12:13:12 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11KHC2tL021592;
 Sat, 20 Feb 2021 17:13:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 36tt288c5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Feb 2021 17:13:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11KHD7hf33095946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Feb 2021 17:13:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C29674203F;
 Sat, 20 Feb 2021 17:13:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0627B42041;
 Sat, 20 Feb 2021 17:13:04 +0000 (GMT)
Received: from [9.211.126.148] (unknown [9.211.126.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 20 Feb 2021 17:13:03 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/kexec_file: Restore FDT size estimation for
 kdump kernel
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210220005204.1417200-1-bauerman@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <1739b7f8-2b2f-1ae2-1785-4fedc7a973ed@linux.ibm.com>
Date: Sat, 20 Feb 2021 22:43:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210220005204.1417200-1-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-20_02:2021-02-18,
 2021-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102200159
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
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/02/21 6:22 am, Thiago Jung Bauermann wrote:
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

Thanks for fixing this, Thiago.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>   arch/powerpc/include/asm/kexec.h  |  2 +-
>   arch/powerpc/kexec/elf_64.c       |  2 +-
>   arch/powerpc/kexec/file_load_64.c | 26 ++++++++------------------
>   3 files changed, 10 insertions(+), 20 deletions(-)
> 
> Applies on top of next-20210219.
> 
> Changes since v1:
> 
> - Adjusted comment describing kexec_extra_fdt_size_ppc64() as suggested
>    by Lakshmi.
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
> index 3609de30a170..297f73795a1f 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -927,37 +927,27 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>   }
>   
>   /**
> - * kexec_fdt_totalsize_ppc64 - Return the estimated size needed to setup FDT
> - *                             for kexec/kdump kernel.
> - * @image:                     kexec image being loaded.
> + * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
> + *                              setup FDT for kexec/kdump kernel.
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
