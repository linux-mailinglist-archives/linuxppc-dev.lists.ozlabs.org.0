Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9E6BBF19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 22:30:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcNq04rsPz3f3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 08:30:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VagIOalE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VagIOalE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcNp34l1tz3bhV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 08:29:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8F9961E3E;
	Wed, 15 Mar 2023 21:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA22C433D2;
	Wed, 15 Mar 2023 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678915783;
	bh=Yckfzy+k6leZIz3lpyhOzkGl4+G0fpYDMqkxdZUVMOU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VagIOalEaXYkmeCS3Th9wPfp87XAWM99rfWwSGlfUuWCY8ew7Dc5FlMXPm2vTEMsI
	 MSf4rXWQlZn4yQTNNqh+cwR7LV3R2oWQ43Vjy1JednQnTzwzOf5OgpPhKJzLzjE/kY
	 /QqjTsUMijVG+9vLmxnxAjdedQdIlwVXhZXC+lEk4f4WsDAbsKUxA59aUkBbK7dZQC
	 yvBTEnTKztmx2XiNeIE4rwvEM/w7qig8Dnq0jaj3fECFJLFd5/dqRomzfCSzZ5qIe0
	 IDUS+N0YfIIpMzfMoTnpsMD2mqjN7dnAxCfoP5LZ8uhjxAUH3bFGz9+1VsRUS8N+Y+
	 INFJ5IimL/lwg==
Date: Wed, 15 Mar 2023 16:29:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v3 1/9] PCI/AER: Add
 pci_aer_clear_uncorrect_error_status() to PCI core
Message-ID: <20230315212941.GA1788160@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-2-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, ruscur@russell.cc, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 06:59:38PM +0800, Zhuo Chen wrote:
> In lpfc_aer_cleanup_state(), uncorrectable error status needs to be
> cleared, which can be done by calling pci_aer_clear_nonfatal_status()
> and pci_aer_clear_fatal_status(). Meanwhile they can be combined in
> one function (the same in dpc_process_error). So add
> pci_aer_clear_uncorrect_error_status() function to PCI core and
> export symbol to other modules which wants to use it.

Sorry for getting back to this so late.

Why does lpfc need this?  I think AER error status should be cleared
by the PCI core, not by individual drivers, so I really would rather
not add a new interface for drivers to use.

> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/aer.c | 16 ++++++++++++++++
>  include/linux/aer.h    |  5 +++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e2d8a74f83c3..4e637121be23 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -286,6 +286,22 @@ void pci_aer_clear_fatal_status(struct pci_dev *dev)
>  		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
>  }
>  
> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
> +{
> +	int aer = dev->aer_cap;
> +	u32 status;
> +
> +	if (!pcie_aer_is_native(dev))
> +		return -EIO;
> +
> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
> +	if (status)
> +		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
> +
>  /**
>   * pci_aer_raw_clear_status - Clear AER error registers.
>   * @dev: the PCI device
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 97f64ba1b34a..154690c278cb 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -45,6 +45,7 @@ struct aer_capability_regs {
>  int pci_enable_pcie_error_reporting(struct pci_dev *dev);
>  int pci_disable_pcie_error_reporting(struct pci_dev *dev);
>  int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
>  void pci_save_aer_state(struct pci_dev *dev);
>  void pci_restore_aer_state(struct pci_dev *dev);
>  #else
> @@ -60,6 +61,10 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  {
>  	return -EINVAL;
>  }
> +static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
> +{
> +	return -EINVAL;
> +}
>  static inline void pci_save_aer_state(struct pci_dev *dev) {}
>  static inline void pci_restore_aer_state(struct pci_dev *dev) {}
>  #endif
> -- 
> 2.30.1 (Apple Git-130)
> 
