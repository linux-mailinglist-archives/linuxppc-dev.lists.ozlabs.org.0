Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346921D252
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 10:58:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4yGz1gnSzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Q+CIg1rN; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4yDS0wJ4zDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 18:56:07 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id p1so5238240pls.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n2TPtzyje2ZTEC1R3z8UR2smHm+j7GD+XD558f0ULMI=;
 b=Q+CIg1rNH9Joan9n9IzcSPa4+DIkA4BrmzRCVW35W1LgsK3kW9UlwIW3TCFjUMa2z5
 iM3si4TwyTma4MJZCca7EN3vcBShgWPyuwiPjdUUUUp65EMy6aE3hFQ1DD47CL0k+iYn
 tgQuu4d0B6o8a2u9gfGaThSWGXKUD+vvTCB+7r/0sT0+Wn0PPP6mN0kRtJSdq5LSjl31
 zJdfqY9pNYD/WjvHB93bAEHiZidK1qNVbei5AgYdxfkCroBIbv3M973F7P+jn8CM2ixU
 sT5vuhemf3li6l0twX6DRvZDMpvhPrl1Jc5bBdicJjYyuQVeN19D9h6Y3j2wJ/kQmt/L
 UKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=n2TPtzyje2ZTEC1R3z8UR2smHm+j7GD+XD558f0ULMI=;
 b=eQAwzTcu1AQaQe89l5+tJlaawkp59PUfi/Wy7Pf2wzHRJT70YNamRp+l4sjIeUyFTZ
 EP6MO+4L5S33npUrdvJLLB6HIPFo5P/XB2tBxKcUOqkYLzM84XBIUPOVtJcB6F+8PTik
 qL+o3SOKgIyKwNl727YSe1Xner5B++G3Lqn0mj+xUEEVi7+wV+fNS89xV7XHtRpGKF7e
 bSfm8tZdEaYBq+ykiIgfeGOGavjBV5G8sqbrm57i3S/9LqyVUS6GvRAOMZfG820qAS5q
 +osWKUhlKalvotlbbs/WwB5RDYapWicxLZj9CH7EzGHltvtXkonVCYXgnhY0Ki1Qkj70
 JBXA==
X-Gm-Message-State: AOAM533MZ/17Ivo9aHKEvy52Dia/W7h7BaRk/FKCh+mbvyHehLzool+3
 q7NcjpcsJknX9RN5d9n8yBXYW7wwUSUtuQ==
X-Google-Smtp-Source: ABdhPJyDf1gCKy+I+D2R4Q9dapfyXHqoRCDwIDx3nfyNOG194X6qVQeY25/Nxhz/LMtVh4huDoXkGA==
X-Received: by 2002:a17:90a:5218:: with SMTP id
 v24mr16962365pjh.223.1594630563898; 
 Mon, 13 Jul 2020 01:56:03 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id 9sm13775472pfx.131.2020.07.13.01.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:56:03 -0700 (PDT)
Subject: Re: [PATCH 03/14] powerpc/eeh: Move vf_index out of pci_dn and into
 eeh_dev
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-4-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <7853bbc2-715b-110a-2d96-8d32e6141261@ozlabs.ru>
Date: Mon, 13 Jul 2020 18:55:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706013619.459420-4-oohall@gmail.com>
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
> Drivers that do not support the PCI error handling callbacks are handled by
> tearing down the device and re-probing them. If the device to be removed is
> a virtual function we need to know the index of the index of the VF so that

Too many indexes in "the index of the index of "?


> we can remove it with the pci_iov_{add|remove}_virtfn() API.
> 
> Currently this is handled by looking up the pci_dn, and using the vf_index
> that was stashed there when the pci_dn for the VF was created in
> pcibios_sriov_enable(). We would like to eliminate the use of pci_dn
> outside of pseries though so we need to provide the generic EEH code with
> some other way to find the vf_index.
> 
> The easiest thing to do here is move the vf_index field out of pci_dn and
> into eeh_dev.  Currently pci_dn and eeh_dev are allocated and initialized
> together so this is a fairly minimal change in preparation for splitting
> pci_dn and eeh_dev in the future.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>  arch/powerpc/include/asm/eeh.h        | 3 +++
>  arch/powerpc/include/asm/pci-bridge.h | 1 -
>  arch/powerpc/kernel/eeh_driver.c      | 6 ++----
>  arch/powerpc/kernel/pci_dn.c          | 7 ++++---
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index e22881a0c415..3d648e042835 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -148,7 +148,10 @@ struct eeh_dev {
>  	struct pci_dn *pdn;		/* Associated PCI device node	*/
>  	struct pci_dev *pdev;		/* Associated PCI device	*/
>  	bool in_error;			/* Error flag for edev		*/
> +
> +	/* VF specific properties */
>  	struct pci_dev *physfn;		/* Associated SRIOV PF		*/
> +	int vf_index;			/* Index of this VF 		*/
>  };
>  
>  /* "fmt" must be a simple literal string */
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index b92e81b256e5..d2a2a14e56f9 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -202,7 +202,6 @@ struct pci_dn {
>  #define IODA_INVALID_PE		0xFFFFFFFF
>  	unsigned int pe_number;
>  #ifdef CONFIG_PCI_IOV
> -	int     vf_index;		/* VF index in the PF */
>  	u16     vfs_expanded;		/* number of VFs IOV BAR expanded */
>  	u16     num_vfs;		/* number of VFs enabled*/
>  	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 7b048cee767c..b70b9273f45a 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -477,7 +477,7 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
>  	}
>  
>  #ifdef CONFIG_PCI_IOV
> -	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);
> +	pci_iov_add_virtfn(edev->physfn, edev->vf_index);
>  #endif
>  	return NULL;
>  }
> @@ -521,9 +521,7 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
>  
>  	if (edev->physfn) {
>  #ifdef CONFIG_PCI_IOV
> -		struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> -
> -		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
> +		pci_iov_remove_virtfn(edev->physfn, edev->vf_index);
>  		edev->pdev = NULL;
>  #endif
>  		if (rmv_data)
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index f790a8d06f50..bf11ac8427ac 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -146,7 +146,6 @@ static struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
>  
>  #ifdef CONFIG_PCI_IOV
>  static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
> -					   int vf_index,
>  					   int busno, int devfn)
>  {
>  	struct pci_dn *pdn;
> @@ -163,7 +162,6 @@ static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
>  	pdn->parent = parent;
>  	pdn->busno = busno;
>  	pdn->devfn = devfn;
> -	pdn->vf_index = vf_index;
>  	pdn->pe_number = IODA_INVALID_PE;
>  	INIT_LIST_HEAD(&pdn->child_list);
>  	INIT_LIST_HEAD(&pdn->list);
> @@ -194,7 +192,7 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
>  	for (i = 0; i < pci_sriov_get_totalvfs(pdev); i++) {
>  		struct eeh_dev *edev __maybe_unused;
>  
> -		pdn = add_one_sriov_vf_pdn(parent, i,
> +		pdn = add_one_sriov_vf_pdn(parent,
>  					   pci_iov_virtfn_bus(pdev, i),
>  					   pci_iov_virtfn_devfn(pdev, i));
>  		if (!pdn) {
> @@ -207,7 +205,10 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
>  		/* Create the EEH device for the VF */
>  		edev = eeh_dev_init(pdn);
>  		BUG_ON(!edev);
> +
> +		/* FIXME: these should probably be populated by the EEH probe */
>  		edev->physfn = pdev;
> +		edev->vf_index = i;
>  #endif /* CONFIG_EEH */
>  	}
>  	return pci_get_pdn(pdev);
> 

-- 
Alexey
