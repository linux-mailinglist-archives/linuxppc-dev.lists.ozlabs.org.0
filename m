Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F477366623
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 09:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQBk628d9z30Bq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 17:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O0AsW4Qa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O0AsW4Qa; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQBjj2Xqvz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 17:18:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQBjf5mdpz9t2g;
 Wed, 21 Apr 2021 17:18:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618989511;
 bh=qD2AQGh55lz6Vi+j4odWavjJH03GC3RyjxWsY5EY+M8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O0AsW4Qa0qMs8j1+qY+HqWaClhEvBpwiYhFj2GYtP65clvn/30KetVRVKHjJGO+36
 gmt5kOaNYeLdOdbKzBWYTys+Ieyuum4Y8RmK1/VaW/fp0BQ1x0jf6ReMoqv+gMDcaD
 7pkACGBY1NO6HurlY4CiUcFPLeX/rXdLw/NfzaV3pfJAvodMVIW6VHCns1BZ3XZP0W
 tIeKIUkCTu/tI2XB03Xe2S68Je1zWgWc5fbxhXXkaiGtVeO3ruX/16VTnbCtogupV3
 ok+q8zeRGSDIT7n1mE4yF61jnA6S+VkBk0J6nfpu0nlK4ppYNVvTlAbDorPWGpJ7no
 RLgv5Ip8aGH8w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH 1/2] powerpc: Free fdt on error in elf64_load()
In-Reply-To: <20210420190355.10059-1-nramas@linux.microsoft.com>
References: <20210420190355.10059-1-nramas@linux.microsoft.com>
Date: Wed, 21 Apr 2021 17:18:30 +1000
Message-ID: <87r1j4aywp.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 nramas@linux.microsoft.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> There are a few "goto out;" statements before the local variable "fdt"
> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> elf64_load().  This will result in an uninitialized "fdt" being passed
> to kvfree() in this function if there is an error before the call to
> of_kexec_alloc_and_setup_fdt().
>
> If there is any error after fdt is allocated, but before it is
> saved in the arch specific kimage struct, free the fdt.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>

I basically sent you the diff, so this should probably be:

  Reported-by: kernel test robot <lkp@intel.com>
  Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
  Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
  Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

Otherwise looks good to me, thanks for turning it into a proper patch
and submitting it.

cheers


> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 5a569bb51349..02662e72c53d 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>  				  initrd_len, cmdline);
>  	if (ret)
> -		goto out;
> +		goto out_free_fdt;
>  
>  	fdt_pack(fdt);
>  
> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>  	ret = kexec_add_buffer(&kbuf);
>  	if (ret)
> -		goto out;
> +		goto out_free_fdt;
>  
>  	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
>  	image->arch.fdt = fdt;
> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		pr_err("Error setting up the purgatory.\n");
>  
> +	goto out;
> +
> +out_free_fdt:
> +	kvfree(fdt);
>  out:
>  	kfree(modified_cmdline);
>  	kexec_free_elf_info(&elf_info);
>  
> -	/*
> -	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
> -	 * the FDT buffer address is saved in image->arch.fdt. In that case,
> -	 * the memory cannot be freed here in case of any other error.
> -	 */
> -	if (ret && !image->arch.fdt)
> -		kvfree(fdt);
> -
>  	return ret ? ERR_PTR(ret) : NULL;
>  }
>  
> -- 
> 2.31.0
