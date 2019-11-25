Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55210881F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 06:13:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LwCs1r5BzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 16:13:13 +1100 (AEDT)
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
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="DgVsbW29"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lvxs719hzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 16:01:05 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id z188so6577780pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 21:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eIRtSTgKuF1ox93Tz2N3FHfvXg0drgrSLMTR0uPQnO0=;
 b=DgVsbW29cSWRdjiDGaZMxyB4URUuIrvpd7lJQbuqxvbkeu5QyI3TFygtp9RxjM2U8z
 5Xzr86YOuRpZVFjLxkYy4x+mMKRt2crHJaJ1rvehDj6QfHHvX9znWXyXw/ME9SwakR15
 QCg780IHoDGqFdIX7L6HF/DF+Z65f8A0SM2JE76Q3kvgxEGG4zGIFkP7Otjv7VPPAoqY
 BLjMJ4Occ3bs60BwwiGIFuZP4HxUIipl95QpLRLfXv4MWzm73ru1xF7CBATje/N+x9uD
 jpriSOoZOreFpbg3UTnf92VLzZq1td81RVfE2R9aZNOc17X18Zzym4MPoJqyJSgxoCIo
 Nh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eIRtSTgKuF1ox93Tz2N3FHfvXg0drgrSLMTR0uPQnO0=;
 b=U0mp2jHo7Z5p8A1rUFqpvPJDDNOg8vXYmHQ/FUe/ZzZ6840xayI3V26let0nnplYth
 rvrKz9m4QtV3gU7WUPEpX8G47AIsQqftwLHPhRnVWbZaKQd3w7drH6CV8bdI4mnb1w6B
 utpXP4YZEQjBdZC/4W2t2cpFaADcwK/2HStwgU9zmUY19rUOjVHE3h8AuBDQE4kggcY0
 3Jp5zefGMH/vQJRwP/G2cmMVF92cAYz+nP3qIgNUuEX/2YBkdjnAoIdGNzLqHxhChoIx
 stpp6S1nBU20Pc7RgFTT0Z8uF7cnDwSerzoEyKjm7HmKYBmqSpu/ZJzjttmIx1eWAi7B
 HmiQ==
X-Gm-Message-State: APjAAAVhxQ7yFJPeOq8j9PtPA/+AhF5R2vn3h8ZPG1iAQ6rK5iH6Okvm
 wEbbheli/zhCHS1bjgIiU1MN0w==
X-Google-Smtp-Source: APXvYqz1Pw4Ibc1Q/sqoLKZLHbvbSc2Jd2mOpNQhHdTsmtlqJUeSMUJy6Ols10pNStlGEeImrYPcFQ==
X-Received: by 2002:a63:4641:: with SMTP id v1mr17951328pgk.389.1574658062948; 
 Sun, 24 Nov 2019 21:01:02 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s1sm6433849pgk.9.2019.11.24.21.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2019 21:01:02 -0800 (PST)
Subject: Re: [Very RFC 23/46] powerpc/eeh: Moving finding the parent PE into
 the platform
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-24-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <bdbb9a51-7c24-0179-2d0d-7077af0a49f5@ozlabs.ru>
Date: Mon, 25 Nov 2019 16:00:57 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-24-oohall@gmail.com>
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2019 12:28, Oliver O'Halloran wrote:
> Currently the generic EEH code uses the pci_dn of a device to look up the
> PE of the device's parent bridge, or physical function. The generic
> function to insert the edev (and possibly create the eeh_pe) is called
> from the probe functions already so this is a relatively minor change.
> 
> The existing lookup method moves into the pseries platform and PowerNV
> can choose the PE based on the bus heirachy instead.


The pseries search is also based on sort of bus hierarchy (the pci_dn
tree is that). A short essay about the difference between PCI trees and
pci_dn trees would help (reminder: draw that picture of a set of trees
and lists we got there).


> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> "parent" meaning "parent of the PE that actually contains this edev"
> is stupid, but it's stupid consistent with what's there already. Also
> I couldn't think of a way to fix it without adding a bunch of boring
> boilerplate at the call sites.
> 
> FIXME: I think I introduced a bug here. Currently we coalase a switch's
> upstream port bus and the downstream port bus into a single PE since
> they're a single failure domain. That seems to have been broken by
> this patch, but whatever.


Not clear at all where/how this got broken, pointers would help,
preferably as a comment in the code.

Apart from that,

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



Thanks,


