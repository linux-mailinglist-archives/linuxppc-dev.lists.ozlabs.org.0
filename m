Return-Path: <linuxppc-dev+bounces-9302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376AAD6DC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 12:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzMq5Jqrz2xQ6;
	Thu, 12 Jun 2025 20:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749724279;
	cv=none; b=aje0pcp26UbQiCqNKvHKSiLMhXdkAXW8NNqXg1bEsoiXdRZ4qsJfSzeuP2O/hk2AJtDsCLwlxrqxyBMqdSeG+SOTsPN8trFbvS6aiXMCMGRhNYdSwyfxsmwHD2Lx+1RHSctzFkHA6bgxvHNIguMPeiAily+89709/K0TJnrFd6Qt6nTPcJ7sPflXiRPXSjLzDteC6XNCk3bzkn9N9q4+yU5qxak1RFR2VlzPSY+FEW9zXTrXucruQgBrHuqu/CXEKQwlBkTCqKYg6dfoSQaX3sZLppIzDo/2A2uEij0aJr+/kuDxR7wxesy5bJRuXwVD0L5olHKVM2pbezgNZpmZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749724279; c=relaxed/relaxed;
	bh=LjvzuUVgtEnWBQWRzMnEUbgIe+PAP10CcsoBAW8xSME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZwAA3V0EHQ05ZvqQ74s2oo8nr9VKBTI2oa+hcMoPXZOMIBAy4MNUJXldm6GR/DA0rA3afGHmKE+0I2fOp0AA2ldugC7EXuOM//gyk5aAJrojDH4YamippCffJU/JlMWmf1hVt9vNcJ/F9sH8sCuopVI1dDKP+pnRIaKLinoo0oTMzTky/DXuny7SL2B4OGDL45bUDSHkR4XjSAErJHz9+XAGcLbtevQM/f2rSY1m1GEHLULRZWrOFm0xPVFwKtwuLecQNihMk16TzR875w3iVERYjGci2TTeBLrH2tOmm87X4ylpbYYkpwlyfxZ+Je0yBeHH5paEGo4shW3RtDJRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZOQCorL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZOQCorL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHzMp01qYz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 20:31:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41075A516EC;
	Thu, 12 Jun 2025 10:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C7DC4CEEA;
	Thu, 12 Jun 2025 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749724274;
	bh=wiejYMTupVjbAdH1VRxuYY6nbMKtSb6UNwF+vG/I2Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZOQCorL+FGN0FPSLDpR8Nl8cwHh+7aLHkJpDhkkqjrI4azY6PmftyMBrjW11fweY
	 /6L5e0SRkXt6e0SsClWbT+ujg52rh7F8AHbwijjUu6KqMAiuttnuGG/7Hnkcd67Pr1
	 YI8JipTlAB9CM+wZphqk74sat00/MaaownS333t/79phWLtuK2fq6r6lYwvgdXchSW
	 Gm38EvYTsUiceMQtIWV51cF7u7fDL274fBaomUddd/WzWI8Yuo7F12zxO+95YL5GuK
	 8SawW3OB8iFq4MhTAmDNhMmHBN5Q64FOLUcFMZ5PjkbBVWqdKhm++ACGoj9njUx2R9
	 O8y52dIfXP3Rg==
Date: Thu, 12 Jun 2025 16:01:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org, 
	sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com, oohall@gmail.com, 
	Jonathan.Cameron@huawei.com, terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v4 2/3] PCI/DPC: Run recovery on device that detected the
 error
Message-ID: <qqixmrgqnba6hlt4fritlknfnbe6zm63qgxhoep4oriinbozyt@f6tzmjpyaf6d>
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-3-xueshuai@linux.alibaba.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217024218.1681-3-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Feb 17, 2025 at 10:42:17AM +0800, Shuai Xue wrote:
> The current implementation of pcie_do_recovery() assumes that the
> recovery process is executed on the device that detected the error.

s/on/for

> However, the DPC driver currently passes the error port that experienced
> the DPC event to pcie_do_recovery().
> 
> Use the SOURCE ID register to correctly identify the device that
> detected the error. When passing the error device, the
> pcie_do_recovery() will find the upstream bridge and walk bridges
> potentially AER affected. And subsequent patches will be able to

