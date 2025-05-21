Return-Path: <linuxppc-dev+bounces-8847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD6ABFC80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 19:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2f2l3sBNz3bsQ;
	Thu, 22 May 2025 03:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747849519;
	cv=none; b=TXuDhvb2Co70boj0WrJ9OsT2B0tm4gHwZdf88rDSMH/ITplkV0i4vS33aMObIeVjJd935h1uaRyuUMGqKv4Sr9kdj5Twqowjl6v/TArN4Z+tQQSoWsUIt8A5p+6s/z04JL5PGIdnUpVMIpFQ0nQ/AHMfXE4984E9x5Bk0/LvQjAoIKIyaTcFzOO1nF9e9MU/JdTNlrM7AfybOjxacc8hXkry6naOSeNeMsKsTpldI49E5EyaZNAK3b/golCTfih2VRBY6VkE78z2OfatBca1YmBj0G9zU1JWmRhAOYmnFWeTZ/Mo0EIhXLm1CPMzTwdjGFZFpAhCVHBIxW2oUn4awg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747849519; c=relaxed/relaxed;
	bh=4tdZirmjFyF3yLnkU/CBaGQA8zeRfxpWtiHESR3543g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Rj5Rjxv3SrmGcZFy5jHqm8JMKh49x3h1nivyEyDSiz2ZoM9WxIhoQjso/y0a5Rz4JJt5B6tS6xSaHMofu+nzzZ9mpdLx6F5w/AFFzyeSycNuHIjHk0xpkyG4m8KwlTj75XHuOvp/L16/ZOVVjzLXRWQeJxqBqFufmHxyZjKrB4NE5lvj1Um2/c+cbAKejD9tZ0JlhLcwNS7YWrwHPWP1+cPF+ybl2l86VSkm/HprpEY3bJ9x4eN7/kHBwMqmZcdQa8Dv5/jL+P9vK5aWzL//sUmiDDghrphGOjo3KfsPW/LEvIol1NAHIGem9Z7U/YwU+2xe2XvQZn4U8g3HOySdlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RljfERsi; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RljfERsi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2f2k4CDFz3blk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 03:45:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7803C5C5485;
	Wed, 21 May 2025 17:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E58C4CEE4;
	Wed, 21 May 2025 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747849514;
	bh=V2RuI4M0Yg8yY4cQ1BGXlcPOPaGhDVK1o5Gd0zRxX6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RljfERsiU7aFbLVKDq5ROTWlQtAUt3TSPdC13pCW+KAEi1HcbnZfIzw3wwGSzwIvd
	 8P43hHIJ/fnuTagraQu1Md6zU6v4R6GHObnrJZFUN6dtwfTb04gdxf/91M/Hn0UAwv
	 /du5mpef0IdqcKAfnJGQjBjx/Qfh3gyesyx9hjbLF6Hdfnnw0BWbkms44iLj/6VOYr
	 VGeS1y4vsazQv4eVJFlNX0uQ2dbPGEWJvQwhaDS/NUbWRVk7XMMUHgnYliFWtqhh+o
	 mkqtpf7voixiQLX/jAX3LS99ryQQoJ3LmPT0vHDX5P6pliW2+H16bQbFLIIeDuRUKh
	 LA0173jC5vRdQ==
Date: Wed, 21 May 2025 12:45:12 -0500
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
Subject: Re: [PATCH v7 13/17] PCI/AER: Make all pci_print_aer() log levels
 depend on error type
Message-ID: <20250521174512.GA1426306@bhelgaas>
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
In-Reply-To: <20250521105659.000064bd@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:56:59AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:30 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Karolina Stolarek <karolina.stolarek@oracle.com>
> > 
> > Some existing logs in pci_print_aer() log with error severity by default.
> > Convert them to depend on error type (consistent with rest of AER logging).
> > 
> > Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> One comment inline. It is painful to have a non trivial comment
> that says we didn't pass a parameter for 'reason X' when maybe
> it would be simpler to just pass it and not care that it always
> takes the same value?

I agree.  I added a patch to pass the level to pcie_print_tlp_log().

> Either way this is fine.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > ---
> >  drivers/pci/pcie/aer.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index f5e9961d2c63..4cdcf0ebd86d 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -788,15 +788,21 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >  	layer = AER_GET_LAYER_ERROR(aer_severity, status);
> >  	agent = AER_GET_AGENT(aer_severity, status);
> >  
> > -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> > +	aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> > +		   status, mask);
> >  	__aer_print_error(dev, &info);
> > -	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> > -		aer_error_layer[layer], aer_agent_string[agent]);
> > +	aer_printk(info.level, dev, "aer_layer=%s, aer_agent=%s\n",
> > +		   aer_error_layer[layer], aer_agent_string[agent]);
> >  
> >  	if (aer_severity != AER_CORRECTABLE)
> > -		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> > -			aer->uncor_severity);
> > +		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
> > +			   aer->uncor_severity);
> >  
> > +	/*
> > +	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
> > +	 * tlp_header_valid is set, and info.level is always KERN_ERR in
> > +	 * that case.
> 
> I wonder if it's easier to just pass the level in than have the
> comment?
> 
> > +	 */
> >  	if (tlp_header_valid)
> >  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> >  }
> 

