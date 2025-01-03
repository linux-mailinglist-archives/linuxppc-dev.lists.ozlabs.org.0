Return-Path: <linuxppc-dev+bounces-4640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A80A00BFA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 17:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPpj25Xrrz30T2;
	Sat,  4 Jan 2025 03:20:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735921254;
	cv=none; b=YLP0edx7ASEuo2iGu+nBaJB9Thpw2wbjNmF+BNYQaLa9K4IfmdoR1ly3haFlLNH4NcUkoc0ejXwCwvFG7yR9VPIKPfSrB84sqcRtn357XzXZTm9PVRXghu2Soce7xZsqcNLZdVeEPWoyPpauJqAfisuyxxv/23Sq4W+j53om1bi6ZEwYglVU0KlQv+MLopc5oBeVmP2fGfEMdJOja/7Myi2EnQsYLCAaaRhNyAQ5Ra90Wt9WEoTxRKO1LlNKCcllV4CooKkWQ6pcEFfWlCdd//Hc/bRb3ytEwmIUJRLgrlrHDR0Fnh27f7m/vaUP/AS3jjxWWPQJuuA/tjm/y5n+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735921254; c=relaxed/relaxed;
	bh=B2WYsGMPQpFANCHXxl2mkfQyQ24a8EKaADn28F99e5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee6w2zX/WnAHRDFRY1IIRvMV+oZafbzZoAclJhd23RKlKjK5TR7vTIuTxsfZa3pJlqKItBgZT+sdUZg5xn/620GdxOH3wn10qZuJX4bp/PWe/hq8EFqk3wmrymu0eimyriAigaRNs1BcnIBwtAh+7GBlKS6ivAtUBAahrBCJljZYBJ9spc/nrhFdFDivAohNwXPxzZmBqWafl7hH5zDEhmq/IlTPG1hul7e5cJymr/ESoF0BKhYZxo29kSgRsMtNPWfEooTlLGwsSIaAc7W5Rzc8wlOyZY7NWvQdRmnnBvhOAaGD6NtQw0gRtTOlB9xCC/TEIb28+Y8MJsI0Ll5UPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=QKkMte/r; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=QKkMte/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPphz34tlz30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 03:20:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=B2WYsGMPQpFANCHXxl2mkfQyQ24a8EKaADn28F99e5I=; b=QKkMte/rHHfXcBmU0nceXRubrn
	iQeMg4csyJfv3OOg9qe1ys9p6TcH3O+Uf7s16qM+6WDAiPySZIRXwyfDVd+723zmFSHs2cCwFF1NX
	kycyeuUZRyJC6CiabE2wIamZg+SUnhNRrzGWcz+ye5LemvpCn9yPnrtYm+GrJjRGMyYU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkPb-0015Hv-95; Fri, 03 Jan 2025 17:20:35 +0100
Date: Fri, 3 Jan 2025 17:20:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH net-next 01/13] net: enetc: add initial netc-lib driver
 to support NTMP
Message-ID: <829ccd93-8b4e-4dd9-bd15-58d345797aca@lunn.ch>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-2-wei.fang@nxp.com>
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
In-Reply-To: <20250103060610.2233908-2-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> +#define NTMP_FILL_CRD(crd, tblv, qa, ua) \
> +({ \
> +	typeof(crd) _crd = (crd); \
> +	(_crd)->update_act = cpu_to_le16(ua); \
> +	(_crd)->tblv_qact = NTMP_TBLV_QACT(tblv, qa); \
> +})
> +
> +#define NTMP_FILL_CRD_EID(req, tblv, qa, ua, eid) \
> +({ \
> +	typeof(req) _req = (req); \
> +	NTMP_FILL_CRD(&(_req)->crd, tblv, qa, ua); \
> +	(_req)->entry_id = cpu_to_le32(eid); \
> +})


These are pretty complex for #defines. Can they be made into
functions? That will get you type checking, finding bugs where
parameters are swapped.

> +int netc_setup_cbdr(struct device *dev, int cbd_num,
> +		    struct netc_cbdr_regs *regs,
> +		    struct netc_cbdr *cbdr)
> +{
> +	int size;
> +
> +	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
> +
> +	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
> +					     GFP_KERNEL);
> +	if (!cbdr->addr_base)
> +		return -ENOMEM;
> +
> +	cbdr->dma_size = size;
> +	cbdr->bd_num = cbd_num;
> +	cbdr->regs = *regs;
> +
> +	/* The base address of the Control BD Ring must be 128 bytes aligned */
> +	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
> +	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
> +					  NTMP_BASE_ADDR_ALIGN);
> +
> +	cbdr->next_to_clean = 0;
> +	cbdr->next_to_use = 0;
> +	spin_lock_init(&cbdr->ring_lock);
> +
> +	/* Step 1: Configure the base address of the Control BD Ring */
> +	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
> +	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
> +
> +	/* Step 2: Configure the producer index register */
> +	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
> +
> +	/* Step 3: Configure the consumer index register */
> +	netc_write(cbdr->regs.cir, cbdr->next_to_use);
> +
> +	/* Step4: Configure the number of BDs of the Control BD Ring */
> +	netc_write(cbdr->regs.lenr, cbdr->bd_num);
> +
> +	/* Step 5: Enable the Control BD Ring */
> +	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(netc_setup_cbdr);

I assume there is a version 3 in development, which will need a
different library, or at least different symbols. Maybe you should
think about the naming issues now?

> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> new file mode 100644
> index 000000000000..7cf322a1c8e3
> --- /dev/null
> +++ b/include/linux/fsl/ntmp.h
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/* Copyright 2025 NXP */
> +#ifndef __NETC_NTMP_H
> +#define __NETC_NTMP_H

Does this header need to be global? What else will use it outside of
drivers/net/ethernet/freescale/enetc?

	Andrew

