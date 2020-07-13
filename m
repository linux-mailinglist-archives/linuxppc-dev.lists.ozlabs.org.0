Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2221D1B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 10:29:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4xf424j5zDqS6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aIkZRPwC; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4xcF3FKXzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 18:28:12 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t6so5728903pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VOlJEIp2vq/hgt7p2eUDo6tAZS72+I0Gabgt3aJj6MI=;
 b=aIkZRPwC/R0ora9TNIsa238O8ikvfR3f9lp5xJadPTYbLzHbgUYOcL1oMSLs74wzqX
 rurbqQRkZ4wYUHfHg1JANzCpDUZdrsh5j0qBdnZ6emIUcJ6ZF9k56+kTTGHmR+wxxC0Y
 QjTxYM3OEJCsZO8g4L0qQwFsbGe/ESB7kcHevGfOl9aVTVJSfX5HJdzvQ0zmXuUCAKp3
 q1NlUS+y/Ecz6pHUB6AgW91i3AL9dvP04/QQ9WAvR2M5Da6noFiw+RxZzkAlhY/TFoDu
 vN9t0WnxKJ3uuBDRcrFVYuMTqyRl7q+CQa7NOb7U68n4eQjGTWG+5cwVZJNPoGm8rfAv
 8s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VOlJEIp2vq/hgt7p2eUDo6tAZS72+I0Gabgt3aJj6MI=;
 b=dZES3h6wNdFcYjPRPDpC2PJClHdMuTAmDKSUSbyIYEa3bcrDK0Ke/T5QkiLPsafPfP
 T4DtZ04ghWD9NTFZ7O0sCHd/BjHr4/0WZNH7djmXQchqkGqV6DRXSdPAaT7vZqDMOobX
 XHdvngu3+yotU+foTCa3Kc9XcYulBPZfUc9FrFwIYzcxONO56cI/A0YXNBZP9QsukfBw
 lpiwLiXm4jWuuP1VKSOE9n4ugpBnrgVIxRY9SQavsoVKsDraAZDARAYGLjXee9rlcrln
 viQCSPTu9Oar69VgyiDO//tUQICZsLFqBRVRR3wwCoy4H5wA5i6T+kDZ05oMHXm7qDXt
 J+5w==
X-Gm-Message-State: AOAM533HKodFgM3sAANRGVVepmfS7E6Vvcs9ERenS79cUkAR2Ll6WSDn
 YqUh09SZDrj2oDWbGJ92MM+LRqLo+T4O6Q==
X-Google-Smtp-Source: ABdhPJwBrxzAl+8C48VgmNIIUhS4B1ho9NvgtTsSPDc9fOTO/EWGZLZoFO2jeGgmqusrFmqQWKIykQ==
X-Received: by 2002:aa7:8e90:: with SMTP id a16mr70521054pfr.84.1594628888581; 
 Mon, 13 Jul 2020 01:28:08 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id mu17sm15227459pjb.53.2020.07.13.01.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:28:07 -0700 (PDT)
