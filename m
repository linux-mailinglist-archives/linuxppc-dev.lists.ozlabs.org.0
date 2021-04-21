Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96D3664E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ8RC2WL4z30Dk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=FGcmYqzV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=FGcmYqzV; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ8Qm690Wz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:35:26 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id q10so28679025pgj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 22:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8jaI/y7tQyXNZ0F/lE5w04XvuFfJHK0sIg7D3ehWa2I=;
 b=FGcmYqzVAfCk4jZIBjwgNdwOcU2kAKiyBAlZAz+ld7OMjWEuPFpr5v0FYC0Up6U3/M
 75av7TzaEn9BqYEkEkhPWjQ/c78xqZTzy8RSSu9IVOBalVrqxIXB/Rh1kf2RKq2CA6JX
 lVNZ3kLxnbe5kzk7m7gWUD6ABlmIhmIz37QewnwLucbI2oMaKDHXvM95aS08FmnjmUCf
 qXSu/4Rkf7GJQdQVJTOKJ4RgeDn6xoCXwATaIG4RnLlPHyhkCttwxrKj05PTriAeqpxp
 5xqF/dV4lq3b58mACsurclxYjVBOWMzVLZ943pXQ9E0F+TzdqPKU3oIo8593CsO/Qwaa
 +kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8jaI/y7tQyXNZ0F/lE5w04XvuFfJHK0sIg7D3ehWa2I=;
 b=QBJFHdz6al9mOq+3Q/PNVWTtsLh8ap5AkhiXaRBCIr7nlAQH4GdWFuxzI/xD6lH0vt
 DJh6YY0XmW0EfjLVrtbIL2oh+BQFi7+ehJHcKsadJ39tJZG1g1Z4G5uwErsoKD6N6qTb
 3iLHKYLwm8IvizmXh4JR8n2VNZX2k4GvKdKKzRyn90tWkOTwLaRNSJ40jum62c/FqpPt
 j5jW0U/E1DU33Z2sw3avvh7jDTMTtLcMmF8BTNTBurKu3lgmTeiJzNy8/QXy2W1ZXokF
 MULvTWsnC8JmqqU9Tk6fgw52svvujBBAe4Ge+neRXMqDzF/iAcKb+CYiY/2qLRZ/9V8d
 knSw==
X-Gm-Message-State: AOAM530+k98FLtx6MTQbsn0B9R11HaKZO3XCjNFXaZtxNkWHSrw86Gsg
 CdyfZ1iik6pSXgNXkpYyuaR8jg==
X-Google-Smtp-Source: ABdhPJyNYSTIUuRRGnWXbcE6S1PfsjcCNWhOMuarMEDyCvHeQDVuTaBITj2UW4m2Z1fYij25QGu6vg==
X-Received: by 2002:aa7:9394:0:b029:264:82c4:34ce with SMTP id
 t20-20020aa793940000b029026482c434cemr4944123pfe.34.1618983323069; 
 Tue, 20 Apr 2021 22:35:23 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id a20sm646452pfk.46.2021.04.20.22.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:35:22 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com, mpe@ellerman.id.au
Subject: Re: [PATCH 1/2] powerpc: Free fdt on error in elf64_load()
In-Reply-To: <20210420190355.10059-1-nramas@linux.microsoft.com>
References: <20210420190355.10059-1-nramas@linux.microsoft.com>
Date: Wed, 21 Apr 2021 11:05:17 +0530
Message-ID: <871rb4yzca.fsf@fossix.org>
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


Hi Lakshmi,

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
> ---
>  arch/powerpc/kexec/elf_64.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
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

Shouldn't there be a goto out_free_fdt if fdt_open_into fails?

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

Can just use kfree here?

Thanks,
Santosh
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
