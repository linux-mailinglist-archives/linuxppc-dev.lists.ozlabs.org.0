Return-Path: <linuxppc-dev+bounces-8754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD6ABDC29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1xYp07p7z3bgh;
	Wed, 21 May 2025 00:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747750877;
	cv=none; b=IM6n1pJCUG01hwghjtCIv7H2ovDjz/wf+ig4CBrfc1mzOAcYewba2UiGR5cxM9lY/EYiKBDtKNUueji4873JcHW+fQ26NwbrhohVEXdr//A1DiQInPwvTDaBV/ZOuXoJLiZFBSy19HGmgKwcomHjGryBkfUU2w2WkUbmIoBxTd4b3qY/s4TwPix3sE7byd987rYv78dEXhQvqtxqV/OWjY9TolXUBLNEbnFGC5L2lR+3eLKqnSjyDhpscqmYiqWyBdK+FH8OTCLlQfwMXzJT/s6wqdvKg2BqEs51I+xIKdw1kttCCJNS4lW/mSMCbOuGetl3yMhmvD3dlU2CGAb5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747750877; c=relaxed/relaxed;
	bh=zeR/RZtzPpdMJc6W6jMUVKUl5bK0g46qrWnGQBDtCQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ig2/hkZVZPi29EM+qyzfwlZ8R0mvkY1HDDXZo2PQScIFMJxPAjyctrF7mqOYp7rjXedrmbEJH6qoAHAnx1s8KWJ8u1CSN3YyTNq+P9emHbjir/8JlCbIA3TUeQi1OmzyB2VT9j7YWQg21NgYKyqlt79glZvsO9MdVhUoPFvUdmxhbcujruwTTtDCZR048VRZDieJujn9x3URPyDR2lrb2jYPwS2phW2IMjmUk4Uf+5313KaO0UsJVoY8pSilpS/zqga/RaKzESOmU4MQ2s38eRB+8Pk1sxPx3jGZjGyIlBVamnqIh/mBBSXNrtAi9jcFplTC6iTOWMTXmEdix5dWNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rU5ssl0o; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rU5ssl0o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1xYn1JWWz3bfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:21:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED66262A29;
	Tue, 20 May 2025 14:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80716C4CEEB;
	Tue, 20 May 2025 14:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747750874;
	bh=KubO1CN0cU7o39gPvS/zjAe4RGBlujJ7735E92PJluk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rU5ssl0o/icooknJ+V0VLF0QrTzQlME5sLQCs6lH/lEu1SNKh9yHPTLxxrIYDnvqG
	 P2ybIatUaHLJ1DIl+pLWpXdeaokUAbBUYS4TM64YZ11s6MnCjOmmTB7mAaVW4H2lDu
	 2+5Nm5bMQkwAgZIlYvcJCrzAF8c97spGVd994c4JAKDBlc3HyGuHexQBN9RYva7R39
	 J13iEjIcZJDkgg1yKOC0lQyr6uTUa+TSRNCkJtJWCsyO+TGoLOQ2sSVSpfPQ7iKvk2
	 bktQXT267hlYsa5UgXfPj/e63H/tO8jwtrMbiWV9No2IK12fUZ/+jnFHEb+nCgv+i9
	 ouNjOFWBVT2NA==
Date: Tue, 20 May 2025 09:21:13 -0500
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
Subject: Re: [PATCH v6 03/16] PCI/AER: Consolidate Error Source ID logging in
 aer_print_port_info()
Message-ID: <20250520142113.GA1292100@bhelgaas>
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
In-Reply-To: <9ac2bb02-974f-4952-b069-1bcc94682d89@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 04:39:19PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously we decoded the AER Error Source ID in two places.  Consolidate
> > them so both places use aer_print_port_info().  Add a "details" parameter
> > so we can add a note when we didn't find any downstream devices with errors
> > logged in their AER Capability.
> > 
> > When we didn't read any error details from the source device, we logged two
> > messages: one in aer_isr_one_error() and another in find_source_device().
> > Since they both contain the same information, only log the first one when
> > when find_source_device() has found error details.
> /s/when//

Fixed, thanks!

> > -	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
> > +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
> 
> Instead of relying on the callers, why not add a space before details here?

Could, but I don't like adding an extra space at the end of the line
when the caller passes "".  The extra space could make the line wrap
unnecessarily.

> >   		 info->multi_error_valid ? "Multiple " : "",
> >   		 aer_error_severity_string[info->severity],
> >   		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> > -		 PCI_FUNC(devfn));
> > +		 PCI_FUNC(devfn), details);
> >   }
> >   #ifdef CONFIG_ACPI_APEI_PCIEAER
> > @@ -926,13 +927,13 @@ static bool find_source_device(struct pci_dev *parent,
> >   	else
> >   		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
> > +	/*
> > +	 * If we didn't find any devices with errors logged in the AER
> > +	 * Capability, just print the Error Source ID from the Root Port or
> > +	 * RCEC that received an ERR_* Message.
> > +	 */
> >   	if (!e_info->error_dev_num) {
> > -		u8 bus = e_info->id >> 8;
> > -		u8 devfn = e_info->id & 0xff;
> > -
> > -		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> > -			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> > -			 PCI_FUNC(devfn));
> > +		aer_print_port_info(parent, e_info, " (no details found)");
> >   		return false;
> >   	}
> >   	return true;
> > @@ -1297,10 +1298,11 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
> >   			e_info.multi_error_valid = 1;
> >   		else
> >   			e_info.multi_error_valid = 0;
> > -		aer_print_port_info(pdev, &e_info);
> 
> Instead of printing the error information in find_source_device() (a helper function), I think it be better to print it here (the error handler). source_found = find_source_device(pdev, &e_info); aer_print_port_info(pdev, &e_info, source_found? "" : "(no details found) " );
> 
> if (source_found) aer_process_err_devices(&e_info)

Great idea, thanks!  That looks much nicer.

> > -		if (find_source_device(pdev, &e_info))
> > +		if (find_source_device(pdev, &e_info)) {
> > +			aer_print_port_info(pdev, &e_info, "");
> >   			aer_process_err_devices(&e_info);
> > +		}
> >   	}
> >   	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> > @@ -1316,10 +1318,10 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
> >   		else
> >   			e_info.multi_error_valid = 0;
> > -		aer_print_port_info(pdev, &e_info);
> > -
> > -		if (find_source_device(pdev, &e_info))
> > +		if (find_source_device(pdev, &e_info)) {
> > +			aer_print_port_info(pdev, &e_info, "");
> >   			aer_process_err_devices(&e_info);
> > +		}
> >   	}
> >   }
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
> 

