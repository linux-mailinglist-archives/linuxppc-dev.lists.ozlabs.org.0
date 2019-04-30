Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7DF031
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 08:03:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tWCx4trVzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 16:03:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUVLnUCh"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tW8t4GFLzDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 16:00:30 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id t200so2845660itf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 23:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=x9h6HedQ8QLA/SIO/+1Eh8TR7sVgMBSYRby5yCQpHng=;
 b=HUVLnUChJSkEvFFgpKcpEeStINEEDdmYiVKGBRYqBSzvIBn3RjD3uN/0DyDbWkcowy
 bPHOyuCxxLB6S5j9K9fy1JRJ84zoGb/ahfIuHRU1qoCfambtZYlPPEkuNhTqZ2rzbQqW
 LffZIVhzXWG/UPpjBd8RaQdcP+6ZXikXGrY7ovHJW/E1sGhiYkSVm+z8VFsvPoKPsCEK
 HL53N8sdBS6MZkG/VfRPcasQeJ/hdiNCAsXCP/Am+hRAkXYtzVr6l2+PFkoP2Y4CrkRj
 z0vXm7zK+UrUBzAc89EC5IGD7Aujlx4itRp61Mg0WwP8W4SSa/B7CkL1VtVHF5vI0KQo
 nbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=x9h6HedQ8QLA/SIO/+1Eh8TR7sVgMBSYRby5yCQpHng=;
 b=NP7QZRGkY/mJhEpGppE6+khyOd+4Dw/V2UUWNTKucVnuI0Drb8v3eZ+W45jBduUq1J
 T1wioXipzjOcJqGRKPfg53H+MgNYlHaM+UMhfxFai22vxutCs30ylYMvGpndQPyjRtMl
 EcYC5twFbEuwxEyYLiYGuCLcCThvtM7nbAWq2KTo0GuofSOD7Km9I7YbcSHnMMBVRU0c
 kQ+rCamA7Otu7y9Vl3rlvfliXJ57tnARm+eWzKYFa5C3sPAvvrUXdYtxajhhhXgjzCcP
 aUHzxgHafVNAtCLgzD/UInePFHpYurLcGylsLS1DBZ4IbIByakmxZkmsKNvvu6567A9o
 l2Lw==
X-Gm-Message-State: APjAAAVh6FQQhjbmo2QYIh8e5YU/yNxYNjsCOqAmSZPtWgXsU8rfngzN
 0bcu/KCRbhffsxXVDY7gcav3RymG
X-Google-Smtp-Source: APXvYqx7FqghdIfVWjHGZyrB+LmDy5eA5C2oYOWQSSj5SHjkNf5fKQs5afrDO6+XCvFFMl1KPsnbfw==
X-Received: by 2002:a05:660c:78e:: with SMTP id
 h14mr566691itk.49.1556604028105; 
 Mon, 29 Apr 2019 23:00:28 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id u5sm10607624iog.80.2019.04.29.23.00.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 23:00:27 -0700 (PDT)
Message-ID: <e27c1caebdbc4dc71fb8d132db24f04fa65a7a69.camel@gmail.com>
Subject: Re: [PATCH v5 5/8] powerpc/pci/IOV: Add support for runtime
 enabling the VFs
From: Oliver O'Halloran <oohall@gmail.com>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Date: Tue, 30 Apr 2019 16:00:22 +1000
In-Reply-To: <20190311115233.6514-6-s.miroshnichenko@yadro.com>
References: <20190311115233.6514-1-s.miroshnichenko@yadro.com>
 <20190311115233.6514-6-s.miroshnichenko@yadro.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-03-11 at 14:52 +0300, Sergey Miroshnichenko wrote:

> When called within pcibios_sriov_enable(), the pci_sriov_get_totalvfs(pdev)
> returns zero, because the device is yet preparing to enable the VFs.

I don't think this is correct. The earliest pcibios_sriov_enable() can
be called is during a driver probe function. The totalvfs field is
initialised by pci_iov_init() which is called before the device has
been added to the bus. If it's returning zero then maybe the driver
limited the number of VFs to zero?

That said, you need to reset numvfs to zero before changing the value. 
So limiting the number of pci_dns that are created to the number
actually required rather than totalvfs doesn't hurt.

> With this patch it becomes possible to enable VFs via sysfs "sriov_numvfs"
> on PowerNV.

I tested on a few of our lab systems with random kernel versions
spanning from 4.15 to 5.0 and sriov_numvfs seemed to work fine on all
of them. Is there a specific configuration you're testing that needed
this change?

> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> ---
>  arch/powerpc/include/asm/pci-bridge.h     |  4 +--
>  arch/powerpc/kernel/pci_dn.c              | 32 ++++++++++++++---------
>  arch/powerpc/platforms/powernv/pci-ioda.c |  4 +--
>  arch/powerpc/platforms/pseries/pci.c      |  4 +--
>  4 files changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index fc188e0e9179..6479bc96e0b6 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -225,8 +225,8 @@ struct pci_dn {
>  extern struct pci_dn *pci_get_pdn_by_devfn(struct pci_bus *bus,
>  					   int devfn);
>  extern struct pci_dn *pci_get_pdn(struct pci_dev *pdev);
> -extern struct pci_dn *add_dev_pci_data(struct pci_dev *pdev);
> -extern void remove_dev_pci_data(struct pci_dev *pdev);
> +extern struct pci_dn *pci_create_vf_pdns(struct pci_dev *pdev, int num_vfs);
> +extern void pci_destroy_vf_pdns(struct pci_dev *pdev);
>  extern struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
>  					       struct device_node *dn);
>  extern void pci_remove_device_node_info(struct device_node *dn);
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 7f12882d8882..7fa362f8038d 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -222,18 +222,19 @@ static struct pci_dn *pci_create_pdn_from_dev(struct pci_dev *pdev,
>  	return pdn;
>  }
>  
> -struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
> +struct pci_dn *pci_create_vf_pdns(struct pci_dev *pdev, int num_vfs)
>  {
> +	struct pci_dn *pdn = pci_get_pdn(pdev);
> +
>  #ifdef CONFIG_PCI_IOV
> -	struct pci_dn *parent, *pdn;
> +	struct pci_dn *parent;
>  	int i;
>  
>  	/* Only support IOV for now */
>  	if (!pdev->is_physfn)
> -		return pci_get_pdn(pdev);
> +		return pdn;
>  
>  	/* Check if VFs have been populated */
> -	pdn = pci_get_pdn(pdev);
>  	if (!pdn || (pdn->flags & PCI_DN_FLAG_IOV_VF))
>  		return NULL;
>  
> @@ -242,33 +243,38 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
>  	if (!parent)
>  		return NULL;
>  
> -	for (i = 0; i < pci_sriov_get_totalvfs(pdev); i++) {
> +	for (i = 0; i < num_vfs; i++) {
>  		struct eeh_dev *edev __maybe_unused;
> +		struct pci_dn *vpdn;
>  
> -		pdn = pci_alloc_pdn(parent,
> -				    pci_iov_virtfn_bus(pdev, i),
> -				    pci_iov_virtfn_devfn(pdev, i));
> -		if (!pdn) {
> +		vpdn = pci_alloc_pdn(parent,
> +				     pci_iov_virtfn_bus(pdev, i),
> +				     pci_iov_virtfn_devfn(pdev, i));
> +		if (!vpdn) {
>  			dev_warn(&pdev->dev, "%s: Cannot create firmware data for VF#%d\n",
>  				 __func__, i);
>  			return NULL;
>  		}
>  
> -		pdn->vf_index = i;
> +		vpdn->vf_index = i;
> +		vpdn->vendor_id = pdn->vendor_id;
> +		vpdn->device_id = pdn->device_id;
> +		vpdn->class_code = pdn->class_code;
> +		vpdn->pci_ext_config_space = 0;
>  
>  #ifdef CONFIG_EEH
>  		/* Create the EEH device for the VF */
> -		edev = eeh_dev_init(pdn);
> +		edev = eeh_dev_init(vpdn);
>  		BUG_ON(!edev);
>  		edev->physfn = pdev;
>  #endif /* CONFIG_EEH */
>  	}
>  #endif /* CONFIG_PCI_IOV */
>  
> -	return pci_get_pdn(pdev);
> +	return pdn;
>  }
>  
> -void remove_dev_pci_data(struct pci_dev *pdev)
> +void pci_destroy_vf_pdns(struct pci_dev *pdev)
>  {
>  #ifdef CONFIG_PCI_IOV
>  	struct pci_dn *parent;
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index ed500f51d449..979c901535f2 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1720,14 +1720,14 @@ int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
>  	pnv_pci_sriov_disable(pdev);
>  
>  	/* Release PCI data */
> -	remove_dev_pci_data(pdev);
> +	pci_destroy_vf_pdns(pdev);
>  	return 0;
>  }
>  
>  int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	/* Allocate PCI data */
> -	add_dev_pci_data(pdev);
> +	pci_create_vf_pdns(pdev, num_vfs);
>  
>  	return pnv_pci_sriov_enable(pdev, num_vfs);
>  }
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
> index 37a77e57893e..5e87596903a6 100644
> --- a/arch/powerpc/platforms/pseries/pci.c
> +++ b/arch/powerpc/platforms/pseries/pci.c
> @@ -205,7 +205,7 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
>  	/* Allocate PCI data */
> -	add_dev_pci_data(pdev);
> +	pci_create_vf_pdns(pdev, num_vfs);
>  	return pseries_pci_sriov_enable(pdev, num_vfs);
>  }
>  
> @@ -217,7 +217,7 @@ int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
>  	/* Releasing pe_num_map */
>  	kfree(pdn->pe_num_map);
>  	/* Release PCI data */
> -	remove_dev_pci_data(pdev);
> +	pci_destroy_vf_pdns(pdev);
>  	pci_vf_drivers_autoprobe(pdev, true);
>  	return 0;
>  }

