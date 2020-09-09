Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8B262712
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 08:18:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmWzZ0zGyzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:18:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SGzpo+o/; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmWxg1rhQzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 16:16:38 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id kk9so822945pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jdEh03mDnxN4uuIRk2hnp1WD8X+alEW3cZaT1jPtUsY=;
 b=SGzpo+o/B3csNPG4aTVgZWRnwTlY1w3mP9k0FG44Bmel0+U7jnL6Y9qKymrH36l3lg
 n7fc5lkfAhQnC4kwPp8g/rltUM4w1Sa/H61qzL+c3E2VLAq5o0tGJtYP5BYUZxfNj6SC
 tS5Pxp1FtfE8TEWKvK7kJWRwKcae+Q5J4tZkYJ8npoQMxTDgopGjWscqDL0Gyie8vFeq
 hahO8Bw92VaY7uYDCJ59ZNsy4e1Y6AKFjKtK0i7vuTZPFvBTjowEXG7H6hvZYl4Vf22r
 Oq5BaZkGk8I2tgvIbXdq0LIkFHKKIIqO5Z0E5WtFinFU4+lAdC865AxZUBOBZCYpQy2E
 9p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jdEh03mDnxN4uuIRk2hnp1WD8X+alEW3cZaT1jPtUsY=;
 b=OAn+GE7euadhTL8UJK9MgrTqTWxmy8n6EvrLA4TtB9fLw75YoslIXQC8AdZT5qTVI0
 TYr7GX5jH3wGBRSu5DkQ6kZ+4wSuo1jXT5cqNeQ5xYHJjCi8UEawTMnKd5O/nEyEse3V
 J3Yx1zwyAvXdi7DRS/vk8PaY/EOnOQKOZiaiUsP8dGwt9RDAZtiIkPvIynjPfTo2yeH2
 QAtKwlyFZ7wdgPI1HrrFUtMO2I83nyXa8omFUHdYLQproVL5InjloN1WayZ5jIPt8RNc
 pO2dfUrXm+wBFODkfZ8FmyP+RL5NzgDyNRuzDC32i9tzIPXF/UPmTsjSA0s3FY4ZpLxq
 dqQg==
X-Gm-Message-State: AOAM532UeEQTeIYAscRxMAgRjWAIl1rHUS83VhlLRgeYsNqU+lfOhFPP
 JY+uwWgtRkipHz1beGj8KETD3g==
X-Google-Smtp-Source: ABdhPJw8T2O6S83zIaCvytH+31RtTntjfnNxB/iyyLpnf/6fMZVHkNXcApoEOvEk5tsjnkvEIXSmfQ==
X-Received: by 2002:a17:90b:88d:: with SMTP id
 bj13mr2235880pjb.80.1599632195217; 
 Tue, 08 Sep 2020 23:16:35 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id 187sm1296619pfx.174.2020.09.08.23.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 23:16:34 -0700 (PDT)
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200807101854.844619-1-clg@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <2daae994-68e2-59df-1d61-13db40aaeacf@ozlabs.ru>
Date: Wed, 9 Sep 2020 16:16:30 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200807101854.844619-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/08/2020 20:18, Cédric Le Goater wrote:
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
> guest OS to clear all page table entries related to the adapter. If
> some are still present, the RTAS call which isolates the PCI slot
> returns error 9001 "valid outstanding translations" and the removal of
> the IO adapter fails. This is because when the PHBs are scanned, Linux
> maps automatically the INTx interrupts in the Linux interrupt number
> space but these are never removed.
> 
> To solve this problem, we introduce a PPC platform specific
> pcibios_remove_bus() routine which clears all interrupt mappings when
> the bus is removed. This also clears the associated page table entries
> of the ESB pages when using XIVE.
> 
> For this purpose, we record the logical interrupt numbers of the
> mapped interrupt under the PHB structure and let pcibios_remove_bus()
> do the clean up.
> 
> Since some PCI adapters, like GPUs, use the "interrupt-map" property
> to describe interrupt mappings other than the legacy INTx interrupts,
> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
> number of interrupt mappings is computed from the "interrupt-map"
> property and the mapping array is allocated accordingly.
> 
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

