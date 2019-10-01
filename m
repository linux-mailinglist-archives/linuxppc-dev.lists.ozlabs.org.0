Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BBC2CFC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 07:41:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46j7Rj64CmzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 15:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="xSognUhU"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46j7Q36Fj9zDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 15:39:53 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id q7so8792603pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 22:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kQcpm+slaaxd6F2CuzlaygEzTeyWF+hnFrIxqojKd0E=;
 b=xSognUhU057avV/FmBVy7Kch14y43C+LhwTQffW8kZdecsY6zo5ekp6soC2+CV/7Dq
 XEG2KFob9At0kNkLyO7BH+qHkD4wLFwAGcL0EAyP+3IiByvHf5zWkfCYY69xBYuvUAyO
 vNobo3uQeVbvbRmOjIfendAZM1cDKallSFJ+qnLwsivX/GCDh+HaoHM7ddLfGTp1tSMF
 fK+SG7tTh5CTPc+1wR9V1OF//f4y8rhEkZSe1SLyXz2PT8KO5GTuWgwAF5WSN4PU4AMq
 CVboESw697Mysz8S9/q2DwmwlEwyKaSmA+EWC3BD42ncPV98fmI/57ApF1Uiy+z0saXP
 Zr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kQcpm+slaaxd6F2CuzlaygEzTeyWF+hnFrIxqojKd0E=;
 b=tKOA6TqAt4VsQ8+4wMN3R7ezXYppJ+5RD2l0+5eJrhAKK4I4ErlaASyPbzJM4jBMfQ
 8Tc/7uhhn+kcLnyx3KT/V4rEmf+NL5YtfGIpZyskg0YcxsVHbhp0RwZdG2YW1nmlMCLU
 5KC897fLPiXhuW0+rQYCKmUhsIYOA6P/m/qYNwXjKjeyqiwefGxw6dlRkGZ5WlCuUD9c
 1dX6ZQW81+51RVgocC89aFUuZzXB1Y9enzL4kV4d10urATMiH8e8tQkauquaToFjjlDJ
 HbEjWwtM8twYay1MsmrBRN3rvlm/1N5df+CI6XM1lQLJdIF1Y9BtnbPQx00sedjAd7TL
 dbtw==
X-Gm-Message-State: APjAAAXY7Yuu/Vve/uzKYt0A9v/fjm6z8oEq1l7qQ6ZR53iMt9Q1EHKE
 ZKa1iU2Hz47vEYBm44KWJsHEig==
X-Google-Smtp-Source: APXvYqxY1j8bi5q6hzJaYD8pEmh5StfANSGm2JkR7RtM4RmWzVUhthyqTk24Q+1F1E7+6VeqdL8VSQ==
X-Received: by 2002:a65:688a:: with SMTP id e10mr9443543pgt.221.1569908389250; 
 Mon, 30 Sep 2019 22:39:49 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j16sm1339514pje.6.2019.09.30.22.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2019 22:39:48 -0700 (PDT)
Subject: Re: [PATCH 1/3] powernv/iov: Ensure the pdn for VFs always contains a
 valid PE number
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190930020848.25767-1-oohall@gmail.com>
 <20190930020848.25767-2-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <36733743-3482-6a89-42b1-18d7caca7abb@ozlabs.ru>
