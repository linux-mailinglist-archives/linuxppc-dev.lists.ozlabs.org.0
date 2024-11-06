Return-Path: <linuxppc-dev+bounces-2921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B23EB9BF271
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 17:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk92s3Crbz2xGj;
	Thu,  7 Nov 2024 03:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730908965;
	cv=none; b=ZGtXtUxxx/B1hv7g/YxK7CMy7ZOyXehle4oW1obf5CIhmKTXM1P9szxz5wssO6MLmqg/4nE8Ajx0/lKKytpgfD3mKJmpfzxDOjiSIODktr3sKPRm4P6iLdQx/WO975fHV9z9h0LntT0wJQ3F9h5iyKdOg2p/+/jbCcDRcq9m2Tya1USEah04k8GBPKVvDmM01qb58NF0xcd3Zv0DwfQI9gZMniPCtuWV/PFfGsWRfQNPTS9elsuufTXR6n0R3xEnZfIk+4JJWsXbZPqbogf6jeQS0QeTqiYpFlkY9M50Nc1KvYugmDXLAnlepV7EPQ9IRiVQMXvLRQenTyTViekFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730908965; c=relaxed/relaxed;
	bh=vnAaO1twteb38YqCGhqGCxjF+IiX5D6ZuG4AuwUKCC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MAwRp7VOoPHDOsrEu6wt3vjg+xDFM21sOai5Elwuc6xnypcudx54nmyCYwG5j+w5PQ/dyM75KQkLYSLYmK6i/Fg4iQICmyuufm96UvhVZhxWF1228jQjLqywc8qCF/j/DccY/jjEiXj/DwJNPp/ndNi7LXlr9qkKuS5Fm8cZnYcOupkzmRsC29pLj4iOI9sL16gDCJgDA+EVMYVHRTp0vV3R4fa+kHU/9DUHrs3LctPQCvKTG6L/KyDjbG9+rtxBp4bu3ga2QaxzlcxjGkS5cvK1cZZibrRMfHBIXDdYwWzrwLD7c4ox28i+HgwAtPbF1EGromqe71ENYS27aiBmsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMU/krQ3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lMU/krQ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk92r0fp9z2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 03:02:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0637CA43FCB;
	Wed,  6 Nov 2024 16:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7CCC4CED3;
	Wed,  6 Nov 2024 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908960;
	bh=0qutDu9YbEj/rRQis2rl/rg++RhIXZjpIIS7syx2Ycs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lMU/krQ3d8TNadrJVau3eQBLcgfj2Q8/6s/lIRz8YgO7m64dWRsY/9dfplvaYvyHe
	 m2jRIMMk99Z07fEDy4jjEJZAbbw5Fva0c2ERyalNDNHzDwjci/09/oJ0MtDjOmQjWV
	 cc7dj8SuaTwRgTVARtD3UBzZO6x+YKTLV/epCddQI75Rxn/9oTa/bnlX9Pe/UMQ7X7
	 Hy+YQ9DypoJNDTJg0y9C7cxJb7sr0fi83wLs+99mzdi+rFCjnqg714CFURmWK3ZT44
	 ghZMhfmliM/dYvNDdoMnyUwb7sBe27yrc4r+5ZAK9C4LC5D90QM5LLYqFuxI5VlR1i
	 s7SvPShdgcAew==
Date: Wed, 6 Nov 2024 10:02:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	mahesh@linux.ibm.com, oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [RFC PATCH v1 2/2] PCI/AER: report fatal errors of RCiEP and EP
 if link recoverd
Message-ID: <20241106160238.GA1526691@bhelgaas>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106090339.24920-3-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 05:03:39PM +0800, Shuai Xue wrote:
> The AER driver has historically avoided reading the configuration space of an
> endpoint or RCiEP that reported a fatal error, considering the link to that
> device unreliable. Consequently, when a fatal error occurs, the AER and DPC
> drivers do not report specific error types, resulting in logs like:
> 
> [  245.281980] pcieport 0000:30:03.0: EDR: EDR event received
> [  245.287466] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
> [  245.295372] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
> [  245.300849] pcieport 0000:30:03.0: AER: broadcast error_detected message
> [  245.307540] nvme nvme0: frozen state error detected, reset controller
> [  245.722582] nvme 0000:34:00.0: ready 0ms after DPC
> [  245.727365] pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> But, if the link recovered after hot reset, we can safely access AER status of
> the error device. In such case, report fatal error which helps to figure out the
> error root case.

