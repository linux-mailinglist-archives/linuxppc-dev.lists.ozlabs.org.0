Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15210864E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 02:28:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LqDJ1fQSzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:28:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="iz56kR3G"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LqBY4v8KzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 12:26:43 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 193so6491427pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 17:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WJLwGK5Et113cCKK32t3/p5uIkO7em5MTplGAzGyb+4=;
 b=iz56kR3GgR3ksAb79sgw/4TF6HzEDpE4/owqe3yalEO89frn+bdzR5/Gi+np44vQil
 RkpbShVFZNVz3Fvh2bespS+r1f3Bi/YUPQEsyv20tYducWI2OcNO3Z1sOvBUGT+uBPJW
 ou7U8HZ5LK43Y6B19Sn8FDFU9zOx1IZuWB7opAODMZG+feevOM/USjSZXcSrJrBSr0FL
 XmuPH7Wf5KS+Dr845q5DIUs8T28leRagn+MIOPL5FN02sU2hqbOiowst5+qHhwKj7M+H
 l7tDPrkrAKFGfSdB6krGIthVgvDmRFFFSEa6mi30qfemLRVVIo6oHo0WmbJGWBS4duQc
 IDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WJLwGK5Et113cCKK32t3/p5uIkO7em5MTplGAzGyb+4=;
 b=QW5idYgQipmLVbYQ4dmK6ZF6Q+6KFFp7oB4bF38Yz1He7e90WsnXECuUFFDZYj1ppM
 YV0M96HuBwm8uRzA+Kga0mg9DUWyj05b0sS5UHsHQRqRJEk55bkPfB7D+LirjN4J6N7E
 WfdWf5Cdt+d7cTFAdbsg7q+eSrVbK/+sKLn1NBVjcjCd9tlI225NnP/Jn5zSdd5wNbsS
 hZqxD15ZO3Kj+Dk78b+mb6MpKgDrDHqgpBTiIRtxzXbBRwyr++QhQ0HefzVcVTofJkWN
 9CAXhV4Xb9z8DRTRc9QF05jol4gH2lzlBa0CP8pgpe1Z716X6Ebks/Gj3cA08VaaZO2t
 Hvsg==
X-Gm-Message-State: APjAAAVnjIegXHzh4Pmgwm+QSJkzCrwHSj8/O3WYvR+jxKZ+Z6eG0IdR
 ZBYwRJhVxkisGsp8FtqBCpF+Tg==
X-Google-Smtp-Source: APXvYqyo2gR9I8CzkBBU0Ieq4rnFnTPE5uv+nLpHG5pO3KZsdirq3rYF5FMwTHnA/m/M7xXuGxJJrA==
X-Received: by 2002:a62:7c52:: with SMTP id x79mr31073151pfc.18.1574645200847; 
 Sun, 24 Nov 2019 17:26:40 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id a12sm5653512pga.11.2019.11.24.17.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2019 17:26:40 -0800 (PST)
Subject: Re: [Very RFC 20/46] powernv/eeh: Look up device info from pci_dev
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-21-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <27bb3127-0e2d-f81e-1c58-509e88647aa4@ozlabs.ru>
Date: Mon, 25 Nov 2019 12:26:37 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-21-oohall@gmail.com>
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
> Most of what we fetch from the pci_dn is also in the pci_dev structure. Convert
> the pnv_eeh_probe_pdev() to use the pdev fields rather than the pci_dn so we can
> get rid of pci_dn eventually.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 26 ++++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index b79aca8368c6..6ba74836a9f8 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -372,7 +372,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
>  	uint32_t pcie_flags;
>  	int ret;
> -	int config_addr = (pdn->busno << 8) | (pdn->devfn);
> +	int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
>  
>  	/*
>  	 * When probing the root bridge, which doesn't have any
> @@ -392,18 +392,18 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  	}
>  
>  	/* Skip for PCI-ISA bridge */
> -	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
> +	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
>  		return NULL;
>  
>  	eeh_edev_dbg(edev, "Probing device\n");
>  
>  	/* Initialize eeh device */
> -	edev->class_code = pdn->class_code;
> +	edev->class_code = pdev->class;
>  	edev->pcix_cap = pci_find_capability(pdev, PCI_CAP_ID_PCIX);
>  	edev->pcie_cap = pci_find_capability(pdev, PCI_CAP_ID_EXP);
>  	edev->af_cap   = pci_find_capability(pdev, PCI_CAP_ID_AF);
>  	edev->aer_cap  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ERR);
> -	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
> +	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
>  		edev->mode |= EEH_DEV_BRIDGE;
>  		if (edev->pcie_cap) {
>  			pnv_eeh_read_config(edev, edev->pcie_cap + PCI_EXP_FLAGS,
> @@ -443,14 +443,14 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  	 * Broadcom Shiner 4-ports 1G NICs (14e4:168a)
>  	 * Broadcom Shiner 2-ports 10G NICs (14e4:168e)
>  	 */
> -	if ((pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&


This very much looks like you can get rid of
pci_dn::vendor_id/device_id/class now.


Anyway

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> -	     pdn->device_id == 0x1656) ||
> -	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
> -	     pdn->device_id == 0x1657) ||
> -	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
> -	     pdn->device_id == 0x168a) ||
> -	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
> -	     pdn->device_id == 0x168e))
> +	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
> +	     pdev->device == 0x1656) ||
> +	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
> +	     pdev->device == 0x1657) ||
> +	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
> +	     pdev->device == 0x168a) ||
> +	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
> +	     pdev->device == 0x168e))
>  		edev->pe->state |= EEH_PE_CFG_RESTRICTED;
>  
>  	/*
> @@ -461,7 +461,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  	 */
>  	if (!(edev->pe->state & EEH_PE_PRI_BUS)) {
>  		edev->pe->bus = pci_find_bus(hose->global_number,
> -					     pdn->busno);
> +					     pdev->bus->number);
>  		if (edev->pe->bus)
>  			edev->pe->state |= EEH_PE_PRI_BUS;
>  	}
> 

-- 
Alexey
