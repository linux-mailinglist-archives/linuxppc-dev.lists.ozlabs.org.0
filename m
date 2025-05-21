Return-Path: <linuxppc-dev+bounces-8851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26570ABFD76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 21:39:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2hZM3JcRz3bwR;
	Thu, 22 May 2025 05:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747856363;
	cv=none; b=Nm6eiz58q3gLLmDAb2/vcXUlpHBYyfsUilma7M1MOlmXPc8hWTR9zWQQy1bp+rSQa2/ProoLECWDMpHVWDjQCumaTRjQmPxoXRXc3X/WaNH+TcBz26LlNB1R/I/2n2V9JxNJiMZLgHSuYCbCCGujnI8TXRR1eRBMFJsbwZ+gy6JDFI9lAPX8K5IOXB5EQaklIsEv+7hCU1IwyJNymtJncCWbU1Q0sVGuLnIW8T8sbzAH1YY6gW5qTTjSRx61cr/M3L4cdf3ktDQsAZafwWjphWklr+1htKCZUfkgyJQQ6nx64s2erkc2EORvzNDQbizWXM6fOZTp4LXY9uBuhsqC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747856363; c=relaxed/relaxed;
	bh=u9aW5QaHhWOShT6W01tWPxgHETDgjN4pGqSEzyxjUpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aETEPDYDNj6FkYmtqHEdpNT62WgSDrov7RbFQmkH/QqTAv9Jr/SK83H/Q/CfJRFVrcc1PnJGPUFBRBg3eZ9ZcxB4SBbV0NGOPsjzKgvXOyzQIWJywgk69bHXn8UCxObgrDDftl17ysM9gTl2qjHuHIQXqRDI82M83Xhgp8o4cCbxEHJDAlEfpHR7Ow2Ztt+VxdPK1CW/n6g0l8SKd+fzDdP6hzkhn8ahx5a6twLD/NScOmrbva1FQMos4UBCG4oBCAP9UEy93MUlu22PksoXz16AWsPGfSAt12jFV3CkoXDtdfrel0RQoTH/XK7uOGe0+Gc4SLiWTXxJ6b7/3wVJgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbrZJDl8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbrZJDl8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2hZL2hplz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 05:39:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10CC8629E8;
	Wed, 21 May 2025 19:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2CAC4CEE4;
	Wed, 21 May 2025 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856359;
	bh=iZNF7m2weWyRiFFUPmLZk4GdZHibUNgz62DAAiUCwoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qbrZJDl8hYs4Lku2GffW+PA1dRJT33mZGXYDWUqy1XEAWnFGgIxCR/VU/edoGM7jR
	 Wn6XJ8BD/k0hmbud2LPowvgKJ2lvw6100SrAoeiJjNhzkGsuagFV6TQVJROSg6dywZ
	 Bu7NZx6YXBEgJv+dNsVHzrU4/dPS4aJZh+D1r4rR8PELMe7KC8oMEhWTxRKWOSA4in
	 CkCYTQ3nNkq9PPHXSg4ZI5jMLSGIlK9qDWW+el297eCRB9BIuo1ys1JtfIMfH4QYXk
	 poU1Fyxg49UqJGp0Bp1oTyQyciP8K/Z2xkhZU9Gk0NLL/mqyMaxGD1whvAhzM2S7f2
	 a6Y8bJjDD1MPA==
Date: Wed, 21 May 2025 14:39:18 -0500
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
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 04/17] PCI/AER: Consolidate Error Source ID logging in
 aer_isr_one_error_type()
Message-ID: <20250521193918.GA1437038@bhelgaas>
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
In-Reply-To: <20250521102041.00004901@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:20:41AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:21 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously we decoded the AER Error Source ID in aer_isr_one_error_type(),
> > then again in find_source_device() if we didn't find any devices with
> > errors logged in their AER Capabilities.
> > 
> > Consolidate this so we only decode and log the Error Source ID once in
> > aer_isr_one_error_type().  Add a "details" parameter so we can add a note
> > when we didn't find any downstream devices with errors logged in their AER
> > Capability.
> > 
> > This changes the dmesg logging when we found no devices with errors logged:
> > 
> >   - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
> >   - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
> >   + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Nice little improvement.  I'll assume you reuse
> details later as otherwise passing a bool and creating
> the (no details found) in aer_print_port_info() would
> have been simpler to my eyes as it would have put all the
> string generation in one place.

Great idea!  Since there's only one caller, I think passing a bool is
much nicer.

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > ---
> >  drivers/pci/pcie/aer.c | 22 +++++++++-------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 568229288ca3..488a6408c7a8 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> >  			info->severity, info->tlp_header_valid, &info->tlp);
> >  }
> >  
> > -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
> > +static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
> > +				const char *details)
> >  {
> >  	u8 bus = info->id >> 8;
> >  	u8 devfn = info->id & 0xff;
> >  
> > -	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
> > +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
> >  		 info->multi_error_valid ? "Multiple " : "",
> >  		 aer_error_severity_string[info->severity],
> >  		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> > -		 PCI_FUNC(devfn));
> > +		 PCI_FUNC(devfn), details);
> >  }
> >  
> >  #ifdef CONFIG_ACPI_APEI_PCIEAER
> > @@ -926,15 +927,8 @@ static bool find_source_device(struct pci_dev *parent,
> >  	else
> >  		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
> >  
> > -	if (!e_info->error_dev_num) {
> > -		u8 bus = e_info->id >> 8;
> > -		u8 devfn = e_info->id & 0xff;
> > -
> > -		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> > -			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> > -			 PCI_FUNC(devfn));
> > +	if (!e_info->error_dev_num)
> >  		return false;
> > -	}
> >  	return true;
> >  }
> >  
> > @@ -1281,9 +1275,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
> >  static void aer_isr_one_error_type(struct pci_dev *root,
> >  				   struct aer_err_info *info)
> >  {
> > -	aer_print_port_info(root, info);
> > +	bool found;
> >  
> > -	if (find_source_device(root, info))
> > +	found = find_source_device(root, info);
> > +	aer_print_port_info(root, info, found ? "" : " (no details found");
> > +	if (found)
> >  		aer_process_err_devices(info);
> >  }
> >  
> 

