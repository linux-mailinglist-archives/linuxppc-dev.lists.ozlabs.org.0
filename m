Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E01B316C8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 18:26:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbRWt5tPXzDwbZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 04:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbRRk6KGczDsGT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 04:23:14 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id e4so2506321ote.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 09:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ysC2kY6lw48OjNmEWfhszlohQCXKkxkhQTUpID2nTYg=;
 b=jShEaGyUhf4vn4HIL9PL5WcCFLwIf7NcuQcLJ5GUTA8/XlINfVbrMI8K0/Al0zocTa
 KTOjJCLN3+dSTR/kpinTX0FWR2BuPaHNsGKla6cnFdjyNe2FzP8/5m9osHZ5A1ga8J9H
 qTfTGJxkeut5J78LY+1C2rpK01N6xT2QLlfG/peXeBpaS14cvG+nUraDtgWQ0hMBuxe/
 +b1XD1gJxUh346xDEKD3qnq/lg8urFn3U/QfRdAhsn4PauCWNvwbUzM7NgH77JGTLuba
 tXE89QscmCJp+q2X/PhyMGzDzmuenRTht2YrUEjSZmgxudnewjuojW27u9YOCW9sjQot
 hiaA==
X-Gm-Message-State: AOAM5308V3pu4zMsU1uVVHERAGmfmf9ElgUmTrOAVFD7AE2hAf3oeUdp
 c7ol7rau16rYFVlcfWvN8Q==
X-Google-Smtp-Source: ABdhPJwE5BhT3SPXPq5LRi6swSDYLhg7y3dk3bPWoWebwf1b/z0lrSn+hj0FAXHdNoclCp1hPz1ZVQ==
X-Received: by 2002:a05:6830:1c6c:: with SMTP id
 s12mr2957430otg.125.1612977790317; 
 Wed, 10 Feb 2021 09:23:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 203sm566875oie.14.2021.02.10.09.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:23:09 -0800 (PST)
Received: (nullmailer pid 2375394 invoked by uid 1000);
 Wed, 10 Feb 2021 17:23:07 -0000
Date: Wed, 10 Feb 2021 11:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
Message-ID: <20210210172307.GB2361245@robh.at.kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209182200.30606-3-nramas@linux.microsoft.com>
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

