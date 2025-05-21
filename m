Return-Path: <linuxppc-dev+bounces-8843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B6ABFC0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 19:12:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2dJh4yQHz2y8l;
	Thu, 22 May 2025 03:12:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747847540;
	cv=none; b=NoHc8Fln5Ue6BFUt7GmAqJbtQ0CGR8s/s2ZQZi3eoCMiljlafgfFkooro2uq8AFK2FoXqy0odNxHEHxVwdMV5AFyGGbS63tWIxxTON7rLswxnbd2F3CtW620Tk6GLuSmxzwPmHJ53NlTJOUKXIgPrDSkiFcMdVrNdB4rv5HVBY0Sl98phXzA2VK0IJ4pWZS93ad1rz6HGqcQOErKXZGD9EHJT1VA2q8NzCOWjF5imSDhyCctAXvX8mchbIWXSRiH1LU7/0IAybnFFRLXMdAZ+LX8RPZyC4k19d4p98PL5abg3I/1TeVs4HNySCR8eZGd3N+Hq4+xCJ6w1ppMWw0L2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747847540; c=relaxed/relaxed;
	bh=H4LxzY1g4slg2w/Kp6TRp8TED8XemNRCSxMHNaDBSH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cjOU12rFI/7QSsKow9MFHYDIq1IB84DWNyLi0WOtshfI9RDduCNd2Ahn5nsBGxm8IT3XpVS1x/Xtjg57DraeiSucyPdrJSxN+crU43bxtR73/gq5GNjod/VKQdEoi9gLTkOkJ1G3oTOuTc4//30QEXUu8DahS/kEJXrvwBRthaqkyJE7GarCepgKXVRmfAKRsWheA8n2R3KpsFNh0upVbQxWEYLNyVWuJ4W+X84MTYdWcVRdhXs7R53gj0U1ic1AizcO5tGBKbkvmZcPKtOokXjg483iyZmGXsUCoiLzGzlNw0EomQLhAH2VtcBncUEa3y8uZLpbhZsyLDa3fI23ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jmtHGiAl; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jmtHGiAl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2dJg4hPPz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 03:12:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D3F45C5C57;
	Wed, 21 May 2025 17:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD4CC4CEE4;
	Wed, 21 May 2025 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747847537;
	bh=1dN4hypelxyk1rZ8sC/y4l5vwCFStdVU/YluIIrrUYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jmtHGiAlnJ73/jaSZK1r37Jx1N0d7k8PF5KCtu1Hy4V820AyYSTWjAg0yoFA0tFCA
	 6lLq4B9BFBkUKktlmQ2INKiieLHhVCRp4rMdvSTf4p80Q8oLEeqFxjV1jT7YywOtkt
	 ZoGok5vhnZV6AbGYI2iSvQ+2k0kP8YaySIJYl4GJBA/OLmYrg/XLQpaYJgGOzLJ7K4
	 WbUJhqS0e9qb/uxKJGW4KI+qZCSoikzrQ5ikfl0LhBFTZ7M1+ER61IqMUtcNNQ8WaY
	 Q1FvvrHA8y2Gw8Rx6ZNXI65pOWQZohuoG3l68HI4xP3IhLiTHxTtKp7hqzFc8MXeJc
	 x+IRMvchmNwaw==
Date: Wed, 21 May 2025 12:12:15 -0500
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
Subject: Re: [PATCH v7 11/17] PCI/AER: Combine trace_aer_event() with
 statistics updates
Message-ID: <20250521171215.GA1421937@bhelgaas>
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
In-Reply-To: <20250521104642.00003648@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:46:42AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:28 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > As with the AER statistics, we always want to emit trace events, even if
> > the actual dmesg logging is rate limited.
> > 
> > Call trace_aer_event() directly from pci_dev_aer_stats_incr(), where we
> > update the statistics.
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Hmm. This runs a bit counter to what I liked in previous patch.
> Whilst convenient to issue trace points in the stats update function
> it's not obvious behavior given naming.  Maybe just duplicate the call
> and call it immediately after the pci_dev_aer_stats_incr() calls?

Good point, thanks.  I made this change, which also means we don't
need to copy the header log into "info" because we can just use
aer->header_log as before:

> > @@ -782,6 +782,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >  
> >  	info.status = status;
> >  	info.mask = mask;
> > +	info.tlp_header_valid = tlp_header_valid;
> > +	if (tlp_header_valid)
> > +		info.tlp = aer->header_log;
> >  
> >  	pci_dev_aer_stats_incr(dev, &info);
> >  
> > @@ -799,9 +802,6 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >  
> >  	if (tlp_header_valid)
> >  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> > -
> > -	trace_aer_event(pci_name(dev), (status & ~mask),
> > -			aer_severity, tlp_header_valid, &aer->header_log);
> >  }
> >  EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> >  
> 