Date: Tue, 1 Oct 2019 15:39:44 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930020848.25767-2-oohall@gmail.com>
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
Cc: linux-pci@vger.kernel.org, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/09/2019 12:08, Oliver O'Halloran wrote:
> On PowerNV we use the pcibios_sriov_enable() hook to do two things:
> 
> 1. Create a pci_dn structure for each of the VFs, and
> 2. Configure the PHB's internal BARs that map MMIO ranges to PEs
>    so that each VF has it's own PE. Note that the PE also determines
>    the IOMMU table the HW uses for the device.
> 
> Currently we do not set the pe_number field of the pci_dn immediately after
> assigning the PE number for the VF that it represents. Instead, we do that
> in a fixup (see pnv_pci_dma_dev_setup) which is run inside the
> pcibios_add_device() hook which is run prior to adding the device to the
> bus.
> 
> On PowerNV we add the device to it's IOMMU group using a bus notifier and
> in order for this to work the PE number needs to be known when the bus
> notifier is run. This works today since the PE number is set in the fixup
> which runs before adding the device to the bus. However, if we want to move
> the fixup to a later stage this will break.
> 
> We can fix this by setting the pdn->pe_number inside of
> pcibios_sriov_enable(). There's no good to avoid this since we already have
> all the required information at that point, so... do that. Moving this
> earlier does cause two problems:
> 
> 1. We trip the WARN_ON() in the fixup code, and
> 2. The EEH core will clear pdn->pe_number while recovering VFs.
> 
> The only justification for either of these is a comment in eeh_rmv_device()
> suggesting that pdn->pe_number *must* be set to IODA_INVALID_PE in order
> for the VF to be scanned. However, this comment appears to have no basis in
> reality so just delete it.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>


Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> ---
> Can't get rid of the fixup entirely since we need it to set the
> ioda_pe->pdev back-pointer. I'll look at killing that another time.
> ---
>  arch/powerpc/kernel/eeh_driver.c          |  6 ------
>  arch/powerpc/platforms/powernv/pci-ioda.c | 19 +++++++++++++++----
>  arch/powerpc/platforms/powernv/pci.c      |  4 ----
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index d9279d0..7955fba 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -541,12 +541,6 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
>  
>  		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
>  		edev->pdev = NULL;
> -
> -		/*
> -		 * We have to set the VF PE number to invalid one, which is
> -		 * required to plug the VF successfully.
> -		 */
> -		pdn->pe_number = IODA_INVALID_PE;
>  #endif
>  		if (rmv_data)
>  			list_add(&edev->rmv_entry, &rmv_data->removed_vf_list);
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 5e3172d..70508b3 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1558,6 +1558,10 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  	/* Reserve PE for each VF */
>  	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
> +		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
> +		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
> +		struct pci_dn *vf_pdn;
> +
>  		if (pdn->m64_single_mode)
>  			pe_num = pdn->pe_num_map[vf_index];
>  		else
> @@ -1570,13 +1574,11 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		pe->pbus = NULL;
>  		pe->parent_dev = pdev;
>  		pe->mve_number = -1;
> -		pe->rid = (pci_iov_virtfn_bus(pdev, vf_index) << 8) |
> -			   pci_iov_virtfn_devfn(pdev, vf_index);
> +		pe->rid = (vf_bus << 8) | vf_devfn;
>  
>  		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
>  			hose->global_number, pdev->bus->number,
> -			PCI_SLOT(pci_iov_virtfn_devfn(pdev, vf_index)),
> -			PCI_FUNC(pci_iov_virtfn_devfn(pdev, vf_index)), pe_num);
> +			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
>  
>  		if (pnv_ioda_configure_pe(phb, pe)) {
>  			/* XXX What do we do here ? */
> @@ -1590,6 +1592,15 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		list_add_tail(&pe->list, &phb->ioda.pe_list);
>  		mutex_unlock(&phb->ioda.pe_list_mutex);
>  
> +		/* associate this pe to it's pdn */
> +		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
> +			if (vf_pdn->busno == vf_bus &&
> +			    vf_pdn->devfn == vf_devfn) {
> +				vf_pdn->pe_number = pe_num;
> +				break;
> +			}
> +		}
> +
>  		pnv_pci_ioda2_setup_dma_pe(phb, pe);
>  #ifdef CONFIG_IOMMU_API
>  		iommu_register_group(&pe->table_group,
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 2825d00..b7761e2 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -816,16 +816,12 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  	struct pnv_phb *phb = hose->private_data;
>  #ifdef CONFIG_PCI_IOV
>  	struct pnv_ioda_pe *pe;
> -	struct pci_dn *pdn;
>  
>  	/* Fix the VF pdn PE number */
>  	if (pdev->is_virtfn) {
> -		pdn = pci_get_pdn(pdev);
> -		WARN_ON(pdn->pe_number != IODA_INVALID_PE);
>  		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
>  			if (pe->rid == ((pdev->bus->number << 8) |
>  			    (pdev->devfn & 0xff))) {
> -				pdn->pe_number = pe->pe_number;
>  				pe->pdev = pdev;
>  				break;
>  			}
> 

-- 
Alexey
