Return-Path: <linuxppc-dev+bounces-884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF2968DE3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 20:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyHtb29Kyz2yHL;
	Tue,  3 Sep 2024 04:52:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725303143;
	cv=none; b=UxF/3C+guz+UX3njGD1hqoUhDZFa00IW+WKncIVDAsCmS0bX8Oz7jV2s8I4S+Tr8ivX2+aXUyQ+JqMhmv+IR8sgiIuDPFzS3xtTcTwchSCEQGplOSdTTVkuVTwnaqX/A2TkvRv7SqT2seu2YHwr+jzL5s+hCe0Hb+Oqu4QW+QfeW5a7i8ATTzxXOS5sLycJH18klKPrmW0BHzzBWYdrHBvMBzNuc/K0mGZ4kJovxmlJwB3Jdhi07kpM6eCbvFz1C2tlF0pXRfv0c0tWdqv7GDaKvkSE33KJ836p+SwOGOrdsSyIhljIXGz/gKP89whkMdyJ3QVOSyT1EzvAfeNR/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725303143; c=relaxed/relaxed;
	bh=2eWXMYwrhzdrR+haEWvCNrRFdYdTPm+X8fLPnJHOG64=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo+Fe8Q/MjsLAn2CeI1UStZlcM2uwmT7p7q9gpwjTXveyLoqw8BJpCc0/HEtyzDeD1JcAjZLqLU06J4SCJxaZoUgl2tbp6xvrDS6GUTWXUCfImZdWwHKQzHi9grKn6ruy/v9i/X31r9YWQGJ8X0U7AqlzFEDdHvUMQzhOiSlmjWdBQJCwbCxmolUczBtceQwB9ljnyqmsslQCMG5KlPkBnnIoBq4J8+82eVu6YEl0PNLxtkbwBmIlq+Bnm3Io8y9NsSSL5MSaVLK6/X1uOwNtPgtdR6ZciWZWLDVQYoDHYNRspqKKyWb++8qbq9XHzdXLAuo8BZpfaixc4HBon4F4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRGqqhaJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRGqqhaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyHtZ4qbhz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 04:52:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28B9D5C5930;
	Mon,  2 Sep 2024 18:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2504C4CEC2;
	Mon,  2 Sep 2024 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725303138;
	bh=ZTBb1Jqv4twqEPqg4WYll7AU68w80SabtLii7Xfp5q8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CRGqqhaJWczUqsStEvPv+f7+ot0eBEsbKPjGsicNjQC/PnmqrdNclo0PCUtDQGBSH
	 YPbXBjfJsp7VOk87+VPFUQSK3VnyhXM552C8mqLDxNBofsqJ/uNh6xKkMvKdJPNjp6
	 HoPEn8X79NLULTI824zSgtd6ZuhO5E1cH+PZB+itAr3iCWu0ECnMoxHru1SDGicgB1
	 XX8fYmsvRdwnPEuNNcoxCFrHtDjQ92QCI8cxb8m5ql5NeLk7xHPZq9O9fyioOM3fem
	 6/ran3AAbq6Wm6g/qnNVB9I0WqaF+EgdjPWFL2y1hZl6KbZ2pvlnKk1N/244hAiUbn
	 EONolYYT7V7Gg==
Date: Mon, 2 Sep 2024 13:52:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 7/7] PCI: Create helper to print TLP Header and Prefix
 Log
Message-ID: <20240902185215.GA223280@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0484353-8ba5-02c2-e78c-d51aba55bbb7@linux.intel.com>

On Mon, Sep 02, 2024 at 08:20:41PM +0300, Ilpo Järvinen wrote:
> On Fri, 30 Aug 2024, Bjorn Helgaas wrote:
> 
> > On Tue, May 14, 2024 at 02:31:09PM +0300, Ilpo Järvinen wrote:
> > > Add pcie_print_tlp_log() helper to print TLP Header and Prefix Log.
> > > Print End-End Prefixes only if they are non-zero.
> > > 
> > > Consolidate the few places which currently print TLP using custom
> > > formatting.
> > > 
> > > The first attempt used pr_cont() instead of building a string first but
> > > it turns out pr_cont() is not compatible with pci_err() and prints on a
> > > separate line. When I asked about this, Andy Shevchenko suggested
> > > pr_cont() should not be used in the first place (to eventually get rid
> > > of it) so pr_cont() is now replaced with building the string first.
> > > 
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >  drivers/pci/pci.h      |  2 ++
> > >  drivers/pci/pcie/aer.c | 10 ++--------
> > >  drivers/pci/pcie/dpc.c |  5 +----
> > >  drivers/pci/pcie/tlp.c | 31 +++++++++++++++++++++++++++++++
> > >  4 files changed, 36 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > > index 7afdd71f9026..45083e62892c 100644
> > > --- a/drivers/pci/pci.h
> > > +++ b/drivers/pci/pci.h
> > > @@ -423,6 +423,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> > >  int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> > >  		      unsigned int tlp_len, struct pcie_tlp_log *log);
> > >  unsigned int aer_tlp_log_len(struct pci_dev *dev);
> > > +void pcie_print_tlp_log(const struct pci_dev *dev,
> > > +			const struct pcie_tlp_log *log, const char *pfx);
> > >  #endif	/* CONFIG_PCIEAER */
> > >  
> > >  #ifdef CONFIG_PCIEPORTBUS
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index ecc1dea5a208..efb9e728fe94 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -664,12 +664,6 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
> > >  	}
> > >  }
> > >  
> > > -static void __print_tlp_header(struct pci_dev *dev, struct pcie_tlp_log *t)
> > > -{
> > > -	pci_err(dev, "  TLP Header: %08x %08x %08x %08x\n",
> > > -		t->dw[0], t->dw[1], t->dw[2], t->dw[3]);
> > > -}
> > > -
> > >  static void __aer_print_error(struct pci_dev *dev,
> > >  			      struct aer_err_info *info)
> > >  {
> > > @@ -724,7 +718,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> > >  	__aer_print_error(dev, info);
> > >  
> > >  	if (info->tlp_header_valid)
> > > -		__print_tlp_header(dev, &info->tlp);
> > > +		pcie_print_tlp_log(dev, &info->tlp, "  ");
> > 
> > I see you went to some trouble to preserve the previous output, down
> > to the number of spaces prefixing it.
> > 
> > But more than the leading spaces, I think what people will notice is
> > that previously AER and DPC dmesgs contain the "AER: " or "DPC: "
> > prefixes implicitly added by the dev_fmt definitions [1], where now
> > IIUC they won't.
> > 
> > I think adding dev_fmt("") here should take care of that, e.g.,
> > 
> >   pcie_print_tlp_log(dev, &info->tlp, dev_fmt(""));
> > 
> > [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1990272
> 
> Okay, I'll fix it and resend but looking into that output, it doesn't 
> look very consistent when it comes to prefixes as the lines in between do 
> not start with "AER: " either. Perhaps those lines should be changed as 
> well?

True.  Possibility for future patches.

