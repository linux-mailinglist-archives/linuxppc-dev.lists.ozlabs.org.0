Return-Path: <linuxppc-dev+bounces-8849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB1ABFD3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 21:18:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2h5t1QF6z3blk;
	Thu, 22 May 2025 05:18:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747855090;
	cv=none; b=jU2SkxHk8duxZ2+EjgGsHXLdIi3+fdG/uZQ1QoiFryjiPQagiD5yYkxDRE3EY0jZ+GVgpz+xPnRQ9Y7hyWXEFSRaGAzrkpbO17QIIwh3KFBr3h5HsKYtFkeip5kSgwoGoZQ7v3/eRjrPZ33j4pRQ6OMIie8fwyddUIHMAq8TuZOTI6giPt2kYq6tQI0MRiNgDWo8en0JscgJK9mRP9ZaBfiQG2RhuwuIOGJ5tjUTPYWdJ3sVAYwmK7EmWNy8+BRmuHJ12piq8wG+pSrJOTdpxF2Gf1l5cn98bCvWUQRUx+foqNpzhRizBPxaJOB0/k5vv8No6GPOcnWOiNsNibEQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747855090; c=relaxed/relaxed;
	bh=CTpKOaRk4E0cu5f2tJMeD1v0w+ebK/0F+pF1FGEwwNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d2GY85nYhdk0zDQCjqvisv7nOYezx/b1NDqcu0irjfHtLNatvPBvzMNLJIwwriXV8PmZYAo3izW6ovpdSBQZS8g0X5OCAq8iIC4ojl9AI3Vv0ZH8P/1PsmjV1FhQrze2eJ0OM04do4CWM/CGX6y8IMrPJBgjMxo8Cjtq9CtmtHdEOPpKwqkqV7Z76H1J2vjVzR/WafN2JsAuKM9y84eLdfkS/TmP+Jg/EmGCJCALdlC6mN5mfqSNz0/8pR3kJHi3uWYg0KZ5emoboyIPMBn4pwndxD9Qk1bZQDNvBEFPVCxfZJidE1Wt9neDeWMlzqsMslfdSThiuR6BPx66dVtXTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhvpVny9; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhvpVny9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2h5s1Hwdz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 05:18:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5948629F1;
	Wed, 21 May 2025 19:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A172C4CEE4;
	Wed, 21 May 2025 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747855085;
	bh=11eaAuGJiJiZBtdGomgSvZbqRIL2Y2/cQykWBiFSowo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qhvpVny9dMzrOx+Mn5azE81/XRNYeXos00YtD6PNA/RC9skrUY3H32mHDPJPIC4mJ
	 CCCJAhZ7eiBx6xsNuaRWGFWkUu8NzEJEqKqAd481MdKfHpxStiaudPUkeGlS1jqtOj
	 yhfyrZ0uPL3huDKW7QzjzVJT/8uV2F9KnyXOn1sJIu7HfjTQUAzeSm9LuOb5q5Yua0
	 jz2nRXACHn4pQxHsCY3Amxm4sUkv+y5QOgbDWhQr+fDZuQAh/BongCCX63wtemuviI
	 nNvazIe8vbPQWZeVB4AuTzbiHzcU9RNdS4F4I5ExLfhFxLoSm59Ttmn2EZ/MSrG9VP
	 jDfpVevewM4ag==
Date: Wed, 21 May 2025 14:18:03 -0500
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
Subject: Re: [PATCH v7 01/17] PCI/DPC: Initialize aer_err_info before using it
Message-ID: <20250521191803.GA1426656@bhelgaas>
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
In-Reply-To: <20250521095218.0000045d@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 09:52:18AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:18 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously the struct aer_err_info "info" was allocated on the stack
> > without being initialized, so it contained junk except for the fields we
> > explicitly set later.
> > 
> > Initialize "info" at declaration so it starts as all zeros.
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> I chased this through a bit and looks like at least some unset fields would
> result in garbage prints.  So maybe needs a fixes tag?
> info->tlp_header_valid is an easy one to follow as only set in some paths.

I don't see a current issue related to info->tlp_header_valid because
it's always cleared in the path from DPC:

  dpc_process_error
    dpc_get_aer_uncorrect_severity
      info->severity = AER_FATAL or AER_NONFATAL
    aer_get_device_error_info
      info->status = 0;
      info->tlp_header_valid = 0;    # unconditional
      pci_read_config_dword(PCI_ERR_UNCOR_STATUS, &info->status);
      pci_read_config_dword(PCI_ERR_UNCOR_MASK, &info->mask);
      info->first_error = PCI_ERR_CAP_FEP(...);
    aer_print_error

However, only info->{severity,status,tlp_header_valid,mask,
first_error} are initialized before dpc_process_error() calls
aer_print_error(), and aer_print_error() uses info->{id,
error_dev_num}, which haven't been initialized.

AFAICT, this has been the case since
https://git.kernel.org/linus/8aefa9b0d910 ("PCI/DPC: Print AER status
in DPC event handling")

Here's aer_get_device_error_info() at that time:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/aer.c?id=8aefa9b0d910#n867

and aer_print_error():
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/aer.c?id=8aefa9b0d910#n530

At the time of 8aefa9b0d910, info->severity was also used without
initialization; this was fixed by 9f08a5d896ce ("PCI/DPC: Fix print
AER status in DPC event handling").

But I think the info->{id,error_dev_num} has been there since.

Anyway, I added:

  Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")

> Otherwise absolutely makes sense.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index df42f15c9829..3daaf61c79c9 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >  void dpc_process_error(struct pci_dev *pdev)
> >  {
> >  	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> > -	struct aer_err_info info;
> > +	struct aer_err_info info = {};
> >  
> >  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> >  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> 

