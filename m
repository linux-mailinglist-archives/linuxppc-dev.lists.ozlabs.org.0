Return-Path: <linuxppc-dev+bounces-8752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A4ABDB11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1xCl69YYz3bTj;
	Wed, 21 May 2025 00:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747749939;
	cv=none; b=O23QGG0PHT8KlODT1uQEh3seMw3HunLJ6zXDvcYilMFkCVNik2p2MSbs9JiYV5d+9id66TtrRk/coWVA2GAXSNwEffbz10R9ggE4xP5BdPIUFmLI+i0F7yxBn+jAp2EWI08o2bj2pSpl0dsI0DuvkjodMlkGizzGaZYL3dy/5KTVXqKWB4pLZZ9pbDxFInv1WTkj2s2OFXhmO7bE40NVP9ij17hlHLqqqS6N5L11skRrejTPDK/zL5Lo2JZgZoC86JAr1YdAIXuzJ4WdCZyJqXXJQdl40+eNJ3iKWQxxZw9xPS2vLaVdJtvtTgveAfOXERLkOv9AeDs4QVppsqHjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747749939; c=relaxed/relaxed;
	bh=l92VX77NAexl5Bwi7+Mg24lw/fA6V5ohHywzJ3UIIKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dXkgI3zCW2LPQNRvP3MCjZdp1yKCQOIvgYJ9Y5SziFggYsv19soxL9sNznKfnIbcWzZ8QzsgLgO1b9iGv7QR0G8XLulCwcCKA0BEE+ZcXnEXAiJSgJtcdR39akjXbLahTNaXGp6OvldGN2RESSBerc9Fk+dp/RkyaZJhD5Sbta9hwLi0B6kGZuifDZ9nTfLJuP59jeq0NVmjhN2hmdm0J7WJznsOd2S65b2PAcQWNCvaDvc9nOvYm2QgnI/TQ5lnd2WvAPCh053d4OVRFk8ksset9ziTl7yMmLmscQuCleto22x/cUt7qzGkM0VnK9JDA/mU4I5KNjy6/qaCayPIFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxPz/9Kl; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxPz/9Kl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1xCk6pLBz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:05:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0796F62A1B;
	Tue, 20 May 2025 14:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFDCC4CEEB;
	Tue, 20 May 2025 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749936;
	bh=Aw0u5qiCrfy3PtV1eC5TuUu69ReE3gjbZ+S8PG4ER8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lxPz/9KlwyaHpGSsfVSURFLpXxfxw+Wg3IaN5utk3Eq0AVYoy3LtaneRXZ0JNEAC/
	 1E7refYyMYzV+n0YiKmb64U2ozIsV+TT3LjGVDcComg4d7wJDHL3SfxvGalQNK5voZ
	 taT1mG7iqbBgrcXQZOYDYomma+RuLqbYtOmUayWHf5vGfVN1IW/eh8W5w9inEtLUNd
	 YHTF9z+FNVDCtaF9Z7KPV4z9BWXmAeaoL1iDmcxFdgtYIM8h2tFLZl7w5O755mvlOC
	 fX09j3zRmI9ibRN+Od5lIABbKztTq0ECUMNecZByaBMs57l/pMAZPbvVrMbCzg/uIU
	 0KFGwVebeygmg==
Date: Tue, 20 May 2025 09:05:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
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
	Dave Jiang <dave.jiang@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
Message-ID: <20250520140535.GA1291979@bhelgaas>
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
In-Reply-To: <b6ba76ff-7cbd-2d73-fdc4-41aa8c788bc9@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 01:28:02PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
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
> > ---
> >  drivers/pci/pcie/dpc.c | 45 ++++++++++++++++++++++++++----------------
> >  1 file changed, 28 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index fe7719238456..315bf2bfd570 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -261,25 +261,36 @@ void dpc_process_error(struct pci_dev *pdev)
> >  	struct aer_err_info info = { 0 };
> >  
> >  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> > -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> > -
> > -	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> > -		 status, source);
> >  
> >  	reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN;
> > -	ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> > -	pci_warn(pdev, "%s detected\n",
> > -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR) ?
> > -		 "unmasked uncorrectable error" :
> > -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE) ?
> > -		 "ERR_NONFATAL" :
> > -		 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> > -		 "ERR_FATAL" :
> > -		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> > -		 "RP PIO error" :
> > -		 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
> > -		 "software trigger" :
> > -		 "reserved error");
> > +
> > +	switch (reason) {
> > +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR:
> > +		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
> > +			 status);
> > +		break;
> > +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
> > +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
> > +		pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID,
> > +				     &source);
> > +		pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
> > +			 status,
> > +			 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> > +				"ERR_FATAL" : "ERR_NONFATAL",
> > +			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
> > +			 PCI_SLOT(source), PCI_FUNC(source));
> > +		return;
> > +	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
> > +		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> > +		pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
> > +			 status,
> > +			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO) ?
> > +			 "RP PIO error" :
> > +			 (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_SW_TRIGGER) ?
> > +			 "software trigger" :
> > +			 "reserved error");
> > +		break;
> > +	}
> >  
> >  	/* show RP PIO error detail information */
> >  	if (pdev->dpc_rp_extensions &&
> 
> After adding that switch (reason) there, wouldn't it make sense to move 
> also the code from the if blocks into the case blocks? That if 
> conditions check for reason anyway so those if branches would naturally 
> belong under one of the cases each.

Great idea, thanks!

