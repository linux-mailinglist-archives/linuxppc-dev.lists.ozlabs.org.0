Return-Path: <linuxppc-dev+bounces-8756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDFABDD58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:38:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1xxz2LKKz3bdD;
	Wed, 21 May 2025 00:38:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747751927;
	cv=none; b=DmYzYcvaQrMKKd5mF/wBz9VQOymWcTwP8F/v4cNbKGCQJIdq2NTcud76dAvNsBC+rCfQ59NTW1IytXraEs7Nxa4nTQM/lgbhEs5x2e9uPvSPFw9AA3X78fJ5DcOhDrheZEyn3Gv0leG2hdVwFh8vfwkXl+Tkl38T+daBy1YtgoaYzhJbRUteFxiLXNRX3TpsOkUwLn7goDoENre01Q048LZ2dPQ7OeTYQavVKC1FqpPEAc+5Sgg+iUIHsp7WN45DbbJTYcZcBmFSUlf6nUaIWHjlojFvJO9JE8Iy/nKIaxlqlpaKCfRyuMChiInnQM7BV3OJDYOmLHqyGpj59wnjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747751927; c=relaxed/relaxed;
	bh=2DnHYIHjWJIBN+ff3jOGX0PlfVa1lvf77WWEQuu+KC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DpD+x/La1gv+UdajV+60Z9/XDV3jUQAifCo/fPDeVVmUoIYsKzMvZNYa7jMHx77hasnmoHHF97FJHEG9GEN4anf4KSx6ctvOuuV4fl55vIfxjSwQY8erfyjWFAnFf7IoTpcn38JnA23pd7YT8u8TxJgO+kLjfdg3MTfdFvO07saXiwl+VqsLbY5fCZzZreqnRFb3nzlXX73G4g8p59IwrJIys2UOOniNDpl4TKC1mhZqnPFIh7OJHcfaweRDBp56xsUcgTZjNZox+cPhWD478AowSvDTAkXC7npQueBkk+VxVYlsI+Nw6IvLqYfzQXyb0/6QVW/akg8h+2lnlP8Ukg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rzjmbZLl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rzjmbZLl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1xxy0l11z2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:38:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18495A4EB57;
	Tue, 20 May 2025 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D316C4CEE9;
	Tue, 20 May 2025 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751922;
	bh=9hZ98IY5t69NRybclTeywqNeLTwH6jYGal0hHUhxo9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rzjmbZLlJFEQL80Af1kv/lGr7QRedncFHbnWG5o8x9U+egfPJa4cYvf+b6pFrJfGo
	 Uyewa5KEnynZb7r9rMySE6KBaWk+Xt1WZmBLDmp2EbpaU0cDcMl+DX0/XaIksGdxM7
	 o3pY68jW2YCdcuPF6D6RuzmOFmMQ5PZOVWIT/Y9XnNE5ZkvlVK5y/2tMQU0KYe8oHl
	 vRS60U97cfYMVhfEcbWL8d2JLORClhS0aMpix5IWzW7GSHlxuKuUCodaz7AuhYop+v
	 NDLQiod+cZjClVvn43PouWT5pRdxl4vk4ejJNo8C3Oc6dpMz9ClMAPHT/Pc6d5X9J2
	 +foqXJC/ONzQw==
Date: Tue, 20 May 2025 09:38:41 -0500
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
Subject: Re: [PATCH v6 08/16] PCI/AER: Simplify pci_print_aer()
Message-ID: <20250520143841.GA1298026@bhelgaas>
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
In-Reply-To: <89d93eb8-ad95-4ac4-b0dc-44b37c458d91@linux.intel.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 05:02:28PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Simplify pci_print_aer() by initializing the struct aer_err_info "info"
> > with a designated initializer list (it was previously initialized with
> > memset()) and using pci_name().
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >   drivers/pci/pcie/aer.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 40f003eca1c5..73d618354f6a 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -765,7 +765,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >   {
> >   	int layer, agent, tlp_header_valid = 0;
> >   	u32 status, mask;
> > -	struct aer_err_info info;
> 
> You have cleaned up other stack allocations of struct aer_err_info to zero
> initialization in your previous patches. Why not follow the same format
> here? I don't think this function resets all fields of aer_err_info, right?

This is new to me, but IIUC this does initialize all the fields.
https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html says "Omitted
fields are implicitly initialized the same as for objects that have
static storage duration."

> > +	struct aer_err_info info = {
> > +		.severity = aer_severity,
> > +		.first_error = PCI_ERR_CAP_FEP(aer->cap_control),
> > +	};
> >   	if (aer_severity == AER_CORRECTABLE) {
> >   		status = aer->cor_status;
> > @@ -776,14 +779,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >   		tlp_header_valid = status & AER_LOG_TLP_MASKS;
> >   	}
> > -	layer = AER_GET_LAYER_ERROR(aer_severity, status);
> > -	agent = AER_GET_AGENT(aer_severity, status);
> > -
> > -	memset(&info, 0, sizeof(info));
> > -	info.severity = aer_severity;
> >   	info.status = status;
> >   	info.mask = mask;
> > -	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
> > +
> > +	layer = AER_GET_LAYER_ERROR(aer_severity, status);
> > +	agent = AER_GET_AGENT(aer_severity, status);
> >   	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> >   	__aer_print_error(dev, &info);
> > @@ -797,7 +797,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >   	if (tlp_header_valid)
> >   		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> > -	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
> > +	trace_aer_event(pci_name(dev), (status & ~mask),
> >   			aer_severity, tlp_header_valid, &aer->header_log);
> >   }
> >   EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
> 

