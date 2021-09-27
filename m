Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4266A419D58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 19:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ97s0v6Rz2yRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 03:47:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZittX7ds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZittX7ds; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ97C3cFvz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 03:46:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90CF60FBF;
 Mon, 27 Sep 2021 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764804;
 bh=H8Mj81WyvY+HesKTc7Fr+jbrmn+2nM8SxLPaQtOgGIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZittX7dsrCxpUqN8o37oZKbtwhDDRSMGteLP7htIcE97ezSL5hLEWtgtFTfMftD4e
 CYwr2z84HijxnJHnlx2Vr2XnnnUzJnIHQBlphYKAODAoFWl2WYj56rnXzj1UAcmrvA
 1jlqXZrF6dDHlMQ2+bXx4Iinc4r6Hy4KkHIBwTcgeRtx+LXtO2yw8W1A3qGL+pMzx6
 cMEZDA5ncBnXfuv1FmQRVuR7TMh1aiOkPpFQXGM3BmoRWzKuKqw+UVVGa3SQ/ddu5A
 yBrQyDHe//KBx0FqVPhl76WYY/CsBta3w+VoXlryUBMj4/yxoHSpV15GYjV8aQ/7BF
 r1L7xhiACVKEQ==
Date: Mon, 27 Sep 2021 12:46:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [PATCH v2 6/9] PCI: Add pci_find_dvsec_capability to find
 designated VSEC
Message-ID: <20210927174642.GA661147@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923172647.72738-7-ben.widawsky@intel.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 iommu@lists.linux-foundation.org,
 "David E . Box" <david.e.box@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/pci_find_dvsec_capability/pci_find_dvsec_capability()/ in subject
and commit log.

On Thu, Sep 23, 2021 at 10:26:44AM -0700, Ben Widawsky wrote:
> Add pci_find_dvsec_capability to locate a Designated Vendor-Specific
> Extended Capability with the specified DVSEC ID.

"specified Vendor ID and Capability ID".

> The Designated Vendor-Specific Extended Capability (DVSEC) allows one or
> more vendor specific capabilities that aren't tied to the vendor ID of
> the PCI component.
> 
> DVSEC is critical for both the Compute Express Link (CXL) driver as well
> as the driver for OpenCAPI coherent accelerator (OCXL).

Strictly speaking, not really relevant for the commit log.

> Cc: David E. Box <david.e.box@linux.intel.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

If you want to merge this with the series,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Or if you want me to merge this on a branch, let me know.

> ---
>  drivers/pci/pci.c   | 32 ++++++++++++++++++++++++++++++++
>  include/linux/pci.h |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ce2ab62b64cf..94ac86ff28b0 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -732,6 +732,38 @@ u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap)
>  }
>  EXPORT_SYMBOL_GPL(pci_find_vsec_capability);
>  
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
> +	int pos;
> +
> +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DVSEC);
> +	if (!pos)
> +		return 0;
> +
> +	while (pos) {
> +		u16 v, id;
> +
> +		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER1, &v);
> +		pci_read_config_word(dev, pos + PCI_DVSEC_HEADER2, &id);
> +		if (vendor == v && dvsec == id)
> +			return pos;
> +
> +		pos = pci_find_next_ext_capability(dev, pos, PCI_EXT_CAP_ID_DVSEC);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_find_dvsec_capability);
> +
>  /**
>   * pci_find_parent_resource - return resource region of parent bus of given
>   *			      region
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index cd8aa6fce204..c93ccfa4571b 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1130,6 +1130,7 @@ u16 pci_find_ext_capability(struct pci_dev *dev, int cap);
>  u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
>  struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
>  u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap);
> +u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec);
>  
>  u64 pci_get_dsn(struct pci_dev *dev);
>  
> -- 
> 2.33.0
> 