> ---
>  arch/powerpc/include/asm/eeh.h               |  2 +-
>  arch/powerpc/kernel/eeh_pe.c                 | 54 ++++-------------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 25 +++++++-
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 61 ++++++++++++++++----
>  4 files changed, 86 insertions(+), 56 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index e109bfd3dd57..70d3e01dbe9d 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -295,7 +295,7 @@ struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
>  struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
>  struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
>  			  int pe_no, int config_addr);
> -int eeh_add_to_parent_pe(struct eeh_dev *edev);
> +int eeh_add_to_parent_pe(struct eeh_pe *parent, struct eeh_dev *edev);
>  int eeh_rmv_from_parent_pe(struct eeh_dev *edev);
>  void eeh_pe_update_time_stamp(struct eeh_pe *pe);
>  void *eeh_pe_traverse(struct eeh_pe *root,
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index 831f363f1732..520c249f19d3 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -318,56 +318,23 @@ struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
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
>   * eeh_add_to_parent_pe - Add EEH device to parent PE
> + * @parent: PE to create additional PEs under
>   * @edev: EEH device
>   *
> - * Add EEH device to the parent PE. If the parent PE already
> - * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
> - * we have to create new PE to hold the EEH device and the new
> - * PE will be linked to its parent PE as well.
> + * Add EEH device to the PE in edev->pe_config_addr. If the PE
> + * already exists then we'll add it to that. Otherwise a new
> + * PE is created, and inserted into the PE tree below @parent.
> + * If @parent is NULL, then it will be inserted under the PHB
> + * PE for edev->controller.
> + *
> + * In either case @edev is added to the PE's device list.
>   */
> -int eeh_add_to_parent_pe(struct eeh_dev *edev)
> +int eeh_add_to_parent_pe(struct eeh_pe *parent, struct eeh_dev *edev)
>  {
>  	int config_addr = edev->bdfn;
> -	struct eeh_pe *pe, *parent;
> +	struct eeh_pe *pe;
>  
>  	/* Check if the PE number is valid */
>  	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
> @@ -431,7 +398,6 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
>  	 * to PHB directly. Otherwise, we have to associate the
>  	 * PE with its parent.
>  	 */
> -	parent = eeh_pe_get_parent(edev);
>  	if (!parent) {
>  		parent = eeh_phb_pe_get(edev->controller);
>  		if (!parent) {
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 7aba18e08996..49a932ff092a 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -358,6 +358,25 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
>  	return pnv_pci_cfg_write(pdn, where, size, val);
>  }
>  
> +static struct eeh_pe *pnv_eeh_pe_get_parent(struct pci_dev *pdev)
> +{
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> +	struct pci_dev *parent = pdev->bus->self;
> +
> +#ifdef CONFIG_PCI_IOV
> +	if (pdev->is_virtfn)
> +		parent = pdev->physfn;
> +#endif
> +
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
> @@ -368,6 +387,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_controller *hose = phb->hose;
> +	struct eeh_pe *parent_pe;
>  	struct eeh_dev *edev;
>  	uint32_t pcie_flags;
>  	int ret;
> @@ -450,8 +470,11 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  
>  	edev->pe_config_addr = phb->ioda.pe_rmap[config_addr];
>  
> +	/* find the PE that contains this PE, might be NULL */
> +	parent_pe = pnv_eeh_pe_get_parent(pdev);
> +
>  	/* Create PE */
> -	ret = eeh_add_to_parent_pe(edev);
> +	ret = eeh_add_to_parent_pe(parent_pe, edev);
>  	if (ret) {
>  		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
>  		return NULL;
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 13a8c274554a..b4a92c24fd45 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -70,11 +70,12 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
>  	eeh_add_device_early(pdn);
>  #ifdef CONFIG_PCI_IOV
>  	if (pdev->is_virtfn) {
> +		struct eeh_pe *physfn_pe = pci_dev_to_eeh_dev(pdev->physfn)->pe;
>  		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
>  
>  		edev->pe_config_addr =  (pdn->busno << 16) | (pdn->devfn << 8);
>  		eeh_rmv_from_parent_pe(edev); /* Remove as it is adding to bus pe */
> -		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
> +		eeh_add_to_parent_pe(physfn_pe, edev); /* Add as VF PE type */
>  	}
>  #endif
>  	eeh_add_device_late(pdev);
> @@ -220,6 +221,43 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
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
>   * pseries_eeh_probe - EEH probe on the given device
>   * @pdn: PCI device node
> @@ -286,10 +324,14 @@ static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
>  	if (ret) {
>  		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
>  	} else {
> +		struct eeh_pe *parent;
> +
>  		/* Retrieve PE address */
>  		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
>  		pe.addr = edev->pe_config_addr;
>  
> +		parent = pseries_eeh_pe_get_parent(edev);
> +
>  		/* Some older systems (Power4) allow the ibm,set-eeh-option
>  		 * call to succeed even on nodes where EEH is not supported.
>  		 * Verify support explicitly.
> @@ -298,16 +340,15 @@ static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
>  		if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
>  			enable = 1;
>  
> -		if (enable) {
> +		/* This device doesn't support EEH, but it may have an
> +		 * EEH parent, in which case we mark it as supported.
> +		 */
> +		if (parent && !enable)
> +			edev->pe_config_addr = parent->addr;
> +
> +		if (enable || parent) {
>  			eeh_add_flag(EEH_ENABLED);
> -			eeh_add_to_parent_pe(edev);
> -		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
> -			   (pdn_to_eeh_dev(pdn->parent))->pe) {
> -			/* This device doesn't support EEH, but it may have an
> -			 * EEH parent, in which case we mark it as supported.
> -			 */
> -			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
> -			eeh_add_to_parent_pe(edev);
> +			eeh_add_to_parent_pe(parent, edev);
>  		}
>  		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
>  			     (enable ? "enabled" : "unsupported"), ret);
> 

-- 
Alexey