Subject: Re: [PATCH 01/15] powernv/pci: Add pci_bus_to_pnvhb() helper
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-2-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <61aba0b1-fd8e-f9c2-d603-da1012ee9eb2@ozlabs.ru>
Date: Mon, 13 Jul 2020 18:28:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-2-oohall@gmail.com>
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
> explicit.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 88 +++++++----------------
>  arch/powerpc/platforms/powernv/pci.c      | 14 ++--
>  arch/powerpc/platforms/powernv/pci.h      | 10 +++
>  3 files changed, 38 insertions(+), 74 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 31c3e6d58c41..687919db0347 100644
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
> @@ -673,8 +671,7 @@ struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn)
>  
>  struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  
>  	if (!pdn)
> @@ -1069,8 +1066,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
>  
>  static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -1129,8 +1125,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>   */
>  static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pnv_ioda_pe *pe = NULL;
>  	unsigned int pe_num;
>  
> @@ -1196,8 +1191,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
>  	struct pnv_ioda_pe *pe;
>  	struct pci_dev *gpu_pdev;
>  	struct pci_dn *npu_pdn;
> -	struct pci_controller *hose = pci_bus_to_host(npu_pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(npu_pdev->bus);
>  
>  	/*
>  	 * Intentionally leak a reference on the npu device (for
> @@ -1300,16 +1294,12 @@ static void pnv_pci_ioda_setup_nvlink(void)
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
> @@ -1333,8 +1323,6 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
>  
>  static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
>  {
> -	struct pci_bus        *bus;
> -	struct pci_controller *hose;
>  	struct pnv_phb        *phb;
>  	struct pci_dn         *pdn;
>  	unsigned int           win;
> @@ -1346,9 +1334,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
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
> @@ -1459,15 +1445,11 @@ static void pnv_pci_ioda2_release_dma_pe(struct pci_dev *dev, struct pnv_ioda_pe
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
> @@ -1492,16 +1474,12 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
>  
>  static void pnv_pci_sriov_disable(struct pci_dev *pdev)
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
> @@ -1535,17 +1513,13 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
>  				       struct pnv_ioda_pe *pe);
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
> @@ -1572,7 +1546,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  		pe->rid = (vf_bus << 8) | vf_devfn;
>  
>  		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
> -			hose->global_number, pdev->bus->number,
> +			pci_domain_nr(pdev->bus), pdev->bus->number,
>  			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
>  
>  		if (pnv_ioda_configure_pe(phb, pe)) {
> @@ -1602,17 +1576,13 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
>  
>  static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
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
> @@ -1735,8 +1705,7 @@ static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  
>  static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -1847,8 +1816,7 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
>  static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
>  		u64 dma_mask)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -2766,8 +2734,7 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
>  #ifdef CONFIG_PCI_IOV
>  static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
>  	struct resource *res;
>  	int i;
> @@ -3101,10 +3068,9 @@ static void pnv_pci_ioda_fixup(void)
>  static resource_size_t pnv_pci_window_alignment(struct pci_bus *bus,
>  						unsigned long type)
>  {
> -	struct pci_dev *bridge;
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	int num_pci_bridges = 0;
> +	struct pci_dev *bridge;
>  
>  	bridge = bus->self;
>  	while (bridge) {
> @@ -3190,8 +3156,7 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
>  
>  static void pnv_pci_configure_bus(struct pci_bus *bus)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pci_dev *bridge = bus->self;
>  	struct pnv_ioda_pe *pe;
>  	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
> @@ -3237,8 +3202,7 @@ static resource_size_t pnv_pci_default_alignment(void)
>  static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>  						      int resno)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	resource_size_t align;
>  
> @@ -3274,8 +3238,7 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>   */
>  static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	struct pci_dn *pdn;
>  
>  	/* The function is probably called while the PEs have
> @@ -3488,8 +3451,7 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
>  
>  static void pnv_pci_release_device(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> @@ -3534,8 +3496,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
>  
>  static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
>  {
> -	struct pci_controller *hose = bus->sysdata;
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pnv_ioda_pe *pe;
>  
>  	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> @@ -3873,8 +3834,7 @@ void __init pnv_pci_init_npu2_opencapi_phb(struct device_node *np)
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
> index 091fe1cf386b..9b9bca169275 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -162,8 +162,7 @@ EXPORT_SYMBOL_GPL(pnv_pci_set_power_state);
>  
>  int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct msi_desc *entry;
>  	struct msi_msg msg;
>  	int hwirq;
> @@ -211,8 +210,7 @@ int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>  
>  void pnv_teardown_msi_irqs(struct pci_dev *pdev)
>  {
> -	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> -	struct pnv_phb *phb = hose->private_data;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>  	struct msi_desc *entry;
>  	irq_hw_number_t hwirq;
>  
> @@ -824,10 +822,9 @@ EXPORT_SYMBOL(pnv_pci_get_phb_node);
>  
>  int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  {
> -	__be64 val;
> -	struct pci_controller *hose;
> -	struct pnv_phb *phb;
> +	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
>  	u64 tunnel_bar;
> +	__be64 val;
>  	int rc;
>  
>  	if (!opal_check_token(OPAL_PCI_GET_PBCQ_TUNNEL_BAR))
> @@ -835,9 +832,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  	if (!opal_check_token(OPAL_PCI_SET_PBCQ_TUNNEL_BAR))
>  		return -ENXIO;
>  
> -	hose = pci_bus_to_host(dev->bus);
> -	phb = hose->private_data;
> -
>  	mutex_lock(&tunnel_mutex);
>  	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, &val);
>  	if (rc != OPAL_SUCCESS) {
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 51c254f2f3cb..0727dec9a0d1 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -260,4 +260,14 @@ extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
>  
>  extern unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
>  
> +static inline struct pnv_phb *pci_bus_to_pnvhb(struct pci_bus *bus)
> +{
> +	struct pci_controller *hose = bus->sysdata;
> +
> +	if (hose)
> +		return hose->private_data;


Since it is powernv, private_data should not ever be NULL so we want
BUG_ON here may be?


> +
> +	return NULL;
> +}
> +
>  #endif /* __POWERNV_PCI_H */
> 

-- 
Alexey
