Return-Path: <linuxppc-dev+bounces-8758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548FABDE2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 17:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1yXF0pHWz3bcB;
	Wed, 21 May 2025 01:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747753500;
	cv=none; b=hU6RanFVQ1m4zVwytH+YtSriwW0gL2/42QlwKzjAnCY5d+85LsTsjHLlnouXr7pbifNHBl5rvIa5jn90bCZ2AftJZE1NC+lrwI4tmGPjrNHVaILpBhhNYl+oZ7KoPQa1wc7SnDczU0F0KBmfbrMQfp4LaEuQkKWoZQ43p7yVHRlgsqN3xdsLYFQY2YL6ZECKCKRXfS0WOyG+6U1ro43BbL/gTCpz+f/UKCJ0F1ausgZAUOy5g6GSLL0Vv4vCSPNF9u4YMjU/9DUa7eteYLA4nP8cV+ng2/LS0E5ujWqXd9uRQhIKscjd/6GqK06JTFnWQk2XRHvTEgSpEo2ituVcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747753500; c=relaxed/relaxed;
	bh=OkX5zky3Fy5tKdDDoJNDOeIADI5NRPV/ARIqJn+nuCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Fb0Li7c0yuu35Fj4mlTJzR+yOxo2Q3KmSN0ZMZIFSbtBmtkZsDkqTrZiob7N9mPNDFU2vRXITy4QyIJ+S80RyB8nBHmJxWSlKV1Rqd5nC3kUucNJT/2xME+WrPObaxsTsdr6NKgxPceKtxRf7hfudBxttja7nb1dbvRS4PKc/NQydokoX6KzOB77mDiJrX+Z5Jtmvs091nb50dR1OuyC2SrjeETGuA0qfZTq3jHILxQ9fR1hHqYfKD1+nJswTsDatVyM7h0MrCuJYZ78Eu2FEdePk/eVn5XCV0z/c25H1FlQVUWanRovDWmzw0QPHvRd0fAMkcZAOPmZ6est71FgbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJWU12d6; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJWU12d6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1yXD0TgHz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 01:04:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EF0C5C48D3;
	Tue, 20 May 2025 15:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3729AC4CEEA;
	Tue, 20 May 2025 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747753497;
	bh=386vJl/A+qlhOwBt1iwrNQY1ZNkTiZORVnCA7Xh0ge8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VJWU12d62az2Yuj+AiW/gJexWUaLd+pCW0i0fnwxfBu6oNPS2cbTPk9e0zEnP2e0g
	 3nGpWzqsHXcLuOcGrm9iKFo9cj9T9UnWcvukafFN4no84C7QpBSxSPtilNGGkXjt4b
	 UbYDjd7v+cCptdXnJy9doVcR6avpcHvQBe7ZrUawMvCTYGyPsXeQjTP4SHNRuQlsve
	 hhwtDsdkvAiWCPa4y1WlykZAzi7mQmNRu+v+8YjFYZPy8f62HIQAh3nHNFw9CvUv4y
	 kz7ArCrgyOZzwaufLKWg6Xw00fU7H9Tg0ndpU5JMoji2u2qjW4+Se10JoMM72SdyZR
	 WA+Indy/ny7cA==
Date: Tue, 20 May 2025 10:04:55 -0500
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
Subject: Re: [PATCH v6 12/16] PCI/AER: Make all pci_print_aer() log levels
 depend on error type
Message-ID: <20250520150455.GA1300985@bhelgaas>
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
In-Reply-To: <921fea13-9a28-9dc6-90c3-48498626f317@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 02:37:33PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
> 
> > From: Karolina Stolarek <karolina.stolarek@oracle.com>
> > 
> > Some existing logs in pci_print_aer() log with error severity by default.
> > Convert them to depend on error type (consistent with rest of AER logging).
> > 
> > Link: https://lore.kernel.org/r/20250321015806.954866-3-pandoh@google.com
> > Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  drivers/pci/pcie/aer.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 73b03a195b14..06a7dda20846 100644
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
> > +	 */
> >  	if (tlp_header_valid)
> >  		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> 
> There's another similar callsite but only this has the comment added. I 
> was thinking if this call could be made from __aer_print_error(). There 
> would be small change in order of messages but I can't seem to decide if 
> it would be bad/good.

I guess the other caller is dpc_process_rp_pio_error(), which uses
pci_err() for other logging, so at least it matches the level used by
pcie_print_tlp_log().

This patch uses info.level to control the message level, and
pcie_print_tlp_log() doesn't look at info.level.  I added this comment
to explain why that's OK and the message level happens to match
already.  Maybe not super ideal long term.