s/patches/commits

> accurately access AER status of the error device.
> 
> Should not observe any functional changes.
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>  drivers/pci/pci.h      |  2 +-
>  drivers/pci/pcie/dpc.c | 28 ++++++++++++++++++++++++----
>  drivers/pci/pcie/edr.c |  7 ++++---
>  3 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 01e51db8d285..870d2fbd6ff2 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -572,7 +572,7 @@ struct rcec_ea {
>  void pci_save_dpc_state(struct pci_dev *dev);
>  void pci_restore_dpc_state(struct pci_dev *dev);
>  void pci_dpc_init(struct pci_dev *pdev);
> -void dpc_process_error(struct pci_dev *pdev);
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>  pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>  bool pci_dpc_recovered(struct pci_dev *pdev);
>  unsigned int dpc_tlp_log_len(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 1a54a0b657ae..ea3ea989afa7 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -253,10 +253,20 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>  	return 1;
>  }
>  
> -void dpc_process_error(struct pci_dev *pdev)
> +/**
> + * dpc_process_error - handle the DPC error status
> + * @pdev: the port that experienced the containment event
> + *
> + * Return the device that detected the error.

s/Return/Return:

> + *
> + * NOTE: The device reference count is increased, the caller must decrement
> + * the reference count by calling pci_dev_put().
> + */
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>  {
>  	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>  	struct aer_err_info info;
> +	struct pci_dev *err_dev;
>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> @@ -279,6 +289,13 @@ void dpc_process_error(struct pci_dev *pdev)
>  		 "software trigger" :
>  		 "reserved error");
>  
> +	if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE ||
> +	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE)
> +		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +					    PCI_BUS_NUM(source), source & 0xff);
> +	else
> +		err_dev = pci_dev_get(pdev);
> +
>  	/* show RP PIO error detail information */
>  	if (pdev->dpc_rp_extensions &&
>  	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
> @@ -291,6 +308,8 @@ void dpc_process_error(struct pci_dev *pdev)
>  		pci_aer_clear_nonfatal_status(pdev);
>  		pci_aer_clear_fatal_status(pdev);
>  	}
> +
> +	return err_dev;
>  }
>  
>  static void pci_clear_surpdn_errors(struct pci_dev *pdev)
> @@ -346,7 +365,7 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>  
>  static irqreturn_t dpc_handler(int irq, void *context)
>  {
> -	struct pci_dev *err_port = context;
> +	struct pci_dev *err_port = context, *err_dev;
>  
>  	/*
>  	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
> @@ -357,10 +376,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
>  		return IRQ_HANDLED;
>  	}
>  
> -	dpc_process_error(err_port);
> +	err_dev = dpc_process_error(err_port);
>  
>  	/* We configure DPC so it only triggers on ERR_FATAL */
> -	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
> +	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
> +	pci_dev_put(err_dev);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
> index 521fca2f40cb..088f3e188f54 100644
> --- a/drivers/pci/pcie/edr.c
> +++ b/drivers/pci/pcie/edr.c
> @@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
>  
>  static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  {
> -	struct pci_dev *pdev = data, *err_port;
> +	struct pci_dev *pdev = data, *err_port, *err_dev;
>  	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
>  	u16 status;
>  
> @@ -190,7 +190,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  		goto send_ost;
>  	}
>  
> -	dpc_process_error(err_port);
> +	err_dev = dpc_process_error(err_port);
>  	pci_aer_raw_clear_status(err_port);
>  
>  	/*
> @@ -198,7 +198,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  	 * or ERR_NONFATAL, since the link is already down, use the FATAL
>  	 * error recovery path for both cases.
>  	 */
> -	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
> +	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>  
>  send_ost:
>  
> @@ -216,6 +216,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  	}
>  
>  	pci_dev_put(err_port);
> +	pci_dev_put(err_dev);

err_dev is not a valid pointer before calling dpc_process_error(). So either
initialize it with NULL or only call it in error paths after
dpc_process_error().

And btw, pci_dev_put(err_dev) should come before pci_dev_put(err_port).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

