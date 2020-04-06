Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0A19F303
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:54:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wm931ptGzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cSmfEFyT; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wm5w1T2VzDqpp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:51:47 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q3so7251789pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qrZxhxDJl0GIPy80MZGyMuRSN2/etsBfZ8nNcjsUv/k=;
 b=cSmfEFyTPokoFnbmdEEGVkPaBlSldSmAGhwvRrZo8LPrfqdzghZpXDjYh6477jr2M9
 VKSP4ThGAzWliibLOEoh7bAFCFGZrxsJsFyeYIOJbw7t6+750j5j44swNDHqOKehELlk
 YU1XU9SxJNWOZZSZ8X2zeRXsXc4W8EdOLtx9Cn0uTG7jQ+JcxsAygPgHfaYPfOtwLQqX
 XgFJ1MxDd5+Pz9T0nFmSMCbpqlxoYxeUkCIVoExeNdgLi2L/C9QuZdFKcjOownwAUs+l
 bifb6nZFTQK41M7kZRlqy3waiiXTT0kMN0a6S/BamosGqktJ7KShwjr0csC1I4MGC0RJ
 kXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qrZxhxDJl0GIPy80MZGyMuRSN2/etsBfZ8nNcjsUv/k=;
 b=N+1b1yFTvRgxHdPmbUDwdktxiautQDooNTeQwQz+uUb52QlAgRmC21t1t4hCpNDMNb
 mDrR4kgZpMIwnL3YMqaChVZi6xUooKanVC2aUP/oR7OxH268Q6Jxjq+H2zRkRCnms6pl
 87ZoS/7/uySQ9nVjEXHVaBfJSKZTca1zIjXegjSKHsxmAVJzjOT0WYaT73rR2vwwF0QK
 uxQ6Jk4jdgPCuObphPjCgDmFVCjTHWRsYtFNy8tjzytMHvpnRv1z0g83jLhkidK7KdUS
 IOJRLLQIP2MSCHRuy3nJw22kfwGMs2QfhfJ6Mkoy4U06ERE9F9MoVIfRNFPTtrV37H6w
 VbWQ==
X-Gm-Message-State: AGi0PubAHCJA4YdtkslPl/6LqLuSJ3v4mpY5o7jBy3skusgqlBsVX+5J
 SO5VNlP2mp55R6HIlHFxejj7uQ==
X-Google-Smtp-Source: APiQypJiuK7kHstYD8yxTFsOK/5cktxf6R3ldrq/1q/3jVVYABD5L51WwIZmPnMx3/DRFBn+fBDKfQ==
X-Received: by 2002:a63:b954:: with SMTP id v20mr19398442pgo.381.1586166705893; 
 Mon, 06 Apr 2020 02:51:45 -0700 (PDT)
Received: from [192.168.10.94] (124-171-87-207.dyn.iinet.net.au.
 [124.171.87.207])
 by smtp.gmail.com with ESMTPSA id d23sm11253994pfq.210.2020.04.06.02.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:51:45 -0700 (PDT)
Subject: Re: [PATCH 3/7] powerpc/powernv/pci: Register iommu group at PE DMA
 setup
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406030745.24595-1-oohall@gmail.com>
 <20200406030745.24595-4-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <904ec2eb-50e7-78a8-0099-c1dbd0f2af34@ozlabs.ru>
Date: Mon, 6 Apr 2020 19:51:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406030745.24595-4-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Alistair Popple <alistair@popple.id.au>, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/04/2020 13:07, Oliver O'Halloran wrote:
> Move the registration of IOMMU groups out of the post-phb init fixup and
> into when we configure DMA for a PE. For most devices this doesn't
> result in any functional changes, but for NVLink attached GPUs it
> requires a bit of care. When the GPU is probed an IOMMU group would be
> created for the PE that contains it. We need to ensure that group is
> removed before we add the PE to the compound group that's used to keep
> the translations see by the PCIe and NVLink buses the same.
> 
> No functional changes. Probably.
> 
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Reza Arbab <arbab@linux.ibm.com>
> Cc: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/npu-dma.c  |  9 +++++++++
>  arch/powerpc/platforms/powernv/pci-ioda.c | 16 ++++++----------
>  2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index de617549c9a3..4fbbdfa8b327 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -469,6 +469,15 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  			compound_group->pgsizes = pe->table_group.pgsizes;
>  	}
>  
> +       /*
> +	* I'm not sure this is strictly required, but it's probably a good idea
> +	* since the table_group for the PE is going to be attached to the


This seems just a right thing to do so I suggest changing the comment
from "not sure" to "we are going to put GPU to a compound group and
won't need the individual group".

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> +	* compound table group. If we leave the PE's iommu group active then
> +	* we might have the same table_group being modifiable via two sepeate
> +	* iommu groups.
> +	*/
> +	iommu_group_put(pe->table_group.group);
> +
>  	pnv_comp_attach_table_group(npucomp, pe);
>  
>  	return compound_group;
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 2c340504fa77..cf0aaef1b8fa 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1619,10 +1619,6 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		}
>  
>  		pnv_pci_ioda2_setup_dma_pe(phb, pe);
> -#ifdef CONFIG_IOMMU_API
> -		iommu_register_group(&pe->table_group,
> -				pe->phb->hose->global_number, pe->pe_number);
> -#endif
>  	}
>  }
>  
> @@ -2661,9 +2657,6 @@ static void pnv_pci_ioda_setup_iommu_api(void)
>  					continue;
>  
>  				table_group = &pe->table_group;
> -				iommu_register_group(&pe->table_group,
> -						pe->phb->hose->global_number,
> -						pe->pe_number);
>  			}
>  			pnv_ioda_setup_bus_iommu_group(pe, table_group,
>  					pe->pbus);
> @@ -2748,14 +2741,17 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
>  			IOMMU_TABLE_GROUP_MAX_TABLES;
>  	pe->table_group.max_levels = POWERNV_IOMMU_MAX_LEVELS;
>  	pe->table_group.pgsizes = pnv_ioda_parse_tce_sizes(phb);
> -#ifdef CONFIG_IOMMU_API
> -	pe->table_group.ops = &pnv_pci_ioda2_ops;
> -#endif
>  
>  	rc = pnv_pci_ioda2_setup_default_config(pe);
>  	if (rc)
>  		return;
>  
> +#ifdef CONFIG_IOMMU_API
> +	pe->table_group.ops = &pnv_pci_ioda2_ops;
> +	iommu_register_group(&pe->table_group, phb->hose->global_number,
> +			     pe->pe_number);
> +#endif
> +
>  	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
>  		pnv_ioda_setup_bus_dma(pe, pe->pbus);
>  }
> 

-- 
Alexey
