Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B61ED21E562
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:52:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Nn21MypzDqbF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 11:52:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=HCeAtmiP; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5NlJ3n96zDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 11:50:48 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o13so6896886pgf.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 18:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g7nnKYj3AP6Q2dLnIUIDg0XqEZMzshBLByILxCIwuUw=;
 b=HCeAtmiPRI1/JMmwE+JuUlRyJ0UMTcmX50rSxYg77Ma3o58a4Bm5a7VtkWHtNT5nFN
 KemLj1gAAd816UAaMrFc2XFPX0brnnwIw/+kZ++1MqXrf0Sby1ajcWRTIOERrwamJypk
 aH4iVdTGY+3+zvBVjRq/829pKaFJtb8mmGmVxfuW5yNZsmaRBTqOmavVAiJhXvy5D2EJ
 mfWi1tsNiNO0IhYwpCq1no/VVH9aiqiL/yemelmiqC5V474N3HW8ZwSzoWqUy0m7/4+7
 9KxZDFAVU2QU/YjVpEXZEe2ZOPp5s3kAJDhSpXgHKJCIG1zIFusZFpZsAZqVhfVjs1rg
 ZFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g7nnKYj3AP6Q2dLnIUIDg0XqEZMzshBLByILxCIwuUw=;
 b=pKvHj6XVrvz1zgxeD5UkNKWRiZpuvZ1gOiaTfIXE51FQ/TQQtO3v3rYrad+fPWUQqX
 F+qC+m/B8dz8jOOPvDIHHucqy1uHiLYxzMZDQd6q+8R+s+BKssabAs3Jenhz+HldRSyv
 5q5MF2TWXIRAkQtbmUgBp6qCoxCN8PVBG8VnzBoX/7AmJ7sR6oRtAILmxjqHobXuVkyX
 N6uHrsvcQlXJKQwQqlVolJye4YGr/B+zrR1jp8tobZEfUE131szKUYNEgQyl3RwMGqDd
 j+if+sUmp+0C6bhgGEqCvfd2B+PJjp5XF//9rZCjSmm8KRN056C8D+JOlEbX8c3102cR
 4TBw==
X-Gm-Message-State: AOAM532iwkHoPdtghnIhLL644M0Be+Ovxw+21fZYDdMnwx57G7cv25uB
 KrdTTrUnBL7ErUXcwSE0B8yZvw==
X-Google-Smtp-Source: ABdhPJwfbCtGTpBz8vXiDlxQD2WomcNdb3uoGGevBDHEyf5efwwMGG1q/cmwuTrK/mlB11lv3xlBCA==
X-Received: by 2002:a05:6a00:224f:: with SMTP id
 i15mr2385996pfu.241.1594691444600; 
 Mon, 13 Jul 2020 18:50:44 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id p5sm14361596pgi.83.2020.07.13.18.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 18:50:43 -0700 (PDT)