On Tue, Feb 09, 2021 at 10:21:52AM -0800, Lakshmi Ramasubramanian wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Both arm64 and powerpc do essentially the same FDT /chosen setup for
> kexec.  The differences are either omissions that arm64 should have
> or additional properties that will be ignored.  The setup code can be
> combined and shared by both powerpc and arm64.
> 
> The differences relative to the arm64 version:
>  - If /chosen doesn't exist, it will be created (should never happen).
>  - Any old dtb and initrd reserved memory will be released.
>  - The new initrd and elfcorehdr are marked reserved.
>  - "linux,booted-from-kexec" is set.
> 
> The differences relative to the powerpc version:
>  - "kaslr-seed" and "rng-seed" may be set.
>  - "linux,elfcorehdr" is set.
>  - Any existing "linux,usable-memory-range" is removed.
> 
> Combine the code for setting up the /chosen node in the FDT and updating
> the memory reservation for kexec, for powerpc and arm64, in
> of_kexec_alloc_and_setup_fdt() and move it to "drivers/of/kexec.c".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  drivers/of/Makefile |   6 ++
>  drivers/of/kexec.c  | 258 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h  |  13 +++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/of/kexec.c
> 
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 6e1e5212f058..c13b982084a3 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -14,4 +14,10 @@ obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
>  obj-$(CONFIG_OF_NUMA) += of_numa.o
>  
> +ifdef CONFIG_KEXEC_FILE
> +ifdef CONFIG_OF_FLATTREE
> +obj-y	+= kexec.o
> +endif
> +endif
> +
>  obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> new file mode 100644
> index 000000000000..469e09613cdd
> --- /dev/null
> +++ b/drivers/of/kexec.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Arm Limited
> + *
> + * Based on arch/arm64/kernel/machine_kexec_file.c:
> + *  Copyright (C) 2018 Linaro Limited
> + *
> + * And arch/powerpc/kexec/file_load.c:
> + *  Copyright (C) 2016  IBM Corporation
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/kexec.h>
> +#include <linux/libfdt.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/random.h>
> +#include <linux/types.h>
> +
> +/* relevant device tree properties */
> +#define FDT_PROP_KEXEC_ELFHDR	"linux,elfcorehdr"
> +#define FDT_PROP_MEM_RANGE	"linux,usable-memory-range"
> +#define FDT_PROP_INITRD_START	"linux,initrd-start"
> +#define FDT_PROP_INITRD_END	"linux,initrd-end"
> +#define FDT_PROP_BOOTARGS	"bootargs"
> +#define FDT_PROP_KASLR_SEED	"kaslr-seed"
> +#define FDT_PROP_RNG_SEED	"rng-seed"
> +#define RNG_SEED_SIZE		128
> +
> +/**
> + * fdt_find_and_del_mem_rsv - delete memory reservation with given address and size
> + *
> + * @fdt:	Flattened device tree for the current kernel.
> + * @start:	Starting address of the reserved memory.
> + * @size:	Size of the reserved memory.
> + *
> + * Return: 0 on success, or negative errno on error.
> + */
> +static int fdt_find_and_del_mem_rsv(void *fdt, unsigned long start, unsigned long size)
> +{
> +	int i, ret, num_rsvs = fdt_num_mem_rsv(fdt);
> +
> +	for (i = 0; i < num_rsvs; i++) {
> +		u64 rsv_start, rsv_size;
> +
> +		ret = fdt_get_mem_rsv(fdt, i, &rsv_start, &rsv_size);
> +		if (ret) {
> +			pr_err("Malformed device tree.\n");
> +			return -EINVAL;
> +		}
> +
> +		if (rsv_start == start && rsv_size == size) {
> +			ret = fdt_del_mem_rsv(fdt, i);
> +			if (ret) {
> +				pr_err("Error deleting device tree reservation.\n");
> +				return -EINVAL;
> +			}
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/*
> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
> + *
> + * @image:		kexec image being loaded.
> + * @initrd_load_addr:	Address where the next initrd will be loaded.
> + * @initrd_len:		Size of the next initrd, or 0 if there will be none.
> + * @cmdline:		Command line for the next kernel, or NULL if there will
> + *			be none.
> + *
> + * Return: fdt on success, or NULL errno on error.
> + */
> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> +				   unsigned long initrd_load_addr,
> +				   unsigned long initrd_len,
> +				   const char *cmdline)
> +{
> +	void *fdt;
> +	int ret, chosen_node;
> +	const void *prop;
> +	unsigned long fdt_size;
> +
> +	fdt_size = fdt_totalsize(initial_boot_params) +
> +		   (cmdline ? strlen(cmdline) : 0) +
> +		   FDT_EXTRA_SPACE;
> +
> +	fdt = kvmalloc(fdt_size, GFP_KERNEL);
> +	if (!fdt)
> +		return NULL;
> +
> +	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
> +	if (ret < 0) {
> +		pr_err("Error %d setting up the new device tree.\n", ret);
> +		goto out;
> +	}
> +
> +	/* Remove memory reservation for the current device tree. */
> +	ret = fdt_find_and_del_mem_rsv(fdt, __pa(initial_boot_params),
> +				       fdt_totalsize(initial_boot_params));
> +	if (ret == -EINVAL) {
> +		pr_err("Error removing memory reservation.\n");
> +		goto out;
> +	}
> +
> +	chosen_node = fdt_path_offset(fdt, "/chosen");
> +	if (chosen_node == -FDT_ERR_NOTFOUND)
> +		chosen_node = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
> +					      "chosen");
> +	if (chosen_node < 0) {
> +		ret = chosen_node;
> +		goto out;
> +	}
> +
> +	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_KEXEC_ELFHDR);
> +	if (ret && ret != -FDT_ERR_NOTFOUND)
> +		goto out;
> +	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_MEM_RANGE);
> +	if (ret && ret != -FDT_ERR_NOTFOUND)
> +		goto out;
> +
> +	/* Did we boot using an initrd? */
> +	prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", NULL);
> +	if (prop) {
> +		u64 tmp_start, tmp_end, tmp_size;
> +
> +		tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
> +
> +		prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", NULL);
> +		if (!prop) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));
> +
> +		/*
> +		 * kexec reserves exact initrd size, while firmware may
> +		 * reserve a multiple of PAGE_SIZE, so check for both.
> +		 */
> +		tmp_size = tmp_end - tmp_start;
> +		ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, tmp_size);
> +		if (ret == -ENOENT)
> +			ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
> +						       round_up(tmp_size, PAGE_SIZE));
> +		if (ret == -EINVAL)
> +			goto out;
> +	}
> +
> +	/* add initrd-* */
> +	if (initrd_load_addr) {
> +		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_START,
> +				      initrd_load_addr);
> +		if (ret)
> +			goto out;
> +
> +		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_INITRD_END,
> +				      initrd_load_addr + initrd_len);
> +		if (ret)
> +			goto out;
> +
> +		ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
> +		if (ret)
> +			goto out;
> +
> +	} else {
> +		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_START);
> +		if (ret && (ret != -FDT_ERR_NOTFOUND))
> +			goto out;
> +
> +		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_INITRD_END);
> +		if (ret && (ret != -FDT_ERR_NOTFOUND))
> +			goto out;
> +	}
> +
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		/* add linux,elfcorehdr */
> +		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
> +				FDT_PROP_KEXEC_ELFHDR,
> +				image->arch.elf_headers_mem,
> +				image->arch.elf_headers_sz);
> +		if (ret)
> +			goto out;
> +
> +		/*
> +		 * Avoid elfcorehdr from being stomped on in kdump kernel by
> +		 * setting up memory reserve map.
> +		 */
> +		ret = fdt_add_mem_rsv(fdt, image->arch.elf_headers_mem,
> +				      image->arch.elf_headers_sz);
> +		if (ret)
> +			goto out;
> +
> +		/* add linux,usable-memory-range */
> +		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
> +				FDT_PROP_MEM_RANGE,
> +				crashk_res.start,
> +				crashk_res.end - crashk_res.start + 1);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	/* add bootargs */
> +	if (cmdline) {
> +		ret = fdt_setprop_string(fdt, chosen_node, FDT_PROP_BOOTARGS, cmdline);
> +		if (ret)
> +			goto out;
> +	} else {
> +		ret = fdt_delprop(fdt, chosen_node, FDT_PROP_BOOTARGS);
> +		if (ret && (ret != -FDT_ERR_NOTFOUND))
> +			goto out;
> +	}
> +
> +	/* add kaslr-seed */
> +	ret = fdt_delprop(fdt, chosen_node, FDT_PROP_KASLR_SEED);
> +	if (ret == -FDT_ERR_NOTFOUND)
> +		ret = 0;
> +	else if (ret)
> +		goto out;
> +
> +	if (rng_is_initialized()) {
> +		u64 seed = get_random_u64();
> +
> +		ret = fdt_setprop_u64(fdt, chosen_node, FDT_PROP_KASLR_SEED, seed);
> +		if (ret)
> +			goto out;
> +	} else {
> +		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
> +				FDT_PROP_KASLR_SEED);
> +	}
> +
> +	/* add rng-seed */
> +	if (rng_is_initialized()) {
> +		void *rng_seed;
> +
> +		ret = fdt_setprop_placeholder(fdt, chosen_node, FDT_PROP_RNG_SEED,
> +				RNG_SEED_SIZE, &rng_seed);
> +		if (ret)
> +			goto out;
> +		get_random_bytes(rng_seed, RNG_SEED_SIZE);
> +	} else {
> +		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
> +				FDT_PROP_RNG_SEED);
> +	}
> +
> +	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
> +
> +out:
> +	if (ret) {
> +		kvfree(fdt);
> +		fdt = NULL;
> +	}
> +
> +	return fdt;
> +}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4b27c9a27df3..f0eff5e84353 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -560,6 +560,19 @@ int of_map_id(struct device_node *np, u32 id,
>  
>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>  
> +/*
> + * Additional space needed for the buffer to build the new FDT
> + * so that we can add initrd, bootargs, kaslr-seed, rng-seed,
> + * userable-memory-range and elfcorehdr.
> + */
> +#define FDT_EXTRA_SPACE 0x1000

No need for this to be public now. Move it to of/kexec.c.

Rob
