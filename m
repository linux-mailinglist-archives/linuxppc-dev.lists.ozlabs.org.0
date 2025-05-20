Return-Path: <linuxppc-dev+bounces-8751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33EABDAB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1x5q0HXHz2xRs;
	Wed, 21 May 2025 00:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747749630;
	cv=none; b=ahb4B33Qw3I/qgXx2ETMzaMlrRTFu2JKEMF7F5RdAUiIModcCxhjTRkydspZwqROjyYWBQHr0oE2ei9qnEdE3Pcb5qv4bjTDXdYBIOA5nkWFGaa4zHueLkRrKsTVE78Bd4E75RvZXYdv0LE4IUg9mpFYAyeTCU+UecTr0Psz62isk+NPoRXgBbt20Gd8eKgp/4NbVL2EtX2iWrxQXWEp8pLzuMRW9flsCUPYUlGxpk0sKGK1uXgepD0SJYlj5hNKeSI0GOsGqFe1xNPKHOgVOANGMXchV94dlEnbneMz9rxml2xBT6VPFrRGAdQMavoSCLDlH7AYQacHhpXQYwJrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747749630; c=relaxed/relaxed;
	bh=C6RWIcDiI1e8UH3RvA1uDkp5kBlMzrnnNdqcFSLAzao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=csHfYsrmgu9lcX7F0oUjeea3hghsYkzHd07UovzjTXsToLn46G52jvRKgw8N1h+T88tNPBcuoBZoxqOljmJi32+CuQWxj1VC42rQcd1NgJlgqeyJggGZIomzympwmf+wvFM9K7jamqqqDKIvktZKCWnodlMu8J35qPdTL25NqgZ+WkT51a6y/fwwv8UEYEn7aDWKIDwuk8OCA2B7V49mZ6ndoXIWMriGsl8JCoQfXlDzm9PtaJe5qQbjN4XHzCHgnhFfjFW5hhtJqFiCumu6xGRdowWqrA5IvC4IgiJ7VyCQeEEAyrw3zcL5FLOYzbidTdJe6q/a/scP31JHoPcwcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffPB7CiV; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffPB7CiV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1x5p1XDGz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:00:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4B0762A01;
	Tue, 20 May 2025 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3487EC4CEE9;
	Tue, 20 May 2025 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749627;
	bh=CPYEn7+xChTDmwQcUBPa5EjvOPTYgNzqRqlEyGR3lDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ffPB7CiVwC4HtUFlXvhAIB/covrTJ6Us+dGTk69bT5m/HmOCpD8EgqkI0PkQ/ZLcv
	 NvepHGKYlC73SlNb941W2kXBNMa5M+xwm5xYZstiELC2NpJiP1CVRXtNCnJ/x4+LKj
	 KOl8ClYfjbmqCrB/mBnGMMFMCqGOMyc+Dp4348Us2duDz/vItGlTIqpg8OzKh1jERg
	 IcdBWsu/0OMZCdj3j7jPar/onFomqjy7eMFPvRsArwzLSlaC77I3XtBKFYaEOV7IBz
	 6VD7Zskq5FutS/JgPbVmdYdYnaePKFEOCqlbKxwZEsHhWuY5gPn4DRKxmtNEE4Np+c
	 ylk6UrsLTBMBQ==
Date: Tue, 20 May 2025 09:00:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
Message-ID: <20250520140025.GA1291490@bhelgaas>
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
In-Reply-To: <e37c5f7f-3460-4f58-892f-39faf88a8e9c@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 04:15:56PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > DPC Error Source ID is only valid when the DPC Trigger Reason indicates
> > that DPC was triggered due to reception of an ERR_NONFATAL or ERR_FATAL
> > Message (PCIe r6.0, sec 7.9.14.5).
> > 
> > When DPC was triggered by ERR_NONFATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE)
> > or ERR_FATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) from a downstream device,
> > log the Error Source ID (decoded into domain/bus/device/function).  Don't
> > print the source otherwise, since it's not valid.
> > 
> > For DPC trigger due to reception of ERR_NONFATAL or ERR_FATAL, the dmesg
> > logging changes:
> > 
> >    - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
> >    - pci 0000:00:01.0: DPC: ERR_FATAL detected
> >    + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0
> > 
> > and when DPC triggered for other reasons, where DPC Error Source ID is
> > undefined, e.g., unmasked uncorrectable error:
> > 
> >    - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
> >    - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
> >    + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected
> > 
> > Previously the "containment event" message was at KERN_INFO and the
> > "%s detected" message was at KERN_WARNING.  Now the single message is at
> > KERN_WARNING.
> 
> Since we are handling Uncorrectable errors, why not use pci_err?

Sounds reasonable to me.  I would do it in a separate patch because
the point of this one is to avoid logging junk when Error Source ID is
not valid.

> > +		pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
> > +			 status,
> 
> I see the BDF extraction and format code in many places in the PCI
> drivers. May be a common macro will make it more readable.

Good idea.  Not sure how to implement it, so I put that on my TODO
list for now.

> > +			 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> > +				"ERR_FATAL" : "ERR_NONFATAL",
> > +			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
> > +			 PCI_SLOT(source), PCI_FUNC(source));

