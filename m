Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D37316C6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 18:22:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbRR24nfMzDrfF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 04:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbRNS61mdzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 04:20:24 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id v193so2835585oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 09:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PyHCqKSZ7LgiZ32rRV/p4xV7AmTvzAq1WHN+H1p4Y0U=;
 b=RfAyynUURju3EChaEuGo2fOZViCuWY9OnNAucz8fxbPSM6nrG3MYtHSKf1oevh1F3p
 n253/6DDyy+wZbU35bu7/WVKw3NlHtPSjpcSXi67Ja94GGkSV1Ce50dwfau+NqnKAx81
 T8D5KHOeBxl1axv7N8kFtuXbWmqyzMlN5e7OcLwVMeUlHissOjw0VCjkzUD4L74pYOd5
 NnQA/eR4GFG2ZHq69ZcCqRY/EpVzdNoaUIooHSssPg5+2cL0BlPRq6K6Z+uLF+Bz2VC9
 bNJwCG89rkN0mImN5U9baDx4hwPL2a23R5Krm/aD/aJ2prYlt9pFfSXdg/E9YILlxpb/
 0a5Q==
X-Gm-Message-State: AOAM532q8lcVaMJfpQ02cMEhgeZp99er8mZmhwuCDQENx2GVR2HUyKDA
 W04vZ+OR275lJ8cNwpel6Q==
X-Google-Smtp-Source: ABdhPJyB/NGA2/hTE5nTz1gzWgZOyECIvUaOtJm511egF+I5ViAeiURWzn7lJaRvMq7DAnkf2GQHpQ==
X-Received: by 2002:aca:554d:: with SMTP id j74mr2851552oib.96.1612977621768; 
 Wed, 10 Feb 2021 09:20:21 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s189sm561858oif.19.2021.02.10.09.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:20:20 -0800 (PST)
Received: (nullmailer pid 2370413 invoked by uid 1000);
 Wed, 10 Feb 2021 17:20:18 -0000
