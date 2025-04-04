Return-Path: <linuxppc-dev+bounces-7449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC41A7B94F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 10:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTXR747s5z2ygW;
	Fri,  4 Apr 2025 19:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743756723;
	cv=none; b=ETAPloIH7BUfJtJj92VhXfIfHh5QI8yZNqFNB9t6CfppEcOZynLyY6j5eO6FPx6v27lreGwi5kLOxGbkHAIbZFHicfaLPr+DE9tflxpfrNYCU+ZteQC+/bxRvGEozXV0jOn/msvlDFsi/E2/EJ5higrhCw6KSSiEw1hyCLM3BBh1IexrNRanERpUNVWsUkM9R+lpgNIr8i96BAEx89WljfAM/vy1DtKjO+3WGOqJqRERgQBtr9+KnCD/M2z+FMr1r+1jbFuJbM7H5g0TNBaldwCjTQ6sAAiEjUaM4cBROB+3zM+acer5uzsAXZ+R/nZEpIxF0sJKWcOGFZhluy1rFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743756723; c=relaxed/relaxed;
	bh=RvGsjgUC8SuMJhCkYB5xcASRdRZx4IOBdoR2BE9Z+Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXO5iAZBzWwmglg9dxgDOFBA2sj2R4009LYCF0Ks7a5q4TV8+etj0lSlFpcUhIb22J84MUSDOEwzFSwMKgH0N4RG0fvTD+Y28qn9ndqDkHD6QWFTeTScZdszciprMyWsOtY/U/jZgonouBKAS7x/Zi0vwLc9A8TkyAK8+O4tW4Luenrica/wqOidJ+VTferAMB/99QbXpTkTGfSP5y1zMu1JMrx9vu145PnE2o70o1+B6r+a0ksCN1hhY2C8jiywzX9jvH1SpE6P81FBgTB4P5FmhA99D55a7ojzoTC+SOIBDaRK1l9e9yJPcX1VzqoVNxeP9Koe691ceIFOFMIDFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 326 seconds by postgrey-1.37 at boromir; Fri, 04 Apr 2025 19:52:02 AEDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTXR665tdz2yfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 19:52:02 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id E74F3200A2A0;
	Fri,  4 Apr 2025 10:46:15 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 282651212B; Fri,  4 Apr 2025 10:46:27 +0200 (CEST)
Date: Fri, 4 Apr 2025 10:46:27 +0200
From: Lukas Wunner <lukas@wunner.de>
To: manivannan.sadhasivam@linaro.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kw@linux.com>, Rob Herring <robh@kernel.org>,
	dingwei@marvell.com, cassel@kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <Z--cY5Uf6JyTYL9y@wunner.de>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
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
In-Reply-To: <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> When the PCI error handling requires resetting the slot, reset it using the
> host bridge specific 'reset_slot' callback if available before calling the
> 'slot_reset' callback of the PCI drivers.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
[...]
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	}
>  
>  	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
> +		if (host->reset_slot) {
> +			ret = host->reset_slot(host, bridge);
> +			if (ret) {
> +				pci_err(bridge, "failed to reset slot: %d\n",
> +					ret);
> +				status = PCI_ERS_RESULT_DISCONNECT;
> +				goto failed;
> +			}
> +		}
> +

This feels like something that should be plumbed into
pcibios_reset_secondary_bus(), rather than pcie_do_recovery().

Note that in the DPC case, pcie_do_recovery() doesn't issue a reset
itself.  The reset has already happened, it was automatically done
by the hardware and all the kernel needs to do is bring up the link
again.  Do you really need any special handling for that in the
host controller driver?

Only in the AER case do you want to issue a reset on the secondary bus
and if there's any platform-specific support needed for that, it needs
to go into pcibios_reset_secondary_bus().

Thanks,

Lukas

