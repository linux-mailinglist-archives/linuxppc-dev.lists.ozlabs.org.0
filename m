Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 341BE108604
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 01:44:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LpFn5RyszDqbs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="DbXMJ5cG"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LpD569TtzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 11:43:01 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b19so6447014pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 16:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PCmUGmo7T7gb1Vn2k+DofZhqv7uIz87yr+CcepvPT9Y=;
 b=DbXMJ5cGnn0l7wsbJG03IozRJvw8F1xrUf/WMgfKnYA35bkyUYf7esrxgpL/4xUIMu
 WM+Me+uCwX8r/Zuz5X8lurcOR9z6rS9ariT00rYlMJNh4kHepaBeyd35txHiAWXySq6+
 EukuXiYu6BPem9QzBA/TnFtm9u81l8rY+sr8nWsvlwkKheXKI0tYFypp0nuWRCS1Ui1t
 GHyzJQaU/+cd0ZDd7DCnCCHbfDtqwfwZ/FQkl93l3a+vnJYVd4Gc4TYoXv38Op9L9Jao
 lREpWCsYS+yfugWOFUEX/DET5+2Khs2oZ3y02zw1E3iPZEgp/cRtdH+WVHeIgKt8PDV+
 BWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PCmUGmo7T7gb1Vn2k+DofZhqv7uIz87yr+CcepvPT9Y=;
 b=sEcykPRrgaWPzd3W78qALcM5Pu2MXhaFQO90UzMa9TLOAnlPyhR3MptAnyktkf96Bo
 N45dpvi2IRSSRzeSUhOVXOHajctuvbQqsUiGVx6qBkbYDiYval0ydCXJ4DOIy42ZLOnU
 q+YqYMbJCbCs1Sq8JqIalkJkq9+W8Zo2KOXbAVNjqpYSIeggzn4DVcIEbMsJXuxaiNCH
 vW/Jbu+Z08HjUzNn5kTgWk10INgMSkjKtALfGhFExPu9rSmWcoYE+ky+xURiUXnHMkTd
 Y44uOzmPq0VDicnCJ3v5xEnDss8GTmcNzcCwz7YbkDcYFEOvii26hQXRhSVwan+IuCuO
 JEDw==
X-Gm-Message-State: APjAAAWPv3pcEiU9Ik+rhk06aKwuUBO5o0itKPi8eir5D+j7XhDYN4Ww
 3fHWL6oebAzMSx94sDOmaoASyuCcr+w=
X-Google-Smtp-Source: APXvYqz+9rdxkuTs1ZkjHTwygeFWgaKEU8QoDnfWVvt+dWFZ1Ti4h5gSS7nqa8p7lvZBEiD2MuwsvA==
X-Received: by 2002:a63:f40e:: with SMTP id g14mr11897239pgi.132.1574642578405; 
 Sun, 24 Nov 2019 16:42:58 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i70sm5658073pge.14.2019.11.24.16.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2019 16:42:57 -0800 (PST)
