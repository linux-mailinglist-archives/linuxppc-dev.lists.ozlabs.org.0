Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D67220326
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:03:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B63dM3D3pzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:03:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JfZiQRM2; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63Zg5FX6zDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:00:41 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t6so2040109pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 21:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTAHAcBoMojP476eR3rvdPVImhyUpuivDO3uM2Gt6gI=;
 b=JfZiQRM2Mx7t+vAmhGuns4BYcD+C02SwUIiUfWEPnMobwgqW6fG8Uh6JtbmCce1POu
 OskzYYu0Ho6IcfLvDvWPmNtqIkYAai8gn9HveNTqPK1Em/1pPjhDazXxb+mQNK6ImiYE
 xPpwHyX0Lrkykg8Jnl9lk0Q2FTmzGdD/4BkU5o5iEFbDKTtYabCkaS+sfBl4iT7UHwEK
 orZBi8wfU4NXz82MAVK4Ta/+hWv71W+jNPb2tsacP2ogd9Pr7rM1k+RFPMMbz/tk+P56
 ZjrH7NFIkyK1dLy6sQG+Xdeshcdt7YDP5o5YIqa++01GqlRG9ixUHxyoIZ8UhCsEXi3Y
 ju0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTAHAcBoMojP476eR3rvdPVImhyUpuivDO3uM2Gt6gI=;
 b=WFYkTPgWbsJ4N+Oo3EFB35MDkUJImZzw7rIM55R6/pkq45HPpCLo+XNxNe8szl+Uce
 xZMUmzeqeON6FfW+OJdaOdesjAo9koJzBvBC02NgkQlb53e0Mw+hUpQjKH1Z9P1+eSPY
 7XrP8uW3VtHvbkLCiaNJ+AaOzkG74ipFc3hLmCLq4wZogjg6qcs6GGJ9/yMy5vdYNPT6
 X4EqX+Hen44FwD4UZ/YMq3apayXPu0u/J4ipeF9FijAm/oDYqk0HY8CnRW6RbAOQTdCF
 D1FrLDbI9VRJRxNBnYkOer37ye+EWBTX9DOyowzzaH0xIRtmUFulaqQQsow7vS6hE8JH
 G00g==
X-Gm-Message-State: AOAM531DTlsEFvem8lpJdsfh2PDfmAmUZrc2gXeo8s/NmFfdhgE+a/rI
 0+STkubuzPkrwlHTyAIpX1dDiSYoQ7ze9g==
X-Google-Smtp-Source: ABdhPJxgK/R3KhW6vWFICaMOOIXOSnD2+CQdQJW6XwXdst7g7w8p+WbYL0oFdSxndqSCc6603H9CIw==
X-Received: by 2002:a63:d250:: with SMTP id t16mr6115915pgi.51.1594785637625; 
 Tue, 14 Jul 2020 21:00:37 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id v15sm562670pgo.15.2020.07.14.21.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 21:00:36 -0700 (PDT)
