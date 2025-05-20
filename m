Return-Path: <linuxppc-dev+bounces-8750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010CABDA18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 15:54:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1wyQ6Y3Jz3bl1;
	Tue, 20 May 2025 23:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747749246;
	cv=none; b=Vvgw7KtoFGaPdRPyzgw49E/uNg72edWNr6Ig8C6Sj4ZmE3dchR+uDBRaMHg/y92zp7sP52TAskCLMJU2GMO37WLHbqiBGWe4AEv+N8UVNwo+iICssjAMiv3kRco4xxvVwtddm4+f7sIr2gDaGdvfVCxGxkoByHIShtr9Ja91yHAbm1QEyQj6y3b3thpnE86MNzE3QUVM0dIZ4QhVGaygsa2gfq5Uy4BHJoHAbuGC8V7bNw0IeMf2DlduJa5vv7ldSzhU8uXZm5MIKgV2VjgNWjkIxvQgEmxS7oXLhbjYE1AhBPR+YiUSsxz59xf4CvvxICAhNJCmiAnc+3+7IpfuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747749246; c=relaxed/relaxed;
	bh=xkiIHPwgn7iHs2SeAXyPuDRPxPLUs9KReYU9jJEe+vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bdLUde9HpiThpvC0uHiOiCoQN7TPE4xq06WCq3VaEMykkWJ6bjC9guzODfTWJBCkZ2F+KjzttxVeXCcaCaJTSZpx8lkmNDE7jd7RDeXi3EB7MWIxTL4UNcOCSebpTW7wsTuau1KmzkrMGi+n9NNTIVBxGkX94d8qLJjSh60mJap1rSbiKfeIC0+n6nltt6aaSVQK4tUC1kE6c2HkSHlDw2WfdzTE9l8IZEsJESASnaz2dIwFggcfQyh9KwP2hWMs54T5X7KaYIjwfcBnTZCifVPdbENMebsb0Tufd0d1/02gErDF7hykpN9XRB5uFzTvq7781AxUyfUBy4bzn7SzWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHbwhUZ2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHbwhUZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1wyQ2N2pz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 23:54:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8937A45118;
	Tue, 20 May 2025 13:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436BAC4CEE9;
	Tue, 20 May 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749243;
	bh=K0AQGrstH9kybdCjHXTCQHHA8EFnSUmlknqnLl59yL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tHbwhUZ211upNss9JSEf2Emr75oAjtGuGDEuuaCsv7phD+HStT1bCQ0xRxgPdPbu5
	 sD44X239VtWHZABLHSF3Feo1nBycsTuMCKue88EDGAVSQel+CrF10PEo++G37Cil34
	 ORCwoMa18+4eQM2Zk4YvnQvF+l77MvtCndcZp3wmCx3ACFc9MqMfQtDKjbB+AB4N7p
	 QUZWpdQhWb/xcYEsbOrAsftuBOwgqq1jp5fO2wI/AeGNvT+HJLt9Tl6StfQFvx1oW8
	 FXg6COHcZJCdv30Dhd0LDp3taWhwfnExZjd3NqitqkNKAr3RKb3JofoXeoj/9uC4JW
	 mDPrujL9AOnKQ==
Date: Tue, 20 May 2025 08:54:02 -0500
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
Subject: Re: [PATCH v6 01/16] PCI/DPC: Initialize aer_err_info before using it
Message-ID: <20250520135402.GA1291302@bhelgaas>
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
In-Reply-To: <218ec0eb-93a9-ba14-ea6b-742d0d274b84@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 12:39:18PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously the struct aer_err_info "info" was allocated on the stack
> > without being initialized, so it contained junk except for the fields we
> > explicitly set later.
> > 
> > Initialize "info" at declaration so it starts as all zeroes.
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index df42f15c9829..fe7719238456 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >  void dpc_process_error(struct pci_dev *pdev)
> >  {
> >  	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> > -	struct aer_err_info info;
> > +	struct aer_err_info info = { 0 };
> 
> = {}; is enough to initialize it, no need to add those zeros.

Changed, thank you!

