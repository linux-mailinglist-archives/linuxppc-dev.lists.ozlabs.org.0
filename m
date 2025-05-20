Return-Path: <linuxppc-dev+bounces-8749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945AABDA11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 15:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1wxz1RdDz3bWX;
	Tue, 20 May 2025 23:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747749223;
	cv=none; b=fMScZxyVNBSUbs/MfMTLkP6/VvIn/KE3u7sYmGbXkCGCEB1tiJl3xsyPrtDN5Kq0Qjvub+vH7/JB40sXn3SZJwBhVDEOl7717fWaKhWkhoxj59fzjMNoQzdnVG4N5rQ4Qkn0DJlnV136LDxpMB/2BXtNd7bH/GDFqAXPRwRNHifqzYtf7/Vu8s5dOv/A88PmoGMoss01xX/U9blR146X+6Uzv2n7F5NY0xsHoDXZM92fVeGNallGhlsDfYfwt+l3xsp5xbQMSxSOCxjUg5iDp4vr5hl3SRW8PRuknIS+nKEtuT/QCp0N0fxgOiq8EcQnrXH+wOfem5zeXW+88HoQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747749223; c=relaxed/relaxed;
	bh=gsOuR+tBbeaLrVYlpk7Rst33RajHl4IbQF6p50MNtYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NyOOeQCn1JFM0gAV/Hsw3quektUTFFSFABvyfltzLPwy0NqWVTiUD+q3TfM+HhGjq963Lbj9dYicxhROMEyz/NHzatNlus4bLRNQWq1m6QzL2IyZuPeO/pIBo+lf8BntFDq2w8Y+bHp/mu9q8Jcdz/zjiM1XrfBSE7DM/OG6ddFawrwYzY3cF3fPynglsz7oW5dhonNjJOI3eeWxR1lKFNAvQbqkmpjGmzOOEe70B4DnA2issTIYtYazLcIKg1SCEsqg/SY4X3xS8dzTDfcYdrIsKyLKzQ0yHLu+FZXxaG+DEZe9GyTpg852j/SbpXKwN55fsAMBfUzNE1bQ099HHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKhSL5zH; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKhSL5zH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1wxy2tR0z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 23:53:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 738585C548A;
	Tue, 20 May 2025 13:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F38C4CEE9;
	Tue, 20 May 2025 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749219;
	bh=CA5p6228eQF/0HRQYWgn129Rwa1VmXENjAQVYFscsY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qKhSL5zHq6LTXe4tDiSws76qlpFpBxS55j5/qW7Kw0DLI30xLHiPQHy+WCf8jqGbn
	 GulWMyASh05tnd6owvEp/31ihxBteK6KrFklBxQB9ibsexDTyhdosP2LQIkhF6hUA6
	 0Ql6lVXoDXZiagWAM6NWz6nDZpsSIZC8Qv4I1ev6ecrmXmYlmnbftL/r4CZrULN4ks
	 Vh2NOO0WfaPRpC4IEkRIgGAf7VpAUJT3YTSNCgyn9yoiU12j3kw5Lj2AOvAtIJ8Yzy
	 ITdDeli7zeQUnKGWsedG+wCqldMbN0jI0PPF7Gyi8ZzJGWbYfhkaGKBfDZXS85wrhs
	 zzL31sbUUSjIQ==
Date: Tue, 20 May 2025 08:53:37 -0500
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
Subject: Re: [PATCH v6 01/16] PCI/DPC: Initialize aer_err_info before using it
Message-ID: <20250520135337.GA1290915@bhelgaas>
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
In-Reply-To: <1b1b80e2-4f59-462e-96a9-546b1d7a7644@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 03:41:50PM -0700, Sathyanarayanan Kuppuswamy wrote:
> Hi,
> 
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously the struct aer_err_info "info" was allocated on the stack
> 
> /s/Previously/Currently ?

I prefer "previously" here because it clearly refers to the situation
*before* this patch (allocated on stack without initialization), and
it also gives a hint that this situation is what the patch changes.

If I used "currently," I could be mentioning something relevant that
isn't being changed by the patch, e.g., "currently the struct is
allocated on the stack so it's important to keep it small."

> > without being initialized, so it contained junk except for the fields we
> > explicitly set later.
> > 
> > Initialize "info" at declaration so it starts as all zeroes.
> 
> /s/zeroes/zeros

Fixed, thank you!

> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >   drivers/pci/pcie/dpc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index df42f15c9829..fe7719238456 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >   void dpc_process_error(struct pci_dev *pdev)
> >   {
> >   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> > -	struct aer_err_info info;
> > +	struct aer_err_info info = { 0 };
> >   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> >   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
> 