I thought we could reuse some of the common OF code for the DT parsing
but we cannot (easily) so it is good as it is:

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
> 
>  Changes since v2:
> 
>  - merged 2 patches.
>  
>  arch/powerpc/include/asm/pci-bridge.h |   6 ++
>  arch/powerpc/kernel/pci-common.c      | 114 ++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index b92e81b256e5..ca75cf264ddf 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -48,6 +48,9 @@ struct pci_controller_ops {
>  
>  /*
>   * Structure of a PCI controller (host bridge)
> + *
> + * @irq_count: number of interrupt mappings
> + * @irq_map: interrupt mappings
>   */
>  struct pci_controller {
>  	struct pci_bus *bus;
> @@ -127,6 +130,9 @@ struct pci_controller {
>  
>  	void *private_data;
>  	struct npu *npu;
> +
> +	unsigned int irq_count;
> +	unsigned int *irq_map;
>  };
>  
>  /* These are used for config access before all the PCI probing
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..deb831f0ae13 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -353,6 +353,115 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>  	return NULL;
>  }
>  
> +/*
> + * Assumption is made on the interrupt parent. All interrupt-map
> + * entries are considered to have the same parent.
> + */
> +static int pcibios_irq_map_count(struct pci_controller *phb)
> +{
> +	const __be32 *imap;
> +	int imaplen;
> +	struct device_node *parent;
> +	u32 intsize, addrsize, parintsize, paraddrsize;
> +
> +	if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
> +		return 0;
> +	if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
> +		return 0;
> +
> +	imap = of_get_property(phb->dn, "interrupt-map", &imaplen);
> +	if (!imap) {
> +		pr_debug("%pOF : no interrupt-map\n", phb->dn);
> +		return 0;
> +	}
> +	imaplen /= sizeof(u32);
> +	pr_debug("%pOF : imaplen=%d\n", phb->dn, imaplen);
> +
> +	if (imaplen < (addrsize + intsize + 1))
> +		return 0;
> +
> +	imap += intsize + addrsize;
> +	parent = of_find_node_by_phandle(be32_to_cpup(imap));
> +	if (!parent) {
> +		pr_debug("%pOF : no imap parent found !\n", phb->dn);
> +		return 0;
> +	}
> +
> +	if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
> +		pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
> +		return 0;
> +	}
> +
> +	if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
> +		paraddrsize = 0;
> +
> +	return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
> +}
> +
> +static void pcibios_irq_map_init(struct pci_controller *phb)
> +{
> +	phb->irq_count = pcibios_irq_map_count(phb);
> +	if (phb->irq_count < PCI_NUM_INTX)
> +		phb->irq_count = PCI_NUM_INTX;
> +
> +	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
> +
> +	phb->irq_map = kcalloc(phb->irq_count, sizeof(unsigned int),
> +			       GFP_KERNEL);
> +}
> +
> +static void pci_irq_map_register(struct pci_dev *pdev, unsigned int virq)
> +{
> +	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
> +	int i;
> +
> +	if (!phb->irq_map)
> +		return;
> +
> +	for (i = 0; i < phb->irq_count; i++) {
> +		/*
> +		 * Look for an empty or an equivalent slot, as INTx
> +		 * interrupts can be shared between adapters.
> +		 */
> +		if (phb->irq_map[i] == virq || !phb->irq_map[i]) {
> +			phb->irq_map[i] = virq;
> +			break;
> +		}
> +	}
> +
> +	if (i == phb->irq_count)
> +		pr_err("PCI:%s all platform interrupts mapped\n",
> +		       pci_name(pdev));
> +}
> +
> +/*
> + * Clearing the mapped interrupts will also clear the underlying
> + * mappings of the ESB pages of the interrupts when under XIVE. It is
> + * a requirement of PowerVM to clear all memory mappings before
> + * removing a PHB.
> + */
> +static void pci_irq_map_dispose(struct pci_bus *bus)
> +{
> +	struct pci_controller *phb = pci_bus_to_host(bus);
> +	int i;
> +
> +	if (!phb->irq_map)
> +		return;
> +
> +	pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
> +		 pci_domain_nr(bus), bus->number);
> +	for (i = 0; i < phb->irq_count; i++)
> +		irq_dispose_mapping(phb->irq_map[i]);
> +
> +	kfree(phb->irq_map);
> +}
> +
> +void pcibios_remove_bus(struct pci_bus *bus)
> +{
> +	pci_irq_map_dispose(bus);
> +}
> +EXPORT_SYMBOL_GPL(pcibios_remove_bus);
> +
>  /*
>   * Reads the interrupt pin to determine if interrupt is use by card.
>   * If the interrupt is used, then gets the interrupt line from the
> @@ -401,6 +510,8 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>  
>  	pci_dev->irq = virq;
>  
> +	/* Record all interrut mappings for later removal of a PHB */
> +	pci_irq_map_register(pci_dev, virq);
>  	return 0;
>  }
>  
> @@ -1554,6 +1665,9 @@ void pcibios_scan_phb(struct pci_controller *hose)
>  
>  	pr_debug("PCI: Scanning PHB %pOF\n", node);
>  
> +	/* Allocate interrupt mappings array */
> +	pcibios_irq_map_init(hose);
> +
>  	/* Get some IO space for the new PHB */
>  	pcibios_setup_phb_io_space(hose);
>  
> 

-- 
Alexey
