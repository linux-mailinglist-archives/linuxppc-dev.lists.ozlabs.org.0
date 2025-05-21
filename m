Return-Path: <linuxppc-dev+bounces-8850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A228ABFD48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 21:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2hDY4VPxz3btJ;
	Thu, 22 May 2025 05:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747855437;
	cv=none; b=Un7XcAzH+tkfSSBist//XIfOgA0K6YqxtwQp0ZxgnTsZeazDfRMWSqON5im+bkYFT1ACs5VPAdCuAEko1ebF4RumuMRMMnjCgpNNyorPmHpGftQXJmlIG88YoxzfLlmSrVj7v1p42OdSEI8/ovg4BTXloXps5+FAPDq5aY+ajDqwuo7dy/SntOxfXZDIzd5X7OrNE30hmIQ8OM1y4CulxkE+BoDlzsFCZcF+5bw+Cz5d7BWH+B5DKpQiJKCCQLcZBn6COQad7f+iCeUyVX6ZN41JtXQN/lL0UtBNjKIV/iExAorRSfcd1cRKJvL0pMBmUp/455QxlJF35nmN0d9HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747855437; c=relaxed/relaxed;
	bh=nvMhPCNArjuYh9XsSY/VRs8qHQyJwWhmmiS4kqOWn9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HK/aIesK+8+spUzz1B/aOhxAMCU5jewEbOMrYSp3oTET/wKx6tHfqOh1Ll2fsDOEcS25UOy2y76YhvFbkoCL7SKHZB67lbTuAo2zqTaLf6b+74tB6Nz6ugR89YC/peAUvqMDxaQk+agl30EV1B+lWvWcPpjp7SAo2EMzNZqe+GEYfUdJnGz34jrHUFWLxwGXrN6kVH5bgls5A+2Z5DGMhZpIGErgaypPylhi2lSavnvDUH1eSGolaZ6BWl+AYlGg2ufQg/DkE89RmuiEDsYkj0hSuAensIoxadWfip1wn3pxAlHibwnMGqcXLzyl1wWO15vgBAJJJFZWrgK9On+GqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ix0Hjd6V; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ix0Hjd6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2hDX5V6Nz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 05:23:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8FC2629F1;
	Wed, 21 May 2025 19:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29530C4CEE4;
	Wed, 21 May 2025 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747855434;
	bh=x7SU6M9EiUqm3oCZdiOBIeMXoijnsJiejNFd+jPSSMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ix0Hjd6V1tx7KT5m6va1h0PDbofHGDHqXg8V7tyNqlwUs2SN7+1SUzlq6WqxYUK3n
	 Y0tNStRGPFzn3dbbIvkfZmgdo5Z/7NRBsMJdIZ/wYzDnjbYWG8hwysgv1lxLMgk+sK
	 9EQxQy1UMIy9XBxaKH5/0Hf7GAFkxpUO3uvXiAd7AcpuY10uxrfkHafU7YUaZTN137
	 5Z8caXYvQebeBl/TVEU5w0gRMrBIqDeFamINoGn4dvFv+ZUUj0A+Lq3BIjoPC1VOwA
	 fgG5xBra7M6bxg1bZ3l5deHZpQCYIFhjHBQe02WK++ej1oZ2WqvKuG7we9YLRBctWv
	 KTCJJzLwrJ5JA==
Date: Wed, 21 May 2025 14:23:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 02/17] PCI/DPC: Log Error Source ID only when valid
Message-ID: <20250521192352.GA1430719@bhelgaas>
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
In-Reply-To: <20250521100035.0000544e@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:00:35AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:19 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
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
> >   - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
> >   - pci 0000:00:01.0: DPC: ERR_FATAL detected
> >   + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0
> > 
> > and when DPC triggered for other reasons, where DPC Error Source ID is
> > undefined, e.g., unmasked uncorrectable error:
> > 
> >   - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
> >   - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
> >   + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected
> > 
> > Previously the "containment event" message was at KERN_INFO and the
> > "%s detected" message was at KERN_WARNING.  Now the single message is at
> > KERN_WARNING.
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Matches the spec conditions as far as I can tell.
> 
> I guess interesting debate on whether providing extra garbage info is
> a bug or not. Maybe a fixes tag for this one as well?

I added:

  Fixes: 26e515713342 ("PCI: Add Downstream Port Containment driver")

since it looks like we've printed the source unconditionally since the
addition of DPC:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/pcie-dpc.c?id=26e515713342#n69

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> I briefly wondered if it makes sense to have a prefix string initialized
> outside the switch with "containment event, status:%#06x:"
> made sense but it's probably not worth the effort and maybe makes it
> harder to grep for the error messages.  So in the end
> I think your code here is the best option.
> 
> Jonathan

