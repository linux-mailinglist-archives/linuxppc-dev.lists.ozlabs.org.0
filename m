Return-Path: <linuxppc-dev+bounces-2924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E39BF362
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 17:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk9sS1SScz3bdV;
	Thu,  7 Nov 2024 03:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730911180;
	cv=none; b=MWMraz8c7Zoocfyu4iDuXVjPgOyDP31E3TAB+XlYliucXtrPcNl+XCsBhTKoPah3FR6CFiE48BV7vK0CJm5a6MFjlFfm86ouWUHPaIFaoYx+2OmTInyvXlvFocUhYU2odMtjdO8V6l6d5KE8gy0ADn/AEKxQB5veA9iJ9zLvsKGeNV8Uht5nVL+So0KmoIVvL6fTq8v8CNeVGhI8+/Hx7O/yTYupqPqt8Vzb7mBzKzh5xsOg/cd3NKXRuyVdIjnlys/ZPmpF7KPcO41C7XeWVCNveqN3WY3jK9FI2gfmC99705qcCucl/7dcuGb800TvO/c4uU8dCzWbJMGp0bGNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730911180; c=relaxed/relaxed;
	bh=zL0LZ76Dnshsa6UJn+1fVSAXF61E1L0hb8wceq55udA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ4r3aqGu/msudyN07SUy2e9Jo84DcgeiATg/Mg6bPaaKday5eXslYdRCn+0tLSY5tUG0oQN+5ZQA9zRclbzYYANrj4ALmj4hu9fkLFt6HYMXA0/Wz+S+xT+NtVKzK92xHkY8FbpNMVtXLrLB4WIPVfy7N8cqkF+76cORwJYyhAO/3AT50zz5gAbuPf15HwM2Z+vgxNUYjdD79HMj91W1QyJawQg932bYRus7m/OdpQPxm4s3bSGlmiuB+tvhC5Rbxos+KE05ONaPYuSvbgPhH/WS5juAbaQCwZy1C+y7L3tprSWFAsubU/Lf8AKJevORBda+wtQJG0FIBH6j+2cZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhGoVNcM; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhGoVNcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk9sR1Xv3z3bdS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 03:39:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3EF3A44046;
	Wed,  6 Nov 2024 16:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABC1C4CEC6;
	Wed,  6 Nov 2024 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730911175;
	bh=qgyfwsgI0NGyv3rTn5MDG6QtmrGNHZk4smbSHtOhvkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhGoVNcMYeHEA4ME2kQFjw1bmyNAIEA2RYwH55JxP901y/PHC72sdYajCH6JQjjtO
	 zyApsTGwQYYdBNjLScNkKrFHAH8m6c6jDBOijF36PL/NewB3xFe21DIajIWk22hIVE
	 S+RjiJ0b9/FSGt8IkgN1KjVpPFdw3C2+o3wbfAXFrLMvY4MvAJ3lbcU1+ldUZQuppL
	 9CJHiGk3BUEZDi+kNQlMpZheWyKV+kj5LR07o644tWRMARQDHYdQqQu9cjsazEaFxv
	 njgVulySb9zQBHq+ZwkrRal5sl5/m6I6ybq54vN5dcWq/G4joas37wisZ6X3ykhmIB
	 xkwBtrZpi1vKQ==
Date: Wed, 6 Nov 2024 09:39:32 -0700
From: Keith Busch <kbusch@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	mahesh@linux.ibm.com, oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [RFC PATCH v1 2/2] PCI/AER: report fatal errors of RCiEP and EP
 if link recoverd
Message-ID: <ZyubxGBL7TvchZI_@kbusch-mbp>
References: <20241106090339.24920-1-xueshuai@linux.alibaba.com>
 <20241106090339.24920-3-xueshuai@linux.alibaba.com>
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
> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	int type = pci_pcie_type(dev);
> +	int aer = dev->aer_cap;
> +	u32 aercc;
> +
> +	pci_info(dev, "type :%d\n", type);
> +
> +	/* Must reset in this function */
> +	info->status = 0;
> +	info->tlp_header_valid = 0;
> +	info->severity = AER_FATAL;
> +
> +	/* The device might not support AER */
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

This matches the uncorrectable handling in aer_get_device_error_info, so
perhaps a helper to reduce duplication.

> +	}
> +
> +	return 1;
> +}

Returning '1' even if type is root or downstream port?

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

This will always print the error info even for root and downstream
ports, but you initialize "info" status and mask only if it's an EP or
RCiEP.

