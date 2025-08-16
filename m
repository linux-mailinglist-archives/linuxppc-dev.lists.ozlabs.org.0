Return-Path: <linuxppc-dev+bounces-11070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6297B2908B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Aug 2025 22:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c49T662Qjz2xQ4;
	Sun, 17 Aug 2025 06:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755375914;
	cv=none; b=BnjgYrLpJ9BKvg0+DD2SPSr0tWZdE5mukstTgnP9f/jRyltq1T7mwWR5JgssCCFcxI0HNQyDNoG6RyIPbj67tbLFS9H6+UUzyn2TpiSQGXA/VK0HVqIiOiAnYVD0ZenS0T7bL+80ZReilumclMXAqaAO6+HjJBTFGS5I+twDBt/yjGrMAfOl0dSlPy7mkamdnqhBHNakZXlU4pi1bueKqjUhumBwTp5/yDNc7IP9Xcb0BKmrQ7qBSua6RcI3jiCeHAWmwBqQHbXYxWprxvkxlJ8qiRYajtLtxaRmeCqbNPIJrAJq7FWe3y/bGikTyay/oVYLlM4KBeW3+bOH9UN+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755375914; c=relaxed/relaxed;
	bh=NaVlP/khPMFy5aVSydHApWYPJkGk9qheSPb79LlM0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHnb9wUQNin8nW6BHU7sFnnZTdmRGV3rvjb9CUp48Tlt2WQIDLYKnVF0uUwCQEqW0GeyxVHP+zm5mm8rb9RyrmUCrI5BDGSllbjx7hwak+u7V6LiprUGIXFq5h4IpU/wnt8p9jqLyCEkxH1OY11GgQpmHnORTe4All9EPTlEWjmPgm4LF1QLh/5Vl2Q6jergZpMKekydzXCPn+9oxlnnjXa9z19kPrjsfuXIlvuF6CWS8HcIomA3K37YGoTciJ0zFEuZPYYkPUeUzQRNEqc3K0b89t//dN4pY674VeYwIP5D8cMWTweBv3T9VSJdJ91dw0reQB1KJGnRTlstdGu+XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c49T55FCZz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 06:25:11 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 319F62008037;
	Sat, 16 Aug 2025 22:25:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1A2332ED3FD; Sat, 16 Aug 2025 22:25:05 +0200 (CEST)
Date: Sat, 16 Aug 2025 22:25:05 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Hans Zhang <18255117159@163.com>
Cc: mahesh@linux.ibm.com, bhelgaas@google.com, oohall@gmail.com,
	mani@kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] PCI/AER: Use pci_clear_and_set_config_dword() to
 simplify mask updates
Message-ID: <aKDpIeQgt7I9Ts8F@wunner.de>
References: <20250816161743.340684-1-18255117159@163.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816161743.340684-1-18255117159@163.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 17, 2025 at 12:17:43AM +0800, Hans Zhang wrote:
> Replace manual read-modify-write sequences in multiple functions with
> pci_clear_and_set_config_dword() helper to reduce code duplication.

None of the occurrences you're replacing is clearing *and* setting
bits at the same time.  They all either clear or set bits, but not both.

For the PCIe Capability, there are pcie_capability_clear_dword()
and pcie_capability_set_dword() helpers.

It would arguably be clearer and less confusing to introduce similar
pci_clear_config_dword() and pci_set_config_dword() helpers and use
those, instead of using pci_clear_and_set_config_dword() and setting
one argument to 0.

Thanks,

Lukas

> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d716..3d37e2b7e412 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -176,14 +176,13 @@ static int enable_ecrc_checking(struct pci_dev *dev)
>  static int disable_ecrc_checking(struct pci_dev *dev)
>  {
>  	int aer = dev->aer_cap;
> -	u32 reg32;
>  
>  	if (!aer)
>  		return -ENODEV;
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
> -	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
> -	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_CAP,
> +				       PCI_ERR_CAP_ECRC_GENE |
> +				       PCI_ERR_CAP_ECRC_CHKE, 0);
>  
>  	return 0;
>  }
> @@ -1102,15 +1101,12 @@ static bool find_source_device(struct pci_dev *parent,
>  static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
>  {
>  	int aer = dev->aer_cap;
> -	u32 mask;
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
> -	mask &= ~PCI_ERR_UNC_INTN;
> -	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
> +				       PCI_ERR_UNC_INTN, 0);
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
> -	mask &= ~PCI_ERR_COR_INTERNAL;
> -	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
> +				       PCI_ERR_COR_INTERNAL, 0);
>  }
>  
>  static bool is_cxl_mem_dev(struct pci_dev *dev)
> @@ -1556,23 +1552,19 @@ static irqreturn_t aer_irq(int irq, void *context)
>  static void aer_enable_irq(struct pci_dev *pdev)
>  {
>  	int aer = pdev->aer_cap;
> -	u32 reg32;
>  
>  	/* Enable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       0, ROOT_PORT_INTR_ON_MESG_MASK);
>  }
>  
>  static void aer_disable_irq(struct pci_dev *pdev)
>  {
>  	int aer = pdev->aer_cap;
> -	u32 reg32;
>  
>  	/* Disable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       ROOT_PORT_INTR_ON_MESG_MASK, 0);
>  }
>  
>  /**