Date: Wed, 10 Feb 2021 11:20:18 -0600
From: Rob Herring <robh@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 05/10] powerpc: Move ima buffer fields to struct kimage
Message-ID: <20210210172018.GA2361245@robh.at.kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-6-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209182200.30606-6-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 09, 2021 at 10:21:55AM -0800, Lakshmi Ramasubramanian wrote:
> The fields ima_buffer_addr and ima_buffer_size in "struct kimage_arch"
> for powerpc are used to carry forward the IMA measurement list across
> kexec system call.  These fields are not architecture specific, but are
> currently limited to powerpc.
> 
> arch_ima_add_kexec_buffer() defined in "arch/powerpc/kexec/ima.c"
> sets ima_buffer_addr and ima_buffer_size for the kexec system call.
> This function does not have architecture specific code, but is
> currently limited to powerpc.
> 
> Move ima_buffer_addr and ima_buffer_size to "struct kimage".
> Rename arch_ima_add_kexec_buffer() to of_ima_add_kexec_buffer()
> and move it in drivers/of/kexec.c.
> 
> Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Will Deacon <will@kernel.org>
> ---
>  arch/powerpc/include/asm/ima.h     |  3 ---
>  arch/powerpc/include/asm/kexec.h   |  5 -----
>  arch/powerpc/kexec/ima.c           | 29 ++++++-----------------------
>  drivers/of/kexec.c                 | 23 +++++++++++++++++++++++
>  include/linux/kexec.h              |  3 +++
>  include/linux/of.h                 |  5 +++++
>  security/integrity/ima/ima_kexec.c |  3 ++-
>  7 files changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
> index ead488cf3981..51f64fd06c19 100644
> --- a/arch/powerpc/include/asm/ima.h
> +++ b/arch/powerpc/include/asm/ima.h
> @@ -14,9 +14,6 @@ static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
>  #endif
>  
>  #ifdef CONFIG_IMA_KEXEC
> -int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
> -			      size_t size);
> -
>  int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
>  #else
>  static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index bdd0ddb9ac4d..ecf88533d6b4 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -112,11 +112,6 @@ struct kimage_arch {
>  	unsigned long elf_headers_sz;
>  	void *elf_headers;
>  	void *fdt;
> -
> -#ifdef CONFIG_IMA_KEXEC
> -	phys_addr_t ima_buffer_addr;
> -	size_t ima_buffer_size;
> -#endif
>  };
>  
>  char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> diff --git a/arch/powerpc/kexec/ima.c b/arch/powerpc/kexec/ima.c
> index 720e50e490b6..ed38125e2f87 100644
> --- a/arch/powerpc/kexec/ima.c
> +++ b/arch/powerpc/kexec/ima.c
> @@ -128,23 +128,6 @@ void remove_ima_buffer(void *fdt, int chosen_node)
>  }
>  
>  #ifdef CONFIG_IMA_KEXEC
> -/**
> - * arch_ima_add_kexec_buffer - do arch-specific steps to add the IMA buffer
> - *
> - * Architectures should use this function to pass on the IMA buffer
> - * information to the next kernel.
> - *
> - * Return: 0 on success, negative errno on error.
> - */
> -int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
> -			      size_t size)
> -{
> -	image->arch.ima_buffer_addr = load_addr;
> -	image->arch.ima_buffer_size = size;
> -
> -	return 0;
> -}
> -
>  static int write_number(void *p, u64 value, int cells)
>  {
>  	if (cells == 1) {
> @@ -180,7 +163,7 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
>  	u8 value[16];
>  
>  	remove_ima_buffer(fdt, chosen_node);
> -	if (!image->arch.ima_buffer_size)
> +	if (!image->ima_buffer_size)
>  		return 0;
>  
>  	ret = get_addr_size_cells(&addr_cells, &size_cells);
> @@ -192,11 +175,11 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
>  	if (entry_size > sizeof(value))
>  		return -EINVAL;
>  
> -	ret = write_number(value, image->arch.ima_buffer_addr, addr_cells);
> +	ret = write_number(value, image->ima_buffer_addr, addr_cells);
>  	if (ret)
>  		return ret;
>  
> -	ret = write_number(value + 4 * addr_cells, image->arch.ima_buffer_size,
> +	ret = write_number(value + 4 * addr_cells, image->ima_buffer_size,
>  			   size_cells);
>  	if (ret)
>  		return ret;
> @@ -206,13 +189,13 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
>  	if (ret < 0)
>  		return -EINVAL;
>  
> -	ret = fdt_add_mem_rsv(fdt, image->arch.ima_buffer_addr,
> -			      image->arch.ima_buffer_size);
> +	ret = fdt_add_mem_rsv(fdt, image->ima_buffer_addr,
> +			      image->ima_buffer_size);
>  	if (ret)
>  		return -EINVAL;
>  
>  	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
> -		 image->arch.ima_buffer_addr, image->arch.ima_buffer_size);
> +		 image->ima_buffer_addr, image->ima_buffer_size);
>  
>  	return 0;
>  }
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index 469e09613cdd..9f33d215b9f2 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -63,6 +63,29 @@ static int fdt_find_and_del_mem_rsv(void *fdt, unsigned long start, unsigned lon
>  	return -ENOENT;
>  }
>  
> +#ifdef CONFIG_IMA_KEXEC
> +/**
> + * of_ima_add_kexec_buffer - Add IMA buffer for next kernel
> + *
> + * @image: kimage struct to set IMA buffer data
> + * @load_addr: Starting address where IMA buffer is loaded at
> + * @size: Number of bytes in the IMA buffer
> + *
> + * Use this function to pass on the IMA buffer information to
> + * the next kernel across kexec system call.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int of_ima_add_kexec_buffer(struct kimage *image,
> +			    unsigned long load_addr, size_t size)
> +{
> +	image->ima_buffer_addr = load_addr;
> +	image->ima_buffer_size = size;
> +

There's nothing DT specific about this function, so this is the wrong 
place for it. I would just remove it and directly set the members.

Rob
