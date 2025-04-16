Return-Path: <linuxppc-dev+bounces-7703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A838A90971
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd6db5qDpz2xDD;
	Thu, 17 Apr 2025 02:57:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744822643;
	cv=none; b=jYmlnmxIuKs0lGask5AI/Q6GuPNwcbRBO6h5TOoIJVusWy5jWgDV3iUHiBUt+tiFVrsJypjre/uO8IWcDdeQGJf2L0tG/JLXW0pgtXO8KzqpGdzkxOaIWIVFuoDW5TwNLnFzeJNCrrhRVQVLl8aRaZ9+Y7YIIyS+zvI8x05kmRPmySUEuDgIVw2OSrXs8UklHC5++cdi0+dywwsv+ZEQ5knyezUfYbSgzG6ubmSvkIPXpKpMEdZkWUQLrJAUbqB7cfUkYXyvW5VAe8oGE3Qk6+t1PNQ8AEkFrhPi/OTaezeYXsSbRlAbaefrI7s/5LTcOSUK6L986sVO2rRJ2enhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744822643; c=relaxed/relaxed;
	bh=G7UYTeetlrg9ptxPQZheJS6AJuJ4FvA99j/kmp8Eqy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5xeWNz7Zlh81sDvtH4QZFC1/xH0y7CCVu3fWBbl5uwUwNKKDUDqxhCBrJWeXamOnYdhjYAN8VWXJLwC2EsT0BRZnBEX+d5NOnrIkH9NuDrAOB/jSNaiOTKdbuKe1AoaYRKwSY0pTByiUXOqjaKn7Xqwf6V5zVNYTG4/p0t4XTvdA6p4MjviBLJb2WgLysIqss1vuWkcrxvyuM+p9A8hp7o4PkfpmM2qUACZuIYkMOgD6SuWUsOdJtOq10F8blD6VCfQTTDxWbu1+hvLoeNmVMmNbsuZz2FlsMOEP2opWXTVFwkIj3djfPFEAXj6WXxtv4IcIl9mGLJTAEfDlWlIbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd6dZ6Fspz2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:57:22 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 2807E200A2AD;
	Wed, 16 Apr 2025 18:57:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 674D217601D; Wed, 16 Apr 2025 18:57:11 +0200 (CEST)
Date: Wed, 16 Apr 2025 18:57:11 +0200
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
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <Z__hZ2M8wDHn2XSn@wunner.de>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
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
In-Reply-To: <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 09:59:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -270,3 +270,30 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  
>  	return status;
>  }
> +
> +static pci_ers_result_t pcie_do_slot_reset(struct pci_dev *dev)
> +{
> +	int ret;
> +
> +	ret = pci_bus_error_reset(dev);
> +	if (ret) {
> +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	pci_info(dev, "Slot has been reset\n");
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +void pcie_do_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (pci_is_root_bus(bus))
> +			pcie_do_recovery(dev, pci_channel_io_frozen,
> +					 pcie_do_slot_reset);
> +	}
> +}

Since pcie_do_slot_reset(), pcie_do_recover_slots() and
pcie_do_recover_slots() are only needed on platforms with a
specific host controller (and not, say, on x86), it would be good
if they could be kept e.g. in a library in drivers/pci/controller/
to avoid unnecessarily enlarging the .text section for everyone else.

One option would be the existing pci-host-common.c, another a
completely new file.

> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -966,6 +966,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
>  int pci_aer_raw_clear_status(struct pci_dev *dev);
>  void pci_save_aer_state(struct pci_dev *dev);
>  void pci_restore_aer_state(struct pci_dev *dev);
> +void pcie_do_recover_slots(struct pci_host_bridge *host);
>  #else
>  static inline void pci_no_aer(void) { }
>  static inline void pci_aer_init(struct pci_dev *d) { }
> @@ -975,6 +976,26 @@ static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
>  static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
>  static inline void pci_save_aer_state(struct pci_dev *dev) { }
>  static inline void pci_restore_aer_state(struct pci_dev *dev) { }
> +static inline void pcie_do_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +	int ret;
> +
> +	if (!host->reset_slot)
> +		dev_warn(&host->dev, "Missing reset_slot() callback\n");
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (!pci_is_root_bus(bus))
> +			continue;
> +
> +		ret = pci_bus_error_reset(dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		else
> +			pci_info(dev, "Slot has been reset\n");
> +	}
> +}
>  #endif

Unusual to have such a large inline function in a header.
Can this likewise be moved to some library file and separated
from the other version via #ifdef please?

Thanks,

Lukas