Subject: Re: [Very RFC 18/46] powernv/pci: Add pci_bus_to_pnvhb() helper
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-19-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <22591882-69e8-ab3d-84fa-341dccc12fa2@ozlabs.ru>
Date: Mon, 25 Nov 2019 11:42:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-19-oohall@gmail.com>
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
> Add a helper to go from a pci_bus structure to the pnv_phb that hosts that
> bus. There's a lot of instances of the following pattern:
> 
> 	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> 	struct pnv_phb *phb = hose->private_data;
> 
> Without any other uses of the pci_controller inside the function. This is
> hard to read since it requires you to memorise the contents of the
> private data fields and kind of error prone since it involves blindly
> assigning a void pointer. Add a helper to make it more concise and
> explict.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 88 +++++++----------------
>  arch/powerpc/platforms/powernv/pci.c      | 18 ++---
>  arch/powerpc/platforms/powernv/pci.h      | 10 +++
>  3 files changed, 39 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index c74521e5f3ab..a1c9315f3208 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -252,8 +252,7 @@ static int pnv_ioda2_init_m64(struct pnv_phb *phb)
>  static void pnv_ioda_reserve_dev_m64_pe(struct pci_dev *pdev,
>  					 unsigned long *pe_bitmap)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct resource *r;
>  	resource_size_t base, sgsz, start, end;
>  	int segno, i;
> @@ -351,8 +350,7 @@ static void pnv_ioda_reserve_m64_pe(struct pci_bus *bus,
>  
>  static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pnv_ioda_pe *master_pe, *pe;
>  	unsigned long size, *pe_alloc;
>  	int i;
> @@ -673,8 +671,7 @@ struct pnv_ioda_pe *__pnv_ioda_get_pe(struct pnv_phb *phb, u16 bdfn)
>  
>  struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  
>  	if (!pdn)
> @@ -1053,8 +1050,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  
>  static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -1113,8 +1109,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>   */
>  static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pnv_ioda_pe *pe = NULL;
>  	unsigned int pe_num;
>  
> @@ -1181,8 +1176,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
>  	struct pnv_ioda_pe *pe;
>  	struct pci_dev *gpu_pdev;
>  	struct pci_dn *npu_pdn;
> -	struct pci_controller *hose = pci_bus_to_host(npu_pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(npu_pdev->bus);
>  
>  	/*
>  	 * Due to a hardware errata PE#0 on the NPU is reserved for
> @@ -1279,16 +1273,12 @@ static void pnv_pci_ioda_setup_PEs(void)
>  #ifdef CONFIG_PCI_IOV
>  static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pci_dn         *pdn;
>  	int                    i, j;
>  	int                    m64_bars;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  
>  	if (pdn->m64_single_mode)
> @@ -1312,8 +1302,6 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  
>  static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pci_dn         *pdn;
>  	unsigned int           win;
> @@ -1325,9 +1313,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  	int                    pe_num;
>  	int                    m64_bars;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  	total_vfs = pci_sriov_get_totalvfs(pdev);
>  
> @@ -1438,15 +1424,11 @@ static void pnv_pci_ioda2_release_dma_pe(struct pci_dev *dev, struct pnv_ioda_pe
>  
>  static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe, *pe_n;
>  	struct pci_dn         *pdn;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  
>  	if (!pdev->is_physfn)
> @@ -1471,16 +1453,12 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
>  
>  void pnv_pci_sriov_disable(struct pci_dev *pdev)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe;
>  	struct pci_dn         *pdn;
>  	u16                    num_vfs, i;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  	num_vfs = pdn->num_vfs;
>  
> @@ -1519,17 +1497,13 @@ static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
>  #endif
>  static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe;
>  	int                    pe_num;
>  	u16                    vf_index;
>  	struct pci_dn         *pdn;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  
>  	if (!pdev->is_physfn)
> @@ -1556,7 +1530,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		pe->rid = (vf_bus << 8) | vf_devfn;
>  
>  		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
> -			hose->global_number, pdev->bus->number,
> +			pci_domain_nr(pdev->bus), pdev->bus->number,
>  			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
>  
>  		if (pnv_ioda_configure_pe(phb, pe)) {
> @@ -1591,17 +1565,13 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pnv_ioda_pe    *pe;
>  	struct pci_dn         *pdn;
>  	int                    ret;
>  	u16                    i;
>  
> -	bus = pdev->bus;
> -	hose = pci_bus_to_host(bus);
> -	phb = hose->private_data;
> +	phb = pci_bus_to_pnvhb(pdev->bus);
>  	pdn = pci_get_pdn(pdev);
>  
>  	if (phb->type == PNV_PHB_IODA2) {
> @@ -1816,8 +1786,7 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
>  static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
>  		u64 dma_mask)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -2866,8 +2835,7 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
>  #ifdef CONFIG_PCI_IOV
>  static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
>  	struct resource *res;
>  	int i;
> @@ -3202,10 +3170,9 @@ static void pnv_pci_ioda_fixup(void)
>  static resource_size_t pnv_pci_window_alignment(struct pci_bus *bus,
>  						unsigned long type)
>  {
> -	struct pci_dev *bridge;
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	int num_pci_bridges = 0;
> +	struct pci_dev *bridge;


Is this definition movement an oversight or christmastreefication? This
is not skiboot though ;)

This looks unrelated change.


>  
>  	bridge = bus->self;
>  	while (bridge) {
> @@ -3291,8 +3258,7 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
>  
>  static void pnv_pci_configure_bus(struct pci_bus *bus)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pci_dev *bridge = bus->self;
>  	struct pnv_ioda_pe *pe;
>  	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
> @@ -3354,8 +3320,7 @@ static resource_size_t pnv_pci_default_alignment(void)
>  static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>  						      int resno)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	resource_size_t align;
>  
> @@ -3391,8 +3356,7 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>   */
>  static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn;
>  
>  	/* The function is probably called while the PEs have
> @@ -3577,8 +3541,7 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
>  
>  static void pnv_pci_release_device(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -3623,8 +3586,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
>  
>  void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -3664,8 +3626,7 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  
>  void pnv_pci_dma_bus_setup(struct pci_bus *bus)
>  {
> -	struct pci_controller *hose = bus->sysdata;
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pnv_ioda_pe *pe;
>  
>  	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> @@ -3999,8 +3960,7 @@ void __init pnv_pci_init_npu2_opencapi_phb(struct device_node *np)
>  
>  static void pnv_npu2_opencapi_cfg_size_fixup(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  
>  	if (!machine_is(powernv))
>  		return;
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 8b9058b52575..d36dde9777aa 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -158,8 +158,7 @@ EXPORT_SYMBOL_GPL(pnv_pci_set_power_state);
>  
>  int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct msi_desc *entry;
>  	struct msi_msg msg;
>  	int hwirq;
> @@ -207,8 +206,7 @@ int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>  
>  void pnv_teardown_msi_irqs(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct msi_desc *entry;
>  	irq_hw_number_t hwirq;
>  
> @@ -820,10 +818,9 @@ EXPORT_SYMBOL(pnv_pci_get_phb_node);
>  
>  int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  {
> -	__be64 val;
> -	struct pci_controller *hose;
> -	struct pnv_phb *phb;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	u64 tunnel_bar;
> +	__be64 val;



or here...

>  	int rc;
>  
>  	if (!opal_check_token(OPAL_PCI_GET_PBCQ_TUNNEL_BAR))
> @@ -831,9 +828,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  	if (!opal_check_token(OPAL_PCI_SET_PBCQ_TUNNEL_BAR))
>  		return -ENXIO;
>  
> -	hose = pci_bus_to_host(dev->bus);
> -	phb = hose->private_data;
> -
>  	mutex_lock(&tunnel_mutex);
>  	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, &val);
>  	if (rc != OPAL_SUCCESS) {
> @@ -937,15 +931,13 @@ static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
>  	struct pci_dev *pdev;
>  	struct pci_dn *pdn;
>  	struct pnv_ioda_pe *pe;
> -	struct pci_controller *hose;
>  	struct pnv_phb *phb;
>  
>  	switch (action) {
>  	case BUS_NOTIFY_ADD_DEVICE:
>  		pdev = to_pci_dev(dev);
>  		pdn = pci_get_pdn(pdev);
> -		hose = pci_bus_to_host(pdev->bus);
> -		phb = hose->private_data;
> +		phb = pci_bus_to_pnvhb(pdev->bus);
>  
>  		WARN_ON_ONCE(!phb);
>  		if (!pdn || pdn->pe_number == IODA_INVALID_PE || !phb)
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index a343f3c8e65c..be435a810d19 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -247,4 +247,14 @@ extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
>  		void *tce_mem, u64 tce_size,
>  		u64 dma_offset, unsigned int page_shift);
>  
> +static inline struct pnv_phb *pci_bus_to_pnvhb(struct pci_bus *bus)
> +{
> +	struct pci_controller *hose = bus->sysdata;
> +
> +	if (hose)
> +		return hose->private_data;


And since I am commenting on this, usually it is the other way around,
like "if (!hose) return NULL" but I do not insist.


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> +
> +	return NULL;
> +}
> +
>  #endif /* __POWERNV_PCI_H */
> 

-- 
Alexey