Subject: Re: [PATCH 12/15] powerpc/powernv/sriov: De-indent setup and teardown
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-13-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <ece39d29-6ab0-dcf4-0561-3c488c7921f9@ozlabs.ru>
Date: Wed, 15 Jul 2020 14:00:33 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-13-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/07/2020 15:23, Oliver O'Halloran wrote:
> Remove the IODA2 PHB checks. We already assume IODA2 in several places so
> there's not much point in wrapping most of the setup and teardown process
> in an if block.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 86 ++++++++++++----------
>  1 file changed, 49 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 08f88187d65a..d5699cd2ab7a 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -610,16 +610,18 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
>  	num_vfs = iov->num_vfs;
>  	base_pe = iov->vf_pe_arr[0].pe_number;
>  
> +	if (WARN_ON(!iov))
> +		return;
> +
>  	/* Release VF PEs */
>  	pnv_ioda_release_vf_PE(pdev);
>  
> -	if (phb->type == PNV_PHB_IODA2) {
> -		if (!iov->m64_single_mode)
> -			pnv_pci_vf_resource_shift(pdev, -base_pe);
> +	/* Un-shift the IOV BAR resources */
> +	if (!iov->m64_single_mode)
> +		pnv_pci_vf_resource_shift(pdev, -base_pe);
>  
> -		/* Release M64 windows */
> -		pnv_pci_vf_release_m64(pdev, num_vfs);
> -	}
> +	/* Release M64 windows */
> +	pnv_pci_vf_release_m64(pdev, num_vfs);
>  }
>  
>  static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
> @@ -693,41 +695,51 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  	phb = pci_bus_to_pnvhb(pdev->bus);
>  	iov = pnv_iov_get(pdev);
>  
> -	if (phb->type == PNV_PHB_IODA2) {
> -		if (!iov->vfs_expanded) {
> -			dev_info(&pdev->dev, "don't support this SRIOV device"
> -				" with non 64bit-prefetchable IOV BAR\n");
> -			return -ENOSPC;
> -		}
> +	/*
> +	 * There's a calls to IODA2 PE setup code littered throughout. We could
> +	 * probably fix that, but we'd still have problems due to the
> +	 * restriction inherent on IODA1 PHBs.
> +	 *
> +	 * NB: We class IODA3 as IODA2 since they're very similar.
> +	 */
> +	if (phb->type != PNV_PHB_IODA2) {
> +		pci_err(pdev, "SR-IOV is not supported on this PHB\n");
> +		return -ENXIO;
> +	}

or we could just skip setting

ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;

for uninteresting platforms in pnv_pci_init_ioda_phb().


>  
> -		/* allocate a contigious block of PEs for our VFs */
> -		base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
> -		if (!base_pe) {
> -			pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
> -			return -EBUSY;
> -		}
> +	if (!iov->vfs_expanded) {
> +		dev_info(&pdev->dev, "don't support this SRIOV device"
> +			" with non 64bit-prefetchable IOV BAR\n");
> +		return -ENOSPC;
> +	}
>  
> -		iov->vf_pe_arr = base_pe;
> -		iov->num_vfs = num_vfs;
> +	/* allocate a contigious block of PEs for our VFs */
> +	base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
> +	if (!base_pe) {
> +		pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
> +		return -EBUSY;
> +	}
>  
> -		/* Assign M64 window accordingly */
> -		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
> -		if (ret) {
> -			dev_info(&pdev->dev, "Not enough M64 window resources\n");
> -			goto m64_failed;
> -		}
> +	iov->vf_pe_arr = base_pe;
> +	iov->num_vfs = num_vfs;
>  
> -		/*
> -		 * When using one M64 BAR to map one IOV BAR, we need to shift
> -		 * the IOV BAR according to the PE# allocated to the VFs.
> -		 * Otherwise, the PE# for the VF will conflict with others.
> -		 */
> -		if (!iov->m64_single_mode) {
> -			ret = pnv_pci_vf_resource_shift(pdev,
> -							base_pe->pe_number);
> -			if (ret)
> -				goto shift_failed;
> -		}
> +	/* Assign M64 window accordingly */
> +	ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
> +	if (ret) {
> +		dev_info(&pdev->dev, "Not enough M64 window resources\n");
> +		goto m64_failed;
> +	}
> +
> +	/*
> +	 * When using one M64 BAR to map one IOV BAR, we need to shift
> +	 * the IOV BAR according to the PE# allocated to the VFs.
> +	 * Otherwise, the PE# for the VF will conflict with others.
> +	 */
> +	if (!iov->m64_single_mode) {
> +		ret = pnv_pci_vf_resource_shift(pdev,
> +						base_pe->pe_number);

This can be a single line now. Thanks,


> +		if (ret)
> +			goto shift_failed;
>  	}
>  
>  	/* Setup VF PEs */
> 

-- 
Alexey
