Return-Path: <linuxppc-dev+bounces-7689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B587A906A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 16:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd3Y16n0Lz2ySk;
	Thu, 17 Apr 2025 00:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744814293;
	cv=none; b=kxmgPwN/JSCm0NJIABQNp/ozIn15MCMf7J8UeY+y4WBmus5VU/itwsCQM770anewhr9MvYbOy4/L3IbhnP6aWr8xkqCvh4KGZkJXoXM0s3NgB2RwPAAdtEa6sKbdzjme9+gdFTRWB5ojuYRD5l1HY9PPm/ne4IghoMuda6YZOvZ0eTKK5MTwRlsjAz6xpFuD0H4IafQI9LpYWVw+HNMdVfuM/Ub9vZW0R3wWb0a69Z2qwmaXwboy1ZME4pYkf+oSoYJssYbuJaJZ5Ffo9jRyQDfzaZZyvVGynzXmH/yKDck2TwIBeN5NEylDkt6H4oFw1yrLjJHvV4oyqOE1qu7KKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744814293; c=relaxed/relaxed;
	bh=LmAOiGA9pw5k3i+0g+vWrux8qZj3BhX8AvTB7BFnYAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV+3UjtuPbwQSotWYjIzeEf0NlCo2BwRw3Wex6Ymnrt6mBBUwQcf2qdDWqwWF6WFXiOT8ydlupHr3r1C94j29W6C6qjxLvywUJmu5F3JOpa+1v8TOao6HRYu/gOIjXdACwrth7ZKvjPh3S6LfgL1QWHaggaeMrU5u+qedQIMYVnA3ZvdYWbD4/lnOnl0safn8FvXUuPLeW3lGqEOss1qC0RXHd0dD4FuHEanOyvruDLd9v4YOxTLtO96+0RHXMHvCjLoIrEp+abS388fnKXcUS4MRXUo/bxbwxbIcZ7qstJn70eQ7aT9baBknEXiPUE7KBv8jEwXReE6yjdzuoqTuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd3Y02qqWz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 00:38:10 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id E372F2C06039;
	Wed, 16 Apr 2025 16:38:00 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D4BF0173A2F; Wed, 16 Apr 2025 16:38:01 +0200 (CEST)
Date: Wed, 16 Apr 2025 16:38:01 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
Message-ID: <Z__AyQeZmXiNwT7c@wunner.de>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
 <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
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
In-Reply-To: <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 15, 2025 at 07:03:17PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Apr 04, 2025 at 10:46:27AM +0200, Lukas Wunner wrote:
> > On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > When the PCI error handling requires resetting the slot, reset it
> > > using the host bridge specific 'reset_slot' callback if available
> > > before calling the 'slot_reset' callback of the PCI drivers.
> > > 
> > > The 'reset_slot' callback is responsible for resetting the given slot
> > > referenced by the 'pci_dev' pointer in a platform specific way and
> > > bring it back to the working state if possible. If any error occurs
> > > during the slot reset operation, relevant errno should be returned.
> > 
> > This feels like something that should be plumbed into
> > pcibios_reset_secondary_bus(), rather than pcie_do_recovery().
> 
> I did consider that, but didn't go for it since there was no platform
> reset code present in that function. But I will try to use it as I
> don't have a strong preference to do reset slot in pcie_do_recovery().

The only platform overriding pcibios_reset_secondary_bus() is powerpc,
and it only does that on PowerNV.

I think you could continue to stick with the approach of adding a
->reset_slot() callback to struct pci_host_bridge, but it would
be good if at the same time you could convert PowerNV to use the
newly introduced callback as well.  And then remove the way to
override the reset procedure via pcibios_reset_secondary_bus().

All pci_host_bridge's which do not define a ->reset_slot() could be
assigned a default callback which just calls pci_reset_secondary_bus().

Alternatively, pcibios_reset_secondary_bus() could be made to invoke the
pci_host_bridge's ->reset_slot() callback if it's not NULL, else
pci_reset_secondary_bus().  And in that case, the __weak attribute
could be removed as well as the powerpc-specific version of
pcibios_reset_secondary_bus().

I guess what I'm trying to say is, you don't *have* to plumb this
into pcibios_reset_secondary_bus().  In fact, having a host bridge
specific callback could be useful if the SoC contains several
host bridges which require different callbacks to perform a reset.

I just want to make sure that the code remains maintainable,
i.e. we don't have two separate ways to override how a bus reset
is performed.

Thanks,

Lukas