Subject: Re: [PATCH 14/14] powerpc/eeh: Move PE tree setup into the platform
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-15-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d2ce45e8-92e6-f875-fd38-c3fa82bf8f4e@ozlabs.ru>
Date: Tue, 14 Jul 2020 11:50:39 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706013619.459420-15-oohall@gmail.com>
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/07/2020 11:36, Oliver O'Halloran wrote:
> The EEH core has a concept of a "PE tree" to support PowerNV. The PE tree
> follows the PCI bus structures because a reset asserted on an upstream
> bridge will be propagated to the downstream bridges. On pseries there's a
> 1-1 correspondence between what the guest sees are a PHB and a PE so the
> "tree" is really just a single node.
> 
> Current the EEH core is reponsible for setting up this PE tree which it
> does by traversing the pci_dn tree. The structure of the pci_dn tree
> matches the bus tree on PowerNV which leads to the PE tree being "correct"
> this setup method doesn't make a whole lot of sense and it's actively
> confusing for the pseries case where it doesn't really do anything.
> 
> We want to remove the dependence on pci_dn anyway so this patch move
> choosing where to insert a new PE into the platform code rather than
> being part of the generic EEH code. For PowerNV this simplifies the
> tree building logic and removes the use of pci_dn. For pseries we
> keep the existing logic. I'm not really convinced it does anything
> due to the 1-1 PE-to-PHB correspondence so every device under that
> PHB should be in the same PE, but I'd rather not remove it entirely
> until we've had a chance to look at it more deeply.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               |  2 +-
>  arch/powerpc/kernel/eeh_pe.c                 | 70 ++++++--------------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 27 +++++++-
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 59 +++++++++++++++--
>  4 files changed, 101 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 8d34e5b790c2..1cab629dbc74 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -283,7 +283,7 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
>  struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
>  struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
>  			  int pe_no, int config_addr);
> -int eeh_pe_tree_insert(struct eeh_dev *edev);
> +int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent);
>  int eeh_pe_tree_remove(struct eeh_dev *edev);
>  void eeh_pe_update_time_stamp(struct eeh_pe *pe);
>  void *eeh_pe_traverse(struct eeh_pe *root,
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index 898205829a8f..ea2f8b362d18 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -318,53 +318,20 @@ struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
>  	return pe;
>  }
>  
> -/**
> - * eeh_pe_get_parent - Retrieve the parent PE
> - * @edev: EEH device
> - *
> - * The whole PEs existing in the system are organized as hierarchy
> - * tree. The function is used to retrieve the parent PE according
> - * to the parent EEH device.
> - */
> -static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
> -{
> -	struct eeh_dev *parent;
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> -
> -	/*
> -	 * It might have the case for the indirect parent
> -	 * EEH device already having associated PE, but
> -	 * the direct parent EEH device doesn't have yet.
> -	 */
> -	if (edev->physfn)
> -		pdn = pci_get_pdn(edev->physfn);
> -	else
> -		pdn = pdn ? pdn->parent : NULL;
> -	while (pdn) {
> -		/* We're poking out of PCI territory */
> -		parent = pdn_to_eeh_dev(pdn);
> -		if (!parent)
> -			return NULL;
> -
> -		if (parent->pe)
> -			return parent->pe;
> -
> -		pdn = pdn->parent;
> -	}
> -
> -	return NULL;
> -}
> -
>  /**
>   * eeh_pe_tree_insert - Add EEH device to parent PE
>   * @edev: EEH device
> + * @new_pe_parent: PE to create additional PEs under
>   *
> - * Add EEH device to the parent PE. If the parent PE already
> - * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
> - * we have to create new PE to hold the EEH device and the new
> - * PE will be linked to its parent PE as well.
> + * Add EEH device to the PE in edev->pe_config_addr. If a PE already
> + * exists with that address then @edev is added to that PE. Otherwise
> + * a new PE is created and inserted into the PE tree as a child of
> + * @new_pe_parent.
> + *
> + * If @new_pe_parent is NULL then the new PE will be inserted under
> + * directly under the the PHB.
>   */
> -int eeh_pe_tree_insert(struct eeh_dev *edev)
> +int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
>  {
>  	struct pci_controller *hose = edev->controller;
>  	struct eeh_pe *pe, *parent;


We can ditch this "parent" in that single place now and use "pe"
instead. And name the new parameter simply "parent". Dunno if it
improves things though.



> @@ -399,7 +366,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
>  			}
>  
>  			eeh_edev_dbg(edev,
> -				     "Added to device PE (parent: PE#%x)\n",
> +				     "Added to existing PE (parent: PE#%x)\n",
>  				     pe->parent->addr);
>  		} else {
>  			/* Mark the PE as type of PCI bus */
> @@ -431,10 +398,9 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
>  	 * to PHB directly. Otherwise, we have to associate the
>  	 * PE with its parent.
>  	 */
> -	parent = eeh_pe_get_parent(edev);
> -	if (!parent) {
> -		parent = eeh_phb_pe_get(hose);
> -		if (!parent) {
> +	if (!new_pe_parent) {
> +		new_pe_parent = eeh_phb_pe_get(hose);
> +		if (!new_pe_parent) {



afaict only pseries can realisticly pass new_pe_parent==NULL so this
chunk could go to pseries_eeh_pe_get_parent.


>  			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
>  				__func__, hose->global_number);
>  			edev->pe = NULL;
> @@ -442,17 +408,19 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
>  			return -EEXIST;
>  		}
>  	}
> -	pe->parent = parent;
> +
> +	/* link new PE into the tree */
> +	pe->parent = new_pe_parent;
> +	list_add_tail(&pe->child, &new_pe_parent->child_list);
>  
>  	/*
>  	 * Put the newly created PE into the child list and
>  	 * link the EEH device accordingly.
>  	 */
> -	list_add_tail(&pe->child, &parent->child_list);
>  	list_add_tail(&edev->entry, &pe->edevs);
>  	edev->pe = pe;
> -	eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
> -		     pe->parent->addr);
> +	eeh_edev_dbg(edev, "Added to new (parent: PE#%x)\n",
> +		     new_pe_parent->addr);
>  
>  	return 0;
>  }
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 8c9fca773692..9af8c3b98853 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -338,6 +338,28 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
>  	return 0;
>  }
>  
> +static struct eeh_pe *pnv_eeh_get_upstream_pe(struct pci_dev *pdev)
> +{
> +	struct pci_controller *hose = pdev->bus->sysdata;
> +	struct pnv_phb *phb = hose->private_data;
> +	struct pci_dev *parent = pdev->bus->self;
> +
> +#ifdef CONFIG_PCI_IOV
> +	/* for VFs we use the PF's PE as the upstream PE */
> +	if (pdev->is_virtfn)
> +		parent = pdev->physfn;
> +#endif
> +
> +	/* otherwise use the PE of our parent bridge */
> +	if (parent) {
> +		struct pnv_ioda_pe *ioda_pe = pnv_ioda_get_pe(parent);
> +
> +		return eeh_pe_get(phb->hose, ioda_pe->pe_number, 0);
> +	}
> +
> +	return NULL;
> +}
> +
>  /**
>   * pnv_eeh_probe - Do probe on PCI device
>   * @pdev: pci_dev to probe
> @@ -350,6 +372,7 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
>  	struct pci_controller *hose = pdn->phb;
>  	struct pnv_phb *phb = hose->private_data;
>  	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
> +	struct eeh_pe *upstream_pe;
>  	uint32_t pcie_flags;
>  	int ret;
>  	int config_addr = (pdn->busno << 8) | (pdn->devfn);
> @@ -398,8 +421,10 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
>  
>  	edev->pe_config_addr = phb->ioda.pe_rmap[config_addr];
>  
> +	upstream_pe = pnv_eeh_get_upstream_pe(pdev);
> +
>  	/* Create PE */
> -	ret = eeh_pe_tree_insert(edev);
> +	ret = eeh_pe_tree_insert(edev, upstream_pe);
>  	if (ret) {
>  		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
>  		return NULL;
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 72556f4436a8..98f9a1b269be 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -68,11 +68,16 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
>  	pseries_eeh_init_edev(pdn);
>  #ifdef CONFIG_PCI_IOV
>  	if (pdev->is_virtfn) {
> +		/*
> +		 * FIXME: This really should be handled by choosing the right
> +		 *        parent PE in in pseries_eeh_init_edev().
> +		 */
> +		struct eeh_pe *physfn_pe = pci_dev_to_eeh_dev(pdev->physfn)->pe;
>  		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
>  
>  		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
>  		eeh_pe_tree_remove(edev); /* Remove as it is adding to bus pe */
> -		eeh_pe_tree_insert(edev);   /* Add as VF PE type */
> +		eeh_pe_tree_insert(edev, physfn_pe);   /* Add as VF PE type */
>  	}
>  #endif
>  	eeh_probe_device(pdev);
> @@ -218,6 +223,43 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
>  	return 0;
>  }
>  
> +/**
> + * pseries_eeh_pe_get_parent - Retrieve the parent PE
> + * @edev: EEH device
> + *
> + * The whole PEs existing in the system are organized as hierarchy
> + * tree. The function is used to retrieve the parent PE according
> + * to the parent EEH device.
> + */
> +static struct eeh_pe *pseries_eeh_pe_get_parent(struct eeh_dev *edev)
> +{
> +	struct eeh_dev *parent;
> +	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> +
> +	/*
> +	 * It might have the case for the indirect parent
> +	 * EEH device already having associated PE, but
> +	 * the direct parent EEH device doesn't have yet.
> +	 */
> +	if (edev->physfn)
> +		pdn = pci_get_pdn(edev->physfn);
> +	else
> +		pdn = pdn ? pdn->parent : NULL;
> +	while (pdn) {
> +		/* We're poking out of PCI territory */


We are traversing up PCI hierarchy here - pci_dn->parent, how is this
out of PCI territory? Or I understand "out of" incorrectly?


> +		parent = pdn_to_eeh_dev(pdn);
> +		if (!parent)
> +			return NULL;
> +
> +		if (parent->pe)
> +			return parent->pe;
> +
> +		pdn = pdn->parent;
> +	}
> +
> +	return NULL;
> +}
> +
>  /**
>   * pseries_eeh_init_edev - initialise the eeh_dev and eeh_pe for a pci_dn
>   *
> @@ -301,6 +343,8 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>  	if (ret) {
>  		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
>  	} else {
> +		struct eeh_pe *parent;
> +
>  		/* Retrieve PE address */
>  		edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
>  		pe.addr = edev->pe_config_addr;
> @@ -313,16 +357,23 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>  		if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
>  			enable = 1;
>  
> -		if (enable) {
> +		/* This device doesn't support EEH, but it may have an
> +		 * EEH parent, in which case we mark it as supported.
> +		 */
> +		parent = pseries_eeh_pe_get_parent(edev);
> +		if (parent && !enable)
> +			edev->pe_config_addr = parent->addr;


What if pseries_eeh_pe_get_parent() returned NULL - we won't write
edev->pe_config_addr so it remains 0 which is fine just by accident? :)

I'd make pseries_eeh_pe_get_parent() always return not NULL (a parent or
a hose) and simplify the block below.


I mean the change is alright but part of the excersise is making the
code more readable but there also can go forever :) so

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> +
> +		if (enable || parent) {
>  			eeh_add_flag(EEH_ENABLED);
> -			eeh_pe_tree_insert(edev);
> +			eeh_pe_tree_insert(edev, parent);
>  		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
>  			   (pdn_to_eeh_dev(pdn->parent))->pe) {
>  			/* This device doesn't support EEH, but it may have an
>  			 * EEH parent, in which case we mark it as supported.
>  			 */
>  			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
> -			eeh_pe_tree_insert(edev);
> +			eeh_pe_tree_insert(edev, parent);
>  		}
>  		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
>  			     (enable ? "enabled" : "unsupported"), ret);
> 

-- 
Alexey