Explain why we can access these registers after reset.  I think it's
important that these registers are sticky ("RW1CS" per spec).

> After this patch, the logs like:
> 
> [  414.356755] pcieport 0000:30:03.0: EDR: EDR event received
> [  414.362240] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
> [  414.370148] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
> [  414.375642] pcieport 0000:30:03.0: AER: broadcast error_detected message
> [  414.382335] nvme nvme0: frozen state error detected, reset controller
> [  414.645413] pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
> [  414.788016] nvme 0000:34:00.0: ready 0ms after DPC
> [  414.796975] nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
> [  414.807312] nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
> [  414.815305] nvme 0000:34:00.0:    [ 4] DLP                    (First)
> [  414.821768] pcieport 0000:30:03.0: AER: broadcast slot_reset message

Capitalize subject lines to match history (use "git log --oneline
drivers/pci/pcie/aer.c" to see it).

Remove timestamps since they don't help understand the problem.

Indent the quoted material two spaces.

Wrap commit log to fit in 75 columns (except the quoted material;
don't insert line breaks there).

> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>  drivers/pci/pci.h      |  1 +
>  drivers/pci/pcie/aer.c | 50 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pcie/err.c |  6 +++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 0866f79aec54..143f960a813d 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -505,6 +505,7 @@ struct aer_err_info {
>  };
>  
>  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>  #endif	/* CONFIG_PCIEAER */
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 13b8586924ea..0c1e382ce117 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1252,6 +1252,56 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  	return 1;
>  }
>  
> +/**
> + * aer_get_device_fatal_error_info - read fatal error status from EP or RCiEP
> + * and store it to info
> + * @dev: pointer to the device expected to have a error record
> + * @info: pointer to structure to store the error record
> + *
> + * Return 1 on success, 0 on error.

Backwards from the usual return value convention.

> + * Note that @info is reused among all error devices. Clear fields properly.
> + */
> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	int type = pci_pcie_type(dev);
> +	int aer = dev->aer_cap;
> +	u32 aercc;
> +
> +	pci_info(dev, "type :%d\n", type);

I don't see this line in the sample output in the commit log.  Is this
debug that you intended to remove?

> +	/* Must reset in this function */
> +	info->status = 0;
> +	info->tlp_header_valid = 0;
> +	info->severity = AER_FATAL;
> +
> +	/* The device might not support AER */

Unnecessary comment.

> +	if (!aer)
> +		return 0;
> +
> +
> +	if (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END) {
> +		/* Link is healthy for IO reads now */
> +		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> +			&info->status);
> +		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
> +			&info->mask);
> +		if (!(info->status & ~info->mask))
> +			return 0;
> +
> +		/* Get First Error Pointer */
> +		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
> +		info->first_error = PCI_ERR_CAP_FEP(aercc);
> +
> +		if (info->status & AER_LOG_TLP_MASKS) {
> +			info->tlp_header_valid = 1;
> +			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
> +		}
> +	}
> +
> +	return 1;
> +}
> +
>  static inline void aer_process_err_devices(struct aer_err_info *e_info)
>  {
>  	int i;
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffc..a74ae6a55064 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	struct pci_dev *bridge;
>  	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>  	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	struct aer_err_info info;
>  
>  	/*
>  	 * If the error was detected by a Root Port, Downstream Port, RCEC,
> @@ -223,6 +224,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  			pci_warn(bridge, "subordinate device reset failed\n");
>  			goto failed;
>  		}
> +
> +		/* Link recovered, report fatal errors on RCiEP or EP */
> +		if (aer_get_device_fatal_error_info(dev, &info))
> +			aer_print_error(dev, &info);
>  	} else {
>  		pci_walk_bridge(bridge, report_normal_detected, &status);
>  	}
> @@ -259,6 +264,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	if (host->native_aer || pcie_ports_native) {
>  		pcie_clear_device_status(dev);
>  		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_clear_fatal_status(dev);
>  	}
>  
>  	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
> -- 
> 2.39.3
> 

