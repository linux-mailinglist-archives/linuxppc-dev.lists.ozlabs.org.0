Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF565773059
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 22:34:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y9C8mW+x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKSjZ5VcPz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 06:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y9C8mW+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKShg6mjVz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 06:33:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 037A56212C;
	Mon,  7 Aug 2023 20:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE89C433C7;
	Mon,  7 Aug 2023 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691440433;
	bh=y38hN5EEclw0PUar5Ep4X7eyWkPruUr/IdGCGlqUoIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Y9C8mW+xhR59eCV+WBOs36X6h43LmCogopSONWvzb60lW0qtKfmiLifxzhAREeOJh
	 7GLlI4qkn8kXlOWcxrs1IjZM/VtuKoaU2QK0n9hoDdasL4OxVKu9PRwMo4ZkJDn2sU
	 iXSsr3VJ5GgVBPYdyfLxGmTYI2YZ57jC5euTqXW0nVsF5o6JhuerJwOYzqxQHO2HLU
	 DLX+xtLrDcJEVrB/Q96oZQ32sHqKffPPCwJh1wxdV4QVSMoLCLIJXRxWaFu+BcfbTd
	 OzVAhN8DN1Naj2n5peAKL9Vp2TYTQ9/uTS8bY4avnQ4V/tsB3ZNXW39iNd0PMjc+RH
	 iZxsD7it+czqQ==
Date: Mon, 7 Aug 2023 15:33:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: Re: [PATCH 1/2] PCI: Add pci_find_next_dvsec_capability to find next
 designated VSEC
Message-ID: <20230807203351.GA269717@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807031846.77348-2-wangxiongfeng2@huawei.com>
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
Cc: "David E. Box" <david.e.box@linux.intel.com>, ben.widawsky@intel.com, ajd@linux.ibm.com, arnd@arndb.de, yangyingliang@huawei.com, linux-pci@vger.kernel.org, fbarrat@linux.ibm.com, npiggin@gmail.com, jonathan.cameron@huawei.com, gregkh@linuxfoundation.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc David since drivers/platform/x86/intel/vsec.c does some similar
things, although it seems to iterate over all Intel DVSEC IDs at once]

In subject:

  PCI: Add pci_find_next_dvsec_capability() to find next Designated VSEC

On Mon, Aug 07, 2023 at 11:18:45AM +0800, Xiongfeng Wang wrote:
> Some devices may have several DVSEC(Designated Vendor-Specific Extended
> Capability) entries with the same DVSEC ID. Add
> pci_find_next_dvsec_capability() to find them all.

Add space between "DVSEC" and "(Designated ...)".

> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

so you can merge this along with the ocxl patch that uses it.

> ---
>  drivers/pci/pci.c   | 37 +++++++++++++++++++++++++------------
>  include/linux/pci.h |  2 ++
>  2 files changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 60230da957e0..3455ca7306ae 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -749,35 +749,48 @@ u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap)
>  EXPORT_SYMBOL_GPL(pci_find_vsec_capability);
>  
>  /**
> - * pci_find_dvsec_capability - Find DVSEC for vendor
> + * pci_find_next_dvsec_capability - Find next DVSEC for vendor
>   * @dev: PCI device to query
> + * @start: address at which to start looking (0 to start at beginning of list)

s/address/Address/ to match other parameters

>   * @vendor: Vendor ID to match for the DVSEC
>   * @dvsec: Designated Vendor-specific capability ID

There are a lot of IDs floating around here, so to better match the
spec language:

  @dvsec: Vendor-defined DVSEC ID

> - * If DVSEC has Vendor ID @vendor and DVSEC ID @dvsec return the capability
> - * offset in config space; otherwise return 0.
> + * Returns the address of the next DVSEC if the DVSEC has Vendor ID @vendor and
> + * DVSEC ID @dvsec; otherwise return 0. DVSEC can occur several times with the
> + * same DVSEC ID for some devices, and this provides a way to find them all.
>   */
> -u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec)
> +u16 pci_find_next_dvsec_capability(struct pci_dev *dev, u16 start, u16 vendor,
> +				   u16 dvsec)
>  {
> -	int pos;
> +	u16 pos = start;
>  
> -	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DVSEC);
> -	if (!pos)
> -		return 0;
> -
> -	while (pos) {
> +	while ((pos = pci_find_next_ext_capability(dev, pos,
> +						  PCI_EXT_CAP_ID_DVSEC))) {
>  		u16 v, id;
>  
>  		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER1, &v);
>  		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER2, &id);
>  		if (vendor == v && dvsec == id)
>  			return pos;
> -
> -		pos = pci_find_next_ext_capability(dev, pos, PCI_EXT_CAP_ID_DVSEC);
>  	}
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(pci_find_next_dvsec_capability);
> +
> +/**
> + * pci_find_dvsec_capability - Find DVSEC for vendor
> + * @dev: PCI device to query
> + * @vendor: Vendor ID to match for the DVSEC
> + * @dvsec: Designated Vendor-specific capability ID
> + *
> + * If DVSEC has Vendor ID @vendor and DVSEC ID @dvsec return the capability
> + * offset in config space; otherwise return 0.
> + */
> +u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec)
> +{
> +	return pci_find_next_dvsec_capability(dev, 0, vendor, dvsec);
> +}
>  EXPORT_SYMBOL_GPL(pci_find_dvsec_capability);
>  
>  /**
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index c69a2cc1f412..82bb905daf72 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1168,6 +1168,8 @@ u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
>  struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
>  u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap);
>  u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec);
> +u16 pci_find_next_dvsec_capability(struct pci_dev *dev, u16 start, u16 vendor,
> +				   u16 dvsec);
>  
>  u64 pci_get_dsn(struct pci_dev *dev);
>  
> -- 
> 2.20.1
> 
